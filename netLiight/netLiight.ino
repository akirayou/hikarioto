#include <Arduino.h>
#include "esp32_digital_led_lib.h"
#include "esp32-hal-log.h"
#include <WiFi.h>
#include <WiFiUDP.h>
#include "cmdBuf.h"

const char *ssid = "NETLED";
const char *password = "yamashiro";
CmdBuf cmd(0, 0);
static const int nofCh=8;
static const char ledPins[nofCh]={32,33,25,26 ,27,14,13,16  };
static const char nofLed[nofCh]={281,281,281,281, 281,281,281,281};
static strand_t hLed[nofCh];
void initLed(void){
  for(int i=0;i<nofCh;i++){
    log_i("ch:%d, gpio:%d,nofLed:%d",i,ledPins[i],nofLed[i]);
    hLed[i].rmtChannel = i; 
    hLed[i].gpioNum = ledPins[i] ;
    hLed[i].ledType = LED_WS2812B_V3; 
    hLed[i].brightLimit = 255; 
    hLed[i].numPixels = nofLed[i];
    hLed[i].pixels = nullptr;
    hLed[i]._stateVars = nullptr;
    pinMode (ledPins[i], OUTPUT);
  }
  digitalLeds_initStrands(hLed,nofCh);
  for(int i=0;i<nofCh;i++){ 
    digitalLeds_resetPixels(&(hLed[i]) );
  }
}



void setup() {
  // put your setup code here, to run once:
  initLed();
  
}

void fillBlack(int ch,unsigned long diffMs, strand_t *led){
  for(int i=0;i< led->numPixels ;i++){
    led->pixels[i].num=0;
  }
}
void fillSome(strand_t *led,pixelColor_t col){
  for(int i=0;i< led->numPixels ;i++){
    led->pixels[i]=col;
  }
  digitalLeds_updatePixels(led);
}



void fillLoop(int ch,unsigned long diffMs,strand_t *led){
  int nofLed=led->numPixels;
  const int nofShape=7;
  const static uint8_t shape[nofShape]={51,76,153 ,204,153,76,51 };
  const int span=4255;//speed of lightning (msec)
  const int spanL=3500;
  const int offsetMax=1000;
  
  const int nofFire=2;
  static uint8_t color[nofCh][nofFire];
  static unsigned long oldMs=0;
  
  static long mss[nofCh][nofFire+1]={{0},};
  {
    for (int i=0;i<nofFire+1;i++)mss[ch][i]+=diffMs;
  }
 
  /////////////Write Base color
  {
    if(mss[ch][nofFire]>spanL){
      mss[ch][nofFire]-=spanL-random(0,100);
    }
    float p=(float)(mss[ch][nofFire])/spanL;
    const float Lp1=0.3;
    const float Lp2=1.0;
    
    if(p<Lp1){
      p/=Lp1;
    }else if(p<Lp2){
     p=(Lp2-p)/(Lp2-Lp1);
    }else{
     p=0;
    }
    uint8_t v= p*50+2;
    fillSome(led,pixelFromHSB(20,200,v));
  }
  ////write each color
  for(int f=0;f<nofFire;f++){
    float phase=(float)( mss[ch][f] )/span;
    if(phase<0)continue;
    if(phase>1){
      mss[ch][f]=-1*random(0,offsetMax);
      color[ch][f]=random(0,252);
      continue;
    }
    if(color[ch][f]&1)phase=1-phase; //reverse 
    int pos= (nofLed+2*nofShape)*phase-nofShape;
    for(int i=0;i<nofShape;i++){
      int p=pos+i;
      if(p<0 || nofLed<=p)continue;
      led->pixels[p]=pixelFromHSB(color[ch][f],255,shape[i]);
    }
  }
  
}

void fade(uint8_t rate,strand_t *led){
  for(int i=0;i< led->numPixels ;i++){
    led->pixels[i].r = (uint16_t)(led->pixels[i].r)*rate/255;
    led->pixels[i].g = (uint16_t)(led->pixels[i].g)*rate/255;
    led->pixels[i].b = (uint16_t)(led->pixels[i].b)*rate/255;    
  }
}
void addDark(strand_t *led){
  for(int i=0;i< led->numPixels ;i++){
    if(led->pixels[i].r+led->pixels[i].g+led->pixels[i].b<3){
      led->pixels[i].r +=1;
      led->pixels[i].g +=1;
      led->pixels[i].b +=1;
    }    
  }

}

unsigned long fadeMs[nofCh]={0};

