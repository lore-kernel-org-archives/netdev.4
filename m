Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478264;
	b=lHj5kEkvvTT/e7BJ3iRo/kT/nRdlj+0bcWAFSRApGzwv6XmbYgfMupnjLWJ6Slpyh8Ym
	 jqBHrk2uFKGcQkFrBiK3cOiElOZWvyZJY3BcPJgg57ApCO2M8/dbcuIJCMPe7Rc6ATXCY
	 VGwzOL4W/g4Hyv6ip/zrNF+SVCePR+zb57jB+lXBQrXs5jZmKyHXuE0r8HttQQDCWwoP/
	 RQDOkagMO9yHSrqsG43OMNXjztcYdZ4IiorMZCXC25ok/XEkNAi8mbWjpa5xOvqp/Uw7D
	 R8TUFp6v4EaPxPyyo2J1KKv4f/3Rh6nmq0OowwJfMU990AgMmGruVw4XEjSxoNqI3tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478264;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TBsXJBeRRVOImyQ/Szk+YPi0ypRjRqCWylyixyKG2iE=;
	b=Wchs1i5ZvdJryE50ngcOQMdp5nGcJ0ou0axsS3FIyiqjBy5BBb4htiOfXbBF84j188Ji
	 1wkYNJbSalreF0waemtTQ9hJhyARgUGlh4raScvQp9OS99LLjFV9M1ykwKxbrMW4j+r5X
	 niO+uIoctRgFZBoJH0tdukvhEwyaHqCWC6GKHULSPfCiV664zV+rheKSjdD1jvrYOdTV6
	 Gru0Z/fEnin70cz/2h3mD3hTFJtsYaCMZGhfYds8y7N86S+mHKSm6+TpdDws4NN0GnwZc
	 mBKBCLqRfb+m8XVV21QCoxFfm5AkgIyLW39dS4oYYy+cqe3eXH/J3QmzCSpVHxEAwcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMU13wN6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528CD606A31E;
	Mon, 23 Nov 2026 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMU13wN6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EA11F000C0;
	Mon, 23 Nov 2026 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795478263;
	bh=TBsXJBeRRVOImyQ/Szk+YPi0ypRjRqCWylyixyKG2iE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nMU13wN65elXNUFCSEtyveLzrF+uCQCgV1WWHfKEOfiEIbbdrVQM+Li0TEtWGEDSX
	 ZKfiWHmgWgpxC+px6Ir2HEkbrGpxYLcg7gjWhJC2jnrzFvqml0+w2uIDhJ/O/5UWQv
	 M1yHJOBMj6HPMLYgKJnMc0g33CdvqMYiDNdEdPvEPGIGiobZagzzcFeT/+neydkavE
	 fC+YxFaABv/HSO70L6F80CTITvjpot9QLUwyZHtHp0br/EU3yAZUurkkR9VseavD+2
	 7m+Yt20DGSf01U7k/D8P9Qin+gj7BsVw1tOyRVV19xj2sx1IrzUvKISp3ssgoa3et7
	 r19Q5Okm0Cdpg==
Subject: Re: [PATCH net-next v3 2/3] amt: bound the source-state work of one
 Membership Update
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org
Date: Mon, 23 Nov 2026 23:57:42 +0000
Message-ID: <179547826290.3135.17087083328500674943@kernel.org>
In-Reply-To: <20261122235724.2898320-3-omar@blockcast.net>
References: <20261122235724.2898320-3-omar@blockcast.net>
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

- [Low] The constants that size the new work budget are documented as
  exact maxima, but the code never reaches them.
- [Low] The patch fixes a long-standing CPU amplification but carries no
  Fixes: tag.

--

amt: bound the source-state work of one Membership Update

This commit charges each group record in an IGMPv3 or MLDv2 Membership
Update for the bucket walks and per-source lookups it causes. It stops
applying records once the total exceeds twice the cost of refreshing every
group and source the tunnel may hold. Records for groups the tunnel has no
room for are skipped and not charged.

