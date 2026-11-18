Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994219;
	b=IBDjypoftSUqMXvXEmjvi14Ccu/xevMI9MXGGX0L5kv1L8oXEP4+7mWx9MocRzPq6n36
	 eQgzMVI6ACQlyUu45hwJ4fQgB/DUT/uJwUUlliDVGsL16Dccj7MuK8UZC7KCZGSFUpC53
	 xR8yyg/oTXAkXiOvbfqGZFEs84KVUPPrjx+pSvgxr/QWfknFnj5sf+1vCkf+Ly1W9acvl
	 EbZg1+eUIViV+fxt/YZ+yv8iuRpUpkEznzd40bIW0fML6R/p/6n/oMUOnEHQ1MPYt9NHF
	 nH5nagPqNVOlFw4/BFlXx32/0bI2O+1ZWKWR4aHKDh6jLJI8A4S5B/XldJV4uKF5JIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Za5GsguGpH2+D7x/UAp4r9tFrYUeipKYvFh1Jm0R8A=;
	b=YIfTVTLpDWeBPGP7SF4NvXQRSkRQUSI1WllrkXvb8rXkDOqRPDOx8LLLFaYpwjd6Vd0j
	 RWTOO9Iab98XRarbClJ6mWHMfcxj6gtHTG6LGWTh8diwTfpBqElyUc+BvLpQ4RPY6w7ts
	 LnWZVCDv7ZzTtZyCzDD2EBnKlqYtMcz8c5YtlhdSoFsx/m69LWYoF7MBOgr+1d8xezbZ8
	 0ZJurIgh2pLnI4sztxB40AW4NhZIs3oxsc6ibJQXgLEZNTz0VQVepmRuznjoUu5/vciAZ
	 sYymm5FqQ25RtAzE+AwolxE2xlnzFc1jeUYlVLxtczmLFbBeJM6ErjsevARM/94/c+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJqvafZF;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E24606A33E
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E24606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJqvafZF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so374016f8f.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994218; x=1795599018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Za5GsguGpH2+D7x/UAp4r9tFrYUeipKYvFh1Jm0R8A=;
        b=dJqvafZFWfd9Kv8QinkmiAdvK0KfhoCG7+B8wLbP7IkZqASDvDC2IjajNa0icO2Anx
         Ey6acPvwxuAGmRBaK8F2mJTGG6WMOFL3U/RSfInwWG16DGhcQKLKc9MxDUTmEg359rqH
         qhJPORzj8uxSliu+P9SI3ZzQwGS6dJKRHlsjPs1WXgBF6W2CZ0ZLTnz//A82fDBSOI1+
         Ohiumgq4XGse5WLhVlZzIQ9lCuGPVJOudz8saHweOl7aH68QXYRLfFEbyR4I4MSBeSlZ
         myT7yJNE7P9GnldLpvipAjI0HHCoZwLQFEcfZwVT0QEAJK6uUDufXS4X2ZJr9bp25Dd0
         icmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994218; x=1795599018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Za5GsguGpH2+D7x/UAp4r9tFrYUeipKYvFh1Jm0R8A=;
        b=1VDvocjoXg7JqxI08yHHOAPihqLWARBXGdVWn9NnxGDBd9FVdGfnetUFG9HrCVIzuO
         7LXyBb/BK7qkmGVgv265f/4/gyzDmbqSAK8voitKwXGyZb8dMQSWnS5QQA8l9NG6BhH8
         /qAhVg2mVcZAl/9/CJXOiNgh17TfpGYnCBJ0DzVZ2NdYTvQkiQecuE1+8l2nlGIs7vEq
         JN0HpAkHsRr8Q9E2HVFCmiW3PCZ1mFa88NYs4Zy+u1hJsO0plSKFDtxvesbbxfEKw8lP
         xXiyTofJu5kPUzbaj1nvtbNWRfodDeJ1ey+jmt8lKjpYxWXdkgxFnn7CzMujS99N9aWk
         gCyw==
X-Gm-Message-State: APuU4Z9s61ILGrtNh/0KKbo3Wsoujoce9j7fTYF6VkEwigjIe/lIWEi1
	3avCWLPQ3BKs6/0W0zu/MZ0PfnnRAA68s/OtRXHXPRUS6IXOeAWfcSkXDPZWcxuq
