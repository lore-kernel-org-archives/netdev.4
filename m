Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442028;
	b=knPZ3+haDxtd2/VC2Z1NOpXgLE6Beetoe85bgPe4zwQCm4zIUnM+NM/g6oWxIZAZXQU1
	 FYtis9YwkKh7JgTHevwgHvvHCkHrnOA5TWDUCmy19aDtq/BtAS18RSKKHVm5t1afjDgyk
	 rTSdx/cdp40ltGFP1AWg9PPl/cP8PMMOGzqlrMGn+n6ixRcX83jpHfZpnWLCsrVXHlTlH
	 H3prD8fyNiqjAKg1Y4FeQXR23+45NBiLiTTJpRueEeYBm9OBqlqJU1K8mwVhjhBOVK1wV
	 olRgIbmvAfbek0k7XIDaDUMHNwS31ZsI3pVsJcsjCkfwF9CsJUX/t1pw5p/T85kkUUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=con+4s5eqPAHcwSIYZ+D7+kd3aSyVqDuEASnC77AyI0=;
	b=eVqiYyXdBRwTXPPch8r2qRulh+GoTcMeGLSGds0Oz/0cjBL8uVMg0uEoXQk4J3lS6Yje
	 5qBfvVo+bpdoc2c/BMgERlmd5EXbIxZxrtjghPT5OOtHy0Z61s5+jIPrrCBqdet5tKHyq
	 Y7pHGp6wSpw8ORcSEG4f5CmlsuYPeCEQC2fTMwLj2rV9L632elJU4dXHE6NVzWc5BmG4F
	 njqPWaXQfu/VHo6ZeEBMf6pw0hWxNSIXUDWjEV9LwBaQNfSXj1cQpdocd8T1ABVDWbq3G
	 8qZO4GIO3aSG9VMFZ45jwsFAWhVnaH8AwPTNlEd8eQSjknA2Mtc0v98I/fRc5ijx2qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="E0tbBx/j";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F0E606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=E0tbBx/j
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1256852a12.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795442027; x=1796046827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=con+4s5eqPAHcwSIYZ+D7+kd3aSyVqDuEASnC77AyI0=;
        b=E0tbBx/j6F88fnWqPg4fVEojZS0kaVT3X/gsup2NQDZyymSxfVzKnj2s+dRGvF3zqH
         2JWIgow8bft334YEX5pI/ZmaDyO6DYyE95uzqqmQJ6odcPsG00nNIeIgaqv3FvPDapv4
         psxLgEEKuQT4WKRIRlmabHauPdGXaMZdG1gIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442027; x=1796046827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=con+4s5eqPAHcwSIYZ+D7+kd3aSyVqDuEASnC77AyI0=;
        b=2rve+slUqqNuqMdbN4yE78l16850duRdGcvKhu/ZVlMN+ht+Q5T2TNofR+doO5qsua
         VUrhpjXbDBmXCT3rdTv0wAqMmCCm226VMwbsQtfERsU7UIGYlATbBeB2YPliJmhAhWOD
         yGnH5QPDxTj5oVIX2FXeqokVn0eV5+fkqBF4jetE7PkMgjJG3nIrlP1oGrcfzojEqELl
         TCxs3B8KciIGqSBkWS4n++KmfYlmSCipd1bh6eY3d0Hk4tafIkUk7x1dztUNPrGkd6H/
         r/Qgpfe+Y+NRdJfXUIw5/rkCoYo+peiiGoj4AArvbZQdJz18e4C+qeJirfA5dpScyV1Q
         B4Fw==
X-Forwarded-Encrypted: i=1; AL+hErFNHWvPAPm2AByTriquzp8ij5/cHGb+FeBnIouTLrfvMYwlHemzfCNFqjj0qJdlEYc6XXVCi3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6g57rnfyaUZY9Rrs5ItY8VnwiWca29l5YxJhA+gp5O6ra8C8
	cXaFlnKoE13QQdFNI096dRi3k5f/AlWE1UPrg2fgLXKxE3NPRmYmgYMeeEnBcZhliR8=
