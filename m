Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675506;
	b=Ix+z+HDRkX2NFY5Czv/tIdLCU1fUuA5ASvplyednqMLtIDwi5ZlyMI8OMQImYxdccPvV
	 KBWlhYXqE2v5H9bKIw3b/PuxdPc5hYCPG7pcO/afNR34IYwF2qmOgDXTynUDvjPkWOX+C
	 g7vLtlhoIVqw4XIifRSE+s8SvobW9EP3dJXSVnmgJTAaM+PH1SqBM6fNfBQ+vgJK4zlof
	 77vZqUw1MZ1nQqGojQ63DUyf+S6yY/lP+RkUGMjUo4Z6OTmAdZJZFJTRs87lz60LAplJ9
	 A76TBgsMsRS6nv2/rbzSw+h0lMamc13hVLsMjWtuhPjypwJdXV7AvtCGSUnXocTQwMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1w30GML4h0iF7yCsQGFSa2YjqNrPWQIdNuuJPNx9eck=;
	b=aU5XGc3oOCJznCR2wmxP7i9TjjCpSnQUR5ja7f3oFsl7W54l55NDZ4fJ+AAw1Jdcy0M/
	 H4DCDBpmtuV9bGtrO1VL1U3IN65nG+EYQYwxgr4bjK67zuipOpuPvI3vCAOygiYc6z8dS
	 rzASDNrkmuHElPXXkiNinryINh9MZli6jEjWFVX7+BhP3dKqaqfoVzmnfyJEtFeuhh+AF
	 JIX1POwmvukmalHamufsS46MugvUGN8YV8ecvnDlU0AL/xxKncL6oTe3Wf4xv9Gb2cDxs
	 D5ZsqjiBpxQ5bL9Vx1m8USmi8JzvF+t0xfp/dNHcUH4sIajV+LLa6WMGLRXX0F3Lp8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYaPfOrf;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B8606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYaPfOrf
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4438134b3a.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675505; x=1796280305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w30GML4h0iF7yCsQGFSa2YjqNrPWQIdNuuJPNx9eck=;
        b=XYaPfOrf4w6YWsaz9XyLNjIEBi82EM1s7Ru+CPaOOGK4UQctuzvbZvXXX25wjPoTee
         DryPyfn8MZJ0gKANUCj7UpAf/7KnZDCgIK+H8GC9H5zi+pWiqu07pBMcuXcMuJBIupFn
         J9PYtVNEUqGqTrj1QgCQGEs9NoNSGQ+RRSX88uDYWsBhLzRAZG/lKmnzr0LmyLiT85QW
         kXXXIflPEpLIOonViAzLThox/aWIHJOglMHvFO+G3Jf8Df0qgpEpgVWo1+ulaFf7a5aI
         UBWXp0Hy3cqChw22pcanuW5QKsLGpAV9UJ5HHiOxRcDLS95/TQ1jZgiXBgVlalfXopjI
         8d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675505; x=1796280305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w30GML4h0iF7yCsQGFSa2YjqNrPWQIdNuuJPNx9eck=;
        b=OG2ouiwUbSWbFD/m6XFqKyDAWRTJYo+3/nrTpELibFHFja1/Ms2DnhEfI2NAccD1z1
         9ND9alno2Vku3bVcJxPhtWuwen3oFBCNIoilh22rnzDM5PzX7wdDuPaZZeil++/xtJl5
         cpgf1OETHHUEo42YiVdqwqiTSZiJymKNqaNoK6uYXZ/zVSZSGN84immnE2f2saDQNL7q
         GKgFVYhzhCIVAh9HAcW02vfdUWJDUIey0JGN55ZMrl9jRndhbfSvCkSI1dRwVum4RsmB
         j158dMk4fwANSEPc/Gv5A8G5B7Xgw5Rfa9AhjyQSSF6+e3k8bU5tXG78Lp1oTkBFRSmt
         ECew==
X-Forwarded-Encrypted: i=1; AL+hErEDI1lVT1aXgVQAX7P1OEjeOhg2zEWHi78p55FHsLLfHHX+j0KIKZE8evxYToSQ4ytczztLe5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B/m6sclM/PRBgsHulV3SksymkGc/i2Rd6pOSQpY96e8p3Y77Y
	8sP3xOge3VIEtwGBof/G+JZoV3HFRlMRAIAn7XWj5Waf3sZB6514dHYY
