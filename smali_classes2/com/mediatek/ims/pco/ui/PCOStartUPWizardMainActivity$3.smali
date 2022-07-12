.class Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$3;
.super Ljava/lang/Object;
.source "PCOStartUPWizardMainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;
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

    .line 276
    iput-object p1, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$3;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 279
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f080026

    if-eq v0, v1, :cond_1

    const v1, 0x7f08005c

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 281
    :cond_0
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$3;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const-string v1, "mOnClickListenerMobileDataturnOnCellularRadio"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$100(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Ljava/lang/String;)V

    .line 283
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->turnOnCellularRadio()V

    .line 285
    goto :goto_0

    .line 287
    :cond_1
    iget-object v0, p0, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity$3;->this$0:Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;

    const-string v1, "mOnClickListenerMobileDataturnOffCellularRadio"

    invoke-static {v0, v1}, Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;->access$100(Lcom/mediatek/ims/pco/ui/PCOStartUPWizardMainActivity;Ljava/lang/String;)V

    .line 289
    invoke-static {}, Lcom/mediatek/ims/pco/PCONwUtils;->turnOffCellularRadio()V

    .line 290
    nop

    .line 294
    :goto_0
    return-void
.end method
