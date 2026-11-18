Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994220;
	b=U9yfM+oXW4HfQMl+636QAvIDVjBKNZ/CdkWxnwyY00VB5GuZAV8rdVzsIZD9/1IToKeH
	 HCLMcv5rLB47ISI7z7Y4szJghJkEbqfxNrEHot9Ih1YxhPui1ebCeqmLDo9Pg/y2NHeH3
	 +bwyHOdSVAcNiT9H7KeCGtgXs/0p0b+cOB3WKZY447pYpyw7pJ5++LF2yFexz0NDs3Zi6
	 EwHputhCSm+/HmzeBukhAk3Qq+E/o/o0sEOFantwtyDekcOQNEP99g3sGIuB/v9lGlmQZ
	 4V8SswTSE0eSGi2JvsbSydl6RiRF9iW4wBz3zin1ekt6XntjDRV1uiTOOQe12fF22zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9QyEpxBvVfPvBVod3Et1pNl54XN/+FJGPYaqZZl9YH8=;
	b=C2TA07i+YkLlWgKqZgRbFWMwyDv+YNaHhNOJqkiFs/W/PLfh8WJi6MK2PFEJ21IKS5Vn
	 vy7+i0cnRFI0rr9h0eAOnbFVpGhUXvTrg7Cje8l8MNQnHwp94U6R5xfGMnSs8LBsehK6t
	 n8TG0bZBhHutv3xEiXdOoLAQlkuGho8u8VoNeuRUxZWa0Xdde98m2Dpk7ONNpc/9vzzJ7
	 djN487KhQuB4PVVsbK2EFUMNiuRUYS8V09kjHgy1AiulnuLa603MLpsnpzPloo+AsqvVD
	 LS0duQR0y+kgY+pxisMWB29RUcgDMz3+4J5LkvydMwfBHMTTPZGAeyshSQsZPwnypfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMFkwx7O;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBD4606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBD4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aMFkwx7O
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-497614c95f0so374026f8f.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994219; x=1795599019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QyEpxBvVfPvBVod3Et1pNl54XN/+FJGPYaqZZl9YH8=;
        b=aMFkwx7Oqop7x9FCbwLIgaw9pnwFHO4XYALgNg3pM3vdxdpybBpC2/476aw7/89GKF
         PCLqwY650++fBUaRR/X4fxI+NqWO9czb7gYwUhFvx+PNwnI6u7i3QSAZ4zr5jyCbgBfw
         yqL4me/5Uw6ofe6OEY4XZV0XN/KeXADavfJcFU5Pe1GrOVA7WSjK1+3vgH9ZoCRBEeH7
         GF0F5KsSFLKY+aV+zLAoTKGRUIP9YMOYy9ueEamnG1d3HGC4RTnOsUsEfEe9dCr/SH5E
         coh1Ns5gdoboMRoIbAI7XipVmHD60e8FkBCGt6UWEC2p8EXubVorVsyB/wW39UHIwBmf
         pngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994219; x=1795599019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QyEpxBvVfPvBVod3Et1pNl54XN/+FJGPYaqZZl9YH8=;
        b=NUNQ1IWKXDdn8SwXG7VW8HMWbgDMf3C5So7Q26wLPNjbXdqyP+WMJsNlZlW6ZZRa67
         TUWU/noe+GPHkBvbWCZykigFAUXvnZzRZJfUVEQMfjLvVkJC36BN+8vjF2E+74mC4F9O
         bf83YpJkSw1HGJrgKcQpQ/d4GElz3fOptKLnLOGTpwX8yE6rrqGqd50EF2jReRtn05Qw
         Nmy/68cxinGP4cgAHLwQ6Px7i/K2NwAm+KB/N7byXf4GsMqp6VX4XiW1UAz26oQ13xZy
         LmuTV65QdLfxRTPxB3oA3IduqLcSHaKZS0ctanwu4r6+h+my04Zd5fVOCCDJIX+Nyv2J
         pXmg==
X-Gm-Message-State: APuU4Z/NMT6GRLgn0H/ZHthJzn2r7lJaA2x/rj50lYWnNFdOP0GPk0fx
	O2i3za+QYuS5iNXjn1Tw09RkaQ5LGjZDQJ48N/75LL54I0kSUUBhL4F/VmDpLxDT
