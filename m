Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538058;
	b=u8eW7Esth8w+OKHOyoH0iXhHXEDqodgdicVHDr7wRpHAXk6vj7Zi2s3o/ADbHDECz3jF
	 75XeWD2CN9YnyLgEDtMX7OGe1l5KCwjD7C7r5ATyumpJsv3LrR5tuXFiwLt7GKR33h/OE
	 qrOtAEk7aryIFhR35BG32CQGxyHIzHqXyAZqLoDkha4pcVmNtvGKIuxomi+wUQI+NywnO
	 UXprJ6f4YLe4VRkNvZGaO/+xDBqq3YkZhHUTF3oDk9l9LJkFj2rrReRA6rNgw3c4hk5+f
	 6aZlx0fA0/YXlGHdUQwVrUzDyiNpSpxP+yoMcvVfM5FCWkvy1MHIcdINBFyxFB2WMjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EClMfCqKxctT9skZzSuSsDAw5vjSAOlPEZZuifK4nb0=;
	b=STuL13NK786qi4enxoCqmvFu6dIeBvmSMJk7fM7J72dkF54g0gGopOzJ7UkjN7GdhsJ9
	 02yoQdAnaVZ+E83MqwnJMmrxo26iwTwTCvYYxlmkgCZkVSjLOkQObZ+QX4uUhgP1JfYla
	 xXPlbunQRS2mHR9BQlJCCZnXO2fo54z+RUQuHkaeCibxr5hpzCvrysYKA8/2Yy2BcgPoB
	 CH26cnyqULtVrsyOlswHSy0iIgRJxNeSR6pZR9NhhwBfUwGuj5VQ3BOVkZP1lTCh6v7m1
	 UxcYJVjD7BRl2fJHLpxE5z7hd+8NZAL2uSwXxlHJNMzs8oAZYNZho2dj7JaJJqofVig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vplGpSjU;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87876606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87876606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vplGpSjU
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so4112082a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538057; x=1796142857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EClMfCqKxctT9skZzSuSsDAw5vjSAOlPEZZuifK4nb0=;
        b=vplGpSjUzq5nA05ZXtp0+d4qNIGETg5PGo/+jwYBGHLGfxXOE9kuPm1k4bU0n6PGHf
         phySykTltY2tE/ciXeMdFk1u/roMNHJoMSjtqfinSoxbEFvoZBwwJIDSja/0ROaKz3sm
         TOAUzu1bwY35s7C665lv7zdzsEI8rypJi4Rfjdgy4pm8cL5lJrci1DIXatGk8eERpp8H
         jaKA1v33WD5KbpbVjpQL+5H38olWDQPHWE0dmUSLlC9oUwwouDtoM8Olc4Rnska/9lBZ
         8sxfVe5H1k6dtxCPICmkviTq7Taya4m+JGjBhb7Ec5+kqigkF/3r6DLyCWc735M/sD6N
         wFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538057; x=1796142857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EClMfCqKxctT9skZzSuSsDAw5vjSAOlPEZZuifK4nb0=;
        b=IOw62EdLTidG+ZAZHpo8EZ6kdoEnzV+xNbS4W1hwoZMmdAsfDzqJl3DE/Te/3VDEci
         VPqGN//6H3IiKmWACuH5aGzBrzqdcpM2q3pTYXrA1aXBqh2AJxK7aBBQj2JSCL2Nnx5r
         nzVW1s5jHSumPs7VE2X+YQBBbU6H1OBPXyHRgEifogsBPlVySZf5OLrQDxGretOC+947
         5H4ww79+DPr0PFYod/meAMaUzaIN/IDt+HCcj7S1KJzobLZhnQzEBUn3MzY3NarUANYi
         6L7ALDhD50irrFLhyt1T6BsMxQM/zBzvCDeykqXaQXfPstcZ+vXe56pQnTdmzroqHeHG
         Z42A==
X-Forwarded-Encrypted: i=1; AL+hErEFjEaVy9r07T2x8HHuZUmxjo88HmNN/1tYHnH93fPHfQ5jGb3J2ceOGELTQUdqwFD2K6ET1Fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SGWDajSXT0YEE+tLgOPXe1qiyttTwhLlpT6eyM6O2qzCsbm7v
	vPIEUzqj3eRYGOBTy6plyw4Fz8O4o9VLDOAPNzGlNO8yF9alG98T1VsA
