.class public Lcom/mediatek/ims/pco/PCOService;
.super Landroid/app/Service;
.source "PCOService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/ims/pco/PCOService$IncomingHandler;
    }
.end annotation


# static fields
.field private static final ACTION_CARRIER_SIGNAL_PCO_VALUE:Ljava/lang/String; = "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE"

.field private static final ACTION_CARRIER_SIGNAL_PCO_VALUE_DEBUG:Ljava/lang/String; = "com.mediatek.ims.pco.ACTION_CARRIER_SIGNAL_PCO_VALUE_DEBUG"

.field private static final ACTION_NETWORK_REJECT_CAUSE_DEBUG:Ljava/lang/String; = "com.mediatek.ims.pco.ACTION_NETWORK_REJECT_CAUSE_DEBUG"

.field static final ACTION_PCO_CHECK:Ljava/lang/String; = "pco-check"

.field private static final EXTRA_APN_PROTO_KEY:Ljava/lang/String; = "apnProto"

.field private static final EXTRA_APN_TYPE_KEY:Ljava/lang/String; = "apnType"

.field private static final EXTRA_PCO_ID_KEY:Ljava/lang/String; = "pcoId"

.field private static final EXTRA_PCO_VALUE_KEY:Ljava/lang/String; = "pcoValue"

.field private static final OPSUB_BROWSER_DISABLE_CHECKSTATUS_UNTIL_REBOOT:I = 0xd

.field private static final OPSUB_BROWSER_NOT_STARTED:I = 0xb

.field private static final OPSUB_BROWSER_OPENNING:I = 0xc

.field private static final OPSUB_CALL_DISABLE_CHECKSTATUS_UNTIL_REBOOT:I = 0x10

.field private static final OPSUB_CALL_NOT_STARTED:I = 0xe

.field private static final OPSUB_CALL_OPENNING:I = 0xf

.field private static final STATE_PCO_ACTIVATED:I = 0x5

.field private static final STATE_PCO_ACTIVATING_NW_REJECT_EMM_8:I = 0x4

.field private static final STATE_PCO_ACTIVATING_PCO_VALUE_3:I = 0x2

.field private static final STATE_PCO_ACTIVATING_PCO_VALUE_5:I = 0x3

.field private static final STATE_PCO_NOT_ACTIVATED:I = 0x1

.field private static final STATE_PCO_UNKNOWN:I = -0x1

.field private static final TAG:Ljava/lang/String; = "PCOService"

.field private static sContext:Landroid/content/Context;

.field private static sHandler:Landroid/os/Handler;

.field private static sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

.field private static sServiceLooper:Landroid/os/Looper;

.field private static sStateImsPCO:I

.field private static sSubOPBrowser:I

.field private static sSubOPCall:I


# instance fields
.field private final mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mImei:Ljava/lang/String;

.field final mMessenger:Landroid/os/Messenger;

.field private mSimLoaded:Z

