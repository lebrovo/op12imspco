.class public final Lcom/mediatek/ims/pco/PCOConfig;
.super Ljava/lang/Object;
.source "PCOConfig.java"


# static fields
.field public static final DEBUG:Z = true

.field private static final SERVER_POST_PAID_URL:Ljava/lang/String; = "https://quickaccess.verizonwireless.com/bbportal/phone/start.do?"

.field private static final SERVER_PRE_PAID_URL:Ljava/lang/String; = "https://quickaccess.verizonwireless.com/bbportal/phone/start.do?HTTPS POST parameters: iccid=1"

.field public static final TAG:Ljava/lang/String; = "PCOConfig"

.field public static final VERBOSE:Z = true


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getServerPostPaidUrl()Ljava/lang/String;
    .locals 1

    .line 58
    const-string v0, "https://quickaccess.verizonwireless.com/bbportal/phone/start.do?"

    return-object v0
.end method

.method public static getServerPrePaidUrl()Ljava/lang/String;
    .locals 1

    .line 62
    const-string v0, "https://quickaccess.verizonwireless.com/bbportal/phone/start.do?HTTPS POST parameters: iccid=1"

    return-object v0
.end method
