Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008906;
	b=4OEB7q3sCEPflaFd3/0j+FHHZ5i26Ir2yqL7VUxAJrs4gLyxUf31Maq8bTFqU0Bmlv6P
	 t6HY2WuJA2yuJbYrlk7uV2ffoK7qxIbggxUPXyQn7+Xbiljs1WijxsgUKa+LAb42Sz+AW
	 BFtAgveugmHj8OQkuxlyVOBVqx251CzzBJ4g0T3OCBOpnjqy/BJsvvNqkrJbc68HWmkSi
	 H5kPM9zsCI/hQc4NdzKynIi71uG7RY9tvHs3JzFKkllp3fc1e92UtTgv3RYhYfWuk9rwd
	 JpjqQ0WTC98aF/2bLKdDeB9a7sDJTXCkHGcmbKgnCYOLrgbTLduDBMEdswi8ZlVptAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008906;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=71P3sT0neJSq9bqTcT+45YBrJlG911FbvBaC7yAIvPw=;
	b=NUKEEFbU8lDv/yST6bXibcKzxFdHKj6hWSBN6Kz6/nBUoAkYIBW74juWeFpK39bWt7Ca
	 jcG5TD+YBWO5Z8G0wpIaSNh4Pl1h/8eOmkPsBpG8+rgwO5dF5BGVeqQPNwazA1jPNp1h9
	 /RvBQ+3tkOiSdd80mDMwufpM1snt1+vi009NV/5e2BTVpfhzuFwQAKMgFiO7aOV04D3U3
	 1qhbbnFC+cWR6VQZe6ZaeHJWeQFGkqxozmQ9UgcCKJUzE3E2qFOZXeWnhxwN3eE+kjzKn
	 Cga6aMUiT/LBbKnBgBgd9ZB7aqZG92uwAziLvAGoNxNk5KaJJlIqFc494Uhye8MG7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="Spn2KbY/";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3EC606A31C;
	Wed, 18 Nov 2026 13:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C3EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Spn2KbY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=71P3sT0neJSq9bqTcT+45YBrJlG911FbvBaC7yAIvPw=; b=Spn2KbY/yVTgvXbbbvVwRBse47
	2UA/RDnPcTM9U6lPmvYPWN65myOXbVru78G95YWwPBwsYr7uvMcCQD7oQ+ao875IG+xc7d5wvzQdk
	G0B5qF4xt7nSCsJf1O5NCzc/eZHr1IcABp6WuNOuhd6dLkWeRYKJwc9E1DeXKI9h2NNs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTfoU-00HQLx-6j; Wed, 18 Nov 2026 14:35:02 +0100
Date: Wed, 18 Nov 2026 14:35:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: github@bumblecito.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk, hkallweit1@gmail.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net-next v2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
Message-ID: <238e2188-9460-4092-9cdd-77e17554a3d2@lunn.ch>
References: <20261118025602.171615-1-github@bumblecito.com>
 <20261118034510.434732-1-github@bumblecito.com>
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
In-Reply-To: <20261118034510.434732-1-github@bumblecito.com>

On Wed, Nov 18, 2026 at 03:45:10AM +0000, github@bumblecito.com wrote:
> From: Israel Cueto <github@bumblecito.com>
> 
> The ODI DFP-34X-2C3 XPON SFP module supports 2500Base-X.
> 
> Add a quirk to enable 2500Base-X support for this module.
> 
> Tested on a Horaco ZX-SWTGW2C8F switch with an ODI
> DFP-34X-2C3 module. A 2500 Mb/s link was established
> with speed and duplex forced and autonegotiation disabled.
> 
> Signed-off-by: Israel Cueto <github@bumblecito.com>
> ---
> Changes in v2:
>   - Move the ODI quirk to its alphabetical position.

Thanks for trying to keep the list somewhat sorted. However, you need
to start a new thread for every new version of the patch.

If you have time, could you add a second patch and move OEM and Turris
into order? Not required to get this patch merged, just nice to have.

    Andrew

---
pw-bot: cr
