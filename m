Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471869;
	b=ylNPcqjRwsJyndGkQsgeu1JppXhtiNWuhaTDF7CEwZHsvp4lMkZPiMF5Oj3piJ5ZA+Vc
	 GFcw7aaQOYGRnmCV0XxA2ojMRF7xOcUqhG4WYHsH3lDvQggxrnhXSZGZxCpZr5Eiza6f7
	 8ZDmpSpZ72QVvEMN0nH5w72BcGKzDSxzFCafrYn+iFdqXzFvXO6rUSOKC/EeWSpd9KoVx
	 3Hwhusz9B3XrTeV6yxoBZ0zorjj4LxILKL1bojFdXtT1VjAr3bTnJuVZ51menrnn2zhpq
	 Ywu5gTOYEmKth7h2CwhMGre/7Tpf2TX6uRMqPqiDlIUBVinAIZUvM7EaEhcuOJjBfIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471869;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=x6ZqSfzRjjAmVKqVyPGFNCPQcXcs73a02u9pSUR40hc=;
	b=lZkB90dqqG6pOhCUm1n4tU8ofl0XIDqx181AoPhSTWQJrYdjV2/vDPNdZDWmVKc1Gjad
	 D2YgIYXUbWejF3lLbPzovILvcAM6hrwb0+VEbHOKlYrM66z1UCpqDaIBN0CSlLoajxaod
	 VTtoyMmIARkLLGve8UB347wP1wbaO6bYCbSJprrFZJVW7ckCoG/iDMEcTpM6wvYcWZ7kf
	 fUt3B0TjIyYbZl6Kfm/PrnLG2VGjugs7D86Pov+Y/4S6nobGL9dJ6hBv4UtYz+MF8CIAp
	 MJvaqsShXkIqosd9020oXkRhBNnAJ0xUGDFVzK3KzPrlpyvPjEv0h8sb23fe73gATQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKYvw58+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19B606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKYvw58+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEC31F000CF;
	Mon, 23 Nov 2026 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471869;
	bh=x6ZqSfzRjjAmVKqVyPGFNCPQcXcs73a02u9pSUR40hc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mKYvw58+Z4DiYVMomPtQBpo6WMYxlqOgnkAq/B+HqBSVFNAbZ8L/in1BcV1zvfoqg
	 /Cg6+XWddb2PQ5EmUiWb+PG9EzpgKzz7JuE148Vn4tOdGXrd6haeovCElShQJnkwYp
	 TsclNybt7ajImQRM2/hm6x9Tx68kCQMiNM6iERnAtBOkBFNhpOcmrOwUOAJPIm29tJ
	 5wg7wAbBPwu7hx5ER3h89ERP/kHNz5CBgjWhoQvztoPHdwvtI0SEHZ+qQQFOwNoUYz
	 9x6tpitDVAP51xH9YEu6+x2T0Sr8x5/VJY59fnjxiDqLLVgEQyVuXlXeaGMulgAlhk
	 dbBnZ7A5zHvuA==
Subject:
 Re: [PATCH net] net: dsa: motorcomm: Read the port PVID instead of bridge's
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Mon, 23 Nov 2026 22:11:08 +0000
Message-ID: <179547186823.3135.2900984240867917348@kernel.org>
In-Reply-To: <20261119220949.1123168-1-mmyangfl@gmail.com>
References: <20261119220949.1123168-1-mmyangfl@gmail.com>
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

- [Medium] yt921x_dsa_port_vlan_del() (drivers/net/dsa/motorcomm/chip.c)
  now only touches the hardware PVID when br_vlan_get_pvid(brport)…

--

net: dsa: motorcomm: Read the port PVID instead of bridge's

The yt921x driver used to query br_vlan_get_pvid() on the bridge master.
This commit makes it query the bridge port returned by
dsa_port_to_bridge_port() instead. In yt921x_dsa_port_vlan_del() it now
clears the hardware PVID only when the bridge port has no PVID left. The
commit message says this works because the bridge unpublishes the PVID
before sending the del notification.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index c753c746490a1..b12bf32f8896c 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -1098,16 +1098,16 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
>  	mutex_lock(&priv->reg_lock);
>  	do {
>  		struct dsa_port *dp = dsa_to_port(ds, port);
> -		struct net_device *bdev;
> +		struct net_device *brport;
>
>  		res = yt921x_vlan_del(priv, port, vid);
>  		if (res)
>  			break;
>
> -		bdev = dsa_port_bridge_dev_get(dp);
> -		if (bdev) {
> -			br_vlan_get_pvid(bdev, &pvid);
> -			if (pvid == vid)
> +		brport = dsa_port_to_bridge_port(dp);
> +		if (brport) {
> +			br_vlan_get_pvid(brport, &pvid);
> +			if (!pvid)
>  				res = yt921x_pvid_clear(priv, port);

[Severity: Medium]
Does the claim that "the bridge unpublishes the PVID before the del
notification" hold for every path that reaches this function?

It holds for nbp_vlan_delete(), which calls __vlan_unpublish() before
__vlan_del(). The rollback path in __vlan_add() in net/bridge/br_vlan.c
looks different.

Take a port that already has PVID Y, and a new VLAN X added with
BRIDGE_VLAN_INFO_PVID. __vlan_vid_add() sends the switchdev add first,
so yt921x_dsa_port_vlan_add()->yt921x_pvid_set() writes X into
YT921X_PORTn_VLAN_CTRL and clears CVLAN_DROP_UNTAGGED.

Several later steps in __vlan_add() can still fail:
br_vlan_add() on the master when BRIDGE_VLAN_INFO_MASTER is set,
br_vlan_get_master(), the per-port stats allocation, br_fdb_add_local(),
or rhashtable_lookup_insert_fast(). Any of these failures leads to:

net/bridge/br_vlan.c:__vlan_add() {
    ...
out_filt:
	if (p) {
		__vlan_vid_del(dev, br, v);
    ...
}

On that path __vlan_flags_commit(v, flags) never ran, so vg->pvid still
holds Y when the del notification reaches the driver.

In that case br_vlan_get_pvid(brport, &pvid) returns Y. Y is non-zero,
so yt921x_pvid_clear() is skipped and nothing else rewrites the PVID.

Would the hardware then keep PVID X, a VLAN the port has just been
removed from, while the bridge reports PVID Y? On a VLAN-filtering port,
untagged ingress would be classified into X and dropped by
VLAN_IGR_FILTER until the PVID is reprogrammed, for example by a
vlan_filtering toggle.

The old pvid == vid comparison had the same gap here. The new !pvid check
depends explicitly on the unpublish ordering, though, and this path
breaks that assumption.

Could the del path re-sync the PVID instead, along these lines?

	pvid ? yt921x_pvid_set(priv, port, pvid) :
	       yt921x_pvid_clear(priv, port)

>  		}
>  	} while (0);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119220949.1123168-1-mmyangfl%40gmail.com
