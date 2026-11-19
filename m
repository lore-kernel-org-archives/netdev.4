Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050203;
	b=bOxnLuflL2+bsQSfYsYNJgLmDGwj0XO3zF7qIBZfPTjdojEjMfolO7T2zjwbzGIYmXHI
	 PYt6YgXZRy/3Wetkn7zfepidTp0ENJjWPIosejVE4TaZTesTQsx+RYsvrf898g/bu9Ysz
	 HYuJ1MaZV0ewzvzk7hrvM6EoyPo4vvacqHTdQiCFIw0M1jpn8VpX7CiCB1MKGdgGYOcUW
	 Qi5CdOqGbMxAVSyOCZngiq1XvIE5sZAfG/mFZ8PWKsXuePw54cikho/kq1TOuatIkNgW2
	 9K6+D//q6wauM4BUQ+uxGA7a4CZPhzsbBRQr7CcP3K5uzpthtdA6J4sOF/QnSeGIIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050203;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1R80DB8vNXXSBxqgpip9NisgaUs3vCCTC7Eim9o0R9A=;
	b=3YEKNRT3WNbbDisVXdNlQrGOCicac4cVTL/tiU78YqgsQb5t2tgRAxjPuw3xztQAebfr
	 smicU7F4zcLokltePZLcnH6rnSq0R9IuRdWnce56eY6bhoSUsF/vrhJX5oVH12suWmYj4
	 Fid4r5BAMmXzt7X+woeZdm/QXTMzxrupTE1mwpCWt6hpSJHe4JIjgFVIfVyXMfwYRWTkP
	 9Z5y2gcg7fY9BkuBxgFarAT1z1MPqPDpwFGZzUdwoi7+gd83S1y9nv1P0FeGXVS4xEYgw
	 3YTA0DpNVajoG8Ny8CDzefW4Nwmg6peAwubJ5JLpjc2nY9SVvBjURL8+6SEhbvGFyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZExSz2Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82E606A32A;
	Thu, 19 Nov 2026 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZExSz2Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908A61F000C4;
	Thu, 19 Nov 2026 01:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050203;
	bh=1R80DB8vNXXSBxqgpip9NisgaUs3vCCTC7Eim9o0R9A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mZExSz2YWjwWp4w5eHni/X8lNP0Ppgik7DYvbEkR7SEYhRnPGiF5RkKTOKYA4Hqzw
	 z0fIkRGCu+ltiR8L16gOh1T1avqJJsArQutURwKHTHkdskJp0WkdJ2WqDSc5Ot4yq4
	 pIIMY1fP4LSMIPTXDNLPhQT9N8VrT7jy/JY5kcMSB3eiKL0vuYZx6Q+uzO7gNnb2Xt
	 myiALa7s9eZs1DdhhSS12LxxaD7k9+Nkd/HdWC+nRfn9WFa9Kner/nvfSyttspASge
	 oIKLF7JY/b3Jyj3l4cz5JkTwuIGtHoMfi2sm9mDNWQmIHyFc+KaJIcR+Jde9ojNB+Z
	 bWZhNHWAti1Uw==
Subject: Re: [PATCH net-next v3 3/3] net: dsa: forget the port ageing time
 when the port leaves the bridge
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, arun.ramadoss@microchip.com,
 jiri@resnulli.us, linusw@kernel.org, f.fainelli@gmail.com,
 vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 jensemil.schulzostergaard@microchip.com
Date: Thu, 19 Nov 2026 01:03:22 +0000
Message-ID: <179505020217.3136.6917391809574658393@kernel.org>
In-Reply-To: <20261117-ksz-stp-ageing-v3-3-135de6b9f8ad@pengutronix.de>
References: <20261117-ksz-stp-ageing-v3-3-135de6b9f8ad@pengutronix.de>
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

- [Medium] The fix is incomplete because nothing reprograms the switch
  when the port leaves.

--

net: dsa: forget the port ageing time when the port leaves the bridge

This patch clears the cached dp->ageing_time in
dsa_port_switchdev_unsync_attrs() when a port leaves a bridge. After that,
dsa_switch_fastest_ageing_time() no longer counts the departed port's
value when it computes the minimum. The aim is to keep the switch from
staying at a short ageing time (for example one set during an STP
topology change) after the port that requested it has left.

> diff --git a/net/dsa/port.c b/net/dsa/port.c
> index 15e7da20b0e2f..54c9709840952 100644
> --- a/net/dsa/port.c
> +++ b/net/dsa/port.c
> @@ -415,6 +415,12 @@ static void dsa_port_switchdev_unsync_attrs(struct dsa_port *dp,
>  	/* Ageing time may be global to the switch chip, so don't change it
>  	 * here because we have no good reason (or value) to change it to.
>  	 */
> +
> +	/* Forget the ageing time cached for this port.
> +	 * dsa_switch_fastest_ageing_time() skips 0, so this port no longer
> +	 * counts towards the minimum.
> +	 */
> +	dp->ageing_time = 0;
>  }

[Severity: Medium]
Can the switch still stay at the departed port's short ageing time after
this change?

This only clears the cache. Nothing on the leave path reprograms the
hardware. dsa_port_bridge_leave() ends right after
dsa_port_switchdev_unsync_attrs(). The only code that writes the ageing
register is dsa_switch_ageing_time() in net/dsa/switch.c:

net/dsa/switch.c:dsa_switch_ageing_time() {
    ...
	ageing_time = dsa_switch_fastest_ageing_time(ds, info);

	if (ds->ops->set_ageing_time)
		return ds->ops->set_ageing_time(ds, ageing_time);
    ...
}

That function runs only for DSA_NOTIFIER_AGEING_TIME. The only sender is
dsa_port_ageing_time(). It is called from the sync_attrs path at bridge
join, and from the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME handler, which
needs a port that still offloads the bridge.

Here is a sequence on a single chip, with br0={lan1} at 300 s and
br1={lan2} with STP enabled:

  topology change on br1
    __set_ageing_time(br1, 2 * fwd_delay)
      dsa_port_ageing_time(lan2, 8 s)
        programs min(8, lan1=300) = 8 s for the whole chip

  ip link set lan2 nomaster
    dsa_port_bridge_leave()
      dsa_port_switchdev_unsync_attrs()
        dp->ageing_time = 0;   /* no reprogram */

  end of the topology change on br1
    br1 restores 300 s, but br1 has no DSA lower port left,
    so no notifier is sent

lan1 in br0 would keep ageing at 8 s until br0's ageing time changes or
some port joins a bridge again. Would it make sense to recompute the
minimum of the remaining non-zero dp->ageing_time values on dp->ds and
program it here when the port leaves?

The existing comment just above the new code says there is "no good
reason (or value) to change it to". Once the cache is cleared, the
minimum of the remaining cached values is a usable value, so that
comment no longer seems accurate. The new comment also doesn't mention
that the hardware value stays unchanged until the next notification.

The commit message does cover part of this:

  "The switch gets the restored value only if another port of the same
  bridge is still in this DSA tree."

However, the problem the commit message describes, a switch stuck at the
departed port's short ageing time, can still happen through this leave
path when ports of a different bridge remain on the same chip.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-ksz-stp-ageing-v3-0-135de6b9f8ad%40pengutronix.de
