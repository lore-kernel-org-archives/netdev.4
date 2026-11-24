Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546262;
	b=Y6OpPAdVfdu35QrreiQ3tWXy0YsH1brxrDOV9fpDTeSA8MPSR3/ZtyJeCY9vVOo+6GXq
	 5zy6Y3tnU8FFaAd3iOvcZ6fJUpUn6pJEJnZQ7G1S82JXhFk2A8njbyVvMDR/JWacCdhr7
	 MeIBVHoz43kYM+ZjgHCs1kyqliwgeSVD8mzlaA2BV43mc8MiyrAP7DmHECm8ChXeuBgzC
	 Lw1r4bnEwCMVRseFx/qtowrc9kgx2Vw4f7DbjwGaj7qV4yZsJ5FBPuBsCSQNjl1ITYt2K
	 2673Cw2hmT8865O5EtlYOGbxPT2mYNB60a7fJHQ66e2sGKYLX6rj8L8/dvbjN44mPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546262;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BB4dvpr20SC5e/Tv9sGOQ+I4hmkO5OM8JeoWCYxHvq4=;
	b=QMf2Z6WeeIwOITFb04eqtaoMP9akBuDm2kb0LjtkN3Z0P3Jh3Dw74tiatAmYQu6RtT77
	 5VzNuyomqoek1z+BSG8PAxl4rDrs1UlHfdszldp1ep4HjVq6WKH/EH8HYuQuP2ji6duvU
	 KywRwXZESVJYHARtd4zlwEWkAnOVzJEdosNjJi0qdvV0JcRHloDLBTOXM9JyHfaH3qX1j
	 mxlUxLgT/4A2LtLzXZKRHPqJPv/hDc5SFbe1RS3sKe3eCO2bVL4qQoCzIlMin00NioK79
	 +b5h6/6OcFMwbL5h0GzUhaXAzYiWBvC6FnTuzX3HPccooUHuIBH+K1dTCdERwuWeZKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ddPmOKDQ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49E606A31E;
	Tue, 24 Nov 2026 18:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB49E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ddPmOKDQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BB4dvpr20SC5e/Tv9sGOQ+I4hmkO5OM8JeoWCYxHvq4=; b=ddPmOKDQV22XD0M6C23IL+CB1f
	+JA+iNr/RylCv39jhqyB6O04Xk459XyUrGmsVeylTKN7zcKoT8UJWDtnPfC+O5JRCJlcgD3nHQ34O
	88QAtZm1AHXtUt0JJsmbf+0ESdJISO+1iN0tH03TQPKP4m5KaQiNCkAb+AcfDx+RHBik=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvbH-00189o-VW; Tue, 24 Nov 2026 19:50:43 +0100
Date: Tue, 24 Nov 2026 19:50:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 5/5] net: dsa: mt7530: disable regulators on
 mt753x_setup() failure
Message-ID: <cb1f5ec5-61f9-4513-a80a-c07a37e20e36@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
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
In-Reply-To: <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> mt753x_setup() calls the per-variant sw_setup() (mt7530_setup() for the
> MT7530), which enables the regulators, but the steps that follow returned
> on error without disabling them. The common case is mt7530_setup_irq()
> returning -EPROBE_DEFER, which leaves the rails on and re-enables them on
> every re-probe.
> 
> Route all failure paths after sw_setup() to a shared error label that
> disables the regulators, and move the mdio irq teardown there instead of
> handling it inline.

From an architecture side, this is not great. We have a per-variant
sw_setup() function. To keep things symmetric, there should be a
per-variant sw_teardown() function.

    Andrew

