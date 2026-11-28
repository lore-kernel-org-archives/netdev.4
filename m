Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833937;
	b=uCXmV37vUXEC8KQW/cn3NgKrqO026bNTRqSaTSFO7c6A7ETxxLVnvvvsDhYYYzaFmN8p
	 2RfuPtU4rGIf5q03+TfdcLzUjnR7IvD8m7Ru3dH0LUPk69CwUHOtSmrhnC0RgWe/Nt7ud
	 rl4LyRw8h4Ra5VmwyGmiMfeb5Ei+3IbZE3+xm77Ku2OmdY+X9PeZwKYsYw7ntlTKw9Zp/
	 926GTUTwSZfvHsBmI1x+g3Fe9JsawllgMkKqdn/0kFinauuDpNFkL/6XfFVy0xRjLnj/L
	 8MvR4fEsLhOA/ZwfFbojMKAnECczydQYAIuegL6YuRxylqn50i24OvM5MgtoQGSSylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833937;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-CM-DELIVERINFO:X-Coremail-Antispam;
	bh=C+MlJe8uTIZ2wjks8hDs0Rdvxu68dB+wIWc0TEGmk7E=;
	b=h0/oCLyQWLI2i1q0UVAvvitcSBXej3Ve/8LX2xG2j7PYm21xAuHa/uTi/Xwtob4k0LF/
	 MFUZh5nrfijG5t+W7DkUqXczexmEjT9Awlmbkc5JVNWlOYv4WYoIU5xCl3fN81XtLgDl3
	 eMY6WF/7F10spjTPgQdZPmuFYCuu24Q5kCYU0X5M6JwzDdQL60ad8sfLakn4dCkYs6wAp
	 R3odkrMhlq8ExxpMiaTVZbqARxIeGBTan0aQGmEnU9NgSIvluTMiKmc5UmJrqnv32P8Eo
	 QrLDZJvPM9FxQ7KBCUyTQZDbQIMQ+uxeA7FpYejAOELC2pTmp2RBq7tLFqOcpV6LgCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zju.edu.cn;
	spf=pass smtp.mailfrom=zju.edu.cn;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=kmaICSfS;
	dkim=pass header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b="Vs/GBVo7";
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B67606A31C;
	Sat, 28 Nov 2026 02:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=gw2610 header.b=kmaICSfS;
	dkim=pass (2048-bit key, unprotected) header.d=zju.edu.cn header.i=@zju.edu.cn header.a=rsa-sha256 header.s=cm2610 header.b=Vs/GBVo7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=gw2610; h=Received:DKIM-Signature:Received:From:
	To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding; bh=C+MlJe8uTIZ2wjks8hDs0Rdvxu68dB+wIW
	c0TEGmk7E=; b=kmaICSfS/6I2jeLTdqGMvJs/Ao7P22UjNMf8CqUN8GWO7jfWwy
	hSUo041jbVH3c6sXU1IKU/y4GsnWbrKRwcDrZdyVNiBewUxkJzuIEy8ezw7TZlXC
	hPQWDWZIT1Nzr3OyUw+eET/L4zQwwiR4l71ttFgMc8hM7wj4HMGSZ/sag=
Received: from zju.edu.cn (unknown [123.60.231.41])
	by mtasvr (Coremail) with SMTP id _____wAHYn1FQApr1qc7Ag--.2291S3;
	Sat, 28 Nov 2026 10:45:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zju.edu.cn; s=cm2610; h=From:To:Subject:Date:Message-ID; bh=C+
	MlJe8uTIZ2wjks8hDs0Rdvxu68dB+wIWc0TEGmk7E=; b=Vs/GBVo70ZkvhAqdeJ
	xbLF3XnE1kHbwqGytfITommDh6bR0Xu1GzQhBwg38d5VnOj+yv+BdK9BlRy56b5f
	hDiPn52TDK6pnFf3lpME1ZdiPU1CeB4sYJlAGaFcWSnCgqSEiQqOkLhjK/dxOSPs
	gC0GsfNso4xs9aQW1oHrWOwig3UsjM9+9JZncXm1KODePQxsCpPDNDWkk/6ISC84
	SwDB8stL7N4jdt5iG8vdzc3LV8fnE4g3BMiYW2z1rxWPgSME9ya87jHFkU1VTYw0
	9iK11N3XzaRajtcCl5R8UO1MrQZmuw3TmyamMMKrVHW8NYeTkVx2NwQLG724RH2t
	WV9A==
