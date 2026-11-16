Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868557;
	b=K8sd3aSvwZQsPuaEdIpkOFzV7mqnj1N2M2qUVbAFh1wjmNKeJB2ODxpo3o5wF9xm9jdR
	 vMmIq1xMPI0In65Qd4aRku4IF9Pg6hxjTTBJ7bYC9U+ODU7AWUUx8DsapYY0glwwGLYc+
	 T2emNqzrS5QsRkBhYzWotwlUcbDKe36MoxDC7c6RGcMVmb98o4anEO7HydqZ5FZXsspUW
	 WDoZdy4V404ONUqwm4Vuxf96X2OROj2E4AKuxM7XV3R49XkX6PWJX2Rtm+Q/nQ6MVB02o
	 Nac+HOZ0DuyB/GQWtBI6cCr4lJcywIzPuDEEDxA0nqUjn8bWdRzZp0H+vBsTWOAk8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=81QVFPNBMtvTkIPV7j0MW1cXGCru4h8AqI+bEJxsMBM=;
	b=qfM4bSlRX3tsN/ZmpAl80hT8psJzEjtYk0IqjId4knoqNZSLX/lDtUiW0EvSHe57Nk7m
	 8yxJ9f0uUc93f4wnUAYJAvJNiaPa69WqLOqSUQMvRJdrx/J2yCedX3U4X1fMhQdG7r8/N
	 SHkLV3oiOUqrKGYLmNIMO6805F3kj8K4M/A/KfbzcYh39/EkFvBdRw8CK29d1kCiLnp9D
	 duSDqsYqHqAlR2plX0yyxShqEV5odyurL1JqBTQRfAQl/Vo95j9QZfUgZgRVrbv0u6SGR
	 AhEZkCJt4uaGu+2XWXFbup64Un+cAlR3R2BKiG8egJESe3A/f5FinXRQiKgQPR5PHhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="owckIJ/X";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93320606A33F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93320606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=owckIJ/X
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so287721a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794868556; x=1795473356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=81QVFPNBMtvTkIPV7j0MW1cXGCru4h8AqI+bEJxsMBM=;
        b=owckIJ/XO+KPuRSD616m6vMSHjh+drN6ZxgO9zBnFiKzRgM6hZUiDI3S2iqK42Avgv
         RZncUo2cQVcynZtp0SHGFpgyn7iG0Fllc0gnSoemN52ss2+NNltcYh99vL2nmwNO4AML
         T7THBJbcbr3tTmETCqBm34ft4svJPFkCJTsrHwY9wjTc2Ca4oY0lOZOE+VpT4/yZrlOq
         j0vlJ3vmT2APXPdY/EjtGb4XlSNrm7WFSvpcSZT4nnzppIZfPQ1bnTlvfZBfJPUsINqk
         S3z1GoWH2sJZck/lr6lS3NL385iFyfxnIlpc0A1tFzrBSVoRlg9py28pDZK7alqzJsUu
         dJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868556; x=1795473356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81QVFPNBMtvTkIPV7j0MW1cXGCru4h8AqI+bEJxsMBM=;
        b=Zu3xqwSEqqKlblNIy7Lo9ho6aqUAnW/Yo+zu7auzNTLJ4zWhI5Z4cerx15E5Un+pse
         sV73hLUo2hb2rYsoe/1hDZdioB+aqG7MppMGB9I1SIMaoqkO9co5uMybQ8gqSlDCMbBK
         Aj6Oqc0LRJ62XNdMnLwJJDJhAoASGiZJqOP3dCEU2s+T/XvEGD29BaxJ9V1FKBjjvqtf
         sds1O8AsDsYtXjccHQ7h7u1zhjP/hH82EQyvbYzCSMS8SF6fu8Yko90tOtsqFJQ/TIVF
         Wz2hDSmRRRZHTkKG/9/Zfrv3v9aIEQjVk7xGqyFSS5A+RJYD4yBC50ZS+d2gYtTO3zYb
         nfeQ==
X-Gm-Message-State: APuU4Z9ePreDfyzJRXpYvEKmUrqIr9aPY3GDeWu25PxwEimTMTU5HtKZ
	Bc7JGrihrOBZIr4BqcdQ1giYhLr9yCWhadY0+RTRjGO9lzaos0WINMkCA57qiSFoziU=
X-Gm-Gg: AZFdTZd4bwPPBjAeQ1oG8V/TuZWDw6bJreyCYx8N78QXW4Wt3ft2JbspmfioA5g5Vuh
	vXQuPQ62TUC1mm0+J4MhOHQXMj506/iEYa8/HsWL5GquszDOASKQTp2cP0EH+hXf9LLVdPuE7rT
	0opdSgr+KBDnHQbn2EuZumzinNa+O4o2oC/6C53P5FbaYC42qUG8/vzmToV41nzHUKG0ICps5bw
	gal+c6G07quWR/fxqP3QW7VxUhvcEzMD5+Wo53HzJlpPPkVvbPs3YtiZlAh65ko/yC2CwOQXZZX
	rWq815EBtHaOU2jvt8ZJiLFddSzWfQ5J1fLNwd1RyNqhdu1dZv5FJ7mkC82qlO/MldVR+fvgE55
	TFz3SpC6lJv5tTth1GmAbWhqQwn3usfMNUwHFsHrhvwswHDp16s+9qmHXCrK1rFZuVkr3eZN4P5
	+Ms1I46Gsdq8RqPRztmBFIycI+PMgqLOO2myd8SM+MCYQyIWLpRx7xgmKnETEh7tJHN165AbcrW
	akg+1WTmax01amoqMf8IBm+GV9nJi4g2z5p1fAOpss8m+7TezOWL7Lacb+eHehDUzIb8YUERGeP
	Z8LoUv9lWLbbo9ngVGuqUvuhJkllms7JGCFjKtrMbFcK2h0Vmybp26e41lUd9QELwEVsEpjbIaQ
	PzjrpAmXd+fjVqMLkRxw=