X-Gm-Gg: AZFdTZdQVQ8nHAFALA8RWcT+nNgDUJqqrTBD8U4QsAKwtIlQA/1BjDbbEwTCKZ6g9WJ
	oQTgGyPzbfTRvXDWd50RQKPc1N/JviqHzj+09PL3eMxAB5d4PagW9YQFRuq+QoloDLUERBsaXJM
	qSu+QtWrzM/+4wYjW4Dnmyv+1TJK2JfdEvzb+EUrAfnfMbqShk4iFQHTFV7rpd1I6umuFBi+tLZ
	b4DghYzpr6KHwUjPhD4/bhm7qxA7vfEN5RNC1+XF1Kuolve98Ruk9ulC99forckC6PDfgjOqiAP
	/1oWGaW9C3fRbyNtssW4Wn9X7ya0qhTTGfuvrWjvs0/XCYrWd5moeqhuPHfULmi6saRC1/m2KuG
	9POSXs+f9bwGoa0EYEGeCX6kAwETXtiovhXd6E9JtCEbxRagKwjuqOV1vzonIOsSRkQ3QySJoVg
	VkmEZ3EPrP2TL5uxg9UIuvMuITYCQt4nxwZ6SbjOoND4kizlekREDfN/1rdqVx/+TqEnuB0gI0o
	GNZd9Zk9HGUhTnU5Gc3qy5+CTKX+WX7tfDRc23ZwYs12csIg8bsD/FYp0rGIih2QNCoZ2QqLEmf
	Ivq6qo4gdf5hmgOuNONDeiNh9RJSuK89a/0RVLehcNhoa77NKOcIp0ucqWV9fwjlDymWBnELno/
	t
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1338763266b.8.1795538056751;
        Tue, 24 Nov 2026 08:34:16 -0800 (PST)
Received: from theodors-laptop.dotcomltd.ru ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm542032866b.75.2026.11.24.08.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:34:16 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v3 1/2] netfilter: nf_dup: do not duplicate packets from br_netfilter
Date: Tue, 24 Nov 2026 19:33:57 +0300
Message-Id: <20261124163358.755345-2-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124163358.755345-1-theodorlarionov@gmail.com>
References: <20261124163358.755345-1-theodorlarionov@gmail.com>
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

nf_dup_ipv4() and nf_dup_ipv6() copy the skb with pskb_copy(). If the
skb came through br_netfilter, the copy keeps the bridge netfilter info,
and its mac header points into headroom that pskb_copy() did not
initialise.

A tcp reset reject of the copy on LOCAL_OUT then takes the bridge path
in nf_send_reset() or nf_send_reset6() and builds the RST's Ethernet
header from those bytes:

  BUG: KMSAN: kernel-infoleak in _copy_to_iter+0x1c9/0x2650
  ...
  Uninit was stored to memory at:
   eth_header+0xbe/0x150
   nf_send_reset+0x15e4/0x1850
   nft_reject_ipv4_eval+0x1b5/0x2b0

Skip skbs that carry bridge netfilter info. br_netfilter only drops the
info when the bridge transmits the skb, so this also disables dup for
packets that came in on a bridge port and are delivered locally or
routed.

Fixes: affe759dbaa9 ("netfilter: ip[6]t_REJECT: tcp-reset using wrong MAC source if bridged")
Suggested-by: Florian Westphal <fw@strlen.de>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
 net/ipv4/netfilter/nf_dup_ipv4.c | 6 ++++++
 net/ipv6/netfilter/nf_dup_ipv6.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/net/ipv4/netfilter/nf_dup_ipv4.c b/net/ipv4/netfilter/nf_dup_ipv4.c
index 9a773502f10a..a4ad26a564a4 100644
--- a/net/ipv4/netfilter/nf_dup_ipv4.c
+++ b/net/ipv4/netfilter/nf_dup_ipv4.c
@@ -11,6 +11,7 @@
 #include <linux/route.h>
 #include <linux/skbuff.h>
 #include <linux/netfilter.h>
+#include <linux/netfilter_bridge.h>
 #include <net/checksum.h>
 #include <net/flow.h>
 #include <net/icmp.h>
@@ -53,6 +54,11 @@ void nf_dup_ipv4(struct net *net, struct sk_buff *skb, unsigned int hooknum,
 {
 	struct iphdr *iph;
 
+#if IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
+	if (nf_bridge_info_exists(skb))
+		return;
+#endif
+
 	local_bh_disable();
 	if (current->in_nf_duplicate)
 		goto out;
diff --git a/net/ipv6/netfilter/nf_dup_ipv6.c b/net/ipv6/netfilter/nf_dup_ipv6.c
index 6da3102b7c1b..ba8243bcd56a 100644
--- a/net/ipv6/netfilter/nf_dup_ipv6.c
+++ b/net/ipv6/netfilter/nf_dup_ipv6.c
@@ -9,6 +9,7 @@
 #include <linux/percpu.h>
 #include <linux/skbuff.h>
 #include <linux/netfilter.h>
+#include <linux/netfilter_bridge.h>
 #include <net/ipv6.h>
 #include <net/ip6_route.h>
 #include <net/netfilter/ipv6/nf_dup_ipv6.h>
@@ -47,6 +48,11 @@ static bool nf_dup_ipv6_route(struct net *net, struct sk_buff *skb,
 void nf_dup_ipv6(struct net *net, struct sk_buff *skb, unsigned int hooknum,
 		 const struct in6_addr *gw, int oif)
 {
+#if IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
+	if (nf_bridge_info_exists(skb))
+		return;
+#endif
+
 	local_bh_disable();
 	if (current->in_nf_duplicate)
 		goto out;
-- 
2.34.1

