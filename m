Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289739;
	b=E9Twxks1yMY9XabpLrKkuoSNbcYCFYoR732FhVsDYUMcPBNyhGcCAkm+xtlOUqhev9Rq
	 VqrmxvqJx/kP6SpgAqdmER95hiCcqdUB5kwJkjo7ahxHFRNo0Q5hbVTJH2OUe21d/KXrT
	 9qB26qGnVnG838McUq4SJ1TxDBemhYgfHyd/RHzY7V2H80rU8WuUqMRY9ATh9ceu8XFLZ
	 Fzoh2l2LaVaX5vTj4Vgoj9F8cvwGVN988mEIj9e3m1SnBXfjTFbAgRP+sqVNvY6sWhxdK
	 3QgLb7/zC/WNpF/gbZcR3LkzhJGyNXdSku1I0d/zEw2eGF5oXfFj38WU7aPHYRoVD8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289739;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=woUgHZr0uil9VFYYYYRHm8aIGID2QxRLbWy19xVONnI=;
	b=1fEoDqiUAuG3DeGRX7CNN3avVuV4zejOnKgPHwPyv/rDKd3QMNz7BRZOz45ZNgi4ySSm
	 YwTSfAhLjp/KsPkFSN2emMU6D+wNaHC/5P7BMaZSr6OMSYal2X4T8Vd6O25TLjEeX5zYa
	 hazZMaKAW0C9KOE/rATOMDLy5Zc/4UD31QAyrlx1+7soVtJUyCOIdANex4sUx86O3RgJT
	 xRIb4UmTC9Ty1i+V6ByvsIkCzoCY0Bf2Xu4UnVZWuyTRFaMP57STzQxOeV8H5qW0Bf+3l
	 K1JBXfI7B2No+ELvX+J/qbU5AdJ4l6OktOL/v7JhaIzFnfw5dgYcYapDfoOxroYI6Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m4xEfVgN;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E8606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m4xEfVgN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=woUgHZr0uil9VFYYYYRHm8aIGID2QxRLbWy19xVONnI=; b=m4xEfVgNc9OZJR6z5iG+QnFB4H
	z2jVd4W5Tlhdl6kT5Soywj+i6duxMQH2z0hLPqfBsD/fomCJbEGIuKcacP7zSl/MJwOCQnYEkh2xU
	TX5EscvEBCTYuyM1rflJd/8BqT2tQ0nyBIo5EzCs+U4r3XoLtXk4sTezTgPk0xBQoE+w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUqs4-000UAd-OU; Sat, 21 Nov 2026 20:35:36 +0100
Date: Sat, 21 Nov 2026 20:35:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: ethernet: fs_enet: add missing
 MODULE_DESCRIPTION()s
Message-ID: <3cd99f54-d5ec-44ae-878f-e8b1cf841703@lunn.ch>
References: <20261121192343.932171-1-rdunlap@infradead.org>
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
In-Reply-To: <20261121192343.932171-1-rdunlap@infradead.org>

On Sat, Nov 21, 2026 at 11:23:43AM -0800, Randy Dunlap wrote:
> Add 2 missing MODULE_DESCRIPTION()s that are now required.
> 
> WARNING: modpost: drivers/net/ethernet/freescale/fs_enet/mii-fec.ko:
>   missing MODULE_DESCRIPTION()
> WARNING: modpost: drivers/net/ethernet/freescale/fs_enet/mii-bitbang.ko:
>   missing MODULE_DESCRIPTION()
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Hi Randy

Please could you target net-next, not net:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

The changes themselves look O.K, so when you repost, please add
my Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

---
pw-bot: cr