X-Gm-Gg: AZFdTZeKIA9ZRwoeTyGybsEp3wHm8qOTF7FVX59kTQ/cJOXx8M28WxrwZokflcXyT7R
	8PQQz104osEJmtJ0EQsl9qnPTu686dgK/AzE5SH8cwv3fqgrOygMdU7steA7CGXT2iiEixGqAcx
	0Z9pHCbg90DyNIumY+uuRzNVYtdvTIBtkFqtu9QG3GLZIQ/ooAJT0F3jH2aBRQ3qNdDGqkKXI0r
	gueJh8gOzJQ9nAmqkx6iUKzVtDbYiaXoGrG5KgOUCw+G499GJfz2gmwjXy6mroHhC7BO7t0YlN/
	8p8ut49AUmFZRz6reVsaHJ8qWHL8wx5HkMlUfI4skLFMPJvD/c6+1wKMkcnL3Ggsq9UO6aUmGv+
	rn0H03BGUdwZuLSH6TuHYmFETgf+z9NA9PFKSOEjaZ75rPmw979zQeops0qkOevJ9cobluud18p
	6EUYAKVr0wK4bUde6PRNVD8nShGowlGkx4XjsWxCBzMl4XniS11Fb5zKz418g5D7+rl9LDG2tVx
	I59+B/mm6m3p9onpL1WKS4O5OqOGT9CqYoef18WAsGi+kN1FARWrGMWvGgD2dafqnMNRvXsHAVp
	ulJo98b4owL+o2VbcBY+twi1z1/LSEZKOQSwYkTDV230GNrKRa3S02MPWRwtbmGSRO2xrnR/rVR
	bIGbVODFv8n511ywrOXTk07yK+3dKF9U0O01fTzxVl7jQ42Ku1rbBLEymhlcPkKox
X-Received: by 2002:a05:6a21:511:b0:3f9:bcb9:30dc with SMTP id adf61e73a8af0-4014d14d4f5mr9922026637.38.1795442026980;
        Mon, 23 Nov 2026 05:53:46 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm5240220a12.15.2026.11.23.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:53:46 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: alibuda@linux.alibaba.com,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	netdev@vger.kernel.org
Cc: Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: Re: [PATCH net] net/smc: bound a send by the send buffer, not by the peer's credit
Date: Mon, 23 Nov 2026 19:23:40 +0530
Message-Id: <20261123135340.3953882-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179541361172.3135.1077986856171763823@kernel.org>
References: <179541361172.3135.1077986856171763823@kernel.org>
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

Thank you for the review.  Every point was checked against net.git main at
af6737b90668 before answering, and three of them changed the patch rather
than its description, so v2 is a two-patch series rather than a reworded
version of this one.  It is posted as a separate thread:

  [PATCH net v2 1/2] net/smc: bound the failover cursor catch-up by what is
                     outstanding
  [PATCH net v2 2/2] net/smc: bound the DMB-nocopy send-buffer credit as well

There is no cover letter; the v2 changelog is under the --- line of 1/2,
with a Link: back to this thread.

Point by point.


1. The threat model in this patch is wrong

> Is this threat model accurate for the path named here?
> With real ISM hardware this credit branch never runs. With loopback-ism,
> both ends are the same kernel, so in-kernel SMC code writes the consumer
> cursor, not a remote party.
> Would it be more accurate to describe the nocopy part as hardening?

You are right, and this is the part of the review I am most grateful for.
smc_ism_support_dmb_nocopy() needs a dibs device providing
support_mmapped_rdmb(), and the only provider in the tree is
drivers/dibs/dibs_loopback.c, where both ends of the connection are the same
kernel.  The subject of my bug report naming "SMC-D DMB-nocopy" as the attack
was therefore wrong.  In v2 that path is patch 2/2 and is described as
hardening.


2. smc_switch_cursor() is the writer a peer can actually reach

> Is the nocopy path the only place that credits sndbuf_space from a peer
> cursor? smc_switch_cursor() in net/smc/smc_core.c runs on SMC-R link
> failover [...] Nothing bounds diff from above.