Received: from ubuntu2404-234226.. (unknown [123.60.231.41])
	by mail-app3 (Coremail) with UTF8SMTPSA id zS_KCgBXY6BDQApraoWZAQ--.50523S4;
	Sat, 28 Nov 2026 10:45:24 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Ma <linma@zju.edu.cn>
Subject: [PATCH net v2] rxrpc: Fix NULL Tx buffer handling in the retransmission path
Date: Sat, 28 Nov 2026 10:44:27 +0800
Message-ID: <20261128024427.306409-1-linma@zju.edu.cn>
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
X-CM-TRANSID:zS_KCgBXY6BDQApraoWZAQ--.50523S4
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwAMEmryeh4flABNsn
X-CM-DELIVERINFO: =?B?/l8dYwXKKxbFmtjJiESix3B1w3tPqcowV1L23Bze5QtIr9Db75bEBiiEybVhThS0pI
	APHnkvfpsecr7gZmVpD/pedGe87gU8Umht5p0mFnlIkYSId2qXld9eGf+JCpvtZ3yUMajP
	cobNANwHHvLV1Dey/saO2u6RLISSt++5xU6HXRuEtHoMJdN8ee+GckqBphoFGA==
X-Coremail-Antispam: 1Uk129KBj93XoWxCw15Ary5uw17JF1Dtry5trc_yoW7Jw4xpa
	yrGrsxKF4DJrnIyF4Syw4xZw45uF48J347Ww1Uuwna9r98GryY9Fs7Kay5KFyUCwsrJrWU
	ZFWava45Aw4DJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IE4IxF12IF4wA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU26pBDUUUU

rxrpc_retransmit_data() can be handed a NULL txb in two ways.

First, rxrpc_transmit_fresh_data() commits the Tx queue state before
rxrpc_send_data_packet() has prepared the packet.  If the wire header
allocation fails, tx_transmitted is not advanced, and the next pass
builds req.seq from tx_transmitted but req.tq from the new tail segment.
Indexing that segment with the stale sequence number can select a NULL or
wrong txbuf.  If the LAST packet was in the unsent batch, the Tx phase
can also be closed with packets that were never sent.

Second, rxrpc_input_ackall() rotates the Tx window and frees txbufs up to
tx_transmitted, but it doesn't advance acks_hard_ack.  A subsequent TLP
expiry can therefore select an in-range but already-freed slot.

Fix the first by only committing tx_qtail and tx_top after
rxrpc_send_data_packet() has advanced tx_transmitted, and by arming a
short retry timer if it didn't.  Fix the second by advancing
acks_hard_ack on ACKALL.  Also make rxrpc_retransmit_data() tolerate a
missing txbuf as a final guard, and retain the lower-bound check in
rxrpc_resend_tlp().

Fixes: b341a0263b1b ("rxrpc: Implement progressive transmission queue struct")
Fixes: 7c482665931b6 ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
Changes in v2:
  - Only commit tx_qtail and tx_top after rxrpc_send_data_packet() has
    advanced tx_transmitted, and retry after a short delay if the wire
    header allocation failed, instead of only guarding the TLP fast path.
  - Advance acks_hard_ack on ACKALL and tolerate a missing txbuf.

