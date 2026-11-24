Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543129;
	b=lUJ7angJK0chZ8t77YlvCtMbC1MenelSWdn9frQbsue29GPXP82OXPAOMfHsyHHSwXER
	 2DMG489rZ4MWLHvo43lnDTaB1XezvRFeviiKqvj/NOC+Eds15CU5c5PTjZ4ujxgS5apo6
	 NwWtzzoasn6XEBPyR9UWS5rvJAd4IXs7bkAzDOalZLnk1trujVTsPnpIyYxriBQ4N3WBK
	 v1Pm54SGelIswgcmsJhAuQkDGCh2tf4mPA9yaphIWXeudhW5a8i6v6zwUmgDKlxxYwLCD
	 gk8gG1rkPNbnsFZ8/Q3SJAyVr1u+2BALfz5liv/saIWRQQL8k98W17QxggIsxJFNosw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LH2r4OQbUOildUL730FQPVnSWLN9NbKatpngaw8ALTw=;
	b=xQbhGVZHEF+14+3DF982gWA2fq6DMan4IjLG7HvY0re1XWFMqakx0sviMVBd3i9LF8vc
	 atn1qSvWWpKO7R78pwbuU2kmR+FLxvJ19L/O97zqQMV9gF9NDVbd/U0NCnCBAUHTyg//G
	 OpAfQohd7J+S1U3Dp/MS4yuYoIucb66QNbWp/Y2eE+lVB+X6hiknr/OBlFTvnrHDGBhGZ
	 JhHKf6+fnQ4YUC9XppGbETcx4ChiQISf0pyMa9A2CUGVA95j+OL48Bwm2aRo4g6/bmvKQ
	 fv/myBJWvCnlvR58JAYRsgyYuXOnBqjZgeMgHBF2lXobLKpY2f1OPrIxGYBjIbSInSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=gFrS7Xe2;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E82606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E82606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=gFrS7Xe2
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so7695973a12.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543126; x=1796147926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LH2r4OQbUOildUL730FQPVnSWLN9NbKatpngaw8ALTw=;
        b=gFrS7Xe2ytO8yYFzMX0tLb67bO4ElPRBu9UyuzC4LLXV+2loNXm6du7QbiafEexz0F
         EHoTcmnDJsIfpT8bG79p4ZVD5WBQ10yFzXaffEiIjmVRMYEqMsrrZm5L9CY8f5CmDZUr
         3LDJMKvrfZ5xk1/cnMeB5V7LIr7fk2b9KjL0DEgCkEUUxO2q9MNazGX/xz6bjDHwGIX5
         3v5zeYwHtULh83Imln0bSsrCnus4nXO/0XJytW+3JY4Q/XHhTI+qwEXzWW79Eki3CM0D
         i7XrT5Nj67GDDLgWvr3WgyNUrWnXJkRSnJwqAUjrWUmY8nn+XxglRzc5/KEGhEHvhElp
         0ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543126; x=1796147926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LH2r4OQbUOildUL730FQPVnSWLN9NbKatpngaw8ALTw=;
        b=HeiNV9s23BbA+j/U/GU5YL57LHSzAarmVUZqxpsgGS9Katw0kBB/piZ0RbokykPLv7
         kf/lYso61Qf4MxX7EfPvnIProwFz59cGWYK8UGv1g418Efbwg653l7SbbwF/El6uXtZa
         nCI93Wmrd4049OSRd3JivPZ5SdpVkhT502GJU+nTKrRYDF7cqMZlXKnDBUt9e0ueEebB
         mrYnpWhfYcvNQbut2MywyZJOwFTvNeJLe7GApRrpHwbz2jelbNShG7m601rUSHhTaMRq
         0sGsFE0yhT23yYhtSftxugiFuUrHt4aYBqQO7I0oyb3uigIny53t42pFW3EO4OaHo9eO
         CWWA==
X-Gm-Message-State: APuU4Z+SNChJ7yTyiLm0raoFOuNll0VBmEA09UuI9PmC5KjpfjZrhJgq
	g6O77Y2yuPHUnEnOGW231l4v3ejtUwIn/TcQP2FFVc5MrsxYwtrplmekjzI26/jK/1j1mMZD75X
	TUbd+p0OZag==
