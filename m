Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994223;
	b=kLRTdDe3ACI/uAB7C7RjA6S6OS8rxV3uYfTvAoovEk1mqF0x0CBBa0bTiMQkQUI9GotY
	 q2Ek061nJ3Wv1BNF2EBjHupn/4evdl6NqXRHI5jCEWVykE8ICQgaYT/GLorvgdwGw8UoU
	 lT6z9X2pd3vBHUw+JHuPtd4D6xd4tJwRjgsFBCoZDqJAOLZieM/mnVZzbgJyX855tFSXt
	 koT4M4dO6SNpCJNnxlpYiUyc/Cvxn95Ww9zyh+rirlZz7CZJcyJcTQBIPvERYxBtX3Xou
	 aqCABQAbmRZ+s29v/s5GocGm6cyOz5aFLUrsKKgnzPe8Vs7dmjUzrC7x0sHycn/D6+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4JokObtDzUrFl/pinDn1cdhUhPdmnO51ztdKRPM0bE=;
	b=eHka2e/B76BZWpyCKJfXQJZOEcdVulrl29QBM84diTxm5x1wEbB9jXfrDFtqMGzqyiJn
	 RAp8ZHkrcfu/Zdc350kf84oHmvYHeCOacETQ/BTGSNVegcimnGFvWq64ziZ/EHtWeDp7/
	 DKWXQnVkEG9zcGSFIKa2wCgO+eu/bFMFGj44PAo5wHxlss7JOs6kU2xuHYuthdm8V8Fya
	 vqcy3H80B3cSmPjGqcYGiqOvsDXI24z6mi+fdhUDvD4zRo8Y58ojcn69t3BETjkARr0b0
	 +zGDa8i5c29VfFcA3+KY1KRPn/qdf9LsYlMt5VMX5fFo0ZM1QwTKDbTz/W18cFhoW+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYhDbjlU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A6F606A885
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A6F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYhDbjlU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6419745e9.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994222; x=1795599022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4JokObtDzUrFl/pinDn1cdhUhPdmnO51ztdKRPM0bE=;
        b=zYhDbjlU6WNKwwXizVO4t1TA/uCC+J2rMmefaOybcw5lad1TYYDHB2Rk56nymKxkw+
         qaJHNLumbuLSF3GWiUROmR5pAk4lXvxk1a8zkGRygJoxe/KLO6X8D16ew88+g3336AjL
         TRHPXSU4MXl6MqwjV4k2rgKHQABImgHuThq+MsXmAxnIZASK1bGlGGAVMztyJxvcupC6
         94lZfyDuIB2vrUQ1POmiZ37eCdTBrpw7E0M3m7FRry7Y0DXfqp61trsSw9g2vQxNJPvq
         6hnVKMyO17KTCUBM3D9PI/useezAwoGV7PJRtv6ygkNleQ7AVvgjGiuATXPrbWTunFYS
         7Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994222; x=1795599022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4JokObtDzUrFl/pinDn1cdhUhPdmnO51ztdKRPM0bE=;
        b=tp8509wxrn6Wp6Ex/99f2JLwr5Hw+rqvNQGny/EHE+1drIsVmqQYIu+8yJRzfK4tN7
         zeZpxPzHHv3vi05GVvYp6Y+GfsIY5ul41bJISNlOCLX3jh76BoVy3HOMrGnZ0U9zFrgu
         CbEU6MquAqiDA51P6dRSKb5Dxogc4X17w1AseKaWfBfanYfQIpsLy7u8IyZZPLzkmdCp
         XkW2fRk6mzSEQSSgoYh8gsERGnEtcBQRTkyV0UAojI5U2IlGCQtJX3zJZdCwVlw93rdm
         DovbksaSQoL2JdKlOPqkeblCX3KQRV87WDqut62ivXKM3vUwnMajS27sVC1eCheO45d4
         UqCQ==
X-Gm-Message-State: APuU4Z9k3Y1DkUAUWaGH8xdMummxDtroY8ExD9LKHB8zPhQF1Lx8zGRm
	ELOKbUFWgPvhEY7YrJ+W+vlyGp8vSfpnqFcrRiUdRt8MbW2FL+M97z1lzjR5sqUu
