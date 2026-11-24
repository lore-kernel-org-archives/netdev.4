Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543185;
	b=iTt824BCS8ch0Opl2vGYG3hD2mJdnMd0lqMf0nopdfB/aFB8aLm6DM4qWAzb/6xXf1T9
	 /WwH2A17btfpBdX7XV93khrds4EnB0QpHkxF4i3x2yXe3c3Ad73RXk1uWaGRIqapZYp7M
	 4Z6I3H5J9+p53I0V/nror906XFi2jTiZHQ7SOr3k4gLNR5RQM4EgWfaLBJ8dgcJX5HinJ
	 ZjZHMZkT79Kw3Z9oIO12+Px1+dAbFYWGjx19eAuESt1vzl+I26rbdDIU+TLeBVtKY4vTJ
	 al1XYlpSdeIRt2d8WHja347Rf9o/XWMeWpp4SAOqJ7l7Ut6SUICGv5B5bNdlTTxaWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Id3aruoTt9p41ov0UzfjZQHi+NKnHu/LyrCozIoZe8o=;
	b=w2yxCIeIR/1jeJCAHXTunGNiXUJ/TcyYMjB4mH71xJH01DqXrVDA4/JdsWJ4ojlOODtY
	 QjO3vuj2Il7rZ/YTHnWEpPjs9ZQmiMJNDKtYrZMJzpdtakSp2t10PMw3D3D3+FcIvPKr+
	 kWqqB0JyuM6QON+M5KyVX8t0INjsNRm7+1iBsM+gv4brLY3gGy1i5gC02RUVHkMf4MuNu
	 GXvPK8Pkf/Cc3OVcC7kb2vYrInEommyDmcceRNKC6tmBTUoTCONQvqroUsvJ37YRQX1uU
	 p5cnlLGw29Vho6VBOE1qJ0mH92HLr5mwXW224Ua9YXVD0EszNtI3q8uJpNelQoTNAKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QxTcKneD;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77798606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77798606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QxTcKneD
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so6597835a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543183; x=1796147983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Id3aruoTt9p41ov0UzfjZQHi+NKnHu/LyrCozIoZe8o=;
        b=QxTcKneDwvtdOC299tZn9xw97835cRZXmaZkQk24rVeZzk4RK3GSF9B7EOMZ3kEhoO
         671efgyHRPVjZXZ+A54xg7e9c4/anntqhSxPrZLviczRUjperlfAkuTQrXzSfptTxs+7
         7nnsfJyBHgRATtpRGt7HLHlIAI0ukVdn7RIgqXLaUXAESe/Zi01SMmzxPMd4lAg1/OLj
         TVinkAgOcMc9w45Z3I2NYyn+pXSMrO65ayYEv7snxF3UkwMl2Nn+VVBNqyNRMDRx6WGP
         QlIOepd0ewcKo9WNI3SVcLfrQxBhViEtlvY+OP+b7CPCx6Esl7eDPIBDfLb7jiwd4ZOJ
         ERrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543183; x=1796147983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Id3aruoTt9p41ov0UzfjZQHi+NKnHu/LyrCozIoZe8o=;
        b=jKjgttN5xSuGMDScHNE7p3ux7pyERAZOQIT2pVDUWy339XjxqylJRdGyT20WbLbkny
         cV7fyNpeoz6NMeFuK1G6Q1aQXbeVFD8wGJ8y/8Z/Kdpg48drpF/gmqF8traEwX7iQTQY
         vmSbracqcC4zCOkVnsiEsuHXCv/pBFfjyKQ+M6STet1E8YU5ON943i/LrNPfydrgl0u0
         Lkn+mZkKVSwd7ijd2AhpcSR/27n+TIV31DKY+lD9K/jGN0sZXGf+d2/dEH5htYuVAoPN
         9NczDKX40xVh8KIuMFnqeLlfGrQP+C+m2SiEDfcg33wbCeguDat9cr9CKPxq2EPaw4N3
         IYdA==
