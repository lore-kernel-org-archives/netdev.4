Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541476;
	b=p2hEmeOiCVVpq17bzAIvYyT7E1nDpVV2UL58P2hoQVb8SKAbSENmmSKcAD20I+7QLc5B
	 9zWDMgUDuEuVWOjh9ghaGhSfYvYex80pRKqQMuBIq09PEUM6GKsFtJAMEMjEF0Een4cVX
	 FjR9fjSqIda4W/ZojnEadSK6uZzhrrQSN14XmMjh/jXs6+QDMjh07rsP7DZW7CaJpnWbE
	 hh3TRSX13Y1tMXdU5/yoJ84VyjAk6iYG8HoHZJHVrKAzHcnWTBG7GvgleN3fkU02/iM+x
	 vGry89Vc7X4PTxd/wiCUybNFOLY2xTbNohCGABYH9dAlhN7NnUJJWosgtJVebmev/pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xVtmIflReLy/gkCKLxUSoKRO9sGvrYDFgb1ifl0wJKQ=;
	b=pq6G6dB/4fYdBlTpeQRHzP1Cu9EVwBSGTm8kmn2AWKjEXQ4mNlroooi58AtyjN7ytr8a
	 IydebfbYGP6pCxJzLmrPn9XcXkI2FWoJVR8+HuQfh9i1r0MG+HazHZyaI9WyMPvNGhwis
	 pDKQSOCOQG4jGFuTcAOIk9yCuwpayZcHF9ajtOZJrxxvuTOO8q/XszJK2HjfSUlso7wEb
	 0NIPhpK4QL3lVcXpgC0/kJF+J9GguVuZcfiIWZ1JE61fRl3mAqe6UwqRRaqNhVVntsyWf
	 gBy2zMdATH9hWRjwVDxXF4NyPRnvZFHDmMYE5jFwzzjSN7mClcT74jAafPGItlvK2Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jZg2tuDA;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9667E606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9667E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jZg2tuDA
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2956701b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795541460; x=1796146260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVtmIflReLy/gkCKLxUSoKRO9sGvrYDFgb1ifl0wJKQ=;
        b=jZg2tuDAsbL1GQYiCmf+mug2LJyrBbSesSduO+aoMC1LTEXvytDDT92LNysScbRUIJ
         Gf6A7xebjzFe/XDX247TbTmV3OGHcSGwyrvrB+LMF8dNWh45g06ioi408pjgSnopSI+w
         YnhTqckafu1y7Cz3fVUN3cfJI4gDFkDqgzdXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541460; x=1796146260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVtmIflReLy/gkCKLxUSoKRO9sGvrYDFgb1ifl0wJKQ=;
        b=0gcI5Sax4KRalfYO4pfMkiVElWmaaRj7nOdaebqffGgWjhNgJUjDrkr52dtED/RY+C
         NvI6EjV1dRggpLcO1j89lB1910GuAfzmEw/2VTKXTlJ/Bo44UgneAiAOJATLCpUmil5n
         VE5819JqZ3CIU/VtMj6y4ZEA/VZo2q4JZBGPNno1m/g2A4D0u3e6ThCMWW+DOJeLyvSY
         AuU2FliZiLkNujse15LWi1P1CH5NmMX1IpqqplS3K8pfAfejdbQ1JOBTxejEVzS+bvni
         razsS6SzwncScvRIIpV8j924n+9OUhyr5oTMgBVLkXaIoT3D1Tmh1GzMhksT4NglqsRh
         v7Jg==
X-Gm-Message-State: APuU4Z9kz1DktrhQIXKjCLDtH4XPe/Trh0l2QTod9mkYYe+u30XxK55Q
	d6ybsu1YBaXxe252h8PKiaynyAqHXay5RYnUD/TVmNm++cW45QeQKBh26VTB4IA98QM=
