Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536816;
	b=0sDi0FYccfM1Fq1JTFMH2VuP1c32z6ZExzHXuNau6E9pivUBaDqqni7JOOJvSSBcLJDf
	 j7B8Size3teOsb+mSRqqMBF6pRtL7OajABFs4XZ0ssRcsiAKKNyCt4Y+hhz9cVC/8oHa9
	 +/dXP9uCjuuUQZbRCjq61gGuUQtl/y4wsFWbJVItUd0MuULG3Tekws3OlaYeyvX3Dm5K+
	 pCT7WDkBvr0Rbt1MszdR6xwB7158XZaljy5jvXOuSMURe8am5eCLPw8Z0YIbpYcPpL03A
	 o/ApRO2/WdSOn377/G3LRYO0bZWKagmbatF2rTvpQWCVgcc6hj4APNxLKWKRhdH0lqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536816;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=QBvbgfx4E8jvr7JMVNhMlTeMCa0V19tUFi11ZMoFNQo=;
	b=RPgw2kbwMMhdHsKJZuWT6ABm+PyT2bT1nDE69CNsv0YG5gKswNWBqmyu6hWBsx4s4Gli
	 0L4/A5Gm3KYzZZiDxvSLDKTih8vrM6MURir0LNwgcavvuABJjkcG7CbVqgIAQqjey/O33
	 yKK0iML5h0EWAfEkBUyBuz0ihwljT9hg5xQmnshm77AZkd2E19HWlvvZm63VnFW3qRQT4
	 hFuaEIRfhqhvzah1U6Nhyi1PWlg2vIKwz3PDUpsEJSqYWYFIwyCs2+vyBv71toinVSpme
	 gV3W/6P57t21BOXwrSeFck4Gko8D1qaWMjSpjHXi30xnntXfCrJiJL86OX0/XZFKrig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=crKfjFYg;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49433606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49433606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=crKfjFYg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795536815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QBvbgfx4E8jvr7JMVNhMlTeMCa0V19tUFi11ZMoFNQo=;
	b=crKfjFYgGJqDdf3OP0eSzc00eiByxJviiVwcfWCntB+hykff4ZCzNiiAWSPU+gcmUg71kg
	u6Ptg/RriT0M55/Y3t71+SeR3s7SrUBC/ewu+VEOqFEqga3DEyTQfdaZTEfhAoQ7qiAu0X
	nOzT5K8+3/LiOGNHFuZjDfhRlNFgGjo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-u2_ObtZPOtOBxkRb9pI3PA-1; Tue,
 24 Nov 2026 16:13:33 +0000
X-MC-Unique: u2_ObtZPOtOBxkRb9pI3PA-1
X-Mimecast-MFC-AGG-ID: u2_ObtZPOtOBxkRb9pI3PA_1795536811
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2B5C1955E89;
	Tue, 24 Nov 2026 16:13:30 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1909F1956042;
	Tue, 24 Nov 2026 16:13:27 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeffrey Altman <jaltman@auristor.com>,
	stable@vger.kernel.org
Subject: [PATCH net v3 04/10] rxrpc: Fix ack parsing to mark reneged ACKs as lost for RACK-TLP
Date: Tue, 24 Nov 2026 16:12:52 +0000
Message-ID: <20261124161302.4044422-5-dhowells@redhat.com>
In-Reply-To: <20261124161302.4044422-1-dhowells@redhat.com>
References: <20261124161302.4044422-1-dhowells@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

If an packet that was ACK'd becomes NAK'd (ie. the peer discarded it), the
now-missing packet is not picked up by the RACK-TLP implementation.

Fix this by marking reneged ACKs as lost immediately.

Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261020201258.290827-1-dhowells%40redhat.com
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeffrey Altman <jaltman@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: stable@vger.kernel.org
---
 net/rxrpc/ar-internal.h |  3 ++-
 net/rxrpc/input.c       |  6 +++---
 net/rxrpc/input_rack.c  | 11 ++++++++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..d88dd02b6ab5 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1256,7 +1256,8 @@ void rxrpc_input_rack_one(struct rxrpc_call *call,
 void rxrpc_input_rack(struct rxrpc_call *call,
 		      struct rxrpc_ack_summary *summary,
 		      struct rxrpc_txqueue *tq,
-		      unsigned long new_acks);
+		      unsigned long new_acks,
+		      unsigned long reneged_acks);
 void rxrpc_rack_detect_loss_and_arm_timer(struct rxrpc_call *call,
 					  struct rxrpc_ack_summary *summary);
 ktime_t rxrpc_tlp_calc_pto(struct rxrpc_call *call, ktime_t now);
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index bda6e7d77013..9b02e36264aa 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -888,7 +888,7 @@ static void rxrpc_input_soft_ack_tq(struct rxrpc_call *call,
 				    rxrpc_seq_t *lowest_nak)
 {
 	unsigned long old_reported = 0, flipped, new_acks = 0;
-	unsigned long a_to_n, n_to_a = 0;
+	unsigned long a_to_n = 0, n_to_a = 0;
 	int new, a, n;
 
 	if (tq->nr_reported_acks > 0)
@@ -951,8 +951,8 @@ static void rxrpc_input_soft_ack_tq(struct rxrpc_call *call,
 		rxrpc_input_soft_rtt(call, summary, tq);
 
 	new_acks |= n_to_a;
-	if (new_acks)
-		rxrpc_input_rack(call, summary, tq, new_acks);
+	if (new_acks || a_to_n)
+		rxrpc_input_rack(call, summary, tq, new_acks, a_to_n);
 
 	if (call->tlp_serial &&
 	    rxrpc_seq_in_txq(tq, call->tlp_seq) &&
diff --git a/net/rxrpc/input_rack.c b/net/rxrpc/input_rack.c
index 87084cea88b1..c4276534f539 100644
--- a/net/rxrpc/input_rack.c
+++ b/net/rxrpc/input_rack.c
@@ -130,8 +130,17 @@ void rxrpc_input_rack_one(struct rxrpc_call *call,
 void rxrpc_input_rack(struct rxrpc_call *call,
 		      struct rxrpc_ack_summary *summary,
 		      struct rxrpc_txqueue *tq,
-		      unsigned long new_acks)
+		      unsigned long new_acks,
+		      unsigned long reneged_acks)
 {
+	/* Packets that got un-ACK'd get marked lost. */
+	while (reneged_acks) {
+		unsigned int ix = __ffs(reneged_acks);
+
+		__clear_bit(ix, &reneged_acks);
+		rxrpc_rack_mark_lost(call, tq, ix);
+	}
+
 	while (new_acks) {
 		unsigned int ix = __ffs(new_acks);
 