X-Gm-Message-State: APuU4Z8vBgS6S5F7uGT0ZiNMGdhVf6zXqfOw1YgksYAc+BFQl4JR1P+I
	KfqlEY3e/UsWphI8U9fqu3FkNDa7yF+TlMp3BcxFRiZO3oyDqns01X2dsgMeF7AmwYDFnK6msQF
	5rVJQ60Eh0w==
X-Gm-Gg: AZFdTZcFbGS+GZKwS5Ts9CApcRIQ6CAgxDQ35YdWYe6BAJgOO8boJueNr2BjDjYLCet
	z0Yr8AxI4/7zDRxfxP42BxPCKUiTI8dS1rWX7P+e9RlqszBZTJdUMUkLXNitHsFLJgpHqNDSSG9
	iscnRddCqIqeIb5AGcdrzNG0nUVjWfpc707/u+Al7Wg4Vw3nhpzYjyuxrCqHssrM3KFBQmWyUn6
	yzFz+hzA3oy1z9tW1ebu43te5r2VSR8HQs+kTGFNZQmzy8Tkn0UaxIrWSBKr6zn52OGwyJ1IwiX
	JhRCSfjmsXbwmk8NzdASZYuBnRYtZvsic02MS7zVn55QaOHOGbUh369PRjXR1WjdJ4BoeSdEvAS
	Nb1ax2M6bmsKWxKVyyiVhuDED7CIR7om3eTZlmSpYs+E/KYPsSY4iq08ScP/4nZmJBhtP6gT08A
	rQMyjI1gEggKOvqDQJeGGIXmOc55mo8MMC6BD8y8DkxZTPK65dhnlThuf9IsJ4dMb8KyTHw3MLk
	yIJPXghez5jWsQFpMJeqmGouB+N/Ub0whJBUdGnYnv9O8Xuw9IzrYZEdK6xUtS9OCqFw/KFLDv+
	xAbIzJcfix0jUemQ6gUNeljNLb1ZNX1YOmCX/S3K3FNJUUI=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id 4fb4d7f45d1cf-6ba37ea6d00mr12237778a12.33.1795543182884;
        Tue, 24 Nov 2026 09:59:42 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.59.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:59:42 -0800 (PST)
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
Subject: [PATCH net-next v3 11/11] selftests: net: tx_extra_headroom: test the veth attribute
Date: Tue, 24 Nov 2026 17:58:24 +0000
Message-ID: <20261124175824.60470-12-tianyi@cloudflare.com>
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

Create a veth pair with VETH_INFO_TX_EXTRA_HEADROOM set to 64 bytes
through YNL and move the peer to another netns. Check that both ends
report 64, and that tx_extra_headroom of the peer is 64. The test reads
it at tcx ingress, because an attach at tcx egress would recalculate
the value set at creation. Then check that tx_extra_headroom of the
sending end is 64. With XDP on the peer it is 64 + 256, because the two
values are added. Also check that a value above 512 is rejected.

The helpers leave the RtnlFamily socket to garbage collection, as
link_netns.py does.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v3:
- Check the value set at creation at tcx ingress of the peer (Sashiko).

v2:
- Test VETH_INFO_TX_EXTRA_HEADROOM with YNL only (Jakub). The IFLA
  tests of v1 4/8 are gone, so the patch no longer carries
  David Keogh's sign-off.
- Drop the VLAN case of v1 4/8. In v2 no code copies
  tx_extra_headroom to a stacked device.
---
 .../selftests/net/tx_extra_headroom.py        | 70 +++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/tx_extra_headroom.py b/tools/testing/selftests/net/tx_extra_headroom.py
index 02ae509ae8c2..cc33c4fa60bb 100755
--- a/tools/testing/selftests/net/tx_extra_headroom.py
+++ b/tools/testing/selftests/net/tx_extra_headroom.py
@@ -3,15 +3,17 @@
 
 """Tests for tx_extra_headroom."""
 
+import errno
 import socket
 import struct
 from pathlib import Path
 
-from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_ge, ksft_gt
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_ge, ksft_gt, ksft_raises
 from lib.py import KsftSkipEx, KsftFailEx
 from lib.py import ksft_busy_wait, ksft_variants, KsftNamedVariant
 from lib.py import cmd, defer, ip, bpftool, bpf_prog_map_ids
 from lib.py import NetNS, NetNSEnter
