Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017770;
	b=B32ZrLyo5S7xvEdv39Pa3DglrQhxi55563E1Te/7pnEkCZLbG4HCfORdMZ5LsQ3vcq6b
	 kY1UNd4AsiJUB2Om1juDs7luKi0mVFBbxg5Wa79jBZbGzBtGprVXp+0VSLaGZjqeGWfOV
	 8/nIQOXVrA9dE7fzxf9lFGpHVvM5u4Zmm3o58mtmytVoD/QeTdqpEPCk2fmqyCp8bX5OS
	 ENjWoodwF9+erEQXe3X8eliHfakwc8gBMUC4y4/S8hOXmGrHwolGum6rBPWgAJXJBVWCv
	 DlmWBfyU2dy9pPJIZH5QsiO5jGFFdHfdlC6UG8RMtBPEzxO64nvH7GK4+yV8T2BfK3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017770;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=k+ywPOoxyIRE0762VgpC++bONbU5KOkMrgFuHVjqssU=;
	b=mE3QAPWNdvQITGlJxHBMlZ9BlgcK7K1xxYkur/Jns0+AwPVKIL+ukmMcRrZJccdU0tL+
	 Tpv1p9CmrHg6F3UJyXM67kki3qjb/s0mpdq24oXiaA5rIDB8ziKanahvIspQlHczrhDC/
	 7KYYdqOfi6RsIVtMTf3NTw/KVfHRlYYDBuAN4gx2iLE78aFIjnV1zGfkKmF4PK4BpB9y5
	 xw8IqQnw9LP4LMbYA1DJgRZICRqvmnLs7uq4n2Zvn+5HvVagADIBZN/Qta+9/p5hcMVdk
	 YQDx7Lk3NFV5RuatOd/WrnMh1eDIqAqKz1doj2qzwUxxFIgO30JFzESLtZA0sLcJsHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPMXYSTz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC34606A32C;
	Wed, 18 Nov 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPMXYSTz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2D31F000C4;
	Wed, 18 Nov 2026 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017770;
	bh=k+ywPOoxyIRE0762VgpC++bONbU5KOkMrgFuHVjqssU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gPMXYSTzeK5evgrWf/NWFhWIplV98gxFV+81ZGrZHrSia4dJ/2gVglexQBKDUHcOy
	 R/HkhVFyHBuSILCztiIrMk9HEHMXsBhyq7EI7WRRsBwB9SSmYxEapqeQARQlIufRCG
	 cCu1/Fnt+Rxa6ee9VqnKN7EtrZWmxZ0jBG8Yw44cehtvNizHuURi3Cacz+Fsgz+joC
	 ANyeEqW7SBUXresmJ7Oc9rCayjQbnQ6Ixd6z3OocLVZNPRRraBA1ltBFzPM5X/A858
	 bbdTRnPSfVUkioW+XFDBx0tfnBHXtjwaRKDykuXo18lMzOjsFTejWP8FZ4POjscOvC
	 HuEadPSBrb60A==
Subject: Re: [PATCH net v2 3/4] net: dsa: motorcomm: Read the port PVID
 instead of bridge's
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 16:02:49 +0000
Message-ID: <179501776964.3136.5754222174280606355@kernel.org>
In-Reply-To: <20261116160107.1351198-4-mmyangfl@gmail.com>
References: <20261116160107.1351198-4-mmyangfl@gmail.com>
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

- [Low] Besides swapping the bridge master (dsa_port_bridge_dev_get())
  for the bridge port (dsa_port_to_bridge_port()), the patch also…

--

net: dsa: motorcomm: Read the port PVID instead of bridge's

This patch changes the yt921x driver so br_vlan_get_pvid() is called on
the bridge port returned by dsa_port_to_bridge_port(). Before, it was
called on the bridge master, which returned the bridge's own PVID. The
change covers yt921x_vlan_filtering(), yt921x_dsa_port_vlan_add() and
yt921x_dsa_port_vlan_del().

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index 863ebb6c31984..d84d863080ce0 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -1102,16 +1102,16 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
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

[Severity: Low]
Besides the switch to dsa_port_to_bridge_port(), this hunk also changes
the condition in yt921x_dsa_port_vlan_del() from "pvid == vid" to
"!pvid". The commit message only says:

  "Query the PVID from dsa_port_to_bridge_port() instead."

Could the changelog mention this condition change too?

The del path now checks whether the port has no PVID at all. Before, it
checked whether the deleted VID was the PVID. The new check works
because the bridge clears vg->pvid before it sends the switchdev delete
notification:

net/bridge/br_vlan.c:nbp_vlan_delete()
    __vlan_unpublish(vg, v);
    synchronize_net();
    ...
    __vlan_del(vg, v);

__vlan_flush() also clears vg->pvid before it deletes each VLAN.

yt921x_dsa_port_vlan_add() still uses "pvid == vid". That is correct,
because in nbp_vlan_add() the switchdev add notification is sent before
__vlan_flags_commit(), so the driver still sees the old PVID. The two
handlers now use different checks, though, and nothing explains why.

Since the patch carries a Fixes: tag and may be backported, would it be
worth saying in the changelog why the two checks differ, and that the
del path depends on this ordering in the bridge?

The changelog also leaves out the user-visible effects being fixed.
Deleting the bridge's own PVID VID from a port cleared that port's real
hardware PVID. Toggling vlan_filtering programmed the bridge's PVID into
every port. Could these be described too?

>  				res = yt921x_pvid_clear(priv, port);
>  		}
>  	} while (0);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116160107.1351198-1-mmyangfl%40gmail.com
