Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050202;
	b=lLMxKqLkOvERo1CkNNOWhsEKsEsS+1xHG/zhXtXuOBvQlnw+tVHQ5MIwdrsqx9XePJ3E
	 +VylBdzjEOrH9gPGdI8sp2RIoVvMXowEzd1Fucors4L2Qoi6Y2jIEsC3ImIJn52ZY18/x
	 xku/cHaRx41Qobhu4wIoTnpFXfJT7ODlr6cYLlBfz+fomhRcbOb2hbrQhx0ih7qjJP60D
	 l7OpFvOFAb2yI3wP2VoOzkeuZqP0Z/FBJ2YljLFGCmscFBvuN3Gt76HYEjPL+ga97c0K6
	 ZV1fy+MISkldgdz7wEEAUhvPCKHnE1T+6mz/pXZUDtRDA4j9Anz+LcMoRMj99ivyeOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050202;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yj8w3KZ+9k9eyPUUUCjfHPBSRxLysZwBaI+r7y6xQCY=;
	b=2pFbqs7K8p+irnDBlSmyZfYYOA5hO0dhGW8+TXY7l4otjrQnJpHibhhIfl1LYAvST6AQ
	 Dq/JSyOsplSY32KWAoghj3+JtGOkYaPaY8+GXwiexq023LOHmzL4fqGxjlCKEPg6rSMhb
	 0mN5AOylQ/UDkr2f7r9e1+b9tO3goHdjxAw5YXyCioamsjHOCoyIA4Rqi9wKBOHjqTzCj
	 XhxKDKha6kxAX4FwHDznvl+n31DQkpzJbgFZ7kWZS4NRKhhz/E/NAocYrx88SHV20ui2H
	 Zgapnm2YKbkvKveB7jyp3u6cLpsR/TO+AechXoxGNE42R116SNR2Jnc8jSfZ0/mGF+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlEKYU3t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E797606A31C;
	Thu, 19 Nov 2026 01:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlEKYU3t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164451F000C4;
	Thu, 19 Nov 2026 01:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050202;
	bh=yj8w3KZ+9k9eyPUUUCjfHPBSRxLysZwBaI+r7y6xQCY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AlEKYU3tCPhT+g7iRyEC2mBGoDnkAz/uM+yApRkV1+DzFOFaqWerDObQ01qh33VmI
	 h2HRMCgQp7bRw5SXMV2cxhpooacuralLXEaxhB3CK+dakDGpvJSC55/tdLKejSbZ2O
	 O67Q488ixgLLhyXIpoA3qOX5bg575g3uQrZF8I6IBH/HDVrvWcI/17oWagEkLEsdPh
	 gUME5kdh2IOpKST72CttO0g+HOGqpLN1FZAEKMsG8RTQKELMKnWHxgjQL//9vMhl8e
	 DGA0eeoSEU3oYwJVR/8vbvpv8knsJj2vzUrIi55PNprFxLuHXuLye9eLaTpTFU+n9g
	 Dz8iBYQtdHWLg==
Subject: Re: [PATCH net-next v3 1/3] net: dsa: microchip: ksz9477: apply a
 shorter ageing time at once
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, arun.ramadoss@microchip.com,
 jiri@resnulli.us, linusw@kernel.org, f.fainelli@gmail.com,
 vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 jensemil.schulzostergaard@microchip.com
Date: Thu, 19 Nov 2026 01:03:20 +0000
Message-ID: <179505020064.3136.4475163541276513628@kernel.org>
In-Reply-To: <20261117-ksz-stp-ageing-v3-1-135de6b9f8ad@pengutronix.de>
References: <20261117-ksz-stp-ageing-v3-1-135de6b9f8ad@pengutronix.de>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix depends on a fixed Fast Aging pulse length
  (KSZ9477_FAST_AGE_PULSE_US = 2 ms, ksz9477.c:1293) that was found by…
- [Low] ksz9477_set_ageing_time()
  (drivers/net/dsa/microchip/ksz9477.c:1359-1371) now pulses the switch-…

--

net: dsa: microchip: ksz9477: apply a shorter ageing time at once

This patch makes ksz9477_set_ageing_time() pulse the switch-wide Fast
Aging bit in REG_SW_LUE_CTRL_1 when the programmed ageing time gets
shorter or the Age Count gets smaller. Without the pulse, stale FDB
entries outlived an STP topology change on a KSZ9893. The bit is held
for a fixed 2 ms and then cleared.

