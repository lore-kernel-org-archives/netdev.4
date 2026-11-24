Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540838;
	b=xBYL7HUWeeV2EfWUHg35izN851UGO8hOSzeBSTFNHBQvOMgXLby3Rem2FaIhHP9YNz7P
	 kfQ6sgvOx+XLPJOHi8veISaUHENi2pwwZrJW+8c1Jux5fGzlH9FZG0q6pGMhegMcX0Rnp
	 mOSur5Mizpthl9xWHEJSPQqyQPgxwM8mbkoP9JRONJ5csPbhBN6IZRekjepX62lP+q0DT
	 wfihugjCgpN7/fWVyAYT2nCC9gVKh+VZDBUK7t1S4hFOx8MVmE0gzs5uegkZxeHz2P8bL
	 ucEShHWQH1unmgxFXAHQwK5TXCnYuWng9MsLXw7L4B/r1nG61XqMmJRODMnthGu1ffg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540838;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=X8JHW0SkUZKnUVH13i74k2v1LzOsJddb26647MR2yus=;
	b=mkmREoHmDQUQiXEYuZn/SEC7zuZ8zFQs7l2M2A4FIwu3kfeU2Ae7vLlUpOfJr0fpqlh3
	 BWs1RtLqEY0RUrVyoaQOJi617GNPQMa9wfTSShlFFEOUcktWgaRATlkeFH14J5DalKJyW
	 qzQMZ/fvUDrsGotOWbD4evW0HAwxX3DPfoNI+ola/2ev8wl5j40HzTlWlcJFh8krXpAkk
	 nCqiE6HY26iv77XULOT0cVQTopFTb6x0YAb8eN+apdYCUIyTko0N2DfTAnpGs21Za7cSh
	 cW1mQ/kZo0PB/gKlKHRDfzUM7NwiZPTj1gtz0gaA0xaKVndju0EalKI0M17wHPz55rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlQlFrxo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CC606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlQlFrxo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76A01F000E6;
	Tue, 24 Nov 2026 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540838;
	bh=X8JHW0SkUZKnUVH13i74k2v1LzOsJddb26647MR2yus=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AlQlFrxoaSA6KFjAOJaJxy9YUcC3gMUpEl3ef3axLSRwEjE5gr6YnZ+TWs6OKLGRN
	 2vQUfj1tyzROl7BsEngwdRKBbCjEIXmw1VokiPedLHjCyhYNNpJc4nT7SzaDutNFgb
	 ONZCoty29WNi2NiVn82ZIj6pcPrX79s4xAOoDTrkX8PbE4hQ7n1L/Z9YMqTYnG6yeC
	 ojxMi4MsbYPp+NLWW3czyaw281I93kxKuT/Geg5In4jC6ndRhOsqUizGSyX+Yz//Z4
	 ouRQt5iM1GR4FWsDnfEz3f5CyIfIM82KM8MHKEthVVmaPgkUk1GG05S6kfIxinbFda
	 rpiFMKY899NzQ==
Subject:
 Re: [PATCH net-next 01/15] batman-adv: document refcount of returned objects
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:37 +0000
Message-ID: <179554083742.3135.4885971613759489815@kernel.org>
In-Reply-To: <20261123171827.3294525-2-sw@simonwunderlich.de>
References: <20261123171827.3294525-2-sw@simonwunderlich.de>
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

- [Low] The commit message does not match the diff.

--

batman-adv: document refcount of returned objects

This patch adds a kerneldoc note to the batman-adv lookup, get and create
functions that return an object with an increased refcounter. For
batadv_transtable_best_orig() and batadv_mcast_forw_orig_entry(), it notes
the opposite: the returned object is only borrowed within the caller's
RCU read-side critical section.

> Add a note to the kerneldoc of the __must_check functions that return an
> object with an increased refcounter and did not document this yet. For the
> exceptions:

[Severity: Low]
This isn't a bug, but the commit message doesn't quite match the diff.

Earlier, the message gives "(with increased refcnt)" as an example of
wording that already documents this. The diff then removes that wording
and rewrites it in batadv_gw_get_selected_gw_node(),
batadv_gw_get_selected_orig(), batadv_hardif_get_by_netdev(),
batadv_primary_if_get_selected(), batadv_orig_hash_find() and all of the
netlink.c getters.

The same happens to "with an initialized reference counter" in
batadv_tt_local_create() and batadv_tt_global_create(). It also happens to
"it with an increased refcounter" in batadv_tt_global_orig_entry_find().

On the other hand, the other existing phrasing is left alone:

    * The object is returned with refcounter increased by 1.

It is still in batadv_orig_node_vlan_new(), batadv_orig_router_get(),
batadv_orig_ifinfo_get(), batadv_orig_ifinfo_new(),
batadv_neigh_ifinfo_get(), batadv_neigh_ifinfo_new() and
batadv_last_bonding_get().

So the patch does more than add notes where none existed, but it also
doesn't make all of the refcount wording consistent. Could the commit
message say that existing refcount wording is being rewritten?
Alternatively, could the remaining "increased by 1" comments be converted
too, so the wording is consistent?

> diff --git a/net/batman-adv/gateway_client.c b/net/batman-adv/gateway_client.c
> index e6e97c0478cc4..0dddcea7def9d 100644
> --- a/net/batman-adv/gateway_client.c
> +++ b/net/batman-adv/gateway_client.c
> @@ -74,7 +74,8 @@ void batadv_gw_node_release(struct kref *ref)
>   * batadv_gw_get_selected_gw_node() - Get currently selected gateway
>   * @bat_priv: the bat priv with all the mesh interface information
>   *
> - * Return: selected gateway (with increased refcnt), NULL on errors
> + * Return: selected gateway, NULL on errors.
> + * The returned object has an increased refcounter.
>   */

[ ... ]

> diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
> index f9de255ef0dfd..216f41387afa7 100644
> --- a/net/batman-adv/translation-table.c
> +++ b/net/batman-adv/translation-table.c

[ ... ]

> @@ -962,8 +965,8 @@ static bool batadv_tt_local_add_existing(struct batadv_priv *bat_priv,
>   * as BATADV_TT_CLIENT_NEW to avoid sending it in a full table response going
>   * out before the next ttvn increment (consistency check).
>   *
> - * Return: the new entry with an initialized reference counter on success, NULL
> - * otherwise.
> + * Return: the new entry on success, NULL otherwise.
> + * The returned object has an increased refcounter.
>   */

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