X-Gm-Gg: AZFdTZeBwRgoVgmjXBeReqYldFqsuHhce1GG5JIlJRMUJ8p+zNLfzTOmSS1yq23UJhM
	/CENXrIEy2OCari7KwieKsMoQhHcYM2mV6T1InyFWTImiwjansHbivHvjraLCK9/t7iNy9ZOxJS
	VEAbbu+sXKixt5Mf604foq9DoO+tKV7B+gEb0auuZGneJ4SrKIZGRNlYOTAHeKWUsnY8NhOCD5C
	HglHxgD7wBjGsM4/JX8c3DLR+MaclzR9DLTvrpbqHo9UUw0RDaJz5N2p4V9CveTYONYSkf0CLDR
	bcDpCpxsCv7Nhm1rByfIuAjHqM3tfEOV5FvJVQ/31X50aSUHCP1j+QJJ6pWLS+ADLsLoiTq9AkG
	enXUUXk4F8+b6+u8QNvK4d22Z5KWHstl8thyKXcSZrhGrw2STaMp+wYzF41kG8Ms93S66Zb1ivN
	IH0+gwkuzEEyxeXxbgAXgEAhB8jbIYVNLbqP+FrlG1R9YoA5VVsv4tbTScW/FeG/HX9a3Sd9sg8
	0KZIsuRZ+21OOA0YgFGV5n59DkDaTxHOst1rGvehatiXrNFbLVtGxTvmxIwDEcR3Mzd7B2wcS4M
	v1g194PAJIO4NQK84Lam4Ucp4RBzfcQmJdNerhgDfEN2Auz0jcrOYgc9a7SrQjFjEE2dWhYbnr0
	AHzsgzYBX8hN891IRFkEAm44b9L3l0poqALk8hULWWG+VXj1fApG7LGBvnXUfUBnT
X-Received: by 2002:a05:6a20:170a:b0:401:e4c3:7fbe with SMTP id adf61e73a8af0-401e4c38036mr7387644637.32.1795541459865;
        Tue, 24 Nov 2026 09:30:59 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm7779374b3a.4.2026.11.24.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:30:59 -0800 (PST)
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
Subject: Re: [PATCH net v2 1/2] net/smc: bound the failover cursor catch-up by what is outstanding
Date: Tue, 24 Nov 2026 23:00:52 +0530
Message-Id: <20261124173052.592080-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179552965941.3135.8878591105354373466@kernel.org>
References: <179552965941.3135.8878591105354373466@kernel.org>
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

Thank you for the review.  All three points were checked against net.git at
af6737b90668 before answering, and two of them changed the patch rather than
its wording: the clamp is gone, and v3 drops the connection instead.  The
third is real but is a pre-existing bug independent of this patch, and I
would rather not fix it blind alongside it - details below.

v3 of this patch is posted as a separate thread:

  [PATCH net v3] net/smc: drop the connection when the peer's failover
                 cursor is impossible

Only this patch is respun; 2/2 of the v2 series is unchanged and is being
answered separately.  The v3 changelog is under the --- line with a Link:
back to the v2 posting.

Point by point.


1. [High] Old-link CDC completions racing the switch

> Does this bound keep sndbuf_space <= sndbuf_desc->len on the DELETE_LINK
> path, given that the old link's CDC completions can still run?
> Do the old link's TX completions also need to be quiesced or serialized
> with the switch?

No, it does not, and yes, they do.  The locking is exactly as you describe:

  smc_switch_conns()
    spin_lock_bh(&conn->send_lock);
      smc_switch_cursor()
        atomic_add(diff, &conn->sndbuf_space);
        smc_curs_add(len, &conn->tx_curs_fin, diff);

  smc_cdc_tx_handler()
    bh_lock_sock(&smc->sk);
      atomic_add(diff, &conn->sndbuf_space);
      smc_curs_copy(&conn->tx_curs_fin, &cdcpend->cursor, conn);

Two writers of sndbuf_space and of tx_curs_fin, under two different locks,
with no lock in common.  That is true before this patch as well: the
unpatched smc_switch_cursor() performs the same atomic_add() and the same
tx_curs_fin advance under send_lock alone.  The late-completion arithmetic
you give - (len - prep.count) + C.count exceeding len when the wraps differ -
is likewise reachable without the patch, since the unpatched code moves
tx_curs_fin by an unbounded diff and so can place it at or beyond prep.  So
this is a second bug on the same path, not a consequence of the change.

What this patch is for is the route that needs no race at all: a forged
cons on an otherwise quiet connection inflates the credit deterministically.
v3 closes that by dropping the connection rather than crediting anything.

