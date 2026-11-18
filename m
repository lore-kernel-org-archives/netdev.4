Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025502;
	b=G5IC8w+sYUK068TDrXXn8Dyf7Ip0UM1t66hhCf42BrnwVzp25NIdE1vBSyD/LG2qzsYN
	 0gAr2KR3pdyNa+3EvaMdwAqiwBGZ+7I1QM8Xtbn3rkCEiry9+jZr72Yylob7urj8BzUbt
	 9WNvRDkO9ygM9qsg7/b+QXFAFkoiz4p7gYb2qJxdfEOUC1tQ+ReQ+dGOnnxYismbezQtd
	 KA2vqsoQ/NYMfdrt767uzBKnlAWK/D50ZL0+LIMQnDCrY21ObvWBDquXypW2slNWUeL+x
	 9wU4ah0HQW57KUTW2HkmeB7eP47LWCvcfxID+UDLWT+JABZK8zcmwsjzNP7PbblaWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025502;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uRkdK0D1Evn9yPGULWEQBwZUI3TEJ1+/UYjutxpisho=;
	b=D5GEZO9c3Su9JfdwTxHJVwc18U6FSUH4Ky5uszMmB6YdYbodNBOZ7boOPTpBBo94XLvX
	 y1xmPYRYeF9cAKEgIaBIhXnGFCZxosSk/ke2uQI4ED110e+jjcrQQ1L0aUpYu1Lo+9GNi
	 0P/BPmbIydV0rUilzrrLVK6IksY/GbKmDGJnTW40dKM7dz74RoeuYOwWFHx4AqVkwQSkX
	 TpEAsVvtIYmDf1RGWxDGreNpj51sTqEhGCqIxSzo/OMFY4DX8jGfTDPsu6kKzP+CM5ZG9
	 Ci2DcchsELuXL+YURLvVlWjphm35jNgcnNjvUHA6cP5dTqisIzZgM+jwtMMjVUaTpFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=sEqgIa6T;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51D606A320;
	Wed, 18 Nov 2026 18:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED51D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=sEqgIa6T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uRkdK0D1Evn9yPGULWEQBwZUI3TEJ1+/UYjutxpisho=; b=sEqgIa6TdSV5J3WITaCpQ2DfXB
	UNk1u+f+qqtx9BvBF6d5mBEMgLQaBHtVYCYte6C4XkAFuO/n3ExRN392lJZtn7+/LPRvq1zz75Xnl
	FzIBncTDn/HkIBMocnTTHRu/RZ5omO55BJtftPzZ4uCk4vynx9sIfYwVQI+aAG1z4DqE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTk7v-00HU79-27; Wed, 18 Nov 2026 19:11:23 +0100
Date: Wed, 18 Nov 2026 19:11:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: github@bumblecito.com
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/2] net: sfp: sort OEM and Turris SFP quirks
Message-ID: <fcc50c7d-f55a-4946-bdba-260b89fba889@lunn.ch>
References: <20261118162323.436219-1-github@bumblecito.com>
 <20261118162323.436219-3-github@bumblecito.com>
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
In-Reply-To: <20261118162323.436219-3-github@bumblecito.com>

On Wed, Nov 18, 2026 at 04:23:23PM +0000, github@bumblecito.com wrote:
> From: Israel Cueto <github@bumblecito.com>
> 
> Keep OEM entries together in the vendor table's alphabetical order
> and sort the OEM and Turris entries by part number.
> 
> This is a table-ordering cleanup only; preserve all existing quirk
> matches and fixup functions.
> 
> Signed-off-by: Israel Cueto <github@bumblecito.com>

Thanks for spending the extra time to do this.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
