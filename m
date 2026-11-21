Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231950;
	b=Pks+p1UcPc9f9cClNNP290RSEUFnbVhRJV8XS3/bBj2rhAa9XJMqjisx27jS/KAoTWvF
	 IefKqj2Sd3QQXcHcNaeJdqdUIInWH8rAQxMhR/aUYhIFPbvQWRl/BQQx2A60jY42CKtlv
	 ukRpX4ZDer9I86zSF3jtLGOPGjXefMM5avY9WtAxFewgoWt4D4wsDtgQ2k2BHtmLGVjvV
	 ISI9w3Sma6f6nZAZBbFheD9oQVONSBoAsgnBRWi30ztRy8WPZsdcGVF7ufiZRwLcgAn0w
	 8N+RtJtr+3+AbbqN9HMoHI8I/+pREB6m9XrjEepKxcDWA40X8ywhIbggXh7cnv7A7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YOzNhjws3gldKpT9Gv1+KAocibW61jVtKAiqYleNLi8=;
	b=AD4oaYoL6OgduunGtm1K8UfZF6+fjGy7YDfmmMQ/lrJ9igLQ19Zq5gHI9txpSrtEcGNL
	 SHQKiY7xVH3PBEc5lortYWA/SrS/pTG9uAHn4jqsKY4G+iR/wKwgECfyDNTg7huE5LWis
	 CJVYtZAOrWreDACtJdfw9tN9m0aqfwQLJ/C0xSHLqdvZzzP/3IvGleLi2q9E0ZrJ5JW1O
	 +1Ico4rJyYoKEwgOEAbAvF1v6HFl3qTVgwObXKg7ibERCimXuHIQ9wQJgytro6XS9HsqI
	 zfh90MrtQfVSCP513sEMHV5CdcAPY1QTbuHqFS/VUewqQWqIQi9jte2/Lalnqgn3yzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jvqFB3mB;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6042C60A2602
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6042C60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jvqFB3mB
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso892085a91.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231945; x=1795836745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOzNhjws3gldKpT9Gv1+KAocibW61jVtKAiqYleNLi8=;
        b=jvqFB3mBb2wdzjtQLWbusdrkQSN8++0yMhWzjYhLKRd9J5fAsOBbkSsXvsnzPApweC
         3HrQZDbcrtVxt8hcsnINOMNRYIloMFdPBlbetXyzpf2f6nggscSe1rykkqTx93O2VBnQ
         3CD5raLOblG19i3XwJ6UKCWrvKHl1XgwkPr9i6+SV2s6x/cGyCWXZSv8i9uY4OK4cfOY
         NcdBNJ37KUDAMMsxQIkMa4hDVrLCp8dVjVPtuekVPRhYXgatVxE+ygxlz3f1srgGJG0c
         TuyHvjQmdtBXt3uBDpIbO8Ld5XcN3WbmtsyVc8pyBgRZNtsxFPYlrVZAQsxDVNrYeHcM
         SCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231945; x=1795836745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOzNhjws3gldKpT9Gv1+KAocibW61jVtKAiqYleNLi8=;
        b=0QRgKLP+Nlk5DvqZUIIhJxQinSZzmQe8zNAfjqcVDMr0Lp2r/gZw+vqXjR7EsJZ0QQ
         XU3dRApL1ALPhO5IlJNEEomMmluE3IV+ej5EGwPd5HoVhKL9MPPOj0uS6M3m9TLCEVdO
         bOaDnV2pWuKckrIeEzBIGSsE39r2hPGzAdXiia/c290nfbBU6CvBhsaoiD5pugUNIV+7
         lkPpEewp446NBYAqhsEKqp6FJHvQUPQNsS8WUWSUnyFASufVyPDg5ZOT3HS9vJVyysbY
         2Mw1yjAHvpJxdGWsVshBoZogkJS/9v+syW4HUMpSpGUXw7lZtHh0KwW6QiOMiyqKMaLn
         ROdQ==
X-Forwarded-Encrypted: i=1; AL+hErFYzCKY/xHLgepiIqAvHeEFMqXnxYNl38wOkKxs7i6G4+qVnNdzcaig43aXJ+sTw/pvSVg/kuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OaX9GB/10KErt4F3l9jtGCRhlLE6WcDJcyz5Tng7+NwrP1Aap
	q1pHFgyl+Myyux5rKOU/2vK6xOZ4kEP+RbnoGdJlYDbOYIpNvCL5fw+2
X-Gm-Gg: AZFdTZeBj/F9OYR99TZ+dgNFyM/Z6echt9HQliXape3csy2HXJnoYr899+0GEYEqyyO
	sqJ5BHtpI7KnmyysEjH2yp6XfCtcPGf8OKDZmP+mU6WI6rQ0nHl145YSi/Wzg+II2YFwZz6ojv0
	6Jz5S+krbf1FVLAvwNC23II22sRlwvpJge+Dx+/zsO9G8+voaRWqI/e7rm6VV2VLVOO4DrBkW9O
	/+l6OBm84K/Uzn55pACmi412M1YOniCwPnZlsdkT9KTvG/rROQV0e4TFgcu21HVHJxMkA1gWy8L
	P2NLgg29Vk1feigb/7Mag67L1WTEM3dOmZGMvh+EbeVFH3APlGKuRv4o7ArXTpgt5bSRMHNopRF
	wvABM3+THuoNrKJUD6gaz9w9Y5nKsq255vWF7Bo0ISB5iF6v099Ig5Aci62L5Rto+zfCF4uVA+v
	WVntdGEl1YViIcn7dNuCZp+IkiVjjALVV5UYREfnl0yZ6EgHyVn73td0Z2Ksi2+3LpuecQn3lGB
	RjHpRnl8G8nByHuyRXKFCNuSB6AcJrOuIIy/olbJ9DUQ5ftcF4Ux9NnhDOV4VzE/gvW9K1emQ9a
	HEv4vZZtP5CE7tBNiJ/ubzcLJQ1avwTqOG0=
