Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994222;
	b=dsHEN/aY0MJmSGyBDRHCmtY5OW5UKbHquc3S+W0OIEkDkqrZkSq8NnLdT5xjtIMbmYIc
	 T0NgyFL6D3sDiDbU0nkvBaR4dtCSYU8OUiL3COa9x0e7isfSKV72iL5z5c7AzU/wrvvmy
	 AuzqArKZt4UyQfENrLKBffXCdeKFhK9NwHmyJNmQzy0ag0WB/5mL3Ai1akhxPNhUrUe/H
	 mZ1ZMoT8APvP1Sbxjt5rz4JDuxscFZ0GMWu4w2aj8HekRS1gQ4Q0r+FLgE97uKFkwQjVi
	 JmfeLLp3HsVIBZ1CogURYpaqPpDQ0Krrho/pBehUl5xnx23B/15WQ/9rv/K9GbO0FCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bgDlX5QaMLg7y4b6FpejDiDYpseNWtykESeTKF63GOE=;
	b=XKcJBvp/jn5V32bjCk59apwclaz1bEHD2wtJ4RBV501mJQxFaBRa+vghBKZHN9oMLEcV
	 ASk/8LknRvzBn1yVlUUAaGnrfccEGnzSZQ5k1VKd5K+dXGs8zWvtwd9dqqW+v5yRP+qit
	 F8ovnLwxphte05Ja1nd1nXAcNVWO8AUfvhUPPKWQD5Eg8xTZuT8oBRR6f2RyucecIQb3X
	 VuT3qwZ/xmn9xkegXsM+oGUsoAHnBwuPoVZO2aaFy8yyK/ekduArfFq/KTZ1oYkZHXQo3
	 h+AdrRhpm9Q4y3wzJG+7JzfJPeF6j42hM0FYm9sHEIJ/fr/RHqb+5CaQAgXC+/zu0WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XP20oGew;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAF606A895
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FAF606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XP20oGew
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b001cd92bso362579f8f.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994220; x=1795599020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgDlX5QaMLg7y4b6FpejDiDYpseNWtykESeTKF63GOE=;
        b=XP20oGewroSv1tF8eB/sB9ipVfwEeaZpL9Zd45zOBMEAW6vercjXlgXQaSG3zLI7Oy
         9qaekKp0ttWN/WrYa4lGtp4B8a4ihg8geBZUeyMl3w//gWP1Qzyn3MNkGgiYhzsZynpz
         J2IsPoRukeh6w8zftFHAc9QCx74KEbVSaeUT/lhVjYBQR9FgxXkAe6cBYCu9NR/YQqgs
         EaNWxa0bCdlkPI0wFGAtBqpo3qxSgQ8QARYzdfP2QySdSxUOohot1lWuAQWl287hrWjj
         o7liPM6cNbsntp8jc1n7wyjv1zQrLDUN1X8jCKiqclgpHoAON8OxFR12dHOWlcyj0oYQ
         8FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994220; x=1795599020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgDlX5QaMLg7y4b6FpejDiDYpseNWtykESeTKF63GOE=;
        b=Sn++iq94hWMA2aWrwQaiHPMBFLH5Q1tUNcDSRL3aRr+nZTCKQbTYCCUen3cHRP8lM0
         o1F/3cbs11cYx3Oz8NibhlmvUKn38ySuwKOgIDohinJjlSQz9X9++vb0pc2e+3Q0ZRyL
         xPmCQ8Dj+YEXwTwMTR6vJMiWE2KuiDNqfTGDb6eVXWIgw6m7RGEwbljvE3fhQfCjMRtM
         yj37q3JUUW1QyEu/R0W5irvLVHUoXnCvTjEerGGgE2tnlsn5aECpsnPtdiBIKJxn1wyS
         aClFB0cH79ecILkAFAsNkoiZ/Bb/Bz8TS7jYb9hSZEUNIO4XbjW3OU24Tro1QSkA/WnJ
         WV3g==
X-Gm-Message-State: APuU4Z+d8IjeDaekhQQhDXyZJ3SGApza0FFE62x9y58CR3O1SfDjbXoC
	5qw59BwSCKiMPgOmsC3ZDKmJhRQbM7Wv7eiWDOlBGIa5ocPPJfo+8klbpo5vD00F