X-Gm-Gg: AZFdTZf65quKZ9UhtqNKkEfCPDForIlkuqThMfAqsp5VMk8SgDgb4gSb1bihG725fCj
	8/wHTKJYr/omvjV+y43IW8PRY2nTqFYaeleHlPQtTx2PWjHyGZfbM53FgFZV7vULRNz8d7Lhb0C
	z5etK7oghw/wYvu7MVhReUw+YEZll+vm9x3fZ4vEReik1uhvkJF9HRjtlfdgSOpYzDO5I5qZh3a
	NgCbNvyMLDDUhwjhF94xIhoax0GStXFi+viAw8avVyCDh0t6AwHFVt2/5GGohBe3l36cTghZLKJ
	wvI3gVs90Sx9jyq0wPt1/hBPQUBv/R36F90J52Sqts67vxs7j7xG+YgaTRDCd87HLrDkoh91tRc
	o34btuHzbzlRWMyp8CmPdBerUcUYo/LV9ncNpdoOW77Mo3H9kVK/56Mv6O+WqEaMHvJSkV2SsSP
	hT+87XoYvzR3ODkun4/Uu4PV2W7jI/PzD3I221ED/8Ckz5axqLJLpW8eRv+z9j5ca/ENR55YLTB
	Mr24/Zv+ZQRZY0Ue9HD4jUvGlX+Fmg7ENw4K+cgrMilo9qjeS6JDAa83fXYIxycTMQK+GPDhwd5
	P8ihsvfoN29YW+WIPkmAVjmfSCVIL7d4aPxOkpKCJTsr4JPAv5MOU+5gnHWFe20VFwbL5Lh27DI
	=
X-Received: by 2002:a05:6a00:460e:b0:8b5:7fc8:867a with SMTP id d2e1a72fcca58-8c87ce31324mr18260562b3a.36.1795675505302;
        Wed, 25 Nov 2026 22:45:05 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm10264349b3a.56.2026.11.25.22.45.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 22:45:04 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net] ipv4: reject header length beyond linear data in ip_do_fragment()
Date: Thu, 26 Nov 2026 14:43:21 +0800
Message-ID: <20261126064445.57665-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

ip_do_fragment() splits an oversized IPv4 datagram into link-MTU-sized
fragments. It reads the header length from iph->ihl and hands the packet
to ip_frag_init()/ip_frag_next(), which assume the whole IPv4 header is
still present in the skb's linear area.

Callers that strip or rebase link-layer headers before fragmenting can
break that assumption. Open vSwitch prepare_frag() pulls the L2 stack
(up to MAX_L2_LEN = 30 bytes) off the skb after a TRUNC action has cut
the frame, so the remaining linear data can be shorter than ihl * 4.
ip_frag_init() then computes state->left = skb->len - hlen as an
unsigned underflow, and ip_frag_next() fails its skb_copy_bits() bounds
check and executes BUG(), turning a single unprivileged OVS execute
request (user+network namespace, PUSH_MPLS x4 + TRUNC + MRU) into a
deterministic kernel panic under a KASAN build:
[   23.501259] kernel BUG at net/ipv4/ip_output.c:725!
[   23.503346] CPU: 3 UID: 1000 PID: 110 Comm: poc Not tainted 7.4.0-rc4-ovs-hlen-ab #1 PREEMPT(lazy)
[   23.504370] RIP: 0010:ip_frag_next+0xa71/0xb10
[   23.533285] Call Trace:
[   23.534004]  ip_do_fragment+0xdf1/0x1a40
[   23.534004]  ovs_fragment+0x6d0/0x850
[   23.534004]  do_execute_actions+0x14a8/0x1660
[   23.534004]  ovs_execute_actions+0x64/0x1e0
[   23.534004]  ovs_packet_cmd_execute+0x2b8/0x300
[   23.534004] Kernel panic - not syncing: Fatal exception in interrupt

Validate the IPv4 header length against skb_headlen() before any use of
hlen, rejecting malformed packets with -EINVAL. Well-formed skbs always
satisfy hlen <= skb_headlen(), so normal fragmentation is unaffected;
the existing undersized-MTU check keeps handling mtu < hlen + 8 after
the header itself is known to be present.

Closes: https://lore.kernel.org/netdev/20260922030310.8684-3-habte.yibelo@gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---

Note: this overlaps the still-unmerged hlen half of Paulos Yibelo's
[PATCH net v6 2/2] (20260922030310.8684-3-habte.yibelo@gmail.com).
The CHECKSUM_PARTIAL equivalent logic already landed as 6785011f8b16;
the hlen guard did not. Verified with an unprivileged OVS
TRUNC+PUSH_MPLS reproducer (3/3 panic on A, clean on B with -EINVAL
at the guard).

 net/ipv4/ip_output.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index d42d776af273..d5ea596724d7 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -784,6 +784,11 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	 */
 
 	iph = ip_hdr(skb);
+	hlen = iph->ihl * 4;
+	if (unlikely(hlen < sizeof(*iph) || hlen > skb_headlen(skb))) {
+		err = -EINVAL;
+		goto fail;
+	}
 
 	mtu = ip_skb_dst_mtu(sk, skb);
 	if (IPCB(skb)->frag_max_size && IPCB(skb)->frag_max_size < mtu)
@@ -793,7 +798,6 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	 *	Setup starting values.
 	 */
 
-	hlen = iph->ihl * 4;
 	if (mtu < hlen + 8) {
 		err = -EMSGSIZE;
 		goto fail;
