Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994225;
	b=LmaQH2J7RrnHa2e4u1FcgJVAYJKzteVZZyyt75Qc8vvwHfViQBmcF4HGrRgEtHPZfkiz
	 eErNIBiOnXzIDD5tXMLmzycWbXcR0dp9TwVlvd8KFgpdh0wZPtDX/wWom83SccbZvhDY/
	 JvQWfEhTzUgkOv26qm+WalC8SFHqd3JJiAaElvON4kkheOC2csWEIonE2mgt0pK6uViwR
	 TL7NXpgjfXjcGRTXvFWEmQUUVgrwQu82K0Soogic3txjBcpuJKoiy2FhBa/6Dvj2sznht
	 6sV2GEe0mbN3/0OaSC8I6EW6sT+aI5pd3Vmi/t2Nij39AI3F4DLI9W7TG/DF05hdNhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UCp7aENN8X0x2F8gJ90fh4ZzYrhVBqarNDH9ecBgn+I=;
	b=Zge6E716pmIDP+zBo6ttAJNOeKZUhkVeMZ3JNnwSK9S1Ig3RKfZUsi/nFFhY4gs3YclH
	 X1ngBeS0k9VXUhE7eGPXxbBT0p9aOUYdk7LUur2hFASKmQljxOnTXRa7Pd9oz+r4yXbhT
	 S4VkAj1Nu1QFcTkpB8x6Zi1U/OFMyRWL9QHuMIUw4c6SsjT705Cf9z+8mQq4fiePopUNk
	 DduZ7SSG/ZBj87JZWBVhAE9wb5AYOQgOd1hrvJz/rG2RQEu/RsVGK6rfySwJzpook7zar
	 rf/xD74YdosT+RuNtCdvCnOncTMX/cuDSbRfoum3KFEfk1P44zWouc0DthDQKotGs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0cOFNPT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F4606A8AB
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6F4606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0cOFNPT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso5282785e9.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994223; x=1795599023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCp7aENN8X0x2F8gJ90fh4ZzYrhVBqarNDH9ecBgn+I=;
        b=M0cOFNPT9+7SNTwaq8Q3znIAI0ky2LpO6+v3K5fO+6bNrBB41HTCN3o2q5NVukdN5n
         wLGFLGPDpLm2DV5Dj5XD69A6jNpbaILUGg6G9TeKbthWV5hTJZZIoiaAaGQdNCWFds8o
         Tmd636Iu07MWxe/BVhxzrsfUYz4wshEGLVfifaRzo5rnpyI/r5uI0hM4wtF62c77asdl
         m6giIGY9x5OZAA9Cd+t7QpiuSxmdEx3//rOfPZ4vFTwnnZ1606BgjE0rVTPX9q0az1YX
         b7nt37LXkym+2sW0zjzTqDLsZEA8sVQwyoYuH/ZYCMe4BuyJo0II7VM/mlx1d3l40U5x
         ZK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994223; x=1795599023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCp7aENN8X0x2F8gJ90fh4ZzYrhVBqarNDH9ecBgn+I=;
        b=ffcwtj2lpyac/ZHICNAZ3Cj1VNxpzaDEVg9i/UUbAKLTMFyCCYIX0kejQUvjiIdfFw
         SZXBqHqVORuf/omPHHWCYrIR9ziJVg6YwwW534CxiB/yKBwRHo0npEEof7OIsC988srM
         1dmwDcZa5GPIoRX/ysLco9k37nNWua4aX39GXoih+jVQwdI28RayhRBfqL28CxjqSlaf
         LM1hSUZYmwS7TS/WdK7pwLs8+pT43MacBRUhSKMgiaP369WMrARCyPuP+0GtbZa5MLCu
         CcB95SvLffVkSD4D9o66SBg5IwnBX+ctMZ9uyk1KczFqBrP7DQxzxdrFYkp03sP9WrlZ
         UT6A==
X-Gm-Message-State: APuU4Z+QKoBvLS5V4V3B2UxDA88+igcQ70dFM9289Y++L7ubpTEFXmFw
	ZXk6QmwZMJSCjD0S+LoTQfWubStpgXG6M/mo3StfyeO3PtUKPn3hlqOAGJNyheff
