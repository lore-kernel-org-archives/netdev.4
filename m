Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789558;
	b=J0dZnL0FGRXGinnTYJVGDL58xXO3YLRSyc5I+JzhHwvsEtjCtBPt2e/oaeMpbGoY9LZe
	 3FfXo0P9EmjCWFk3GccbWwSy1pBrk7JJfliZ3t/1S4Ik8TRY1DggnmNDnBLjW8Y+Zm++J
	 mDDB/vp1TcvsuszlHI74Wi1ug8SA1lkpbCGJWXNd+XwWQoriayG6K4QGIG+6NDbujY/s9
	 LOpECm9BKgoMLq8YxH3fkYmAskJSLfUEmmVdu3lPYE1+5nfYmB2olBINqyMJ/fKqhiAC6
	 lIwpW4Jc4SmURAHQg18EsTxL9rxeHyURCSyGctdtcKzfT/mt7Pcsu9NPM+ivYZvBg7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
	b=m3JUGZCUwZXUHSh2nAdsfh2oMu38La+E3bxJvC14BydFA/p4sEgfsbQLm6s7iGCJFy+t
	 +0sKMu8MXxLUqFMuGtCCdLvVwYx6IuPrpDecwWlNezSQ4sS9Ywsqm5SZkME9DAVz9DqsM
	 +KgAyFAP6bhVpcTe4ujvLzeQzXhG5Tfjvpsa7+Ld2YJHHk/LNJabL04/bCQBDXNucSO7p
	 f5jt27urgo5HiEGCeAitMPnooPzxqAlptSDFMYqd+FQE1OWwzS+F3KwJj4ecspCTP6nYL
	 ZMlcDqNos3MCCUnr7TlgBi7RbIdfNtpb6RC959GSneHmvyC8JCLhrUwSqFKD3ia2N1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=PNoPGUYd;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C93606E139
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C93606E139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=PNoPGUYd
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2893531bso4302018a12.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795789557; x=1796394357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
        b=PNoPGUYd72bdVRNz6j5xAK9fj1N/kgvqWgnVi+dggqk/FcbIEE3jmb3pEonFHHWsQI
         7TjQT8NVt2gY+sd52p5CjR07Wt8Mw7WRm5WiIUoT3i9eLTw5wYHp8ZxvOxbDJkBwi/8d
         cF/urv3guhCw71osZosrgSwWuTHFwLD8s9sqb404M+SqyeGfnPfShOlb1XHsskrjbCAZ
         xTE94+issUodeM8Ea44WxzBe8LFNVXPIqZxL6zyUP4BoIYW2Mom7a3rdjVDtjpcCo4Eu
         OWovmwPB/T1z3kVlKyWj0BGfl9hYXgekn3omCY8LR3ZM7tJ1dRq/OO2v4mtrXma8jfel
         Rh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789557; x=1796394357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
        b=ByWvC+jdMu5DUa0Lvtwv7wL9UOijSHdyOqPWNrO8mQ14PUFJlp/QlXgYOfRV7LHz9q
         CFVp0eIirChgw+GiyT8zgzNmlbyFDAKDO++Nv2pzbG6/d1Ca+cWMF0GwSaEn71HYXHtB
         Z62ertOnjsQyMsJyd8GH24oMfdqWoG6Q3bzyi4ylSCV2UP+wLZ+12Y8v5+o1arpTGd3f
         QlXsDY8cUDB0CDT1UYGbo88Hpm/IxC+3jCHNwIeTtpGvIAGz4HRMimOWg8SbQxzof0TR
         KJzNY9dshMffYk/Mt9UhhSTEiRuAZj4RprbpI4YEf/gBQKNwV4kKuP+0zK6SThV+4/Oq
         7Neg==
X-Forwarded-Encrypted: i=1; AL+hErHRGj0iThxK9DNqHBCBUOeOVbzERBxhxJisO0nP7rVGugfN2l4visIYstJKyNWhUnL2icSew3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rGOK8kDrSrc2rXaMw9eQSVIS2C/5TXKQjVFE7fu31VjxkmfyU
	zlwe4tQk/oKiquG8qiBaEgSyRk/w/ap9p0iBIt0XV/bR/5Jatk7AnWi8A3bYfsGbR7Y=
