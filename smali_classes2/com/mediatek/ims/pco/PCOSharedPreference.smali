.class public Lcom/mediatek/ims/pco/PCOSharedPreference;
.super Ljava/lang/Object;
.source "PCOSharedPreference.java"


# static fields
.field private static final ACTIVATED_VIRTUAL_LINES:Ljava/lang/String; = "ActivatedVirtualLines"

.field private static final DEVICE_NAME:Ljava/lang/String; = "DeviceName"

.field private static final IAM_USER_REFRESH_TOKEN:Ljava/lang/String; = "IAMUserRefreshToken"

.field private static final ICCID:Ljava/lang/String; = "Iccid"

.field private static final IS_ACTIVATED:Ljava/lang/String; = "IsActivated"

.field private static final IS_FIRST_BOOT:Ljava/lang/String; = "IsFirstBoot"

.field private static final PCO_ACTIVATION_STATUS:Ljava/lang/String; = "PCOActivationStatusToken"

.field private static final SHARED_PREFERENCES_NAME:Ljava/lang/String; = "ims_pco_information"

.field protected static final TAG:Ljava/lang/String; = "PCOSharedPreference"

.field private static sContext:Landroid/content/Context;

.field private static volatile sPCOPref:Lcom/mediatek/ims/pco/PCOSharedPreference;


# instance fields
.field private mPref:Landroid/content/SharedPreferences;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "mContext"    # Landroid/content/Context;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    sput-object p1, Lcom/mediatek/ims/pco/PCOSharedPreference;->sContext:Landroid/content/Context;

    .line 76
    const-string v0, "ims_pco_information"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/ims/pco/PCOSharedPreference;->mPref:Landroid/content/SharedPreferences;

    .line 78
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/mediatek/ims/pco/PCOSharedPreference;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 86
    sget-object v0, Lcom/mediatek/ims/pco/PCOSharedPreference;->sPCOPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    if-eqz v0, :cond_0

    .line 87
    sget-object v0, Lcom/mediatek/ims/pco/PCOSharedPreference;->sPCOPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    return-object v0

    .line 89
    :cond_0
    new-instance v0, Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-direct {v0, p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;-><init>(Landroid/content/Context;)V

    .line 90
    .local v0, "mPCOPref":Lcom/mediatek/ims/pco/PCOSharedPreference;
    sput-object v0, Lcom/mediatek/ims/pco/PCOSharedPreference;->sPCOPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    .line 91
    sget-object v1, Lcom/mediatek/ims/pco/PCOSharedPreference;->sPCOPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    return-object v1
.end method

.method private getSharePrefBoolenValue(Ljava/lang/String;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .line 103
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private getSharePrefIntValue(Ljava/lang/String;)I
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .line 114
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, -0x1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getSharePrefStringValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .line 124
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "DEFAULT"

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSharedPreferences()Landroid/content/SharedPreferences;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOSharedPreference;->mPref:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 251
    const-string v0, "PCOSharedPreference"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    return-void
.end method

.method private setSharePrefBoolenValue(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 107
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 108
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 109
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 110
    return-void
.end method

.method private setSharePrefIntValue(Ljava/lang/String;I)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 118
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 119
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 120
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 121
    return-void
.end method

.method private setSharePrefStringValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 128
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 129
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 130
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 131
    return-void
.end method


# virtual methods
.method public getDeviceName()Ljava/lang/String;
    .locals 5

    .line 151
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOSharedPreference;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "DeviceName"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "deviceName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 156
    sget-object v2, Lcom/mediatek/ims/pco/PCOSharedPreference;->sContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/os/UserManager;->get(Landroid/content/Context;)Landroid/os/UserManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/UserManager;->getUserName()Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "userName":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UserManager.getUserName() is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "PCOSharedPreference"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 162
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\'s phone"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 160
    :cond_1
    :goto_0
    const-string v0, "My phone"

    .line 166
    :goto_1
    iget-object v3, p0, Lcom/mediatek/ims/pco/PCOSharedPreference;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 167
    .local v3, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v3, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 168
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 171
    .end local v2    # "userName":Ljava/lang/String;
    .end local v3    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_2
    return-object v0
.end method

.method public getIccid()Ljava/lang/String;
    .locals 1

    .line 188
    const-string v0, "Iccid"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharePrefStringValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSavedPCOState()I
    .locals 3

    .line 205
    const-string v0, "PCOActivationStatusToken"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharePrefIntValue(Ljava/lang/String;)I

    move-result v0

    .line 206
    .local v0, "mState":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getSavedPCOState(), PCOState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 207
    return v0
.end method

.method public isActivated()Z
    .locals 3

    .line 244
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "IsActivated"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 245
    .local v0, "isActivated":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isActivated(), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 246
    return v0
.end method

.method public isFirstBoot()Z
    .locals 3

    .line 225
    invoke-direct {p0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "IsFirstBoot"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 226
    .local v0, "isFirstBoot":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isFirstBoot(), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 227
    return v0
.end method

.method public saveActivated(Z)V
    .locals 2
    .param p1, "status"    # Z

    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "saveActivated"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 236
    const-string v0, "IsActivated"

    invoke-direct {p0, v0, p1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->setSharePrefBoolenValue(Ljava/lang/String;Z)V

    .line 237
    return-void
.end method

.method public saveDeviceName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "saveDeviceName(), name:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOSharedPreference;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 142
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "DeviceName"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 143
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 144
    return-void
.end method

.method public saveFirstBoot(Z)V
    .locals 2
    .param p1, "status"    # Z

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "saveFirstBoot() "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 217
    const-string v0, "IsFirstBoot"

    invoke-direct {p0, v0, p1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->setSharePrefBoolenValue(Ljava/lang/String;Z)V

    .line 218
    return-void
.end method

.method public saveIccid(Ljava/lang/String;)V
    .locals 2
    .param p1, "iccid"    # Ljava/lang/String;

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "saveIccid(), iccid:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 180
    const-string v0, "Iccid"

    invoke-direct {p0, v0, p1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->setSharePrefStringValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public savePCOState(I)V
    .locals 2
    .param p1, "mPCOState"    # I

    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "savePCOState(), PCOState:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->log(Ljava/lang/String;)V

    .line 197
    const-string v0, "PCOActivationStatusToken"

    invoke-direct {p0, v0, p1}, Lcom/mediatek/ims/pco/PCOSharedPreference;->setSharePrefIntValue(Ljava/lang/String;I)V

    .line 198
    return-void
.end method
