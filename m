Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867991;
	b=e3dnNG0CFAPfZZDU1DPAhvUF2M7cn8YXeVLa8qA+m9atJFYRCFKXm2830Zol0PWfkWD6
	 e6pwm1Gsr3Cf8hB9HV1Psa/Q9ZpCt3n++qJ8/ZvsXfhUjdFz7c5rcWnX3QEC2yPjPZz7a
	 PC0YW1bkmLmWYQxFUnZafECk+H3rlIVYUJDrCU/lWHSxNT+M7GiWHpxdeNnaLd8Ug6ZGQ
	 Ojou/ogvSML8HBmS1mhzq/ORXLnl4Boy8Z5ZTiuUnkcT/NWrqBPc575xmQnMutBgNKdg2
	 Wpgp4d0HgRhSb9kRxr77NkNMcEFr1LkuypWPGhgzxVZUVHBU350sR88mtX8gAbq242Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867991;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
	b=HlYGH79afRCEtr5rBh8GWZVMMHYNJXDx3pXPwqsYVYEwxR2V9pEoRMHDz/yD77FLTR5z
	 GnNuakPphG6IwwEZcRKO7yuyDTNborKDvwt/0ua997JpEs9/m8lw+nTuny/gXlxYWDNPZ
	 KG+6rZ/dTW5HjaiZwG9svhSCX6mZhwlphkzZj+Rl4l3mi55IdpvbTV/qkHsq8Dh29JHJN
	 lX0upRx0xBtFfWaMH13POklHS0R9u/yv0SqY2yXhVvvLjtq9FeGBmz7QRNf12F0n+y5G9
	 UYGYPofECkukAt5VixLcz0JtMPU8DTT1NrXAb6lTYA4zVeoz/UURu3Bc1iXCUb0VUUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26403606A893
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26403606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2075420a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867990; x=1795472790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=qmgWVEMY2qx8L54j409kbfh1rEQqyLZgSZo8jMtCts04S0wGWqKIvN3o8JpUIGDWUR
         O48Mmh1nVcdSBRrct5Ci6xPiTJwD/LmxON/dr6TaW/afhiXhU547ZqxwB2z/o/qDHbCE
         Wu/7T5Z9YR5dM1gSOJ3xqEjZ7dp2kmVE9FJ8KNYvljbfMgG5hcacm2PhPf9FuoF5qZeG
         ftfJ287Eu/SaA9R/IdO5AFsHFKMsa9DcZq9lXVIsDdbhQOcvGDB/jGjwRstNEvQggBWp
         dptFIXotWOUAetpoidao3SXXziKYLksje9QGWxq45sq7fDNYxpWJyqVs0QFY437PDKDd
         4j2Q==
X-Gm-Message-State: APuU4Z9ukf0SQvJrjyCzEv9ApWgPqCLoDF+xRA/HE7JyuxhmCsSd7VQW
	+wsbiKUVO8f259Odc/9ti5WgTe7fn+bdo3fE7kVenw1qPzKvI7qfHDCfi+8g66faQR9FPvITSwd
	fhR35wTxj9WSa6ZEZU/g9vmYwRHBQXQPbo/Q3PUY51wqHX63yaTN2XN84SGpixDvAVEvlURUn4Q
	9XRaTNiEGj16DgAYJJ/XY/LxqVU9dldhyo+78gyyD4xQ16dzYNiFejkD2f5II1cFkwT13cEeVKh
	DiutXgbW955FZGa
X-Gm-Gg: AZFdTZcNLmw6t1Rm014LhFwW2RM/ML/lgtC93/qE3FZ6TYSmY9FPzRHI8qc067oicu9
	y4WP5wTgs+lSdWo5MUIXmgrz/501gk1fEx+qtw7AamLAl964c/gSM/O05WUDDBVR5ObX9/BJDtx
	tagMbMa+ahu0R72Tc8KeaRGftcRVqMOc7C+EN8CR1cwCrdUNLG67UqTsftwPczAfvzeYQaiQ2+R
	CrtvvQaky7VFAcfmxroP0nt/jU0gyrgBUhGktmk2JzJHoN3MeYwps4FMHSdNStFhZr2oYOS5prO
	Sz2aRyB+Lr2GhRpnjWCAHqahvETVD5RAPkCot8WCVyWVz77e/hpenTOKWanGRWiOO4e3VtnkFar
	updAGkAhHlsPSZNeoVjcuKqLckDIWlISk7XUzWb5AANSNdgKCrH8T7CMNv2lnIbSKtqYyh6r+cA
	CmvVIz/ZjnekHgUsLLl2juZ6QSkdxtncCdkMthNz9w
X-Received: by 2002:a17:90b:2b45:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b1b0cccea5mr10349052a91.64.1794867990309;
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abece214sm490996a91.3.2026.11.16.14.26.29
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so3344218c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867988; x=1795472788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=ZXVYLoBeyjKuwDQQHfurKC/93+dEugF/FYFfNiIwPyyiWcQZ3lc4Z49np2Y8lLqFJa
         x14+TMrqyNZ6Ljz0yqlI39wpihU5gR1eq+/T7ksrIVVe+S6b2fKwf17Df5d8L9tmqYPA
         sJZUfmYkx53VWsG9RFS0ITZvAs3EWrL8Y36nE=
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964784c88.9.1794867988284;
        Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964713c88.9.1794867987246;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 2/9] netfilter: flowtable: reject non-host IPv4 packets before lookup
Date: Mon, 16 Nov 2026 14:25:12 -0800
Message-ID: <20261116222519.1416501-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The IPv4 forwarding path rejects frames whose packet type is not
PACKET_HOST, but an installed flowtable tuple bypasses that check. A
packet addressed to an unrelated, broadcast or multicast destination MAC
can therefore be forwarded if its IPv4 transport tuple matches a flow.

Return to the normal stack before the flow lookup for non-host packets.
This preserves the IPv4 input path's forwarding decision.

Reproduced on BCM53012 using an active UDP NAT tuple: classic forwarding
dropped the unrelated unicast destination MAC while software flowtable
forwarding transmitted it. Boundary tests cover TCP/UDP, both NAT
initiators and unicast, broadcast and multicast MACs.

Implementation, tests and changelog prepared with OpenAI Codex assistance.

Fixes: 97add9f0d66d ("netfilter: flow table support for IPv4")

Signed-off-by: FLorian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_ip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 19cafae748ab..98bade1b8299 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -911,6 +911,10 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 	};
 	int ret;
 
+	/* The ingress hook runs before IPv4 rejects non-host Ethernet frames. */
+	if (unlikely(skb->pkt_type != PACKET_HOST))
+		return NF_ACCEPT;
+
 	if (!nf_flow_skb_encap_protocol(&ctx, skb))
 		return NF_ACCEPT;
 
-- 
2.53.0