X-Gm-Gg: AZFdTZcFBFu3zF/sznZuacWwVKGrrk0TeXAYyqPvOVvP3zb7SS3wmOOkpMYAZ8XOrPr
	9uYn1dnJvc5y6y61QxCnI3DVqgQ7B2BbI6UY8IFqnxwF0V0Je+SV0lC3z7nCgMl2QD6pysaymnE
	2VwhGCoUrvz0qmzC3Fxt0Ccf0vXTom6i1EReYaLurIiTiuXcap2tWkIPFdgRfmfMOqF8KrpPIqR
	F3ipOqv8/dBrSuvOITobvmfYAOa8M4IbbWLHvGKV09U5lTtiyjSO74MAlGk56iYhuLJPxZtlCaL
	WO8GDurfhqhhvIFmqv/gEMXjkMdIwfRyI4Z+QyaDWWBcmsxrgHyjNoKyekPLAbd3j1thRmI6luo
	ff7x39f2GghwSC8M6NdF/2QrACEVJsIz48a+9s0dV1ZZb98hWzmDqnqDtxAMb4LOO86jEcTKxOP
	O+bTYIVKkHclQZ2OTpTcoqb9BQILPPglTszJlKbyPCaatAwV4RDFICUYHGFXfgw3/EEkUIUVgTD
	j0vs4HZz4P2WaJi91LK/mi7Fpq2Nikc3UA16QXX6RvKQcHrZOxtbatAsoUo0+pSV10N2wrpNaz7
	WQbmRMVqwHbAqbF2CnKIUvmV1KIVhT1HUty3VfVee25THDc=
X-Received: by 2002:a05:6402:504:b0:6b7:1cd4:87d6 with SMTP id 4fb4d7f45d1cf-6ba37d17fc4mr8159244a12.13.1795543125946;
        Tue, 24 Nov 2026 09:58:45 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.58.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:58:44 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 02/11] net: reserve extra TX headroom for local egress
Date: Tue, 24 Nov 2026 17:58:15 +0000
Message-ID: <20261124175824.60470-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124175824.60470-1-tianyi@cloudflare.com>
References: <20261124175824.60470-1-tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Use netdev_get_alloc_headroom() and netdev_get_alloc_headroom_hlen()
instead of LL_RESERVED_SPACE() and LL_RESERVED_SPACE_EX() where the
stack allocates packets on behalf of a local sender and sizes them for
the output device:

 - __ip_append_data() and __ip6_append_data(), covering UDP, ICMP,
   ping and raw sockets without IP_HDRINCL;
 - raw_send_hdrinc() and rawv6_send_hdrinc();
 - the three AF_PACKET transmit paths;
 - AF_XDP copy mode, which open-codes its own calculation from
   needed_headroom and now uses netdev_get_alloc_needed_headroom().

These are the main paths where a packet's headroom is decided by the
device's advertised requirement and nothing else. Adding the extra
reservation here means such packets reach the TC egress hook with room
for additional headers already in place.

Paths that check an existing packet against LL_RESERVED_SPACE() and
expand it on demand, such as ip_finish_output2() and the tunnel
transmit functions, are deliberately left alone. Using the larger value
there would force a reallocation of every packet that lacks the full
extra reservation, including TCP segments that already have enough
room for the headers an egress program actually pushes.

ip_do_fragment() and ip6_fragment() are also left alone. They use the
same value to check the headroom of existing fragments and to size new
ones. A larger value would send more packets to the slow path, which
copies them. A local sender's fragments normally come from
__ip_append_data() or __ip6_append_data().

Signed-off-by: David Keogh <dkeogh@amazon.com>
Co-developed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v3:
- Document which packets get tx_extra_headroom (Sashiko).

v2:
- Follow the renames in patch 1 (Willem).
---
 Documentation/networking/netdevices.rst | 4 ++++
 net/ipv4/ip_output.c                    | 2 +-
 net/ipv4/raw.c                          | 2 +-
 net/ipv6/ip6_output.c                   | 2 +-
 net/ipv6/raw.c                          | 2 +-
 net/packet/af_packet.c                  | 7 ++++---
 net/xdp/xsk.c                           | 6 ++++--
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index f593b242da9c..1f4ff67eb0fc 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -454,6 +454,10 @@ devices do not inherit it. It is not part of ``LL_RESERVED_SPACE()``, so a
 packet that reaches the device with less headroom, such as a forwarded
 packet, is not reallocated because of it.
 