> diff --git a/drivers/net/dsa/microchip/ksz9477.c b/drivers/net/dsa/microchip/ksz9477.c
> index 8d4647e23cda1..972703fe7454f 100644
> --- a/drivers/net/dsa/microchip/ksz9477.c
> +++ b/drivers/net/dsa/microchip/ksz9477.c
> @@ -1289,13 +1289,16 @@ static void ksz9477_phylink_get_caps(struct dsa_switch *ds, int port,
>  	ksz_phylink_get_caps(ds, port, config);
>  }
>  
> +/* The datasheet gives no pulse length. A 2 ms pulse worked on a KSZ9893. */
> +#define KSZ9477_FAST_AGE_PULSE_US	(2 * USEC_PER_MSEC)

[Severity: Medium]
Is a fixed 2 ms pulse enough on every chip in this family and for every
stored Age Count?

The value was found by trial on one KSZ9893, where the entries stored Age
Count 4. Each ALU entry holds a 3-bit stored age count
(ALU_V_PRIO_AGE_CNT_M, decoded in ksz9477_convert_alu()). That count is
copied from SW_AGE_CNT_M when the entry is learned or refreshed, so it can
be as high as 7.

The pulse matters most when the old count (mult) was larger, and that is
exactly when entries hold the highest counts. One example: 1785 s
(7 x 255), then an STP topology change to 8 s. That gives data = 1 and
triggers the pulse.

Suppose Fast Aging here speeds up ageing rather than purging the table at
once. Could entries with stored counts 5 to 7 then survive a 2 ms pulse?
The same question applies to the other chips that use ksz9477_switch_ops
(KSZ9477, KSZ9897, KSZ9896, KSZ9567, KSZ9563, KSZ8563, LAN9646 and so on).

ksz9477_set_ageing_time() sets SW_FAST_AGING, sleeps, clears the bit and
returns 0. It never checks that the dynamic entries are gone. If they
survive, the stale FDB after a topology change would still happen, and
nothing would report it.

The KSZ8995XA path in ksz8.c describes an "800 us fast-age cycle", which
hints at sweep behaviour. It doesn't show how the KSZ9477 family behaves.

[ ... ]

> +	old_secs = mult * old_period;
> +	new_secs = data * new_period;
> +	if (new_secs >= old_secs && data >= mult)
> +		return 0;
> +
> +	ret = ksz_rmw8(dev, REG_SW_LUE_CTRL_1, SW_FAST_AGING, SW_FAST_AGING);
> +	if (!ret)
> +		fsleep(KSZ9477_FAST_AGE_PULSE_US);
> +
> +	/* Clear the bit even after an error. */
> +	err = ksz_rmw8(dev, REG_SW_LUE_CTRL_1, SW_FAST_AGING, 0);
> +
> +	return ret ?: err;
>  }

[Severity: Low]
Can an ageing time change in one bridge now flush the dynamic FDB entries
of every other bridge on the same switch?

The value programmed here comes from dsa_switch_fastest_ageing_time(),
which takes the minimum over all ports of the switch. Before this patch,
one bridge could only shorten the ageing timer for the others, and entries
still in use kept being refreshed. With the pulse, entries still in use in
unrelated bridges are removed too. Their unicast traffic floods until the
addresses are learned again.

Nothing limits the flush to one bridge or limits how often it runs. Here
are two ways to trigger it again and again.

With kernel STP, __br_set_topology_change() lowers the ageing time when
received BPDUs or TCNs set TC, and restores it when TC clears:

net/bridge/br_stp.c:__br_set_topology_change() {
    ...
		if (val) {
			t = 2 * br->forward_delay;
    ...
		} else {
			t = br->bridge_ageing_time;
    ...
		err = __set_ageing_time(br->dev, t);
    ...
}

For example, 300 s (4 x 75) -> 30 s pulses. Going back to 300 s
(2 x 150) does not. The next TC (30 s = 2 x 15) pulses again, so every
TC on/off cycle causes one switch-wide flush.

DSA user ports are not netns-immutable. A CAP_NET_ADMIN holder in another
netns that owns a bridged switch port could toggle IFLA_BR_AGEING_TIME.
Each toggle would flush the FDB of bridges owned by the host or by other
tenants. The same happens when a port joins a bridge with a shorter
ageing time, since the attribute is replayed on join.

The commit message says Fast Aging is a control for the whole switch.
Was the effect on other bridges sharing the switch intended?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-ksz-stp-ageing-v3-0-135de6b9f8ad%40pengutronix.de
