Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971805;
	b=aMQB5L9nM6f3SOI5hXjhRC5vk2nYehkBv7Owv1f8RCsBRRWcd4nRn8bCLOr9fg0h0kZj
	 j4DS+3QsbZIDIkHoy/VJ/9FbnyUpma/jrgv+bRCD3yhPg/Kl76Q1G1DycuEExgwMqbvT4
	 ExUeIN8F98mQYeBgNGHC1bl86zF2O69FOHDgIiHezZZCEu5vJR2Imtd9/YQ5tWcAV8yVo
	 J+h3It7/fHVP7Pa3px2H/SXj/egvMAcITv93lbtmWwuJgH3HLVXvmIA8d54jQSx4y5Id7
	 wLwF7wfmU3KO1wWqLvE2yibcW4tZi9JH3bFYMSDDryQAc1RV7PWChC2vhYnmen8/MtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971805;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5HyPCXZ6bZ7CUCgh8MDpi5HsbXh6yrJ1OhzkLccNmv8=;
	b=LzXrPTUnUh9h7NY53BgFxeGts7aWsWM1mOtGyBDuP2Wb4JrQyC/AhsKvoWYcjaC+mnxl
	 3jHcyAIcrvxfbbCCbymKGtPwqRRgQTHzD/na8TjCNm3K9FesOOBQYFu1OR7sUgOaoXSr/
	 VbReZGIScbvZiSg/nvBrBniUgpBjMsme7EGvMtZ/jN2sYmpw88vyGByGCujJiAiZr2zk8
	 SotRphJIlya21DYoqqfcHHxSsJX9Wx+QoExBHzJXmb5QDGMXHh/79Nv6IRr8eiktCnTWN
	 Ux6MewgP9TRMiklR6ez+YmJr4thyARbZOXAqA7ik2Yqm+ZhnKV9NGlYLj0qAdEXjZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRqxOLMc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6B606A31C;
	Wed, 18 Nov 2026 03:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRqxOLMc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737931F000C4;
	Wed, 18 Nov 2026 03:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794971804;
	bh=5HyPCXZ6bZ7CUCgh8MDpi5HsbXh6yrJ1OhzkLccNmv8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZRqxOLMc2Rj96LjqQtxouoSsi6IYCG/oDN3jKh9i6hdOA2XQORvtOymxEKh0q38CL
	 zAL2p5iZycZyYxqoFy8PLwLGl7Nwpsmcap0Bq+fdItCnhyXTcoK4RraDqLe6ttwG5U
	 81Dlhnb94ZP7hjTfHCGJEdKab3wAuAR0zlx0wuVmtOG5lPU1jkuLiP9KR0khm2eYiV
	 rv/sw9nMQsDV9pMD3bdNiRbM/VgBFF9rW/Nc+CyCvJdr1WKYUOkh55Www3i+rSN5Pw
	 QuC4Z33BHgnM1xSg7cRqc4UFb2LyVhXa0LArfM6Qx1yP7YN6Y/uJd4LE9WrsvyIUVx
	 Q0v25BVdfkAPA==
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Resync SMI slave before
 register access
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 03:16:43 +0000
Message-ID: <179497180399.3136.7097991469555509523@kernel.org>
In-Reply-To: <20261116162303.1368472-1-mmyangfl@gmail.com>
References: <20261116162303.1368472-1-mmyangfl@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The resync sequence in yt921x_reg_mdio_reset()
  (drivers/net/dsa/motorcomm/chip.c) cannot bring the SMI slave out of…
- [Low] The patch adds a new way for probe to fail, and the commit
  message does not mention it.

--

net: dsa: motorcomm: Resync SMI slave before register access

