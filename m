Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653077;
	b=JTUakO0OHlCDZnJIcpzrBhalSmBQd/S6lWv5tuRbxHpF40rytcBC6rvdQeRUystxr0id
	 bqc7VBb759v0ZXSkhiQ37VSXPidbh1hHW+SITgN80LvifSFXkYuJ2o6dofH6Tx8E7DFaC
	 GVW79SKq3aM550tCJ9kMnk9RLCqREgaFw8FtuX0xGOYmRlEEDOAp4GM4pe2cLT9u3lSvR
	 1dpoBPpNE6N2IlcAvEhBvUZF9yJxfkLGlz7ZUOtdMoeAbzDf9qrXQhhouoWQtFb20Cqr5
	 Vqjj6MOGgR/2p0o17oq1/dLxMl0/pbxYsC7Q9H+dcHxqCESdAFrBHbc4IxCmj+jWwvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
	b=f/yskTFep4a6cbdjAOpG5bJN5LR59/e3QLF+8sk+qu2yJiqcIvGyTJbmM2NVtDxT9hUG
	 INPXtK+woJHKhcWd2oQXk1nTp78IqSAhh/WG1Mvb0cstfhklMOUt+YWhtIf+eC/kbyBla
	 WVtatrQB8fpLn91qi6yd0hcyNFcKsX5ku4MJVzJId/z0S9NHqK7Z9NN/gl+06W/Ur92kl
	 2ht4yc04waJJCLoKN3urA1cEIWci8gkrFtI7Entl/5EmXbk0NPZO7gh6LPJhBNuvV2SHO
	 U/Wfu+fsQozTwgjJbrVaUYB90x2TK0PRb6IUIeiAgdQiLDcGo1pwqdx180DmQo3WCbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1SfXYOS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE57606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1SfXYOS
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04f61282dso29586075ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653076; cv=none;
        d=google.com; s=arc-20260327;
        b=OgcsDeTd3rQH2xGR3zYlsRjnykycnXZ9+lLSAx12q82C1WpoMxc8b4L8zkgf8xHnbg
         8dW2XzRbFZcvJWo/7AqBcjjeIDfl0isghvJpq+XC+ompGbkUAo/uCge4Mo9wecm2Qw/5
         c3hEuHHorSFuLJ7QMXSIqQ7ppSFHwG58OdwjP7MfO2OAGk7v+eBRNd1e9IkkJSJQhk5X
         MV8wYEESNrG9Zs8aE6+X7rriA6tH+cZWj2ZBVFx6hnpP9CDjdleg0LEwqu/PpQSsd+jt
         5FXySHtaf0rrVAmlc9bLaGSpDuNnd9SyfXmrBD4+0Abk9GLzPCNlFwnVkC+FsGc7/H6R
         /AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
        fh=aAX2cwU7JJgtfFLoUNEf3J2vrYaToRIV1tgcF/mFhUU=;
        b=X9eA7kPOvRqZlgjtq53u1n0MoE725EDFkh6T7tV1CxIAZ1J/W+LAOQIM2wp8gbmAlo
         8/U2tKnwGti+P4qTutLaQhwxVj1O5ERRvC+BUpFLzbHFe8E0da9LKht0XiSJ0dhDoBob
         8jVKI9PzVqSlJLOa3gXfhH+lGB6LjZLVd+P69DvBhN2jReEQ+NpsOiP7OM06zfx5yBRE
         /Y/GAzSWnz3z+NR87dc5eQWT5SkvYQU0CsBeAldFOFsUmtKq6oaZByWvxHr/TzA/etoF
         WNNEr+IRVZ+dcOvVsn+ujaPlh8Pz7nU/mHLpDoyAkHXN49kHUlrwnMkcpUDabjLBirg2
         +pgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795653076; x=1796257876; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
        b=K1SfXYOST280EGOh0hqJwdPc7hYk4wdpIGgBf8cGDZcs0rAmSi410idxWSEVrzo52b
         3EjE1Fi+4MpBEztBC1iUR68Bryiwg2gz8kHdea+1czfhitbP4KGhkBu3H7okWoNbRzjV
         xc5Mk3NCiYHVVCKko78vIAIYIEMCh0h7DzPjWuHjohFjYmnWaRlrl0IxADz3/QLf/Vlt
         NA8ud5c42BnHdjrHhcvqfjnSc9VUD7U985lQL4NsCL1rfvOMhcL64GEukIvvkiLZhv/S
         OVsdjdWbpup4Cvc6W53xGc2NkTA2YyRX094xdA2tNX5dHRXJAXP5wLOL6ZJxyuvwLUGB
         L4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653076; x=1796257876;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ICZZE9VBO9beisSpy8BNbX6a9KzopoCzuyfJCIEcnuw=;
        b=lLX0pfKf/hCVHAxkLmmhVhzkLqDfnsmdEnXuywxvTOsoO80R2/2NZBcAoiSuhYXcCx
         WdsDaE7szKZY1KISUcRgJhIk9q0CyWx/2XJIW4y7zhcosPhnOamkvVaOKoPEw+fx3bf2
         NcMRXyhrNkmShxoQ9NBLSVrvK79DIpcrD4bSPX7TdgNYWlSBZHqLeNC7P0b4Q979mb4W
         JtzC+rxpC6Ln/IgXzMYz8RIS9oO4c7sAj/Kp7xnlHmzPO72Ju2yKS1GB/azLIzdtmU++
         NbFa6UYDJWEOoTlYM6kfwGZWXtC21RDZ7UMCrTf5ZdeGDr1z9xJreg7avCUwtO0unFLa
         Crtg==
