Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540844;
	b=JveRu9wvaKrzsq82ETAhZn2c4QPZw+XsGRmCci+QYW2JI2C9YvGFLs5lXmHxfOjMBHKk
	 NoXzbqhUVeOgH9VCzasex+zXSK8nATOYQntVaeobvY77wfuKZYbfICtDH/m/OezakN7Ap
	 iyVgIsEosLUIA61yoizQhrCqDvGfH0CSvO2bilzHXI7AKpCmXDBtT3EYdjxV7i9pfDz/F
	 saTmoYCO7CmPL9nh+M1vpi9XOiBgLxvBzecY0uMzsobGhhtZ1zjDC0geKyhrgnXy/3HY/
	 UxALI3i0feU6J2iQANsgAkGIm7rKbv8n08UbjbfVMjarZsrIKAr4iOfTbvG1g7+AoAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540844;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p/UDQyxJhw3BUiVVRQgYZDlK10E10e+GdTAXRLIZy3k=;
	b=JXvTozX9bwsOPZu0BnvhK2HnxO2jN9hMacr0P2MvzYThDNhPFJ9/Rl4mQT+WfzEaJDo7
	 Ncr2k8tN7BeGgvQJVX+4C7VZhrhXIuX4hVYgTxSYZsmlc2eYdpSG5txoWjkUNHHpF3FCq
	 u8CkdMP0+loLY2I+UVf6ylqETIXu2nNNk9mHa3iIhbyawgFmmeEOSSX0iQgjwmC49pKBq
	 SOQ0GouwDXyO2GSVSyUJq2Mz1zMoxdF6+KExC2Lk+aLU23h4qjGXOTxoJ1Wn5EhOh5zGg
	 LH2/RLU+TLNblcYV+w2GLDdFFMt+b9RQPF8mR8iihRW/xJ+ori1GsN+vz2a45ch+B9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqD8bK6e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C65606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqD8bK6e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931281F0089E;
	Tue, 24 Nov 2026 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540844;
	bh=p/UDQyxJhw3BUiVVRQgYZDlK10E10e+GdTAXRLIZy3k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CqD8bK6eTCAlE9p/jKV2ZBuOzZvSm3xdaSkkraofai/eP3wmtfcXOFta0OQt7/bZt
	 Uc4Wh3qoRKcTxUS5NistBRnJe/TPeqDjlQ9sayiuvqoQ8TDKUptop2vFMmlffmqboQ
	 /2rZFI3b55Rm3Km2bM0Sv+YwEBb/DgWr+BRqKDy9wSCtxAxFi+uLi88MV85a7rywas
	 PtI1Afk0xGXOUJObWXF/nmySaQisNCHiqp2xj9nKFkqv2vpEvJE7j/5+E9jDtbh9j9
	 X3zINW7/tE/rjOC9OEhgvttERyXVyh3gNlaFfQoxbvaebRfj3XgXeaA3w7eXCDN3dx
	 uEEMx+Bud9++A==
Subject: Re: [PATCH net-next 10/15] batman-adv: tt: keep local entry unchanged
 when ADD can't be queued
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:43 +0000
Message-ID: <179554084314.3135.7493792255015362398@kernel.org>
In-Reply-To: <20261123171827.3294525-11-sw@simonwunderlich.de>
References: <20261123171827.3294525-11-sw@simonwunderlich.de>
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

- [Low] Resolved later in the series.

--

batman-adv: tt: keep local entry unchanged when ADD can't be queued

This patch makes __batadv_tt_local_event() return whether the change was
stored. Callers that queue an ADD now modify the local entry only after
the ADD was queued: batadv_tt_local_refresh_locked() for flag updates and
batadv_tt_local_insert() for hashing a new entry. A failed refresh is
passed back up to batadv_tt_local_add().

> diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
> index 977f62c88da76..c94b292a1c4a8 100644
> --- a/net/batman-adv/translation-table.c
> +++ b/net/batman-adv/translation-table.c
> @@ -653,10 +653,18 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)
>   * Only a single change per client is queued. It describes the latest state of
>   * the client and a new event therefore replaces an already queued one.
>   *
> + * The other nodes only learn about the modification of a local entry through
> + * the queued change. The caller must therefore not modify the entry in a way
> + * which depends on this change (e.g. hash it as BATADV_TT_CLIENT_NEW or mark it
> + * as BATADV_TT_CLIENT_PENDING) when the event could not be stored.
> + *
>   * The caller must hold the flags_lock of @common. The events of an entry are
>   * then queued in the same order in which its flags were modified.
> + *
> + * Return: true if the event was stored, false if the memory for it could not
> + * be allocated.
>   */
> -static void __batadv_tt_local_event(struct batadv_priv *bat_priv,
> +static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
>  				    const struct batadv_tt_common_entry *common,
>  				    u8 flags)
>  	__must_hold(&common->flags_lock)

[Severity: Low]
At this commit, batadv_tt_local_set_pending() in
net/batman-adv/translation-table.c doesn't follow the new rule. It still
ignores the return value and always sets the PENDING flag:

net/batman-adv/translation-table.c:batadv_tt_local_set_pending() {
    ...
	__batadv_tt_local_event(bat_priv, common, common->flags | flags);
	common->flags |= BATADV_TT_CLIENT_PENDING;
    ...
}

This DEL path has two callers. One is batadv_tt_local_remove_entry(),
including the roaming DEL with BATADV_TT_CLIENT_ROAM. The other is
batadv_tt_local_purge_list() for timed out clients.

If the GFP_ATOMIC allocation in __batadv_tt_local_event() fails there,
the entry ends up marked PENDING, and possibly ROAM, with no DEL queued.
At the next commit, batadv_tt_local_purge_pending_clients() unhashes
every PENDING entry. So the removal is never announced to the other
nodes.

The silent loss of the DEL already happened before this patch. What this
patch adds is a kerneldoc rule that this caller breaks. Should the
kerneldoc name batadv_tt_local_set_pending() as an exception here, or
should set_pending check the new return value?

The next patch in the series, "batman-adv: tt: requeue DEL of pending
local entry after failed allocation", seems to fix both. It adds
tt_local->del_unqueued, which batadv_tt_local_set_pending() sets when
the DEL was not queued. batadv_tt_local_purge_list() then requeues the
DEL, and pending entries with del_unqueued set are not unhashed. That
patch also rewords the kerneldoc to say that the DEL of
batadv_tt_local_set_pending() is the only exception.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
