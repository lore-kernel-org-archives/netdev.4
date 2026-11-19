Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127793;
	b=ZYSuA+V/hkDEfzph7gTSt0BbPkaGgLh2dOCwQZvHY6oQKaJXBgU11lQ/2e1jCXgI5rBO
	 Hwp0or6dh1UYgvc4mqJ/r9DV4r8BvHYEeNCH34SPBY7DrVyOqw7YfPcqLZEUOYropfqBt
	 //pVsTJeR04V3rWVj63EIjZYsW8sjlpg9wH4dtkWGec/IETC6hdPXnNAUInlFwZ3qFkMt
	 wJk91C3kAEJbKMtMmSmUYK/GU+9Dd79AE3l1Pw3w60MYVcpqaFdPw4hvyrn0XCcD98X2q
	 lHOwU1dKS+5nhvQbNrwQjFURPWvCrJF9NK06MflIrFuVuTUgNANiM8Qxjo0VKL4Q7IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127793;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EQND8DtByypeGvKjlf1d8I5SCOd8zNIl7zb8J8w2nKA=;
	b=cfSX6YCH3wnHTyhwdhsNAKRROOW9z/v4bUJaj/YVs5GlSHIjFl2/rnPynGV9W2xnhZFH
	 EU3/CohCyZkl5LsRwztIY++A80BBvOipmQpOFAWry12VFV8W7BRgeS1n9q82DzyLitgMA
	 +FMc8mXFzi5npNo4McJeg44MVPZnkJz4PA39xKzHtrLMpEqrh86Y576n2RTWZdWcwrwaA
	 dbKTfOKb8/EiwXPhJi72G++iPjbTvNCVKCPubTWxgasQaxoQrGnCEiqE8znhxqtRJX6Ti
	 L3pmrhr5YXyolqkHmgcG7D1U6lhLIJWvXvpwa2GmKxMnaM2lYGOgfiGdX9moBv5C1QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkmlGfJv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A2B606A337;
	Thu, 19 Nov 2026 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkmlGfJv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182A91F000C0;
	Thu, 19 Nov 2026 22:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127793;
	bh=EQND8DtByypeGvKjlf1d8I5SCOd8zNIl7zb8J8w2nKA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lkmlGfJvUhqUHl3wzHkpz6HT10pDBrv21YMR4VHzR5gSSAp/n4EpJ6nw2mxDxWkiw
	 82BV6nuJ/hl9JmKqi5+p0tQtrx8yuYRzmJBBeZ6U5smU5uWuKLLqgAoIxuiBEYbBNq
	 GP+eePm5t3E4hZMP24ET+2YjaAZeLCBNPtR13kTw75RY3sKF4WbioNJr05QQjDdtrU
	 GmAoZJGHQAepx7Plm9M00K+oYn7I3lH+9ZbOLIJ3QJXbRT4ZRiTdoGECBkIxRSWGlx
	 MH+iNyWEZ9w1S3kyR3Ib2IjF3sHnpU8ICzx6WeYHN9gV7gbQHAy7gkTT6assIalK/V
	 JrXXAtDAAQgRQ==
Subject: Re: [PATCH net-next v11 09/13] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Thu, 19 Nov 2026 22:36:31 +0000
Message-ID: <179512779167.3136.16350479075659467985@kernel.org>
In-Reply-To: <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
References: <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
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

- [Low] The comments on the new PVID reset step contradict each other
  about whether the hardware reset leaves the PVID register in a known…

--

net: dsa: realtek: rtl8365mb: use raw VID for PVID on family D

This patch adds family D versions of the PVID helpers. On family D the
PVID is a raw 12-bit VID in a per-port register at 0x0700 + port, not a
VLANMC index. It also calls a per-family vlan_port_reset_pvid hook from
rtl8365mb_vlan_setup(); the hook clears the PVID register on family D and
does nothing on family C.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 77ad84ea4a6d1..983257250205f 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -2432,11 +2432,22 @@ static int rtl8365mb_port_vlan_del(struct dsa_switch *ds, int port,
>   */
>  static int rtl8365mb_vlan_setup(struct dsa_switch *ds)
>  {
> +	const struct rtl8365mb_family_info *fi;
>  	struct realtek_priv *priv = ds->priv;
>  	struct dsa_port *dp;
>  	int ret;
>  
> +	fi = rtl8365mb_get_family_info(priv);
>  	dsa_switch_for_each_available_port(dp, ds) {
> +		/* Start every port with the neutral PVID */
> +		ret = fi->vlan_port_reset_pvid(priv, dp->index);

[Severity: Low]
This comment says every port starts with the neutral PVID. On family C,
though, fi->vlan_port_reset_pvid() is rtl8365mb_c_vlan_port_reset_pvid().
That function just returns 0, and its kernel-doc relies on the hardware
reset value:

 * On family C the neutral PVID is VLANMC index 0, which is already the reset
 * value of the PVID control register, so there is nothing to do. Leave it
 * untouched to preserve existing driver behavior.

The new kernel-doc for rtl8365mb_d_vlan_port_reset_pvid() gives the
opposite reason for clearing the register:

 * On family D the PVID is a raw VID in a per-port register whose value after
 * reset is not defined by the driver (it may come from the hardware default or
 * from an EEPROM), so clear it to 0.

The header comment in rtl8365mb_main.c describes the EEPROM for all
supported chips:

 * The EEPROM contains initial register values which the chip will read over I2C
 * upon hardware reset.

Doesn't the same EEPROM reasoning also apply to the family C PVID register
at 0x0700 + (port >> 1)?

Suppose an EEPROM preloads a non-zero MC index there. Then
rtl8365mb_c_vlan_port_get_pvid()->rtl8365mb_vlan_get_pvid_mc() could
return a non-zero evid. rtl8365mb_port_vlan_filtering() would then select
RTL8365MB_FRAME_TYPE_ANY_FRAME, which is the same situation this patch
fixes on family D.

That runtime behaviour on family C is older than this series, because
rtl8365mb_vlan_setup() never touched the family C PVID before. The rest
of the series also leaves rtl8365mb_c_vlan_port_reset_pvid() unchanged.

Would it make sense to have the family C hook write MC index 0 through
RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_MASK(port)? Alternatively, the
comments in rtl8365mb_vlan_setup() and rtl8365mb_c_vlan_port_reset_pvid()
could be reworded so they don't promise a neutral PVID that the code
doesn't enforce.

> +		if (ret) {
> +			dev_err(priv->dev,
> +				"Failed to reset PVID on port %d\n",
> +				dp->index);
> +			return ret;
> +		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cf3fd237-2290-4002-8de0-ea4100ef0f85%40yahoo.com
