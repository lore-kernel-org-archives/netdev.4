Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541470;
	b=egeVK4u9Xn3O4CWpStUlVekFe7NGtK6UykLmAEutg3S/u+eMDyea6/FRIz3YI2g1zoHQ
	 a77qb7V88YcgHLd+KEVWZelaBjQC2UOjeCMb5G0BNCZX1sGaefmAr9ZVq8Y4BlaQjEIXU
	 DsxEWjaw7mfxM7Cx0LU9px4QbiDaju79UEk/DevibC3r6451Rj/fMD3+yP+RrdIHh2N4w
	 IDla/ba0oiPeTG0fybV6vy8I4Wupz3H6rdNTkMIciFH7lsAI/y20CJhiHgu2LstjEefz2
	 ZbqEfR/kNO3jWFtutXv145ew9P3bLR2/o5+2PbLk+Y1CYTdSY/HhITMReiw+Yg1a7lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0RR5LvreyxciSo64ec1mUeCjNpiSiP2wPe91sNz/dzI=;
	b=2LYBvQGmvr6JM7cMAITvdb5BtSayLr+bmoENRYsqXtcoF0CbnaMu/P59o/A83sYhzTmr
	 zVkcZCFrTGWQLDa6kx57l64s4fyCEIRB7KvVy7+nnl2LaFhmMg8v1jQT4chN/qI1GpPHJ
	 A7pjIJ86X0xgcPaJBz8iiMU6JVGj2vCit1S4FIQ/7DbnGDENh6EiL6ztIdB8pUjNTaVpZ
	 xVQBcZp929qeb32szlcMf0/2FFz6si/wDU8bmHpjFbhxUuX92Sd2lHL7DEGHYyPwyMcn7
	 SZUnAxL3YOX0VmKKu150mSevJYDbHFjiWkfYd+DhnXnpcFXRUuI5ruy11fbPIfgnmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Aa6JGeOV;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00202606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00202606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Aa6JGeOV
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so2736040b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795541452; x=1796146252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RR5LvreyxciSo64ec1mUeCjNpiSiP2wPe91sNz/dzI=;
        b=Aa6JGeOVqgmBHeyX+CVHplahTzuhVl0rCOAqE63zoW/1gMj5sgVfQP4M/KQSltCw12
         KvG79kdzE1xh+zyzMhOhOz+XgyACK0vAmnofsMbkan46pRx64ah6a/Ua7sBgxA4pfnlR
         KeQg9O4XwM0HuhBkzFzbbaQnezPzAuUXfJLQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541452; x=1796146252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RR5LvreyxciSo64ec1mUeCjNpiSiP2wPe91sNz/dzI=;
        b=ljEIgtw0YclmXh38x36aNWgpvrbGybJNduES5ospAQDXb2dOz+6D8PkSlSSHLQ0U1f
         TXp+l4AMMMZjO+zKUAo0GSWoarzJf66HJ01sUZdFha78OSktc172XL8v40RJwE5qidXr
         QlsM7tKl0Cgmfp4rqjeIvaxitIfz4i2j6/nBlqvrDCnNu34soQk9NgOssuJ0K4GPu3kn
         Ig7HjvCVVYE8uP3Z3bFG88QsVN8Z1jSMM/ga5MNb35Og4H1L6NDkOMXsr2BZkoTx/IRB
         sUi5rhPRjsmzIp0jS0yTwnRB1eXcoZ5o8/bpbn7LXcEjAhIDYDJerISKK0r5El0D60gF
         8Sxg==
X-Gm-Message-State: APuU4Z+v3yX79i2dygqbRKN0sFTs6dd2DIiS3TsfSMn9E5oH8VS0er9X
	SswdlaPgeHaSPn2KlUE2ebALjjXSvKVpqIrHJYjQ2cLqdMfR4fMR8olyg+SIOvQpLHY=