X-Gm-Gg: AYBFou02mJNldGzo+JfwPDPNL+I8p9oIAka9uQLDuZnKcvzB4w+9umch7OOxYFDOSaW
	f1Gj/cKt/ydczQPTu3evHpRj+8ROBexrov7uZi3wcsIm2QjEooI9dJfhXPLtinMJc25WJBTh7Dg
	TZROr54JhQ3ZpCjaIWGxDK4DXawB5AYmqnSRj82eDr4r8O5nMXwmn/M/euOnkOeQETTFwHgD/i2
	H8HKWEx+IMZXRAoOSO7ko9/e0u+ZdPu6m4RN67DCXfTJKHC+iO5/uhNkdLaZIOTLcjU3I2h9sf2
	32S8sDpz3qnHPsfEa7C24qsQlGNRPtwwLv66or8+HZ8/HjWws6xjvf7nZHRpYs0lcYaN0d1h3s7
	9J+OxBsZezCIjfzxDzj75leMMxLrw7zwrv8szCReLj9dpWY1w4RIGhBoK0hoPCkBY8PiD1LimeK
	V9flQAK5QONENxdUBA25tD0uoSpYcojmOpE5hCxIx0kNQ+zW+dL7zHOlKq+nBv1kffBx4b5EpDK
	a//uu0I0Z4yCRRzVfkLGPlTVYskKyZqp2iNAtqqqAWviEaNh6kn8kS3sHZ225juP675Zgb6JKn0
	kNPIisntclb5c41pSFV21XbfQ8wHCGpfpa9whGBT1gBz+PPWIO7eaz5iDQJfLlCf+sCPx5R5ByU
	bi1JJqijAZBavOKfyexFdUGwjrEK6iVdEmq13RuRi3gmIKMZ+mAftDZP3t7W/Moi/NMcoYxOHVz
	EBn5+B5zGEVslqniXXdp/A3+gSvkYDzuIX8T1F20geFU1XVUVxZJfa
X-Received: by 2002:a05:600c:1d26:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb7da1a877mr38156785e9.12.1794994222673;
        Wed, 18 Nov 2026 01:30:22 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:22 -0800 (PST)
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
Subject: [PATCH net-next v4 5/6] net: mvneta: validate an mqprio setup before applying it
Date: Wed, 18 Nov 2026 10:30:11 +0100
Message-ID: <20261118093012.90121-6-pepe.schlehofer@gmail.com>
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

A failed mqprio offload setup leaves part of its configuration in the
hardware. When one max_rate is not a multiple of 10 kbit/s, the
command fails, but the RX queue mapping, the rate limit mode and the
rates of TX queues 0-3 are already written:

  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10001kbit

mvneta_setup_mqprio() checks the queue ranges and rates while it
programs them, and the qdisc then fails to attach without calling the
driver again.

Check the whole configuration first and write to the hardware only
when it is valid, so a setup that the driver rejects changes nothing.
A class without queues is still accepted. This also covers a rejected
replace under a new handle, which runs while the old offload stays
attached:

  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10Mbit
  tc qdisc replace dev eth2 root handle 200: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10001kbit

The hardware setup of the old qdisc is kept. The rejected qdisc never
enabled its offload, so its mqprio_destroy() still calls
netdev_set_num_tc(dev, 0). Until the old qdisc is deleted, tc shows it
without traffic classes and the stack spreads the flows over all TX
queues.

Found by an AI code review agent while working on this series, and
confirmed on a Turris Omnia (Armada 385). Without this patch, after
the first command failed, TX queues 0-3 stayed limited to 10 Mbit/s
and the VLAN priority map stayed set. With this patch both failed
commands leave every register unchanged, and after the failed replace
the 10 Mbit/s limits of 100: stay in effect. No kernel selftest covers
the mvneta mqprio offload.

Fixes: e9f7099d0730 ("net: mvneta: Allow having more than one queue per TC")
Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Link: https://lore.kernel.org/netdev/20261022144814.66366-1-shawnq1@163.com/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v4: Replaces "unwind a failed mqprio setup". The unwind also cleared
the hardware setup of an attached qdisc when its replacement failed,
as Sashiko pointed out on v3 [1]. Maxime's Reviewed-by is dropped
because the approach changed.

The rate conversion moves to mvneta_txq_refill_val() unchanged. A
follow-up will tighten its range check for very large rates.

[1] https://lore.kernel.org/netdev/179418382346.994134.3211728825005845989@kernel.org/
---
 drivers/net/ethernet/marvell/mvneta.c | 90 +++++++++++++--------------
 1 file changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 58453c69be36..89ade2ed7ce4 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5224,11 +5224,10 @@ static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 	}
 }
 
-static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
-				    u64 min_rate, u64 max_rate)
+/* Convert a rate limit to the token bucket refill of a TX queue */
+static int mvneta_txq_refill_val(u64 min_rate, u64 max_rate, u32 *val)
 {
 	u32 refill_val, rem;
-	u32 val = 0;
 
 	/* Convert to from Bps to bps */
 	max_rate *= 8;
@@ -5243,12 +5242,8 @@ static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
 	    refill_val > MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX)
 		return -EINVAL;
 
