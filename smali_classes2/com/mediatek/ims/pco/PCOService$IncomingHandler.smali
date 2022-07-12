.class Lcom/mediatek/ims/pco/PCOService$IncomingHandler;
.super Landroid/os/Handler;
.source "PCOService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/ims/pco/PCOService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IncomingHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/ims/pco/PCOService;


# direct methods
.method constructor <init>(Lcom/mediatek/ims/pco/PCOService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/ims/pco/PCOService;

    .line 534
    iput-object p1, p0, Lcom/mediatek/ims/pco/PCOService$IncomingHandler;->this$0:Lcom/mediatek/ims/pco/PCOService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 543
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Request from UI, msgid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->access$000(Ljava/lang/String;)V

    .line 545
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xb

    if-eq v0, v1, :cond_8

    const/16 v1, 0xd

    if-eq v0, v1, :cond_7

    const/16 v1, 0xf

    if-eq v0, v1, :cond_6

    const/16 v2, 0x11

    if-eq v0, v2, :cond_5

    const/16 v2, 0x15

    if-eq v0, v2, :cond_4

    const/16 v2, 0x17

    if-eq v0, v2, :cond_3

    const/16 v2, 0x19

    if-eq v0, v2, :cond_2

    const/16 v1, 0x1b

    if-eq v0, v1, :cond_1

    const/16 v1, 0x21

    if-ne v0, v1, :cond_0

    .line 572
    goto :goto_0

    .line 577
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unknow msg ID from activity"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 574
    :cond_1
    iget-object v0, p0, Lcom/mediatek/ims/pco/PCOService$IncomingHandler;->this$0:Lcom/mediatek/ims/pco/PCOService;

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->access$400(Lcom/mediatek/ims/pco/PCOService;)V

    .line 575
    goto :goto_0

    .line 559
    :cond_2
    invoke-static {v1}, Lcom/mediatek/ims/pco/PCOService;->access$102(I)I

    .line 560
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->call911()V

    .line 561
    goto :goto_0

    .line 569
    :cond_3
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->turnOffCellularRadio()V

    .line 570
    goto :goto_0

    .line 563
    :cond_4
    const/16 v0, 0xc

    invoke-static {v0}, Lcom/mediatek/ims/pco/PCOService;->access$202(I)I

    .line 564
    invoke-static {}, Lcom/mediatek/ims/pco/PCOConfig;->getServerPostPaidUrl()Ljava/lang/String;

    move-result-object v0

    .line 565
    .local v0, "url":Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/ims/pco/PCOService$IncomingHandler;->this$0:Lcom/mediatek/ims/pco/PCOService;

    .line 566
    invoke-virtual {v1}, Lcom/mediatek/ims/pco/PCOService;->getImei()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/ims/pco/PCOService$IncomingHandler;->this$0:Lcom/mediatek/ims/pco/PCOService;

    invoke-static {v2}, Lcom/mediatek/ims/pco/PCOService;->access$300(Lcom/mediatek/ims/pco/PCOService;)Ljava/lang/String;

    move-result-object v2

    .line 565
    invoke-static {v0, v1, v2}, Lcom/mediatek/ims/pco/PCONwUtils;->launchBrowserURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    goto :goto_0

    .line 556
    .end local v0    # "url":Ljava/lang/String;
    :cond_5
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->turnOffCellularRadio()V

    .line 557
    goto :goto_0

    .line 552
    :cond_6
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->turnOnCellularRadio()V

    .line 553
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->enableWirelessConnectivity()V

    .line 554
    goto :goto_0

    .line 550
    :cond_7
    goto :goto_0

    .line 547
    :cond_8
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->enableWifi()V

    .line 548
    nop

    .line 579
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 580
    return-void
.end method
