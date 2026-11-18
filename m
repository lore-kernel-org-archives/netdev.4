Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045004;
	b=OD7/RqzbMdnWin6tgYdef+6BHiBu1oADWer1Z81Me9BnFU/Mc1fHchYXBK4zi/LmEN7h
	 GdVVPLXF6mN29PlNL3PKLSKS8HSGwbw3o5uRcSExG+qQZ3cDCqNJfh930xlLjOvcGr1zs
	 WydVuu+RdDzVzquF7nSuG8G13+uG0QJUwLSPqE3mevJH8ZUOB2zuLXu8ggJ1cdbv6qevU
	 aLK9GD24+Q4utZlRwwqY20TaVUbw7/YJdlHMqjs0PdlTI291mtKbbeue04U/XrzQvM8dw
	 9mLqi82807PeoEshKFS9ZnwaiJGvSMfybb0FbtBLfwTM57ES6+m44ldq/szXag3B4+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045004;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UzULi3pDyt9yA1wkNNfY/xIv0rCm9wBQxGgbAXP0KBw=;
	b=MCJcfsTBkqgjAhbKr97p8WFr0C3hCSOOlHUUVTwta4DzqCtw3wsKg+WY0fSNCZdZr+TI
	 PdTfDMubuAtoiGqTz/4cRp1/zKa+SUFOGAgq15qrDmXDQZjp+Xt0g8KLfR2ucRtmCdpzY
	 mRILyHU7PhpPvykzp+6Fs0KwzqDA6aQtQFlWKTJr39Gl6L0qWv6vlDsshoNGrlwbOkfB6
	 4DJ6YI9Ijz0Bz9q2cXV0a5a2wHvD0tKV5QE8M2v16K2NK949NqgrvIuYlXhFFurW6ZVW9
	 J16Qcz4707uAMyI4iZp1ZeG1iND+o4IGj9sZaB3Mttk9ltI+Z2CO71kLNwu/NKPkPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5uZ6z84R;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D48606A31C;
	Wed, 18 Nov 2026 23:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5uZ6z84R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UzULi3pDyt9yA1wkNNfY/xIv0rCm9wBQxGgbAXP0KBw=; b=5uZ6z84RPsLSQVVFdYB1pcAc3j
	tH8ohlD4j0LBFv0zoJQvwi2ZiAC6t6h+1zMC2Dhw60hd4FS3MjQ7BvlUzoDCNEiiOgMJ0H4A+SHlf
	EuEQLK5L3vumrfdq9pAZbEhv9K6aRES65SnGP83UgtEHU8Av6H4KnPOJrcg/ZH5TAqTo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTpCV-00HWlx-VF; Thu, 19 Nov 2026 00:36:27 +0100
Date: Thu, 19 Nov 2026 00:36:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	sean.wang@mediatek.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Message-ID: <7c6bcbbe-bcca-4294-a54c-320b26a9d3da@lunn.ch>
References: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>

> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

Does this bother anybody?

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> +err_disable_core_pwr:
> +	regulator_disable(priv->core_pwr);
> +	return ret;
> +
> +err_powers:
> +	if (priv->id == ID_MT7530) {
> +		regulator_disable(priv->io_pwr);
> +		regulator_disable(priv->core_pwr);
> +	}
> +	return ret;

It is unusual to have two different goto labels with return. Normally
cleanup is structured similar to the code which went wrong.

So something like:

> +err_powers:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->io_pwr);
> +err_disable_core_pwr:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->core_pwr);
> +	return ret;


    Andrew

---
pw-bot: cr
