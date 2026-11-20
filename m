Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188522;
	b=nPhGB2ZWJ0Wti34MvNbK4NexAuWvyslqG7ULZyZwlMqwwuehVfPcRkrdcC0hLW8sQCQE
	 acoTCiL//GDFfHolRGtgX9MjQzBdyy1+jkat3pQKhgW5ij6y7962qUp6Z9KG+GAg8GacB
	 qR2V1Z5EkDoBT16ZFzhDnyCMmJyez5jWZL27we6lgTxbCEPYJNdB63ithKByQztkkBXTV
	 oyEWYUIeyuf+27GmBt8G9bqGcgmk0H/ki4trI3zWNr8b/woXWWnnOt+GIP16vWWUPKkwk
	 JB0GqAyLm2daxvpRMMQLhY7HZrxx0FmfJZBH8gcAYiQ2FYzK1Vix1JcZbuMPbEt6JOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zXTRJAoOuhwgv6K3/hgMVInOSV4KNQqD3bcfaDnRvQ0=;
	b=w9oJjHfNxW7R7mLuE2KGlpPPCF56wCeGFUmlMkr6XP6JbmhHG1LsTljMCVMW+ekIt6Go
	 eAPsnYyWBUnMMD3YHLs2Xk0AnlS6xHEjPtujegs1GPGNKex5lvXag2DICaiZMKLDM+RTz
	 k7Xt+Zg7gbmL44Zis1+UEWiGr69rDUJRhDnl9LbDZnE7tBVpWYfjutyraxtydSRcv660C
	 oZYBmRvHL4u/uGp12SrK7Ou3J19VDEalf9v15Z9i0yPyfeSaYFp8gU5XSgrzYeRV3cE+p
	 mFk+U3XQHGaHSQBkYplcFLI8PAb0mAwBWxtmjq/+S7MwfNkDUHY4MFYqQrd4lx6XqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IbKQ9U44;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70D060A2600
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70D060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IbKQ9U44
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso861848a91.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188521; x=1795793321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXTRJAoOuhwgv6K3/hgMVInOSV4KNQqD3bcfaDnRvQ0=;
        b=IbKQ9U441mvUpOCf5AN9AqCTS3l5kw++bv0vXra/SVCRluvwyI1YXYPCMCAtcBSz+c
         W6znSwySMdcXTH73F1VCad2A8OBL+LsbYUTnR0yGF7mn5aVNFBH6UZQQLmZ12/Y+XrZz
         V/S6lhX9lwrd7yNmBFU8k7Z/1PujnDmOT8lKzrKWjnp93xhlSegPdASUEPgxX5bGr4bc
         VvAspiW8JKI9vjDdruBfQsq4FYTeyAYUWyCHjZImkn5oTPwJL3jC9hhvoDKHCdCglvdY
         G4A0IMCprFZNfQOfCj7yv0Tibrjfjnghw7yqbK3tR53GuHTQw/+QtnT+yZdOa7FxBPNu
         WQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188521; x=1795793321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXTRJAoOuhwgv6K3/hgMVInOSV4KNQqD3bcfaDnRvQ0=;
        b=Zu52RZCfZYceeH9rJvS8EUAxFTCYJBd+ZKxLOp0Y9EeCJCNqoeM/64jnI0FrgPuWEj
         zxo2s//bB+lYqY99H4Hhx2vxo1/4prOGbDHKgDQqTr6x8WaP8OUTOQn0+MjvhWCG6J+w
         voHV3DfESJhfoCEsqN2IhZQg7koOggJXAX5Zbd1V13pX0Z4lWPpR4qtEDU32PvAGDloR
         XCIgrJhOsN7WQQxf12pA+JsMe8npLmpOmvOkkZUaw2z9PaDyaA1CTeVqnZM8cvR+B3WK
         R+R5wPStCgNvufzE2wAPRMCzui9z7gHBTrDd7eKjSkcsRs2qvKMH/sQO3YKordU+pLe+
         DOsA==
X-Gm-Message-State: APuU4Z/8/WTV/bsmnovTvDCEEokcYWG3Kdbh4XGF6ohpm6Y8KVCNsk+/
	XDTkG6gP+VxQN1mFgjKinLN93OFzBe6cCry7pfQZQOvUby3NYVHERs+QJ1btR1toLzSxLH+miiN
	5Xuj3
