Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146993;
	b=amUVsnEqAi8Tnw47hUMXo0Ope7ZBjAKZGc6Hbt1/fulALxeoXtOr5Z2OMJ9tofhi03MO
	 zIBlJAZMkFJ8FxNFwMiKyvEETkswRyDoMxikRXFAvGkBW+tl5cnNz21xrk/KJmEnS5lNp
	 9qTg2de6JanlYYIoAnpeS9DzEqukvTCfKw8UndO82/vkQEQL5YExaqFZJm7dkrKabNq0U
	 GFJOFyuuCb4nwWiaUc+TRd7RzBH2CwsgriR8O7d1h7eKA5W6LTSQC0S/HdFAWVqcRwPrz
	 HqI77mm32CMOLaEr98Xc9g2+opqkpkgaRNbaSkCFjwvsQhDf7bXanH9DgxL9wKdCWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cN1q2L7wbvhWD6axbUgjP0czTf2tmaoxQza17HODNh8=;
	b=D+fAwi00IoJMOYJl970sFnYsbNDEA+F3uNA+FyhoRisJk8ndEghvZ01GI+KxsslLjdKw
	 Mxafr1kSp0FeO0UxWmwc4wmmiDbkIcWO23q7zemyYw2pZwy1wD0dJpKMyJ9L+TDY4hcv5
	 GmzANe76sRL+FrXVLqKOR8O28NEiOwBs2cVd/shtUNkoPxq0fQMXUmeS0L7CIFQIF1FAv
	 lYlxeM3/oOd2yZ0Aly7H3aa7ZAWo45UMnfpZsNdtiks4v5XMapRy0fCTlXAztl+4R4HkE
	 wzRi41u6bXhDrWYmvSo5frfiLxeZjlznyEo46pSXPwazNrToAzFANTpqiFOthGb2GBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrLFjJqR;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A36606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A36606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrLFjJqR
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0481b35c9so395635ad.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795146988; x=1795751788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cN1q2L7wbvhWD6axbUgjP0czTf2tmaoxQza17HODNh8=;
        b=OrLFjJqRy51w1KERraDLVYdlIbS/5rDxF8nxgOlZ5mMTysHg3+CaNGxUKndZ0D3c9l
         Gva3nlgXVwAzmROVz7R3jZe5Gjz+RP/Ehzdnr/owKmhP3y28NdCoc0DCazn5mWIY8seq
         AWS58MgZ85lK3v1aTCQpMJ1jClmLU/+bAPVmbPSIpm7Dg5gKSxRNCVJMvZJeDZm4p9YI
         usmPjZUlNuGp7wPtjid1m+dB2z/gW52r4Qc8acpf6cSCdN5C58wGpMVK1e8Jju0HTwvF
         0RYRJr3iUeNv2SN6Ljnc4/Gd6SmZbpgbRXyEhntXISPnLtu9tDslQDsUMj7l4HK3sEfG
         xvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146988; x=1795751788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cN1q2L7wbvhWD6axbUgjP0czTf2tmaoxQza17HODNh8=;
        b=Q/Qo9a3EwI6iHWZT2g/H5l+QdBNLuNpybH275N5hOkn7McDjQNtrJxW9iFhzYQi4bt
         BpZ1j2GNaEt67Nn/Z4iNWJGCqb8dY1kQLW0eEjg685AsyoKy5JE3ae+opvFfb2nU3iEC
         UV0k+z8OBgfZmRlJIrMWwEdQYAE6NLTLcPUv/6FF7BaoiH+d3QJWq3IC3kHKVi972sHn
         Cb1BtXAPXlww16w9uiwXL8SMuX8xy5Tw3v4y5vgM+47HcqABX5I9eHaVwASo8T4BivnB
         yZn1W09Qp4vGtG29r4SmKQkQY4PBTQRq1qCIuRgJAlj63rmWEvukVS2hEIkEVZJ8jyTd
         D8YQ==
X-Forwarded-Encrypted: i=1; AL+hErFE+VOL2NOfJy1JLbVc/MMQqYwx6ypqvRhL+bZGq1ESGccMD7vqnUQ24aS+Y0JZaha/Gh+CqGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wJG0XFukM4ckm5wp2VblUPjqQI2+B9YoKsS3K6FxREOvDZIO1
	Wcq1RrN/Gnjp5xTJMRPHOZCYq/4l1w4kUVideLpLgGkipaxbaT6XQEVT
