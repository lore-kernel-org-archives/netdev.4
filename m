Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998060;
	b=nC9TaQUQJnEQ2M/8HU5nGabkP/AYQwcOEgM+SrfqMC+disumjZiStsyPfCXEU0//K+KI
	 j9il8l5haWnrhtftXumd1RYPuunzlWki+7b2iD7LqhYVYkJeKAtbQME4DLRDwcxXh+Mpo
	 B+47dexzEOQJ/pbn3sAu369Szzok/MEwnfc2vqwdgGSEWBzN6rB5I0AjPQQpuQ11IU8Ap
	 5DojkGR8U9nhKtBhYfZMP+oIpj3a0IZDxENXNYx/S8nspxI19d+Ql3rDuKKtF1e9Mym+d
	 +1Om0xbV9f02LDZjLgrhj5LggeXCFekd57aSXa+oE2HQLyCgXWDMzKqmj2Hz6Sv3vnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3JJyCLMjAoCvBL5z/kqfW84D/kd6FKsaVFTlQhwEbTc=;
	b=pN0kyE/k0DnkvgkuXUTmHijBMEV/yKW7kKnFRw1M8MbRf+rEvIk1vi8sSNYgvERBORWi
	 s0EOYAAKsYthqdZQR23Cpz0NQVz9p5bqFBYP2tekCxu3x8uZ88Cq3be3MrAuLgL3iZIFS
	 Fda12WsRr+T92n6Z8QgWj2xPmU9hMXSztTjHF+gFsmdh/ykkHdKt+lhSbAmSb3GOhjuQ6
	 hhdoQ9q+MzFlFVnpgvb4Bx8oRFX3C9oQiStjx02uBOfN0lHRVuMYmoCexGlufjpLrZqnn
	 MmOMzweLEk+RcQVFCX2VwCUp4aLgU+V+oXbMjWYwop6GDCgjc2SnEjXB4vu/VQaC9HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nrQFtW/w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EBD606A33F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EBD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrQFtW/w
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4adade2ee63so143759fac.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998059; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4ipizpWxMjqCgGiVY2sIFgIt90MzO0O5CDqghRo7k+VeS1Q2WUykrznycO53JSnKw
         cNur3F6qztnMsfARL5CzGADTNMgwZH4ASieJIhk7QzV2JHVoWSYVdpawBZVU5ETlATsp
         AHIR12Fj9PO/fbDbQiBKoHvmij50I6oTcYgncJZwBGoaNJ/ugGdoEQ/yTEospp03HMCE
         g+5ptdGSFR77ZpRaj1uZyRfEEW/1oci2UYaySmji1YQiXwnfOadMa6Sy4TvBKvcZZ0DT
         8H1RcGBHhx13/w0kqyfI3Gop9pgY6wbi916I77VkmK+s6Bo1/zzKhYtVIjV0LSwkq29K
         1SZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=3JJyCLMjAoCvBL5z/kqfW84D/kd6FKsaVFTlQhwEbTc=;
        fh=qgXeXE4Q0Kdsbi7C7Q70PiyecH0VziPSkj7jyfade6U=;
        b=Y0X6cXe2d8TOu2YghFLmoy98m5NdyT22po+gBOX5Cm0USL+L1YlQxQT+MHnsgmeQp4
         Sbd4tVe0cIofNMlgkHmehaqo1JxfRVW1l3894zsHL9KyyrXwsanwZlO6YV9REXRffa0J
         z3KmR6RKSK4OcBscX2yULdKR7ws0TJLjv1Dxu47QhsVeyIiNRz8TjZr9QFnYmmDAjSHn
         N9EkUAsLX8ecbSygz/5yHaiwIsQd2d9fcLpU9RGYkP+mZswrjSrBpMRxgthFb8JqL3nM
         iErG960ZxMGWRBDLgRvcy4SMDtwGopWlXFksLEi/eycyuqQ1VtI3ESUdIS5m+9gKrZ5c
         XQhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998059; x=1795602859; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JJyCLMjAoCvBL5z/kqfW84D/kd6FKsaVFTlQhwEbTc=;
        b=nrQFtW/w55uV5wDu4nSwZjoW+LHVMwrRTUK7ZX3rHMdeojJJSX7T2bZguJk2mfwJ9i
         uJ1FHbnwxy8o4MpnSwy7sFGq7Z69hham+gXPTVJ930ltTYqefQYRfT0ryICR8z/nyjSi
         iYDywcYCbZEASDK5s90RA4ZZCz1Wwn+gbVfE/pXluh4eDLBjcP1ti7FOYk64anIkFhNe
         7uE09u+f86cxnRVXCJWc8pu1/GB6MmTF8k2oIho2AeBS1XAIdq4PXOlWMuIYnx2n3Kkv
         ABRz/OymUMKYVN/uM/sSbtHcPVNCzTGfn89OVJQ7bR+hsUL2C8M++GuoONOBtIFkA1AE
         Sweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998059; x=1795602859;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JJyCLMjAoCvBL5z/kqfW84D/kd6FKsaVFTlQhwEbTc=;
        b=Dm9rF1j/ZI/P6mUw0YjYKGawDc8R8E5MVbBR7yvHFSeVTRP4DgEDemIhWHfumdQSzg
         kTeZ32SneBcjngzVOQHNnGIE/SBkAg+Iq6ZoiaLQmha74wdluyNivh1jz90RvlDQQ4I3
         gFpoU2jfXdZFEAALFEI1Uog/p6imXTxlsGykgn8wxJcKt+jsrVphu21keIf53pgwCQrN
         OM5TueUAJLubczDQ4vnPFLZ3rEMN9MoYVCD7yg79qKnXSF53FlwwnGdWEAWAs26rE4/4
         Om74HRBnnkKRkD5ETmgAXKAVfrxk3RwFMpmeujPujpx+tCQ9GuU2+0Xza9apMNjE4HwF
         0dtw==
