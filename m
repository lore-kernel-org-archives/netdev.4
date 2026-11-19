Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127795;
	b=t34r5sT8dRvjxo9cMbWlwJUKPFO/XCfoez2RUOr+r3jJM6XiQoNX7mmCUWk9rJ57cte3
	 8a0bYamGd3fabAbK0Ml7AMCl20qcFxSmbrwVqwlIjjQUnmsv6sTYnx6i5Ph8u90f8ulVm
	 OreL2J3AifcTESYge4Cqiilosp1giEVfT4qmrb56ib66NujOQfK8tT/IMsEOEFezGJQSp
	 a+PjNnq1ZcgMpj2nBnr3BU8rASU3/Z/xo4YZmLs/imYMyZCO6Ol2meIuSo4tdbRSZ57t3
	 d+ue4tOFQA3s3myIiIkbEJQB9DI2BTqu+htovMi0qvRsYZBURpB0Q+sCu+M7mQ4O2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127795;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ko2VFISVp55vscZtGE686QzoioU9XmD8JK2gToXnrQA=;
	b=wvo8iR0No+b778su6l7oQo/LUYKSJ0yrIH5VSPDghaXDqLRMdRz4qS5VN6d4Hm4M5Fs0
	 iuYx+/1OZ3+QHvxu6I2Azk0ssjKwKmbs9AJxeXU6binB62+D8Paq9BudnxecfTAJ0GPgH
	 M8dN1178Cu8MKyZF4TgoguR6la+qQ0cywOrGeniwXeNWh5ds/NQr0xBiKmp31+Hb8hqi/
	 o+idPMnLwxUwdc6mC5f+3Kuy7wib0gq1GLcSwrqDixOP65O8ByBORcOaCZqCNEdx78/Jz
	 gAfG4v9CpxOxJwhfQb58Xgz/2wzLzU2aovjBG147ZHMIhJ7MExC7kplGTBN1ZD/n7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j1/tqsPl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E7606A33C;
	Thu, 19 Nov 2026 22:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1/tqsPl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C431F000C0;
	Thu, 19 Nov 2026 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127794;
	bh=Ko2VFISVp55vscZtGE686QzoioU9XmD8JK2gToXnrQA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j1/tqsPlYhj0YtgFAKx0ns76/kYy32afsgVF8aEuDi5Wsu7V7ne7d9N2CZdFI7TJj
	 iNL+kxGD6yhlldoQm6Hsulkmk0ilm7jRVMAIGR73YSI7RBsTZDTBp41bqCT1vhgI3H
	 Npvpsb4oIWbApaCOehj1O9flM4UFahS1Angu2UEd+JJp7RP0vfi/9dQtz4ebTzYFGa
	 rnhU69RRptMKHCb4172usJicV3D+HLGoxZ+bj6eiYmujwvJ2e/OzkgZ9DwggXMd3po
	 T5KYcBeMZC4pwIiulCvOnSPjoI113jUd/yKDK8Ae7oqx5A6Qs0qpnfyoX6tIZ3/lXG
	 duBqwTwFrICVQ==
Subject: Re: [PATCH net-next v11 10/13] net: dsa: realtek: rtl8365mb: add
 family D SDS13 PCS support
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Thu, 19 Nov 2026 22:36:33 +0000
Message-ID: <179512779318.3136.8422558829727451994@kernel.org>
In-Reply-To: <cdf74b4b-77e7-4b06-9947-8b70afd63117@yahoo.com>
References: <cdf74b4b-77e7-4b06-9947-8b70afd63117@yahoo.com>
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

- [Low] The comments this patch leaves in
  drivers/net/dsa/realtek/rtl8365mb_main.c do not agree on which…

--

net: dsa: realtek: rtl8365mb: add family D SDS13 PCS support

This commit extends the RTL8367S SGMII/HSGMII PCS code in rtl8365mb to
family D switches. On those switches the CPU SerDes is reached through the
indexed SDS13 window and the SDS_MISC layout is different. The family D
tuning tables and register sequence come from the vendor RTL8367D port API.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 983257250205f..6f80b171745e1 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -264,7 +264,8 @@
>   * interface, indexed by the external port number with port 5 (the first
>   * external port) as the base. Other RTL8367 families index this register
>   * differently (e.g. the RTL8367R uses (id + 1) % 2), so this mapping only
> - * holds for the RTL8367C-style parts this driver supports.
> + * holds for the RTL8367C-style parts and for family D, where it is the same
> + * (one bit per external port, base port 5), as in the vendor RTL8367D API.
>   */
>  #define RTL8365MB_BYPASS_LINE_RATE_REG		0x03F7
>  #define RTL8365MB_BYPASS_LINE_RATE_MASK(_port)	BIT((_port) - 5)

[ ... ]

> @@ -315,8 +317,10 @@
>  #define RTL8365MB_SDS_REG_LINK_STATUS		0x003d
>  #define   RTL8365MB_SDS_LINK_STATUS_LINK_MASK	BIT(4)
>  
> -/* The embedded SerDes can only be muxed to external interface 1 (MAC8),
> - * which is port 6.
> +/* On family C the embedded SerDes can only be muxed to external interface
> + * 1 (MAC8), which is port 6. Family D has it on external interface 0
> + * (MAC6), see RTL8365MB_D_SDS_EXT0_INDEX. RTL8365MB_SDS_EXT_INTERFACE_ID
> + * below is the family C id; the SerDes port is 6 on both families.
>   */
>  #define RTL8365MB_SDS_EXT_INTERFACE_ID		1
>  #define RTL8365MB_SDS_EXT_INTERFACE_PORT	6

[Severity: Low]
Do these two comments agree on which RTL8365MB_BYPASS_LINE_RATE_REG bit
belongs to the family D SerDes?

The register comment above calls it "one bit per external interface",
with "port 5 (the first external port)" as the base, and says family D
is "the same".

This comment puts the family D SerDes on external interface 0 (MAC6) at
port 6. The RTL8367S-VB entry added later in the series puts ext0 on
port 6 and ext1 on port 7, so port 5 is not an external port on family D.

rtl8365mb_pcs_config() still clears the family C mask on both families:

	ret = regmap_update_bits(priv->map, RTL8365MB_BYPASS_LINE_RATE_REG,
				 RTL8365MB_SDS_BYPASS_LINE_RATE_MASK, 0);

RTL8365MB_SDS_BYPASS_LINE_RATE_MASK expands to BIT(6 - 5), which is
BIT(1). On family C both readings give BIT(1), because ext1 is port 6.
On family D they give different bits.

Suppose the RTL8367D register is indexed by external interface id. Would
the family D path then leave the SerDes bypass bit (ext0, BIT(0)) at its
reset value? It would also clear the bit for ext1 (port 7, RGMII) instead.

Suppose instead it is indexed by port - 5, which the new comment says
the vendor RTL8367D API does. Then the code is fine. Could the general
part of the register comment ("one bit per external interface", "port 5
(the first external port)") be updated to match family D?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cf3fd237-2290-4002-8de0-ea4100ef0f85%40yahoo.com
