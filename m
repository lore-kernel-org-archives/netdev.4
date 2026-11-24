Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485516;
	b=Oqz8uLY2OXUOwhBCrJWLICUMisoJOrUcerL1BR9a8e8+7U9O3x1os0HxEtNTwuE1yESq
	 OhxmTpyvlfdE9MB3iRe0xroQgqbKlL5PpaOyN4XD3bLsEixf6cRSbX06NVJs8Nti4eI/p
	 kF+87jXeHanAL485VjlOzqwQwtufcNKaIUJDyZndnxpClHGP+QViVlv+jHgts5GXLvMFI
	 ZsORnGHmN0lb2U2SZJLyOBtoYgUzoHuTTouVTPCI0unTS1FUdZVYazjnK2cUo1Jdn7kPS
	 ZvKpNDl37QBHwpxuV8ZUinH16JslpPbEHmYWADLnHYEacGpvsvpD5mWFesn8EPNi5ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485516;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=x9dCxxVeI1e5hPeiBhDom4pt4jpE4Lz80MrJvu1yG6M=;
	b=S3ckRPwwaCT25m8fYmPrb3j60lpUEI8i/LuIkWzIqQfCpd3X839CjHq7ER0lUkJkhUPU
	 yjyduVv5i776Q95Vg5L4wxCaRLwhC5h0Zl0kw7w7Ib7dVAzIcj6VnWPKnl+rpNy4fhhQa
	 oNtpwDb3BKT0+iGlefe8SufuEu1EOoGvmN6uhSwkDhZU0xoWw2UY1NcSSSfk8qNay/6bQ
	 R7iDoRoRaI7gkFp5RG1NDBSaAJuHKS8480rfOaY5crDdgzvCtAH2O5bimxdVFL2vq5vuW
	 ddoCWhTvz5iKL8yy3KLzxB4nU3kf/+B8aRsorOAs/pbo6B5eb6oAZ1Oq768kPKeVRKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfHfljj1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D5606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfHfljj1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356D31F000CA;
	Tue, 24 Nov 2026 01:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795485516;
	bh=x9dCxxVeI1e5hPeiBhDom4pt4jpE4Lz80MrJvu1yG6M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QfHfljj11JoUFmXqpbpeJvLBOqMyIWxxKeqNphmH5NVAEVK75s4rLUvmXsTe8bMZG
	 trZBlQYuRxHT2P1ObkAlu9mPmxhqjlGCyJI3cIf9ukFi4aXGxLuNrw47spK+gmVGk7
	 2uv5DdTmaMqFRsNq/snU5dWtNKu+KMChm7hTXtL8PjR81glYYwe2PzvqZNJWwZIIpV
	 EIx0V79Tv3qM0Hk+vTOrqR/VOzqi4eVPdTaLX12Fx08mmMggMtVYXmtUBQPp32Kac5
	 2nepMlqUkrNjDSVCCTGB6rnV0wNwUd84lk1SlhwcvzBvcxM8qpD/fPZmBRaki4kpCe
	 x747AEaTvf7yw==
Subject: Re: [PATCH net v4 3/5] ptp: ocp: preserve disabled SMA inputs across
 driver rebind
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com
Date: Tue, 24 Nov 2026 01:58:34 +0000
Message-ID: <179548551472.3135.11972018356692852897@kernel.org>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-3-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-3-ahmadexp@gmail.com>
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

- [Low] The commit message describes an ADVA X1 failure that no longer
  exists in the tree this patch applies to.
- [Low] The Fixes: tag is incomplete.

--

ptp: ocp: preserve disabled SMA inputs across driver rebind

This patch makes ptp_ocp_dpll_frequency_get() substitute SMA_DISABLE for
disabled inputs, so the None entry reports zero Hz. It also recovers the
disabled flag from the mux enable bits in ptp_ocp_sma_fb_init() for
direction-configurable connectors, so a disabled input stays disabled
across a driver rebind.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179538006912.3135.16971430532149423594@kernel.org

> Disabling an SMA input clears its mux field. Zero is also the selector
> for 10 MHz on FB and ADVA, so a DPLL read reports 10 MHz while sysfs
> reports None. The DPLL core then skips a 10 MHz request as unchanged,
> leaving the input disabled. ADVA X1 has no zero selector; its disabled
> input instead fails the frequency lookup, blocking DPLL reads and later
> frequency changes.

[Severity: Low]
Does the ADVA X1 part of this description still hold for the tree this
patch applies to?

The previous patch in this series, "ptp: ocp: handle hardware selectors
and combined DPLL input routes", changed ptp_ocp_dpll_frequency_get().
An input that fails the exact match now falls through to the
combined-destination loop instead of returning -EINVAL:

drivers/ptp/ptp_ocp.c:ptp_ocp_dpll_frequency_get() {
    ...
	if (sma->mode == SMA_MODE_OUT)
		return -EINVAL;

	/* Inputs can feed several destinations, including timestampers. */
	*frequency = 0;
	for (i = 0; tbl[i].name; i++) {
		if (!(val & tbl[i].value))
			continue;
    ...
	return 0;
}

For a disabled ADVA X1 input, ptp_ocp_sma_store_val() has written 0 to
the mux, so val == 0. No entry in ptp_ocp_adva_x1_sma_in has value 0, so
the exact match fails. The loop then matches no bits, and the function
returns 0 with *frequency = 0. So the DPLL read succeeds, and
dpll_pin_freq_set() is not blocked.

With this patch, val = SMA_DISABLE matches the None entry, which gives
the same 0 Hz result. On ADVA X1, the new frequency_get hunk does not
appear to change anything visible. Only the rebind recovery in
ptp_ocp_sma_fb_init() has an effect there, since ocp_adva_x1_sma_op also
uses ptp_ocp_sma_fb_init.

The description matches the original 09eeb3aecc6c code. Could the
changelog say what this patch changes on top of the previous patch in
the series?

> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

[Severity: Low]
Should this also have a Fixes: tag for b2c4f0ac53f3 ("ptp: ocp: Add
ability to disable input selectors.")?

The init-time recovery in ptp_ocp_sma_fb_init() fixes a lost disabled
state that goes back to that commit. It added the software-only
sma->disabled flag and the SMA_DISABLE substitution in
ptp_ocp_sma_show(). It also added this write in ptp_ocp_sma_store_val(),
which clears the SMA_ENABLE bit:

	if (sma->disabled)
		val = 0;

After a rebind with an input set to "IN: None", bp is freshly zeroed, so
disabled is false. For SMA1, for example, ptp_ocp_sma_fb_init() sees
BIT(15) of sma_map1->gpio1 clear and sets mode = SMA_MODE_OUT. Sysfs then
reports an output function for a connector with neither buffer enabled.
This happens without any DPLL involvement.

With only Fixes: 09eeb3aecc6c, stable trees that have b2c4f0ac53f3 but
not the DPLL ops commit would not be offered the rebind part of this
fix.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp%40gmail.com
