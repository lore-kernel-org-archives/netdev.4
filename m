Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427502;
	b=aTU1SiQfCLedlLD7u7khU36VIX/DnL/mo8OoPJCj0+4EZ0+tT1V05Gut2T7iK6mgyIxi
	 V/3FN/DFhL/NOiCOCaKzCEvuDZObMXKPy8xJ8PhXBqAYufegJaVGD8ek26s9+o4qYMC+W
	 q8peKcNYqzQ/ByNa4BOxlk0XhtcEk4A3uJcjOhLQL9Sk+q2ZmWHHF+uXxNWF+xs390r3q
	 R8cl9dIBDJFW9pVP8IIHTFi1m0GBSXXYKLjfimjgb475OatAQ6AcQ9cwI6MeI5NKBIoGM
	 OZzBTACNbyc9/9UxiEbmLM+fivq69Q5Y+o7oQDuPGzKN01JnY12SDFX6vF0gReMccVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427502;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EWLH4/KgFJL5xsg0WV/YVksEmEhqZi3FriwXVjKfdUo=;
	b=SDk9RATq1rXcpcG3iLmX4Qfovw5kV8XloO33eK83KSx8pmmX9lNzvwYgJ1YFD5wAC2Wj
	 hPS5MYxp0c9PCxCLr+qGaVrIVRW6kkB8YtdJNurRiNxlT9AefAPThfd0EOL8ytMTmT32L
	 RXfxaAczGecgQfT55YARzme1AHEazKaOWk9yuIMggG7DByG77Qsv8YrQYN15x4Vurfrbn
	 w88QuXBq8Sz6aUqz9s4j3+UhdpUAsCVvPuGdt6Syxt7vhhdFYwUU7YHP1bOnUueNvi4MA
	 JcCV9FQfOTcTiKvqtvX66kUA8XJkDN3zzxhyS1lH+yDKZgcW70JaoMfnKoZptxvvBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzM+9Dz8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EA606A33C;
	Mon, 23 Nov 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzM+9Dz8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78961F000F2;
	Mon, 23 Nov 2026 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427501;
	bh=EWLH4/KgFJL5xsg0WV/YVksEmEhqZi3FriwXVjKfdUo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WzM+9Dz87j3Eh6xCaJIW36vj/ZFXP9pttIH9pZVsxVLSYyBaLw47MJT7aGdT7m678
	 ZJXP3bD5Xf+CUFJqKSa6wW1/UPZ7d+uscwtqTOmlvVSu8nZZbAwp70c4L7zRpetxqC
	 EfIcJLyWDyDrgTAXitRVLHnkhRERPrCojrD9ymXyA7Iox0dvcQIuzKDVrmyH2L4cV8
	 eL7dOarrW+L2zfsJUj9FXJTdCD8L6CiGXYV2d66NtQIHn/jcnczvCc4OW1CIL2j2t5
	 9oMbRRPXKMRbLOZbajXca1cfW2ENcSn4vapwpjgYTWrI2TzrcfUT/Ze67k7srOg17g
	 V/ZNuDQraimnA==
Subject: Re: [PATCH net-next v13 12/14] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 23 Nov 2026 09:51:40 +0000
Message-ID: <179542750052.3135.1136880861185485174@kernel.org>
In-Reply-To: <d5bc7f31-9189-4017-9e1b-79e71813dfa7@yahoo.com>
References: <d5bc7f31-9189-4017-9e1b-79e71813dfa7@yahoo.com>
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

- [Medium] On family D (RTL8367S-VB), every offloaded VLAN-unaware bridge
  port is put in the same port-based FID 1, whatever its bridge number.
- [Low] When VLAN filtering is enabled on a bridged family D port,
  rtl8365mb_port_vlan_filtering() writes PBFID[port] = 0 first and…

--

net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

This patch teaches the rtl8365mb table and L2 code about the family D
(RTL8367S-VB) LUT layout and its table access interface, which has no
EFID. On family D it puts the ports of an offloaded VLAN-unaware bridge
in port-based FID 1, enables the lookup-hit isolation fallback, adds a
LUT init step and limits the switch to a single offloaded bridge.

Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-6708118180

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index b83e39314708f..75d9c6120e7ff 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -2469,8 +2496,46 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
>  			goto undo_egress_mode;
>  	}
>  
> +	if (rtl8365mb_is_d(priv) &&
> +	    dsa_port_bridge_dev_get(dsa_to_port(ds, port))) {
> +		u8 fid = vlan_filtering ? 0 : RTL8365MB_D_UNAWARE_BRIDGE_FID;
> +
> +		ret = regmap_update_bits(priv->map,
> +					 RTL8365MB_D_PORT_PBFID_REG(port),
> +					 RTL8365MB_D_PORT_PBFID_MASK, fid);
> +		if (ret)
> +			goto undo_refresh_ivl;
> +
> +		ret = regmap_update_bits(priv->map,
> +					 RTL8365MB_D_PORT_PBFIDEN_REG,
> +					 BIT(port),
> +					 vlan_filtering ? 0 : BIT(port));
> +		if (ret)
> +			goto undo_pbfid;
> +	}