.field private mSubscriptionManager:Landroid/telephony/SubscriptionManager;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 96
    const/4 v0, 0x1

    sput v0, Lcom/mediatek/ims/pco/PCOService;->sStateImsPCO:I

    .line 97
    const/16 v0, 0xb

    sput v0, Lcom/mediatek/ims/pco/PCOService;->sSubOPCall:I

    .line 98
    const/16 v0, 0xe

    sput v0, Lcom/mediatek/ims/pco/PCOService;->sSubOPBrowser:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 75
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 265
    new-instance v0, Lcom/mediatek/ims/pco/PCOService$1;

    invoke-direct {v0, p0}, Lcom/mediatek/ims/pco/PCOService$1;-><init>(Lcom/mediatek/ims/pco/PCOService;)V

    iput-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 583
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/mediatek/ims/pco/PCOService$IncomingHandler;

    invoke-direct {v1, p0}, Lcom/mediatek/ims/pco/PCOService$IncomingHandler;-><init>(Lcom/mediatek/ims/pco/PCOService;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mMessenger:Landroid/os/Messenger;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .line 75
    invoke-static {p0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(I)I
    .locals 0
    .param p0, "x0"    # I

    .line 75
    sput p0, Lcom/mediatek/ims/pco/PCOService;->sSubOPCall:I

    return p0
.end method

.method static synthetic access$202(I)I
    .locals 0
    .param p0, "x0"    # I

    .line 75
    sput p0, Lcom/mediatek/ims/pco/PCOService;->sSubOPBrowser:I

    return p0
.end method

.method static synthetic access$300(Lcom/mediatek/ims/pco/PCOService;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/ims/pco/PCOService;

    .line 75
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->getIccId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/ims/pco/PCOService;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/PCOService;

    .line 75
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->checkPCOActivationStatus()V

    return-void
.end method

.method private checkPCOActivationStatus()V
    .locals 2

    .line 328
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->getImsPcoState()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 339
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handleActivatedcase()V

    .line 340
    goto :goto_0

    .line 336
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handlePCOEMM8case()V

    .line 337
    goto :goto_0

    .line 333
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handlePCO5case()V

    .line 334
    goto :goto_0

    .line 330
    :cond_3
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handlePCO3case()V

    .line 331
    nop

    .line 344
    :goto_0
    return-void
.end method

.method private createNotification()V
    .locals 5

    .line 223
    const-string v0, "[+]adding the notification "

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 224
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v1, "pco"

    const-string v2, "pco.service"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 227
    .local v0, "chPCONotification":Landroid/app/NotificationChannel;
    const-string v2, "PCO check"

    invoke-virtual {v0, v2}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 228
    invoke-virtual {v0, v3}, Landroid/app/NotificationChannel;->enableLights(Z)V

    .line 229
    invoke-virtual {v0, v3}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 230
    sget-object v2, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    .line 231
    const-string v3, "notification"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    .line 232
    .local v2, "notificationManager":Landroid/app/NotificationManager;
    invoke-virtual {v2, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 233
    new-instance v3, Landroid/app/Notification$Builder;

    invoke-direct {v3, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 234
    const v4, 0x108009b

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 235
    const-string v4, "PCO"

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    const-string v4, "Checking PCO status."

    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 236
    invoke-virtual {v3, v1}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 237
    .local v1, "builder":Landroid/app/Notification$Builder;
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v4

    .line 238
    .local v4, "notification":Landroid/app/Notification;
    invoke-virtual {p0, v3, v4}, Lcom/mediatek/ims/pco/PCOService;->startForeground(ILandroid/app/Notification;)V

    .line 239
    invoke-virtual {p0, v3}, Lcom/mediatek/ims/pco/PCOService;->stopForeground(I)V

    .line 240
    return-void
.end method

.method private getIccId()Ljava/lang/String;
    .locals 4

    .line 391
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 392
    const-string v0, "getIccId(), mSubscriptionManager is null"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 393
    return-object v1

    .line 396
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->getMainCapabilityPhoneId()I

    move-result v0

    .line 397
    .local v0, "mainCapabilityPhoneId":I
    iget-object v2, p0, Lcom/mediatek/ims/pco/PCOService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v2, v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoForSimSlotIndex(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v2

    .line 400
    .local v2, "subInfo":Landroid/telephony/SubscriptionInfo;
    if-eqz v2, :cond_1

    .line 401
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ICCID = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 402
    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 404
    :cond_1
    const-string v3, "getIccId(), subInfo is null"

    invoke-static {v3}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 405
    return-object v1
.end method

.method private getImsPcoState()I
    .locals 2

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[?]getImsPcoState() = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/mediatek/ims/pco/PCOService;->sStateImsPCO:I

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->stateToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 167
    sget v0, Lcom/mediatek/ims/pco/PCOService;->sStateImsPCO:I

    return v0
.end method

.method private getMainCapabilityPhoneId()I
    .locals 3

    .line 410
    const-string v0, "persist.vendor.radio.simswitch"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sub-int/2addr v0, v1

    .line 411
    .local v0, "phoneId":I
    if-ltz v0, :cond_0

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 412
    :cond_0
    const/4 v0, -0x1

    .line 414
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getMainCapabilityPhoneId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 415
    return v0
.end method

.method private handleActivatedcase()V
    .locals 3

    .line 504
    const-string v0, "[V]IMS PCO is activated"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 505
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/PCOService;->updateImsPcoState(I)V

    .line 506
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveFirstBoot(Z)V

    .line 507
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveActivated(Z)V

    .line 512
    const-string v0, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP_EXIT"

    const-string v1, "Activated"

    const-string v2, ""

    invoke-direct {p0, v0, v1, v2, v2}, Lcom/mediatek/ims/pco/PCOService;->sendMessagetoUI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    return-void
.end method

.method private handlePCO3case()V
    .locals 2

    .line 472
    const-string v0, "Handling IMS PCO error case = 3"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 473
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-virtual {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->isFirstBoot()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 475
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->getImsPcoState()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 476
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->getImsPcoState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 479
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handleActivatedcase()V

    goto :goto_1

    .line 477
    :cond_1
    :goto_0
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/PCOService;->updateImsPcoState(I)V

    goto :goto_1

    .line 483
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handleActivatedcase()V

    .line 485
    :goto_1
    return-void
.end method

.method private handlePCO5case()V
    .locals 4

    .line 494
    const-string v0, "Handling IMS PCO error case = 5"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 495
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveActivated(Z)V

    .line 497
    const-string v0, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP"

    const-string v1, "notActivated"

    const-string v2, "useMobileNW"

    const-string v3, "signup-url-dialogue"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/mediatek/ims/pco/PCOService;->sendMessagetoUI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    return-void
.end method

.method private handlePCOEMM8case()V
    .locals 4

    .line 430
    const-string v0, "Handling NW rejected, CauseEMM = 8"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 431
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveActivated(Z)V

    .line 432
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->turnOffCellularRadio()V

    .line 433
    const-string v0, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP"

    const-string v1, "notActivated"

    const-string v2, "useWifiNWOnly"

    const-string v3, "show-wifi-dialogue"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/mediatek/ims/pco/PCOService;->sendMessagetoUI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    return-void
.end method

.method private handlePCOEMMcase(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 420
    const-string v0, "emmCause"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 422
    .local v0, "mNwErrorEMMValue":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Network rejected, emmCause,ErrorValue ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 423
    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 424
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/mediatek/ims/pco/PCOService;->updateImsPcoState(I)V

    .line 425
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handlePCOEMM8case()V

    .line 427
    :cond_0
    return-void
.end method

.method private handleSimStateChange(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 356
    const-string v0, "ss"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 357
    .local v0, "simState":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[?]simState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 358
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v3, -0x79d7dbfb

    const/4 v4, 0x1

    if-eq v1, v3, :cond_2

    const v3, 0x72b3d739

    if-eq v1, v3, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const-string v1, "ABSENT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    const-string v1, "LOADED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v4

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    if-eq v1, v4, :cond_3

    goto :goto_2

    .line 363
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 364
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->getIccId()Ljava/lang/String;

    move-result-object v1

    .line 365
    .local v1, "newIccid":Ljava/lang/String;
    sget-object v2, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-virtual {v2}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getIccid()Ljava/lang/String;

    move-result-object v2

    .line 366
    .local v2, "iccid":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[<=>]iccid:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", newIccid:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 370
    if-eq v1, v2, :cond_4

    .line 371
    sget-object v3, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-virtual {v3, v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveIccid(Ljava/lang/String;)V

    .line 372
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->resetImsPcoState()V

    .line 379
    .end local v1    # "newIccid":Ljava/lang/String;
    .end local v2    # "iccid":Ljava/lang/String;
    :cond_4
    :goto_2
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 598
    const-string v0, "PCOService"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    return-void
.end method

.method private registerForIntents()V
    .locals 6

    .line 172
    const-string v0, "[+]Register- NW Broadcast receivers intents"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 173
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 175
    .local v0, "mIntentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 176
    const-string v1, "com.mediatek.intent.action.RADIO_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 178
    const-string v1, "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 179
    const-string v1, "com.mediatek.intent.action.ACTION_NETWORK_REJECT_CAUSE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 180
    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 182
    const-string v1, "com.mediatek.ims.pco.ACTION_QUERY_IMS_PCO_STATUS_FRM_NOTIFICATION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 183
    const-string v1, "com.mediatek.ims.pco.ACTION_QUERY_IMS_PCO_STATUS_FRM_BROWSER"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 185
    const-string v1, "com.mediatek.ims.pco.ACTION_QUERY_IMS_STATUS_FRM_CALL"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 187
    const-string v1, "android.net.wifi.supplicant.CONNECTION_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 190
    const-string v1, "com.mediatek.ims.pco.ACTION_CARRIER_SIGNAL_PCO_VALUE_DEBUG"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 191
    const-string v1, "com.mediatek.ims.pco.ACTION_NETWORK_REJECT_CAUSE_DEBUG"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 198
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "PCOServiceBRThread"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 200
    .local v1, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 201
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    sput-object v2, Lcom/mediatek/ims/pco/PCOService;->sServiceLooper:Landroid/os/Looper;

    .line 202
    new-instance v2, Landroid/os/Handler;

    sget-object v3, Lcom/mediatek/ims/pco/PCOService;->sServiceLooper:Landroid/os/Looper;

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/mediatek/ims/pco/PCOService;->sHandler:Landroid/os/Handler;

    .line 204
    sget-object v3, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/ims/pco/PCOService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v0, v5, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 205
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->createNotification()V

    .line 206
    return-void
.end method

.method private declared-synchronized resetImsPcoState()V
    .locals 2

    monitor-enter p0

    .line 156
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/PCOService;->updateImsPcoState(I)V

    .line 161
    sget-object v1, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-virtual {v1, v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveFirstBoot(Z)V

    .line 162
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->saveActivated(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    monitor-exit p0

    return-void

    .line 155
    .end local p0    # "this":Lcom/mediatek/ims/pco/PCOService;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private restorePCOState()V
    .locals 3

    .line 142
    invoke-virtual {p0}, Lcom/mediatek/ims/pco/PCOService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getInstance(Landroid/content/Context;)Lcom/mediatek/ims/pco/PCOSharedPreference;

    move-result-object v0

    sput-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    .line 143
    if-eqz v0, :cond_1

    .line 144
    invoke-virtual {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSavedPCOState()I

    move-result v0

    .line 145
    .local v0, "mHasPCOState":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "restorePCOState(), Saved IMSPCO value ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 146
    if-gez v0, :cond_0

    .line 147
    sget-object v1, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/mediatek/ims/pco/PCOSharedPreference;->savePCOState(I)V

    goto :goto_0

    .line 149
    :cond_0
    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/PCOService;->updateImsPcoState(I)V

    .line 150
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->checkPCOActivationStatus()V

    .line 153
    .end local v0    # "mHasPCOState":I
    :cond_1
    :goto_0
    return-void
.end method

.method private sendMessagetoUI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "mAction"    # Ljava/lang/String;
    .param p2, "mActStatus"    # Ljava/lang/String;
    .param p3, "mNWToUse"    # Ljava/lang/String;
    .param p4, "mScreentype"    # Ljava/lang/String;

    .line 523
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[==>]sendMessagetoUI, Action="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mNWToUse ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", Screentype="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 525
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    const-class v2, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 526
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 527
    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 528
    const-string v1, "activation-status"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 529
    const-string v1, "preferred-network-type-for-activation"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 530
    const-string v1, "screen-type"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 531
    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/PCOService;->startActivity(Landroid/content/Intent;)V

    .line 532
    return-void
.end method

.method private static stateToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "state"    # I

    .line 603
    const/4 v0, -0x1

    if-eq p0, v0, :cond_5

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    .line 617
    const-string v0, "UNKNOWN state"

    return-object v0

    .line 615
    :cond_0
    const-string v0, "STATE_PCO_ACTIVATED"

    return-object v0

    .line 613
    :cond_1
    const-string v0, "STATE_PCO_ACTIVATING_NW_REJECT_EMM_8"

    return-object v0

    .line 611
    :cond_2
    const-string v0, "STATE_PCO_ACTIVATING_PCO_VALUE_5"

    return-object v0

    .line 609
    :cond_3
    const-string v0, "STATE_PCO_ACTIVATING_PCO_VALUE_3"

    return-object v0

    .line 607
    :cond_4
    const-string v0, "STATE_PCO_NOT_ACTIVATED"

    return-object v0

    .line 605
    :cond_5
    const-string v0, "STATE_UNKNOWN_PCO_VALUE"

    return-object v0
.end method

.method private unregisterIntents()V
    .locals 2

    .line 243
    const-string v0, "[-]unregister: NW Broadcast receivers"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 245
    sget-object v1, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 248
    :cond_0
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sServiceLooper:Landroid/os/Looper;

    if-eqz v0, :cond_1

    .line 249
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 251
    :cond_1
    return-void
.end method

.method private declared-synchronized updateImsPcoState(I)V
    .locals 2
    .param p1, "mUpdatePCOState"    # I

    monitor-enter p0

    .line 347
    :try_start_0
    sget v0, Lcom/mediatek/ims/pco/PCOService;->sStateImsPCO:I

    if-eq v0, p1, :cond_0

    .line 348
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateState: from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/mediatek/ims/pco/PCOService;->sStateImsPCO:I

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->stateToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    invoke-static {p1}, Lcom/mediatek/ims/pco/PCOService;->stateToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 348
    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 350
    sput p1, Lcom/mediatek/ims/pco/PCOService;->sStateImsPCO:I

    .line 351
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-virtual {v0, p1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->savePCOState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 353
    .end local p0    # "this":Lcom/mediatek/ims/pco/PCOService;
    :cond_0
    monitor-exit p0

    return-void

    .line 346
    .end local p1    # "mUpdatePCOState":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public getImei()Ljava/lang/String;
    .locals 1

    .line 383
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mImei:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 384
    return-object v0

    .line 386
    :cond_0
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getImei()Ljava/lang/String;

    move-result-object v0

    .line 387
    .local v0, "mImei":Ljava/lang/String;
    return-object v0
.end method

.method public handlePCOcase(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 440
    const-string v0, "PCOService"

    const-string v1, "handlePCOcase start"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    nop

    .line 442
    const-string v1, "apnType"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 443
    .local v1, "apnType":Ljava/lang/String;
    const-string v2, "apnProto"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 444
    .local v2, "protoKeyAPN":Ljava/lang/String;
    const-string v3, "pcoId"

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 445
    .local v3, "pcoIDKey":I
    const-string v5, "pcoValue"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v5

    .line 446
    .local v5, "pcoContent":[B
    if-eqz v5, :cond_6

    if-nez v1, :cond_0

    goto :goto_3

    .line 451
    :cond_0
    aget-byte v0, v5, v4

    .line 452
    .local v0, "pcoVal":B
    add-int/lit8 v6, v0, -0x30

    .line 453
    .local v6, "pcoValInt":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "apn="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "protoKeyAPN="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "pcoVal ="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " pcoValInt = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 455
    const/4 v7, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v8

    const v9, 0x197cf

    if-eq v8, v9, :cond_2

    :cond_1
    goto :goto_0

    :cond_2
    const-string v8, "ims"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    goto :goto_1

    :goto_0
    move v4, v7

    :goto_1
    if-eqz v4, :cond_3

    goto :goto_2

    .line 457
    :cond_3
    const/4 v4, 0x5

    if-ne v6, v4, :cond_4

    .line 458
    const/4 v4, 0x3

    invoke-direct {p0, v4}, Lcom/mediatek/ims/pco/PCOService;->updateImsPcoState(I)V

    .line 459
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handlePCO5case()V

    goto :goto_2

    .line 460
    :cond_4
    if-nez v6, :cond_5

    .line 461
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->handlePCO3case()V

    .line 469
    :cond_5
    :goto_2
    return-void

    .line 447
    .end local v0    # "pcoVal":B
    .end local v6    # "pcoValInt":I
    :cond_6
    :goto_3
    const-string v4, "handlePCOcase pcoContent == null || apnType == null"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 592
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mMessenger:Landroid/os/Messenger;

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .line 125
    const-string v0, "[v]onCreate........."

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 126
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 127
    invoke-virtual {p0}, Lcom/mediatek/ims/pco/PCOService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    .line 129
    if-nez v0, :cond_0

    .line 130
    const-string v0, "sContext == null"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 131
    return-void

    .line 133
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/ims/pco/PCOService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCONwUtils;->setAppContext(Landroid/content/Context;)V

    .line 134
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    .line 135
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/mediatek/ims/pco/PCOService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 136
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->registerForIntents()V

    .line 138
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->restorePCOState()V

    .line 139
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 258
    const-string v0, "[x]onDestroy"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 259
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOService;->unregisterIntents()V

    .line 261
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[v]onStartCommand: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->log(Ljava/lang/String;)V

    .line 218
    sget-object v0, Lcom/mediatek/ims/pco/PCOService;->sContext:Landroid/content/Context;

    invoke-virtual {p0, v0, p1}, Lcom/mediatek/ims/pco/PCOService;->handlePCOcase(Landroid/content/Context;Landroid/content/Intent;)V

    .line 219
    const/4 v0, 0x3

    return v0
.end method
