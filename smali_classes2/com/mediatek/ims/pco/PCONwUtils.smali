.class public final Lcom/mediatek/ims/pco/PCONwUtils;
.super Ljava/lang/Object;
.source "PCONwUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PCONwUtils"

.field private static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static call911()V
    .locals 6

    .line 260
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 261
    .local v0, "mContext":Landroid/content/Context;
    const/4 v1, 0x0

    .line 262
    .local v1, "duration":I
    const-string v2, "Calling 911"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 263
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 265
    const-string v3, "tel://911"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 266
    .local v3, "callUri":Landroid/net/Uri;
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.CALL"

    invoke-direct {v4, v5, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 267
    .local v4, "callIntent":Landroid/content/Intent;
    const/high16 v5, 0x10040000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 268
    invoke-virtual {v0, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 269
    return-void
.end method

.method public static enableWifi()V
    .locals 3

    .line 288
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 289
    .local v0, "mContext":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 290
    .local v1, "intent":Landroid/content/Intent;
    const v2, 0x30008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 293
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 295
    return-void
.end method

.method public static enableWirelessConnectivity()V
    .locals 3

    .line 275
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 276
    .local v0, "mContext":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.WIRELESS_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 277
    .local v1, "intent":Landroid/content/Intent;
    const v2, 0x30008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 280
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 282
    return-void
.end method

.method private static getAppContext()Landroid/content/Context;
    .locals 1

    .line 33
    sget-object v0, Lcom/mediatek/ims/pco/PCONwUtils;->sContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getRadioStateFromInt(I)Z
    .locals 5
    .param p0, "stateInt"    # I

    .line 135
    const/4 v0, -0x1

    .line 136
    .local v0, "state":I
    const/4 v1, 0x0

    .line 137
    .local v1, "ret":Z
    if-eqz p0, :cond_2

    const/4 v2, 0x1

    if-eq p0, v2, :cond_1

    const/16 v2, 0xa

    if-ne p0, v2, :cond_0

    .line 145
    const/4 v0, 0x1

    .line 146
    const/4 v1, 0x1

    .line 147
    goto :goto_0

    .line 149
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognized RadioState: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 142
    :cond_1
    const/4 v0, 0x2

    .line 143
    goto :goto_0

    .line 139
    :cond_2
    const/4 v0, 0x0

    .line 140
    nop

    .line 151
    :goto_0
    return v1
.end method

.method public static isAirplaneModeOn()Z
    .locals 4

    .line 251
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 252
    .local v0, "mContext":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method public static isInternetConnected()Z
    .locals 7

    .line 180
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 181
    .local v0, "mContext":Landroid/content/Context;
    nop

    .line 182
    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 183
    .local v1, "connectivityMgr":Landroid/net/ConnectivityManager;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 184
    .local v3, "wifi":Landroid/net/NetworkInfo;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v5

    .line 188
    .local v5, "mobile":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_0

    .line 189
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 190
    const-string v4, "isInternetConnected: Wifi is connected"

    invoke-static {v4}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 191
    return v2

    .line 194
    :cond_0
    if-eqz v5, :cond_1

    .line 195
    invoke-virtual {v5}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 196
    const-string v4, "isInternetConnected: Mobile data is connected"

    invoke-static {v4}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 197
    return v2

    .line 200
    :cond_1
    const-string v2, "isInternetConnected: Internet not Connected"

    invoke-static {v2}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 201
    return v4
.end method

.method public static isMobileDataConnected()Z
    .locals 6

    .line 221
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 222
    .local v0, "mContext":Landroid/content/Context;
    const/4 v1, 0x0

    .line 223
    .local v1, "onlineStatus":Z
    nop

    .line 224
    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 225
    .local v2, "connMgr":Landroid/net/ConnectivityManager;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v4

    .line 226
    .local v4, "mobile":Landroid/net/NetworkInfo;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v3, 0x1

    :cond_0
    move v1, v3

    .line 227
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isMobileDataConnected():"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 228
    return v1
.end method

.method public static isOnline()Z
    .locals 4

    .line 209
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 210
    .local v0, "mContext":Landroid/content/Context;
    nop

    .line 211
    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 212
    .local v1, "connMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 213
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method

.method public static isWIFIConnected()Z
    .locals 6

    .line 236
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 237
    .local v0, "mContext":Landroid/content/Context;
    const/4 v1, 0x0

    .line 238
    .local v1, "onlineStatus":Z
    nop

    .line 239
    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 240
    .local v2, "connectivityMgr":Landroid/net/ConnectivityManager;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v4

    .line 241
    .local v4, "wifi":Landroid/net/NetworkInfo;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    move v1, v3

    .line 242
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isWIFIConnected():"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 243
    return v1
.end method

.method public static launchBrowserURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "mIMEI"    # Ljava/lang/String;
    .param p2, "mICCID"    # Ljava/lang/String;

    .line 159
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 160
    .local v0, "mContext":Landroid/content/Context;
    const/4 v1, 0x0

    .line 161
    .local v1, "duration":I
    const-string v2, "Opening Portal"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 162
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "url="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", imei="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "ICCID="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 164
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "HTTPS POST parameters: iccid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "&IMEI="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 166
    .local v3, "mfinalURL":Ljava/lang/String;
    new-instance v4, Landroid/content/Intent;

    .line 167
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const-string v6, "android.intent.action.VIEW"

    invoke-direct {v4, v6, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 168
    .local v4, "browserIntent":Landroid/content/Intent;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mfinalURL="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 169
    const/high16 v5, 0x10000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 170
    invoke-virtual {v0, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 172
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 299
    const-string v0, "PCONwUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    return-void
.end method

.method public static setAppContext(Landroid/content/Context;)V
    .locals 0
    .param p0, "mContext"    # Landroid/content/Context;

    .line 29
    sput-object p0, Lcom/mediatek/ims/pco/PCONwUtils;->sContext:Landroid/content/Context;

    .line 30
    return-void
.end method

.method public static turnOFFBackGroundData()V
    .locals 8

    .line 104
    const-string v0, "turnOffBackGroundData"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 105
    nop

    .line 106
    const-string v0, "phoneEx"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 105
    invoke-static {v0}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/internal/telephony/IMtkTelephonyEx;

    move-result-object v0

    .line 107
    .local v0, "iMtkTelephonyEx":Lcom/mediatek/internal/telephony/IMtkTelephonyEx;
    if-nez v0, :cond_0

    .line 108
    const-string v1, "Can not access iMtkTelephonyEx"

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 109
    return-void

    .line 111
    :cond_0
    const/4 v1, 0x0

    .line 112
    .local v1, "duration":I
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Turning Off Radio"

    invoke-static {v2, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 113
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 115
    :try_start_0
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    move-result v3

    .line 116
    .local v3, "subId":I
    invoke-interface {v0, v3}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx;->getSelfActivateState(I)I

    move-result v4

    .line 117
    .local v4, "selfActivateState":I
    if-eqz v4, :cond_1

    .line 118
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 119
    .local v5, "extra":Landroid/os/Bundle;
    const/4 v6, 0x0

    .line 120
    .local v6, "operationType":I
    const-string v7, "key_add_data_operation"

    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 121
    const/4 v7, 0x0

    invoke-interface {v0, v7, v5, v3}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx;->selfActivationAction(ILandroid/os/Bundle;I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .end local v3    # "subId":I
    .end local v4    # "selfActivateState":I
    .end local v5    # "extra":Landroid/os/Bundle;
    .end local v6    # "operationType":I
    :cond_1
    goto :goto_0

    .line 124
    :catch_0
    move-exception v3

    .line 125
    .local v3, "e":Landroid/os/RemoteException;
    const-string v4, "iMtkTelephonyEx RemoteException"

    invoke-static {v4}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 127
    .end local v3    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method

.method public static turnOffCellularRadio()V
    .locals 8

    .line 73
    const-string v0, "turnOffCellularRadio"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 74
    nop

    .line 75
    const-string v0, "phoneEx"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 74
    invoke-static {v0}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/internal/telephony/IMtkTelephonyEx;

    move-result-object v0

    .line 76
    .local v0, "iMtkTelephonyEx":Lcom/mediatek/internal/telephony/IMtkTelephonyEx;
    if-nez v0, :cond_0

    .line 77
    const-string v1, "Can not access iMtkTelephonyEx"

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 78
    return-void

    .line 81
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    move-result v1

    .line 82
    .local v1, "subId":I
    invoke-interface {v0, v1}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx;->getSelfActivateState(I)I

    move-result v2

    .line 84
    .local v2, "selfActivateState":I
    const/4 v3, 0x0

    .line 85
    .local v3, "duration":I
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "Turning Off Radio"

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 86
    .local v4, "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 87
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 88
    .local v5, "extra":Landroid/os/Bundle;
    const/4 v6, 0x0

    .line 89
    .local v6, "operationType":I
    const-string v7, "key_add_data_operation"

    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 90
    const/4 v7, 0x0

    invoke-interface {v0, v7, v5, v1}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx;->selfActivationAction(ILandroid/os/Bundle;I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    nop

    .end local v1    # "subId":I
    .end local v2    # "selfActivateState":I
    .end local v3    # "duration":I
    .end local v4    # "toast":Landroid/widget/Toast;
    .end local v5    # "extra":Landroid/os/Bundle;
    .end local v6    # "operationType":I
    goto :goto_0

    .line 93
    :catch_0
    move-exception v1

    .line 94
    .local v1, "e":Landroid/os/RemoteException;
    const-string v2, "iMtkTelephonyEx RemoteException"

    invoke-static {v2}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 97
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method

.method public static turnOnCellularRadio()V
    .locals 8

    .line 40
    const-string v0, "PCONwUtils"

    const-string v1, "turnOnCellularRadio"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    nop

    .line 42
    const-string v1, "phoneEx"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 41
    invoke-static {v1}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/internal/telephony/IMtkTelephonyEx;

    move-result-object v1

    .line 43
    .local v1, "iMtkTelephonyEx":Lcom/mediatek/internal/telephony/IMtkTelephonyEx;
    if-nez v1, :cond_0

    .line 44
    const-string v2, "Can not access iMtkTelephonyEx"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    return-void

    .line 48
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    move-result v0

    .line 49
    .local v0, "subId":I
    invoke-interface {v1, v0}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx;->getSelfActivateState(I)I

    move-result v2

    .line 50
    .local v2, "selfActivateState":I
    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    .line 51
    const/4 v3, 0x0

    .line 52
    .local v3, "duration":I
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->getAppContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "Turning On Radio"

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 53
    .local v4, "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 54
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 55
    .local v5, "extra":Landroid/os/Bundle;
    const/4 v6, 0x1

    .line 56
    .local v6, "operationType":I
    const-string v7, "key_add_data_operation"

    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 58
    const/4 v7, 0x0

    invoke-interface {v1, v7, v5, v0}, Lcom/mediatek/internal/telephony/IMtkTelephonyEx;->selfActivationAction(ILandroid/os/Bundle;I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .end local v0    # "subId":I
    .end local v2    # "selfActivateState":I
    .end local v3    # "duration":I
    .end local v4    # "toast":Landroid/widget/Toast;
    .end local v5    # "extra":Landroid/os/Bundle;
    .end local v6    # "operationType":I
    :cond_1
    goto :goto_0

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Landroid/os/RemoteException;
    const-string v2, "iMtkTelephonyEx RemoteException"

    invoke-static {v2}, Lcom/mediatek/ims/pco/PCONwUtils;->log(Ljava/lang/String;)V

    .line 66
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method
