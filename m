Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650929;
	b=M4bF9U02HYJ53eqnwZeDKRxjgegrWbfmvRhgu3i2sSmMEMFGnyX9PpCkkV4H4vgWqhh/
	 8YJPZksAi4uV8BkzSRoEDs6yynAfUgO1/zKTkvIZQ3J7fRga4pGiIu0fSOjBd6UYrVSPI
	 fVfCED5MqnZfx90Cpi5KU9pwrADu5bXLY13z1BeYB7nJn46XvxVWwYO9M8cwCGJdrEXjE
	 sfoHPElGToSRzU5zC2gaWUIr5qIY6bM+uzcRTEP0LWVS+/9fw9PmZveMHKTKcIQTfBQVV
	 1WTx8UQQI6JSlFAdt8CaxIVsqOMmD69bvfGOthTHlgeG5600z208z3Pyu/FwinHqSYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Y17RY7lnW2W3s1gLYweIbHY4WwiCO5fusa3god85Tng=;
	b=DWwbZZWyxd+h1OEY4uter87YmsJMeBTo16VuW8nZGx5EbnYpWD3QuEQjR8THHke8VHD2
	 jI7yYMMg3h2d94VvMJpxVRABhEyLKjMO/Qh+BFAJ+Tjk3HjXJ8YVEnmXHfCsgHSVAec5s
	 lN13v6FavEH2VUnbcn+O2fBvnQiAn/TRmWZahBhZ8Dig8BUNXhiV+Q3iTy7I6hcEYvsZn
	 0jylYsTVmMQWQGdogkBc0QMiPFJtIOqMbew2I3fiQDyj7rFuE9l5X1WCO9aLtliXWBBqf
	 K6DZaHjlYQuxXBBWZHj63l+3KibH7Ag1opHlRSi9YbZYzEfhPug4dUxh5MfmwXkRBLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="P+DYusK/";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEEA606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BEEA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=P+DYusK/
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so12592510eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795650927; x=1796255727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y17RY7lnW2W3s1gLYweIbHY4WwiCO5fusa3god85Tng=;
        b=P+DYusK//Rj533Zkh+1bXxaooxu2+GSPa/j6qooTwFz/U13kBHC0S5f3+D9QRd3Wk+
         mXLXI5DBmWoFKsj9WGOz/yMKXI4EQJCxgORYnhUIqmU/xFF0VrfkDTtHxADB4qOjEN/P
         e6Y6tIBVS2zrulh/9h9/V3P6sSTVejkM8JgECx4EPe1RZDsBlG0ceefEj/VRlbQUKJ9/
         p1GycljUbIDPJ9mK6v7rxzw6HN3o8dgmXxBzQAjxAcv1cHTmd6GhqLm2d8gnvxd8PXBf
         9fYzd/fz+ksmv9SdZLe4DMw+aZD+oTQJDBapvYsEWnHWuCibywWr/7LsWgWlyciyD/Hw
         Mh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650927; x=1796255727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y17RY7lnW2W3s1gLYweIbHY4WwiCO5fusa3god85Tng=;
        b=z3bT0OvVDsmwODeU3s7vjCn3Pkr3I+nBi6CE/qOhTa8UlQ1DquJ0MwwYIa2u3Ge7BJ
         3T8mPzZXPZS9yhboOncRFgOkq2ZLldULbUOFFGDbtoEuud/w4fY7AV/64+CCfOl6EVab
         g97c64dIpcZ0AdT/w+WRT7pm5o8+eFsg3fNikHrtFSSB2DwYE1N3ER4C89KEdlmZB0V5
         CoiqoK/NcSRTElF1DH/JDEK5TFGVnIRC9OZC12pppPlPb5G9BxOGnE/LDBzfNLQ6ggq2
         IKg+2S5Z/HeZS6uTUAl2fYVyYKD7njxV1NTyoxamO+hyA3Q6SbxrWtYoZdf5EF+WidtG
         ny6A==
X-Gm-Message-State: APuU4Z9QpyVf5vXDg94B8ljEq92pLxOxG1RXU3u/2a6z1t5yK0R22LGl
	xg/RvkpslMp8pjocnSxcqfkLQO7yW05DF8cLeyudQcgQ/s6Vnck27T/InVobNSmDlg==