X-Gm-Gg: AZFdTZc7b94PnHTvZ6cTrQ36bULoR2lwSc/poDmdDhUqXVzJT9+WLcJKo2FWKbHGivg
	ZFhlFsUZY+1wyoWv7eL6sPQl1OtivUOYctX8G6Y/D0soqtjKrKSAUUP+RouwAHgWsle89uWa1vm
	tb9Dt5kTTRz+oRYKr9ILpnJVAcl8J7fujtzcauqMRmtD731pvrk2YvvzhpgpPmb0P7kVGe3Do0o
	rntEpxuCbHSZTJTu75wQYyJIj6OhD2oLkPi8I8PEZhIueuF7H6ey3AcosAoGt7NyHW21ga9v3eh
	VPB9rIsBNuGRxTAkouZ1O4ea0B/soSSkzHp3tEp7hdTJZhHpEG+euD8eFjO2xUJw1jXnY47ZK6r
	PaRNK8iw6nSU6NgpSI9reA8GB57eBiJR1w/ppGtZ6nyM8U2VcRlbug6K1VmqWRa8j0CjB6PHBQ0
	1wbAbmhF2monrtqQL8voWsoi5URPi+YlJaWSCvQfybSlmpkM+lG/H+fZq07rWrlkgm29VS+hKWx
	iUY/01GLrNl8a3Owqz+NZntSv+tQ8UoBBUHz7KBxF2wQ+l496aB+CbpLehz/U9E/+v7ag1ybNSn
	S9R3vggBFMgpiCaH2jNB1sVrYihx1FSiWsyi5VBzGg==
X-Received: by 2002:a17:903:2312:b0:2e9:660a:7946 with SMTP id d9443c01a7336-2f03f1feebcmr17982055ad.28.1795146987490;
        Thu, 19 Nov 2026 19:56:27 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm7792905ad.17.2026.11.19.19.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:56:27 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4] sctp: fix use-after-free after association migration
Date: Fri, 20 Nov 2026 11:55:20 +0800
Message-ID: <20261120035521.2098757-1-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
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

SCTP timers and ICMP error handling can cache asoc->base.sk before
locking it. If accept or peeloff migrates the association in between,
processing under the old socket lock can race with an abort on the new
socket that frees the association's queues. Transport and association
references do not keep those queues alive. With mdelay() instrumentation
widening the race, KASAN reported a slab-use-after-free in
sctp_chunk_abandoned() from the T3 retransmit path.

Recheck the association's socket after taking its BH lock and defer
mismatched timer callbacks through the existing retry path. Pass the
locked socket to the IPv4 and IPv6 ICMP handlers instead of rereading it,
and treat a mismatch like a busy socket before processing ICMP errors.
Skip socket error reporting after migration and check PMTU only under
the owning socket's lock.

Use READ_ONCE() for socket pointer reads in these paths and receive/backlog
processing, including transport lookup, paired with WRITE_ONCE() in
sctp_assoc_migrate(). Take the new socket reference before publishing it.
The cached socket is protected by BH context and the endpoint's
RCU-deferred sock_put().