X-Gm-Gg: AZFdTZe+nfk6WoKq/TLU4G38lgc+L4BncHnVfDztqjymP1Znq2yAHyATli0ZTdmc/+5
	Xx6Ab6Up8EZzu2oMsEPXoJq7vKnxmlt9Q3aiIeKmFtSU7bWCEmUmW1yKwdDubUNab5ceXzRG1FV
	hKP0RdK3J24UKnALuYifgKw0Wxn/FvldF5MwZLesZe1n3h5e5Xelzq8rXNsnerd7AHhLoJMFcXl
	jROa1c1Hd47JuCV9dFwbm3Vv7zaKHmynBPv0sMwaVkORxBRx0K3fB7FTI6CYS4dQQE3uS8rbcEv
	L1Rz9VoXmNb6t6yqOcy/2iy/o3JLUWOeAlu9Ew+x8vNEp53+U7NJX4CnCnfQyBnL+BUe9TvyesM
	4kjgOGatcl5xqrqLV26JeZN9LeAGBrOxogzk1EkQ7bNSVj2hA8RF/bNnLbIrMS9bAOyzjpkcK0h
	iYVTX6YjKMtPfHMWrg9+4rdTPXwKp4R23j2+s6daXJgIcazM+31447qdWGRTIONa/GirPXKuXT5
	Q7zlZ2fjRI1y/j55+g+4XCKYUaan2Y/vYQeIzqEHD/ZF4VOYRYSUnxn4F+oKXmgvRqjAbG9C098
	DNYu3l4jIokYLO+DUkz9ruChclM2dtI2O+Xwc/Phg54=
X-Received: by 2002:a17:90b:268a:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3b41c9778e9mr3152403a91.50.1795188521252;
        Fri, 20 Nov 2026 07:28:41 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm5081385a91.1.2026.11.20.07.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:40 -0800 (PST)
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
Subject: [PATCH net v6 1/5] bnxt_en: return the RING_FREE status to callers
Date: Fri, 20 Nov 2026 07:28:23 -0800
Message-ID: <20261120152830.699712-2-joe@dama.to>
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

hwrm_ring_free_send_msg() reports failure to its caller, but always as
-EIO, so a caller cannot tell whether the firmware rejected
HWRM_RING_FREE or never answered it. The TX, RX and AGG ring free
helpers discard the value.

Return the errno from hwrm_req_send() instead. -EBUSY means no response
arrived: the wait timed out, was abandoned, or the firmware channel is
down. An error reported by the firmware keeps its own errno, for example
a firmware BUSY reply becomes -EAGAIN. Return the value from the TX, RX
and AGG ring free helpers.

No caller acts on it yet, so there is no functional change.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 50 +++++++++++++----------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e78cf7ad3cbc..c3413354e758 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7673,55 +7673,62 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
 	if (rc || error_code) {
 		netdev_err(bp->dev, "hwrm_ring_free type %d failed. rc:%x err:%x\n",
 			   ring_type, rc, error_code);
+		if (rc)
+			return rc;
 		return -EIO;
 	}
 	return 0;
 }
 
-static void bnxt_hwrm_tx_ring_free(struct bnxt *bp,
-				   struct bnxt_tx_ring_info *txr,
-				   bool close_path)
+static int bnxt_hwrm_tx_ring_free(struct bnxt *bp,
+				  struct bnxt_tx_ring_info *txr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &txr->tx_ring_struct;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = close_path ? bnxt_cp_ring_for_tx(bp, txr) :
 		       INVALID_HW_RING_ID;
-	hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
-				cmpl_ring_id);
+	rc = hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
+				     cmpl_ring_id);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
-static void bnxt_hwrm_rx_ring_free(struct bnxt *bp,
-				   struct bnxt_rx_ring_info *rxr,
-				   bool close_path)
+static int bnxt_hwrm_rx_ring_free(struct bnxt *bp,
+				  struct bnxt_rx_ring_info *rxr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &rxr->rx_ring_struct;
 	u32 grp_idx = rxr->bnapi->index;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = bnxt_cp_ring_for_rx(bp, rxr);
-	hwrm_ring_free_send_msg(bp, ring,
-				RING_FREE_REQ_RING_TYPE_RX,
-				close_path ? cmpl_ring_id :
-				INVALID_HW_RING_ID);
+	rc = hwrm_ring_free_send_msg(bp, ring,
+				     RING_FREE_REQ_RING_TYPE_RX,
+				     close_path ? cmpl_ring_id :
+				     INVALID_HW_RING_ID);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
 	bp->grp_info[grp_idx].rx_fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
-static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
-				       struct bnxt_rx_ring_info *rxr,
-				       bool close_path)
+static int bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
+				      struct bnxt_rx_ring_info *rxr,
+				      bool close_path)
 {
 	struct bnxt_ring_struct *ring = &rxr->rx_agg_ring_struct;
 	u32 grp_idx = rxr->bnapi->index;
 	u32 type, cmpl_ring_id;
+	int rc;
 
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)
 		type = RING_FREE_REQ_RING_TYPE_RX_AGG;
@@ -7729,14 +7736,15 @@ static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
 		type = RING_FREE_REQ_RING_TYPE_RX;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = bnxt_cp_ring_for_rx(bp, rxr);
-	hwrm_ring_free_send_msg(bp, ring, type,
-				close_path ? cmpl_ring_id :
-				INVALID_HW_RING_ID);
+	rc = hwrm_ring_free_send_msg(bp, ring, type,
+				     close_path ? cmpl_ring_id :
+				     INVALID_HW_RING_ID);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
 	bp->grp_info[grp_idx].agg_fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
 static void bnxt_hwrm_cp_ring_free(struct bnxt *bp,
-- 
2.53.1-Meta

