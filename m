Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543399;
	b=MjMUnKPN5SMR0HuNS4fOsto1eY2AnZcPWEbHzHoWxlS7NyL0XWPUi2w8g3ySmik1X9za
	 WA/TYMxcLkLDg2CECw5pg16SKh7G93m5s5pkKGc9fBvAPcE36liNATLBhPmNVaNPx3KBZ
	 Je1lv0uUQZpYCHoaCWAo1arA/CUhskay9pj5wadTFbqjf29J7HRjXUHvfu+WhdlirFucK
	 dEziNdRvIMdIjSUIKQCdjY2CjBTI7IUJhj9r8RpblrfTHMOMO8g7fqbOcaZEKszCuMnfc
	 J/7QpS4Wp1NmNw8DM9iJM1lNCIpNR7C0XuOylYSsHdYBAUJwyeuGMMV//AX7jIEoUag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fp+A2IBIJBhlc95VqLzwi8xXI2svbhFRA1unILMyFZE=;
	b=Px/uRtX6LrmF6q16SD5Ueqb6YVQF99LMF1ESxzsI0QE6gVoCb4JKWzDJSj2pRtX9aCJ3
	 uBR0GgunVZG1/TsskZ8t8zyXDNFuQue5gjO9aOZIuYGbx8kWmaDAY3t7qCV8ybB8FyY76
	 UBlctJxXlEuuQwr0+627jq5a60mZ5llNZHWqljEEixGnttEknNUCFnyRYQa5VdoFqULay
	 mZAxMelvVMiVoMHXOy0Lr+pSi8b9s0V4/tVeVkCMlIutWDtOqo9/0YnfK2Ut9rTam2S1E
	 6qsxKSW0kh0dh1skC0fJoYVSN/GUtIgSmeokSgHbDgqAaHLkL8RYs9di/rOyKRNp33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=dz9t0zlm;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD36606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD36606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=dz9t0zlm
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04e3bf46dso34358755ad.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795543392; x=1796148192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fp+A2IBIJBhlc95VqLzwi8xXI2svbhFRA1unILMyFZE=;
        b=dz9t0zlmm8R2fkO7mnxJ3INo/OsP6/g1LMXAS2NmXszuoqB5yL09fiBO9x907+5kac
         /bHB+8+X/mTELSy4Jo5xKmd2yaCvrEIPNCc8H0h1vvR9qkxwOOqoLCH1zl3lyQ2UyzLg
         /ABrNBByraMRdUHgcdov2HegrLy81ZaSVPj1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543392; x=1796148192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fp+A2IBIJBhlc95VqLzwi8xXI2svbhFRA1unILMyFZE=;
        b=cIftFiYZtxYSuXWhsxSKQvneZL48SzhncxQdMPsfbZlIQnk5TJ/VuPv3xoq/TZt0Qn
         k8APODsS6UGvypY4CvHYDbDPUvcI3o2dcM15u61r/MaRKMOayl6CfeGdk3lNDlNXEyHt
         /sQbxw5JjwS49XiTUHA5/lh2TuT+PcL9a/+zfrcD05gV4f9OFQWhBv5+oIVroTbOPZio
         PqYBYVy10bCTlbohK0aa1Fdr4fJPCKvYXj8LslMsuujhR1MzvlC2/pxrrddGFmIr13US
         w/IfgTTWzf8tWrWbGkspEA2KRJx5ig0LTJP4rGj4XeyWYQmWE3rxsTg56PpJTjL7G68V
         yjQA==
X-Gm-Message-State: APuU4Z+yVJ2lFKYDZpFK8p+o1yo7owwxfwkCylF5yvkcYHquruI9KZ8w
	hvMqbjtoUGgPrfmQs2K3Uf6oxbJDkaNuuNLEphUYsl30okBay4KN0W7RJ/I8gf1Uj7U=
X-Gm-Gg: AZFdTZeW9Hht/vRZqzO9eNUvnACX3i5vmMbAzBuA/kI8mMlMevLdvpkaCz2SoocZnrA
	/K0lVZTnZF0FylypdxNGOHTHlZFb8hi8FmGzJg9Y7Z/crLCOrsK2BHJCvbvi6iU5HQKt1EP+5QU
	vOr9Ryu+3GStUIusaOHqD8SqTffs2Um6YiHbwcFcW8EkVgYfF2OUtZ68+CICV8M1WNkwvufYpJh
	CYfk24tJBIFJQnOsISDPuQTXK8VVI0ejfBx2J5bWZCZTzh2v8DApV+EUs6cnHT2Rj92Fl8ewBt8
	VJFWpic0deVzW5QWbcpwk6+kBC9Pe4mJ/CsliRMaGpec13poA8ZmN2azRXMmmSDlmPUnO3ee6pd
	OOj4SvOJos5t9+ZWWA4Q+DgMQf4Ws+/EpCwe/NE6TGD7sUiZH3WSWqfYfyVe0FG6dU04fBMWNdL
	LHvDcuOaKZoTxWFmcdGOCAqV8Uh3DJGR9M/6vcipd4IQ16EfYZraVJYCbt8K1CmL14TZOy/SDNT
	4nVtILAkn0ncEFtl5iBN1pnVlaN4ubBj0psFgBq4DNjlcE3pWFlpl/9oR4C0yLM4h8r7vat2Ow2
	iPhHZjNJF+luRMXB9pPQQfkUZSHSJvoTODqFL93yNrX4bLd6wJr7qLs3M5ns0sgEGXvB6pQCev4
	qYwT2wDfb7/s/H65g0XTqgioAhhDiciA3O1t4vMD3wuBKa93QCG8jdVH82OPaUdkq
