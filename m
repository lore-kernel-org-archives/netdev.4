Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540839;
	b=Fn/5ihBaFKNNFq5dicWDTym7MdmoIJN7twQF6VdmNUPZTnKg47EclKdScGRs0IQ0JqCQ
	 9TSI3rcCpylaiWH5Dtw+X+ZIv5FSYC1gCkrB7bjm019Y8P7gjYvm8c+oein45QG86IGc4
	 bV6oiC9EzO7Hpe1WqffZbFYhSdpFAXqKpxUnFhk6em02zlAqQtOVajhonwFOM8qza/k7Y
	 2re3g2QGYaFpGtObz7LelE1PyT2FWSi55rZ/PiKjcSo4L5CvwkMa2b4QAAUpS1M7EmfEZ
	 JMAgPx7+veCR/TD3+CkVRI6UquWJhDF3KJ++TJDm3XpayqOi4RNUdFRhmCiR+5adxxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540839;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FUK8eWr2NDwVWOIiPWW2mhsPXB2tXYeP2xK491Ae/Us=;
	b=4fjpRZzjtx76Ro49fXGta4Albim1L96ROuTcRaiqYYtzEq0jhV6y0Hq1ut5bKUFTU9Dm
	 rI01leSwsMfSVHglgNuaqkdJZtYTWcAFCXvdAhhY/LC77GVhd1ylttpT+oFC/1mfcdIm2
	 Z8Mk435ku3vVXW/zRueG2zKSVPLYmhxlokHlIbc0lXvvEgXRxClKvS8tUX+MRkFMgAt6R
	 tWC1AVxr+mINB5Pd0yABpe90XOKMlLxTalHiRe4S/nf+u2a8px2Rh9v6memalEhyGod6f
	 x0fMOrvqMYQjyesvUlIi4cadHAblk6dkTYmG18VHibIeMWXTGQeXR0WsUlzPUCKRgwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOsFhM4I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7BD606A329
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOsFhM4I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83E71F000D2;
	Tue, 24 Nov 2026 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540839;
	bh=FUK8eWr2NDwVWOIiPWW2mhsPXB2tXYeP2xK491Ae/Us=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aOsFhM4IzJ/6vH5lymBfEfHvbRwNjxJ9y7HK+CRJ1dFcu/bP9p2hWaq4r/YCx4F3+
	 u7qu12tcuWPd/H41TbsLiousWPl7hUoqFW1IQhM49qkL994Z+uxlxartH4MGCJOA2j
	 97bNJ25PUWbU1l0sfIbW+DHwsER8eXv6HySxNamQ0VVitotkFTER66BpGoTEwDYi1/
	 IGHn9ZH31hBeqG/yYTlnVdMrKg8cHIoIiW2a4mjFwPOvUsVdsdZY1g5270Sto09Rn7
	 BidzR1OxLsZ2X6aoQ1AJOWivIN89y/p1bqrIgnD2llz6ygQC9Pldnl8aS0hh+AfhKA
	 ygzrrNNljLRZw==
Subject: Re: [PATCH net-next 04/15] batman-adv: bla: register own backbone gw
 when claiming for local node
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:38 +0000
Message-ID: <179554083850.3135.5611010478427382077@kernel.org>
In-Reply-To: <20261123171827.3294525-5-sw@simonwunderlich.de>
References: <20261123171827.3294525-5-sw@simonwunderlich.de>
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

- [Low] The commit fixes a real BLA bug that users can see on the LAN,
  but it has no Fixes: tag.
- [Low] The commit message says the own backbone gateway entry may be
  missing "for example due to an earlier error".

--

batman-adv: bla: register own backbone gw when claiming for local node

With this patch, batadv_handle_claim() passes own_backbone=true to
batadv_bla_get_backbone_gw() when the backbone address is the primary
interface address. Before, an own backbone gateway entry created on the
rx claim path was set up like a foreign one. No initial announcement was
sent and the UNSYNCED grace period was skipped.

Closes: https://sashiko.dev/#/bug/linux-dba9d95d-5eeb-40fd-abf4-e054aee1f735

> When no backbone gateway entry for the local node exists yet on this VLAN
> (for example due to an earlier error), the entry is therefore created like
> a foreign backbone gateway.

[Severity: Low]
Is "for example due to an earlier error" the usual way to reach this state?

In batadv_bla_rx(), batadv_handle_claim() is called with the primary
interface address before batadv_bla_update_own_backbone_gw() runs at the
allow label:

net/batman-adv/bridge_loop_avoidance.c:batadv_bla_rx() {
    ...
		batadv_handle_claim(bat_priv, primary_if,
				    primary_if->net_dev->dev_addr,
				    ethhdr->h_source, vid);
		goto allow;
    ...
allow:
	batadv_bla_update_own_backbone_gw(bat_priv, primary_if, vid);
    ...
}

batadv_bla_update_orig_address() also purges every backbone entry when
there is no old primary interface or BLA is disabled:

net/batman-adv/bridge_loop_avoidance.c:batadv_bla_update_orig_address() {
    ...
	if (!oldif) {
		batadv_bla_purge_claims(bat_priv, NULL, 1);
		batadv_bla_purge_backbone_gw(bat_priv, 1);
		return;
	}
    ...
}

This runs when the primary interface is selected and when BLA is toggled
through batadv_bla_status_update().

After bring-up or a BLA toggle, the first frame on a VLAN received from
the mesh with an unclaimed source (or a unicast source claimed by a
foreign gateway) seems to create the own entry through
batadv_handle_claim(). That happens in normal operation, without any
earlier error.

Could the commit message say that this is the normal startup path? Stable
maintainers would then have an accurate picture of how often the bug
occurs.

> diff --git a/net/batman-adv/bridge_loop_avoidance.c b/net/batman-adv/bridge_loop_avoidance.c
> index 68ff2f94cf49d..3da070a087da6 100644
> --- a/net/batman-adv/bridge_loop_avoidance.c
> +++ b/net/batman-adv/bridge_loop_avoidance.c
> @@ -986,18 +986,22 @@ static bool batadv_handle_claim(struct batadv_priv *bat_priv,
>  				unsigned short vid)
>  {
>  	struct batadv_bla_backbone_gw *backbone_gw;
> +	bool own_backbone;
> +
> +	own_backbone = batadv_compare_eth(backbone_addr,
> +					  primary_if->net_dev->dev_addr);
>  
>  	/* register the gateway if not yet available, and add the claim. */
>  
>  	backbone_gw = batadv_bla_get_backbone_gw(bat_priv, backbone_addr, vid,
> -						 false);
> +						 own_backbone);

[Severity: Low]
Should this patch have a Fixes: tag?

The false argument replaced here came from commit 52aebd6a9fe4
("batman-adv: send announcement when backbone gw is registered"). That
commit's message says the announcement should go out as soon as a
backbone gw is added, for example when "a packet passes the rx or tx
path". This rx call site never passed own_backbone=true, though.

Commit d807f2728708 later added the UNSYNCED/num_requests hold-back. It
sits in the same if (own_backbone) block in batadv_bla_get_backbone_gw(),
so this call site skipped it too.

Would something like this work?

Fixes: 52aebd6a9fe4 ("batman-adv: send announcement when backbone gw is registered")

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
