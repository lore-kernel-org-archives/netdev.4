Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188527;
	b=XKYK7pfKp5Naivc6PLYE1BY1mzJlqfY/rLdxqDcAo4yvnbADyD1b4UhHlacdDoxxfqSx
	 eWWT4Fy2lTiqMN5Tk6lRYJiSf4O/JNrYc5OgyHyUK9jBL7NJ3KGaibF6aTM5GBRf7SEh0
	 Dbi2neDNYNUbAONCnUJ9YOdsK2AKYc7IVUD6f/rAEGKf843fHUYhOynDrKXzNUymwhEdY
	 RjmanCLt6+SeRgFNZ1P7A1sFufh5ioMNSNqO1h+jArgSWu97S/NJDLKVJOl3VJtSOWSm9
	 I6Wf9hGN16ZZOrdsL2cvVbZuIEwnqHAr1S7eVOqfAoIrehBVhNYyU24mt98o16OiXGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hxpLjtj7QP+IYBWsy1XSO9tGe0BNcI3vqQsQIXeopWA=;
	b=Bynr5+DjQ8ssSQkc8o83k/1R8szCjsVZea9hYFn8NoBZV/qEmcRfWUl2tyjn8oaubYJi
	 wwDumhOaq9JjSbZ1S1RqmRCHMUx2aH6YoewX09BZnhrtqYl2kI1HhGxIXczGW63VT+5h4
	 8Gj2e9B3lQMUSPHCLKmzKBABbqSYul7UPYAhOC/mFqcIEw31OAw21DQb8u8duy+tqtVsS
	 4FFD9CvK0mgQj8KOdT+Chv/Xvin8Z2pcxvPrBrcoQ/Nkh3YZC1uaZFCgiT3KKVIHZ2H+L
	 QmFwxa2Sbo/rSz0Xmi6akLGg9bKDQyFN+8RtM/eDF+VpGK6/+YVYwqYLOCr+UGuBJJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A21EIoZH;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104B606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0104B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A21EIoZH
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso741004a12.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188526; x=1795793326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxpLjtj7QP+IYBWsy1XSO9tGe0BNcI3vqQsQIXeopWA=;
        b=A21EIoZHLB1WC14GvESz4l0BoqAw0JuATxR+O6wb1RhK6ItM+dENI73UY47dIUTf/c
         v5ld6IgYgEIWl6/qRmJ91OwK1lPDReoi5tlTSdxOvovkBYiC3QKr0BQ6OjdAFIfLasuK
         ZwpiciZstUwP6G6xQWJGmHG0RsiYP2XQpQsOKd8GwEtu+XsvDnPiXsLJdeFXihd31SXx
         ihiX+5i4kawaIybOYe9ryb7vhfk1fdzhIjPXniRMQidDcB+x2vXKy3CeJCGaaYcKcxnk
         5QlNnjjFrxxPBND2xiHckGUPprnrBLJsNwKq3yfBhxgXiiTMdQLc1yk8UOKX/if0R1OE
         0ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188526; x=1795793326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxpLjtj7QP+IYBWsy1XSO9tGe0BNcI3vqQsQIXeopWA=;
        b=HMbWRTJ7uLIy1tww1FAij44/ndhF84PpvMB9G+ieGmzHxFlzG8Kntg4QvGucjPVqqp
         9JsggTg+fdQQskwvvCIlfK+NosPBaCcxuihKa/V+OZxPy6e5iPgPcL9xgx35oY7YHXPA
         5xfu0sku12QmIA6PfOL8ZmSHAta+Vb8/D/OlWR2Fflq5uUa4UIacBcMObGCvEnoFndqk
         oXi3MTX7B8PtxdwzYf6rP9e7mIKuL1coNLVT/lMhdNsRFlPAgew5L/SoEO9QL7K/oLga
         d+BxERaXKea/ss8xsy6bmEjfexX7DKLM0pJnEPxt6CLmgZhzETBsgykfkpsIOBkf7V9x
         Aqgg==
