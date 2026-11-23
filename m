Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445198;
	b=Q8z0FV3j6C9lV51MF81fg/+uwzgkgEkMyyV9nY03IAk5JRkBdqTrY1Vp4iy2IrtAcYaj
	 dCuA7XuBfYr69Ogv8NVUYpYd5ZC15rJGrWvjebSvTP80HjpFYdvSl/uL1We47JA+5jDJv
	 MWWolh32eCNBNqDd+fyd60F8ItnA8pqlAtvDupS+al+4bKpGR9+/S+PTgCrw+757vJR9B
	 nuN49Rzfz8BC7Kxf3ZmvMJJxxVYkyBEAGASB62ql7KEwO9rJn9+6gCeClT65RSc3m8Ium
	 2BWM/ziahJMMQDm89jBX8NzYruROf5aZYeLjMzKHWpshvRatuMx+f+FRXFFJm9wEUGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445198;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+MlS4fSU67YArcCoU7ctXyPr2zLNy9Ek06CnLyNZh6E=;
	b=upZFcUX0M0LeJPD0CU32qYIiqmlwGrwJ2B0KJxRu2dYcZswP9MFF1+KpYRAA6TvblHyG
	 3BZZijjNx1NGXJIrIS3i5g3FtqzVwBYoihri+HIKY/DFtvyV8HA1peJ/6YzoiRVvJZFAD
	 mCSpLdwXEkIZtC/U+ttjjJ2LdExLCBfzWYoGQYdFKiDPZe4suHkVVQ195QdM9+MuLfn29
	 Gjtujug3+bTOSGz3oQPJUCiJwGIo/nfdqbJpSMXHUU1IC1evhSdaGwKcSAg8mEEoyWlp3
	 qtg+MzGOGj2KEgc0+ogFkwSjN+SWFfDWJ0CO5IEk95RQgBYwT6bMXrMrL29CU06eHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FJ7DLqfr;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95B606A334;
	Mon, 23 Nov 2026 14:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD95B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FJ7DLqfr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=+MlS4fSU67YArcCoU7ctXyPr2zLNy9Ek06CnLyNZh6E=; b=FJ
	7DLqfrN5mZbp9W1ddDRhm2gNKEN5Mg18QBoSGzrACAD7P8VlQWAEL6oJe6qGciDrRMe6nLjTjSeOx
	GSCvXabfuJiVh/iBDsHdNj9AcKfXn/RsTO1TD1EIMRM5UzPmv+DnT9dEcq+vVxtsmrXz7xefm8eXW
	OnA7xme+OwfeFcc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVJF-000o2V-92; Mon, 23 Nov 2026 15:46:21 +0100
Date: Mon, 23 Nov 2026 15:46:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	sean.wang@mediatek.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH v3] net: dsa: mt7530: manage the core and io regulators
 with devm actions
Message-ID: <426c9bff-1928-4829-a3e0-dc021e4c783e@lunn.ch>
References: <20261123022415.433-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123022415.433-1-laixiangwu@cmss.chinamobile.com>

> Move the enables to mt7530_probe(), right after the regulators are
> acquired

Please add an explanation why this is safe. Since the original code
did not do this, there might be a reason it is done later.

> , and pair each regulator_enable() with a
> devm_add_action_or_reset() that disables it again.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html


Using device-managed and cleanup.h constructs

Netdev remains skeptical about promises of all “auto-cleanup” APIs,
including even devm_ helpers, historically. They are not the preferred
style of implementation, merely an acceptable one.

This is maybe one case where devm is the wrong solution. Please keep
with the normal way of doing cleanup.

> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

Who does this bother?

    Andrew