This issue was discovered by an LLM.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
---
Changes in v4 (addressing Xin Long's review and the Sashiko report):
- Move the PMTU checks to sctp_transport_update_pmtu(), under the owning
  socket's lock, after validating the cached socket.
- Cache asoc->base.sk with READ_ONCE() in sctp_addrs_lookup_transport()
  and use that socket for both lookup checks.
- Skip IPv4/IPv6 soft error reporting if the association has migrated.
- Remove the unnecessary NULL transport checks in the ICMP helpers.
- State that this issue was discovered by an LLM, as requested by Jakub
  Kicinski.

v3: https://lore.kernel.org/all/20261116033855.1792036-1-pkfxxxing@gmail.com/
Review: https://lore.kernel.org/all/CADvbK_dO0B156LN_05QRqyo-7wCmCT64BYxbThzXYzJdL6kLBQ@mail.gmail.com/
Sashiko: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116033855.1792036-1-pkfxxxing%40gmail.com

Changes in v3:
- Update the commit message and subject as requested by Jakub Kicinski.

v2: https://lore.kernel.org/all/20261113032805.1447885-1-pkfxxxing@gmail.com/
Review: https://lore.kernel.org/all/20261115100933.75ae0534@kernel.org/

Changes in v2:
- Use Yong Liu for the author and Signed-off-by, as requested by Jakub
  Kicinski.
- Address Xin Long's review and the Sashiko ICMP finding: pass the locked
  socket to the IPv4/IPv6 error handlers and their UDP encapsulation
  callers, and revalidate it before immediate ICMP processing.
- Use READ_ONCE() for socket pointer reads in sctp_err_lookup(), sctp_rcv()
  and sctp_backlog_rcv().
- Broaden the subject and commit message to cover the ICMP paths.

v1: https://lore.kernel.org/all/20261110120212.1110283-2-pkfxxxing@gmail.com/

Based on b3dfbde62cf1981c4638939c159dfd087b7a72e9 (Linux 7.4.0-rc2).

Compile-tested net/sctp/ with W=1 using x86_64_defconfig plus SCTP,
IPv6, KASAN_GENERIC, KASAN_INLINE and WERROR. The original build
configuration is no longer available. No runtime validation of v4.

 net/sctp/associola.c     |  4 ++--
 net/sctp/input.c         | 49 ++++++++++++++++++++--------------------
 net/sctp/ipv6.c          | 13 ++++++-----
 net/sctp/sm_sideeffect.c | 41 ++++++++++++++++-----------------
 net/sctp/transport.c     |  4 ++++
 5 files changed, 57 insertions(+), 54 deletions(-)

diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 4521be3bd8..c5d520c8d7 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -1088,8 +1088,8 @@ void sctp_assoc_migrate(struct sctp_association *assoc, struct sock *newsk)
 	sctp_endpoint_hold(assoc->ep);
 
 	/* Get a reference to the new sock.  */
-	assoc->base.sk = newsk;
-	sock_hold(assoc->base.sk);
+	sock_hold(newsk);
+	WRITE_ONCE(assoc->base.sk, newsk);
 
 	/* Add the association to the new endpoint's list of associations.  */
 	sctp_endpoint_add_asoc(newsp->ep, assoc);
diff --git a/net/sctp/input.c b/net/sctp/input.c
index 9494cfa511..555695718a 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -169,7 +169,7 @@ int sctp_rcv(struct sk_buff *skb)
 
 	/* Retrieve the common input handling substructure. */
 	rcvr = asoc ? &asoc->base : &ep->base;
-	sk = rcvr->sk;
+	sk = READ_ONCE(rcvr->sk);
 
 	/*
 	 * RFC 2960, 8.4 - Handle "Out of the blue" Packets.
@@ -217,7 +217,7 @@ int sctp_rcv(struct sk_buff *skb)
 	 */
 	bh_lock_sock(sk);
 
-	if (sk != rcvr->sk) {
+	if (sk != READ_ONCE(rcvr->sk)) {
 		/* Our cached sk is different from the rcvr->sk.  This is
 		 * because migrate()/accept() may have moved the association
 		 * to a new socket and released all the sockets.  So now we
@@ -226,7 +226,7 @@ int sctp_rcv(struct sk_buff *skb)
 		 * of the current sk.
 		 */
 		bh_unlock_sock(sk);
-		sk = rcvr->sk;
+		sk = READ_ONCE(rcvr->sk);
 		bh_lock_sock(sk);
 	}
 
@@ -292,7 +292,7 @@ int sctp_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 		goto done;
 	}
 
-	if (unlikely(rcvr->sk != sk)) {
+	if (unlikely(READ_ONCE(rcvr->sk) != sk)) {
 		/* In this case, the association moved from one socket to
 		 * another.  We are currently sitting on the backlog of the
 		 * old socket, so we need to move.
@@ -304,7 +304,7 @@ int sctp_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 		 * Otherwise, we can safely push the chunk on the inqueue.
 		 */
 
-		sk = rcvr->sk;
+		sk = READ_ONCE(rcvr->sk);
 		local_bh_disable();
 		bh_lock_sock(sk);
 
@@ -372,12 +372,7 @@ static int sctp_add_backlog(struct sock *sk, struct sk_buff *skb)
 void sctp_icmp_frag_needed(struct sock *sk, struct sctp_association *asoc,
 			   struct sctp_transport *t, __u32 pmtu)
 {
-	if (!t ||
-	    (t->pathmtu <= pmtu &&
-	     t->pl.probe_size + sctp_transport_pl_hlen(t) <= pmtu))
-		return;
-
-	if (sock_owned_by_user(sk)) {
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
 		atomic_set(&t->mtu_info, pmtu);
 		asoc->pmtu_pending = 1;
 		t->pmtu_pending = 1;
@@ -410,7 +405,8 @@ void sctp_icmp_redirect(struct sock *sk, struct sctp_transport *t,
 {
 	struct dst_entry *dst;
 
-	if (sock_owned_by_user(sk) || !t)
+	if (sock_owned_by_user(sk) ||
+	    sk != READ_ONCE(t->asoc->base.sk))
 		return;
 	dst = sctp_transport_dst_check(t);
 	if (dst)
@@ -432,7 +428,7 @@ void sctp_icmp_proto_unreachable(struct sock *sk,
 			   struct sctp_association *asoc,
 			   struct sctp_transport *t)
 {
-	if (sock_owned_by_user(sk)) {
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
 		if (timer_pending(&t->proto_unreach_timer))
 			return;
 		else {
@@ -492,7 +488,7 @@ struct sock *sctp_err_lookup(struct net *net, int family, struct sk_buff *skb,
 	if (!asoc)
 		return NULL;
 
-	sk = asoc->base.sk;
+	sk = READ_ONCE(asoc->base.sk);
 
 	/* RFC 4960, Appendix C. ICMP Handling
 	 *
@@ -526,7 +522,7 @@ struct sock *sctp_err_lookup(struct net *net, int family, struct sk_buff *skb,
 	/* If too many ICMPs get dropped on busy
 	 * servers this needs to be solved differently.
 	 */
-	if (sock_owned_by_user(sk))
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk))
 		__NET_INC_STATS(net, LINUX_MIB_LOCKDROPPEDICMPS);
 
 	*app = asoc;
@@ -546,11 +542,11 @@ void sctp_err_finish(struct sock *sk, struct sctp_transport *t)
 	sctp_transport_put(t);
 }
 
-static void sctp_v4_err_handle(struct sctp_transport *t, struct sk_buff *skb,
+static void sctp_v4_err_handle(struct sock *sk, struct sctp_transport *t,
+			       struct sk_buff *skb,
 			       __u8 type, __u8 code, __u32 info)
 {
 	struct sctp_association *asoc = t->asoc;
-	struct sock *sk = asoc->base.sk;
 	int err = 0;
 
 	switch (type) {
@@ -582,10 +578,12 @@ static void sctp_v4_err_handle(struct sctp_transport *t, struct sk_buff *skb,
 	default:
 		return;
 	}
-	if (!sock_owned_by_user(sk) && inet_test_bit(RECVERR, sk)) {
+	if (!sock_owned_by_user(sk) && sk == READ_ONCE(asoc->base.sk) &&
+	    inet_test_bit(RECVERR, sk)) {
 		sk->sk_err = err;
 		sk_error_report(sk);
-	} else {  /* Only an error on timeout */
+	} else if (sk == READ_ONCE(asoc->base.sk)) {
+		/* Only an error on timeout */
 		WRITE_ONCE(sk->sk_err_soft, err);
 	}
 }
@@ -630,7 +628,7 @@ int sctp_v4_err(struct sk_buff *skb, __u32 info)
 		return -ENOENT;
 	}
 
-	sctp_v4_err_handle(transport, skb, type, code, info);
+	sctp_v4_err_handle(sk, transport, skb, type, code, info);
 	sctp_err_finish(sk, transport);
 
 	return 0;
@@ -660,7 +658,7 @@ int sctp_udp_v4_err(struct sock *sk, struct sk_buff *skb)
 	}
 	if (hdr->type == ICMP_DEST_UNREACH && hdr->code == ICMP_FRAG_NEEDED)
 		info = ntohs(hdr->un.frag.mtu);
-	sctp_v4_err_handle(t, skb, hdr->type, hdr->code, info);
+	sctp_v4_err_handle(sk, t, skb, hdr->type, hdr->code, info);
 
 	sctp_err_finish(sk, t);
 	return 1;
@@ -1001,7 +999,7 @@ struct sctp_transport *sctp_addrs_lookup_transport(
 {
 	struct rhlist_head *tmp, *list;
 	struct sctp_transport *t;
-	int bound_dev_if;
+	struct sock *sk;
 	struct sctp_hash_cmp_arg arg = {
 		.paddr = paddr,
 		.net   = net,
@@ -1015,10 +1013,11 @@ struct sctp_transport *sctp_addrs_lookup_transport(
 		if (!sctp_transport_hold(t))
 			continue;
 
-		bound_dev_if = READ_ONCE(t->asoc->base.sk->sk_bound_dev_if);
-		if (sctp_sk_bound_dev_eq(net, bound_dev_if, dif, sdif) &&
+		sk = READ_ONCE(t->asoc->base.sk);
+		if (sctp_sk_bound_dev_eq(net, READ_ONCE(sk->sk_bound_dev_if),
+					 dif, sdif) &&
 		    sctp_bind_addr_match(&t->asoc->base.bind_addr,
-					 laddr, sctp_sk(t->asoc->base.sk)))
+					 laddr, sctp_sk(sk)))
 			return t;
 		sctp_transport_put(t);
 	}
diff --git a/net/sctp/ipv6.c b/net/sctp/ipv6.c
index 97390569c4..4dbaa4f9d5 100644
--- a/net/sctp/ipv6.c
+++ b/net/sctp/ipv6.c
@@ -123,11 +123,11 @@ static struct notifier_block sctp_inet6addr_notifier = {
 	.notifier_call = sctp_inet6addr_event,
 };
 
-static void sctp_v6_err_handle(struct sctp_transport *t, struct sk_buff *skb,
+static void sctp_v6_err_handle(struct sock *sk, struct sctp_transport *t,
+			       struct sk_buff *skb,
 			       __u8 type, __u8 code, __u32 info)
 {
 	struct sctp_association *asoc = t->asoc;
-	struct sock *sk = asoc->base.sk;
 	int err = 0;
 
 	switch (type) {
@@ -149,10 +149,11 @@ static void sctp_v6_err_handle(struct sctp_transport *t, struct sk_buff *skb,
 	}
 
 	icmpv6_err_convert(type, code, &err);
-	if (!sock_owned_by_user(sk) && inet6_test_bit(RECVERR6, sk)) {
+	if (!sock_owned_by_user(sk) && sk == READ_ONCE(asoc->base.sk) &&
+	    inet6_test_bit(RECVERR6, sk)) {
 		sk->sk_err = err;
 		sk_error_report(sk);
-	} else {
+	} else if (sk == READ_ONCE(asoc->base.sk)) {
 		WRITE_ONCE(sk->sk_err_soft, err);
 	}
 }
@@ -181,7 +182,7 @@ static int sctp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 		return -ENOENT;
 	}
 
-	sctp_v6_err_handle(transport, skb, type, code, ntohl(info));
+	sctp_v6_err_handle(sk, transport, skb, type, code, ntohl(info));
 	sctp_err_finish(sk, transport);
 
 	return 0;
@@ -211,7 +212,7 @@ int sctp_udp_v6_err(struct sock *sk, struct sk_buff *skb)
 	}
 	if (hdr->icmp6_type == ICMPV6_PKT_TOOBIG)
 		info = ntohl(hdr->icmp6_mtu);
-	sctp_v6_err_handle(t, skb, hdr->icmp6_type, hdr->icmp6_code, info);
+	sctp_v6_err_handle(sk, t, skb, hdr->icmp6_type, hdr->icmp6_code, info);
 
 	sctp_err_finish(sk, t);
 	return 1;
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 35f540fb15..bd6b23369f 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -233,15 +233,14 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, T3_rtx_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error;
 
-	/* Check whether a task is in the sock.  */
-
+	/* Defer if the socket is busy or the association has migrated. */
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -271,13 +270,13 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 static void sctp_generate_timeout_event(struct sctp_association *asoc,
 					enum sctp_event_timeout timeout_type)
 {
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy: timer %d\n", __func__,
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved: timer %d\n", __func__,
 			 timeout_type);
 
 		/* Try again later.  */
@@ -362,7 +361,7 @@ static void sctp_generate_autoclose_event(struct timer_list *t)
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_AUTOCLOSE);
 }
 
-/* Generate a heart beat event.  If the sock is busy, reschedule.   Make
+/* Generate a heart beat event.  If the sock is busy or moved, reschedule.   Make
  * sure that the transport is still valid.
  */
 void sctp_generate_heartbeat_event(struct timer_list *t)
@@ -370,14 +369,14 @@ void sctp_generate_heartbeat_event(struct timer_list *t)
 	struct sctp_transport *transport = timer_container_of(transport, t,
 							      hb_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	u32 elapsed, timeout;
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -418,12 +417,12 @@ void sctp_generate_proto_unreach_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, proto_unreach_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -454,13 +453,13 @@ void sctp_generate_reconf_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, reconf_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -492,13 +491,13 @@ void sctp_generate_probe_event(struct timer_list *t)
 	struct sctp_transport *transport = timer_container_of(transport, t,
 							      probe_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index 6ea55b9fbd..2124e73f7e 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -404,6 +404,10 @@ bool sctp_transport_update_pmtu(struct sctp_transport *t, u32 pmtu)
 	}
 	pmtu = SCTP_TRUNC4(pmtu);
 
+	if (t->pathmtu <= pmtu &&
+	    t->pl.probe_size + sctp_transport_pl_hlen(t) <= pmtu)
+		return false;
+
 	if (sctp_transport_pl_enabled(t))
 		return sctp_transport_pl_toobig(t, pmtu - sctp_transport_pl_hlen(t));
 
-- 
2.43.0

