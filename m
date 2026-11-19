Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052335;
	b=XTcrbHA4Q4aTCyNfJgMiJTes6776qGUtTZtL2XLSjQAs+GguP321ILMKMxoIOCT+YaZA
	 t5kFFCc1OFHg/C9X4WmwsvsJK6nuPZzAenO39F2MaXDXK097rpgzUC4HnPhxMfdDNYwN5
	 ZLaOzNi7aTFaF5TeRoSDuVS9QZdcwIZMpP7rrdbWKGQFnbSfBfHUJ6G4MReGi1tIlYHRy
	 FFRCk+O8uolkovhIc33oOG2PHs19eelaItkqexteFSd1aRWcL6d0tVZNq7lxKukJiNDkn
	 K6E6OA517JHASP2+p1ghLn0Cv+iIVIz8jpN9Tp82ZK2neRyI+t+ptMtWrE9/IVK/lIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=70IyT03vVEKmbE3A8jTiSAC1UuYRra24djwihgvA+zw=;
	b=vZhSF+HHcODFTP1yhNqtZMXB0gIzgcB0KsPYrE8eVGld8jL5I11QVutTKc9aci15x3pU
	 XKsYb7kKNHXLek6zyfHmqdMsltYaquuGhoTyy+gXbSoyTQTAOjClqBP2MKxlAcmbniM5f
	 N8eEYbvIjH0UMMlVIcPrNzPdzGRgBPAuQYRUfl6S1E2pUxKt8c/19YppoHoGH1VNAY+En
	 UgOXV2OUPwP5K4nOBd1sqgSY/8XlUtGHyd3aBD7/CoCzXE2VjnJivVil1TW/5hUiw+uit
	 mN0SPgEHiBv3HO6/HrqO8MC2Xn1bcQm29eNrU/nTQlr5h1bIatp83D4TcDcJaYwclcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OccZeeSi;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972260A2612
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2972260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=OccZeeSi
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so288373566b.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052333; x=1795657133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70IyT03vVEKmbE3A8jTiSAC1UuYRra24djwihgvA+zw=;
        b=OccZeeSifJv9/qm6PHsRQLFJm46St0Z8WU09Jae/SiLHBRkw8AC7ibXeVgBSvSTZK/
         V9KV5UMH8NxCqQPJjxlJZnUuFPFpzGxp4KWy7vgP1hZz0FP7w5HyzKzrew9qLZErkSUt
         o2cEmPzHDXLG92C3Ar7iX3blApGSN4N4K10IgotL0gOrB/BdLofTg1i3+LMrgRNM5YPA
         7lVrniS1Pdmoho8ENmXNw7GAS2NDbs2C+p08kWLhIn3ioV+NOhY+F9GeRv9TYB50369K
         f4F9Ast68X1b+58hXvB6ZCe/be/lBTKDb3+ksRqOcCAcJhRCXnyGv8tRE96L3nt8+jIo
         PJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052333; x=1795657133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70IyT03vVEKmbE3A8jTiSAC1UuYRra24djwihgvA+zw=;
        b=VMWA2jH0sOgSTJ0y41FuO9ZpIzI99ETuHt7gOLgEo84oDP5n4J6MqC12ABkaSB35lu
         ZkcABxkXK6Ie0KIk4uyaqxJy2hO1QKCDErcgxs6Qpc4psUvk2lyL/xIZU92TKsfn1Wrq
         cCIGGHbN05SJ4zxJSKxzcqojQi5aL62U6T58ETg0ilqqGfrD9tF1ZFnZEdVJIHOPYL5I
         KuBWLWTvp9+ATXkGE4RBdkOoYkI5E2JRzFyS5PNUjOc+soD/R0f8HRNAQGPy2XHmKRue
         ZVUwHBA5gpGvyR/wxXrH7aa70F9Zf3zYBS9C2iKHxIJeY+njqyo3cCfGarE/IJBhmCbF
         iiCQ==
X-Gm-Message-State: APuU4Z+Lpl6ZRWoC10w6mIcqIxfNl/DMmD2XE4PFfIQhaP6Tb3q7WxAd
	RCMA+2O6KUy+FpckP+pCOjFQH2A459zyEa0BoluJLb5fs7TBBOQxehU6R/M5xyPF0v6Na7KUwek
	u+ydY2Zw=