X-Gm-Gg: AZFdTZekN3oQv6qMWRqVq02pdxHCbWx8eRwi0DAdQxaM2u/9MV0V8lFBjLiRX+xZwDY
	HDXda8/tMYHa7+pPYD7aG6fN4QDBSo80S/eKqnSaCbVbYX7f60tXt9NiMbZyh0hrTsCOZ2KYNPZ
	215Fl5n4tEGkxcKVuN2wBhpja/JjKupfWvuL/TGNoyPqGsigHBTXWk3XgELsJpePRJxPSHg36Lo
	eNcioKQHfkvwIQp7yXn+lHHoHb92JFnh/7+qK7N1xzjHWVklBfMb4ew5b4kC+Mohy7BbzKa1g0o
	vd972YDWJzFDPjmYzGeoqEuNIdMO5AJFfdh9P9KGy/0PONNJBGorS+g0IQNaC2R3I9N5kuNm0mA
	A749C9j4IOXcbrwp01NMNOgSqVqSUvweW3RaNEgJ+U7GDbVNsbS2q0Ht2M6HItZNEmyWYIgZ8ur
	BVXrw1/qMHgoQ4jiBZSVsL+q2ainIe9GUa0Dr2UJPm8M04yt2r4ZT+XhOfP8fSZ6p6bZdCAkFs9
	wYsNiO2a31nOSZBoRZlEb700cS7Zx/lfX4mFBBOwKkrsYyQ8Q6SJfrx8Z5/3UcZ9LqqeCygLiA6
	zbcEz0ar0Ev0ar62AZldZUOCAePXNuez0xnDRmHd+9NycGz8ofext8ExV4dDC+X4rEa6LmNzDCv
	NM/HyFncHlBrikgtGsTHcKuGw/SNYTb+GLeWluZ31Zk6bErBtrejinmLqnybYAre0
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr15099410637.9.1795541452264;
        Tue, 24 Nov 2026 09:30:52 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm7249487b3a.12.2026.11.24.09.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:30:51 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com
Cc: netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kapil@presceralabs.ai,
	stable@vger.kernel.org
Subject: [PATCH net v3] net/smc: drop the connection when the peer's failover cursor is impossible
Date: Tue, 24 Nov 2026 23:00:44 +0530
Message-Id: <20261124173044.591937-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

