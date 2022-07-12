.class public Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;
.super Landroid/os/AsyncTask;
.source "PCOWaitForWifiTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field private static final REQUEST_METHOD:Ljava/lang/String; = "POST"

.field private static final REQUEST_TIMEOUT:I = 0x3a98

.field private static final RETRY:I = 0x5

.field private static final WAIT_TIME:I = 0x1388


# instance fields
.field private mActiveNetwork:Landroid/net/NetworkInfo;

.field private mConnectionManager:Landroid/net/ConnectivityManager;

.field private mContext:Landroid/content/Context;

.field private mWifiStatusCheckingTask:Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 67
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->mContext:Landroid/content/Context;

    .line 69
    return-void
.end method


# virtual methods
.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 52
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "params"    # [Ljava/lang/String;

    .line 73
    const/4 v0, 0x5

    .line 74
    .local v0, "mRetry":I
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->mContext:Landroid/content/Context;

    .line 75
    const-string v2, "wifi"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 78
    .local v1, "wifiManager":Landroid/net/wifi/WifiManager;
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    const-string v2, "connected"

    return-object v2

    .line 81
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 82
    const-wide/16 v2, 0x1388

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 83
    :catch_0
    move-exception v2

    .line 84
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 85
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :goto_1
    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 52
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .line 91
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 92
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->mContext:Landroid/content/Context;

    const-class v2, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 95
    const/high16 v1, 0x20000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 96
    iget-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 97
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/ims/pco/ui/PCOWaitForWifiTask;->mContext:Landroid/content/Context;

    .line 98
    return-void
.end method
