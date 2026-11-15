Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747753;
	b=ezaDU5GiR5AD2c8ZZVq7bpYtoprKgxifxiV6Wr1R2oe/5aLeDCAG2eVh72/iEeqmWpUN
	 pwGG1U7iWvZmgBOgRjgKzoxobI9KxvLjjLrDv/9qb6cm4c6axCX6XpvwYZUM+i0wIDXls
	 6/s+OuV+//roxOW0Idd55945wGijp44NT2Ks+QOHEo3Tm7VQX6bRYIJnEG4Th29gdvi4s
	 210oCZPPBcCNcqvnmkgpTVDKVwlKQV5CkpsvyZ35BgvGS7miErkUn40H9XHrjkFnxIvum
	 +SsNE+3Y+riTydshMWZJCWJbfBNhHFs0NekqQ9VNjO23Hht6cYvSOj12VIAzFJHOAtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3tJIKpc8AwX5cndBfqHiESi1n0+LeUDLJZqK1Qyg4iM=;
	b=JRkc+rGFABMVvN4lMlEySY7UDYect0ZU/hwC3ciUEC+sN6s6PzPFRr1WaHcDewyQ/GDe
	 mpYToe20Uqw6JnYMM3XSXICvRh2fHPuItmEHayg+niIlgHeNG0DuTv/+h7iNcJ2RD0aYg
	 5z+VmDkYi7imUr6JqMTB/mx/C4vXLEKYDmd46Vw0MkRjQnIqiOmQq8aKRc+O8OnRpyOKZ
	 MAlDnVpDpDjFNKZBuJDMNSt6xHeJwwWOi9maLuDweEwrz1cp0RguTZgQBnd9r4GaOHRtt
	 STskttkzorOoMComgmiDwBoguxDC6V5YQ24oAxnc/El+a1x+i47T93CZFPPXRAilPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKc4QGjQ;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502E606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E502E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YKc4QGjQ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ccca948203aso1145361a12.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 05:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794747751; x=1795352551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tJIKpc8AwX5cndBfqHiESi1n0+LeUDLJZqK1Qyg4iM=;
        b=YKc4QGjQNt/gGYhDJ4lxQX1TkkYRNscLLuZGvr7CtEt83aw0KqQ3p6DeMi/mIz1U4u
         BLdzV9L+PY07ztVEL/TQ+ZOgnScdtEoiu9cDKSSOJEam+nfmOtbuifn6Dlkl5xxNCzvT
         /2EZeddOARxcGiesVGzSUfJhBexGvPaFQ6/pmuHc1vbSyJnUAcLkcIMxV9wFsKEeI1sV
         8Y56/NomkFz/T2gXk4jw/D8kG52Sx1Rflj9NTQ1qMQ7yKAO9QNdWSQ1pugJsYUmUqk84
         p3N3vv6clQcD0u5CptP2HCL6kk4Yz/f5hJa+j2916li8iM9MN+s2CgVLQVloB6DxeQ85
         xacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794747751; x=1795352551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tJIKpc8AwX5cndBfqHiESi1n0+LeUDLJZqK1Qyg4iM=;
        b=uWWhl5oJiqvbohwQy82kRYJmpMQ9kZNyXnO95QJom8w/7BnHEKm/O4iyy7Un7ee78X
         7XSLBP9JT9ojrHtdWCpzgfoOfVQAD56EtAffC4i44Vxl+nKZ8wXBo701iMs22HehPx8l
         YW5h1cNMniTB5+deK0gEPSiE9laqab4kQlEly0kOOXCJ3eLWW5N0kmtCN8eS3AiA6oi4
         iKZnUzo9IE1ASXY3E1Sip8zPWPEKqWYYrlH95mKSL0QSB9JTu5IrEJ/YuSsTAcRMntHG
         P9UdZ6j2sUOn0fHOrhpe8SHfaeHJuJ1HArTocpIKf1VtcXs7UcpxCHi2rDM0zzQL9NrL
         8MlQ==
