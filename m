Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188529;
	b=AKIt8fDxd1lNJcq/bs2xYWD+ceuZRA2M+k0z0l1pUloRl/evvpzcRnKY4pDUCsaHwbKY
	 +QoUAL0pez2q6Wjao4jbLRakzHYIRD1YOLkbgH2pcTvTBiJn3IpGhQy9u8+EACuF2uF7Y
	 ugVSnALBBDMWuWaGW8oMkPGwxNgH8Whrdkxhxun4PIjA7prNtzNQ6cz2xI7IuWo2LoraL
	 5DOjxHPOn2n+47KleI6/FmU3VJj8iw87/OYA33yepaDU/IGXPaZYCLq48KxEQ6LRWq/0j
	 7ySm2Y0XFw0JkkQlBNxzfvJj/sIkam3ca5DMpFYbcGtWo7wbOAL+LXaUnC4KiG1hGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Em4E89zdWbxcgvKPHc94se92Rkw2o5lnt9pqWcj8Es8=;
	b=itug+P1y8WDcSjRKjnK4WERW1dt+ZPCVTkWkiyrNxjhw4ij/ixJ3K0nEKYdZIcSR38nT
	 B42HXxrPBXWaTxvEup2rfB8gDd/7Sw/7Sw9v6lkSOaxmSGVKEmY/QvvXnXbNZjT+Vl5lW
	 b3X+t2eWcpsBrkiQVrQOjduXlAXMkIQRI9DOUtJD2DDE2fnzT+ho2RTRXnorTu5P1BoDu
	 85xjIOH2iVd7SPm59dC6gHZnKnEK6wyLHpVRaBq4/Z7RLxDIuw/xnQaON3wzbE6CRZ8o1
	 8yM4lZWEAq+Tl+eZRcCbT4ChkVa/FSyMC2LP1S9Fs6GjzpVmUaOhqZIjXURp5EH/N+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uPSImCRI;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46977606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46977606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uPSImCRI
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso575005a12.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188529; x=1795793329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em4E89zdWbxcgvKPHc94se92Rkw2o5lnt9pqWcj8Es8=;
        b=uPSImCRI4OhP8CO0FXQDQ/Y0vWg2ILgA8J0gZjScF27jr/6i0TyzdPQTq+GwIgcmIJ
         AzXRiVQMZszfUcGnWIMjFGZZrHKARFAuSrywyBdy6MjVvaxLqdKIsgE6B2YRl/ztDI23
         Sobl0DZ6Sianl1K/Wwr5LSKBdDjoo20VJNqFNFqwIioRvDJJL0P+5D0Ulu0Fwym1TIT9
         B1n1vcWga3ZPc7NvJD5Jg+AMqRPJWkoJjrU4XFwOg8vIQUl3AFRJe+1bQY9cOLxybyQN
         ESsxJf9kMaF8VV4NETKz0QY0KYAoDxcMUpLunaXQCL3QEEQh17oKq1moQSCt9wnkO5Xk
         4B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188529; x=1795793329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em4E89zdWbxcgvKPHc94se92Rkw2o5lnt9pqWcj8Es8=;
        b=q3XeAeGte9DGb8FhmBMdGJz0fb8jqPU4duz6wzfMsOr9oHSoYGkradZOOUcay3LbJ0
         NCPqYZ699ppRTNfofEZCfaF0LyEES8Xc8V4nb+Bc6KN2dIE/jG49MmJtmAQSzMZba8OI
         tXvV4EN84OeroYn34ZIbS0veutVGuR8dkq/H1KP5yx/fiVm8xCn7h8NErJVzXFaKjp2v
         oK9FYWR4u4iGckwJfVkiNJVRNppEfzKFKEnx50Eh1jY6lo00NpYYIHeoXdMS55aMJug8
         Iik7+39oXPCA8HiusiiPbwZO0pZDm5hGQ8fYzdjI8jJAgTHhZnnx9kDMJ91UZ7FbY2m2
         5Ncw==
X-Gm-Message-State: APuU4Z8EDthU5klzAulA49Bjj6xyFuQhlE+DvZyKQNflGB9gmAuuj31d
	hNPPOjgaUpVodHjvqU4XmNENrm5CA7GZA5PRFJnCgkd8kjAVTY3AmlbdIBeclzbYvSPU8QJN9ju
	HSzza