X-Gm-Gg: AZFdTZetAv/A8OvrcdIAOjOG64t86/oNa33hyPU1oHA21Sx/u98gnhFxR85WznJvvPN
	KKGcMn9RklMzJ2mXwJMmC1SxGjq4A2C0yLXZrEBS6aXjXzkN2Hb0MO3Mn8fmLcZ+elN/nJIV0a3
	jCMP93XJsyL5v90tAV5vp6A22Spqq8zdC4mwcI8jJVnHwTYOY55zXzMo42bk1/kBKOR+UuGtA4p
	WpAJJZMX+NGoqi56E+2y1rMJW/4qV3AXogZJ2vo/lIUwYaEdia/lLhyQcciQzsDw+QntD8nc4tp
	Fn8EryelCJmf2LjkCNnAEABiya1AobVe2VqIKLpJlFqylEtRBb5PkTYBox6RJUILEJeZpMaH5PK
	q1Pjndf3F9oHi3N9ZwcBZC7u65JLsos3ItHpb8E95+1z8VqYUvJgp6+QINdLi8ew2pnmPswMcKo
	kCeuuA7a6ieixwgKxCVDFmk7hD4wzP0ga7R16UhAmCe9JH1q93Gu0Jz/wgXIp1vXxaOEDdPSi6F
	1LzniaJAFrM3cJBW2m9BELIkh1wdhNCMnO61kO3hfZqEoI3lruEBHHZmvJwfAwm4/CjMP0LDarG
	I79fg3LEmHtwOcr7j2uMqp+sZXdBLkq02C0He6sTP3GVRNsetM3e7LiZcLlDCjiAjprAmuYFsBX
	qQWD6+N0tMQv9VobhSAWww1k6t6nyY+5bcDwqBxCXVbdebp1uQYtF2V3pPwVQNPqFfcU9PC3Ewc
	p7ws5dH8caREWdGknHukT/dbOyh8jE0GaoAMSMx6R3Su4jSvdIudlu
X-Received: by 2002:a05:6000:258a:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4a6390a0d36mr4218222f8f.23.1794994219972;
        Wed, 18 Nov 2026 01:30:19 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c049-d359-3a47-0198.ipv6.o2.cz. [2a00:1028:8388:a84e:c049:d359:3a47:198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560962adsm3800503f8f.41.2026.11.18.01.30.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:30:19 -0800 (PST)
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
Subject: [PATCH net-next v4 3/6] net: mvneta: check the TX queue range of an mqprio offload
Date: Wed, 18 Nov 2026 10:30:09 +0100
Message-ID: <20261118093012.90121-4-pepe.schlehofer@gmail.com>
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

An mqprio offload without a shaper can map a traffic class to TX
queues that do not exist. Reading the class statistics then reads past
the TX queue array of the device, also as an unprivileged user:

  # kernel command line: mvneta.txq_number=4
  tc qdisc add dev eth2 root handle 100: mqprio num_tc 2 \
    map 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 queues 4@0 4@4 hw 1
  tc -s class show dev eth2

mvneta_setup_mqprio() checks the queue ranges against the number of RX
queues, and against the number of TX queues only when a shaper is set.
With fewer TX than RX queues a range can pass the RX check and end
beyond the last TX queue. Check every queue of a class against both
numbers.

Found by an AI code review agent while working on this series, and
confirmed on a Turris Omnia (Armada 385) booted with
mvneta.txq_number=4. Without this patch the setup was accepted, and
the class dump as uid 65534 caused a kernel oops in
mqprio_dump_class_stats(). With this patch the range is rejected with
-EINVAL, so the class dump stays within the TX queue array. Tested
with the series applied up to this patch and with the whole series
applied. No kernel selftest covers the mvneta mqprio offload.

Fixes: 4906887a8ae5 ("net: mvneta: Implement mqprio support")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v4: New patch. Answering TC_QUERY_CAPS with validate_queue_counts would
let the core check the TX range, but it would also reject classes
without queues and overlapping ranges, which the driver accepts today,
and it does not check the RX queues.
---
 drivers/net/ethernet/marvell/mvneta.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 06b5453543a1..76dfbc484269 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5277,7 +5277,8 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 		for (rxq = mqprio->qopt.offset[tc];
 		     rxq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
 		     rxq++) {
-			if (rxq >= rxq_number)
+			/* The range sets the TX queues of the class as well */
+			if (rxq >= rxq_number || rxq >= txq_number)
 				return -EINVAL;
 
 			mvneta_map_vlan_prio_to_rxq(pp, tc, rxq);
-- 
2.54.0 (Apple Git-157)