X-Gm-Gg: AZFdTZfT9iTlmkRBFO7DYXqulPH631Ds7d7axYGSxVNApVOnA85UQPbvEwlg+6U5fat
	sf/6y1SxTIAu90MN904ZEDi/DJD+fO7kQFtm3OjnvpB51zmCNdLfvOPavVaPUwa97XtVOOxQ/Mt
	jHgH4uBt6jSFj0YdOreFOzfbjfqeBu/WTxEur1c6csvarXVHg5m+0YHSiUKbk0mTVInRvUIeAeA
	nEnhgzt52ZTHU96kZAQy3ufnMdC678bLrFHaodx+2q/UBfDGBFnVELotdHTCkt+01KW+mBivfc9
	C1GjfacQv9k/iyP6zR/kYcmJs9A10/7qDT5wyM+0yzDdwj4kll8jZHc1NtfbF4ZzMZa3mLZUeL+
	jYENTQEOjhQb3S3AQSCTTQCwROOSnHfDcQ+Yp5AeNmNVoie7PV2vwdIpVKn1HIRtKZ1rvOY9gPo
	+1kjoagBjH2mcWyiOClH4YeMPlo1927kEzl8TesKgtaE/i/I3VneHQ4JA8ylBaWqFR6ZlygsTn4
	ZBI7VNhmH2YORrQ8mY21OcNzUFQHPZaMZ836to1eN8omrrBKCkeeuZ+evr5bY1Vjg0GrTxoo8lT
	JDImjV1J6q3q4dD6M09a5CCIOKapg4X1dXkIxAvnLKrgK5gVQe5JIKxydQ==
X-Received: by 2002:a17:90b:4b86:b0:3b5:35eb:5e94 with SMTP id 98e67ed59e1d1-3b535eb5ff2mr2981408a91.41.1795789556690;
        Fri, 27 Nov 2026 06:25:56 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm18324629a91.17.2026.11.27.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:25:56 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: report the too big error to the frame's own socket
Date: Fri, 27 Nov 2026 21:25:50 +0700
Message-ID: <20261127142550.66326-1-rmustafin@cloudlinux.com>
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

iptfs_is_too_big() calls xfrm_local_error() when its sk argument is set,
but xfrm_local_error() reports to skb->sk and dereferences it. vxlan
passes its tunnel socket as sk for a forwarded frame that has no
skb->sk, so an oversized forwarded frame on an IP-TFS SA with dont-frag
oopses:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   iptfs_output_collect+0x2c2/0x1170
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   ip6_forward+0x1573/0x35c0

Check the frame's own full socket instead, as xfrm4_tunnel_check_size()
does, so a forwarded frame gets the ICMP error. Drop the now unused sk
argument.

Reproduced on a KASAN kernel with vxlan forwarding over an IP-TFS SA;
with the fix the oops is gone and an ICMPv6 Packet Too Big is sent. The
xfrm_state.sh, xfrm_policy.sh, xfrm_policy_add_speed.sh,
vrf-xfrm-tests.sh, pmtu.sh and ipsec selftests pass with and without the
fix.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179551712630.3135.52212996809224784@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
Assisted by Claude Opus 5.5 (claude-opus-5-5).

A KASAN reproducer (single VM, vxlan forwarding over an IP-TFS SA) is
available on request.

 net/xfrm/xfrm_iptfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..ccdde630a825 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1813,7 +1813,7 @@ static int iptfs_get_cur_pmtu(struct xfrm_state *x, struct xfrm_iptfs_data *xtfs
 	return pmtu;
 }
 
-static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
+static int iptfs_is_too_big(struct sk_buff *skb, u32 pmtu)
 {
 	if (skb->len <= pmtu)
 		return 0;
@@ -1824,7 +1824,7 @@ static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
 	if (skb->dev)
 		XFRM_INC_STATS(dev_net(skb->dev), LINUX_MIB_XFRMOUTERROR);
 
-	if (sk)
+	if (skb_to_full_sk(skb))
 		xfrm_local_error(skb, pmtu);
 	else if (ip_hdr(skb)->version == 4)
 		icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED, htonl(pmtu));
@@ -1908,7 +1908,7 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 		/* If the user indicated no iptfs fragmenting check before
 		 * enqueue.
 		 */
-		if (xtfs->cfg.dont_frag && iptfs_is_too_big(sk, skb, pmtu)) {
+		if (xtfs->cfg.dont_frag && iptfs_is_too_big(skb, pmtu)) {
 			trace_iptfs_too_big(skb, xtfs, pmtu, was_gso);
 			kfree_skb_reason(skb, SKB_DROP_REASON_PKT_TOO_BIG);
 			continue;
-- 
2.52.0