X-Received: by 2002:a17:90b:5647:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b1b0a4e8e4mr11200424a91.58.1794868555501;
        Mon, 16 Nov 2026 14:35:55 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm1021128a91.2.2026.11.16.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:35:55 -0800 (PST)
Date: Mon, 16 Nov 2026 14:35:53 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Pranav Tathe <pranavtathe30@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH iproute2-next] ip-link: document BOND type options in
 man page
Message-ID: <20261116143553.1b051ab9@phoenix.local>
In-Reply-To: <20261110142527.257436-1-pranavtathe30@gmail.com>
References: <20261110142527.257436-1-pranavtathe30@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 19:55:27 +0530
Pranav Tathe <pranavtathe30@gmail.com> wrote:

> The ip-link(8) man page documents master-side creation options for many
> link types but has no "BOND Type Support" section, leaving the bond master
> options (mode, miimon, arp_*, xmit_hash_policy, lacp_*, ad_*,
> coupled_control, broadcast_neighbor, lacp_strict, arp_missed_max, ...)
> undocumented, even though a "Bonding Slave Support" section already exists.
> 
> Add a "BOND Type Support" section modelled on "BRIDGE Type Support",
> describing every bond master option accepted by iplink_bond.c. Option
> descriptions are sourced from the kernel bonding documentation
> (Documentation/networking/bonding.rst).
> 
> Signed-off-by: Pranav Tathe <pranavtathe30@gmail.com>
> ---
There is a tradeoff between more complete man page and duplicating what
is already in the kernel documentation. I would rather have kernel doc
as single source of truth and keep the ip man page to a minimum.

The longer AI review is:
------------------------

Having a BOND section is welcome, and the option set you identified is
right. But the per-option prose restates bonding.rst, and that overlap is
what I would like to avoid. Documentation that is copied from the kernel
drifts from it, and the man page has no way to notice.

The miimon entry in this very patch shows how that goes:

> +.BI miimon " MIIMON "
> +- specifies the MII link monitoring frequency in milliseconds. This
> +determines how often the link state of each slave is inspected for link
> +failures. A value of zero disables MII link monitoring. A value of 100
> +is a good starting point. The default value is
> +.BR 0 .

0 is right for balance-rr, active-backup, balance-xor and broadcast, but
not for the other three. Since

  c1f897ce186a ("bonding: set default miimon value for non-arp modes if
                not set")   [v4.18-rc7]

setting the mode to 802.3ad, balance-tlb or balance-alb forces miimon to
100 when it was left unspecified:

	if (!bond_mode_uses_arp(newval->value)) {
		...
		if (!bond->params.miimon) {
			/* set miimon to default value */
			WRITE_ONCE(bond->params.miimon, BOND_DEFAULT_MIIMON);

bond_mode_uses_arp() is false only for those three modes, and
IFLA_BOND_MODE goes through __bond_opt_set(BOND_OPT_MODE), so

	ip link add bond0 type bond mode 802.3ad

comes up with miimon=100. That was the motivating case in c1f897ce186a;
802.3ad needs link monitoring to work at all.

And bonding.rst is not much better - it says

	The default value is 100 if arp_interval is not set.

which is imprecise in the other direction, since the kernel guard is on
the mode, not on arp_interval. That wording came from

  f036b97da67f ("Documentation: bonding: update miimon default to 100")

four years after the behaviour changed. So this is a detail that two
kernel doc revisions have not stated correctly, and copying it into
ip-link(8) adds a third place to get it wrong.

So for v2, I would keep the synopsis and the option list, which are the
parts a reader needs from us, and cut the descriptions back to one line
per option - roughly what it does and which modes it applies to - leaving
semantics, defaults and valid ranges to the kernel. The BRIDGE section you
modelled this on is already written that way:

	.BI hello_time " HELLO_TIME "
	- set the time in seconds between hello packets sent by the bridge,
	when it is a root bridge or a designated bridges.
	Only relevant if STP is enabled. Valid values are between 1 and 10.

For miimon that is just

	.BI miimon " MIIMON "
	- specifies the MII link monitoring frequency in milliseconds. A
	value of zero disables MII link monitoring.

with the default left out entirely, rather than stated wrongly.

Then one pointer after the synopsis covers all of it:

	The options below mirror the bonding driver parameters. For their
	full semantics, permitted values and defaults see the kernel
	bonding documentation,
	.B Documentation/networking/bonding.rst
	in the Linux kernel source tree, or
	.B https://www.kernel.org/doc/html/latest/networking/bonding.html
	\&.

tc-bpf(8) already cites Documentation/networking/ this way, so the style
is not new here.

On the rest: I checked every option in the new section against the option
list in bond_parse_opt() - the set is complete in both directions, nothing
documented that is not parsed and nothing parsed that is not documented,
and the value lists and numeric codes all match. That part is solid and
should carry over to v2 unchanged. The page also renders with no new groff
warnings.
