Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159134;
	b=EVq+w2YuMWnMxdAruKyaNZFqbFGznBHyjwZskiS2Vhk2IS+51PriY760q9GUwMyYpM70
	 uUMZN4GZHVE321bn58FskO+H7wPqR2RLO/03xUVo5XJZ1LKSjf8lbgi4BTrJHChnnlL8q
	 KuojIIZoGl4/tje5a2rZXEzl3gAJF3SAri2OwR8Ry+46YNgUE7j5rZRdRoK25FPwYHQr/
	 wx6HOcBb1SI7uhVJNrRe/q0BIlIFivEGEhNFnZEpJRuFLr0h8viupxdYwiP5G5yjnbZQL
	 +6VgMGlGRmnr1yOuAUqidGIpEDAGsdYwVnCGYTk9MDK6wldwD/XIaKkOYgTfeWwLE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159134;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=1jg5g40uRe95QMTb7SzoqnIxvWIssVUPLqvxnjEB+Ok=;
	b=flLaJ4KvTtfEdxW+sNmHKkGwHUz0CPJPf0XSrerwTKx508fpOxMUs+FmZRMtUXL4YUaR
	 QX/EUUcTOFwzg9l/6VpnQe1M5vDHBUnKnhDYxoJHwyuNghXO5f0UVUwLUmuvj+H+c0THI
	 mrsJANoAlWgjLXGv6OWQVM6092Umi9MeG8xff8tMqkvOGxCDF84rCEoy/5DqDvoyWRvS6
	 olAfIXOD9Ge8/ja+rk7lHxXpxDiR28jyczhLB0H28ZyrS7ZtlZWOGArUoSfMaTmLcYH06
	 jjqGH18Qakg9+lB17QJi8UKFcCKKlsbIbCNaNy5InqEbZsmz8CqKw0fXPkIc2BsnFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gJJ9Dvfx;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C90606A336
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C90606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gJJ9Dvfx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1j
	g5g40uRe95QMTb7SzoqnIxvWIssVUPLqvxnjEB+Ok=; b=gJJ9Dvfx3Y1FF84y9b
	gPbGUHrFTdb9pYljPe/2JKmAsRADTAzi/F6UUqpeb6YaF+H0jMpwH+HMN3ZiOKUc
	o8C9hbhlZG5xs/fhwOC/vPwFaWKIQ1YMkfJHoT+icVPwK1D6CUMSHbKw8GUGaXbH
	u50REKeCSNj880CPWNVONYSrM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD354ZD9P9qmowxJA--.12595S5;
	Fri, 20 Nov 2026 15:18:29 +0800 (CST)
From: Longjun Tang <lange_tang@163.com>
To: mst@redhat.com,
	kuba@kernel.org,
	eperezma@redhat.com,
	jasowangio@gmail.com
Cc: xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	tanglongjun@kylinos.cn
Subject: [PATCH v2 3/3] virtio_net: add stalls per-queue statistic
Date: Fri, 20 Nov 2026 15:18:26 +0800
Message-Id: <20261120071826.198604-4-lange_tang@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120071826.198604-1-lange_tang@163.com>
References: <20261120071826.198604-1-lange_tang@163.com>
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
X-CM-TRANSID:_____wD354ZD9P9qmowxJA--.12595S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1kWFW7Ar4DXry8GFWDtwb_yoW8Ww43pr
	45A342qFyrXw4xXFZ3GrWxX345Jwn3AFy7Gryaq34ruFn8Gr1FyryFgFWjkFnxArZ8ArWj
	qwsYv398Jayj9FUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVOJ5UUUUU=
X-CM-SenderInfo: 5odqwvxbwd0wi6rwjhhfrp/xtbC-QXoF2r-9EWNbQAA3D

From: Longjun Tang <tanglongjun@kylinos.cn>

Add a stalls field to the per-queue RX statistics and expose it via
ethtool. Whenever an RX queue gets stuck, the NAPI poll increments
stalls, so it counts RX queue stall events.

Signed-off-by: Longjun Tang <tanglongjun@kylinos.cn>
---
 drivers/net/virtio_net.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 15191b841a60..61d51c5a50ea 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -134,6 +134,7 @@ struct virtnet_rq_stats {
 	u64_stats_t xdp_redirects;
 	u64_stats_t xdp_drops;
 	u64_stats_t kicks;
+	u64_stats_t stalls;
 };
 
 #define VIRTNET_SQ_STAT(name, m) {name, offsetof(struct virtnet_sq_stats, m), -1}
@@ -167,6 +168,7 @@ static const struct virtnet_stat_desc virtnet_rq_stats_desc[] = {
 	VIRTNET_RQ_STAT("xdp_redirects", xdp_redirects),
 	VIRTNET_RQ_STAT("xdp_drops",     xdp_drops),
 	VIRTNET_RQ_STAT("kicks",         kicks),
+	VIRTNET_RQ_STAT("stalls",   stalls),
 };
 
 static const struct virtnet_stat_desc virtnet_sq_stats_desc_qstat[] = {
@@ -2982,6 +2984,12 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
 		u64_stats_add(item, u64_stats_read(src));
 	}
 
+	/* Count a stall recovered by this poll. */
+	if (rq->watchdog.stalled) {
+		u64_stats_inc(&rq->stats.stalls);
+		rq->watchdog.stalled = false;
+	}
+
 	u64_stats_add(&rq->stats.packets, u64_stats_read(&stats.packets));
 	u64_stats_add(&rq->stats.bytes, u64_stats_read(&stats.bytes));
 	u64_stats_add(&rq->stats.alloc_fail, u64_stats_read(&stats.alloc_fail));
-- 
2.25.1