X-Received: by 2002:a17:902:e847:b0:2ed:3d74:b640 with SMTP id d9443c01a7336-2f03f26b691mr143912525ad.59.1795543392125;
        Tue, 24 Nov 2026 10:03:12 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm70508185ad.33.2026.11.24.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:03:11 -0800 (PST)
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
Subject: Re: [PATCH net v2 2/2] net/smc: bound the DMB-nocopy send-buffer credit as well
Date: Tue, 24 Nov 2026 23:33:05 +0530
Message-Id: <20261124180305.622194-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179552966151.3135.8162716126718648323@kernel.org>
References: <179552966151.3135.8162716126718648323@kernel.org>
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

Thank you - both of these were worth the mail.  The first changed the patch:
the bound is now the one you suggest.  The second is pre-existing, as you
say, and I have answered its two questions below rather than fold an
unrelated counter into this one.

v3 of this patch is posted as a separate thread:

  [PATCH net v3] net/smc: bound the DMB-nocopy send-buffer credit by what
                 was sent

Each patch of the v2 series drew its own review, so each is respun in its own
thread; the other one is answered where it was reviewed.  The v3 changelog is
under the --- line with a Link: back to the v2 posting.


1. Is len - sndbuf_space the right bound here?

> The peer can only consume up to the producer cursor it was given.
> smc_tx_rdma_writes() advances that cursor together with tx_curs_sent. A
> consumer cursor that claims more than tx_curs_sent is therefore clamped
> only to prep - fin. The smc_curs_add() above can then move tx_curs_fin
> past tx_curs_sent.
> Would that break the fin <= sent <= prep ordering implied by the
> tx_curs_sent ("sent data") and tx_curs_fin ("confirmed by peer") field
> comments in smc.h?

It is not the right bound, and yes it would.  The ordering is what those
comments say:

	union smc_host_cursor	tx_curs_prep;	/* tx - prepared data */
	union smc_host_cursor	tx_curs_sent;	/* tx - sent data */
	union smc_host_cursor	tx_curs_fin;	/* tx - confirmed by peer */

and nothing else in this branch moves tx_curs_sent, so the clamp was the only
thing standing between a forged cursor and fin > sent.  Your consequence
follows too: once fin is past sent, a later smc_tx_sendmsg() can wrap out of
tx_curs_prep into [tx_curs_sent, tx_curs_prep) and overwrite data that has
been queued but not yet advertised - on this path, in the peer's DMB.

v3 uses the bound you give:

	unconfirmed = smc_curs_diff(conn->sndbuf_desc->len,
				    &conn->tx_curs_fin, &conn->tx_curs_sent);
	diff_tx = min_t(int, diff_tx, unconfirmed);

The honest-peer case is unchanged: a cursor that reflects real consumption
cannot be past the producer cursor the peer was given, so it is at most
tx_curs_sent and the bound does not bind.  smc_curs_diff() already returns 0
rather than a negative value, so the max_t() that guarded the subtraction is
gone with it.  The variable is no longer called "sent", and neither the
comment nor the commit message says "outstanding" any more - as you note,
that described a tighter bound than the code computed.

Your reading of smc_switch_cursor() is right as well: it rewinds tx_curs_sent
to tx_curs_fin and then advances both, so the order holds there even with the
longer distance.  That patch has a review of its own and v3 of it stops
clamping altogether - a cursor that claims more than was prepared is treated
as a protocol violation and the connection is dropped - so the two patches no
longer share a formula.


2. peer_rmbe_space is credited with no bound (pre-existing)

> With a forged cursor, can peer_rmbe_space exceed peer_rmbe_size here?
> That would make the comment false.

Yes.  diff_cons is bounded only by peer_rmbe_size, since that is the size
passed to smc_curs_diff(); the atomic_add() applies no clamp, and the only
thing that lowers peer_rmbe_space is smc_tx_rdma_writes() as it writes.  So a
cursor that reports consumption this side never produced raises it without
limit, and the "guarantee 0 <= peer_rmbe_space <= peer_rmbe_size" above it is
not a guarantee.  It runs for every SMC-R and SMC-D connection, as you say,
not only the nocopy ones.

> Would an inflated peer_rmbe_space mean the urgent data sender is never
> woken through that path?

Through that path, yes.  The wake-up tests equality:

	if (diff_cons && conn->urg_tx_pend &&
	    atomic_read(&conn->peer_rmbe_space) == conn->peer_rmbe_size) {

so while the counter sits above peer_rmbe_size the test cannot become true
and urg_tx_pend stays set.  I have not traced whether another route clears it
in practice, so I would not claim more than that the condition here can no
longer be met.

And your point that the two counters can now disagree is fair: after this
patch sndbuf_space and tx_curs_fin are bounded while peer_rmbe_space still
takes the full diff_cons, and the comment above the nocopy branch does speak
of both being updated because "peer has already consumed the data".

I have left it out of this patch rather than fixed it quietly.  It is a
different counter with a different Fixes: tag, it is not confined to the
loopback-only branch this patch is about, and the natural bound is a
different quantity - the distance from cons_old to the producer cursor the
peer has actually been given, rather than anything derived from the send
buffer.  Getting that wrong would stall flow control on every connection, and
we have no SMC-R setup here to exercise it on; the route to this patch's
branch is loopback-ism, which is why this one is hardening rather than a fix.
So I would rather post it on its own, or leave it to the SMC maintainers if
they would prefer to take it.  Either way it should not be lost - it is the
same class of bug on a path that every connection uses.
