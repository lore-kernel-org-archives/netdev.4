Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627962;
	b=e7EEoelIouglBuV86JmlpQcxIoNBbcVfoIE+q4Mpbg5eM5w5RrcvmvrHG9m+XJlSOztz
	 1Z4zt1B3tLog/FAclctI9TPaR3qivmQ7MPZAzjdOBhvRzL5947U2nO+NnUPeTJ6jWlZNE
	 3J3iq1mgYWtnq6wp/ZZRdnc2x+1LiX0bHSE7vc6Gh3w0AVdxpkRSvOrZpx5HrwRKXZiVE
	 LsHAH4dG+5n9Q7yG7S59gM/4X8GxHXI7+CORGLZmNv54Rcj7l86KtE0yvAh+7RGBRk6Xc
	 Ni75JexGFXtHgo0OuoJGutZMYsvgE7S1AgzqegH0ZBS93N7+xjdwVDtRZOetJo+gXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627962;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yROZWwK3yFhmR4J+4rR//wVwCBq3MVfqb1zhpZ3Xm8A=;
	b=YaSjpj4UgJz5xA89jvh0YW66X6HCxqGPnGWWIOBKlwyGHXUm27iDGRQnN93pQpBQbGMc
	 b9mNlgPyQXMpI3ZZSpKuhDDVxdHT/V+rw+OUO8pmwfigBGGC6AQzgg5UGb9CdhyLrVjgD
	 cBnaIW1+i4TfNAiIWcyDd9Mv7CBG4s7HblGWgm0zFVvmnRkaug0ih+FMbb0yQZlR4qVWD
	 T9FVoiTf5EEkt1tXLyAG9Pxb1d/4SIboYtRWeLgyioLkOFnhhHgEDnvGMBEst2tIDmQyp
	 eeKjKRTILFI6GePTowKFFIGFxft4BcTINtv5IXVItRDqIXZxjtXxYww4Lzd61LWI7HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=oSHTh3ua;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C0606A326;
	Wed, 25 Nov 2026 17:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=oSHTh3ua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795627955;
	bh=yROZWwK3yFhmR4J+4rR//wVwCBq3MVfqb1zhpZ3Xm8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=oSHTh3ua6WOxhR6mUde3jJfwQFFL1ehk2cnxLu97fuuGqHhlsyjmHU9xKN7v+Zxta
	 P+l67hZuKrgxOPZLasZ7/XbG0y2vxrkzHxT93f5NA4PhKvk0CPj2wZTME6om1zR51S
	 JEO8aE1OETrdmSqFTq7e+ap+Z2IV6Inr0iftRQWIM/F8genOW02B0K3wNMOpTvlIqD
	 IyLC2z24xSXvd1EJzdpGvve1hK7fIupSTIXu0OdW2o2zLgxPdcmI5eKUM08Se9z3tx
	 tiWoQZBoS2YBzWrAE39IBLPVS4oewebGLrsIrL3YlluukzArEj/+bpJTCfMSdOD7We
	 R7zTL+dr/HScw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 36FC5814AD; Wed, 25 Nov 2026 17:32:35 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Wed, 25 Nov 2026 14:31:55 -0300
Message-ID: <20261125173155.2073979-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

v3 will be posted with the comments removed and the Fixes tag on
patch 1. Since nothing changed in the code, I will carry both reviews
and the Tested-by tag. Thanks Yao, Maxime and Giuseppe! You're the
best.

Thanks,
Magnus
