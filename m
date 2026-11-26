Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705586;
	b=2gzpm/n1uVVVFzZA6J/NnBgCRd4iKjD6qeYTBxsZvgqBO3e6MZf34xNGOHFYRgUJkFFi
	 MtCAPPfmuHYoaLB+2E71qU5vhSZv4iwKLsGI8t7atG3aLv1IP3nHzVquNp6ii9F0xtWot
	 /kU03FuTJX437sml0rpPSH9xsZYMcpeWN6n18qeOJgLBo86UuWj93UqzPwILWke2I9GV6
	 cNOnOfkpeks3XIqwtR7PKhnikDQ1UNbDSV/U5kdPFmozYENXWQQ3KsVzVnr082QLqilcV
	 1i89T1193pjeiulthhz4wpXp/qbQT3fYoM+0N3P3IcyueGVlBRp+Oa4THjnAzu9Z3DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+aRn42NYa4Pq+u5LUKua26cG0QzSBuOuVe0hITLGUNs=;
	b=kjBst32IQtBN7wZlBXQEZyEOLJKjUOmRARx5WosbG55Bf1iQisJQQbmS8rxqTAJh9mKu
	 30zr71kjkZbp/deuAaRLsosVgYYcqR4NmWPBtppSORB1XAZ8tDNELXwCrHGq5BidVeMRy
	 kK/m3axz/UwBUg7mte4hbm3ey1lseQUiTFrJLxAvv63/xu3KyF34jhz0RNv67U6vZkfle
	 uWHUD/uxqlmOFvV3uIOdoAL4P5Hk6HrOVqfg0c8YBk30VCTbdURa010L6C8iMuVNoj04M
	 h0u8q69MTWoE14dOelG0OIdQfEZAA/TlwhSvHbh2nmXNhzx7dr8inXvyWcp6rfqKjRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=aFdrxz7J;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC3606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCC3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=aFdrxz7J
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso48768195ad.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705584; x=1796310384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aRn42NYa4Pq+u5LUKua26cG0QzSBuOuVe0hITLGUNs=;
        b=aFdrxz7JOo7v6U/alV2jtQL5L4JWnjR0wrbrHI3pYeN3J1UxcyJBrS0RjHbPbyJZhJ
         bY8ASzvbHcpjg/vK3IljclqBCnKmGbkFppJ/BqbqQft31FE9qwfh7BKDPER1WmMHkAff
         dmZfKOwbwmrbrF1EaZRIqDG8VEOR+DndCNK1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705584; x=1796310384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aRn42NYa4Pq+u5LUKua26cG0QzSBuOuVe0hITLGUNs=;
        b=CB57tqvWn/+H/+3AmwJnSK2W4LLsalMYeFTXAjlTic9OvefCWARMCjI/SizfeGLIUR
         cAQ8Vm+NWK5FNd6LQJhnt3v3Ee4suuR2F8+DTMrdMwHeWCyn514IVzpK+/my4O2VlhGN
         ddmvrMkm9/gC87APdK527jpGqwBtucEVwUT2xScH3Si1Gw/yd4WHEts+PBnAyXIJB3Hc
         cAU3kDQ7xcbZIK0jBlWVz4iryu/e9kGRSgxbobYw/iRk/EI9duHkQHyeJwPDbqd//zfo
         HjDFrZirXtvMyzpdO54psCuW+SeEJiNzlToq2Mpm3vpMuu2ppcd9atYT9+2uyTwgT0Ab
         an8Q==
X-Gm-Message-State: APuU4Z+BYIUcC+NkgqviB2j3mDrmIHJavnTqwdBYX1s5Bl3bd1VbAhIB
	QfQ/pgy8/OQRcHwhTCDu0AOefTiYHRGMp/GTTicdWB554EeB542qTfBuHg4yCOhq/vc=