On the race itself, the shape of the fix looks like the drain, not a new
lock: smc_cdc_wait_pend_tx_wr(conn) in smc_switch_conns() before the
send_lock is taken, in the region whose comment already says it may sleep
("pre-fetch buffer outside of send_lock, might sleep").  I have not put it
in this series for two reasons.

  - It is a different bug with a different Fixes: tag and a different
    trigger - it needs a completion to land in the window, not a hostile
    cursor - and netdev asks for one logical change per patch.

  - I cannot test it, and I think it may be wrong as stated.
    smc_cdc_wait_pend_tx_wr() waits for conn->cdc_pend_tx_wr to reach zero.
    On the smcr_link_down() path into smc_switch_conns() the old QP may
    already be dead, and those completions arrive only once the QP is moved
    to error and flushed in smcr_link_clear(), which happens after the
    switch.  A drain there would then stall on exactly the path it is meant
    to protect.  Ignoring completions whose cursor is behind tx_curs_fin,
    your second suggestion, has no such problem, but it changes the meaning
    of a counter three call sites rely on.

We have no multi-link SMC-R group with two RDMA devices here - the route to
smc_switch_cursor() in this patch comes from reading the code, as the commit
message says - so I would be shipping an untested locking change bundled
with a memory-safety fix.  I am happy to post it separately if the drain is
the right shape, or to leave it to the SMC maintainers, who can exercise
failover.  Either way it should be recorded; it is a real hole.


2. [Low] "sent" is the wrong name for sndbuf_desc->len - sndbuf_space

> Is sent the right name for this value?  Does "what this side has
> outstanding" in the comment describe it accurately?

It is not, and it does not.  The value is tx_curs_prep - tx_curs_fin -
prepared and not yet confirmed - because smc_tx_sendmsg() lowers
sndbuf_space when data is copied in, not when it is RDMA-written.  v3 names
it unconfirmed and says so:

  /* ... It cannot honestly exceed what this side has prepared and not yet
   * had confirmed, which is sndbuf_desc->len - sndbuf_space:
   * smc_tx_sendmsg() lowers sndbuf_space as data is copied in, and
   * smc_cdc_tx_handler() raises it again as the peer confirms. ... */

The subject and the commit message no longer claim to bound the catch-up by
"what is outstanding" either.

Your related observation is also right and is why v3 stops trying to repair
the state: smc_switch_cursor() opens with

	smc_curs_copy(&conn->tx_curs_sent, &conn->tx_curs_fin, conn);

so the pre-switch send position is already gone by the time the check runs.
There is nothing reliable left to rebuild a correct cursor from, which makes
"carry on with a smaller number" the wrong answer in principle.  And you are
right that the clamp hid the violation: out_of_sync stayed 0 and the
connection was not aborted.  v3 sets out_of_sync and peer_conn_abort and
queues abort_work, as smc_cdc_msg_validate() does for a sequence number
that cannot be honest.


3. [Low] Where local_tx_ctrl.prod ends up when the clamp fires

> Should the clamp firing be treated as a protocol violation that aborts the
> connection, rather than continuing with inconsistent flow-control state?

Yes.  This is the point that replaced the patch, and the arithmetic holds as
you give it.  With diff clamped, prod = fin + clamped_diff stays behind cons,
which is the inversion the "now prod is smaller than cons. Fix that." comment
exists to repair.  smc_write_space() then computes

	space = peer_rmbe_size - smc_curs_diff(peer_rmbe_size, &cons, &prod);

over that inverted pair.  Equal wraps give 0, so space becomes the whole
buffer - wrong, but harmless.  cons.wrap == prod.wrap + 1 gives
(size - cons.count) + prod.count: for size 100, prod (0,90) and cons (1,10),
space = 100 - 180 = -80.  smc_tx_rdma_writes() returns early on

	if (rmbespace <= 0) {

for every later call, and smc_cdc_msg_recv_action() only adds diff_cons on
top of that base, so it never recovers.  The clamp traded an out-of-bounds
write for a connection that is memory-safe and permanently mute.

v3 therefore drops the connection and leaves every cursor alone.  There is
no partially-advanced state to be inconsistent, nothing to name wrongly, and
for a correct peer the branch is not reached at all.


Thanks again - two of these were defects in the patch, and the third is a
bug in the path that was there before it.

pw-bot: cr
