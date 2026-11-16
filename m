Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853279;
	b=OD/5n0YmrAq46Uovap/b3+eXAdJvMwL4JHMWbde33tnY9oeFVmJXs204GWMIDECVj0F4
	 qr+F1RxkdToUN7ZbkV8g3w3GTYBWsbCYTjS78SOHgleYPTYp18iqJRoq9CWGCryKG6pIo
	 4SinjYnq0HaDylEqyTmgrpHYDiUzmBdRva+ngcsr516v2LpJXhfN9QvulkByEb4nvOrTK
	 efCjYy4qFFItxHGQwDpRy3ZsCy12+hQXfSTifOLh9RSrX5DNXcyYxG1aA6iUtyxRlbBUK
	 +Z/nDB/S9VGU777ttpWf6GzWXg0ory6QQKPXBFQUPi+wZ88cnqP4Zj8JTHTrk6G0gxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WLbvZZUrSw5V3WK97DepXaH190SbFLxLhAaVVJSONIc=;
	b=hlcimxZGMwGu2uBLJqsTRlK6fyC1GkPMI6skVm3IlUKU0d/vZTvtt1c3mJmTOMiT8IF6
	 sJG9f9JnxtjCr+jsOcLcUcEF7EKUWkuQbdVN2KGbD2Ho6AbkMqT+Cf1Crux7NelX0LHWu
	 QLpBr+/IZmZg8RGyaDMTdAbtsmdMxRsOWkTbxXCcRx2KSfyk2SLh295ziarRNGqGq/pNq
	 GxFVr0zGFGF72EMwkHvK3t63MuBqgEh44Tt3DiwOCFLUaqwPmsvv8ULqFPLpwtaLYLedT
	 OCtQVAxPeiVzlYqE3pQbPcXe1fQ7WiE8f6n+SIjXEu/FTlYUMPdIu2e2qonza5spGQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cOyjGNXD;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA07606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA07606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=cOyjGNXD
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1557090a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794853278; x=1795458078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLbvZZUrSw5V3WK97DepXaH190SbFLxLhAaVVJSONIc=;
        b=cOyjGNXDLvqhDwt91E88cBd0axkpasya+Ob+OHfe5h39cjLZJ4zGpsY7vx1ZUURo1r
         Ii4etqcM2pfsQzYCgWGhfa1BalVu2jk4Qy7XMre8BYtwhjIYPx7CpvfsLUgJTFJU4rgF
         7x7ROfBVWpaALa2PG31G3YKQohwmdZZFz+tWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853278; x=1795458078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLbvZZUrSw5V3WK97DepXaH190SbFLxLhAaVVJSONIc=;
        b=gBRMlv8uz/NPudVKjIPIvyOUGL48JetQGMOV8fqsBvzJYEpMoz2O5JQcDQQESXBaSt
         HU2NnnUdxrkn4UqwFtGW83BcA+O0S29tbJfW3rJ01tLM08isIXN/XInZwQlu9CiR3KVj
         aJoleeEOSDb00EtTZCjWKDq9SxlbbTHv6rjyLbi/xMfcFuJtHxP3YpKhHZCmNEgCI/Zl
         TuwDkTbaNznwMV0v8+koXPgB4whOelbG2xtPD8HUlekbNQiJKl0GmJbLKbLwHFTU722+
         xh075rQmBV5Lw3lmaPYCnkpMBmylijyWPmwrOuWBhBMmUY6V/H7EijrjFZV5nBiobG6w
         ecmQ==
X-Forwarded-Encrypted: i=1; AL+hErEuu5qpJZChvcwSNFGZkxp1RIOPHHMjRSdGo5iWyp9qYycfeuO/ENkNyxHPml3TlbgsCvFgoVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8asSrnG1w2gBrAcBECeCjOmRAf1iMJNbD0AVBVnfBsqZl0L3j2
	+qHgzbY3lAabeorZ/MG5E9QeSpX/pf0NWuSHd2J6lk/fR980YuXkFtIccclM65qrijE=
X-Gm-Gg: AZFdTZcFyfLSg0130RpbkIKR4g7SYB+WsU0e4JEQtS7FYU1okHRllmS+hM262UINteN
	sa6MohIjEMT6MX3IgUc3ypE0zTYPfgjimSQwEJLYmaxIncAtP1vcrSVbD5bAWptLbq3qIFHI6hj
	4ViVkoXAKwi3lYofh21sc6B9fyOgPBS94MM8titvP8dJfy+iJ+3NPVOhuTq8ZWzN6GQIot/B29g
	NP4LLxRGgiFjc8ixS16LLIRNtBK8K+KQ4zNNubwFjkQ+WWLIEJb4QKMpzzhWr5FHy6fhAob7NqQ
	NxyT71LrEW6MUCzd2d39HliiQvvlKNY93xxO+9qV4oZZGT56n2axT0Tp3wJbQUv+OQZ6XL+tzNe
	nBF0g05gmj8gu4CRZ/P4G2nha5B6hWQ1Q/aNPGfIfymXJgXCgwIx/80Hvu9N98HY0chyz0LtLnR
	Jj4IwWCKSDpLOJdnwV0oNoqVVfo8Dgah2cM1U4KROncv0DHvA14zoFgYMcURL3PaAqchVOUUXtT
	S155vSLp3WclrEq2ZLdjH7w4oKRAxike/mgzVeXlYDt4YMoWm/W5xzqSMp2CD5H3VY/IxjlXZcp
	JM927VM/UeUivoMPvYTYW4Chc9ueUitu+XJrXy8qwzmgLpMJD4jnE0JZPyiw67tXyY0xoq4669G
	v24tAsITDE2ZFG5gMcCl27eRxfIQ94/DUlyOCZEkfGCBL3+xHQp0OkKqZ6z8H4skJ
