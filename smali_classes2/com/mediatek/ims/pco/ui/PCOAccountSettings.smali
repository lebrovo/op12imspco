.class public Lcom/mediatek/ims/pco/ui/PCOAccountSettings;
.super Landroid/app/Activity;
.source "PCOAccountSettings.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PCOAccountSettings"

.field private static sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;


# instance fields
.field private mAccountViewOnClickListener:Landroid/view/View$OnClickListener;

.field private mActivateNowButton:Landroid/widget/Button;

.field private mBound:Z

.field private mService:Landroid/os/Messenger;

.field private mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 65
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 109
    new-instance v0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;-><init>(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;)V

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mAccountViewOnClickListener:Landroid/view/View$OnClickListener;

    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mService:Landroid/os/Messenger;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOAccountSettings;
    .param p1, "x1"    # Ljava/lang/String;

    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;I)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOAccountSettings;
    .param p1, "x1"    # I

    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->sendMessageToService(I)V

    return-void
.end method

.method static synthetic access$202(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Landroid/os/Messenger;)Landroid/os/Messenger;
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOAccountSettings;
    .param p1, "x1"    # Landroid/os/Messenger;

    .line 65
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mService:Landroid/os/Messenger;

    return-object p1
.end method

.method static synthetic access$302(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOAccountSettings;
    .param p1, "x1"    # Z

    .line 65
    iput-boolean p1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mBound:Z

    return p1
.end method

.method private bindToService()V
    .locals 3

    .line 175
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mServiceConnection:Landroid/content/ServiceConnection;

    if-nez v0, :cond_0

    .line 177
    new-instance v0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;

    invoke-direct {v0, p0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;-><init>(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;)V

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 203
    :cond_0
    const-string v0, "start requested & bind service"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->log(Ljava/lang/String;)V

    .line 204
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/ims/pco/PCOService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 205
    .local v0, "service":Landroid/content/Intent;
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 208
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 210
    const-string v0, "PCOAccountSettings"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    return-void
.end method

.method private sendMessageToService(I)V
    .locals 4
    .param p1, "mReqID"    # I

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[==>]Request to service, MSG ID"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->log(Ljava/lang/String;)V

    .line 145
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mService:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    .line 146
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 147
    .local v0, "message":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 149
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mService:Landroid/os/Messenger;

    invoke-virtual {v1, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    goto :goto_0

    .line 150
    :catch_0
    move-exception v1

    .line 151
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PCOAccountSettings"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .end local v0    # "message":Landroid/os/Message;
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method private unbindFromService()V
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mServiceConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_0

    .line 163
    const-string v0, "unbind service"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->log(Ljava/lang/String;)V

    .line 164
    iget-boolean v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mBound:Z

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->unbindService(Landroid/content/ServiceConnection;)V

    .line 166
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mBound:Z

    .line 169
    :cond_0
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 78
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 79
    invoke-virtual {p0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOSharedPreference;->getInstance(Landroid/content/Context;)Lcom/mediatek/ims/pco/PCOSharedPreference;

    move-result-object v0

    sput-object v0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    .line 81
    const v0, 0x7f0a002d

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->setContentView(I)V

    .line 84
    const v0, 0x7f080019

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mActivateNowButton:Landroid/widget/Button;

    .line 85
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mAccountViewOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mActivateNowButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 87
    const v0, 0x7f080023

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 88
    .local v0, "mBtnArea":Landroid/widget/LinearLayout;
    const v1, 0x7f080037

    invoke-virtual {p0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 89
    .local v1, "mView":Landroid/view/View;
    const/16 v2, 0xe

    invoke-virtual {p0, v2}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->setRequestedOrientation(I)V

    .line 90
    sget-object v2, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->sPCOInfoPref:Lcom/mediatek/ims/pco/PCOSharedPreference;

    invoke-virtual {v2}, Lcom/mediatek/ims/pco/PCOSharedPreference;->isActivated()Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 91
    iget-object v2, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->mActivateNowButton:Landroid/widget/Button;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 92
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 93
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 95
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->bindToService()V

    .line 98
    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 131
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 132
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->unbindFromService()V

    .line 133
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 105
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 107
    return-void
.end method
