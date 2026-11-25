Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617876;
	b=ZoA27utD4hmtQHtOy+QShK8TBYfWAh64bpOo07zKu3rq2N59sz0g1D0I5RdUAJkFdb23
	 O71nw7KZFB9W8llDgvaRcQPhAydZI58XzfZsap1rn1eysHa9JcNJSOjYOWf8VqkEUwkEd
	 Ffm6U5XmyXtu7u+yBJhakGR5heVqE5X1JpWLBFpM2WiHkufNDdEuqVnzsdPCQMsdzapXE
	 kvC88LXoTFjNrPr4mr/R7aiFod8lLPEFl6sUuO+RUe4PlFrpyKJXW/z8n9Hpz2QADC4JI
	 VuDBf16JmVgOo7l7kFuoqTX50GqGVNOGjx40fspZ5GNwuPgMII2bT+44AnaYir9E6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
	b=iO/7vwB0kaY/vM3yjSATcFQ23JSJi1bAhC1YLTzSgLrcqo8Y6MWuP0zWamisfQ9jRvB+
	 IuYRsTw9tb4d/dW+otlqaHgjOOhKHR/OlePXLELmRSASKb8V1Cj+Wre8IZhtQ+0brUj1q
	 FTbde1kb6BVbLZZAe6W/CRWsqR3oRZoScQT56/7NG+K2utSp5pBgQB6U/1fegP0AtTGYD
	 DKrcLyDejZbrsNHVuucwOcnH0jo32OIPDC3nozUDNipH3SkZJZRRuJ7FKdYJWEbIpiPJG
	 /6qUNG+aJyB2Wv9plrbEQeBh9/PXbI3xHnTKaJej44lOiiea3BaQ8uDyXMIuDemeJlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJz8OA1E;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30F4606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30F4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJz8OA1E
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso13311285e9.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617874; x=1796222674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
        b=JJz8OA1EX5JjC4bTAmY1z4tgzBcYDWsAGttWpwvLVZTnYuyKjKWKXVZLQAuKKWWOUD
         OsbiqnlgZVBoHqQcNbUmmnGGiM9aN8x/5lmqNA6CoLaHaAgqI3Nuxn6m7RK4mm7NRHTs
         qAn0Iyzdz6gAJJhr6ankYT25Fuvx45uCSCJraPFjmfOefb1wmjIcysiu2/kogHxTZQEP
         u3qdVCypnFA7+KFuApaPnk1yIGEvzxk+ETJZJbSkhrf4h1Chzr97zkSKVFU5dru+TbCb
         krkngx1mIiIKsDCLfzU6AxzOVLcV7XoP1nm1CkjXCr1MeYobFyXumDcouQBatquU6sbC
         n9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617874; x=1796222674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
        b=q5BBrJ+JbvnYPZWY6+inP+2oYxw1kPGTj285+wZ+GXbqyjFlkK9Il95ZXVwLv2v68j
         M1KDncwHWNcKFQTYLXdaabpsBq4i/INCgigF7z8TDwdYfOr08hWBCt1fnuHlfFR1Uuwk
         eFgn6Llo6rkU8ITkLrtPiAjgqnlCs7AVRXccWybgcy93rIY3ERV1jgrwm8FLI9k2Fuce
         Me4oi2UYi1VQvbLy3x2m528uCFBtdass8hjapgb9qDeFFybJNwdUmQK600zCguKQbj5T
         A6mAsAK9x868ByfFMQyL210eu+s7PisscaALDJjJH/pGLAcqwK/Z3ryEz3JyYePKMm7/
         rLMA==
X-Forwarded-Encrypted: i=1; AL+hErHF/GGN9vDxL4VLdU4aCJi6y5PScEVegd+5M9MFkLg8E1HXEsb509ZhOybvx6kt0aSqtGtHvOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8coZ0gKIOXFp5NxIBRDRmyLyazbNTjHEf4OHvy1PmQ49Vo0BfA
	F/zWPmSm9VARu24Q/ivcQd9ZUweL8rybVH2DFNQoOM0KX7D8ZDliSPor
