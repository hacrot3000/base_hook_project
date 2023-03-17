type

  C2S_MESSAGE_ID* {.size: sizeof(uint32).} = enum
    KEEP_ALIVE_ACK_C2S = 0x1
    LOGIN_LoginResult_S2C = 0x1180000
    ACCOUNT_CreateCharCmd_S2C = 0x1180100
    ACCOUNT_CreateCharFailed_S2C = 0x1180101
    ACCOUNT_CharInfoNtf_S2C = 0x1180102
    ACCOUNT_CharUpgradeRet_S2C = 0x1180103
    ACCOUNT_CharBaseAttributeRet_S2C = 0x1180104
   
  UserStatus* = enum
    UserStatus_DisConnect = 0x0
    UserStatus_Connected = 0x1
    UserStatus_Logining = 0x2
    UserStatus_Logined = 0x3
    UserStatus_Logouting = 0x4
