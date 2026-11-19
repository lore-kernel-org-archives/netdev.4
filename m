Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052321;
	b=MztiFa59bRq+qdmjQUtS9wVrShwK350X6ZdL6PsJglJmrzjV15+yVoqGZSLqzn4gNmSj
	 UJTkrHkebZWplIPnlmn31oZP9VvlqXlWaEDuBB5UUvJUd8zsLiSD2UEnQS3BH8viLlLnk
	 ECJpTG1tMWx5iCnUOjKynNk1Nmj7P9wEYP4DWJHGd74BzBo4gENCQFzgCGmnup8I1MV7G
	 24MJCt22sNaZbXvB+k18ropRQEB4A6R0BcWKo5OHoieB1dX+NzUULDQZtmtVNr2V6fm1I
	 /lQlCJr8KF9HC9sZmuxGr41qRnvvDEHdtRuN44TkPyNyj2snLzttPIPY465Qf6RMr2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=perFU4/B5Y0feRHDCtIfp11kwM76D74bmT1vbTvBgE4=;
	b=M6HpHtz+IWpZo5y+T7TCFm9Db9Y61SL+awP3ND5J63A+UdvusG0bnweSmXi1P3d513V6
	 5lyhZbd0vlRnwHr3c58SB1+0/rfA4r1sHr/WF5NLrHI1J6uq+sIZu7zftKZoUcqOg1Isv
	 Z3agL7dZI/0Mdu0MbzwLtl2ZuL1eNFv/uRDWCbVBU7CVXq1a/Fcr37jhYd66hSg1tPUCa
	 AazLvY2vQlNi9d+lsYlASw52rG4a/4CDorEEoI5zw4wrwhXm6sRgnNRtuxT8cHPnaCLW/
	 rnZIhxMQmgBqlz+2Y2egZXxMxYNadkwqew3vn+umQkX/joxwyjwch6tGhK/SOty4mAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=bFPUn2O0;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B722606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B722606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=bFPUn2O0
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4322d310e7so268168966b.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052319; x=1795657119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=perFU4/B5Y0feRHDCtIfp11kwM76D74bmT1vbTvBgE4=;
        b=bFPUn2O0mGRe0RmXQEMhMDC1ff3vVq6olWJgu4Ceu4rmBmUvjGd21IP9JmBHCLAmsj
         coyeptIAMGkBXKwTyUjuQ9sZ7hK2b1orQaPOEsPMcXcfgczcVepllJ7PFV49BqdeL/SI
         qVUEdBTooUMCYP27wGRA0wso7cVKMOD4coDXFHN8juME0UgK0QExT9gzE9b9UBptaHjl
         DAuj+gN5U3L6DcUwfsIyayr+ROFbPyd1x20JSmazw6tN7TKIB0RPvYDfKpNsC8ptfl5X
         di1T9Mo2IT/mn183q87V2Q2o/+1AhlDjvviR8hUQprUSrH1VTTTCccBYvgVPWHdt6P8X
         SItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052319; x=1795657119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=perFU4/B5Y0feRHDCtIfp11kwM76D74bmT1vbTvBgE4=;
        b=x4Ot0bvfr4K4s7CsMwCx70vR+jpDKi3VaX1wAs7rGqbdcspsWxx5j4Nq6HJs/U2mZH
         9T9baNU6EJoAYz19coIugZUx4qs/zamGHHECVF5NF0aQMi/RCjpvZO8yTUNKVUyGR7+c
         19526ZrlrDJQe4bYL+eN0qUymIzxKkHMouIiYsC7hgkAUdANIT0Y6+LiXNxlqyr+lhqk
         pTIBL2SzFz6BjdczalO4JdAMliLypyqoPLIa8EznnS8CXDoR/KsFEwy+IhjqhZRC26jG
         DgQog88QMxOxT3Wv8lM6MOlhqxvqrogF58REdnWwJ523NhX9qfcx2x+6cqiioHkMvke0
         5NnA==
X-Gm-Message-State: APuU4Z/cP7ujLwxjYYSbG7Qd1uEb1iJl/Deh35wkfFr3nSZIUPCahEcA
	3qmEX7N1S+xMXVAXL9jIlfwRMNAvYHSph2lT/+JE3ngem7lAcr6+LqHu/aROLYq2BdXP56sa+dp
	6+XdRNH8=