[Severity: Low]
When VLAN filtering is enabled on a bridged family D port, this writes
PBFID to 0 before it clears PBFIDEN. Between the two MDIO writes the
port has PBFIDEN set with FID 0, and learning is still on from
rtl83xx_port_bridge_join().

Can source MACs received in that window be learned as dynamic SVL
entries in FID 0, the standalone port FID, and then stay in the LUT
for up to the 300 s aging time programmed by rtl8365mb_d_lut_init()?

rtl8365mb_port_set_efid() writes the same register pair in the opposite
order when disabling, and its comment explains why:

	/* PBFID is ignored while PBFIDEN is clear, so write them in
	 * the order that leaves the port usable if the second write
	 * fails: PBFID first when enabling, PBFIDEN first when
	 * disabling.
	 */

Should the vlan_filtering == true case clear PBFIDEN first too, with
the undo_pbfid path reordered to match?

> +
>  	return ret;
>  
> +undo_pbfid:
> +	(void)regmap_update_bits(priv->map, RTL8365MB_D_PORT_PBFID_REG(port),
> +				 RTL8365MB_D_PORT_PBFID_MASK,
> +				 vlan_filtering ? RTL8365MB_D_UNAWARE_BRIDGE_FID : 0);

[ ... ]

> @@ -3672,9 +3826,22 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
>  		goto out_teardown_irq;
>  
>  	ds->assisted_learning_on_cpu_port = true;
> -	ds->fdb_isolation = true;
> -	/* The EFID is 3 bits, but EFID 0 is reserved for standalone ports */
> -	ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	if (!rtl8365mb_is_d(priv)) {
> +		ds->fdb_isolation = true;
> +		/* The EFID is 3 bits, but EFID 0 is reserved for standalone */
> +		ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	} else {
> +		/* No EFID; FID 0 is used by standalone ports and FID 1 by the
> +		 * offloaded VLAN-unaware bridge via port-based FID, so allow
> +		 * at most one offloaded bridge. The bridge number it gets is
> +		 * what rtl8365mb_port_set_efid() takes as "offloaded" to
> +		 * enable port-based FID, so max_num_bridges must not be 0.
> +		 * Bridge numbers are allocated system-wide by DSA, so this
> +		 * does not stop a bridge that already has a number from
> +		 * another switch from being offloaded here as well.
> +		 */
> +		ds->max_num_bridges = 1;
> +	}

[Severity: Medium]
The comment says a bridge that already has a number from another switch
can still be offloaded here. Should the driver reject that case?

dsa_bridge_num_get() only checks max when it allocates a new number:

net/dsa/dsa.c:dsa_bridge_num_get() {
	unsigned int bridge_num = dsa_bridge_num_find(bridge_dev);
	...
	if (!bridge_num) {
		bridge_num = find_next_zero_bit(&dsa_fwd_offloading_bridges,
						DSA_MAX_NUM_OFFLOADING_BRIDGES,
						1);
		if (bridge_num > max)
			return 0;
	...
	return bridge_num;
}

rtl83xx_port_bridge_join() then passes bridge.num to
rtl8365mb_port_set_efid(), which maps any non-zero number to the same
FID:

	bool enable = efid && !dsa_port_is_vlan_filtering(dp);
	u8 fid = enable ? RTL8365MB_D_UNAWARE_BRIDGE_FID : 0;

rtl8365mb_d_l2_uc_to_data() and rtl8365mb_d_l2_mc_to_data() also drop
efid and turn VID 0 into FID 1.

Take a system with more than one DSA tree. Could bridge A (number 1,
local to this switch) and bridge B (number 2, already spanning another
tree) both be offloaded on the family D switch and share one SVL FDB in
FID 1?

If so, static entries from the two bridges for the same MAC would
overwrite each other through the OP_WRITE in rtl8365mb_l2_add_uc().
rtl8365mb_l2_del_uc() would then skip the delete because
found.port != port, so DSA and the hardware LUT would disagree.

Hardware learning in the shared FID could also let a host in one bridge
take over the other bridge's MAC entries by sending with those source
MACs. Unicast to those MACs would then be flooded within the victim's
bridge through LOOKUP_HIT_ISO_ACT.

Would it work to record which bridge owns FID 1 in the port_bridge_join
path and return -EOPNOTSUPP for any other bridge?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3f1826f8-3096-40dd-a278-c70fce4852c8%40yahoo.com