X-Gm-Gg: AZFdTZfOsT+UwxVfgVam+UtwgXz8dyhchmb8p9JM1fWjXD7SbECf3AXAUIXaIMUJ+i6
	6cdx14ebWNbRQSsmPqne6p8Jax9ZMhPaELuj+Gz1kxAbv05mcPZAgGb1GSAINH4wTUX5HevdESF
	5lOHTmdUPmyzACQBanAfLE4SNIqeXnf7o4m0DwiOJtLeMq60NxaAccdNPOnhzZN96BiQ7QZYfjk
	UVUVGw7ykfLLSbJ0P1yVOj0LeshMqH8R1cDlBx5sFhrnNlgQ5vRtdx4kWbwb2KG1YbLoXmTvAzB
	BQEBFgJFFbDi08gzoF6onGWtZyVCEG8P3/+gpjn9Cesu//X60B9BUGKzbkdBWyKJN0vjyZn6PdB
	Rf3uISm40o2mbGCcLBAQmPLnJIUcjkLtbhMVsKgaO8IXFZ88NFqjRzhnHMlzJnH1zYxidIzP3tu
	nWqpWlRyBMQTJ4txdnGmTpHe9cmZht+cvQvBDWw5wfFP5c4y+Cza/F3a/vVFaeoCRivQbTlX/QV
	s4BgLgMzzpH8ZWI1ggTq/fSogDx3LfMEgYV33FvJKWCZkOqERSbHleeVX9IodQUv2LFD7Sy0tHB
	lLOpxzio/wokzFyxakebTPhKYuq2CPX0LCsC++Lgk0qb6IteoFSSf0e+Lpu39+f+zvFzbQnfafb
	kquri1mkeG5CHgeEpLPi0cIPGPz3dilZm3a0x2TfwpM64V6cpd8sJFl7CIPIEOEi9
X-Received: by 2002:a17:903:298d:b0:2f0:3dc0:9bbb with SMTP id d9443c01a7336-2f03f2115e7mr153388725ad.34.1795705584340;
        Thu, 26 Nov 2026 07:06:24 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm104231065ad.71.2026.11.26.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:23 -0800 (PST)
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
Subject: [PATCH net v4] net/smc: bound the DMB-nocopy send-buffer credit by what was sent
Date: Thu, 26 Nov 2026 20:36:17 +0530
Message-Id: <20261126150617.2113159-1-piyus@iiitd.ac.in>
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

On the SMC-D DMB-nocopy receive path, smc_cdc_msg_recv_action() credits
sndbuf_space from the consumer cursor the peer reported and then assigns
that cursor to tx_curs_fin:

	diff_tx = smc_curs_diff(conn->sndbuf_desc->len, &conn->tx_curs_fin,
				&conn->local_rx_ctrl.cons);
	atomic_add(diff_tx, &conn->sndbuf_space);
	/* guarantee 0 <= sndbuf_space <= sndbuf_desc->len */
	smc_curs_copy(&conn->tx_curs_fin, &conn->local_rx_ctrl.cons, conn);

The peer writes that cursor into the DMB itself, so under DMB-nocopy the
value is remote input and nothing bounds it.  A cursor reporting more
consumed than this side ever sent raises sndbuf_space past
sndbuf_desc->len, and the assignment moves tx_curs_fin past tx_curs_sent,
breaking the fin <= sent <= prep order the three cursors are documented
with.

The peer can only have consumed what was sent, so bound the difference by
the unconfirmed bytes between tx_curs_fin and tx_curs_sent, and advance
tx_curs_fin by the bounded amount instead of assigning the reported
cursor.  Bounding by sndbuf_desc->len - sndbuf_space would also admit
bytes that are only PREPARED, which would move tx_curs_fin past
tx_curs_sent.

Take the two cursors as snapshots and write tx_curs_fin back as one
cursor.  smc_curs_diff() reads wrap and count with plain loads, and this
runs in a tasklet under bh_lock_sock() while smc_tx_rdma_writes() advances
tx_curs_sent under conn->send_lock, so reading it in place can pair a
pre-wrap wrap with a post-wrap count: the difference then either collapses
to zero, losing the credit after local_rx_ctrl.cons has already moved, or
exceeds the buffer and the bound does nothing.  smc_curs_add() sets count
and then wrap with plain stores and transiently leaves
count >= sndbuf_desc->len, so advancing tx_curs_fin in place would replace
an atomic 64-bit update with a torn one.  smc_tx_prepared_sends() takes
the same snapshots for the same reason.

