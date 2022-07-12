.class Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;
.super Ljava/lang/Object;
.source "PCOAccountSettings.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->bindToService()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    .line 177
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "iBinder"    # Landroid/os/IBinder;

    .line 184
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const-string v1, "Activity connected to service"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$000(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    new-instance v1, Landroid/os/Messenger;

    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$202(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Landroid/os/Messenger;)Landroid/os/Messenger;

    .line 186
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$302(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Z)Z

    .line 187
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .line 195
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const-string v1, "Activity disconnected from service"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$000(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$202(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Landroid/os/Messenger;)Landroid/os/Messenger;

    .line 197
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$2;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$302(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Z)Z

    .line 198
    return-void
.end method