X-Gm-Gg: AZFdTZd5adRGuZsNRwCcwjWm3BgW4YrUQU/dAyLEpiaKmRy/dIvBGPcwZkVit0THSSd
	V7GWTn5k65PFl5EsBH5DUAE3aLesGY63KMqOH9xH5lHbr9a6BK7ZWe7qabKfDq5wJzFjRvduGhA
	L3R+yEbCLiK+opdkHq3lR7Saq5WO5vvWNdbYcrx5eT3isyL9jpV8cliAc6zhYCxoTX4/vYGk6O/
	qCxAeG5gbH1rXYVVP2dqtHiiYMABoBzB7s6Lwz3CrUyg+zS4WUsLwVhmfepGOXCTe73kK1w15Rx
	i1z4JHnwAM+p0LP45hPHhjlQOVfl4c17M1jaS3yUW3OrNMxNBUPFikepxrpZot+zD4HJiY9lVOa
	4JReIDmP6G1g3xhReBfHLiZ9qbJjLrrRHMWtKVcA+ozrnEsWJj4olE55V5K52HQeAj8jVlaMlVu
	AGhpDr6i7D/pDrD67Bc5o+NUwdnxoT4Ul6x2rLLztDv1c5BZ5hw37Q28HB6c3hxEYMKO3wHWMyz
	cdJ+16tZY9DlINUdwyUr/9wAaYXvm9QdXllS157AaZ6xEQJpH7YSZSeqOXco9ob26M96BiiVmVc
	a7is2hMb693bJmee/IH4NfHDfwtURZX+6eNs+zgI6ZV1KeNke0VabxCs3njvZsuLHRus
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr19027537eec.29.1795650927153;
        Wed, 25 Nov 2026 15:55:27 -0800 (PST)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm101477297eec.3.2026.11.25.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:55:26 -0800 (PST)
From: Xiang Mei <xmei5@asu.edu>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	co+80332c538f1d1a9d@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net] geneve: fix out-of-bounds read in the DF inherit path
Date: Wed, 25 Nov 2026 16:55:24 -0700
Message-ID: <20261125235524.4139551-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
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

The GENEVE_DF_INHERIT branch of geneve_xmit_skb() decides the inner
packet is IPv4 from skb_eth_hdr(skb)->h_proto and then reads
ip_hdr(skb)->frag_off, but skb_vlan_inet_prepare() only pulled an IPv4
header if skb_protocol(skb, true) is ETH_P_IP. For AF_PACKET/SOCK_RAW the
two are independent: a 14-byte frame with h_proto 0x0800 sent with
sll_protocol ETH_P_ARP passes the pull with only ETH_HLEN and the DF test
reads 6 bytes past skb->tail. The stale tailroom bit is copied into the
outer IPv4 DF bit on the wire, leaking one bit of slab memory per packet
to a user holding CAP_NET_ADMIN/CAP_NET_RAW in a user namespace. With
inner_proto_inherit there is no inner Ethernet header at all, so the
h_proto test is wrong there too.

The leak was observed. A PoC plants a known byte in a freed
skbuff_small_head object and reads it back one bit per probe from the
outer DF bit:

  planted=0xff recovered=0xff  MATCH
  planted=0xa5 recovered=0xa5  MATCH
  planted=0x5a recovered=0x5a  MATCH
  planted=0xc3 recovered=0xc3  MATCH
  phase B: 8/8 planted bytes recovered exactly (8 bits each)

With this patch every probe reads 0 (1/8, only the 0x00 pattern), while
the df=set/unset controls are unchanged.

Test skb_protocol(skb, true), the value the pull was keyed on, as the
TOS/TTL inheritance already does via ip_tunnel_get_dsfield() and
ip_tunnel_get_ttl().

Cc: stable@vger.kernel.org
Fixes: a025fb5f49ad ("geneve: Allow configuration of DF behaviour")
Reported-by: co+80332c538f1d1a9d@bugs.sh
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/net/geneve.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index 0ab729f055ea..74e9509598cf 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -1471,11 +1471,11 @@ static int geneve_xmit_skb(struct sk_buff *skb, struct net_device *dev,
 		if (cfg->df == GENEVE_DF_SET) {
 			df = htons(IP_DF);
 		} else if (cfg->df == GENEVE_DF_INHERIT) {
-			struct ethhdr *eth = skb_eth_hdr(skb);
+			__be16 inner_proto = skb_protocol(skb, true);
 
-			if (ntohs(eth->h_proto) == ETH_P_IPV6) {
+			if (inner_proto == htons(ETH_P_IPV6)) {
 				df = htons(IP_DF);
-			} else if (ntohs(eth->h_proto) == ETH_P_IP) {
+			} else if (inner_proto == htons(ETH_P_IP)) {
 				struct iphdr *iph = ip_hdr(skb);
 
 				if (iph->frag_off & htons(IP_DF))
-- 
2.43.0