X-Forwarded-Encrypted: i=1; AL+hErHTvrZk4gKGNCjrVWqEZkabTb4+U0pG5XRWmHKBTfmY/OOi5lm2Ue/VvC085TslWXJnsxbz8vE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m6fZE3gMv+uwWvteinyfQhIpwcw7fUkRjNgs+EPvDzJeGcdJ7
	y9ExHICQhz5MBw1Cx7iWtxLN1H+/F+nqdIFX4+vbB2cQlJQY4+MMdSEZgXpaogCd8nJ6SgqE
X-Gm-Gg: AYBFou3vyxk1QkYgqOFnZBEyRYRk3nstPTGpuJQSZ3cC2WuVd1uWEQVu7Iu13GpYC71
	ZPrjNkQH+xpt2Q3UXj7I14rdhdb4zvvSsmvcds2M6zWbCx5izJcODaEo06peQf4xU2iBN1Yd+4j
	sxFw+lXS2+s6l8JarwXjXYe+gKrY/aaxCodmlc9uJeKRG8F8izodcnCPewEBp8x0g+s2ljIWHwa
	3cBOfhKv7FOfRCc6Sj1FoDvgV01aoUA2aV9RfNKPpagZqQ9Ab0IfnP1bZbH1m72JrkRreLmyk8r
	lOQhV1LjNHpzgqfA89+UErI/qyk3qVlRDQ4N9mw7tVJMOZ6XctgdAKOvFA0C2beK01NvLAnMA/W
	de9s/m1x9ZMN0DOmtsFbaSLrGRIbOv050yxeNM1jT6P/vx8laxgPmucmfMxB9SIyZ9gwhv+fK4U
	HqN+QNObIn4M5D+tbW9W5fUga73in4b8/dQbeaUIhm5IwI/aqcSGFzlvNT/3paJr0Pm75H0se0C
	uC5AjP0pEO1GNPhcNqXjLeSVzOAaGauOpAO9K42WkLJKQ8kET0TQi4FmkAGrUSrAlvl1iWyGLTB
	2JKYX1s6UFxtMS0WT76CgG86fw3GLPB06HjTcXqv97YaEZGz2pya//0ceMcTaojg60MXXCCrUNo
	1I6uLTDXi+H8bORcC4hfwjNZgahAs+KT5M9tvf+QJe0yXqEehrJ2QY9s8eEM0wFlodtf3ae9m9v
	SAJgH9tlL9ZoKdsnIOvv2qeRt5+AR952YqjpmE/9iqNH3vZv2MFJ9sFv+MbIwR2g//3nE2n9n7s
	Ec/SGmKmcxXGPXq/uW7vdMCxCCRVXdad/hHb2APo8Uj6ykxUQn534Ue4P3ymJrN
X-Received: by 2002:a17:90b:54cb:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b1b0a5064cmr7142317a91.39.1794747751079;
        Sun, 15 Nov 2026 05:02:31 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35ac2sm17691691a91.17.2026.11.15.05.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:02:29 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: bridge: fix skb leak of reinjected link-local frames
Date: Sun, 15 Nov 2026 23:32:11 +1030
Message-Id: <20261115130211.7724-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

br_handle_frame() passes the link-local frames it neither forwards nor
delivers (01:80:c2:00:00:02 to 0d and 0f, unless set in the group
forward mask) through NF_HOOK() at NF_BR_LOCAL_IN. Since commit
3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets") the okfn
only learns the source and returns 1, which becomes RX_HANDLER_PASS.

That commit sent the nf_queue case to RX_HANDLER_CONSUMED, which is
right for the synchronous return, but the frame comes back: on
reinjection nf_reinject() calls the okfn and ignores its return value,
because every other okfn consumes the skb. This one no longer does, so
nothing frees the frame. NFQA_CFG_F_FAIL_OPEN leaks it the same way
with no verdict at all, when the queue or the listener's socket is full.

Each frame leaks an skb, and one sent from a local socket keeps that
socket charged, so neither it nor the network namespace holding it is
freed. Bridge, rule and queue need only CAP_NET_ADMIN in a netns, so
with user namespaces an unprivileged user can exhaust kernel memory.

