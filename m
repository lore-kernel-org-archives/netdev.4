Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790395;
	b=bnvlcFUNjpGKpvAeFgOKcptg85KuX0C7I9X4+qGsraVskpR0EFxLNrysFWHUjEslfUDB
	 lQ0GgP5W/Le25HBsJxe3RGC4qcIllXg+d/9xqD/TZh9wQ72eP+7DtWlW+pi7nn6Kn2xdK
	 p0vxyyw0EyF3FYiriB3Ga2ooDUlVhv2QwTnXl5RlaKu1Y7xiIK7C6LxiZRkJC3HiIGFuC
	 Mqyzsld3BsS8Uf8PbH9BdgNhNF2TRp4X/2JFEu2IgayImnXjCLy/muJudwtHKF+vppmSN
	 fxaP4+EFMfwZiq1nEY4sc0CZ/6UrLbR/dwUedrcHGhsdabxVFDUI6drDeA2nUctX6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790395;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1sCQt7HDjifh4aiw+nYVCV7iBn2z6OiSzOpr48Lt6pM=;
	b=NG4DRPEKM0zgtZ6h0Cvr0bIy4C6PXFfkTj5ulG3dNRupiFUBoldWWdWYOG+50xY0+LIj
	 vQw1IAXUfA2vrua4c9F/k2xYFGVC1Jks9XMrwELSGAwbwRgdoPdqtPMrhO4tIr1MFvSwd
	 bC7++4uqWlYi3Sjm4BTCCRTPwAy5wl+1dhSZk0bxPVLFJwrIz1+lmPPrAJnG+db2ZT+Rt
	 OVi2/OP/TgL/gwlxYIeIP/CyuBK1P/30DQ7oUHv56I2XSw9meKPidjcCQRCLm83aZjcaV
	 Hxj971WUy6ddUTO8YtKQRJSSDfflfw7kodJwnRNfalZtJdLHAgQPp7sNNO1Ke/sCPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Mnzf8YyL;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072D606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1072D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Mnzf8YyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1sCQt7HDjifh4aiw+nYVCV7iBn2z6OiSzOpr48Lt6pM=; b=Mnzf8YyL8c0dNhW/raFwBq7Giq
	yYvqQ0d8xoCnQ060PWvVKWS9VqA7wIx9QlZqgwjqYCv6Cw6fv2vFHr9nTF/w+8iSOVQSOqQMj5NUW
	PEZQSGCROheUceyugqBtp2C+f/Q37GUXwQFlg67S1ZCds3eb9TSZzvlh9SjWKovTbidQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWx72-001oO2-8C; Fri, 27 Nov 2026 15:39:44 +0100
Date: Fri, 27 Nov 2026 15:39:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Unregister the MDIO
 buses on teardown
Message-ID: <8057f9ed-c517-4280-a40f-d575e04c6b75@lunn.ch>
References: <20261127070354.550198-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261127070354.550198-1-mmyangfl@gmail.com>

On Fri, Nov 27, 2026 at 03:03:52PM +0800, David Yang wrote:
> .setup() can run again within one registration: removing another switch
> from the tree tears the whole tree down, and re-probing sets every
> member switch up again.
> 
> Since our MDIO buses are registered in .setup() and not released in
> .teardown(), the second registration then collides with the bus that is
> still registered (same name under the same parent) and fails in
> __mdiobus_register(), so the whole tree setup fails.
> 
> Register the buses manually and free them in .teardown().
> 
> Not carrying a fix tag since there are no multi-chip yt921x users.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