X-Gm-Gg: AZFdTZcoWaGXfBL5LmtLP3+HZwlrs6XDEb/hHYq7dcbH47HbLbFmWsh4LcIArO6jhjA
	ohrEZE/YYVZxGVAl6gRP8yL93Tyl9fO8+Uicgc0JDaZzOBJHPLOFCP9WaLZFMTgbGyl5aRVIYNy
	KIKQwVi80H81Jiu6zECVvzKni0cUXmW+fvO32zqLejMpJQGGvWU0jESKOnx/wrRbuPISWaEZtO7
	xiWktyT8XiNY+GGobRh6qsa9Yu7olFP9yTEw7ytxPTCBA/udI+pDeAIY9Ey8OWeuFuIz+UQYqJU
	NdYJb8VnLKwIbLw8EzLHLauyh2BVg9tJo1jv0xS24GEDUShyZ5qyKL7oUObaWvstAyFrrPWFWxk
	dejjIgnrO7pTTtiNY1zKYFteHx8TIhq/9TgCg9uTcu9WUluyA1abOcjBZUzSW1H27Zr6rtrEpAV
	XYyGH12fR57OQBRhOD/ivH3n43WP3e8AfcZ8ci8q11l48K8v3LI6xLZ7q9SnEAOyf9Q3xoL8kgI
	QkfF2oQ4w6uaY0DTmphKYtTYeI78GGCJhgO9k9c2CFiZmf5oMj1VTIhgWYzOff+KpN3Nv2AbRhX
	k5W57udwL80FlVJiPUlxVg==
X-Received: by 2002:a05:600c:1088:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4bb887f43cdmr285531595e9.2.1795617873970;
        Wed, 25 Nov 2026 06:44:33 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm303747515e9.4.2026.11.25.06.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:44:32 -0800 (PST)
Date: Wed, 25 Nov 2026 16:44:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: jan.petrous@oss.nxp.com
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Bogdan Roman <bogdan-gabriel.roman@nxp.com>
Subject: Re: [PATCH RFC v4 09/15] phy: freescale: s32g: Add SerDes subsystem
 PHY
Message-ID: <awbmvSYZ9RJ6agIu@skbuf>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
 <20261125-s32g_serdes-v4-9-3bfe0589be8d@oss.nxp.com>
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
In-Reply-To: <20261125-s32g_serdes-v4-9-3bfe0589be8d@oss.nxp.com>

Hi Jan,

On Wed, Nov 25, 2026 at 10:33:51AM +0100, Jan Petrous via B4 Relay wrote:
> From: Vincent Guittot <vincent.guittot@linaro.org>
> 
> Each S32G SerDes subsystem is made of one PCIe controller, two XPCS and
> a shared 2-lane combo PHY. The lanes carry PCIe and/or SGMII.
> 
> Add the SerDes subsystem driver: the PCIe PHY, the combo PHY bring-up
> and the setup of the XPCS instances. A MAC gets its phylink PCS through
> s32g_serdes_pcs_create(), which also creates a device link, so that the
> MAC is unbound and suspended before the SerDes.
> 
> SS_RW_REG_0[SUBSYS_MODE] is derived at probe from the consumers' phys
> references to the SerDes node, <lane type instance max-speed>: a PCIe
> root port names its lanes, a MAC names its lane, the XPCS instance it
> is wired to and the highest speed the lane is wired for, 1000 in this
> series. The driver walks the tree for them, as the mux is programmed before
> the reset is released, long before the consumers probe. Each supported
> mode has a unique lane mux; a lane nobody references takes the function
> it has in the first matching mode. The reference clock rate is
> validated against the derived mode.
> 
> The SerDes provides one PHY for the PCIe link, whatever its width, and
> one PHY per XPCS instance in use. The XPCS lane PHY has no operations:
> the lane is brought up with the SerDes, and the MAC drives it through
> the PCS, which it gets from s32g_serdes_pcs_create() with its own node.
> 
> After the subsystem reset is released, the PHY needs up to 5.2 ms to
> become operational (MPLL_STATE). Poll it before any further PHY or XPCS
> PMA access, in every mode.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Co-developed-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> Signed-off-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

I am trying to spend some time to understand this design. I have a few
basic questions:

- Simply explained, what do you gain by integrating with the Generic PHY framework?
  The XPCS has a dummy phy_ops. Clearly this means phy_init(), phy_power_on(),
  phy_set_mode_ext() etc will do nothing for it. Who and why is better
  off if it exists?

- If you have 2 physical lanes, why do you have 3 Generic PHY objects?
  Why not a Generic PHY object per lane?

- Does the lane mux need to be programmed by the kernel driver? Does it
  ever need to change at runtime? How do previous boot layers use the
  SerDes? If you leave the lane mux set by a previous boot layer, and
  make the device tree describe that configuration as read-only, what
  doesn't work for your use cases?
