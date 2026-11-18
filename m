Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011446;
	b=nbFIlQ9sWi+tP8TmYWAVK/PmNc2FyxJC3fNCe66L1MBju7V/kIX1iLwuL9L0lzzpIVyY
	 eg99lApwgKsWQLuVlKz0n4Z1RqCXW+/ybSyF46JDHSc11vQ1hW7JMkOLjqC6xTU0FwrRd
	 LTnQPnWI6Bha5ACeT+Sx+VO3S3DsnPJ+C/sbCCnuWRgr+6fWpukBHeMaFWwMUW9eCpJpf
	 Q1wPQ8sRVPA5s6EyWqihIDOMP/JeYt109oV69PoruYdnkWJFzIcJAvQCYzZiaxkGth5ok
	 SMrFh6N03Txz/VCK9cELVSVH2+17rx1ViQI4GF+hvM24FVp7f1y6CJGBIa1qqXxA6Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011446;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OpHWvMWyhwdCQYQUv7THIPwaP/EYhn7AxMgVVUlfsxI=;
	b=u5W4ERoRgyP5NDnaB8+5yo0AR0SvV2k7kzRK/oyoojA3t1MdgYEYKlLqMui5ixqI/9lD
	 mE7tGSP0Tnq5W0Zdg1AHX9jNhbHispusVqwt3CQuIyVwSm/SVKH4bRyTm8QTf4gXFF5S2
	 SjdZm0TeOGQet2RRv/gLEHt4ehBw3zhCrtiw4Mjudq3ksgaCfoeHKsbXfqb9PwqpWCjDw
	 WFwab9FuFLgfN3pJZlAphX8gFU9vRrx3fVtZUFRfTq55D9IFGdcofltG5PmD0Ud3KrXvP
	 QILbDJaDU7XA3eo+DbU/mn4yR8iAyiHssH5O4vh5UTHh5r0kXTgfLJDEpM4QbjMT71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="BQz/aPGH";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C44560A2624
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C44560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BQz/aPGH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OpHWvMWyhwdCQYQUv7THIPwaP/EYhn7AxMgVVUlfsxI=; b=BQz/aPGH08xIZsZ6K77Bt1Tcnc
	mlalLdA1r+RasRFdgfSyGaeWsiEp8ooZX4ZQAliHUN9WUmPHtKCTRkNu1oyB+gIyWDFUA3vEQPzrU
	FxloUNsO3o7udwp3/i01TyRL/vYh6UTZ4mPz4Jr5PfyzJxI2MUb5J/rQv9xoZBNBCLok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTgTP-00HRA5-Ob; Wed, 18 Nov 2026 15:17:19 +0100
Date: Wed, 18 Nov 2026 15:17:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Frank.sae" <frank.sae@motor-comm.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net,
	netdev@vger.kernel.org, lingyu.zou@motor-comm.com,
	xiaoyong.li@motor-comm.com, jie.han@motor-comm.com
Subject: Re: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY
 support
Message-ID: <e2a6dae1-554a-4d66-8151-e33f31ee5799@lunn.ch>
References: <20261118033539.36633-1-frank.sae@motor-comm.com>
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
In-Reply-To: <20261118033539.36633-1-frank.sae@motor-comm.com>

> +	case PHY_INTERFACE_MODE_SGMII:
> +		mode = YT8831_CHIP_MODE_AUTO_BX2500_SGMII;

What exactly is AUTO_BX2500_SGMII and how does it differ from SGMII?

     Andrew