X-Received: by 2002:a17:90a:e710:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3b1b0a428b8mr9583988a91.27.1794853277539;
        Mon, 16 Nov 2026 10:21:17 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm312798a91.10.2026.11.16.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:21:15 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: Re: [PATCH net] net/sched: act_csum: bound the IPv6 jumbo payload length
Date: Mon, 16 Nov 2026 23:51:07 +0530
Message-Id: <20261116182108.2581258-1-piyus@iiitd.ac.in>
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

> Could the changelog say that TCP and ICMP csum configurations (for
> example "action csum tcp") were also exposed to a bounded over-read? As
> written, it reads as if only TCA_CSUM_UPDATE_FLAG_UDPLITE setups were
> affected.

You are right.  v2 follows this mail with the changelog corrected.  v1
claimed those handlers were "protected by accident" because csum_partial()
takes an int; that is true only of the kernel it was tested on, and I
should have checked why.

The reason is worth putting in the changelog, because it is also why a
KASAN fuzzer cannot find those three paths.  On x86 there are two
implementations of csum_partial() and the configuration chooses between
them:

  arch/x86/Kconfig
	config GENERIC_CSUM
		bool
		default y if KMSAN || KASAN

  arch/x86/lib/Makefile
	ifneq ($(CONFIG_GENERIC_CSUM),y)
	        lib-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
	endif

  lib/Makefile
	obj-$(CONFIG_GENERIC_CSUM) += checksum.o

So a kernel with KASAN gets lib/checksum.c, whose do_csum() opens with

	if (len <= 0)
		goto out;

and a negative length reads nothing.  A kernel without KASAN - which is
to say a production kernel - gets arch/x86/lib/csum-partial_64.c, which
has no such test and dispatches like this:

	if (likely(len >= 80)) { ... }   /* signed, false when negative */
	if (len >= 40) { ... }           /* signed, false */
	if (len & 32) { ... }            /* bitwise, runs */
	if (len & 16) { ... }
	if (len & 8)  { ... }
	if (len & 7)  { ... }

The first two tests are signed comparisons and the last four are bitwise,
so a negative length reads whatever its low six bits say, up to
32+16+8+7 = 63 bytes.  Your example confirms it exactly: len = -70 is
0xFFFFFFBA, low byte 1011 1010, so the 32, 16, 8 and 2 blocks run and 58
bytes are summed from the transport header.

That is why the KASAN report in the changelog names lib/checksum.c:119
rather than the x86_64 file, and why only the UDP-Lite arm showed up: on
the kernel that found this, the other three paths genuinely did read
nothing, because enabling the sanitiser had replaced the implementation
that would have over-read.  The over-read on tcf_csum_ipv6_tcp(),
tcf_csum_ipv6_icmp() and the ul == 0 arm of tcf_csum_ipv6_udp() is real,
it is bounded at 63 bytes rather than 65535, and it is invisible to the
tool that would normally catch it.

This is a new posting rather than a reply in the old thread, so here is
the context.  v1 and the review being answered:

  https://lore.kernel.org/r/20261112075445.3555341-1-piyus@iiitd.ac.in

and the [BUG] report, with the original KASAN trace and the reproduction
conditions, which went out as its own thread - not threaded with v1, which
is my fault:

  https://lore.kernel.org/r/20261112075159.3552470-1-piyus@iiitd.ac.in

I checked your arithmetic and the three call sites before writing this,
on net-next: act_csum.c:245, :196 and :343 respectively, each reached
with the negative value behind only the wrapping pskb_may_pull() in
tcf_csum_skb_nextlayer().

The code change is unchanged in v2 - as you say, bounding *pl in
tcf_csum_ipv6_hopopts() closes all four paths, so the diff is byte-for-byte
the same.  Only the changelog grows: it now says that TCP, ICMP and the
ul == 0 UDP-Lite arm were exposed to a bounded over-read of up to 63 bytes
on kernels without KASAN, and that the 65535-byte read is the UDP-Lite case
specifically.

Thank you for the review - the KASAN-swaps-the-implementation part is
something I would not have gone looking for.
