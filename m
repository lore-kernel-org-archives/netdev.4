Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180513;
	b=JwHkVig05cOeVqEbBo9YZfl6PZU8CWClI5jaJ7hx68bMYC1RhAjXTzU0OSSfDglY8aPP
	 4i06LzeFNq2ikxP3QnPYzqbc2mcPUQk0L3IRuvRQvxHJRdUAK1LkAILpjax2A5eRAjJ9G
	 7ErPv2yquh6Zgl0TGmQEe7CxROkNNS8lu5YQ3cDdpK5FOghBSqAWGaNxwjZo8F8W4ULm5
	 wCIsMghuoDt8ieHAQnbLTbNJnaUQ/J97wos66vukm/1effQeuTFOzjXxuwCCr7maE4wYF
	 Ws8pGdWtVi+Fox8TjbjthnncTiLlGurvXOHpLe7DIZjUBy9zHs8zeGtloL9/NrnFYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180513;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=87xES/UahubkQyAyp8NUVzMMkGv6XmiLeVblJoAL/58=;
	b=hh5QqW1GglyJs1RXCrhmVKXDGEXjxpPue3omtgBU6RAGm/HTS1Pu1gROVKLW+eYh8cUW
	 fQNKK2+WL0y3eHwvg3P3bm17e4b3wHoSTS66QAkFvVxIFbSbyEE9sSpK6j5vOfUMyJTL/
	 QrWATMeNdAaTfRkMPXdGfvns3yiWkpBSN0pJKbr7j0KGjIvrSe0iOHqqIARa7g7/Xb8IA
	 LXPNOTMJYNAMaTC3Vg/Q01JK9agEx6Jn3DfXcTImGSEXK1AtOIt77V+eZzinETu3mzpy3
	 xHE3VNYKkzW1iB4SEIRAzTvxNi0Cz1bfo/O498ES5GBXBszxWOe5m+Pt+LDPVELClcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Q6oql7QO;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75325606A325;
	Fri, 20 Nov 2026 13:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75325606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Q6oql7QO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=87xES/UahubkQyAyp8NUVzMMkGv6XmiLeVblJoAL/58=; b=Q6oql7QOXNJleW0MlN3DBIPY7L
	8dIFuiQ90WDqK2AsOXchSNpFPcypeoKezR0iUii9wlg5CcwdgTTh6rIxMVNO4I+yKAmylEwRL2isF
	WPq3eQrj9ZGymcu76bTGTR+dRnyC8y+EMFhj+r3n0w23NUWv+gOTVTcDX4hUbYsZ4TIg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOSC-000IOg-N3; Fri, 20 Nov 2026 14:15:00 +0100
Date: Fri, 20 Nov 2026 14:15:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: air_en8811h: check PBUS register
 read errors
Message-ID: <439bfedb-fc9f-4e41-a87d-f5e6a3b7950c@lunn.ch>
References: <20261120062001.38233-1-enderaoelyther@gmail.com>
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
In-Reply-To: <20261120062001.38233-1-enderaoelyther@gmail.com>

>  		/* We do not know what errors this check is supposed
>  		 * catch or what to do about a failure. So print the
>  		 * result and continue like the vendor driver does.
>  		 */
>  		if (pbus_value & AN8811HB_CRC_ST) {
> -			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
> +			ret = air_phy_buckpbus_reg_read(phydev, mon3,
> +							&pbus_value);
> +			if (ret < 0)
> +				return ret;

Please could you explain your understanding how this change and the
comment go together? You did read the comment didn't you?

	Andrew