Link: https://lore.kernel.org/all/20261122135515.3989708-1-linma@zju.edu.cn/
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122135515.3989708-1-linma%40zju.edu.cn

 net/rxrpc/call_event.c | 29 +++++++++++++++++++++++------
 net/rxrpc/input.c      |  7 +++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index 21be9c86d7a7..2360e9289602 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -64,6 +64,9 @@ static bool rxrpc_retransmit_data(struct rxrpc_call *call,
 	unsigned int ix = req->seq & RXRPC_TXQ_MASK;
 	struct rxrpc_txbuf *txb = tq->bufs[ix];
 
+	if (!txb)
+		return false;
+
 	_enter("%x,%x,%x,%x", tq->qbase, req->seq, ix, txb->debug_id);
 
 	req->retrans = true;
@@ -141,6 +144,7 @@ void rxrpc_resend_tlp(struct rxrpc_call *call)
 	/* There's a chance it'll be on the tail segment of the queue. */
 	req.tq = READ_ONCE(call->tx_qtail);
 	if (req.tq &&
+	    after_eq(call->tx_transmitted, req.tq->qbase) &&
 	    before(call->tx_transmitted, req.tq->qbase + RXRPC_NR_TXQUEUE)) {
 		rxrpc_retransmit_data(call, &req);
 		return;
@@ -213,6 +217,7 @@ static void rxrpc_transmit_fresh_data(struct rxrpc_call *call, unsigned int limi
 		struct rxrpc_txbuf *txb;
 		rxrpc_seq_t send_top, seq;
 		int limit = min(space, max(call->peer->pmtud_jumbo, 1));
+		bool last;
 
 		/* Order send_top before the contents of the new txbufs and
 		 * txqueue pointers
@@ -244,17 +249,29 @@ static void rxrpc_transmit_fresh_data(struct rxrpc_call *call, unsigned int limi
 				break;
 		} while (req.n < limit && before(seq, send_top));
 
+		last = txb->flags & RXRPC_LAST_PACKET;
+
 		if (__rxrpc_call_state(call) == RXRPC_CALL_CLIENT_PRE_SEND)
 			rxrpc_set_call_state(call, RXRPC_CALL_CLIENT_SEND_REQUEST);
-		if (txb->flags & RXRPC_LAST_PACKET) {
-			rxrpc_close_tx_phase(call);
-			tq = NULL;
+
+		rxrpc_send_data_packet(call, &req);
+
+		if (call->tx_transmitted != seq) {
+			/* The wire header allocation failed; retry shortly. */
+			ktime_t delay = ms_to_ktime(100);
+
+			call->rack_timer_mode = RXRPC_CALL_RACKTIMER_TLP_PTO;
+			call->rack_timo_at = ktime_add(ktime_get_real(), delay);
+			trace_rxrpc_timer_set(call, delay,
+					      rxrpc_timer_trace_rack_tlp_pto);
+			break;
 		}
-		call->tx_qtail = tq;
-		call->tx_top = seq;
 
+		call->tx_qtail = last ? NULL : tq;
+		call->tx_top = seq;
+		if (last)
+			rxrpc_close_tx_phase(call);
 		space -= req.n;
-		rxrpc_send_data_packet(call, &req);
 	}
 }
 
diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 73cafe6bfa9f..ee1073951c8d 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -1242,6 +1242,13 @@ static void rxrpc_input_ackall(struct rxrpc_call *call, struct sk_buff *skb)
 
 	if (rxrpc_rotate_tx_window(call, call->tx_transmitted, &summary))
 		rxrpc_end_tx_phase(call, false, rxrpc_eproto_unexpected_ackall);
+
+	/* ACKALL acknowledges everything transmitted, but rotating the Tx
+	 * window only advances tx_bottom.  Advance the hard-ACK mark too so
+	 * that a subsequent TLP probe doesn't select a freed Tx buffer.
+	 */
+	if (after(call->tx_transmitted, call->acks_hard_ack))
+		call->acks_hard_ack = call->tx_transmitted;
 }
 
 /*

