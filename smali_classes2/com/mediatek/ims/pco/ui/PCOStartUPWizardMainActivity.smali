.class public Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;
.super Landroid/app/Activity;
.source "PCOStartUPWizardMainActivity.java"


# static fields
.field private static final ACTIVATED:Ljava/lang/String; = "Activated"

.field private static final NOT_ACTIVATED:Ljava/lang/String; = "notActivated"

.field private static final TAG:Ljava/lang/String; = "PCOStartUPWizardMainActivity"

.field private static final USE_MOBILE_NW_ONLY:Ljava/lang/String; = "useMobileNW"

.field private static final USE_WIFI_NW_ONLY:Ljava/lang/String; = "useWifiNWOnly"


# instance fields
.field private mActInfo:Landroid/widget/TextView;

.field private mActivatedOnClickListener:Landroid/view/View$OnClickListener;

.field private mActivationStatus:Ljava/lang/String;

.field private mBound:Z

.field private mCancelButton:Landroid/widget/Button;

.field private mContext:Landroid/content/Context;

.field private mIntent:Landroid/content/Intent;

.field private mNWToUse:Ljava/lang/String;

.field private mNwRejectedInfo:Landroid/widget/TextView;

.field private mOKButton:Landroid/widget/Button;

.field private mOnClickListenerMobileData:Landroid/view/View$OnClickListener;

.field private mService:Landroid/os/Messenger;

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mSignUpOnClickListener:Landroid/view/View$OnClickListener;

.field private mUIScreen:Ljava/lang/String;

.field private mUserInfo:Landroid/widget/TextView;