nf_reinject() cannot free the skb on a 1 from the okfn, because other
okfns return NET_RX_DROP, which is 1, after freeing it.

Call nf_hook() instead of NF_HOOK() and do the learning and the
RX_HANDLER_PASS return in br_handle_frame() on 1, as the 0x00 and 0x0e
cases already do and as vrf_rcv_nfhook() does. The okfn then runs only
for a reinjected frame, which br_handle_frame() has already reported
consumed and cannot pass on the port, so it learns from the frame and
frees it. These frames were not delivered before this change either.

Also set *pskb before the new RX_HANDLER_PASS, as the other such
returns do; skb_share_check() may have replaced the skb, and the commit
above added that return without the assignment.

Discovered by an AI code review agent and reproduced on unmodified
mainline under KASAN: an unprivileged user in a new user and network
namespace bridged a veth, queued link-local frames to an NFQUEUE
listener that accepted every one, and leaked an skb per frame. With
this patch the reinjected frames are freed and nothing leaks.

Fixes: 3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Tested in a KVM guest on mainline b3dfbde62cf1 with KASAN and
PROVE_LOCKING, running as nobody under "unshare -Urn". No kernel
modification, debug patch or injected delay was needed to reproduce.
Before: 192000 bytes charged on the sending socket, unchanged 2 s
later. After: 0 bytes, no KASAN report or lockdep warning, and
br_input.o builds clean at W=1.

Not tested: NF_STOP, NFQA_CFG_F_FAIL_OPEN, real EAPOL traffic, the
netfilter and bridge selftests, CONFIG_NETFILTER=n.

Applies to v7.2-rc5, v6.12.117, next-20261109 and 7e1392a42ea2.

The Fixes commit was checked against torvalds/linux: it adds both the
"return 1" okfn and the RX_HANDLER_PASS return without the *pskb
assignment.

 net/bridge/br_input.c |   18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/bridge/br_input.c b/net/bridge/br_input.c
index fc2e381..b5bd9d6 100644
--- a/net/bridge/br_input.c
+++ b/net/bridge/br_input.c
@@ -257,13 +257,18 @@ static void __br_handle_local_finish(struct sk_buff *skb)
 		br_fdb_update(p->br, p, vlan, eth_hdr(skb)->h_source, 0);
 }
 
-/* note: already called with rcu_read_lock */
+/* okfn of the link-local NF_BR_LOCAL_IN hook in br_handle_frame(). It is
+ * only called when a queued frame is reinjected, after br_handle_frame()
+ * returned RX_HANDLER_CONSUMED for it, so the frame can no longer be
+ * passed up on the port and has to be freed here.
+ * note: already called with rcu_read_lock
+ */
 static int br_handle_local_finish(struct net *net, struct sock *sk, struct sk_buff *skb)
 {
 	__br_handle_local_finish(skb);
+	kfree_skb(skb);
 
-	/* return 1 to signal the okfn() was called so it's ok to use the skb */
-	return 1;
+	return 0;
 }
 
 static int nf_hook_bridge_pre(struct sk_buff *skb, struct sk_buff **pskb)
@@ -424,11 +429,14 @@ static rx_handler_result_t br_handle_frame(struct sk_buff **pskb)
 		/* The else clause should be hit when nf_hook():
 		 *   - returns < 0 (drop/error)
 		 *   - returns = 0 (stolen/nf_queue)
-		 * Thus return 1 from the okfn() to signal the skb is ok to pass
+		 * On 1 the frame is passed on here. The okfn() only runs if a
+		 * queued frame is reinjected later, and must consume it then.
 		 */
-		if (NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
+		if (nf_hook(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
 			    dev_net(skb->dev), NULL, skb, skb->dev, NULL,
 			    br_handle_local_finish) == 1) {
+			*pskb = skb;
+			__br_handle_local_finish(skb);
 			return RX_HANDLER_PASS;
 		} else {
 			return RX_HANDLER_CONSUMED;