X-Gm-Gg: AYBFou1/1tbO83Li0BhxZP9g4qJelcWsJtQhgMQhIhbdHnMs5VW091VraIRIg7uNHCQ
	mydoQgU1PwQUb44ST9bJrBXjW1ThL519uWfwTo5D33ruZAJX2ZoyVV+JQhutCCTp0ah0P8HmUZT
	oF3nlz++TOHtdsD7wVnZqHPNXufXr9UKYijfEYgnUTJg7p66P16LAx1w1hloAhqXRmIAArg3GgQ
	Ou4szstzc/MBz4ayakBZCEAIbQOsfgGUCFUBP4zeckR5X+Tz804E4IcnKUJiwk1paIk4PEG21GR
	m2YOGT182SzGt5ivA25lxCOF4pOa+yORM7ATtNv3h2M2G8l8bTSDrPDISAHJPdQg5FcP3/iC6KE
	zVUV3y6oqMuKdvuO8nhNlRtBFVtI9uHnt9fwzDPDJTrr6b8QgrJ51t6TDZnF75/byBYb+gEqvE4
	NcuTdOsYgELBDMPXcQlJwzl+KYFqrwGo1CrmK65XLgaGKdyhGPKnT+pol/mtT0L8hkqeFc8iVQ3
	nD7S9UVw3xo09frTDOsWbsg44+SRCeHy1Y2vnqKIdNWYQn2iLCQRGDRQTzIFct+4/S3fWwczCrS
	4VyTSTe9u3t1pnMnEIULc+J0NgMaBzTSYxVuJZlRdxvY9AWt0cT0K4L7vw==
X-Received: by 2002:a17:907:1c85:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c510e2de6fcmr393876766b.21.1795052333364;
        Wed, 18 Nov 2026 17:38:53 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.38.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:38:51 -0800 (PST)
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
Subject: [PATCH net-next v2 05/11] selftests: net: add tx_extra_headroom test
Date: Thu, 19 Nov 2026 01:38:24 +0000
Message-ID: <20261119013830.36935-6-tianyi@cloudflare.com>
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

Generic XDP copies an skb with less than XDP_PACKET_HEADROOM (256 bytes)
of headroom. When XDP is attached to one end of a veth pair, the kernel
now sets tx_extra_headroom of the other end. A locally generated packet
then has enough headroom, and generic XDP no longer copies it.

Test this for six senders. Each one allocates the skb in a different
place: UDP over IPv4 and IPv6, raw sockets with IPPROTO_RAW over IPv4
and IPv6, AF_PACKET and AF_XDP in copy mode. xdp_helper -t sends the
AF_XDP frame. The peer runs xdp_dummy in generic mode.

tx_extra_headroom.bpf.c is a TC program. For the test packet it records
needed_headroom and tx_extra_headroom of skb->dev, and skb->pp_recycle.
For a frags program, generic XDP copies a packet into a page_pool page.
At TC ingress of the peer, pp_recycle then shows whether the packet was
copied. A packet socket for ETH_P_ALL on the sender holds a clone of the
skb, which forces a copy. This checks that pp_recycle detects the copy.

netkit implements ndo_get_peer_dev too, so the same holds for a netkit
pair. Test it once, with UDP over IPv4 and netkit in L2 mode.

test_detach attaches native or generic XDP to veth1. needed_headroom of
veth is 0, so tx_extra_headroom of veth0 must be XDP_PACKET_HEADROOM.
After detach it must be 0.

test_bond adds veth1 to a bond and attaches native XDP to the bond,
which propagates it to veth1. tx_extra_headroom of veth0 must again be
XDP_PACKET_HEADROOM, and 0 after detach.

test_bridge_vxlan adds veth1 to a bridge with a vxlan port. This raises
needed_headroom of both ends. Then the test attaches XDP.
needed_headroom plus tx_extra_headroom must be XDP_PACKET_HEADROOM.

The test does not check for netkit, bonding, bridge or vxlan, because
the selftests/net config enables them.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- v1 4/8 tested IFLA_TX_EXTRA_HEADROOM and is dropped with it.
- Built from v1 7/8. Attach XDP to the peer instead of setting
  IFLA_TX_EXTRA_HEADROOM.
