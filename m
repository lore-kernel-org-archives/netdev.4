Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471873;
	b=jGJfRnDxWj1N5Fp8BSaQQMB0fJ3HYo4RK6CbL/hHMZU+xaaQKg2Myf6lLnvGYufQp2FR
	 4Mgjvlefmf/wOTFzf1tDyy+/Ctg5XJeRiqvqiO1taz1vbvIG6PuOIVXraB4sB8Klf4eLI
	 tus0QyetQh69IknfXr5gLy7X5DVx5KY2sQwhZTAlU08qroN+LO1iGv4+7Hcij/8hbDTPE
	 iMCz2A+KCoNq1u1NHYr0oZik2mS8dd18qVRgFE8IicN2dYt05F9//Usd3+OfM8upUKb6o
	 nagHHfJm5uGfAjlOOXZiRs2erBr7dkZpJnb5rJCLCDmEHkmX7gBsfnSQngUA+g4PldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471873;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4gwJugCmV4Jl56bEvoUZykXNr9VR7iCQ2K2cfxnOECs=;
	b=EItxyjTf/i4brdUTC3cBnLj4XtZuvme1LbuM6O9vDH3cXaU35qeKaDrvTYlFTZ9RJCCm
	 XGVCWYJyCYFJxx6VRwCu06F/MersH3koMwKNZMJkPnN8Oln7BtNDwrlrWKRIGjNciA4ln
	 BUaeoW1K0HQhmzEgXAAk38hYnIk1QB+FTfFrIFMVGr47pMaOlRnpqk9GU8He5uw3xJJZr
	 aCRnH9u6s+B2Y7Hpvwvg3OPd9Nn5QEQ5gIy9a3HPg+gmgfee3GolRI6g6g6e7dMnAZDxh
	 hhXZ4by271SXu0yysqUyK5H0WFmGKvBZ1Yo+KR2ogFQ1sfEZ5rcsJbNvJlC+AUvpn0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzSJo8mL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0B606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzSJo8mL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A821F000C0;
	Mon, 23 Nov 2026 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471872;
	bh=4gwJugCmV4Jl56bEvoUZykXNr9VR7iCQ2K2cfxnOECs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fzSJo8mLQ1ijHo9J2VDlKRn/CtcqEyV19WSq/l1pCqM4lfBGnv/qLFWnO53SqNlQ1
	 MqD+JOJP5JUxpIUgkp4q8LeEVJsKHXqqUIymI9rWw7tS5MqFn52klgTpbmRUxTLPaV
	 vmth04ptbJ3RsLOtpBHedNdehQbqCnp0ob2RNl113+ypmXA6MfMVMMjNWBJP3jg8A3
	 HPtD8G3P+F74mM1/Fsoo5fAtRK+VqKS0O3cA3+AvEC0Fb5nIYkTOgCOxfDELj5Bjnt
	 FanHwOXlR/RfvNz2jXH0AnpwD/dLbXuNf8VJCFH0FBWJGJSP4nL4dB/NFYq09GBORr
	 3oymWj5g4Nk8Q==
Subject: Re: [PATCH net v3 2/3] net: dsa: motorcomm: Do not inherit ports from
 dynamic FDB entries
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Mon, 23 Nov 2026 22:11:11 +0000
Message-ID: <179547187187.3135.17425549919833355866@kernel.org>
In-Reply-To: <20261119221110.1123578-3-mmyangfl@gmail.com>
References: <20261119221110.1123578-3-mmyangfl@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When yt921x_fdb_join() (drivers/net/dsa/motorcomm/chip.c)
  finds an existing non-static (hardware-learned) entry for the (addr,…

--

net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries

This patch changes yt921x_fdb_join() so that an existing non-static
(hardware-learned) entry for the same (address, VID) key has its egress
port mask replaced, not merged, when it is converted into a static
fdb/mdb entry.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index 9a9e8ed76e01f..ea305159cd5e7 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c
> @@ -799,7 +799,10 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
>  
>  	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
>  	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
> -	ctrl2 = val2 | YT921X_FDB_IO2_EGR_PORTS(ports_mask);
> +	ctrl2 = val2;
> +	if (ctrl1 != val1)
> +		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
> +	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);

[Severity: Medium]
When a learned entry is turned into a static one here, only
YT921X_FDB_IO2_EGR_PORTS_M is cleared. Should the other attributes of the
learned entry be cleared as well?

The remaining OUT2 bits are written back through
yt921x_fdb_add_index_in12():

  YT921X_FDB_IO2_MOVE_AGING_STATUS_M   GENMASK(31, 30)
  YT921X_FDB_IO2_IGR_DROP              BIT(29)
  YT921X_FDB_IO2_EGR_DROP              BIT(17)
  YT921X_FDB_IO2_COPY_TO_CPU           BIT(16)
  YT921X_FDB_IO2_IGR_PRIO_EN           BIT(15)
  YT921X_FDB_IO2_PRIO_M                GENMASK(14, 12)
  YT921X_FDB_IO2_NEW_VID_M             GENMASK(11, 0)

YT921X_FDB_IO1_EGR_PRIO_EN in ctrl1 is kept as well, because only
YT921X_FDB_IO1_STATUS_M is replaced.

The other path that creates a static entry, yt921x_fdb_add(), writes
only the port mask to IN2:

	ctrl = YT921X_FDB_IO2_EGR_PORTS(ports_mask);
	res = yt921x_reg_write(priv, YT921X_FDB_IN2, ctrl);

The driver never sets any of the other IO1/IO2 attribute bits. That
means the contents of a static entry added through port_fdb_add or
port_mdb_add now depend on whether the switch learned the address
first. If the hardware fills in MOVE_AGING_STATUS or any of the drop,
copy or priority bits on a learned entry, the static entry inherits
them. yt921x_fdb_leave() also writes OUT1/OUT2 back with only the
egress ports changed, so nothing later clears that state.

This looks like the same kind of problem the commit message describes,
untracked hardware state carried into a DSA-installed static entry, but
handled only for the port mask.

The later patch in this series, "net: dsa: motorcomm: Rewrite FDB entry
on port migration", moves this logic into yt921x_fdb_update() and keeps
the same partial mask:

	if (join_ports_mask) {
		ctrl1 &= ~YT921X_FDB_IO1_STATUS_M;
		ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
		if (ctrl1 != val1)
			ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
	}

So the issue is still present at the end of the series.

For the non-static case, could ctrl1/ctrl2 be rebuilt the way
yt921x_fdb_add() builds them (STATUS_STATIC plus FID and address in
IN1, only EGR_PORTS in IN2), instead of masking out a single field?

>  	if (ctrl1 == val1 && ctrl2 == val2)
>  		return 0;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119221110.1123578-1-mmyangfl%40gmail.com