Fixes: cc0ab806fc52 ("net/smc: adapt cursor update when sndbuf and peer DMB are merged")
Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
v4: addresses the review of v3
    (https://lore.kernel.org/r/sashiko-outbox-233892@kernel.org)

    The finding is right on both halves, and the remedy is the one it
    names.  v3 passed &conn->tx_curs_sent and &conn->tx_curs_fin straight
    to smc_curs_diff() and advanced tx_curs_fin in place with
    smc_curs_add().  v4 snapshots both with smc_curs_copy(), computes both
    differences from the snapshots, advances the local copy and writes it
    back with smc_curs_copy(), so the cursor update stays a single atomic
    64-bit write and neither read can tear.  The torn read in the diff_tx
    computation predates this series - it read &conn->tx_curs_fin in place
    - and the snapshot closes that too.

    No change to what is bounded or to the bound itself.

v3: bounded the credit by the unconfirmed sent bytes and advanced
    tx_curs_fin by the bounded difference rather than assigning the
    reported cursor.

    How this was found: an AI-driven fuzzing harness built on syzkaller,
    developed jointly by Kapil Vaswani and myself, driving a forged CDC
    stream at an SMC-D link under KASAN on x86_64.  The analysis and this
    changelog were written with the assistance of a large language model
    and checked by hand against the tree; the reproducers in the earlier
    postings were produced by us.  The v4 change comes from addressing an
    AI-generated review of v3 on the list, and the locking and the two
    cursor helpers it described were each read in the tree first.

Link: https://lore.kernel.org/all/179552966151.3135.8162716126718648323@kernel.org/

 net/smc/smc_cdc.c | 47 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/net/smc/smc_cdc.c b/net/smc/smc_cdc.c
index 32d6d03df321..8f4351e1d4ad 100644
--- a/net/smc/smc_cdc.c
+++ b/net/smc/smc_cdc.c
@@ -333,6 +333,8 @@
 	union smc_host_cursor cons_old, prod_old;
 	struct smc_connection *conn = &smc->conn;
 	int diff_cons, diff_prod, diff_tx;
+	union smc_host_cursor fin, sent;
+	int unconfirmed;
 
 	smc_curs_copy(&prod_old, &conn->local_rx_ctrl.prod, conn);
 	smc_curs_copy(&cons_old, &conn->local_rx_ctrl.cons, conn);
@@ -358,16 +360,55 @@
 			/* Calculate consumed data and
 			 * increment free send buffer space.
 			 */
+			/* Snapshots, not the live cursors.  smc_curs_diff()
+			 * reads wrap and count with plain loads, and this runs
+			 * in a tasklet under bh_lock_sock() while
+			 * smc_tx_rdma_writes() advances tx_curs_sent under
+			 * conn->send_lock, so reading it in place can pair a
+			 * pre-wrap wrap with a post-wrap count.  Either the
+			 * difference collapses to zero and the credit is lost,
+			 * or it exceeds the buffer and the bound below does
+			 * nothing.  smc_tx_prepared_sends() takes the same
+			 * snapshots for the same reason.
+			 */
+			smc_curs_copy(&fin, &conn->tx_curs_fin, conn);
+			smc_curs_copy(&sent, &conn->tx_curs_sent, conn);
 			diff_tx = smc_curs_diff(conn->sndbuf_desc->len,
-						&conn->tx_curs_fin,
+						&fin,
 						&conn->local_rx_ctrl.cons);
+			/* This difference comes from the cursor the peer
+			 * reported, which is taken as it arrives.  The peer
+			 * can only have consumed what this side actually
+			 * sent - smc_tx_rdma_writes() advances tx_curs_sent
+			 * together with the producer cursor the peer sees -
+			 * so bound it by that and advance tx_curs_fin by the
+			 * bounded amount rather than assigning the reported
+			 * cursor.  The invariant below then holds by
+			 * construction, tx_curs_fin stays inside the send
+			 * buffer, and it stays at or behind tx_curs_sent:
+			 * bounding by sndbuf_desc->len - sndbuf_space would
+			 * also admit bytes that are only PREPARED, which
+			 * would move tx_curs_fin past tx_curs_sent and break
+			 * the fin <= sent <= prep order the three cursors are
+			 * documented with.
+			 */
+			unconfirmed = smc_curs_diff(conn->sndbuf_desc->len,
+						    &fin, &sent);
+			diff_tx = min_t(int, diff_tx, unconfirmed);
+
 			/* increase local sndbuf space and fin_curs */
 			smp_mb__before_atomic();
 			atomic_add(diff_tx, &conn->sndbuf_space);
 			/* guarantee 0 <= sndbuf_space <= sndbuf_desc->len */
 			smp_mb__after_atomic();
-			smc_curs_copy(&conn->tx_curs_fin,
-				      &conn->local_rx_ctrl.cons, conn);
+			/* Advance the snapshot and write it back as one
+			 * cursor.  smc_curs_add() sets count and then wrap
+			 * with plain stores, and transiently leaves
+			 * count >= sndbuf_desc->len, so in place it would
+			 * replace an atomic 64-bit update with a torn one.
+			 */
+			smc_curs_add(conn->sndbuf_desc->len, &fin, diff_tx);
+			smc_curs_copy(&conn->tx_curs_fin, &fin, conn);
 
 			smc_tx_sndbuf_nonfull(smc);
 		}
-- 
2.43.0