- Detect the copy with skb->pp_recycle instead of comparing the
  headroom before and after the attach.
- Add the cloned, netkit, detach, bond and bridge cases.
---
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/lib/xdp_helper.c  |   2 +-
 .../selftests/net/tx_extra_headroom.bpf.c     |  81 +++++
 .../selftests/net/tx_extra_headroom.py        | 285 ++++++++++++++++++
 4 files changed, 368 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/tx_extra_headroom.bpf.c
 create mode 100755 tools/testing/selftests/net/tx_extra_headroom.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index c80dabbcc907..76473dc187a4 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -123,6 +123,7 @@ TEST_PROGS := \
 	test_vxlan_vnifiltering.sh \
 	tfo_passive.sh \
 	traceroute.sh \
+	tx_extra_headroom.py \
 	txtimestamp.sh \
 	udpgro.sh \
 	udpgro_bench.sh \
diff --git a/tools/testing/selftests/net/lib/xdp_helper.c b/tools/testing/selftests/net/lib/xdp_helper.c
index 1111631efd73..5deb97922e6c 100644
--- a/tools/testing/selftests/net/lib/xdp_helper.c
+++ b/tools/testing/selftests/net/lib/xdp_helper.c
@@ -80,7 +80,7 @@ static int send_frame(int sock_fd, __u32 len)
  * through the TX ring and exits.
  *
  * it is used by queues.py to ensure the xsk netlinux attribute is set