+Packets built by ip_append_data() or ip6_append_data(), raw packets with
+IP_HDRINCL, AF_PACKET and AF_XDP copy-mode packets reserve
+``tx_extra_headroom``.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 5d6f5f5fc0ed..dedea01c6adc 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -988,7 +988,7 @@ static int __ip_append_data(struct sock *sk,
 	mtu = cork->gso_size ? IP_MAX_MTU : cork->fragsize;
 	paged = !!cork->gso_size;
 
-	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
+	hh_len = netdev_get_alloc_headroom(rt->dst.dev);
 
 	fragheaderlen = sizeof(struct iphdr) + (opt ? opt->optlen : 0);
 	maxfraglen = ((mtu - fragheaderlen) & ~7) + fragheaderlen;
diff --git a/net/ipv4/raw.c b/net/ipv4/raw.c
index f33a9dfc5309..85e2178f36d6 100644
--- a/net/ipv4/raw.c
+++ b/net/ipv4/raw.c
@@ -356,7 +356,7 @@ static int raw_send_hdrinc(struct sock *sk, struct flowi4 *fl4,
 	if (flags&MSG_PROBE)
 		goto out;
 
-	hlen = LL_RESERVED_SPACE(rt->dst.dev);
+	hlen = netdev_get_alloc_headroom(rt->dst.dev);
 	tlen = rt->dst.dev->needed_tailroom;
 	skb = sock_alloc_send_skb(sk,
 				  length + hlen + tlen + 15,
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 3cc911f6618e..50393d9a81ee 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1493,7 +1493,7 @@ static int __ip6_append_data(struct sock *sk,
 	mtu = cork->gso_size ? IP6_MAX_MTU : cork->fragsize;
 	orig_mtu = mtu;
 
-	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
+	hh_len = netdev_get_alloc_headroom(rt->dst.dev);
 
 	fragheaderlen = sizeof(struct ipv6hdr) + rt->rt6i_nfheader_len +
 			(opt ? opt->opt_nflen : 0);
diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
index 00d832c7cdae..00cf7475462e 100644
--- a/net/ipv6/raw.c
+++ b/net/ipv6/raw.c
@@ -602,7 +602,7 @@ static int rawv6_send_hdrinc(struct sock *sk, struct msghdr *msg, int length,
 	struct sk_buff *skb;
 	int err;
 	struct rt6_info *rt = dst_rt6_info(*dstp);
-	int hlen = LL_RESERVED_SPACE(rt->dst.dev);
+	int hlen = netdev_get_alloc_headroom(rt->dst.dev);
 	int tlen = rt->dst.dev->needed_tailroom;
 
 	if (length > rt->dst.dev->mtu) {
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 96c5216a9d6b..a74f751abb07 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2032,7 +2032,8 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		goto out_unlock;
 
 	if (!skb) {
-		size_t reserved = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+		size_t reserved =
+			netdev_get_alloc_headroom_hlen(dev, hard_header_len);
 		int tlen = dev->needed_tailroom;
 		unsigned int hhlen = dev->header_ops ? hard_header_len : 0;
 
@@ -2860,7 +2861,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 			goto tpacket_error;
 
 		status = TP_STATUS_SEND_REQUEST;
-		hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+		hlen = netdev_get_alloc_headroom_hlen(dev, hard_header_len);
 		tlen = dev->needed_tailroom;
 		if (vnet_hdr_sz) {
 			data += vnet_hdr_sz;
@@ -3087,7 +3088,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 		goto out_unlock;
 
 	err = -ENOBUFS;
-	hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+	hlen = netdev_get_alloc_headroom_hlen(dev, hard_header_len);
 	tlen = dev->needed_tailroom;
 	linear = __virtio16_to_cpu(vio_le(), vnet_hdr.hdr_len);
 	linear = max(linear, min_t(int, len, hard_header_len));
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index f22f9a2cdbbe..5932add2879f 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1047,7 +1047,8 @@ static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
 	buffer = xsk_buff_raw_get_data(pool, addr);
 
 	if (!skb) {
-		hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(xs->dev->needed_headroom));
+		hr = netdev_get_alloc_needed_headroom(xs->dev);
+		hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(hr));
 
 		skb = sock_alloc_send_skb(&xs->sk, hr, 1, &err);
 		if (unlikely(!skb))
@@ -1130,7 +1131,8 @@ static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
 		len = desc->len;
 
 		if (!skb) {
-			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
+			hr = netdev_get_alloc_needed_headroom(dev);
+			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(hr));
 			tr = dev->needed_tailroom;
 			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
 			if (unlikely(!skb))
-- 
2.56.0

