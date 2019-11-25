#include <WiFi.h>
#include <WiFiUdp.h>
#include <ESPmDNS.h>
#include <WiFiClient.h>
#include<M5Stack.h>
#include"cmdBuf.h"


const char *ssid = "NETLED";
const char *password = "yamashiro";
const IPAddress ip(192, 168, 4, 1);
const IPAddress subnet(255, 255, 255, 0);
WiFiUDP udp;
static uint8_t _cmdbuf[100];
CmdBuf cmd(_cmdbuf, 100);

int deltaTime() {
  static unsigned long oldTime = 0;
  unsigned long now = millis();
  int diff = now - oldTime;
  oldTime = now;
  return diff;

}

int resendCount = 0;
void newState(int state) {
  log_i("new State: %d",state);
  cmd.clearCmd();
  switch (state) {
    case 0:
      for(int i=0;i<8;i++){
        if(i%3==0)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==1)cmd.putCmd(i, CMD_NEXT, 0);
        if(i%3==2)cmd.putCmd(i, CMD_NEXT, 0);
        
      }
      break;
    case 1:
      for(int i=0;i<8;i++){
        if(i%3==0)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==1)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==2)cmd.putCmd(i, CMD_NEXT, 0);
        
      }
      break;
    case 2:
      for(int i=0;i<8;i++){
        if(i%3==0)cmd.putCmd(i, CMD_NEXT, 0);
        if(i%3==1)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==2)cmd.putCmd(i, CMD_NEXT, 1);
        
      }
      break;
    case 3:
      for(int i=0;i<8;i++){
        if(i%3==0)cmd.putCmd(i, CMD_NEXT, 0);
        if(i%3==1)cmd.putCmd(i, CMD_NEXT, 0);
        if(i%3==2)cmd.putCmd(i, CMD_NEXT, 1);
        
      }
      break;
    case 4:
      for(int i=0;i<8;i++){
        if(i%3==0)cmd.putCmd(i, CMD_NEXT, 0);
        if(i%3==1)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==2)cmd.putCmd(i, CMD_NEXT, 1);
        
      }
      break;
    case 5:
      for(int i=0;i<8;i++){
        if(i%3==0)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==1)cmd.putCmd(i, CMD_NEXT, 1);
        if(i%3==2)cmd.putCmd(i, CMD_NEXT, 0);
        
      }

    default:
      break;
  }

  resendCount = 0;
}
void inState(int state) {
  if (resendCount < 3) {
    udp.beginPacket("192.168.4.255", 12322);
    udp.write(cmd.sendBuf, cmd.sendPos);
    udp.endPacket();
    resendCount++;
  }
}
void setup() {
  // put your setup code here, to run once:
  M5.Lcd.setTextWrap(true);
  M5.begin();
  WiFi.softAP(ssid, password);
  delay(100);
  WiFi.softAPConfig(ip, ip, subnet);
  M5.Lcd.printf("AP:%s,%s\n", ssid, password);
  udp.begin(12321);
  newState(0);
}

int wdtPacketCount=0;
void loop() {
  static int state = 0;
  static int stateCount[] = {20000, 20000, 20000, 20000,20000,20000, -1};
  static int count = 0;
  M5.update();
  int delta = deltaTime();
  count += delta;
  wdtPacketCount+=delta;
  if(wdtPacketCount>511){
    wdtPacketCount=0;
    
    udp.beginPacket("192.168.4.255", 12322);
    udp.write(0);
    udp.endPacket();
    
  }
  if (count > stateCount[state]) {
    count = 0;
    state++;
    if(stateCount[state]<0)state=0;
    M5.Lcd.clear();
    M5.Lcd.setCursor(0,0);
    M5.Lcd.printf("State:%d",state);
    newState(state);
  }
  inState(state);
  delay(100);
}
