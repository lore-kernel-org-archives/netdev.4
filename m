Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536830;
	b=srp1qTZO67wDIlmtZ3fwhkdabrQn4J2vM7oN7Efx+L2cCCp2tQJK09RAUZJeJMKkQY6A
	 MYQzjH5ZXZzZem+Y+ymeLbxDgR1BgSZFy3g5ndOIcwSwtPbAJGuXvg6sezGNKU0K+OZeY
	 UFh5LabKHF1GOrwM8epMWgzvcG0XiwsPZtguegj2DKNctElqBagYHkM9iVER+SIC5u1yB
	 MrzCDeg4rZS5RoZgT8/lV12I09rvE1cfTZP2RT1x90c2z4GFqzHZCkh1bPZuds94USfer
	 nfkBqJZPESnQeo3FoNtn4DM4rDikwKg+7FfFgoVypIiyvAoMjwsRw48np5FRFpka0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536830;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Kg6zkqvSVkd4VudrLAm3sSgl16ZCR/xE2QrD5zG49Qg=;
	b=cSn0m0DG2plWNnEXbg7ZiQ422fvNly5kYaJ18ISh/HaAnt4p4zilvZRUCYWGhvfn1Dlc
	 aOXSIrjqF6Eh9+ZnD2mpOXPFHHrH/n5Sg4q1ftpqL9ySVNV0jH3eJs68rgG2U6iDXn5Do
	 T4DidCP3nMbd/QLC2TsEgGc6Rljxov9MfSqTqKsicXGLthjSBgK+jELpg+YbOm9Xb9NfN
	 8YZAufN1FLwU/i6YxakxHrYpPwMbNAdFF/yeOrfoWZvgSVszKghWdpeJgD/1ycCOfHwfM
	 jLB83wSpSKuiHSbO/hGmWtczNjWrm+Ym032Am1Fk0Xymja62OHIg1Bb6tq+7g7u6SKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tdct+rFK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE058606A335
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE058606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tdct+rFK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795536828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kg6zkqvSVkd4VudrLAm3sSgl16ZCR/xE2QrD5zG49Qg=;
	b=Tdct+rFKGwvIOo+DW7T0AibzO8Z3rmnVQDr7xI3h5cXiDYkPewX8mpDn/QFCOBN+JMYP/e
	zwml5tjizMXpopr+N3i/JIplBuMDxZF8JeyoHfAjR4/RdAZ7MFTABd++07J8yhk06cvP65
	MwQwRhyiw+nxG4nJtZZtwXz2YRqG6EM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-252-v-klJlIpOP6BL4Pg_fGMvg-1; Tue,
 24 Nov 2026 16:13:46 +0000
X-MC-Unique: v-klJlIpOP6BL4Pg_fGMvg-1
X-Mimecast-MFC-AGG-ID: v-klJlIpOP6BL4Pg_fGMvg_1795536823
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2356018005A2;
	Tue, 24 Nov 2026 16:13:43 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A71DC18011D4;
	Tue, 24 Nov 2026 16:13:40 +0000 (UTC)
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
Subject: [PATCH net v3 07/10] rxrpc: Fix limit on packets to be transmitted in one go
Date: Tue, 24 Nov 2026 16:12:55 +0000
Message-ID: <20261124161302.4044422-8-dhowells@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Fix rxrpc_transmit_fresh_data() to honour the limit set on the number of
packets it can transmit in one go.  The 'limit' variable is accidentally
shadowed by another variable calculating the limit dynamically.

This was spotted by Claude-opus-5-5 run locally.

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
 net/rxrpc/call_event.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index b102a055c2e0..4def732352e9 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -189,7 +189,8 @@ static void rxrpc_close_tx_phase(struct rxrpc_call *call)
 }
 
 /*
- * Transmit some as-yet untransmitted data, to a maximum of the supplied limit.
+ * Transmit some as-yet untransmitted data, to a maximum of the supplied limit
+ * (UINT_MAX for no limit).
  */
 static void rxrpc_transmit_fresh_data(struct rxrpc_call *call, unsigned int limit,
 				      enum rxrpc_txdata_trace trace)
@@ -212,7 +213,8 @@ static void rxrpc_transmit_fresh_data(struct rxrpc_call *call, unsigned int limi
 		struct rxrpc_txqueue *tq;
 		struct rxrpc_txbuf *txb;
 		rxrpc_seq_t send_top, seq;
-		int limit = min(space, max(call->peer->pmtud_jumbo, 1));
+		int jlimit = umin(umin(space, max(call->peer->pmtud_jumbo, 1)),
+				  limit);
 
 		/* Order send_top before the contents of the new txbufs and
 		 * txqueue pointers
@@ -242,7 +244,7 @@ static void rxrpc_transmit_fresh_data(struct rxrpc_call *call, unsigned int limi
 			req.n++;
 			if (!txb->jumboable)
 				break;
-		} while (req.n < limit && before(seq, send_top));
+		} while (req.n < jlimit && before(seq, send_top));
 
 		if (__rxrpc_call_state(call) == RXRPC_CALL_CLIENT_PRE_SEND)
 			rxrpc_set_call_state(call, RXRPC_CALL_CLIENT_SEND_REQUEST);
@@ -255,6 +257,11 @@ static void rxrpc_transmit_fresh_data(struct rxrpc_call *call, unsigned int limi
 
 		space -= req.n;
 		rxrpc_send_data_packet(call, &req);
+		if (limit < UINT_MAX) {
+			limit -= req.n;
+			if (limit == 0)
+				break;
+		}
 	}
 }
 