X-Forwarded-Encrypted: i=1; AL+hErFx87pWne73WRUri80b73WojOt1IhNqb4G0l1AvCJsD7+d3fSPvsdczQF7CvwrjlEGqEzbxDUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ybyQFDIzLZ8eO9mg9VopSveysF9LUytgnTYW2ptHVgTyxoqSY
	8h1n6XBv9fVZ/nhj7QafdR7A3+M/n8H7iExznSQf8IQtEX6AlGgZqkaNGFW0tgmUOyYmbRismAt
	gyIxEhiRHIuiVJrsXEajA+RAsQirrHk8=
X-Gm-Gg: AYBFou1x5/i8zyKdX2HJ1PCG9no2/UPHLDWQWy8eDQwu8JOj3X0E2BTLfqhM7xzOWoj
	TmnBGMqLmBfg9Mk21pjtAkOkpJp5SqV4VdP+pr6fSwHH3V3z+PbicsAnO/uIeRdFE+uRimMa5xg
	E/GYNIxEptvXKrO+s2qyrRpajCAWWEyScI/uG07IwPPGsZHP+KrTIHMotJlzCuBWTWJHFDCM058
	gq6FKAipp4670SSVtrBlD2NpjKHckgJnTnaEeh8WUs+ZC3KMAkQll6u131+ez/p+QVHRAQohJNu
	WDyGX6T3WcIv/ijhT1r0zye+tKnyc7vKgV0pqg2kAsVQuGKWp4dzXH+SiLGLO08BvoHbEBJPrK1
	giusUa4FihJVUZpOycKTtMbosaSthpVpYgJPcxA==
X-Received: by 2002:a05:6808:3008:b0:574:524d:f23a with SMTP id
 5614622812f47-57741131621mr2403793b6e.25.1794998059239; Wed, 18 Nov 2026
 02:34:19 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:34:18 -0500
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
In-Reply-To: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
Date: Wed, 18 Nov 2026 05:34:18 -0500
X-Gm-Features: AclHuK_6ZSve4efJ0xRzN1bratvCjOBamOSrrj-EqPTPRvlBfa1QiKlhWP8mT70
Message-ID: <CAD-64DcTO2Vro3QFMizUeOft1ptFgKEK=MgJ-mDf5nVOkFkJxA@mail.gmail.com>
Subject: [PATCH net 2/2] net: phy: broadcom: release PTP clock with PHY devres
To: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