static uint8_t fadeTbl[256]={
  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,7,7,7,7,7,7,8,8,8,8,8,8,9,9,9,9,10,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,14,14,14,15,15,15,16,16,16,17,17,17,18,18,19,19,20,20,20,21,21,22,22,23,23,24,24,25,26,26,27,27,28,29,29,30,30,31,32,33,33,34,35,36,36,37,38,39,40,41,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,58,59,60,62,63,64,66,67,69,70,72,73,75,77,78,80,82,84,86,87,89,91,93,95,98,100,102,104,106,109,111,114,116,119,121,124,127,130,132,135,138,141,144,148,151,154,158,161,165,168,172,176,180,184,188,192,196,200,205,209,214,219,223,228,233,238,244,249,255 
};
int fillModePrev[nofCh]={0};//Previous mode for fade in
int fillMode[nofCh]={0};    // Set this for Immediately switch
int fillModeNext[nofCh]={1,1,1,1, 1,1,1,1};//Set this for Fade out 

void fadeOutIn(int ch,unsigned long diffMs,strand_t *led){
  const long fadeTime=6000;
  uint8_t rate=255;
  if(fillModeNext[ch]!=fillMode[ch]){ //Do fade Out
    fadeMs[ch]+=diffMs;
    if(fadeMs[ch]>fadeTime){
      fillModePrev[ch]=fillMode[ch];
      fillMode[ch]=fillModeNext[ch];
      
      fadeMs[ch]=0;
      rate=0;
    }else{
      uint8_t a=255.0f*(fadeTime-fadeMs[ch])/fadeTime;
      rate=fadeTbl[a];
    }
  }else if(fillModePrev[ch]!=fillMode[ch]){ //Do fade in
    fadeMs[ch]+=diffMs;
    if(fadeMs[ch]>fadeTime){
      fillModePrev[ch]=fillMode[ch];
      fadeMs[ch]=0;
      rate=255;
    }else{
      uint16_t a=255.0f*fadeMs[ch]/fadeTime;
      rate=fadeTbl[a];
    }  
  }
  if(rate!=255){
    fade(rate,led);
  }
}



typedef void (* T_fillFunc)(int ,unsigned long ,strand_t *);
const int nofFuncs=2;
T_fillFunc funcs[nofFuncs]={fillBlack,fillLoop};


static unsigned long wdt=0;
void wifiLoop(unsigned long diffMs){
  static bool needUdpSetup=true;
  static WiFiUDP udp;
  static int wifiCount=100000;
  wl_status_t st;
  st=WiFi.status();
  if(st==WL_CONNECTED){
    //Do upd polling
    if(needUdpSetup){
      needUdpSetup=false;
      udp.stop();
      int ret=udp.begin(12322);
      log_i("1st connected initialize UDP:%s",ret==1?"success":"error");
      //udp.beginMulticast(IPAddress(224, 0, 0, 1), 12322);
    }
    udp.parsePacket();
    if(udp.available()>0){
      wdt=0;
      char buffer[100];
      int nofRead=udp.read(buffer,99);
      if(nofRead>1){//1or 0 byte packet means just wdt reset
        cmd.setRecvBuf((uint8_t*)buffer,nofRead);
        uint8_t ch;
        CmdType type;
        uint8_t c;
        while(cmd.fetchCmd(&ch,&type,&c)){
          switch(type){
            case CMD_PRE:
              fillModePrev[ch]=c;
              break;
            case CMD_NOW:
              log_i("setNow ch:%d  cmd:%d   %d,%d,%d",ch,c,fillModePrev[ch],fillMode[ch],fillModeNext[ch]);
              fillMode[ch]=c;
              break;
            case CMD_NEXT:
              log_i("setNext ch:%d  cmd:%d   %d,%d,%d",ch,c,fillModePrev[ch],fillMode[ch],fillModeNext[ch]);
              fillModeNext[ch]=c;
              break;
            default:
              log_i("Invalid  type:%d",type);

          }
        }

         
      }
    }
  }else if(st!=WL_IDLE_STATUS){
    wifiCount+=diffMs;
    if(wifiCount>1000){
      wifiCount=0;
      log_i("Wifi:start to connect");
      WiFi.begin(ssid, password);
      needUdpSetup=true;
    }
  }
  
}

void loop() {


  
  static unsigned long oldMillis=millis();
  unsigned long now=millis();
  unsigned long diffMs=now-oldMillis;
  oldMillis=now;
  //wdt+=diffMs;
  wifiLoop(diffMs);

  if(wdt>5000){
    log_i("WDT arrive do random change");
    wdt=0;
    for(int c=0;c<nofCh;c++){
      if(fillMode[c]!=fillModeNext[c] || fillMode[c]!=fillModePrev[c] )continue;
      
      if(
        (fillModeNext[c]==0 && random(0,3)==1) ||
        (fillModeNext[c]==1 && random(0,5)==1) 
      ){//Do modeChange
        fillModeNext[c]=(fillModeNext[c]+1)%2;
      }
    }
  }
  // put your main code here, to run repeatedly:
  for(byte ch=0;ch<nofCh;ch++){
    if(fillMode[ch]<nofFuncs)funcs[fillMode[ch]](ch,diffMs,hLed+ch);
    fadeOutIn(ch,diffMs,hLed+ch);
    addDark(hLed+ch);
    digitalLeds_updatePixels(hLed+ch);
  }
  
}