X-Gm-Gg: AYBFou17dFepAZdFq2HAq26tpqHYzMy9adenrA/0mM/oAMxSd3u31sH3mg/wNcoIWfi
	y/lZhkz1d943D7dKCc3D5m1ViH6vjg5nsDuR8KJHWpWD4T+xIYVaqTMVpOUC1koYx1fCnjlre35
	X4z8PQv5LlGBD4eThhix0oHGYhwIJU7DSqjrFHqB99WxyXwEh+CEg2LtChgkPhFbMPVxW4eIH99
	hMt3KNvR1vUqpSP+zJzKWbGZYEp0+5NPbjaKSUG63P6l3MlGL2pyrY2UK0intBjFIlOD18votAX
	TlaMcKn/qLKgBHG1nEoz0DBXAJBO2xoTd+3OruMbQeESmZ3oLaZoK6B5VAFo0La6gTLiFt0HKmN
	6cGeP22UidsFEuP56uKfqo2NPw2SAAq/0ZWVf4NqnKQFydNVlufXqzsKhl0c/DXcuJFZQ3Ovz7c
	rTDKUStu90nDQuMQqqhPdDTVhUmOUFW5KHAry1+0GkPtAM0gn81OKU6uyA1/4Bk7l6u3TTYGxOq
	rrkK1KW3Pk49zneyQh32NY7Rfz+WZp5L7WiJHUWt+0SCsHu2JE9DplCgXW2nB/O7l6F+RfYPKSq
	g5N+jIOHRDJwI5iz6x+V5BBulCYyuoVMY9hK/wSYCOS1r2shb1geuZk8QuWuVoftpcZIHgaMqj9
	yDvcqjuG21aM3hLwslgN6CCjFZgj9tIpdujQctYQdwxhQG9lj6pdEMEZd2HrL7rWHBheOZX1ApM
	jQp1liRnW/QMaKQLUerPzu56TpY73pX48FflvXkSahxzQ1JdaknmP7
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr42618135e9.11.1794994221580;
        Wed, 18 Nov 2026 01:30:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 4/6] net: mvneta: keep the TX rate limits across open and MTU change
Date: Wed, 18 Nov 2026 10:30:10 +0100
Message-ID: <20261118093012.90121-5-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
References: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
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

After the interface is brought up again or its MTU is changed, every
per-queue rate limit set by mqprio runs at 10.23 Mbit/s, whatever rate
was configured. tc still shows the configured rates.

mvneta_txq_hw_init() writes the token configuration of the legacy rate
limiter for each TX queue. On the Armada 385 this also sets the refill
value of the queue's token bucket to 1023, which is 10.23 Mbit/s at
the refill period that mqprio uses.

Remember the refill of each rate limited queue and program the rate
limits again when the port is started. Resume also starts the port
with mvneta_start_dev().

Found by an AI code review agent while working on this series, and
confirmed on a Turris Omnia (Armada 385) with 1 Mbit/s limits on a
100 Mbit/s link. After down and up or an MTU change each busy TX queue
carried about 10 Mbit/s. With this patch it is back at 1.0 Mbit/s
after a burst of about one second, and the limits also survive
ethtool -r. Resume was not tested. No kernel selftest covers the
mvneta mqprio offload.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v4: Moved before the validation patch, so it applies without it.
Discovery statement added.
---
 drivers/net/ethernet/marvell/mvneta.c | 31 ++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 76dfbc484269..58453c69be36 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -683,6 +683,9 @@ struct mvneta_tx_queue {
 
 	u32 done_pkts_coal;
 
+	/* Bucket refill of the mqprio rate limit, 0 when not limited */
+	u32 bucket_refill;
+
 	/* Virtual address of the TX DMA descriptors array */
 	struct mvneta_tx_desc *descs;
 
@@ -3752,6 +3755,8 @@ static int mvneta_config_interface(struct mvneta_port *pp,
 	return ret;
 }
 
+static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp);
+
 static void mvneta_start_dev(struct mvneta_port *pp)
 {
 	int cpu;
@@ -3760,6 +3765,7 @@ static void mvneta_start_dev(struct mvneta_port *pp)
 
 	mvneta_max_rx_size_set(pp, pp->pkt_size);
 	mvneta_txq_max_tx_size_set(pp, pp->pkt_size);
+	mvneta_restore_per_queue_rate_limit(pp);
 
 	/* start the Rx/Tx activity */
 	mvneta_port_enable(pp);
@@ -5212,8 +5218,10 @@ static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 	/* The token buckets still limit the queues, refill them at full rate */
 	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
 	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
-	for (queue = 0; queue < txq_number; queue++)
+	for (queue = 0; queue < txq_number; queue++) {
+		pp->txqs[queue].bucket_refill = 0;
 		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
+	}
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
@@ -5239,11 +5247,32 @@ static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
 	val |= (MVNETA_TXQ_BUCKET_REFILL_PERIOD <<
 		MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT);
 
+	pp->txqs[queue].bucket_refill = val;
 	mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 
 	return 0;
 }
 
+/* The TX queue setup overwrites the rate limits, program them again */
+static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp)
+{
+	int queue;
+
+	for (queue = 0; queue < txq_number; queue++) {
+		if (pp->txqs[queue].bucket_refill)
+			break;
+	}
+
+	if (queue == txq_number || mvneta_enable_per_queue_rate_limit(pp))
+		return;
+
+	for (; queue < txq_number; queue++) {
+		if (pp->txqs[queue].bucket_refill)
+			mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue),
+				    pp->txqs[queue].bucket_refill);
+	}
+}
+
 static int mvneta_setup_mqprio(struct net_device *dev,
 			       struct tc_mqprio_qopt_offload *mqprio)
 {
-- 
2.54.0 (Apple Git-157)

