Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380067;
	b=PsJ1h1UlN1yeYN8/RI9DobcSspqeP3/CA2wyLKKil87WvinICxOQHUBY1V2GXuK5BFlK
	 mvi0WMLsn8+g6cQuMOBzCIx0dehcPO3z/dGKQPQqu4nopWGvNsaQ/tOZfc7SiZQ6cjmcw
	 F/FU9PR38vGOGUKE7LR3B9wvXiGipcePJjq/7ajYHtVcXJMzmecWfbh8JKGFm1JwjYIBf
	 RC0YMLFSUbqltw8jwT+fHaaV+pQmOQZNxG0M1NMOnDQXH8+cdAD8MPvQG3JeaRKs4EBC8
	 JycLfqEXjl5oa1Cr/JjwrOIS+SryNTb8CUjQIswUgsyglgy9kLB3b5u36JyAM6e3fDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380067;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3lCoGfeSw+foOIoqggOyah4gEvrKCtbgBNEH4Ru9Kgo=;
	b=X7hbCFh5rT/B3JEXt1MM6len2tJuLjHY8h5MeQwEu5Re1rN/lqQidC7A4Dd+BptYYhol
	 nQ94W7X2HMq/yimfyLdWt8ZbeEIDVlilbGPbehivp/ye6uDlH9T0dZRRB+KGkg7rTS5kT
	 DTBGT7bZ348bs3GwOmmHoA2aqxtjwxaDWEbhP2pHML4hHz7Hr/9S7aQcAd8dfGR8zmvSG
	 AKJLLmyckAlQIf3+p8InhC21sHCu+ieuv01eF4mJajOcqf3eZUBFRmJHndD9Nhf/2bq6/
	 ZZnYa6R3KTXEGEFZmXhIqTrgyZNEerXfpY8RNsqzvDNL35UVx28StuoJ/LDR7QtaIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQdTNDDl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42C606A31A;
	Sun, 22 Nov 2026 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQdTNDDl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E861F000C4;
	Sun, 22 Nov 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795380067;
	bh=3lCoGfeSw+foOIoqggOyah4gEvrKCtbgBNEH4Ru9Kgo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iQdTNDDlcjEsF05sXXZeC3jlERclL7BH+d0y/+dOSFB7xhlgKt2l97QBwltgo2Xnf
	 LBkpfKCgQTIOWZBiNLP+uw6m36CTFBMeBRjgYu6EIjSLNI8ardc56V7gYRQHL0mmN9
	 Oj1y+Na1V1nsgERKxZSH8s95JxjqToCJwYQ0g6GHDOP17Ek0sH5gZeQDs3pu4Dtq7/
	 L4ExyRom2k2WEPfARDtXn4MYW0EZwp+beT5PlqXf2tF23aGJg6oDXBlLMkYONdvuOU
	 /SkRwpe7i5gTxOZ4n0vJNW1vPZbaQBebh0FK3m1nGTcOrm+5kdi4WBStpS0ZlEppTm
	 z7mQbLSpesY8Q==
Subject:
 Re: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during detach
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 richardcochran@gmail.com, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org,
 pabeni@redhat.com
Date: Sun, 22 Nov 2026 20:41:06 +0000
Message-ID: <179538006639.3135.15219639487891578509@kernel.org>
In-Reply-To: <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "ptp: ocp: prevent timestamp rearming
  during detach" has a broken trailer block and keeps workflow notes in…

--

ptp: ocp: prevent timestamp rearming during detach

This patch adds a ts_lock mutex and a ts_stopping flag to struct ptp_ocp,
which serializes ptp_ocp_ts_enable() against ptp_ocp_detach(). After
detach sets ts_stopping, later enable requests fail with -ENODEV. Disables
still go through for the PTP core cleanup.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> Reported by the netdev Sashiko AI review, then checked against the
> current PTP and POSIX-clock paths. A source-derived userspace harness
> forces an enable after detach's disable and reproduces the rearm with
> the old source. With this fix it rejects that enable, waits for an
> enable already in progress, and waits for a mocked active IRQ. Both
> timestamp and combined PPS/EXTTS paths pass with ASan/UBSan. This
> validates ordering with stubbed MMIO/IRQ operations, not an in-kernel
> use-after-free reproduction. No physical card was tested.
>
> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.
>
> Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
>
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
>
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]
This isn't a bug, but blank lines separate the Fixes:, Link: and
Signed-off-by: lines from each other.

Tools such as git interpret-trailers, b4 and patchwork only treat the last
paragraph of the message as the trailer block. As written, is
Signed-off-by: the only trailer they will find, with Fixes: and Link:
missed?

Could these three lines go into one trailer block with no blank lines?

The report credit is written as prose ("Reported by the netdev Sashiko AI
review"). Would a Reported-by: tag work better, with the lore URL as a
Closes: or Link: trailer?

Three parts of the body describe how the patch was produced, not what the
change does:

- the userspace harness and ASan/UBSan paragraph
- the "No physical card was tested" note
- the Codex/WiWi paragraph

Could these move below the --- line so they stay out of git history? If
the tool assistance should be recorded, an Assisted-by: style trailer may
fit better than a paragraph in the body.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-timecard-common-301f823ddd-0-ahmadexp%40gmail.com