X-Gm-Message-State: APuU4Z8ipXLnjPv8Hhn7q8ehUxVE9ME7DOP9/5ntI2XUaJEygLcTC4wW
	hkh2zeu+FfdsSYQp1rzz+Ov0ScRHuskuSQz2OLLZt1JRwXJo9lTmgCBjKoddE7aDQaz9Ms1xsxF
	L+BPyrQROsKALo7uopzhUYvU8aq+LjN+C4x41A0sXiKTKWx0sDg==
X-Gm-Gg: AZFdTZeaI73KwZnKglrgysoBlV8Iw9e0D0lu0iaElCVuULYriuXSon87tavp5r7j3h9
	zDyob5vjzfoaPI5mb1NRwoWmhr3CpSR18m+KalGwfkeI2APOLitBIIvBRHrjec5sSSp7o2WgAvK
	HuhsJdwLMdAlIK8Bncp6cdHCdIPtyZw+X1hlaPK7wxexmW3jR+MmVNDl6k9zoaDYmChQYdElpR7
	AQ/nnVN+B1AUKg4aFXSUUThMlxesrDZcAke28MshPtQa3SCAGQnOEQ0SKDKxkT6ZN38RIuxnyff
	DpRS6LpfG8HWF/tw1ctfamsEJ4NHP7iFGXbLK5iRhDSu0L2FVJMPmR8aNP5ggtFDLiERxXhd6IO
	DhM/atO1EyLAmmjpP9o99w9h5GYuaRt7qODPHrN2H5s6nvSWJR30eoKcAxpDCdNlG91YebE6K2T
	bwIkb6XJ1FiVFezRPkm/2yy9qVLhE99g==
X-Received: by 2002:a17:902:ea04:b0:2ef:e946:cdc with SMTP id
 d9443c01a7336-2f03f1f0ae8mr211799355ad.56.1795653076333; Wed, 25 Nov 2026
 16:31:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Tom <tomasbortoli@gmail.com>
Date: Thu, 26 Nov 2026 01:31:05 +0100
X-Gm-Features: Aa3M54okSEAPWFMbrv6EcpD0OgdWdl35ZbfM3ItFkdVh3fTU8GP8oNOoxWq68oU
Message-ID: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
Subject: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect updates on
 end hosts
To: netdev <netdev@vger.kernel.org>
Cc: David Miller <davem@davemloft.net>, dsahern@kernel.org, eric.dumazet@gmail.com, 
	kuba@kernel.org, willemdebruijn.kernel@gmail.com, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

ICMP error messages are unauthenticated and quote an attacker-chosen
inner header.  udp_err_update_exception() (and its IPv6 twin
udpv6_err_update_exception()) process ICMP Destination Unreachable
messages with Code 4 (fragmentation needed, RFC 792) and ICMP Redirect
messages before any socket lookup, calling ipv4_update_pmtu() /
ipv4_redirect() with no socket and oif = 0.  The resulting change is
stored in a route entry's PMTU, which every user of that route shares;
on a non-forwarding end host with one route to the internet, the
change affects the entire network namespace.

A single forged ICMP Destination Unreachable with Code 4 lets any
remote host pin the victim's PMTU toward an arbitrary destination,
degrading or denying service for flows using that route, depending on
their packet sizes: values below net.ipv4.ip_rt_min_pmtu are clamped
and locked (see __ip_rt_update_pmtu()), so a locked 552-byte PMTU
persists until a route flush and breaks PMTUDISC_DO senders
(EMSGSIZE) and QUIC (RFC 9000 minimum 1200-byte datagrams), among
others.  The in-kernel ICMP
rate limit exempts fragmentation-needed errors from its ratemask, so
attacker-controlled entries can be refreshed unthrottled.

TCP drops errors for packets that match no socket (tcp_v4_err(),
net/ipv4/tcp_ipv4.c); UDP should not be more trusting than TCP on end
hosts, where forwarded flows do not exist: an error that matches no
socket would then change no route state at all.