This patch adds yt921x_reg_mdio_reset(). It sends a fixed sequence of SMI
address and data frames to realign the slave's 4-frame state machine. The
function is called from yt921x_chip_reset() before yt921x_chip_detect(),
and it ends with a read that is expected to return the 0xdead sentinel.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index 35e70b3226089..5d6390abd7cb5 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c
> @@ -98,6 +98,103 @@ struct yt921x_reg_mdio {

[ ... ]

> + * State Input Next Comment
> + * ----- ----- ---- -------
> + * AH    aw?   AL?  step #1
> + * AL?   aw?   DH?  step #2
> + * DH?   d?    DL?  step #3
> + * DL?   d?    AH   step #4
> + * A?    dr    A?   `0xdead` sentinel
> + * ALw   awr   ALw  ignored
> + * D?r   awr   AH   abort, frame discarded
> + * DHw   awr   AH   abort, frame discarded
> + * DHw   dr    DHw  `0xdead` sentinel
> + * DLr   dw    ?    `0xdead` on following drs; next state undetermined
> + * DLw   awr   ALr  abort, frame consumed as next access's addr-hi
> + * DLw   dr    ?    `0xdead` sentinel; next state undetermined
> + *
> + * Any other REGAD/op combination is not characterized and never sent.
> + *
> + * The reset sequence is awr, dr, dr, awr, awr, dr, dr, plus one more dr
> + * as a heuristic sanity check. The `0xdead` sentinel cannot distinguish between
> + * AH, AL, or D?w, but when this happens, it should be classified as a model or
> + * hardware error - in either case, there is no use to do more check.

[ ... ]

> +	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
> +		   YT921X_SMI_READ;
> +	reg_data = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_DATA |
> +		   YT921X_SMI_READ;

[ ... ]

> +	/* Heuristic sanity check: expect AH + dr -> AH `0xdead` sentinel. */
> +	res = __mdiobus_read(bus, addr, reg_data);
> +	if (res < 0)
> +		goto end;
> +	res = res != 0xdead ? -EIO : 0;

[Severity: High]
Can this sequence get the slave out of the ALw state?

The table above gives these transitions for ALw:

  A?    dr    A?   0xdead sentinel
  ALw   awr   ALw  ignored

The only characterized way out of ALw is "AL? aw? DH?" with an aww frame.
yt921x_reg_mdio_reset() only builds read-flag address and data REGADs.
So by the table, every awr and dr it sends is a no-op in ALw.

I stepped through the table for the other states. AH, ALr, DHr, DHw, DLr
and DLw all end up back in AH, so ALw looks like the only state that
does not converge.

The final check does not catch this either. ALw answers dr with 0xdead
just like AH does, so yt921x_reg_mdio_reset() returns 0 while the slave
is still out of phase.

The slave can end up in ALw through yt921x_reg_mdio_write(). Its first
address frame is aww, because YT921X_SMI_ADDR | YT921X_SMI_WRITE is 0:

	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
		   YT921X_SMI_WRITE;
	res = __mdiobus_write(bus, addr, reg_addr, (u16)(reg >> 16));
	if (res)
		goto end;
	res = __mdiobus_write(bus, addr, reg_addr, (u16)reg);

If the second frame never reaches the slave, the slave stays in ALw.
That can happen on an MDIO bus error or a host reset between frames, and
firmware could also leave the slave in that state. This is the "access
interrupted between frames, e.g. on an MDIO bus error" case from the
commit message.

On the next probe, yt921x_dsa_setup()->yt921x_chip_reset()->
yt921x_reg_mdio_reset() reports success. Then yt921x_chip_detect() reads
CHIP_ID. Both awr frames are ignored and both dr frames return 0xdead, so
chipid is 0xdeaddead.

That matches neither YT9215_MAJOR nor YT9218_MAJOR. Probe fails with
"Unexpected chipid" and -ENODEV before the YT921X_RST_HW write is
reached.

Every re-probe repeats the same no-op sequence. Wouldn't the switch stay
unusable until a power cycle? That looks like the chicken-and-egg problem
this patch is meant to remove.

The comment also says an ambiguous 0xdead result "should be classified
as a model or hardware error". The model in the same comment predicts
ALw -> ALw for this sequence, so the two seem to disagree.

Would this need a characterized aww step? Another option might be to
check the real CHIP_ID read result and then send aww followed by awr.

[ ... ]

> @@ -2225,6 +2322,10 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
>  	u32 val;
>  	int res;
>  
> +	res = yt921x_reg_mdio_reset(priv->reg_ctx);
> +	if (res)
> +		return res;
> +
>  	res = yt921x_chip_detect(priv);

[Severity: Low]
This adds a new probe failure path, and the commit message does not
mention it.

yt921x_reg_mdio_reset() returns -EIO whenever the final read is not
0xdead. It runs before yt921x_chip_detect(), so the check applies to
every entry in yt921x_infos[] before the driver knows which chip it is
talking to.

Has the 0xdead sentinel behaviour been confirmed on both the
YT9215_MAJOR and YT9218_MAJOR parts?

The -EIO is also passed up through yt921x_chip_reset() and
yt921x_dsa_setup() without a dev_err(). The other early failures in
yt921x_chip_detect() print "Unexpected chipid" or "Unsupported chipid".
If the heuristic misfires, the user only sees a generic probe error -5.

Could this path print a message that points at the SMI resync?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116162303.1368472-1-mmyangfl%40gmail.com
