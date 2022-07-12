.class Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;
.super Ljava/lang/Object;
.source "PCOStartUPWizardMainActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->bindToService()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    .line 480
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "iBinder"    # Landroid/os/IBinder;

    .line 487
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const-string v1, "Activity connected to service"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$100(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Ljava/lang/String;)V

    .line 488
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    new-instance v1, Landroid/os/Messenger;

    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$202(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Landroid/os/Messenger;)Landroid/os/Messenger;

    .line 489
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$302(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Z)Z

    .line 490
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .line 498
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const-string v1, "Activity disconnected from service"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$100(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Ljava/lang/String;)V

    .line 499
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$202(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Landroid/os/Messenger;)Landroid/os/Messenger;

    .line 500
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$5;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$302(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Z)Z

    .line 501
    return-void
.end method
