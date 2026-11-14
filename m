Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660975;
	b=nJY6Qy81c8eTcv/PN2aSxo0gDkDKm36lF1zaRfbkdMNxxwfgnE+bdnL6vvkDzKLFShAv
	 s4k71HfQbX/L7E1ZSp0ay2zS4rRRt3lg1WvHaKNFEMDAWHivtGMdCaeDN0PYhOeFc43sg
	 yru5JD+SA0k1KwL36uwR/LWjBYZuOf/09R/wq0j09bKWiyCrcVOP3Z7HNQjr3pZzIJK3q
	 BpO26yJkhbz3P1FzUSxUV1/+a3XjpCyVeNRZC4Jf9JN4Dv+xFyCIMhlzuX/VIhshb+iFL
	 oieevdRYsRTqaxM8Vo+yFccXfsdLqLeStiWCBoKykNQL1n/+khxnVFW3Y6xqtUv2nuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
	b=kHRhxM0ixUbYX23J7gLAOPTCgpQckZRJ1DDmzgn1kzgYPIfXTVoTdyk35dI4ih40XwTF
	 UAnEwrk5Dl7LQcKyWC/n4B3rZbZP1hdeXsfSAjFLMIj1XjS57ZrVyyAgNIbaT9c7L3XZb
	 EnwQZ2kCMyw2Z4u1fabGSmVIBFhH+yn1y+lDYJGbQwUi1jwocn0USnyOanUtX30UxPCJD
	 i/Fexc061mHFFrKyOvGSraSrSUG24KlUNz112PEFMSs8KYJsUApjha96JuhXXlvkRvHry
	 EhUHN0WHtIKXuRzJrNQ/uqVh2uF1jne87DrMpMgN6IdqepR5Q7wdArdaYEmmbmKobHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NICbofQR;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C52606A331
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C52606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NICbofQR
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3094618a91.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1794660974; x=1795265774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
        b=NICbofQRsUoCCo0rtelZz8jSPL5MoUVsfXwtBkORVxRXVaNBLXDkdU/fKNqtO5PzU4
         KPlMLe+WRz6W3taJeYFH8NUIKOxcrlJdzyxd7SNbBacuxGci52/ERqLnkpd9tBSbcqP+
         dqIccPke+VaM2vOKGM5C14YDI+613R8DdS+rgv56ZsKn8kuDE3+PRusP0Wk/yR8UOAw6
         aothGZYHAhaljJov2ywLuIXZA2EJjSZzRcvHr5D8AKFUM8tZjTmYqWmHJ9bHYMq2zhs7
         iHHdTfSmoLVzPGXDLjyP4xj+R9DVAJzc/7QfzJyuhdttCNobUEfEuH/Kv2IHDEwWMCqP
         JINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660974; x=1795265774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qwj16+X92OdYAGNxs/Vl6la6Mew3rTAyjN2yfxuPiQg=;
        b=abX3XoyDG8FHhnO3R7irGTIyBwPECLeByjMTKjoOcdHUt4904EM+k9sYYfELS8Y3wP
         qiYX3PBul/I5KA2YQw2mDIdApj/MJeVzyTlsOj+5Os9qELriF5in7qXyuXrO/lZPFAMT
         yeAUwu+kMZpxLkV4QxFitfU6eWkLj1m3xNUSH7et9W0zjB8gnaUsLWql3o7aFG/vXsya
         srXP1CeOLxwR5C2Z8xqm8BpKEyacEkr0qrL/DEDdlhJHicRxQOsi5T5cA5C/Gn33+MBn
         RQLHQrvsm/wz5LCBUJh1M2lRNHF2uOsxIHgPFUgPCoa/7RI3918KnqsDaVcfL+i3RtVE
         bm4w==
X-Forwarded-Encrypted: i=1; AL+hErHNYSRRl4opIXZd+tiBDcnKz+rOTjbU3PWlrNmbpTbyOGl7OVwuiQs3AISafMo3+jACdlDmMH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jv6CxygdbUXmEzNBCWkSK3Lw0kqqYiGfDu4Tv/+033zBLimUd
	1XhY6dzzMdDrjSrOi69PpXFllJ33Q42wu39iSTKT5t1sh+MNZl/otCulYZPXB6NgIrQ=