bcm_ptp_probe() registers a PHC whose ptp_clock_info and MII timestamper
are embedded in devres-managed private data. The enclosing PHY probe can
still fail while acquiring the wakeup GPIO, requesting its IRQ or
enabling wakeup. Driver-core cleanup then frees the private data without
unregistering the PHC, leaving pointers to freed memory in both the PTP
core and the phy_device.

Register a managed cleanup action after publishing the timestamper. The
action removes the driver-owned timestamper, unregisters the PHC and
purges the transmit queue before the private data is released. The same
action also supplies the missing cleanup for normal driver removal.

Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some
Broadcom PHYs.")
Cc: stable@vger.kernel.org
Signed-off-by: Kimberly Morris <gy770616@gmail.com>
---
 drivers/net/phy/bcm-phy-ptp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index 443917c..085cc31 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -917,10 +917,25 @@ static void bcm_ptp_init(struct bcm_ptp_private *priv)
 	priv->phydev->mii_ts = &priv->mii_ts;
 }

+static void bcm_ptp_remove(void *data)
+{
+	struct bcm_ptp_private *priv = data;
+	struct phy_device *phydev = priv->phydev;
+
+	if (phydev->mii_ts == &priv->mii_ts) {
+		phydev->mii_ts = NULL;
+		phydev->default_timestamp = false;
+	}
+
+	ptp_clock_unregister(priv->ptp_clock);
+	skb_queue_purge(&priv->tx_queue);
+}
+
 struct bcm_ptp_private *bcm_ptp_probe(struct phy_device *phydev)
 {
 	struct bcm_ptp_private *priv;
 	struct ptp_clock *clock;
+	int err;

 	switch (BRCM_PHY_MODEL(phydev)) {
 	case PHY_ID_BCM54210E:
@@ -949,6 +964,10 @@ struct bcm_ptp_private *bcm_ptp_probe(struct
phy_device *phydev)
 	priv->phydev = phydev;
 	bcm_ptp_init(priv);

+	err = devm_add_action_or_reset(&phydev->mdio.dev, bcm_ptp_remove, priv);
+	if (err)
+		return ERR_PTR(err);
+
 	return priv;
 }
 EXPORT_SYMBOL_GPL(bcm_ptp_probe);
-- 
2.55.0.windows.3




On Wed, 18 Nov 2026 05:33:45 -0500, Kimberly Morris <gy770616@gmail.com> wrote:
> Hello,
>
> Following Greg's request for an applyable patch, this series addresses the
> automatic PHY probe-failure lifetime path from the earlier report. It does
> not rely on the root-only sysfs driver-unbind trigger.
>
> A PHY driver can publish a devres-backed mii_timestamper before its probe
> has completed. If a later probe step fails, driver-core cleanup frees the
> owner while the phy_device can retain the published timestamping state. A
> later generic-PHY fallback can then reach the freed object from
> skb_defer_rx_timestamp(). Broadcom BCM54210E/BCM54213PE also leaves a
> registered PHC backed by the same freed storage.
>
> Patch 1 restores the timestamping state that existed before phy_probe().
> Patch 2 adds the missing managed Broadcom PHC and timestamper cleanup.
>
> I reproduced the first issue on an x86_64 KASAN kernel with a KUnit test
> that registers a real mii_bus, phy_device and phy_driver, follows the real
> failed-probe and devres cleanup paths, attaches the generic PHY driver, and
> passes a non-PTP skb to skb_defer_rx_timestamp(). Before the fix KASAN
> reported a slab use-after-free; after the fix the test passed without a
> KASAN report.
>
> Tested on:
>
>   - upstream master 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
>   - net/main 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
>
> The submitted series is generated against current upstream master
> 63fdb511c27afcebce797e3db580b3534ddfa639. I have not tested it on physical
> BCM54213PE hardware, and I am not claiming an attacker-controlled probe
> failure, privilege escalation, or code execution.
>
> Please let me know if the rollback belongs in individual PHY drivers rather
> than phylib core.
>
> Thank you.
>
> Kimberly Morris (2):
>   net: phy: restore timestamping state on probe failure
>   net: phy: broadcom: release PTP clock with PHY devres
>
>  drivers/net/phy/bcm-phy-ptp.c | 19 +++++++++++++++++++
>  drivers/net/phy/phy_device.c  |  5 +++++
>  2 files changed, 24 insertions(+)