.field private mWifiOnClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 72
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mUIScreen:Ljava/lang/String;

    .line 82
    const-string v1, "unknown"

    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivationStatus:Ljava/lang/String;

    .line 94
    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    .line 237
    new-instance v1, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$1;

    invoke-direct {v1, p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$1;-><init>(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;)V

    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mSignUpOnClickListener:Landroid/view/View$OnClickListener;

    .line 258
    new-instance v1, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$2;

    invoke-direct {v1, p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$2;-><init>(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;)V

    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mWifiOnClickListener:Landroid/view/View$OnClickListener;

    .line 276
    new-instance v1, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$3;

    invoke-direct {v1, p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$3;-><init>(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;)V

    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOnClickListenerMobileData:Landroid/view/View$OnClickListener;

    .line 300
    new-instance v1, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$4;

    invoke-direct {v1, p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$4;-><init>(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;)V

    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivatedOnClickListener:Landroid/view/View$OnClickListener;

    .line 444
    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mService:Landroid/os/Messenger;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;
    .param p1, "x1"    # I

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->sendMessageToService(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Landroid/os/Messenger;)Landroid/os/Messenger;
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;
    .param p1, "x1"    # Landroid/os/Messenger;

    .line 72
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mService:Landroid/os/Messenger;

    return-object p1
.end method

.method static synthetic access$302(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;
    .param p1, "x1"    # Z

    .line 72
    iput-boolean p1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mBound:Z

    return p1
.end method

.method private getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 436
    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 514
    const-string v0, "PCOStartUPWizardMainActivity"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    return-void
.end method

.method private sendMessageToService(I)V
    .locals 4
    .param p1, "mReqID"    # I

    .line 449
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[==>]Request to service, MSG ID"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 451
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mService:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    .line 452
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 453
    .local v0, "message":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 455
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mService:Landroid/os/Messenger;

    invoke-virtual {v1, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 458
    goto :goto_0

    .line 456
    :catch_0
    move-exception v1

    .line 457
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PCOStartUPWizardMainActivity"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    .end local v0    # "message":Landroid/os/Message;
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_0
    :goto_0
    return-void
.end method

.method private setViewForActivated()V
    .locals 3

    .line 380
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mUserInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0046

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 382
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x104000a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 384
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 385
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivatedOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 386
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 388
    invoke-virtual {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->cancelNotifications()V

    .line 389
    return-void
.end method

.method private setViewForMobileActivation()V
    .locals 3

    .line 337
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0044

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 340
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNwRejectedInfo:Landroid/widget/TextView;

    .line 341
    const v1, 0x7f0c002e

    invoke-virtual {p0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 340
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 342
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    const v1, 0x7f0c0043

    invoke-virtual {p0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 343
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOnClickListenerMobileData:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 344
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOnClickListenerMobileData:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mUserInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c003a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->updateNotification()V

    .line 348
    return-void
.end method

.method private setViewForOnlineSignup()V
    .locals 3

    .line 358
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNwRejectedInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c002d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 360
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0037

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c003e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 365
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mSignUpOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 367
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c002a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 369
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mSignUpOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mUserInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0040

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 372
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->updateNotification()V

    .line 374
    return-void
.end method

.method private setViewForWifiActivation()V
    .locals 3

    .line 318
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNwRejectedInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c002d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 320
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mUserInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c003b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0045

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 325
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    const v1, 0x7f0c0027

    invoke-virtual {p0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 326
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mWifiOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mWifiOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->updateNotification()V

    .line 330
    return-void
.end method

.method private uiController()V
    .locals 10

    .line 161
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mIntent:Landroid/content/Intent;

    .line 162
    .local v0, "ii":Landroid/content/Intent;
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "mAction":Ljava/lang/String;
    const-string v2, ""

    .line 164
    .local v2, "mScreen":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " UIcontroller:mAction = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 165
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UIcontroller:mActivationStatus="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivationStatus:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", mNWToUse="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 167
    if-eqz v0, :cond_e

    if-nez v1, :cond_0

    goto/16 :goto_6

    .line 171
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    sparse-switch v3, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v3, "com.android.settings.OPERATOR_APPLICATION_SETTING"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v4

    goto :goto_1

    :sswitch_1
    const-string v3, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP_EXIT"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v7

    goto :goto_1

    :sswitch_2
    const-string v3, "com.mediatek.ims.pco.ui.SIGNUP_USER_NOTIFICATION_ID"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v6

    goto :goto_1

    :sswitch_3
    const-string v3, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v8

    goto :goto_1

    :goto_0
    move v3, v5

    :goto_1
    if-eqz v3, :cond_7

    if-eq v3, v8, :cond_4

    if-eq v3, v7, :cond_3

    if-eq v3, v6, :cond_2

    goto :goto_2

    .line 203
    :cond_2
    const-string v2, "signup-url-dialogue"

    .line 204
    goto :goto_2

    .line 200
    :cond_3
    const-string v2, "activated-dialogue"

    .line 201
    goto :goto_2

    .line 179
    :cond_4
    iget-object v3, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    const-string v9, "useWifiNWOnly"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 180
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->isWIFIConnected()Z

    move-result v3

    if-nez v3, :cond_5

    .line 181
    const-string v2, "show-wifi-dialogue"

    goto :goto_2

    .line 183
    :cond_5
    const-string v2, "signup-url-dialogue"

    goto :goto_2

    .line 186
    :cond_6
    iget-object v3, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    const-string v9, "useMobileNW"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 190
    const-string v3, "dialog  = SCREEN_SHOW_DATA_DIALOGUE "

    invoke-direct {p0, v3}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 192
    const-string v2, "show-data-dialogue"

    goto :goto_2

    .line 173
    :cond_7
    const-string v2, "signup-url-dialogue"

    .line 174
    nop

    .line 209
    :cond_8
    :goto_2
    nop

    .line 213
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v9, 0x4

    sparse-switch v3, :sswitch_data_1

    :cond_9
    goto :goto_3

    :sswitch_4
    const-string v3, "show-data-dialogue"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    move v4, v7

    goto :goto_4

    :sswitch_5
    const-string v3, "startup wizard"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    goto :goto_4

    :sswitch_6
    const-string v3, "signup-url-dialogue"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    move v4, v6

    goto :goto_4

    :sswitch_7
    const-string v3, "show-wifi-dialogue"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    move v4, v8

    goto :goto_4

    :sswitch_8
    const-string v3, "activated-dialogue"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    move v4, v9

    goto :goto_4

    :goto_3
    move v4, v5

    :goto_4
    if-eq v4, v8, :cond_d

    if-eq v4, v7, :cond_c

    if-eq v4, v6, :cond_b

    if-eq v4, v9, :cond_a

    goto :goto_5

    .line 226
    :cond_a
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->setViewForActivated()V

    .line 227
    goto :goto_5

    .line 223
    :cond_b
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->setViewForOnlineSignup()V

    .line 224
    goto :goto_5

    .line 220
    :cond_c
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->setViewForMobileActivation()V

    .line 221
    goto :goto_5

    .line 217
    :cond_d
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->setViewForWifiActivation()V

    .line 218
    nop

    .line 231
    :goto_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UIcontroller:Requested Screen = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 232
    return-void

    .line 168
    :cond_e
    :goto_6
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7db4822e -> :sswitch_3
        -0x7112307c -> :sswitch_2
        -0x11f04095 -> :sswitch_1
        0x221e6a05 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x1c8ff1ac -> :sswitch_8
        -0x18205d40 -> :sswitch_7
        0x16d87f0b -> :sswitch_6
        0x1712146e -> :sswitch_5
        0x78cf39cb -> :sswitch_4
    .end sparse-switch
.end method

.method private unbindFromService()V
    .locals 1

    .line 465
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_0

    .line 466
    const-string v0, "unbind service"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 467
    iget-boolean v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mBound:Z

    if-eqz v0, :cond_0

    .line 468
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 469
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mBound:Z

    .line 472
    :cond_0
    return-void
.end method

.method private updateNotification()V
    .locals 9

    .line 405
    const-string v0, "adding the notification "

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 406
    new-instance v0, Landroid/app/Notification$Builder;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.mediatek.ims.pco.ui.SIGNUP_USER_NOTIFICATION_ID"

    invoke-direct {v0, v1, v2}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 408
    .local v0, "mBuilder":Landroid/app/Notification$Builder;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.mediatek.ims.pco.ACTION_QUERY_IMS_PCO_STATUS_FRM_NOTIFICATION"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 410
    .local v1, "mQueryIntent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-static {v3, v4, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 411
    .local v3, "pendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 412
    const v5, 0x7f0c002c

    invoke-virtual {p0, v5}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 413
    const v5, 0x7f0b0002

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 414
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 415
    iget-object v5, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-direct {p0, v5}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v5

    .line 416
    .local v5, "mNotificationManager":Landroid/app/NotificationManager;
    new-instance v6, Landroid/app/NotificationChannel;

    iget-object v7, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    .line 417
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0c002b

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-direct {v6, v2, v7, v8}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    move-object v2, v6

    .line 419
    .local v2, "channel":Landroid/app/NotificationChannel;
    invoke-virtual {v5, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 420
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 421
    return-void
.end method


# virtual methods
.method protected bindToService()V
    .locals 3

    .line 478
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    if-nez v0, :cond_0

    .line 480
    new-instance v0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;

    invoke-direct {v0, p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;-><init>(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;)V

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 506
    :cond_0
    const-string v0, "start requested & bind service"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 507
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/ims/pco/PCOService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 508
    .local v0, "service":Landroid/content/Intent;
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 511
    return-void
.end method

.method public cancelNotifications()V
    .locals 2

    .line 427
    const-string v0, "[-]canceling notification"

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 428
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getNotificationManager(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 430
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 113
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 114
    iput-object p0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mContext:Landroid/content/Context;

    .line 116
    const v0, 0x7f0a002e

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->setContentView(I)V

    .line 117
    const v0, 0x7f08005c

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    .line 118
    const v0, 0x7f080026

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    .line 119
    const v0, 0x7f08009a

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mUserInfo:Landroid/widget/TextView;

    .line 120
    const v0, 0x7f080077

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActInfo:Landroid/widget/TextView;

    .line 121
    const v0, 0x7f080076

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNwRejectedInfo:Landroid/widget/TextView;

    .line 122
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mOKButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 123
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mCancelButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 124
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->setRequestedOrientation(I)V

    .line 125
    invoke-virtual {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mIntent:Landroid/content/Intent;

    .line 126
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 127
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.mediatek.ims.pco.ui.ACTION_SIGN_UP"

    if-ne v0, v1, :cond_1

    .line 131
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mIntent:Landroid/content/Intent;

    .line 132
    const-string v1, "activation-status"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivationStatus:Ljava/lang/String;

    .line 133
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mIntent:Landroid/content/Intent;

    .line 134
    const-string v1, "preferred-network-type-for-activation"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    .line 135
    if-nez v0, :cond_1

    .line 136
    const-string v0, "unknown"

    iput-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    .line 139
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[<==]onCreate:mActivationStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivationStatus:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mNWToUse =="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 140
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->uiController()V

    .line 142
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 397
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 398
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->unbindFromService()V

    .line 399
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 149
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResume:mActivationStatus="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mActivationStatus:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mNWToUse="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->mNWToUse:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->log(Ljava/lang/String;)V

    .line 151
    invoke-direct {p0}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->uiController()V

    .line 154
    return-void
.end method