smc_switch_cursor() credits conn->sndbuf_space from the consumer cursor
the peer reported, with nothing bounding the amount:

	smc_curs_copy(&cons, &conn->local_rx_ctrl.cons, conn);

	if (smc_curs_comp(conn->peer_rmbe_size, &cons, &fin) < 0) {
		diff = smc_curs_diff(conn->peer_rmbe_size, &fin, &cons);
		smc_curs_add(conn->sndbuf_desc->len,
			     &conn->tx_curs_sent, diff);
		smc_curs_add(conn->sndbuf_desc->len,
			     &conn->tx_curs_fin, diff);

		smp_mb__before_atomic();
		atomic_add(diff, &conn->sndbuf_space);

local_rx_ctrl.cons is whatever arrived in the peer's last CDC message.
smc_cdc_cursor_to_host() drops only a cursor that moves backward within
one wrap, so a peer can advance cons.count by nearly peer_rmbe_size and
report consuming data this side never sent.  diff becomes that amount and
sndbuf_space ends above sndbuf_desc->len, breaking the
"0 <= sndbuf_space <= sndbuf_desc->len" that smc_cdc_tx_handler() states
and the tx path reads as free room in the send ring:

	writespace = atomic_read(&conn->sndbuf_space);
	/* not more than what user space asked for */
	copylen = min_t(size_t, send_remaining, writespace);

The first chunk of a two-part write is clamped against the buffer, the
second is not, so memcpy_from_msg() copies past the end of the send
buffer.  The two cursors advanced beside the credit can also leave the
ring: smc_curs_add() subtracts the size only once, so a diff of two
buffers or more leaves tx_curs_sent.count at or above sndbuf_desc->len,
and smc_tx_rdma_writes() uses that count as a source offset.

A peer reaches this path on an SMC-R link group with a second link by
asking for the active one to be deleted:

  smc_llc_rx_delete_link()
    smc_llc_process_cli_delete_link()
      smc_switch_conns()
        smc_switch_cursor()

An honest peer cannot have consumed more than this side has prepared and
not yet had confirmed, which is sndbuf_desc->len - sndbuf_space.  A peer
that reports more than that has broken the protocol, so drop the
connection the way smc_cdc_msg_validate() does for a sequence number that
cannot be honest - out_of_sync, peer_conn_abort, abort_work - and leave
the cursors alone.

Capping diff at that value instead was tried and is worse than it looks:
the cap keeps sndbuf_space and the cursors in range, but it leaves
local_tx_ctrl.prod behind local_rx_ctrl.cons, which is the state this
block exists to repair.  smc_write_space() then computes
peer_rmbe_size - smc_curs_diff(size, &cons, &prod) over an inverted pair;
with cons.wrap == prod.wrap + 1 that is negative, smc_tx_rdma_writes()
returns early on "rmbespace <= 0" for every later call, and the
connection stops sending for good.  Dropping the connection has no such
state to get wrong, and for a correct peer neither path is reached.

How this was found: by AI-driven fuzzing built on top of syzkaller.  It
reached the overflow through the other writer of sndbuf_space, the
DMB-nocopy credit patched next, on a loopback-ism connection with the
peer's consumer cursor forged by a debug patch: KASAN reported an
869056-byte write past the send buffer in smc_tx_sendmsg()
(use-after-free in _copy_from_iter).  The failover route above was then
found by reading the other writers of that counter; we do not have a
multi-link SMC-R group with two RDMA devices, so that route comes from
the code and not from a run.

Fixes: c6f02ebeea3a ("net/smc: switch connections to alternate link")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
Link: https://lore.kernel.org/all/20261122053223.2497832-2-piyus@iiitd.ac.in/   

v2 was a two-patch series.  This is a respin of the first patch only, which is
the one the review covered; the second ("net/smc: bound the DMB-nocopy
send-buffer credit as well") is unchanged and is being answered separately.

Changes in v3, all from the review of v2:

 - Replaced the fix.  v2 capped diff at sndbuf_desc->len - sndbuf_space and
   carried on.  The review pointed out where that leaves local_tx_ctrl.prod:
   behind local_rx_ctrl.cons, which is the inversion the block exists to
   repair.  smc_write_space() then computes peer_rmbe_size -
   smc_curs_diff(size, &cons, &prod) over an inverted pair - for size 100,
   prod (0,90) and cons (1,10) that is -80 - and smc_tx_rdma_writes() returns
   early on "rmbespace <= 0" for every later call, so the connection stops
   sending for good.  The cap traded an out-of-bounds write for a permanently
   mute connection.  v3 drops the connection instead and leaves every cursor
   alone, which has no partially-advanced state to get wrong.

 - The bound is no longer called "sent", in the code or in the subject.  It is
   tx_curs_prep - tx_curs_fin, prepared and not yet confirmed, because
   smc_tx_sendmsg() lowers sndbuf_space when data is copied in rather than
   when it is written; the review was right that "outstanding" described a
   tighter bound than the code applied.

 - The violation is now visible: out_of_sync and peer_conn_abort are set and
   abort_work is queued, as smc_cdc_msg_validate() does for a sequence number
   that cannot be honest.  v2 silently continued.

Not addressed here, deliberately: the review also found that
smc_cdc_tx_handler() updates sndbuf_space and tx_curs_fin under
bh_lock_sock() while smc_switch_cursor() updates both under
conn->send_lock, so the old link's completions can race the switch.  That
is true before this patch too - the unpatched smc_switch_cursor() does the
same atomic_add() and the same tx_curs_fin advance under send_lock alone -
and it needs a completion to land in the window rather than a hostile
cursor, so it is a separate bug with its own Fixes: tag.  It is answered in
the reply to the review rather than fixed blind here: we have no multi-link
SMC-R group with two RDMA devices, and the obvious drain
(smc_cdc_wait_pend_tx_wr() before the send_lock) may stall on the
smcr_link_down() path, where the old QP's completions arrive only after
smcr_link_clear() flushes it.

Measured, and not: the overflow was measured on a loopback-ism connection
with the peer's consumer cursor forged by a debug patch - KASAN reported an
869056-byte write past a 65504-byte send buffer - and with the bound in place
no report at forged cursors of 100000, 1000000 and 2000000, with ordinary
SMC-D traffic unaffected (SMC_DIAG mode=2, fb_reason=0x0).  The LLC
DELETE_LINK route to smc_switch_cursor() has not been exercised here; it
comes from reading the code.  smc_core.c builds clean and checkpatch
--strict reports nothing.
---
 net/smc/smc_core.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index a3164201c142..ccfc3b1dc849 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -1055,6 +1055,7 @@ static int smc_switch_cursor(struct smc_sock *smc, struct smc_cdc_tx_pend *pend,
 {
 	struct smc_connection *conn = &smc->conn;
 	union smc_host_cursor cons, fin;
+	int unconfirmed;
 	int rc = 0;
 	int diff;
 
@@ -1069,6 +1070,38 @@ static int smc_switch_cursor(struct smc_sock *smc, struct smc_cdc_tx_pend *pend,
 		 * fin above, so now prod is smaller than cons. Fix that.
 		 */
 		diff = smc_curs_diff(conn->peer_rmbe_size, &fin, &cons);
+		/* The peer's consumer cursor is taken as it arrives, so diff
+		 * is a value the peer chose.  It cannot honestly exceed what
+		 * this side has prepared and not yet had confirmed, which is
+		 * sndbuf_desc->len - sndbuf_space: smc_tx_sendmsg() lowers
+		 * sndbuf_space as data is copied in, and smc_cdc_tx_handler()
+		 * raises it again as the peer confirms.  A larger diff credits
+		 * sndbuf_space past the end of the send buffer - breaking the
+		 * "0 <= sndbuf_space <= sndbuf_desc->len" that the tx path
+		 * depends on - and pushes tx_curs_sent out of the ring, which
+		 * smc_tx_rdma_writes() then uses as a source offset.
+		 *
+		 * Simply capping diff is not enough: the cap would leave
+		 * local_tx_ctrl.prod behind local_rx_ctrl.cons, which is the
+		 * state this block exists to repair, so smc_write_space()
+		 * could return a negative peer_rmbe_space and the connection
+		 * would stop sending for good.  A peer that reports consuming
+		 * what was never prepared has broken the protocol, so drop the
+		 * connection, as smc_cdc_msg_validate() does for a sequence
+		 * number that cannot be honest.
+		 */
+		unconfirmed = conn->sndbuf_desc->len -
+			      atomic_read(&conn->sndbuf_space);
+		if (diff > max_t(int, unconfirmed, 0)) {
+			conn->out_of_sync = 1;	/* prevent any further receives */
+			conn->local_tx_ctrl.conn_state_flags.peer_conn_abort = 1;
+			smc_wr_tx_put_slot(conn->lnk,
+					   (struct smc_wr_tx_pend_priv *)pend);
+			sock_hold(&smc->sk); /* sock_put in abort_work */
+			if (!queue_work(smc_close_wq, &conn->abort_work))
+				sock_put(&smc->sk);
+			return 0;
+		}
 		smc_curs_add(conn->sndbuf_desc->len,
 			     &conn->tx_curs_sent, diff);
 		smc_curs_add(conn->sndbuf_desc->len,
-- 
2.34.1