Fix this by only performing socketless PMTU/redirect updates where they
are actually required -- for forwarded traffic on a router
(net.ipv4.ip_forward enabled on IPv4, net.ipv6.conf.all.forwarding on
IPv6).  On routers, this path keeps its original preconditions and
residual exposure, which transit traffic legitimately requires.  On
end hosts, PMTU updates continue to work for socket-bound
flows through ipv4_sk_update_pmtu() / ip6_sk_update_pmtu(); those
paths are intentionally unchanged -- an error matched to a real socket
updating the route entry for its own path is the accepted PMTUD trust
model (PMTU state is a route property for TCP and UDP alike; the
matched-socket difference is who may trigger the update, not where the
state lives); this patch only removes the evidence-free flow-agnostic
route-wide write.  Errors whose quoted inner header matches no
socket, including those from middleboxes that rewrite or mangle the
flow (NATs without ICMP inner-header translation, for example), are
ignored on end hosts; NAT devices that translate ICMP inner payloads
deliver the original tuple, which continues to match.  Encapsulated
tunnels keep their own error path
(__udp4_lib_err_encap_no_sk() / __udp6_lib_err_encap_no_sk()).

Reproducer (forged ICMP Destination Unreachable with Code 4, inner
header quotes no real socket):
  pre:  1400-byte UDP sendto with IP_PMTUDISC_DO succeeds (local path)
  send: ICMP Destination Unreachable, Code 4, next-hop MTU = 1100,
        inner IP header src=<local>/dst=<peer>,
        inner UDP header (no matching socket)
  post: same sendto returns EMSGSIZE; claims below ip_rt_min_pmtu
        (default 552) additionally install a locked 552-byte floor that
        persists until a route flush; identical result with a packet
        source address that does not match the inner header (nothing
        correlates them).

Verified on two builds of the same kernel (6.12), differing only by
this change: without it, a forged ICMP Destination Unreachable with
Code 4 quoting a UDP flow with no matching socket installs the route
MTU for MTU = 1100 (unlocked, self-heals via aging) and for MTU = 500
a clamped locked 552-byte floor that persists until a route flush; a
forged packet quoting zeroed inner UDP ports behaves identically.  An
error matched to a real connected UDP socket still applies its PMTU to
that socket's path (the unchanged socket-matched PMTUD path,
ipv4_sk_update_pmtu()).  With the patch and ip_forward = 0, forged
packets of both shapes are ignored while the socket-matched path is
unchanged; with ip_forward = 1, socketless updates keep working
(router parity).  A genuine end-to-end PMTU event, generated by a real
forwarding router with an 800-byte-MTU egress interface against a
PMTUDISC_DO sender, still shrinks the sender's route: the sender gets
EMSGSIZE on the oversized datagram and completes delivery at the
reduced size, with and without the change.

Also gates the Redirect half of the same problem pre-lookup
(udp: ipv4_redirect()/ip6_redirect() were reachable from forged ICMP
Redirects without a socket); generic ICMP redirect dispatch is left
untouched for other transports.

Signed-off-by: Tomas Bortoli <tomasbortoli@gmail.com>
---
 net/ipv4/udp.c | 15 +++++++++++-----
 net/ipv6/udp.c |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..503575f0cf6c 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -913,10 +913,17 @@
 static void udp_err_update_exception(struct net *net, struct sk_buff *skb,
      int type, int code, u32 info)
 {
- if (type == ICMP_DEST_UNREACH && code == ICMP_FRAG_NEEDED)
- ipv4_update_pmtu(skb, net, info, 0, IPPROTO_UDP);
- else if (type == ICMP_REDIRECT)
- ipv4_redirect(skb, net, 0, IPPROTO_UDP);
+ /* ICMP errors are unauthenticated and quote an attacker-chosen
+ * inner header.  Socketless PMTU/redirect updates are only
+ * legitimate for forwarded traffic on routers; end hosts do not
+ * act on UDP errors for non-existent flows.
+ */
+ if (IPV4_DEVCONF_ALL_RO(net, FORWARDING)) {
+ if (type == ICMP_DEST_UNREACH && code == ICMP_FRAG_NEEDED)
+ ipv4_update_pmtu(skb, net, info, 0, IPPROTO_UDP);
+ else if (type == ICMP_REDIRECT)
+ ipv4_redirect(skb, net, 0, IPPROTO_UDP);
+ }
 }

 /*
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index a6886a0432f9..d1cf5ce2b00a 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -694,6 +694,12 @@
 static void udpv6_err_update_exception(struct net *net, struct sk_buff *skb,
        u8 type, __be32 info)
 {
+ /* Same hardening as IPv4: only forwarded traffic on routers may
+ * drive socketless PMTU/redirect updates.
+ */
+ if (!net->ipv6.devconf_all->forwarding)
+ return;
+
  if (type == ICMPV6_PKT_TOOBIG)
  ip6_update_pmtu(skb, net, info, skb->dev->ifindex, 0,
  sock_net_uid(net, NULL));
-- 
2.47.3
