.class Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;
.super Ljava/lang/Object;
.source "PCOAccountSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/ims/pco/ui/PCOAccountSettings;
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

    .line 109
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f080019

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const-string v1, "[==>]IMS PCO Status Check"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$000(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    const/16 v1, 0x1b

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->access$100(Lcom/mediatek/ims/pco/ui/PCOAccountSettings;I)V

    .line 120
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOAccountSettings$1;->this$0:Lcom/mediatek/ims/pco/ui/PCOAccountSettings;

    invoke-virtual {v0}, Lcom/mediatek/ims/pco/ui/PCOAccountSettings;->finish()V

    .line 121
    nop

    .line 125
    :goto_0
    return-void
.end method
