Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221963;
	b=U8tUzIm9gqAqhAYbBOXnZwlTi+haPHzmHkLKW4WOI+VKCZ0l7vZSZ5rJ1V94fcZLHAH8
	 /k17AFsvwIwwwuAyxpzDJM6kr3LhEkadMrrAexNobe/LNIwgLNje/maFpDdu4P11+fJEI
	 itt2nG2/iifTN4QvlDvNV6jVcffjZBoGLsfHblmO2+C0kP/hmMS+m8U12W36zPipeBrbM
	 4RHzOCoIifAH99x33yBPWrchMMZMpyAaleFsl55CFcS2upZ82DGYkLTIcmZpqs+Ots5vW
	 zF4/vyYUgwRpcZ/Lh60DcbcRFBN+rdSaRe8MDjkOanC9HItlzG1af2PP3x2dg03vAmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zVV1u4mdfEa+71QVfExLmY3W/TNv8r1nhMoxrEj/45c=;
	b=35vsRls8P1FDdDehGG1Leq063nC1rAkS5Vbo/zuuKrDgD41BTZ5x0X10YzFyv8wIDnOJ
	 l99htTSMW6csFRWlWSm5CoON+8l0JtyVcgPmGx1TYQnpI/rnTKAwtqiWc+4ptoIoi085d
	 OQsAbeN958cVvQpi90DWB94vMwxYCuXBqkpzwrGqdHNihynjuF89l40vH8gvtf81lAW2v
	 ru/hiz715pEF+Z/p8IMfFsUai/fshLCqR+xewP4MWQnfGj3qQqi2SOkVtJ47udiZ++9rO
	 7E74w3Q3opeeNRu5S+l64SBuNDWolWdh4cpCb6nPyvxlRQE144+7NFbaaSzPd+iPBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0ixMRsY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84D606A6BE;
	Sat, 21 Nov 2026 00:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0ixMRsY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BB21F000CA;
	Sat, 21 Nov 2026 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795221962;
	bh=zVV1u4mdfEa+71QVfExLmY3W/TNv8r1nhMoxrEj/45c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C0ixMRsYmnQsvPxUOAJUL4CWc1ZORHAvtzr/1U69M+NLovwI/CFQQmDX7n0kM1keU
	 4AuWYXo432kd1UVvyoSaoELIWovQhrPuKAaKLEdkdTWlUlR/rmSDWC/WtysIlZlaMo
	 a7HYIoitwMoissaeVXVkgRZ8acd7Syl5+r6Q5gTbBYSqRxH+wlpKZIVrFA+PSUXnhd
	 9I2Dg+Ucl56KR4vNBkuIapcJ7TSdeJnNFvAdLu5oTiXvBakHaCLZhBt9cWNN0LfD24
	 25vGglILK5tuHoz4Lzpy07VzdQP4Xad1HgBUx5NI5VXGIm0+3PFm/taQgHNsWb0ole
	 bLbkOO+a/fzDQ==
Date: Fri, 20 Nov 2026 16:46:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, Lorenzo Bianconi
 <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Joseph Steel
 <recv.jo@gmail.com>, Muhammad Nazim Amirul Nazle Asmade
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
Message-ID: <20261120164601.07f932cd@kernel.org>
In-Reply-To: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 17:21:34 +0100 Maxime Chevallier wrote:
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> @@ -209,8 +209,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
>  {
>  	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
>  		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
> +		u16 proto = ETH_P_8021Q;
>  
> -		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
> +		if (hw->desc->get_rx_vlan_proto)
> +			proto = hw->desc->get_rx_vlan_proto(rx_desc);
> +
> +		__vlan_hwaccel_put_tag(skb, htons(proto), vid);

Heh, this function now does 3 indirect calls to get the info about 
the stripped vlan. Isn't this slower than disabling the offload and
stripping in SW at this point? Maybe the low-end CPUs are very
different :) Or there's something else I'm missing?

(not really expecting you to do any digging, to be clear, just found
the level of complexity in SW to support a trivial HW offload kinda
funny)
