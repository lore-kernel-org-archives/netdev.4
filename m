Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821091;
	b=OkEP6GN6AWHqOSNbW8gKkyEnkzJ3AC1EqYaQWTT28YC2Qz/YxT22XTDDcaVKHX8lWwnI
	 ji3oBTmEti2AphAzGKth8DgARwWSWdmZLKHCsXo+EmWkGYPgcTXm0zlZ8qUKSW7zROFlB
	 2qRBB5+GV1gBU8X0ylEZmrpXJWiHpBxN7wDZQEOH2WU+VdlYzWbQp3YZ53U6m7RpOqX3H
	 8ZD7Mm9OQA9YJcE+vFa94qmDiNa+LhBp0boCsAeT6zOQGj661Q0ZoxI3tMWwTZLn9qYV+
	 T2TElOriR3G36k8ctm0EE2jYVUIrmKmgf/H/Ujg/7Bx9DIZxgk35b0uXvrwwts+sHOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2e8OfKa72MuG5l//Gx+5Pa5JLpMbf0mtMmXDlvYAirg=;
	b=pPcpPdEM4pDWq1bJOtcntTKMrWvrSKefyB1r1ReQbBGIlhm4dpXkrsLqaK/BmyCfdpLW
	 XNL12Ov4TSRiarKUDtD9R4nWBZ6TNnXk86wNXy6k5e5rAZjG0lW/T3P4EFOkxJdtZZUjL
	 ybBqxHt6q21uBvGnSu24US/rkPL1RGu/CKxOA+USXZbSTlhVDqcqY6ik31Ogt4wzY/Z9/
	 hHoDSPStjScEZm2rKXKMcMDBA7lz4uC3Pq3iFukqahhU9mBLbKApofYp3giXVUuJJroNx
	 XApE0yaODq2YrvvT2XSBb/dmetAjziTXaAZFrcrtMH8+dDHG2cyCMPRSbbdL5pnWRVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=0xt7YivH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D1606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7D1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=0xt7YivH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37986eb6fa2so3878231eec.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821089; x=1795425889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e8OfKa72MuG5l//Gx+5Pa5JLpMbf0mtMmXDlvYAirg=;
        b=0xt7YivHXf5ENmQKLYKekr7VO54fUwZYzdQVUIwvYBNoHUIVdu/lhKbe1puoUnTfxB
         eGJBIBt3bUyBBfHzPXxv3hdVwkfggnawZQ8YNTFVWs6coD/4gqTGqTtuLOJHSlDWzKpo
         nAd8d5ctNbqcAkDmVVc1udbjU4SSDhjtjX9eNGgiPm7I/L7ucfX84DsGncVg90E8km5T
         67qeSdwZL547ixEDZNmCX2NsLL0KmoHiC1KNECeOaIE39d4vhHAsttsjKqQOAjFH91Ko
         XtxfmA2D7wik3ql+hRAilriV3zg44ChJpd/XjR7NixPg+7ct2sUzBQAlRcqO6FmgsNB4
         pw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821089; x=1795425889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e8OfKa72MuG5l//Gx+5Pa5JLpMbf0mtMmXDlvYAirg=;
        b=OPBRwlKlnGcI0iPjO7gNdPNg9CKnxlt89HOZsf55oyMXoELoW4loaUgnWq3pfMGat2
         SM5qpftIo77Tc7AqYl5DWtAidrI5YRn7pSMiQs0YWKDRpRxcnaESSQYVw1m7XxAfPmUK
         quRckndPQgodTOUdHYD0HNJQiszQwoVzjeLi0OGL2IP3gGFadfevRFCsDGq/ZY3MyY3E
         FzM9HcX8YSn60VsyQ5kRtsUdzpMklm7n0QIjGWUgP53XrVhZtGvTdCMUL8X2/DF6KFQP
         6aiUy/bVH3WwOsn2HHhB2Z6cUM1QvpLY34tmJkldhLSThvU0r8lZbTDuaqYWRmhS6ZI2
         LfqQ==
X-Forwarded-Encrypted: i=1; AL+hErEOMqR5GzSJQzMfOtms471GD1eWoKV9PLiJ1nYrzoe47uGXq6ICNNg1k4JrqsD8o4mSXLz9Cg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NtUZ9Y/HSWwd2lxKnGAA98Q6udLXlX6itWGDEz4xoycInhFSD
	JJ9GVhtlH2/x6ZxcPs1uPSkHm06+jcbwp9C3G/mrX4wv1U50Rk3z5+8qzVwmLR8Itg==
X-Gm-Gg: AYBFou3zhHQXUQGl483gKPNAo9IVDKwS/cejUAkxD2iRH19hjJ3WvivEIcMqWdkXaCY
	Pv4y0RyeLLd0FPqIZxIqNNoPm8A1IGUjpulVjNX2qBClJqjL6s+cYsVKnkeCFM816P+PoxClzad
	3oq5HYFX6T0iWPOvBZstjduAP4tYGp3WBR2eB7KTw0QT4tzHRdHOJ47nu4YziAoYHMx9o/bgONO
	Tgjvt1JK3f3TbyqIaD1+GRcxv3woUvLEOOb+NVJJX8W6jBZFuWjQE2+LyLNyynxPjSE72WhcDCw
	WeUZINVJXZGJU+X0ei79vOPUyuMyyopRzM+UV461+gBvDtXZM2S6+ubvf/ROMwgOjhhisLPJf1N
	BJkP0cC4FyLntUmtmAwwmMthR/ayurVW8N/YjzXJ/K7wtbpRtiZZ3J6SF1LS1TqVSFO18TBwBvP
	eAyLiAfuTDY4MUzCJORCSGMFsbWE/DHLufm4UotAikJzqRcbgEPuDToJ7D7/0j/BnddNAalShpj
	lNHFZlE7f2GOUmKrRJbXD8tdstNIKdyJlSbdn1PSfnO5qahVVL4lpEwAs26vGWgltrOgQe+IX15
	pvYJDmplH39m2Ah5kYBhH7Bd3rXbPKhuMKuRTg==
X-Received: by 2002:a05:7300:dd03:b0:351:2958:1740 with SMTP id 5a478bee46e88-379681c67bfmr9514769eec.37.1794821089011;
        Mon, 16 Nov 2026 01:24:49 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:48 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>
Subject: [PATCH net v3 0/4] virtio_net: fix out-of-bounds accesses and a heap info leak via the device stats reply
Date: Mon, 16 Nov 2026 18:24:41 +0900
Message-ID: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
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

With the statistics reply, a device can make the driver write past the
ethtool -S output array (patch 1), leak stale heap or loop forever
(patch 2), and read past the reply buffer (patch 3). Patch 4 returns an
error when the statistics command fails.

Claude Opus 5.5 was used to audit the driver and draft the patches.

v3:
- Rebase onto v7.4-rc3.
- Add patches 2 to 4 for the issues raised in the review [1].

[1] https://lore.kernel.org/all/20261110001659.1654289-2-kuba@kernel.org/
v2: https://lore.kernel.org/all/20261102205550.4148064-1-lian@is.s.u-tokyo.ac.jp/
v1: https://lore.kernel.org/all/20261022182710.2055771-1-karin0.zst@gmail.com/

Lianjie Wang (4):
  virtio_net: reject stats replies for queues outside the request
  virtio_net: zero the stats reply buffer
  virtio_net: keep reads of stats records within the reply buffer
  virtio_net: report a failed stats command as an error

 drivers/net/virtio_net.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