> Found by review (Sashiko, on the limits patch); not triggered at runtime.
>
> Assisted-by: LLM
> Signed-off-by: Omar Ramadan <omar@blockcast.net>

[Severity: Low]
Should this patch carry a Fixes: tag?

Before this patch, ip_mc_may_pull() was the only limit on how many records
amt_igmpv3_report_handler() and amt_mldv2_report_handler() applied under
tunnel->lock in softirq. A reassembled UDP Update of up to about 64 KB can
carry thousands of 8-byte records against one full group.

That behaviour seems to go back to bc54e49c140b ("amt: add multicast(IGMP)
report message handler") and the matching MLDv2 report handler commit.

An earlier fix in this area, 5931fd2440de ("amt: fix use-after-free when a
Membership Update re-arms a freed tunnel"), also addressed a theoretical
issue. It carries Fixes: tags against bc54e49c140b and cbc21dc1cfe9. With no
tag here, backport tooling can't tell which trees need this limit.

The "on the limits patch" note seems to refer to a later patch in this
series, "amt: make the per-tunnel group and source limits configurable".
That note does not take the place of a Fixes: tag. The series adds UAPI, so
it may be net-next material either way, and this could be treated as
hardening.

[ ... ]

> diff --git a/include/net/amt.h b/include/net/amt.h
> index f36efcdd92d0b..96357b3e32fc9 100644
> --- a/include/net/amt.h
> +++ b/include/net/amt.h
> @@ -392,6 +392,12 @@ struct amt_dev {
>  #define AMT_GC_KICK		2048
>  #define AMT_MAX_GROUP		32
>  #define AMT_MAX_SOURCE		128
> +/* Per group record, the most passes the mode handlers plus
> + * amt_cleanup_srcs() make over a group's sources, and the most hash
> + * lookups they make per record source.  See amt_rec_cost().
> + */
> +#define AMT_REC_WALKS		7
> +#define AMT_REC_LOOKUPS		8

[Severity: Low]
Are 7 and 8 really the maximum counts this comment describes?

In amt_lookup_act_srcs(), only AMT_OPS_UNI and AMT_OPS_SUB walk every bucket
of gnode->sources[]. AMT_OPS_INT does one amt_lookup_src() per record
source, and AMT_OPS_SUB_REV does up to two.

The most full passes seem to come from amt_mcast_to_in_handler() in EXCLUDE
mode, which makes three AMT_OPS_UNI calls:

drivers/net/amt.c:amt_mcast_to_in_handler() {
    ...
    } else {
        amt_lookup_act_srcs(tunnel, gnode, grec, AMT_OPS_UNI,
                            AMT_FILTER_NONE_NEW, ...
        amt_lookup_act_srcs(tunnel, gnode, grec, AMT_OPS_UNI,
                            AMT_FILTER_FWD, ...
        amt_lookup_act_srcs(tunnel, gnode, zero_grec, AMT_OPS_UNI,
                            AMT_FILTER_D_FWD, ...
        amt_lookup_act_srcs(tunnel, gnode, grec, AMT_OPS_INT,
                            AMT_FILTER_FWD_NEW, ...
    }
}

The two bucket loops in amt_cleanup_srcs() bring that to 5 passes.

The most lookups per source seem to come from amt_mcast_block_handler() in
EXCLUDE mode. That is SUB_REV (2) + UNI (1) + SUB_REV (2) + UNI (1) = 6,
plus one in amt_add_srcs(), for 7. amt_act_src() starts no further walks.

The commit message figure also seems to rely on the higher pass count:

  "At the current defaults a 1.5 KB Update of about 180 empty records
  against one group already walks the group's 256 buckets over a thousand
  times."

At 5 passes per record, that would be about 178 x 5, or roughly 890.

amt_rec_cost() and amt_report_budget() use the same constants, so behaviour
does not change and the budget is still conservative.

Should the constants be 5 and 7? Or should the comment say they are
deliberately rounded-up bounds? The later patch "amt: make the per-tunnel
group and source limits configurable" leaves both constants and their
comment unchanged.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122235724.2898320-1-omar%40blockcast.net
