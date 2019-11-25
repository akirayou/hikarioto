#include<Arduino.h>
enum CmdType{
  CMD_PRE=0,
  CMD_NOW=1,
  CMD_NEXT=2
};
class CmdBuf{
  private:
  uint8_t *recvBuf;
  int recvLen;
  int recvPos;
  uint8_t sendBufLen;  
  public:
  uint8_t *sendBuf;
  uint8_t sendPos;
  CmdBuf(uint8_t *_sendBuf,char _sendBufLen){
    sendBufLen=_sendBufLen/2;
    sendBuf=_sendBuf;   
    sendPos=0;
  }

  void clearCmd(void){
    sendPos=0;
  }
  bool putCmd(uint8_t ch,CmdType type,uint8_t cmd){
    if(sendBufLen<sendPos+2)return false;
    sendBuf[sendPos]=ch*3+type;
    sendBuf[sendPos+1]=cmd;
    sendPos+=2;
    return true;
  }
  
  void setRecvBuf(uint8_t* _recvBuf,int _recvLen){
    recvBuf=_recvBuf;
    recvLen=_recvLen;
    recvPos=0;
  }
  bool fetchCmd(uint8_t *ch,CmdType *type,uint8_t *cmd){
    if(recvLen<recvPos+2)return false;
    *ch=recvBuf[recvPos]/3;
    *type=(CmdType)(recvBuf[recvPos]%3);
    *cmd=recvBuf[recvPos+1];
    recvPos+=2;
    return true;
  }
};
