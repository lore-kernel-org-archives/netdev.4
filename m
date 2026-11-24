Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536826;
	b=hLaQtaqJUWKrrhVkuOlNdsNBpMb7v+U3CDCJpSXwdPDmDbsrq9fEf5xkjRBFNqvjSUq0
	 Z4ra0l/zgQIgeIz6NlxtNUOmO1oIQ5r2QKJCPSdBIHM1lQnDLs8D3JHE80QOaMH2M1ppi
	 QEnIp9aL5droOXgAT5JPz/ioBdvsczUujnp5L2/C4DqYJIFBjPDxwh9BUzDWDWf0YPw32
	 xDxgTei3X7PBxW0E1UOYvwGndm5GMjg1lUoEXcPA9KmKwYnihBJksqTedj1OB5oJW9azZ
	 6LanjxnmOsA7wzHTPpnT9farV/8BX8afiW9JvumFGDtEh9ceYjYSeBCn51BS+x62ggg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536826;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=FAoXPtjsSbk6QimXxTrqaQ81lI7OL892cNz+SdiZLNA=;
	b=Ynb5UHhCVPfzwqfs2ZSPoOUQ7pTcivrWbPoP44Wzh+TZFdooUf9I7BVtOa3ed5P/vq6E
	 zEZlTIzOuuvwzRIsEbRuZLA63/xyhLRygVB3FuPF86maevG64CW8/u1QffdrKwqpQnAR2
	 6TFCjTy12RsGYpaTPWWU0fdrdYbP2rqWMhFawkhjK+Y5XSwX0U37HrpYqEEbWN8BmtaAw
	 RY91urKluzdob4R4oXFja6mx0iPn3W9SxQbfPcTfOclhrY85ekF32JJnRr6L2j679YywI
	 X0qOw9DUs0MyGGrGos2O9XTxHNKsLHZ75wah4+OFup/+FKgFdMj48ujUBa4Idh8vtXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YpFZxxEO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6321F606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6321F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YpFZxxEO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795536824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAoXPtjsSbk6QimXxTrqaQ81lI7OL892cNz+SdiZLNA=;
	b=YpFZxxEOSLo1dF42W+kMoVe7QekClkZ3n6ixPOoxy+3v5fC9IutgtoG4ejgOppibp6htbP
	DMIxzDb5CfbtE1PmDKxpmc1/mplE+bLPmLUb1OhtpseqZcebEs9nbw2KZmNPXVNiFhL+sl
	S+oTiir5Ij3dxMNfAlSJ9bT3uPuvW6w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-nU_5C4YEP-OUGK7FTY2g9Q-1; Tue,
 24 Nov 2026 16:13:39 +0000
X-MC-Unique: nU_5C4YEP-OUGK7FTY2g9Q-1
X-Mimecast-MFC-AGG-ID: nU_5C4YEP-OUGK7FTY2g9Q_1795536814
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A9A71955E89;
	Tue, 24 Nov 2026 16:13:34 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F40A6180197B;
	Tue, 24 Nov 2026 16:13:31 +0000 (UTC)
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
Subject: [PATCH net v3 05/10] rxrpc: Fix RTT processing for a presumed lost packet getting ACK'd
Date: Tue, 24 Nov 2026 16:12:53 +0000
Message-ID: <20261124161302.4044422-6-dhowells@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

With RACK-TLP, under some circumstances a packet that is presumed lost has
its xmit timestamp reset when it is marked lost.  However, if an ACK then
turns up anyway, rxrpc_rack_update() sees a bad RTT calculation because the
xmit_ts is calculated as being KTIME_MAX.

Fix this by skipping the RTT processing in such a case.

Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
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
 net/rxrpc/input_rack.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/rxrpc/input_rack.c b/net/rxrpc/input_rack.c
index c4276534f539..e5288e5beb59 100644
--- a/net/rxrpc/input_rack.c
+++ b/net/rxrpc/input_rack.c
@@ -71,6 +71,12 @@ static void rxrpc_rack_update(struct rxrpc_call *call,
 	if (__test_and_clear_bit(ix, &tq->segment_lost))
 		call->tx_nr_lost--;
 
+	/* A packet may get marked lost and then ACK'd before we get to
+	 * retransmitting which can result in xmit_ts having been reset.
+	 */
+	if (tq->segment_xmit_ts[ix] == UINT_MAX)
+		return;
+
 	if (test_bit(ix, &tq->segment_retransmitted)) {
 		/* Use Rx.serial instead of TCP.ACK.ts_option.echo_reply. */
 		if (before(call->acks_highest_serial, tq->segment_serial[ix]))