-	val = refill_val;
-	val |= (MVNETA_TXQ_BUCKET_REFILL_PERIOD <<
-		MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT);
-
-	pp->txqs[queue].bucket_refill = val;
-	mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
+	*val = refill_val | (MVNETA_TXQ_BUCKET_REFILL_PERIOD <<
+			     MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT);
 
 	return 0;
 }
@@ -5276,8 +5271,10 @@ static void mvneta_restore_per_queue_rate_limit(struct mvneta_port *pp)
 static int mvneta_setup_mqprio(struct net_device *dev,
 			       struct tc_mqprio_qopt_offload *mqprio)
 {
+	bool shaper = mqprio->shaper == TC_MQPRIO_SHAPER_BW_RATE;
 	struct mvneta_port *pp = netdev_priv(dev);
-	int rxq, txq, tc, ret;
+	u32 refill[TC_QOPT_MAX_QUEUE];
+	int queue, last, tc, ret;
 	u8 num_tc;
 
 	num_tc = mqprio->qopt.num_tc;
@@ -5286,58 +5283,59 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
 		return 0;
 
-	if (num_tc > rxq_number)
-		return -EINVAL;
-
-	mvneta_clear_rx_prio_map(pp);
-
 	if (!num_tc) {
+		mvneta_clear_rx_prio_map(pp);
 		mvneta_disable_per_queue_rate_limit(pp);
 		netdev_reset_tc(dev);
 		return 0;
 	}
 
-	netdev_set_num_tc(dev, mqprio->qopt.num_tc);
+	/* Check everything first, a rejected setup must not change anything */
+	if (num_tc > rxq_number || (shaper && num_tc > txq_number))
+		return -EINVAL;
 
-	for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
-		netdev_set_tc_queue(dev, tc, mqprio->qopt.count[tc],
-				    mqprio->qopt.offset[tc]);
+	for (tc = 0; tc < num_tc; tc++) {
+		if (!mqprio->qopt.count[tc])
+			continue;
 
-		for (rxq = mqprio->qopt.offset[tc];
-		     rxq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
-		     rxq++) {
-			/* The range sets the TX queues of the class as well */
-			if (rxq >= rxq_number || rxq >= txq_number)
-				return -EINVAL;
+		last = mqprio->qopt.offset[tc] + mqprio->qopt.count[tc];
+		if (last > rxq_number || last > txq_number)
+			return -EINVAL;
 
-			mvneta_map_vlan_prio_to_rxq(pp, tc, rxq);
-		}
+		if (!shaper)
+			continue;
+
+		ret = mvneta_txq_refill_val(mqprio->min_rate[tc],
+					    mqprio->max_rate[tc], &refill[tc]);
+		if (ret)
+			return ret;
 	}
 
-	if (mqprio->shaper != TC_MQPRIO_SHAPER_BW_RATE) {
+	/* This can only fail before it writes to the hardware */
+	if (shaper) {
+		ret = mvneta_enable_per_queue_rate_limit(pp);
+		if (ret)
+			return ret;
+	} else {
 		mvneta_disable_per_queue_rate_limit(pp);
-		return 0;
 	}
 
-	if (mqprio->qopt.num_tc > txq_number)
-		return -EINVAL;
+	mvneta_clear_rx_prio_map(pp);
+	netdev_set_num_tc(dev, num_tc);
 
-	ret = mvneta_enable_per_queue_rate_limit(pp);
-	if (ret)
-		return ret;
+	for (tc = 0; tc < num_tc; tc++) {
+		netdev_set_tc_queue(dev, tc, mqprio->qopt.count[tc],
+				    mqprio->qopt.offset[tc]);
+
+		last = mqprio->qopt.offset[tc] + mqprio->qopt.count[tc];
+		for (queue = mqprio->qopt.offset[tc]; queue < last; queue++) {
+			mvneta_map_vlan_prio_to_rxq(pp, tc, queue);
+			if (!shaper)
+				continue;
 
-	for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
-		for (txq = mqprio->qopt.offset[tc];
-		     txq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
-		     txq++) {
-			if (txq >= txq_number)
-				return -EINVAL;
-
-			ret = mvneta_setup_queue_rates(pp, txq,
-						       mqprio->min_rate[tc],
-						       mqprio->max_rate[tc]);
-			if (ret)
-				return ret;
+			pp->txqs[queue].bucket_refill = refill[tc];
+			mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue),
+				    refill[tc]);
 		}
 	}
 
-- 
2.54.0 (Apple Git-157)