X-Gm-Gg: AZFdTZfXSQbT4Xc3twIU7th0BDwH5sJAUEiFiE5Wz7zWXgBVn8/vX20KKhNwitAHkLk
	H2AzARM3faLD7XLKf52YUt9cwK7VoVi7D6yfmO6sqKhthAWSudRgUETOdkYG/YbVyIUlti3yf6K
	y0BsW4iqcTbg9MafgUPh2zeHDxvQrcwo5qYlZKidlLDiqwz6Wt5v/fVMcwlDKtAfCYPPJABlTSP
	932KXePCcPaz/tnGcz/VuSHD3SHe+LDTk0djBUpzLDmlkDqIjkFudh6uoZnQ6CppmcUVDq6dWjU
	nDLLWgc71mJP2vnAAuXAxgq7/idfdjOdoLnRjmD5icPJ3aPvsgfapWV0gZnCoS+WT2aWlkw8jUh
	0/qd38nY10Ntgc6kPSr9UrQlGAa4quwUnfLRAXBXYCLaSq6+cF7ulVPA9c1MqPQiYUqXEp3M4SV
	kul3nEdQrLNjm5qHx38YQ7gVjxpacsx0ZhXDeq450Zjdfzqtlo5C9c+fO9MuisAKo0kA9ADxe4D
	/kNKgi5ztC29r1AirhPil63OIuEbOLjphL3Sfj0dWDJ08KgyaWwKxl6gHaNp5G9zDjSlmX6zaie
	W382OBKYZMD0TrFeWctD6vkwaMEXwngbDbcvx4CUrmWSqDh776+oPloOApthIPw/aw0CLY5LH9A
	Ay9BFdODeqPR50SIa4ULVls4oENCvqMjH1mxoJELUjAWVmYzKzxy9YBYT0BsVkm/X/ZktZmyB7C
	xHcRcbERufhSXt17jBJNCteWQfCyxScOGsCOkjaCv/JWZruAhoWBoR
X-Received: by 2002:a5d:5d0e:0:b0:4a6:f405:824c with SMTP id ffacd0b85a97d-4a6f4058560mr2734631f8f.31.1794994218862;
        Wed, 18 Nov 2026 01:30:18 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:18 -0800 (PST)
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
Subject: [PATCH net-next v4 2/6] net: mvneta: fix the removal of the mqprio offload
Date: Wed, 18 Nov 2026 10:30:08 +0100
Message-ID: <20261118093012.90121-3-pepe.schlehofer@gmail.com>
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

Deleting an offloaded mqprio qdisc leaves its traffic classes and
per-queue rate limits in place:

  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10Mbit
  tc qdisc del dev eth2 root

mqprio_disable_offload() passes an all-zero configuration, so qopt.hw
is 0 and mvneta_setup_mqprio() returns before it reaches the teardown
code. Check qopt.hw only when traffic classes are set up.

With this fix, replacing an offloaded mqprio qdisc under a new handle
by another qdisc with traffic classes loses them. The replacement is
set up before the old qdisc is destroyed, and the teardown call does
not say which qdisc it belongs to. The old qdisc's teardown therefore
clears the traffic classes of the new one, and for a new offload also
its rate limits and RX queue mapping. tc then shows the new qdisc
without traffic classes. The core does the same when the old qdisc is
a software mqprio. A taprio qdisc left without traffic classes sends
nothing.

Triggered during code development. Reading mvneta_setup_mqprio()
showed the early return, and the commands above confirmed it on a
Turris Omnia (Armada 385) with a 100 Mbit/s link. Only TX queues 0-3
were used and the link carried 19 Mbit/s. With this patch and the
previous one the queues above 3 are used again and the link reaches
94 Mbit/s. No kernel selftest covers the mvneta mqprio offload.

Fixes: e7ca75fe6662 ("net: mvneta: Don't force-set the offloading flag")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v4: Commit message only. Commands and discovery statement added, and
the replace paragraph also names the rate limits and the RX queue
mapping (Sashiko).
---
 drivers/net/ethernet/marvell/mvneta.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index c0abc843b1c1..06b5453543a1 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5251,11 +5251,12 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 	int rxq, txq, tc, ret;
 	u8 num_tc;
 
-	if (mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
-		return 0;
-
 	num_tc = mqprio->qopt.num_tc;
 
+	/* On removal the qdisc passes an all-zero qopt, with hw 0 */
+	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
+		return 0;
+
 	if (num_tc > rxq_number)
 		return -EINVAL;
 
-- 
2.54.0 (Apple Git-157)

