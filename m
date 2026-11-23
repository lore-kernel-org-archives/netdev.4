Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471872;
	b=wMV4PSffdZLw6Zeo4BMKDcQTjAcReQP1pVrPdpe0X0wbtzBkyDOROKLycCi5fYVsMAcN
	 rZpxWEDN69HEpuMhVNgxBgY8Sqm4ix5dX9oHhC5ylAyhh7LiJWoEzKgZg5cEVjb39J0BL
	 gDJ8DmaLiUrtUHYetOabLiRPivMDy15A+UyrtY0K4Xn/jooaNuyXnPxFd4cvb34tTBQGK
	 kbj2PAftUrr37BAvDUZ1HjuP2KJRmNKSed04cTHEnfa/xlVvRmVGV5U0whO6FYkLZC2/6
	 +aXzxTny5yJL0JacwTVLtMUSaj/87IRmhL7GZS4/srpmjLUVDggKRik6hCylYs4nnGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471872;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4xHRp9aZooZyc9nci6AtLM+Hkldl0hr3+96Zvxfc5+Q=;
	b=QAYBJwx9xub48mMR56FcT2ICJ2VrcDczzB8q2ruhFaIYF1fhw/2KouAHlbliKaL3vHiz
	 PInZrn+qjHl3181A0IRyO8KiwlQr8jwBfX4cEq3vSbFJTHAEzQsgA6KkhLGJLoOt6c8KA
	 tjIcd0M51bwdN88ZNdxKjASL7v1Wd1mmsEfvvi+zpqLY0hf2ZR+/FnEJS1Cg64aK6Ja2p
	 VeaEPb/o+AsIkqnFScHHNdO2Lb1RNwRpcRyqmUz2zyryNQfigf9nekA8BvxqsCS0QFdFx
	 EQ74JrnSmRdSl4DUtBGvtHVkmELomO4FUMMnmrFFBxkiZGaBfg8kKpuM0IOpt2Vy0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2JOJRLC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DABC606A334
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2JOJRLC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEBD1F000D2;
	Mon, 23 Nov 2026 22:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471871;
	bh=4xHRp9aZooZyc9nci6AtLM+Hkldl0hr3+96Zvxfc5+Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y2JOJRLCiRKr85/tYVMzcedSLeQsCpKNLLCWADK6sEfWot2F7kmS/9W7kPwF1Ah2J
	 iy0gv8cIk5bTrqVpu/4uU9l3gnPDCtBdkTsnJhcV8PJ197RxIhzxs/LS4ju/MwP/9r
	 nan3886Hcwn80c6VPDpOQzCgNW66MxeWhcVHMcHjJrLUARRVqsmnfVD5jXVmhoOCR9
	 zW1zc571GQcLwYA4cM5iEAeMlMa6oj0zvmhN6qtf4Im2uug3p/mvSotUcK0biEpHc3
	 5blWlrxYEprBd3jX82IQ5LkXzUOKZG+ssVkiqXLmu50Y37tuDgr1xEqmSMVlTOjvQ0
	 zTKLGjKyDqaDg==
Subject: Re: [PATCH net v3 1/3] net: dsa: motorcomm: Ignore multicast
 addresses in FDB ops
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Mon, 23 Nov 2026 22:11:10 +0000
Message-ID: <179547187046.3135.5287571257450168353@kernel.org>
In-Reply-To: <20261119221110.1123578-2-mmyangfl@gmail.com>
References: <20261119221110.1123578-2-mmyangfl@gmail.com>
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

- [Low] The commit message does not say what actually breaks in hardware,
  even though the patch carries a Fixes: tag.
- [Low] For multicast MACs, yt921x_dsa_port_fdb_add() now returns 0
  without writing anything to the switch.

--

net: dsa: motorcomm: Ignore multicast addresses in FDB ops

This patch makes yt921x_dsa_port_fdb_add() and yt921x_dsa_port_fdb_del()
return early for multicast MAC addresses. Multicast entries are then no
longer touched from the FDB path, because the software bridge never
forwards according to a multicast FDB entry.

> The software bridge never forwards according to an FDB entry with a
> multicast MAC. A multicast entry created by "bridge fdb add" is
> therefore inert in the software data path, but its switchdev
> notification still reaches .port_fdb_add().
>
> Ignore multicast addresses in .port_fdb_add() and .port_fdb_del() so
> multicast entries are not touched from FDB side.

[Severity: Low]
This isn't a bug, but could the commit message say what goes wrong in
hardware without this change? The patch carries a Fixes: tag, and the
description does not mention the user-visible impact.

In this driver the FDB and MDB ops share one hardware table. They use
the same (addr, vid) key and the same helpers:

drivers/net/dsa/motorcomm/chip.c:yt921x_dsa_port_mdb_add() {
    ...
	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
    ...
}

yt921x_dsa_port_mdb_del() calls yt921x_fdb_leave(), which is also what
the FDB ops called before this patch.

Before this patch, "bridge fdb add <mcast> dev swpN master static" wrote
a static hardware entry. The switch then forwarded that group by the FDB
port mask, while the software bridge forwarded it by MDB or by flooding.

Also, a later "bridge fdb del" of an address that MDB had also
programmed ran yt921x_fdb_leave(). That cleared the port bit from the
MDB-owned entry, or deleted the entry once no ports were left:

drivers/net/dsa/motorcomm/chip.c:yt921x_fdb_leave() {
    ...
	if (!(ctrl2 & YT921X_FDB_IO2_EGR_PORTS_M)) {
		ctrl = YT921X_FDB_OP_OP_DEL | YT921X_FDB_OP_START;
    ...
}

After that, hardware multicast forwarding no longer matches the software
MDB, which still believes the group is offloaded.

Could these two effects be described in the commit message?

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index c753c746490a1..9a9e8ed76e01f 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -876,6 +879,12 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
>  	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
>  	int res;
>  
> +	/* The software bridge never forwards according to an FDB entry with a
> +	 * multicast MAC, do not touch it from the FDB path
> +	 */
> +	if (is_multicast_ether_addr(addr))
> +		return 0;

[Severity: Low]
Will returning 0 here make the bridge report the multicast entry as
offloaded, even though nothing was written to the switch?

dsa_user_switchdev_event_work() in net/dsa/user.c treats any 0 return
as a successful offload:

dsa_user_switchdev_event_work()
    dsa_port_fdb_add()
        yt921x_dsa_port_fdb_add()    <- returns 0 for multicast
    dsa_fdb_offload_notify()
        info.offloaded = true;
        call_switchdev_notifiers(SWITCHDEV_FDB_OFFLOADED, ...)

The bridge handles this in br_fdb_offloaded_set(), which sets
BR_FDB_OFFLOADED. br_fdb_fill_info() then reports NTF_OFFLOADED.

As a result, "bridge fdb show" would list the multicast entry as
"offload", but the hardware table has no such entry. The driver's fdb
dump path also filters out multicast, so the hardware side shows
nothing. Before this patch the entry was actually programmed.

For comparison, rtl83xx_port_fdb_add() and rtl83xx_port_fdb_del() in
drivers/net/dsa/realtek/rtl83xx.c return -EOPNOTSUPP for the same
check.

If 0 was chosen on purpose, for example to avoid the dev_err() that the
deferred work prints on failure, could the commit message or the code
comment say so?

This also seems to remain after the later patch in this series, "net:
dsa: motorcomm: Rewrite FDB entry on port migration". That patch keeps
the multicast early return of 0 in both fdb_add and fdb_del.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119221110.1123578-1-mmyangfl%40gmail.com