X-Gm-Message-State: APuU4Z88jDSXvdC+4mera7iToo6l9SA0GFJqAyd6xfYdyZJg+UwZBEJA
	dGP1notnrbqh5WrbMZsKQv9gpDMVK690fNSYqD/fRwHEPTvotSDeO/utZmJ4HV620BkXP8xlcTG
	WIKEN
X-Gm-Gg: AZFdTZdkIXZSOSnOOljDYtsRVII+1yVcRA3O0OVPO9vZkOm8PlwQm4dTP9Z/tmZ+PNv
	Yw/QqmdbpYnTh75TZ59fzjB1QIMl4ZR09BVPcQN4zgZDjV0WY5XhRcchLftSZLGnkNG5TZwfIh0
	ktekRT7spDILtIpiGYVtmcqbPFPrylDtiOfUPWWDy0r3OE3N5CptsnbJagM3Ms4cSqUzFwgQOG4
	vMuMsnbnSRlJGxvuJw65dA1ohEi7kARgdOQz1QYaO+6E34dX68xwFYqfoookrQTcwGtZPh1HIQN
	8VYXp1REHb98DhxJsNpmnwkLEVbJ2cadl76CEXraYnuue06dyM3/2d0Rw4L5wTNrpAIZpqD6pjv
	GOrR8d4pd7rbwnd+1XI2TfsIXFEmKN5Q84Jgt7sJFZO7fHQ6Kl6hQy+8AVkfHL0zMtoHtrpYr/9
	qJFmkWrxYzS/bGvuww2oIq6C3kZI31kCIJA7fEOTbWTCK5hz+95q6mEbhxcMLSW5X+lcSj47w+m
	hiF49XTbmPQ0TWsq6WMyhjiJwlZjcDdjdh5t417NGmcpzvIz9/SRFsPeSoRA3QhQKPfLmvCXqaW
	DHuMUv0x+lkgt1ChzhwzesZ3RzOgGI2Zok1FSJssCI0=
X-Received: by 2002:a17:90b:2f8c:b0:3b0:b556:ba9b with SMTP id 98e67ed59e1d1-3b41c9b227fmr3089477a91.23.1795188526303;
        Fri, 20 Nov 2026 07:28:46 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm7998673a91.5.2026.11.20.07.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:45 -0800 (PST)
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
Subject: [PATCH net v6 3/5] bnxt_en: stop DMA before releasing rings the firmware did not free
Date: Fri, 20 Nov 2026 07:28:25 -0800
Message-ID: <20261120152830.699712-4-joe@dama.to>
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

When HWRM_RING_FREE is not answered, bnxt_hwrm_ring_free() clears
fw_ring_id and __bnxt_close_nic() goes on to call bnxt_free_mem(), which
unmaps the ring memory and the RX buffers that the FW may still be
using.

This is reachable in production. On a BCM57504 the first sign is the TX
watchdog; the close that follows times out a subset of its RING_FREEs and
the driver releases those rings anyway:

  05:30:12  NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
  05:30:12  Resp cmpl intr err msg: 0x51                  x20
  05:30:12  hwrm_ring_free type 1 failed                  x12
  05:30:12  hwrm_ring_free type 2 failed                  x8
  05:30:12  AMD-Vi: IO_PAGE_FAULT  x3

Count the TX, RX and AGG rings whose RING_FREE got no response and
report that to the caller, which stops DMA before the ring memory is
released. This is skipped during a firmware reset or after a fatal
firmware error, where the reset path already handles the device.

The device stays unusable until the driver is rebound.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 61 ++++++++++++++++++-----
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index c3413354e758..600a8c866f3c 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7774,21 +7774,31 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
 			memset(cpr->cp_desc_ring[i], 0, size);
 }
 