X-Received: by 2002:a17:90b:134e:b0:3b3:c2bf:de33 with SMTP id 98e67ed59e1d1-3b41c93a017mr4349532a91.40.1795231944761;
        Fri, 20 Nov 2026 19:32:24 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:50::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d6349bsm9949306a91.9.2026.11.20.19.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:24 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 4/4] eth: fbnic: wait for both TWQs of a Tx queue to go idle
Date: Fri, 20 Nov 2026 19:32:15 -0800
Message-ID: <20261121033215.1020506-5-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
References: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

TWQ_IDLE, TQS_IDLE and TDE_IDLE have a bit per Tx work queue. Bit 2q
is for TWQ0, and bit 2q+1 is for TWQ1. fbnic_wait_queue_idle() only
tests bit q, which belongs to queue q/2. Thus, the wait covers a TWQ
of the wrong queue (except when q = 0).

Test both of the queue's TWQ bits in those registers.

This bug was found by AI and verified in QEMU.

Forced TWQ1 of Tx queue 3 to never read idle in QEMU, with rx 2 tx 2
(queue 3 is the XDP Tx queue of rxq 1's vector), and bound devmem to
rxq 1:
  before: bind succeeds
  after:  bind fails with ETIMEDOUT:
    wait for queue Tx3 idle failed 0x0800(0): ffffff7f (mask: 000000c0)

Fixes: da43127a8edc ("eth: fbnic: support queue ops / zero-copy Rx")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 32 ++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 62b67940c13e..fe769c33b117 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -2532,36 +2532,44 @@ int fbnic_wait_all_queues_idle(struct fbnic_dev *fbd, bool may_fail)
 	return err;
 }
 
+struct fbnic_queue_idle_reg {
+	u32 reg;
+	u8 bits_per_q;
+};
+
 static int
 fbnic_wait_queue_idle(struct fbnic_net *fbn, bool rx, unsigned int idx)
 {
-	static const unsigned int tx_regs[] = {
-		FBNIC_QM_TWQ_IDLE(0), FBNIC_QM_TQS_IDLE(0),
-		FBNIC_QM_TDE_IDLE(0), FBNIC_QM_TCQ_IDLE(0),
+	static const struct fbnic_queue_idle_reg tx_regs[] = {
+		{ FBNIC_QM_TWQ_IDLE(0), 2 }, { FBNIC_QM_TQS_IDLE(0), 2 },
+		{ FBNIC_QM_TDE_IDLE(0), 2 }, { FBNIC_QM_TCQ_IDLE(0), 1 },
 	}, rx_regs[] = {
-		FBNIC_QM_HPQ_IDLE(0), FBNIC_QM_PPQ_IDLE(0),
-		FBNIC_QM_RCQ_IDLE(0),
+		{ FBNIC_QM_HPQ_IDLE(0), 1 }, { FBNIC_QM_PPQ_IDLE(0), 1 },
+		{ FBNIC_QM_RCQ_IDLE(0), 1 },
 	};
+	const struct fbnic_queue_idle_reg *regs;
 	struct fbnic_dev *fbd = fbn->fbd;
 	unsigned int val, mask, off;
-	const unsigned int *regs;
 	unsigned int reg_cnt;
 	int i, err;
 
 	regs = rx ? rx_regs : tx_regs;
 	reg_cnt = rx ? ARRAY_SIZE(rx_regs) : ARRAY_SIZE(tx_regs);
 
-	off = idx / 32;
-	mask = BIT(idx % 32);
-
 	for (i = 0; i < reg_cnt; i++) {
-		err = read_poll_timeout_atomic(fbnic_rd32, val, val & mask,
+		unsigned int bit = idx * regs[i].bits_per_q;
+
+		off = bit / 32;
+		mask = GENMASK(regs[i].bits_per_q - 1, 0) << (bit % 32);
+
+		err = read_poll_timeout_atomic(fbnic_rd32, val,
+					       (val & mask) == mask,
 					       2, 500000, false,
-					       fbd, regs[i] + off);
+					       fbd, regs[i].reg + off);
 		if (err) {
 			netdev_err(fbd->netdev,
 				   "wait for queue %s%d idle failed 0x%04x(%d): %08x (mask: %08x)\n",
-				   rx ? "Rx" : "Tx", idx, regs[i] + off, i,
+				   rx ? "Rx" : "Tx", idx, regs[i].reg + off, i,
 				   val, mask);
 			return err;
 		}
-- 
2.52.1