X-Gm-Gg: AZFdTZcvBV/JFlRR6djctECOuELp0du5mXKG5KtGvpsHugfXbTaNUf/bO2rWyd3pblS
	VISu0MjUufrzuHrU0jzgtkDQ8EIGxvzo4PWAgb7lQUdtWU2gY/7oUIH7lPbpaKvpqQvxE3iQUsv
	sc1LbtS2GPco8Py2QsK8Y+seRXpZVQcKMYeI7hzEafVIRlzykZWOu+aSvrDuOywrW3cSqrBqzX1
	nQgIaR3UFF7j3bR3Cl17N3KzT4onXoCjRaBcQp80DZrbYKyDEYTzQeOlin7uod1YQBMn38n/LZy
	a2j7bTY8WyT5NygOBObuqybZI6ZSi0rIUtVmHs+0GC1v4F9hdanPXr5b/ZyvMzlXjUf/9TW6wiN
	eIPGVQqjMkXPhnfUgr2E5SfWhm5AsO/5y2kaKDksgouGxipsUmaR9bNbLvyjStbS0uSTad2BEJq
	BL13C7dMm/M9GgB7JFNrR8ZlU4h+XY/0RDk+L3ZN7S6wNJXoPbklEIo5rV51G8/4DQDQG19qDPD
	Gw9Ny4rpOYceX1XCrcKRwKLnktTyuV19LkFgppJ870fjY3aEtDTt5NP3jSsJpDbKU1+AN4orsp3
	eEfVmVcmPLCdo7U65/TkJl0d9QP5vtmY6h1xhANuZ6g69SW5nzAIocXprXtnIv+py1Uk6hLY+Ip
	S4U22tgYWVk24myZHwhoojqlPFwYrqXhdzbWifHlL2t8aHq6EaMHDoj9s0mKyF5EYHWVURee4Uo
	FEPko6KlcWYn/Jk18+YP1atbFWjHmXSmNu4kGEdwAG8Souqr6cULR96NKogoOw+AXygYTuF0xm5
	Q==
X-Received: by 2002:a05:6000:2512:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-4a63c374724mr4906279f8f.53.1794994217656;
        Wed, 18 Nov 2026 01:30:17 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:16 -0800 (PST)
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
Subject: [PATCH net-next v4 1/6] net: mvneta: lift the per-queue TX rate limits
Date: Wed, 18 Nov 2026 10:30:07 +0100
Message-ID: <20261118093012.90121-2-pepe.schlehofer@gmail.com>
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

After the mqprio shaper is turned off, the per-queue rate limits stay
in effect. mvneta_disable_per_queue_rate_limit() only changes the mode
bits in MVNETA_TXQ_CMD1_REG, but the token buckets limit the TX queues
in that mode as well, and their refill still holds the old rate.

Refill the token buckets of all TX queues at full rate when the rate
limit is disabled. Deleting the qdisc reaches this code only with the
next patch.

Triggered during code development on a Turris Omnia (Armada 385) with
a 100 Mbit/s link:

  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1 \
    mode channel shaper bw_rlimit max_rate 10Mbit 10Mbit
  tc qdisc del dev eth2 root
  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1

Each TX queue then stayed at 10 Mbit/s. With this patch and the next
one the link reaches 94 Mbit/s, and 941 Mbit/s on a 1 Gbit/s link. No
kernel selftest covers the mvneta mqprio offload.

Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v4: Commit message only, commands and discovery statement added.
---
 drivers/net/ethernet/marvell/mvneta.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 915c4c35364a..c0abc843b1c1 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5204,9 +5204,16 @@ static int mvneta_enable_per_queue_rate_limit(struct mvneta_port *pp)
 static void mvneta_disable_per_queue_rate_limit(struct mvneta_port *pp)
 {
 	u32 val = mvreg_read(pp, MVNETA_TXQ_CMD1_REG);
+	int queue;
 
 	val |= (MVNETA_TXQ_CMD1_BW_LIM_SEL_V1 | MVNETA_TXQ_CMD1_BW_LIM_EN);
 	mvreg_write(pp, MVNETA_TXQ_CMD1_REG, val);
+
+	/* The token buckets still limit the queues, refill them at full rate */
+	val = (1 << MVNETA_TXQ_BUCKET_REFILL_PERIOD_SHIFT) |
+	      MVNETA_TXQ_BUCKET_REFILL_VALUE_MAX;
+	for (queue = 0; queue < txq_number; queue++)
+		mvreg_write(pp, MVNETA_TXQ_BUCKET_REFILL_REG(queue), val);
 }
 
 static int mvneta_setup_queue_rates(struct mvneta_port *pp, int queue,
-- 
2.54.0 (Apple Git-157)