- * correctly.
+ * correctly, and by tx_extra_headroom.py to send a frame.
  */
 int main(int argc, char **argv)
 {
diff --git a/tools/testing/selftests/net/tx_extra_headroom.bpf.c b/tools/testing/selftests/net/tx_extra_headroom.bpf.c
new file mode 100644
index 000000000000..d80f4567873a
--- /dev/null
+++ b/tools/testing/selftests/net/tx_extra_headroom.bpf.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Record the headroom fields of a test packet. */
+#include <stdbool.h>
+#include <linux/bpf.h>
+#include <linux/if_ether.h>
+#include <linux/in.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <linux/udp.h>
+#include <bpf/bpf_core_read.h>
+#include <bpf/bpf_endian.h>
+#include <bpf/bpf_helpers.h>
+
+#define UDP_TEST_PORT 9999
+
+struct net_device {
+	unsigned short needed_headroom;
+	unsigned short tx_extra_headroom;
+} __attribute__((preserve_access_index));
+
+struct sk_buff {
+	struct net_device *dev;
+	__u8 pp_recycle:1;
+} __attribute__((preserve_access_index));
+
+void *bpf_cast_to_kern_ctx(void *obj) __ksym;
+
+__u32 count;
+__u32 needed_headroom;
+__u32 tx_extra_headroom;
+bool pp_recycle;
+
+static bool is_test_packet(struct __sk_buff *skb)
+{
+	struct ipv6hdr ip6h;
+	struct udphdr udph;
+	struct iphdr iph;
+	__u32 off;
+
+	if (skb->protocol == bpf_htons(ETH_P_IP)) {
+		if (bpf_skb_load_bytes(skb, ETH_HLEN, &iph, sizeof(iph)))
+			return false;
+		if (iph.protocol != IPPROTO_UDP)
+			return false;
+		off = ETH_HLEN + sizeof(iph);
+	} else if (skb->protocol == bpf_htons(ETH_P_IPV6)) {
+		if (bpf_skb_load_bytes(skb, ETH_HLEN, &ip6h, sizeof(ip6h)))
+			return false;
+		if (ip6h.nexthdr != IPPROTO_UDP)
+			return false;
+		off = ETH_HLEN + sizeof(ip6h);
+	} else {
+		return false;
+	}
+
+	if (bpf_skb_load_bytes(skb, off, &udph, sizeof(udph)))
+		return false;
+
+	return udph.dest == bpf_htons(UDP_TEST_PORT);
+}
+
+/* Attached at tcx ingress and at tcx egress. */
+SEC("tc")
+int record(struct __sk_buff *skb)
+{
+	struct sk_buff *kskb;
+
+	if (!is_test_packet(skb))
+		return TCX_NEXT;
+
+	kskb = bpf_cast_to_kern_ctx(skb);
+	needed_headroom = kskb->dev->needed_headroom;
+	tx_extra_headroom = kskb->dev->tx_extra_headroom;
+	/* For a frags program, generic XDP copies into a page_pool page. */
+	pp_recycle = BPF_CORE_READ_BITFIELD(kskb, pp_recycle);
+	count++;
+
+	return TCX_NEXT;
+}
+
+char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
new file mode 100755
index 000000000000..4058d0e64fc5
--- /dev/null
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -0,0 +1,285 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for tx_extra_headroom."""
+
+import socket
+import struct
+from pathlib import Path
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_gt
+from lib.py import KsftSkipEx, KsftFailEx
+from lib.py import ksft_busy_wait, ksft_variants, KsftNamedVariant
+from lib.py import cmd, defer, ip, bpftool, bpf_prog_map_ids
+from lib.py import NetNS, NetNSEnter
+
+BPF_OBJ = Path(__file__).parent / "tx_extra_headroom.bpf.o"
+XDP_OBJ = Path(__file__).parent / "lib/xdp_dummy.bpf.o"
+XDP_HELPER = Path(__file__).parent / "lib/xdp_helper"
+PIN_DIR = Path("/sys/fs/bpf/tx_extra_headroom")
+PORT = 9999  # UDP_TEST_PORT in tx_extra_headroom.bpf.c
+ETH_P_ALL = 0x0003
+XDP_PACKET_HEADROOM = 256
+
+
+def _setup_addrs(peer_ns, dev, peer):
+    """Add addresses to dev and to peer in peer_ns, and bring both up."""
+    ip(f"addr add 192.0.2.1/24 dev {dev}")
+    ip(f"addr add 2001:db8::1/64 dev {dev} nodad")
+    ip(f"link set {dev} up")
+    ip(f"addr add 192.0.2.2/24 dev {peer}", ns=peer_ns)
+    ip(f"addr add 2001:db8::2/64 dev {peer} nodad", ns=peer_ns)
+    ip(f"link set {peer} up", ns=peer_ns)
+    peer_mac = ip(f"link show dev {peer}", json=True, ns=peer_ns)[0]["address"]
+    for addr in ("192.0.2.2", "2001:db8::2"):
+        ip(f"neigh replace {addr} lladdr {peer_mac} dev {dev} nud permanent")
+
+
+def _setup_veth(peer_ns):
+    """Create veth0 in the current netns and its peer veth1 in peer_ns."""
+    ip("link add veth0 type veth peer name veth1")
+    ip(f"link set veth1 netns {peer_ns}")
+    _setup_addrs(peer_ns, "veth0", "veth1")
+
+
+def _attach_xdp(peer_ns, mode="xdpgeneric", dev="veth1"):
+    """Attach xdp_dummy to dev in peer_ns."""
+    # For a frags program, generic XDP copies into a page_pool page.
+    ip(f"link set dev {dev} {mode} obj {XDP_OBJ} sec xdp.frags", ns=peer_ns)
+
+
+def _load_progs():
+    """Load the programs of BPF_OBJ, return the id of their .bss map."""
+    cmd(f"rm -rf {PIN_DIR}", shell=True, fail=False)
+    bpftool(f"prog loadall {BPF_OBJ} {PIN_DIR}")
+    defer(cmd, f"rm -rf {PIN_DIR}", shell=True, fail=False)
+    prog_id = bpftool(f"prog show pinned {PIN_DIR}/record", json=True)["id"]
+    return next(map_id for name, map_id in bpf_prog_map_ids(prog_id).items()
+                if name.endswith(".bss"))
+
+
+def _attach_tcx(dev, direction, prog):
+    """Attach program prog to tcx ingress or egress of dev."""
+    bpftool(f"net attach tcx_{direction} pinned {PIN_DIR}/{prog} dev {dev}")
+
+
+def _read_bss(map_id):
+    """Return the global variables of the programs as a dict."""
+    dump = bpftool(f"map dump id {map_id}", json=True)[0]
+    return {name: val for var in dump["formatted"]["value"][".bss"]
+            for name, val in var.items()}
+
+
+def _send_udp4():
+    """Send one UDP packet from veth0 to veth1."""
+    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
+        s.sendto(b"x", ("192.0.2.2", PORT))
+
+
+def _send_udp6():
+    """Send one UDP packet from veth0 to veth1 over IPv6."""
+    with socket.socket(socket.AF_INET6, socket.SOCK_DGRAM) as s:
+        s.sendto(b"x", ("2001:db8::2", PORT))
+
+
+def _csum(data):
+    """Return the Internet checksum of data."""
+    data += b"\0" * (len(data) % 2)
+    return 0xffff - sum(struct.unpack(f"!{len(data) // 2}H", data)) % 0xffff
+
+
+def _ipv4_udp():
+    """Return an IPv4 UDP packet from veth0 to veth1."""
+    udp = struct.pack("!HHHH", PORT, PORT, 9, 0) + b"x"
+    iph = struct.pack("!BBHHHBBH4s4s", 0x45, 0, 20 + len(udp), 0, 0, 64,
+                      socket.IPPROTO_UDP, 0, socket.inet_aton("192.0.2.1"),
+                      socket.inet_aton("192.0.2.2"))
+    return iph[:10] + struct.pack("!H", _csum(iph)) + iph[12:] + udp
+
+
+def _ipv6_udp():
+    """Return an IPv6 UDP packet from veth0 to veth1."""
+    src = socket.inet_pton(socket.AF_INET6, "2001:db8::1")
+    dst = socket.inet_pton(socket.AF_INET6, "2001:db8::2")
+    udp = struct.pack("!HHHH", PORT, PORT, 9, 0) + b"x"
+    pseudo = src + dst + struct.pack("!IxxxB", len(udp), socket.IPPROTO_UDP)
+    udp = udp[:6] + struct.pack("!H", _csum(pseudo + udp)) + udp[8:]
+    return (struct.pack("!IHBB", 6 << 28, len(udp), socket.IPPROTO_UDP, 64) +
+            src + dst + udp)
+
+
+def _eth_frame():
+    """Return an Ethernet frame with _ipv4_udp() from veth0 to veth1."""
+    src = ip("link show dev veth0", json=True)[0]["address"]
+    dst = ip("neigh show 192.0.2.2 dev veth0", json=True)[0]["lladdr"]
+    return bytes.fromhex((dst + src).replace(":", "") + "0800") + _ipv4_udp()
+
+
+def _send_raw4():
+    """Send one UDP packet from veth0 to veth1 with an IPv4 raw socket."""
+    with socket.socket(socket.AF_INET, socket.SOCK_RAW,
+                       socket.IPPROTO_RAW) as s:
+        s.sendto(_ipv4_udp(), ("192.0.2.2", 0))
+
+
+def _send_raw6():
+    """Send one UDP packet from veth0 to veth1 with an IPv6 raw socket."""
+    with socket.socket(socket.AF_INET6, socket.SOCK_RAW,
+                       socket.IPPROTO_RAW) as s:
+        s.sendto(_ipv6_udp(), ("2001:db8::2", 0))
+
+
+def _send_packet():
+    """Send one UDP packet from veth0 to veth1 with an AF_PACKET socket."""
+    # With protocol 0 the socket receives nothing, so the skb is not cloned.
+    with socket.socket(socket.AF_PACKET, socket.SOCK_RAW) as s:
+        s.bind(("veth0", 0))
+        s.send(_eth_frame())
+
+
+def _send_xsk():
+    """Send one UDP packet from veth0 to veth1 with an AF_XDP socket."""
+    xdp = cmd(f"{XDP_HELPER} - -", fail=False)
+    if xdp.ret == 255:
+        raise KsftSkipEx("AF_XDP unsupported")
+    if xdp.ret > 0:
+        raise KsftFailEx("unable to create AF_XDP socket")
+    ifindex = socket.if_nametoindex("veth0")
+    cmd(f"{XDP_HELPER} {ifindex} 0 -t {_eth_frame().hex()}")
+
+
+@ksft_variants([
+    KsftNamedVariant("udp4", _send_udp4),
+    KsftNamedVariant("udp6", _send_udp6),
+    KsftNamedVariant("raw4", _send_raw4),
+    KsftNamedVariant("raw6", _send_raw6),
+    KsftNamedVariant("packet", _send_packet),
+    KsftNamedVariant("xsk", _send_xsk),
+])
+def test_peer_xdp(send) -> None:
+    """Check that generic XDP on the veth peer does not copy the skb.
+
+    Each sender allocates the skb in a different function.
+    """
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_xdp(peer_ns)
+        with NetNSEnter(str(peer_ns)):
+            _attach_tcx("veth1", "ingress", "record")
+        send()
+        ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        bss = _read_bss(map_id)
+
+    ksft_eq(bss["pp_recycle"], False, "generic XDP copied the skb")
+
+
+def test_peer_xdp_cloned() -> None:
+    """Check that pp_recycle is set when generic XDP copies a cloned skb."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_xdp(peer_ns)
+        with NetNSEnter(str(peer_ns)):
+            _attach_tcx("veth1", "ingress", "record")
+        # A packet socket for ETH_P_ALL holds a clone of the skb, so generic
+        # XDP copies it.
+        with socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
+                           socket.htons(ETH_P_ALL)) as s:
+            s.bind(("veth0", 0))
+            _send_udp4()
+            ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        bss = _read_bss(map_id)
+
+    ksft_eq(bss["pp_recycle"], True, "generic XDP did not copy the skb")
+
+
+def test_peer_xdp_netkit() -> None:
+    """Check that generic XDP on the netkit peer does not copy the skb."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        # L2 mode has MAC addresses and ARP, as on veth.
+        ip(f"link add nk0 type netkit mode l2 peer name nk1 netns {peer_ns}")
+        _setup_addrs(peer_ns, "nk0", "nk1")
+        map_id = _load_progs()
+        _attach_xdp(peer_ns, dev="nk1")
+        with NetNSEnter(str(peer_ns)):
+            _attach_tcx("nk1", "ingress", "record")
+        _send_udp4()
+        ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        bss = _read_bss(map_id)
+
+    ksft_eq(bss["pp_recycle"], False, "generic XDP copied the skb")
+
+
+@ksft_variants([
+    KsftNamedVariant("generic", "xdpgeneric"),
+    KsftNamedVariant("native", "xdpdrv"),
+])
+def test_detach(mode) -> None:
+    """Check that XDP on the veth peer sets tx_extra_headroom until detach."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        _attach_xdp(peer_ns, mode)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], XDP_PACKET_HEADROOM)
+        ip(f"link set dev veth1 {mode} off", ns=peer_ns)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 0)
+
+
+def test_bond() -> None:
+    """Check that XDP that a bond propagates to the veth peer counts."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        ip("link add bond0 type bond mode balance-rr", ns=peer_ns)
+        # A bond only enslaves a device that is down.
+        ip("link set dev veth1 down", ns=peer_ns)
+        ip("link set dev veth1 master bond0", ns=peer_ns)
+        _attach_xdp(peer_ns, "xdpdrv", "bond0")
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], XDP_PACKET_HEADROOM)
+        ip("link set dev bond0 xdpdrv off", ns=peer_ns)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 0)
+
+
+def test_bridge_vxlan() -> None:
+    """Check that needed_headroom counts toward the headroom for XDP."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns)
+        map_id = _load_progs()
+        _attach_tcx("veth0", "egress", "record")
+        ip("link add br0 type bridge", ns=peer_ns)
+        ip("link set dev veth1 master br0", ns=peer_ns)
+        # The bridge raises needed_headroom of veth1, and of veth0 with it.
+        ip("link add vxlan0 type vxlan id 1 dstport 4789", ns=peer_ns)
+        ip("link set dev vxlan0 master br0", ns=peer_ns)
+        # tx_extra_headroom is not recalculated when needed_headroom
+        # changes, so attach XDP after the vxlan port.
+        _attach_xdp(peer_ns)
+        _send_udp4()
+        bss = _read_bss(map_id)
+
+    ksft_gt(bss["needed_headroom"], 0,
+            "vxlan port did not raise needed_headroom")
+    ksft_eq(bss["needed_headroom"] + bss["tx_extra_headroom"],
+            XDP_PACKET_HEADROOM)
+
+
+def main() -> None:
+    """Run all test cases."""
+    ksft_run([test_peer_xdp,
+              test_peer_xdp_cloned,
+              test_peer_xdp_netkit,
+              test_detach,
+              test_bond,
+              test_bridge_vxlan])
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.56.0