No, it is not the only place, and smc_switch_cursor() is the one that matters.
diff comes from conn->local_rx_ctrl.cons, smc_cdc_cursor_to_host() rejects
only a cursor that moves backward inside one wrap, and the chain you name is
in the tree as described:

  smc_llc_rx_delete_link()
    smc_llc_process_cli_delete_link()      net/smc/smc_llc.c:1620
      smc_switch_conns()                   net/smc/smc_llc.c:1657
        smc_switch_cursor()                net/smc/smc_core.c:1053

That is patch 1/2 of v2, and it carries Cc: stable.

Being straight about the evidence: we have no multi-link SMC-R group with two
RDMA devices here, so this route is from reading the code, not from a run.
The overflow itself was reproduced through the other writer, on loopback-ism
with the consumer cursor forged by a debug patch.  If a link group that
reaches smc_switch_cursor() cannot in practice carry a forged cursor, I would
be glad to be told.


3. The clamp did not restore the invariant, so it is gone

> Does this clamp bound the send by the send buffer, as the subject says?
> Each memcpy_from_msg() now stays inside the buffer, but sndbuf_space itself
> is still uncapped.
> Would the credit need to be capped where it is added [...] Without that, the
> invariant isn't restored.

Agreed on all of it.  With copylen clamped and the credit still inflated, the
producer never reaches smc_tx_wait(), later writes can overwrite data that has
not been sent while sendmsg() reports success, smc_tx_prepared_sends() and
to_send in smc_tx_rdma_writes() misreport pending data, and SIOCOUTQ returns a
negative queue length.

v2 bounds the credit at both sites where it is added and does not touch
smc_tx.c at all.  The bound is what this side has outstanding,
sndbuf_desc->len minus the current sndbuf_space: a peer cannot have consumed
more than that, so it is a no-op for a correct peer rather than a cap chosen
by guesswork.  With it, 0 <= sndbuf_space <= sndbuf_desc->len holds again, so
the two comments you noted as becoming false are true once more and need no
change.


4. smc_curs_add() subtracting the size only once

> smc_curs_add() subtracts the size only once. For a large enough diff, could
> tx_curs_sent.count therefore stay at or above sndbuf_desc->len?

It could, and smc_tx_rdma_writes() then uses that count as a source offset -
a second fault, which the clamp in this patch did nothing about.  Bounding the
difference fixes it as well: value < sndbuf_desc->len always, so one
subtraction is enough.  Patch 1/2 says so in its commit message.

In 2/2 the related assignment

	smc_curs_copy(&conn->tx_curs_fin, &conn->local_rx_ctrl.cons, conn);

is replaced by advancing tx_curs_fin by the bounded difference, so a reported
cursor is never installed as a send-buffer cursor.  For a cursor that reflects
real consumption the two are the same value.


5. Fixes: tags and Cc: stable

> Should this carry Fixes: tags and Cc: stable?

Yes.  Both are in v2, each confirmed by blaming the atomic_add() in question:

  1/2  Fixes: c6f02ebeea3a ("net/smc: switch connections to alternate link")
  2/2  Fixes: cc0ab806fc52 ("net/smc: adapt cursor update when sndbuf and peer
       DMB are merged")

Cc: stable is on 1/2 only.  2/2 is unreachable on any device in the tree, so
by stable-kernel-rules it is not a bug that bothers anyone; say the word if you
would rather have it there too.


6. The receive side

> This isn't a bug introduced by this patch, but the receive side appears to
> have the same unclamped second chunk. [...] The commit message points to
> "net/smc: validate the peer's CDC cursors against our own buffers" for the
> receive side. That validation isn't in this tree.

Correct, and my commit message implied it was applied, which it is not - it is
a separate patch posted on its own.  The two are independent and either can go
in first.  Worth being precise about why both are needed: that patch bounds the
peer's cons by conn->peer_rmbe_size, which keeps the cursor inside the peer's
RMBE but still permits "I consumed more than you sent", so it does not bound
the credit this series bounds; and this series does nothing for the receive
path.

Found by AI-driven fuzzing built on top of syzkaller, with the analysis checked
by hand against the code; the v2 cover letter says which parts were reproduced
and which were only read.

Thanks again - points 3 and 4 changed the shape of the fix, not just its
wording.

Kapil Vaswani
Piyus Kedia