+from lib.py import Netlink, NlError, RtnlFamily
 
 BPF_OBJ = Path(__file__).parent / "tx_extra_headroom.bpf.o"
 XDP_OBJ = Path(__file__).parent / "lib/xdp_dummy.bpf.o"
@@ -37,9 +39,34 @@ def _setup_addrs(peer_ns, dev, peer):
         ip(f"neigh replace {addr} lladdr {peer_mac} dev {dev} nud permanent")
 
 
-def _setup_veth(peer_ns):
+def _add_veth(tx_extra_headroom):
+    """Create veth0 and veth1 with VETH_INFO_TX_EXTRA_HEADROOM through YNL."""
+    # Without names, the peer is created first and becomes veth0.
+    rtnl = RtnlFamily()
+    rtnl.newlink(
+        {
+            "linkinfo": {
+                "kind": "veth",
+                "data": {"tx-extra-headroom": tx_extra_headroom},
+            },
+        },
+        flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
+    )
+
+
+def _veth_tx_extra_headroom(name):
+    """Return VETH_INFO_TX_EXTRA_HEADROOM of veth device name."""
+    rtnl = RtnlFamily()
+    link = rtnl.getlink({"ifname": name})
+    return link["linkinfo"]["data"]["tx-extra-headroom"]
+
+
+def _setup_veth(peer_ns, tx_extra_headroom=None):
     """Create veth0 in the current netns and its peer veth1 in peer_ns."""
-    ip("link add veth0 type veth peer name veth1")
+    if tx_extra_headroom is None:
+        ip("link add veth0 type veth peer name veth1")
+    else:
+        _add_veth(tx_extra_headroom)
     ip(f"link set veth1 netns {peer_ns}")
     _setup_addrs(peer_ns, "veth0", "veth1")
 
@@ -353,6 +380,39 @@ def test_tag_max() -> None:
     ksft_eq(bss["tx_extra_headroom"], TX_EXTRA_HEADROOM_MAX)
 
 
+def test_veth_info() -> None:
+    """Check that VETH_INFO_TX_EXTRA_HEADROOM adds to tx_extra_headroom."""
+    with NetNS() as send_ns, NetNS() as peer_ns, NetNSEnter(str(send_ns)):
+        _setup_veth(peer_ns, tx_extra_headroom=64)
+        ksft_eq(_veth_tx_extra_headroom("veth0"), 64)
+        map_id = _load_progs()
+        # An attach at tcx egress recalculates tx_extra_headroom, so read
+        # the value set at creation at tcx ingress of the peer first.
+        with NetNSEnter(str(peer_ns)):
+            ksft_eq(_veth_tx_extra_headroom("veth1"), 64)
+            _attach_tcx("veth1", "ingress", "record")
+        _send_udp4()
+        ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 1)
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 64)
+        with NetNSEnter(str(peer_ns)):
+            bpftool("net detach tcx_ingress dev veth1")
+        _attach_tcx("veth0", "egress", "record")
+        _send_udp4()
+        ksft_busy_wait(lambda: _read_bss(map_id)["count"] == 2)
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"], 64)
+        _attach_xdp(peer_ns)
+        _send_udp4()
+        ksft_eq(_read_bss(map_id)["tx_extra_headroom"],
+                64 + XDP_PACKET_HEADROOM)
+
+
+def test_veth_info_above_max() -> None:
+    """Check that a value above the maximum is rejected."""
+    with NetNS() as ns, NetNSEnter(str(ns)), ksft_raises(NlError) as cm:
+        _add_veth(TX_EXTRA_HEADROOM_MAX + 1)
+    ksft_eq(cm.exception.error, errno.ERANGE)
+
+
 def main() -> None:
     """Run all test cases."""
     if "/sys/fs/bpf type bpf" not in cmd("mount").stdout:
@@ -367,7 +427,9 @@ def main() -> None:
               test_push_detach,
               test_push_peer_xdp,
               test_push_two_progs,
-              test_tag_max])
+              test_tag_max,
+              test_veth_info,
+              test_veth_info_above_max])
     ksft_exit()
 
 
-- 
2.56.0

