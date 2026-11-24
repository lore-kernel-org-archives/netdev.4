Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546379;
	b=PQvpAVQOAQ7hvJrKOW/vJxOFxmkwkJwh8lVsMXN+aUmd9oSplkBgO3trWi1fkAnzmvGV
	 XQsd2mSOONjmSIouXn/L+ZoGeos4tFe0JLRaQ+tbFEdUIwFFh0BtV9bJD5w2UsnJ5KZlI
	 KMK+s29MyjBh7cs3e/Q3qN4jEc1sQc+Y3osa5Xp/IKZPOkiRtYs2y/tZa5s5c9aDIfF2Q
	 cO8Ow1SiroNEv8SUzmj4tzIBs4o27I8SCD+sWJPcNCPFxmlqUtft6IVRQHnauoIUM6TtR
	 h1xq6pNjpvp273+qC8mFr8Rtf/AlUPKw0ZIKW7jKNXHiQtGf6F7aufhVtPqJOVfkBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546379;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vvMER4IMaxtX5W+X2KnxbtgMO2qK+53ULMJYnRI4GBw=;
	b=muy4rYiNvPP2wbb5fhtMug3gIDFvY28zWqVYnOnxkjEOl+t/flOp/s1u0Eev2OS177L8
	 ACwd9die24ym8jWPt41DaP2IU1m69OVTYJnZc/abRv+sMW3xDnDp7SPq7TvwtMW+comWq
	 D7ItdJ+vs8g9CPv9zuaj4BEQzyAo/j7lgdjwXroMmg3XRPvO9dRvKfchgZU5Vcquuv706
	 xGaBJOhl7ikipb4dbQ15iIKhlulfegInPPiONH0Kz2Cg2CyLvyUHsca4RKw07eAlXPXpP
	 EHd756dUqlUE7C8eRE6T2EEScdTUO53DcnzAmjFMee399PKNeMTFbYTlA+nlzVZo9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="2x6H/FoQ";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA4606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2x6H/FoQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vvMER4IMaxtX5W+X2KnxbtgMO2qK+53ULMJYnRI4GBw=; b=2x6H/FoQiYoWHZdU/JfOi7a2Uo
	xVX42+3D+zj8OG+3b/xpG5XD0ca7tz83QILK1iQBtH7Y7oYRmtnVjYNonJCwxWSevU5fu5INZxbYw
	YFzztps5+rYwsoALYpMbWoZ65aV4bVypoy3dx8eAfs/KiUSgdsJZCYVryV0CwuBOi4J4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvdQ-0018C4-Jr; Tue, 24 Nov 2026 19:52:56 +0100
Date: Tue, 24 Nov 2026 19:52:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: netdev@vger.kernel.org, Lukas Stockmann <lukas.stockmann@siemens.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: dsa: lan9303: add LAX9303 dev id
Message-ID: <0968b72a-cd83-4d00-82ff-d386078f6831@lunn.ch>
References: <20261124151221.2480934-1-alexander.sverdlin@siemens.com>
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
In-Reply-To: <20261124151221.2480934-1-alexander.sverdlin@siemens.com>

On Tue, Nov 24, 2026 at 04:12:15PM +0100, A. Sverdlin wrote:
> From: Lukas Stockmann <lukas.stockmann@siemens.com>
> 
> LAX9303, automotive version of LAN9303, does return 0x9E04
> insted of 0x9303. Add this as a new LAX9303_CHIP_ID.

instead.

> 
> Signed-off-by: Lukas Stockmann <lukas.stockmann@siemens.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

---
pw-bot: cr