X-Gm-Gg: AYBFou2JJIoVFayQPpX1XjLbR0OQi66fxUtyYGw6hY1olxt/zU3390//EFt8N8Oho7f
	h+gPs9PPMTnjABEW6hKfneJgSl8leW2qi3OZFBOtK+l/DNlDfvOpuEEuKbeHwWlL959m6HQnowN
	BC6P+uQF1yuU7eaFF1pcWsQ0LwrZgaoBEqBLk/xao22NQStq3VYstxgll5brsxe9VyWy5zYumoE
	Fg5ur9z2AlajygRJlD77OqQtbEzleYF9PMvgyf4HED5Nme5iXC/295pbkbV1aU/nWM4PX1vE/Zd
	zSWy+4Rl1cLORNbXCT8lhbbmIdOIPNvr9pVRkVQ+v0AsaS83ePlOOhITaBJcr5CY0qf1DttjgrK
	LtZAUS43C3gcfsnMy9n0nEciovfn3jETAv/CzdxEtDIUM5aaV4rWui/gx6dhWBojfFy6+cAWB7e
	HE4FEoaPJLEkZ+E+/oZikVOzZwQK9kMqXXUryuyBq9z5M4giYzruuyuZaHMLlNjuVyMgT4yqYIf
	E3qpCL1kYU2Y94xBCr1VVX2HNjHFamD9TkylPBnjVe0dNmu6kjE79ZK2gpKlzl+mHqlkf/QjgQ9
	DoSJOz/ppkLYhPW0XPp/XcTtrQVsBQ7qj2o40G9EJ1ObmANWezAnD6xyoqiZszCT4cCgB7YA1Kx
	4p7Y=
X-Received: by 2002:a17:907:2d24:b0:c33:923b:ad51 with SMTP id a640c23a62f3a-c510e55ffb7mr404977966b.45.1795052318970;
        Wed, 18 Nov 2026 17:38:38 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.38.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:38:38 -0800 (PST)
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
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 01/11] net: add tx_extra_headroom and netdev_get_alloc_headroom()
Date: Thu, 19 Nov 2026 01:38:20 +0000
Message-ID: <20261119013830.36935-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119013830.36935-1-tianyi@cloudflare.com>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
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

Programs attached at TC egress commonly push additional headers onto a
packet, for example to encapsulate it. When the packet does not carry
enough headroom the BPF helpers reallocate the head, which costs an
allocation and a copy per packet.

Locally generated UDP, raw and AF_PACKET traffic is allocated with
exactly LL_RESERVED_SPACE() of headroom, which only covers the
link-layer header and the driver's needed_headroom.

Add a tx_extra_headroom field to struct net_device for that purpose,
together with netdev_get_alloc_headroom() and
netdev_get_alloc_headroom_hlen(). These add the extra reservation to the
header length before the HH_DATA_MOD alignment, so the alignment of the
link-layer header does not change. netdev_get_alloc_needed_headroom()
returns needed_headroom plus the extra reservation, for callers that do
their own alignment.

The new functions are intended only for sites that allocate new packets.
LL_RESERVED_SPACE() keeps its current meaning and remains the threshold
used when checking whether an existing packet must be expanded, so the
extra reservation never forces a reallocation on its own: packets that
already have enough room for the headers being pushed, such as TCP
segments built with MAX_TCP_HEADER, are left alone.

Keep the extra reservation separate from needed_headroom so that driver
updates of their own requirement do not clobber it. Place the field in
the padding that follows needed_headroom, which keeps it in the TX
read-mostly cacheline group.

The field is not set anywhere yet. Later patches set it from XDP on a
veth peer, from TC egress programs and from a veth attribute.

