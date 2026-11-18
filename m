Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015110;
	b=p6AAkTdOHH00d/f3YHVhMnLt+wF83GNbZhoEwswO6ROm/haRG5/Py+azkCyEWCtLil+J
	 wR1gkzHW746dmaSJB/q0NhNBpHe2kiAObLiX/0D6QKVxbnukX7ok733+WEqblJqNNdJkD
	 UVLLfyhtTCbbv37e2+pnaJ0ck3C0lTgi/ePqnpR7wT38nlwqxe+UGYhMjBCM1hFtTblEZ
	 fS4XR242D5D/Yv1S6ymnovi4m8uigdtXzj48+wN/OIyAfUdTxBawmKWsMRShBUUbrKhx2
	 xCaIr4+Oc/nbJx1cMmU28WQbMujhzayz4xtNmlZtPa2/LIhsZ+tefMIJqCAh8M1ehcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015110;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nm+pIoUJ8TTRUkgOKw5KoR6JySMRRG8kUBelF7F2uNY=;
	b=pKrSZBeOGb/fZht0Jfz91CBKFs9Hv/g5G9lZfhVuxfoi4R6iuFLkzuN2g6Mvg2nKrMqa
	 N0WhOQGQw0eZ7BI74VaGEBSsQenQP7e3slFaBojaHfBWPwP8nvcgdSxc5nd59t3qFqj1x
	 hSHCbrwkJ1H0a1DFMLn14VFU8zSl0d3MrhlmyaXKkZwqNkN+8FoY/IMOfBX5iqZ6JIKiw
	 mIPI62BdSZ9tUxgJ9iAiKtNAhUgKEo0JlvNWprIfZ7ri/HFqb1vQA2cpcUw4bB96zDrQk
	 ggt0fIHCQ5QyReVJN4sc4UIo9/ZAcsjIgIzkSkm86VCX4Sw02BJdOqI9tDEZ0rhdEMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=SMWRRlLR;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A693160A2609;
	Wed, 18 Nov 2026 15:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A693160A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=SMWRRlLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nm+pIoUJ8TTRUkgOKw5KoR6JySMRRG8kUBelF7F2uNY=; b=SMWRRlLR8ICvzFKpOnWWERsBVI
	TPHxhsnkr1whTHMqLtiNlN0t1SYjzl5Q2rULUAw2WB0iz6HIkzxRPqutcXyQtGKcPOmys8Hav5qKh
	Yk2xnc8h+brDJkpiD0hFI+74yZ4KmXjvzpfxR1swVE8mImmF+ouRd1aorRxtTRHRZcBw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xThQO-00HRwl-4j; Wed, 18 Nov 2026 16:18:16 +0100
Date: Wed, 18 Nov 2026 16:18:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Elias Pukari <elias.pukari@gmail.com>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: phy: et1011c: don't write an error code
 to the config register
Message-ID: <1d316b00-bdb1-4e82-aaa4-543990319daa@lunn.ch>
References: <20261118150718.16924-1-elias.pukari@gmail.com>
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
In-Reply-To: <20261118150718.16924-1-elias.pukari@gmail.com>

> +static int et1011c_probe(struct phy_device *phydev)
> +{
> +	phydev->priv = devm_kzalloc_obj(&phydev->mdio.dev, int);
> +	return phydev->priv ? 0 : -ENOMEM;

Look at other kernel code. And in look mostly at phy drivers. How
often do you see this sort of return code?

You want your code to look like all the other code.

Also, how often do you see a priv which is not structure?

>  static int et1011c_config_aneg(struct phy_device *phydev)
>  {
>  	int ctl = phy_read(phydev, MII_BMCR);
> @@ -60,25 +66,33 @@ static int et1011c_config_aneg(struct phy_device *phydev)
>  
>  static int et1011c_read_status(struct phy_device *phydev)
>  {
> -	static int speed;
> +	int *configured_speed = phydev->priv;
> +	bool was_up = phydev->link;
> +	int val;
>  	int ret;
> -	u32 val;
>  
>  	ret = genphy_read_status(phydev);
> +	if (ret < 0 || !phydev->link) {
> +		*configured_speed = SPEED_UNKNOWN;
> +		return ret;
> +	}

Look at other users of genphy_read_status(). How many have code like
this? If you are doing something which no other driver does, it is
likely to be wrong.

    Andrew

---
pw-bot: cr