X-Gm-Gg: AYBFou2QhGnCLR+vsQx3CYrBT2NeCgXwlHnDwzRFhYKUvuzNsVo/ZiK5EJkshz6QfWq
	zTHEvpYqg1+h//uDAzgb/vfzHJjZ88LPeDDHsjBK3c0DazeyD9aXzxddVpICwe6w89GmvdSlNp0
	SbQLgUtU7l3JFPa4VCcX5GhiB+MHiXWm42sDQ4jwJtMthRYBSuOMFHqoPVwqgeaxCUGGr+1XfE5
	7zwh8RW80wcDjKI6VCplocuv2VCQYLfE+ge0pBx05LjCypbkIMbF1OLNRoZXjyxtphywT4umuCn
	otp78GoO4ay5PagwG0qfHjUC1M1XeGJ0PKk8puh03PCB0kV7b98RyjIDmOhymxHqIGjGZTcyyGe
	jsmZzdXobQ4dDM+LynBF1yKzsgmO3ozdmpCA2qguj/ikFJ76EDqLLtUzLxXbSu6/P5N8E7Tw5yA
	Gtyx38Fh716oXPCxt/lc5OwoA/lvlHT7+uvlE3YgZOoRUECezol5e9O+8w8KRcfaqpCgqF5RABd
	3jl4e0Pj6NTI9i/SZb7tfIkjMDBBK0inIHm/LeoA84+Pkoh66ElJlH9vgSY1K32MfnXoZwpe360
	GSgB/xEqRbUnxQjShGSo6HY6K9S+S1D7dc5/JPE=
X-Received: by 2002:a17:90b:2c8d:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b1b0d8a4d0mr5854784a91.64.1794660973616;
        Sat, 14 Nov 2026 04:56:13 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c800esm2332710a12.29.2026.11.14.04.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:56:13 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm6: gate the local error on the frame's own socket
Date: Sat, 14 Nov 2026 19:55:52 +0700
Message-ID: <20261114125552.1319352-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

__xfrm6_output() decides to report a too big frame as a local error by
looking at its sk argument, but xfrm_local_error() reports to skb->sk
and dereferences it unchecked.  The two differ for a UDP tunnel: vxlan,
geneve and other udp_tunnel6_xmit_skb() users pass the tunnel socket as
sk, while a frame they forward has no skb->sk.  When such a frame takes
an IPv6 tunnel mode xfrm bundle and exceeds its MTU, xfrm_local_error()
oopses on skb->sk->sk_family in softirq context:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   <IRQ>
   xfrm6_output+0x599/0xae0
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   vxlan_xmit+0x1369/0x6540
   dev_hard_start_xmit+0xe3/0x5b0
   __dev_queue_xmit+0x18e7/0x3550
   ip6_output+0x360/0xec0
   ip6_forward+0x1573/0x35c0

Commit 1620c88887b1 ("xfrm: Fix the usage of skb->sk") changed this
test from skb->sk to sk.  Test skb_to_full_sk(skb) instead, as
xfrm6_tunnel_check_size() already does; commit 6973a21ee73c
("ipv6: xfrm: use full sockets in local error paths") made the IPv6
callees use full sockets the same way.

A frame without a socket then goes to ip6_fragment(), which sends an
ICMPv6 Packet Too Big to the source address of the outer header, the
local tunnel endpoint, and drops the frame, as before 1620c88887b1.  A
caller that passes a NULL sk while skb->sk is set, such as
ip6tunnel_xmit(NULL, ...) in ip6_tunnel.c, takes the local error path
again, also as before that commit.

Fixes: 1620c88887b1 ("xfrm: Fix the usage of skb->sk")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

Notes:
    Tested in virtme-ng on 7e1392a42ea2 (v7.4-rc2+) with KASAN: vxlan over
    an IPv6 ESP tunnel, a forwarded frame above the bundle MTU.
    Unpatched: the oops above.
    Patched: no oops in 3 runs.  A separate run with nstat in the
    forwarding netns shows Ip6FragFails 0->2, Icmp6OutPktTooBigs 0->2 and
    Ip6FragCreates 0->0.
    The reproducer script is available on request.
    
    Not changed here:
    - The xfrm6_local_dontfrag(sk) test in the same function still uses the
      argument.  Its callee xfrm6_local_rxpmtu() returns on a NULL skb->sk
      since 6973a21ee73c, so that mismatch does not oops.
    - iptfs_is_too_big() has the same sk vs skb->sk mismatch (IPv6 oops,
      IPv4 silent drop).  It is left for a separate patch; it was already
      pointed out in two reviews:
      https://lore.kernel.org/r/20260908224856.1591189-1-kuba@kernel.org
      https://lore.kernel.org/r/179369310739.488856.16665150928122536725@kernel.org

 net/ipv6/xfrm6_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/xfrm6_output.c b/net/ipv6/xfrm6_output.c
index 44b221a09a0c..54fcf4b43091 100644
--- a/net/ipv6/xfrm6_output.c
+++ b/net/ipv6/xfrm6_output.c
@@ -95,7 +95,10 @@ static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 	} else if (toobig && xfrm6_noneed_fragment(skb)) {
 		skb->ignore_df = 1;
 		goto skip_frag;
-	} else if (!skb->ignore_df && toobig && sk) {
+	} else if (!skb->ignore_df && toobig && skb_to_full_sk(skb)) {
+		/* xfrm_local_error() reports to skb->sk; a forwarded frame
+		 * sent through a UDP tunnel has none, sk is the tunnel's.
+		 */
 		xfrm_local_error(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.52.0

