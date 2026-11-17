Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952465;
	b=DT/mbZE7TpLB3mkQk4xs40HYoyiab5isvQJ42dmdRCNBnzSnFmDRbmcG/5vHlCw/tmQr
	 PCC1oe8AWEP1CphuYyMcjZmXleH+YmeyDe1X2pVJXhu5yqNUyVMonzXz3CqMiiURE2dz9
	 aZx+cRr5FNywR0m+BXSiUU/c1pxLKqM6EpPMPgRCWtwm3GZhp5ymx0VuqwEX/SfL+ai6+
	 0t3fjaut+VbiMLBGzxACADR6n9FlAw9aFe4uuyTGnM3wodx3mJtJAXDFQ9vbqfLaD5OW7
	 Y0r/acjEUwhqbnQg125wero5GYopdc/ytvwluxMJojuOnDZif/VbXYrUzp7LY2Tbqwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
	b=SUk+kStPp8qUumkBmfHy1I69g48jD6x7o+G7hYmy0rhw1X9E8pkoRN4BdSRiRN84nThH
	 JxKuIungqQ5Xx3tN1F57SmOu22gCsUFcsiW0hQ5Vl1+uyD9YNVFxUZvDhYjiMGtVLdqfn
	 AxY2PcnZJ9P/1fxtylPRqYj88+KwtuJnniiJ0chd5vX3IjA6309ByMz4Ub/en2B1ItedN
	 Teir6Z/F2gNzSOEWGIfEQBU0e0fuhYmYUGf8sc6UqxnQAkzRPjOa5rsj7Sf7vQp1I0yFm
	 /wKTf0rFW0JN50WC7ZsCLfPdKXeE5qD3LBJiafyg+7dOXl3LP1XzabUMiMti8O1H1/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyTUrrZa;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1D606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED1D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyTUrrZa
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc758830601so256066a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952465; x=1795557265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
        b=oyTUrrZaD3U6y9iF+/WP+iFGaDphOp0jPL1Lj4o8T/ibG0uWJRDRZ+strisDHToiZ4
         5zksiJEWUTZfJijxq1Kl+swar4Ig0xS//XLtmin+XCR5PLYB1Bvysk/EqOvCi8q5SpcY
         mVQ87q3ifB6buhCe40BNFXKi4rvxr7yXLQEAUJfV08U06CXGOMNVhQQ6m5a2co6+nQFi
         lB72YB92mVtvx3gLewTANqO7aC6Xftjwt9Dnbdbyjyzyp3bb0yz56psmuXGEBpnocZmE
         qooxP0bNqNKao9SK7S7WH5IiXkdBmKNwARMVFjKG/c2pRu1JoKaUpgsA/1DJV1gcd2Af
         3euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952465; x=1795557265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
        b=K610HaPUfYZ/kBvEs9ZbqOVb+QMsyGgZlH74mda1oLH8pA8AhbQYD6BjZTEjNlFwDy
         y094XImeBl86o2GOSGa+TnfaSdF1d9uLKifcnsTk//fGGtfowPKj85Os2Vei5pwfBgzB
         LSXxWmgg1j5/ckf11grZhjS48zrgCoSs1ArLQFc6DyVLcHxooNclvvssYsCz9Sjabl/N
         0r9bK36yksr71ieL0+fyaK2CIbc8q4WKjDZR4V6eovL9AIaJiYN+bAI9HUuq7NR20qzF
         OH/dmI1P5qFPKESQWUn6lnb5RzszTr6QIS2gaTbcyC/ShpIIlx0nwLuG2MSKWFZ83fwt
         7q4A==
X-Forwarded-Encrypted: i=1; AL+hErGdXYnXkx6u+ujH/W9ew8mwdYj0z9SyFnJ3paVIGfoKWU8HWBkAj5HGe5lx8tMrC51tQSNM0Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pGLHukQkUbhS1XlWyBqk+PQRUrS/kuIT/rFMHNIOiGwbE3JXw
	tdSyhK3X2UtjmVty40Aum/sk1VIRY2kYuvCJH3IajJeel/QjIc86jmaI
X-Gm-Gg: AZFdTZedbAVpYJjsPGtEpwE4sg629NmRzPFyUu/QJpkJoZTCSegIExLDI068FRUf3h+
	q2gdrulzsi1wx49MfhRpaTuUASmJI6m1hFw4MSJ5t/P025/+/qXPF7EmGm+7MufVVsYSn858Wgv
	VsX0QT6ulc3WCfhZKXaLDYIlqwDukJn/oT1nuI3DhYEGBz0PjDnAsw/dby4dJnq0XRDUA9H1yrh
	h0KUP/zBU6rav6ALNM1mpwIaDLiedlYn3hoJMDNyjXW0SYV7lCLmXoq+4ohojBzrO21OCnUacv1
	97Xy+XDSxiwP6eEGPpM2k/wZRLkU7BfYShabIrHtDoWrMgkZJpkXItlDDu/HTifVAsQXR7YQgFX
	U/dFa5aLKjlFJWAZ/fbVSbd/XGqLrfWxuQQ0nnyElLwJZMqx0NYghuEIvXH/DLLitBZ0m6R+Y8m
	9dpBa8iz305Vk/dMXW3QDwKmRE1iqUw/BR09IoRKFnpfsz1lN8yobNNvVIYXeiowihx0RiMBQXR
	m2QdZzxf1CAep8N2aA/2oQwHQwsxBsqFUlMDgMKfEDoGvvI9OQ0yHU9KEMrMdB7TLsbKylyKuIe
	sb5p0TdagN231kWQ4LFt6dH2vMByVPkXq+A=
X-Received: by 2002:a17:90b:37cb:b0:3b3:b0e5:57fb with SMTP id 98e67ed59e1d1-3b3d07e372emr802152a91.60.1794952464869;
        Tue, 17 Nov 2026 13:54:24 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:44::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm5872992a91.10.2026.11.17.13.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:24 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 3/5] eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
Date: Tue, 17 Nov 2026 13:54:14 -0800
Message-ID: <20261117215416.1901246-4-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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

fbnic_stop() frees the NAPI vectors, which clears fbn->tx[] while
num_tx_queues is left unchanged. fbnic_get_ts_stats() walks fbn->tx[]
without checking for NULL, so asking for timestamping statistics while
the interface is down dereferences a NULL ring.

This was found by AI and reproduced on HW.

  # ip link set dev eth0 down; ethtool -I -T eth0
  BUG: kernel NULL pointer dereference, address: 0000000000000050
  RIP: 0010:fbnic_get_ts_stats+0x38/0x60
  Call Trace:
   tsinfo_prepare_data+0x82/0xb0
   ethnl_default_doit+0x213/0x470
   genl_family_rcv_msg_doit+0xdd/0x110
   ...

Fixes: 96f358f75d1a ("eth: fbnic: add ethtool timestamping statistics")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
index e774740fcb5d..0cd03cbf2713 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
@@ -1740,6 +1740,9 @@ static void fbnic_get_ts_stats(struct net_device *netdev,
 	ts_stats->lost = fbn->tx_stats.twq.ts_lost;
 	for (i = 0; i < fbn->num_tx_queues; i++) {
 		ring = fbn->tx[i];
+		if (!ring)
+			continue;
+
 		do {
 			start = u64_stats_fetch_begin(&ring->stats.syncp);
 			ts_packets = ring->stats.twq.ts_packets;
-- 
2.52.1