X-Gm-Gg: AZFdTZfue/141Em30vb5owp6lQu60qb5ubqyvdnfYvdc7koX0USess4fB77tL0n8VAG
	mae78Z921K+L62Mfvsf3AvUfTCav8jLEC/FN10z1gvGK99QAo742ardneUDG0/tX4jSRYw1PDDg
	0dr1sO3Tx3qgyvogDw1T8E6FJRc2xPPIJX88YvIN9a3rP5Oo6y1kbuH8eZDrRaM7kTznp7xdoyu
	avLB80z6/AOkzLNIYcy56asddXG6wBqAIroIDFf6yr1iF8T0ft1S934b7WtMN8dDLnEpCnPJrt0
	7/FMLDhTKdwdlNQDiogZHwIzCHKO5gUmICzujGRri/Q+nkDaGhiRTTwHoSo87vxT7cufgGynomV
	mrWlStfGuAegw7gNEtox9r8BPHfxvUDpNw27RSSdTLBiHedFpFTv0R1nX31tcU2v3JlOaQzfOTd
	33038lrI379/OxpkGgQ8j3nb2J8CrIJmIpk+wI4g/bR14XpaKTVL9FHp4BV6Zz9kTePNzcYZUW0
	tvVJTs3+YvPWvx/RRADcanwKb8Sx2kyJkWvkDNFdRRVZ3O2xxJDdcNTuqUnbr/26xYgv7JcPg3c
	RDxhM72+U2ZGx5Rkm6FzRmUpyUagh3wLG4WtsN6png==
X-Received: by 2002:a17:90b:2e0e:b0:3b3:a312:581d with SMTP id 98e67ed59e1d1-3b40a625fcbmr3824029a91.43.1795188528625;
        Fri, 20 Nov 2026 07:28:48 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc80d4sm1488570a12.6.2026.11.20.07.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:47 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 4/5] bnxt_en: refuse to open a device with stopped DMA
Date: Fri, 20 Nov 2026 07:28:26 -0800
Message-ID: <20261120152830.699712-5-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
References: <20261120152830.699712-1-joe@dama.to>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add BNXT_STATE_DMA_STOPPED and set it in bnxt_stop_dma() to signal that
the device had DMA disabled. When opening the device later, check this
bit and exit with an error. Also add the bit to BNXT_NO_FW_ACCESS() so
HWRM commands sent after DMA is stopped fail right away instead of
waiting for the timeout.

This is a very rare case, but when it happens the driver must be rebound
to make the device usable again.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 26 ++++++++++++++++++++---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 ++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 600a8c866f3c..9daf053293a4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7847,9 +7847,20 @@ static void bnxt_stop_dma(struct bnxt *bp)
 
 	netdev_err(bp->dev,
 		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
+	set_bit(BNXT_STATE_DMA_STOPPED, &bp->state);
 	pci_clear_master(bp->pdev);
 }
 
+static int bnxt_check_dma_stopped(struct bnxt *bp)
+{
+	if (!test_bit(BNXT_STATE_DMA_STOPPED, &bp->state))
+		return 0;
+
+	netdev_err(bp->dev,
+		   "DMA was disabled after the firmware failed to free rings, rebind the driver to recover\n");
+	return -ENODEV;
+}
+
 static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
 			     bool shared);
 static int bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
@@ -13440,9 +13451,10 @@ static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 
 int bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 {
-	int rc = 0;
+	int rc;
 
-	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state))
+	rc = bnxt_check_dma_stopped(bp);
+	if (!rc && test_bit(BNXT_STATE_ABORT_ERR, &bp->state))
 		rc = -EIO;
 	if (!rc)
 		rc = __bnxt_open_nic(bp, irq_re_init, link_re_init);
@@ -13459,7 +13471,11 @@ int bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
  */
 int bnxt_half_open_nic(struct bnxt *bp)
 {
-	int rc = 0;
+	int rc;
+
+	rc = bnxt_check_dma_stopped(bp);
+	if (rc)
+		goto half_open_err;
 
 	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
 		netdev_err(bp->dev, "A previous firmware reset has not completed, aborting half open\n");
@@ -13519,6 +13535,10 @@ static int bnxt_open(struct net_device *dev)
 	struct bnxt *bp = netdev_priv(dev);
 	int rc;
 
+	rc = bnxt_check_dma_stopped(bp);
+	if (rc)
+		return rc;
+
 	if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
 		rc = bnxt_reinit_after_abort(bp);
 		if (rc) {
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307..50c024dd3c6c 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2474,9 +2474,11 @@ struct bnxt {
 #define BNXT_STATE_FW_NON_FATAL_COND	13
 #define BNXT_STATE_FW_ACTIVATE_RESET	14
 #define BNXT_STATE_HALF_OPEN		15	/* For offline ethtool tests */
+#define BNXT_STATE_DMA_STOPPED		16
 
 #define BNXT_NO_FW_ACCESS(bp)					\
 	(test_bit(BNXT_STATE_FW_FATAL_COND, &(bp)->state) ||	\
+	 test_bit(BNXT_STATE_DMA_STOPPED, &(bp)->state) ||	\
 	 pci_channel_offline((bp)->pdev))
 
 	struct bnxt_irq	*irq_tbl;
-- 
2.53.1-Meta