Also remove LL_RESERVED_SPACE_EXTRA(). It has had no user since
commit 6d5431555de0 ("caif: remove CAIF NETWORK LAYER"). It could add
the extra headroom, but it reads dev->hard_header_len itself. AF_PACKET
must use the value that it read once, see commit 03390aa32e66 ("packet:
use consistent hard_header_len in non-ring send paths").
netdev_get_alloc_headroom_hlen() takes the header length as an argument
instead.

Signed-off-by: David Keogh <dkeogh@amazon.com>
Co-developed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- Turn LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX() into the static inline
  functions netdev_get_alloc_headroom() and
  netdev_get_alloc_headroom_hlen(), and rename
  netdev_tx_alloc_headroom() to netdev_get_alloc_needed_headroom()
  (Willem).
- Move the netdevices.rst section here from v1 3/8, without the IFLA
  part.
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 Documentation/networking/netdevices.rst       | 13 +++++++
 include/linux/netdevice.h                     | 34 +++++++++++++++++--
 net/core/dev.c                                |  1 +
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 7620d3fcb8dc..4341e9e443ba 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -35,6 +35,7 @@ unsigned_short                      gflags
 unsigned_short                      hard_header_len             read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
 unsigned_int                        mtu                         read_mostly                             ip_finish_output2
 unsigned_short                      needed_headroom             read_mostly                             LL_RESERVED_SPACE/ip_finish_output2
+unsigned_short                      tx_extra_headroom           read_mostly                             netdev_get_alloc_headroom/__ip_append_data
 unsigned_short                      needed_tailroom
 netdev_features_t                   features                    read_mostly         read_mostly         HARD_TX_LOCK,netif_skb_features,sk_setup_caps(tx);netif_elide_gro(rx)
 netdev_features_t                   hw_features
diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 6a87f09e7015..f593b242da9c 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -441,6 +441,19 @@ from a notifier.
 
 Drivers **must not** generate nested notifications of the ops-locked types.
 
+TX headroom reservation
+=======================
+
+``tx_extra_headroom`` is extra headroom for locally generated packets. The
+stack adds it when it allocates such a packet for the device, so that
+headers pushed later, for example at TC egress, fit without a
+reallocation. It is at most 512 bytes.
+
+Unlike ``needed_headroom``, it is not a driver requirement and stacked
+devices do not inherit it. It is not part of ``LL_RESERVED_SPACE()``, so a
+packet that reaches the device with less headroom, such as a forwarded
+packet, is not reallocated because of it.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0325c6f2a7d1..392e6fc81e34 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -311,9 +311,6 @@ struct hh_cache {
 	  & ~(HH_DATA_MOD - 1)) + HH_DATA_MOD)
 #define LL_RESERVED_SPACE(dev) \
 	LL_RESERVED_SPACE_EX(dev, (dev)->hard_header_len)
-#define LL_RESERVED_SPACE_EXTRA(dev,extra) \
-	((((dev)->hard_header_len + READ_ONCE((dev)->needed_headroom) + (extra)) \
-	  & ~(HH_DATA_MOD - 1)) + HH_DATA_MOD)
 
 struct header_ops {
 	int	(*create) (struct sk_buff *skb, struct net_device *dev,
@@ -1934,6 +1931,8 @@ enum netdev_reg_state {
  *
  *	@needed_headroom: Extra headroom the hardware may need, but not in all
  *			  cases can this be guaranteed
+ *	@tx_extra_headroom: Extra headroom for locally generated packets, for
+ *			    headers pushed after the allocation
  *	@needed_tailroom: Extra tailroom the hardware may need, but not in all
  *			  cases can this be guaranteed. Some cases also use
  *			  LL_MAX_HEADER instead to allocate the skb
@@ -2196,6 +2195,8 @@ struct net_device {
 	 */
 	unsigned int		mtu;
 	unsigned short		needed_headroom;
+#define NETDEV_TX_EXTRA_HEADROOM_MAX	512
+	unsigned short		tx_extra_headroom;
 	struct netdev_tc_txq	tc_to_txq[TC_MAX_QUEUE];
 #ifdef CONFIG_XPS
 	struct xps_dev_maps __rcu *xps_maps[XPS_MAPS_MAX];
@@ -2778,6 +2779,33 @@ struct netdev_queue *netdev_core_pick_tx(struct net_device *dev,
 					 struct sk_buff *skb,
 					 struct net_device *sb_dev);
 
+/* Headroom to reserve when allocating a locally generated packet for dev.
+ * Code that checks the headroom of an existing packet keeps using
+ * LL_RESERVED_SPACE(), so tx_extra_headroom never forces a reallocation.
+ */
+static inline unsigned int
+netdev_get_alloc_headroom_hlen(const struct net_device *dev, unsigned int hlen)
+{
+	return LL_RESERVED_SPACE_EX(dev,
+				    hlen + READ_ONCE(dev->tx_extra_headroom));
+}
+
+static inline unsigned int
+netdev_get_alloc_headroom(const struct net_device *dev)
+{
+	return netdev_get_alloc_headroom_hlen(dev, dev->hard_header_len);
+}
+
+/* Same as netdev_get_alloc_headroom() without hard_header_len and alignment,
+ * for callers that size the headroom themselves.
+ */
+static inline unsigned int
+netdev_get_alloc_needed_headroom(const struct net_device *dev)
+{
+	return READ_ONCE(dev->needed_headroom) +
+	       READ_ONCE(dev->tx_extra_headroom);
+}
+
 /* returns the headroom that the master device needs to take in account
  * when forwarding to this dev
  */
diff --git a/net/core/dev.c b/net/core/dev.c
index d88af07aea29..85b7c61015c7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -13692,6 +13692,7 @@ static void __init net_dev_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, num_tc);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, mtu);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, needed_headroom);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, tx_extra_headroom);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, tc_to_txq);
 #ifdef CONFIG_XPS
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, xps_maps);
-- 
2.56.0