-static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
+static int bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 {
+	int stuck = 0;
 	u32 type;
 	int i;
 
 	if (!bp->bnapi)
-		return;
+		return 0;
 
+	/* -EBUSY means the firmware never answered, so it may still own
+	 * the ring.
+	 */
 	for (i = 0; i < bp->tx_nr_rings; i++)
-		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
+		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
+					   close_path) == -EBUSY)
+			stuck++;
 
 	bnxt_cancel_dim(bp);
 	for (i = 0; i < bp->rx_nr_rings; i++) {
-		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
-		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
+		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
+
+		if (bnxt_hwrm_rx_ring_free(bp, rxr, close_path) == -EBUSY)
+			stuck++;
+		if (bnxt_hwrm_rx_agg_ring_free(bp, rxr, close_path) == -EBUSY)
+			stuck++;
 	}
 
 	/* The completion rings are about to be freed.  After that the
@@ -7818,6 +7828,26 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
 			bp->grp_info[i].cp_fw_ring_id = INVALID_HW_RING_ID;
 		}
 	}
+
+	if (!stuck)
+		return 0;
+
+	netdev_err(bp->dev, "Firmware did not free %d ring(s)\n", stuck);
+	return -EIO;
+}
+
+static void bnxt_stop_dma(struct bnxt *bp)
+{
+	/* A firmware reset resets the device, and the fatal error path
+	 * already disables it.
+	 */
+	if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state) ||
+	    test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
+		return;
+
+	netdev_err(bp->dev,
+		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
+	pci_clear_master(bp->pdev);
 }
 
 static int __bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
@@ -10852,16 +10882,19 @@ static void bnxt_clear_vnic(struct bnxt *bp)
 		bnxt_hwrm_vnic_ctx_free(bp);
 }
 
-static void bnxt_hwrm_resource_free(struct bnxt *bp, bool close_path,
-				    bool irq_re_init)
+static int bnxt_hwrm_resource_free(struct bnxt *bp, bool close_path,
+				   bool irq_re_init)
 {
+	int rc;
+
 	bnxt_clear_vnic(bp);
-	bnxt_hwrm_ring_free(bp, close_path);
+	rc = bnxt_hwrm_ring_free(bp, close_path);
 	bnxt_hwrm_ring_grp_free(bp);
 	if (irq_re_init) {
 		bnxt_hwrm_stat_ctx_free(bp);
 		bnxt_hwrm_free_tunnel_ports(bp);
 	}
+	return rc;
 }
 
 static int bnxt_hwrm_set_br_mode(struct bnxt *bp, u16 br_mode)
@@ -11383,15 +11416,15 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
 	return 0;
 
 err_out:
-	bnxt_hwrm_resource_free(bp, 0, true);
+	if (bnxt_hwrm_resource_free(bp, 0, true))
+		bnxt_stop_dma(bp);
 
 	return rc;
 }
 
 static int bnxt_shutdown_nic(struct bnxt *bp, bool irq_re_init)
 {
-	bnxt_hwrm_resource_free(bp, 1, irq_re_init);
-	return 0;
+	return bnxt_hwrm_resource_free(bp, 1, irq_re_init);
 }
 
 static int bnxt_init_nic(struct bnxt *bp, bool irq_re_init)
@@ -13462,7 +13495,8 @@ int bnxt_half_open_nic(struct bnxt *bp)
  */
 void bnxt_half_close_nic(struct bnxt *bp)
 {
-	bnxt_hwrm_resource_free(bp, false, true);
+	if (bnxt_hwrm_resource_free(bp, false, true))
+		bnxt_stop_dma(bp);
 	bnxt_del_napi(bp);
 	bnxt_free_skbs(bp);
 	bnxt_free_mem(bp, true);
@@ -13541,7 +13575,8 @@ static void __bnxt_close_nic(struct bnxt *bp, bool irq_re_init,
 	if (BNXT_SUPPORTS_MULTI_RSS_CTX(bp))
 		bnxt_clear_rss_ctxs(bp);
 	/* Flush rings and disable interrupts */
-	bnxt_shutdown_nic(bp, irq_re_init);
+	if (bnxt_shutdown_nic(bp, irq_re_init))
+		bnxt_stop_dma(bp);
 
 	/* TODO CHIMP_FW: Link/PHY related cleanup if (link_re_init) */
 
-- 
2.53.1-Meta

