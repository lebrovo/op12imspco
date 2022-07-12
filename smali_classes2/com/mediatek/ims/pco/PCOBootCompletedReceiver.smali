.class public Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PCOBootCompletedReceiver.java"


# static fields
.field private static final ACTION_CARRIER_SIGNAL_PCO_VALUE:Ljava/lang/String; = "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE"

.field private static final EXTRA_APN_PROTO_KEY:Ljava/lang/String; = "apnProto"

.field private static final EXTRA_APN_TYPE_KEY:Ljava/lang/String; = "apnType"

.field private static final EXTRA_PCO_ID_KEY:Ljava/lang/String; = "pcoId"

.field private static final EXTRA_PCO_VALUE_KEY:Ljava/lang/String; = "pcoValue"

.field private static final OP12_BRANDED_DEVICE:Ljava/lang/String; = "0"

.field private static final PCO_SERVICE:Ljava/lang/String; = "pco"

.field private static final PROPERTY_OP12_DEVICE_MODEL:Ljava/lang/String; = "persist.op12.model"

.field private static final TAG:Ljava/lang/String; = "PCOBootCompletedReceiver"

.field private static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private handlePCO5case()V
    .locals 4

    .line 122
    const-string v0, "Handling IMS PCO error case = 5"

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->log(Ljava/lang/String;)V

    .line 123
    const-string v0, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP"

    const-string v1, "notActivated"

    const-string v2, "useMobileNW"

    const-string v3, "signup-url-dialogue"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->sendMessagetoUI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method private static isOp12BrandedDevice()Z
    .locals 2

    .line 66
    nop

    .line 67
    const-string v0, "persist.op12.model"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 66
    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 66
    :goto_0
    return v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 145
    const-string v0, "PCOBootCompletedReceiver"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    return-void
.end method

.method private sendMessagetoUI(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "mAction"    # Ljava/lang/String;
    .param p2, "mActStatus"    # Ljava/lang/String;
    .param p3, "mNWToUse"    # Ljava/lang/String;
    .param p4, "mScreentype"    # Ljava/lang/String;

    .line 133
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

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->log(Ljava/lang/String;)V

    .line 135
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->mContext:Landroid/content/Context;

    const-class v2, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 136
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 138
    const-string v1, "activation-status"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const-string v1, "preferred-network-type-for-activation"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    const-string v1, "screen-type"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    sget-object v1, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 142
    return-void
.end method


# virtual methods
.method public handlePCOcase(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 90
    const-string v0, "PCOBootCompletedReceiver"

    const-string v1, "handlePCOcase start"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    nop

    .line 92
    const-string v1, "apnType"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "apnType":Ljava/lang/String;
    const-string v2, "apnProto"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 94
    .local v2, "protoKeyAPN":Ljava/lang/String;
    const-string v3, "pcoId"

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 95
    .local v3, "pcoIDKey":I
    const-string v5, "pcoValue"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v5

    .line 97
    .local v5, "pcoContent":[B
    if-eqz v5, :cond_5

    if-nez v1, :cond_0

    goto :goto_3

    .line 102
    :cond_0
    aget-byte v0, v5, v4

    .line 103
    .local v0, "pcoVal":B
    add-int/lit8 v6, v0, -0x30

    .line 104
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

    invoke-static {v7}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->log(Ljava/lang/String;)V

    .line 106
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

    .line 108
    :cond_3
    const/4 v4, 0x5

    if-ne v6, v4, :cond_4

    .line 109
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->handlePCO5case()V

    goto :goto_2

    .line 110
    :cond_4
    nop

    .line 119
    :goto_2
    return-void

    .line 98
    .end local v0    # "pcoVal":B
    .end local v6    # "pcoValInt":I
    :cond_5
    :goto_3
    const-string v4, "handlePCOcase pcoContent == null || apnType == null"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 73
    sput-object p1, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->mContext:Landroid/content/Context;

    .line 74
    invoke-static {p1}, Lcom/mediatek/ims/pco/PCONwUtils;->setAppContext(Landroid/content/Context;)V

    .line 75
    invoke-static {}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->isOp12BrandedDevice()Z

    move-result v0

    .line 76
    .local v0, "mIsBrandedDevice":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceive: mIsBrandedDevice = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->log(Ljava/lang/String;)V

    .line 77
    if-nez v0, :cond_0

    .line 78
    return-void

    .line 80
    :cond_0
    if-nez p2, :cond_1

    .line 81
    return-void

    .line 83
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 84
    const-string v1, "PCOBootCompletedReceiver"

    const-string v2, "onReceive ACTION_CARRIER_SIGNAL_PCO_VALUE"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    invoke-virtual {p0, p1, p2}, Lcom/mediatek/ims/pco/PCOBootCompletedReceiver;->handlePCOcase(Landroid/content/Context;Landroid/content/Intent;)V

    .line 87
    :cond_2
    return-void
.end method
