Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206592;
	b=OnKOPkc4Xcdu+918XQDeNUgapmUUa7IdZCM/wFGS/ntiUK/NS5HSIn4VRl0uF+PhUqgq
	 G1lU9kcVgH+hq6GjdSRpv2doO2x+MswPh2AZ1lU8TgTMKRPmrdf6ef2YllgVgu4QnCMbe
	 v6Md2K+y6h2AV1JEbIR+DE1mBFB4F2mPnxhmJI6Xl0lyBrW1WedK7VX2EUq+cCgx4vbtH
	 Tmprfpd1HhGOoyQsbgNWRnuvzRsh/h8FILURF95BeIqskE8GM+GVh090bRnt9iz1fiKZc
	 zO598dTWlMQ9tTaBA4oiMCKnqWBIdX3G8rpCpq0uit8i51klDUK3qCnkWnW8uPItAIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206592;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=h3ow/BbNuDYJS6H6glK8M79YXas//OK5TqTnYZxokFg=;
	b=JdCQaGH22wwSKBATJZn8dNtbFWmifbY4dsNrIb/BDOnWXUNnSoshmIq+7xudnju38SQ4
	 RQJHz6gE3GCUb/89uRFjDj/+xYOLjePqovruLhD9Ur6ouKYoMvrcL7ypbyvyWEyHG1Wl9
	 bUX7IMmazOYpLfiltgQ1tCcjVS4w3dVkZY7113zOr/hGjhWHgtIu31vS0FS7WK9i4Tl1b
	 0rJp+v/fFVQjePBqQbwkF4vkQpiY1qO51sNMGwkQaHXDXEQH0APvYRvgYG4EoXuTqaSD8
	 dCDfPtw98h518ofD4ujQpQjuHjDdMD7BlOj1Lp52zFkmSV2pNuTkgtCsJGE5LrFfHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="o/tPdefi";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76819606A320;
	Fri, 20 Nov 2026 20:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76819606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=o/tPdefi
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFEA2A05A5;
	Fri, 20 Nov 2026 21:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795206581; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h3ow/BbNuDYJS6H6glK8M79YXas//OK5TqTnYZxokFg=;
	b=o/tPdefi+2ABf9FFThFngDTSoPA+OXELbxYRO8BHg1OM3SrhVLoew99kekjJubfy5h5lnC
	21OvNfu0HXrsmAO4ITRhT1VZwP+zPFK2AyYyQdASaBtAlcbhi7tZbM/w5JAQrl/xAz0s4s
	srskIzhGgnYAGtpknfnkiNVcih1NV89tXe1vR02xQEKV0PiS15uY9yUImLeBQD1wFfli9H
	Ztsnup79WLu6rv2JFJqV3BzZoF7VHVz8xp3eYBSs6pgbqwuFltSXEPCxOv4KYxZAdueiOV
	9VLA5kck0vlrjWV0K1qssOfqavNQbqYLdQrgvg4sxi0aYHF6zDOygy4TUp6m9Q==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 21:29:40 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>, Justin
 Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v5 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
In-Reply-To: <20261120194318.3952487-5-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
 <20261120194318.3952487-5-florian.fainelli@broadcom.com>
Message-ID: <905c34c37a843cfc95f95e10b32f513e@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 20.11.2026 20:43, Florian Fainelli wrote:
> Add Clause 45 read/write support to the UniMAC MDIO bus controller 
> driver
> by implementing the read_c45/write_c45 bus callbacks. Each access 
> performs
> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
> under
> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
> MDIO_CFG is only written when the mode actually changes.
> 
> Since MDIO_CFG also holds the clock divider, unimac_mdio_resume() now 
> takes
> the bus lock around unimac_mdio_clk_set() so that it cannot race with 
> the
> read-modify-write done by the accessors. Resume may therefore wait for 
> an
> MDIO access that is in flight.
> 
> Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0 
> even
> when the controller is still busy. For C45 this would let the data 
> cycle
> or the next access's MDIO_CFG switch start while a frame is in flight, 
> and
> return the command bits instead of the read data. Check that the 
> controller
> is idle after every cycle, C22 ones included, and report a timeout 
> instead.
> 
> Also skip the BMSR workaround read in unimac_mdio_reset() for children
> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
> expected to respond to C22 accesses.
> 
> Note that providing read_c45/write_c45 also makes the MDIO core scan 
> for
> C45 PHYs at registration time, on addresses that are not masked and do 
> not
> already have a C22 device. This is not the case when the bus is 
> registered
> from a Device Tree node, which masks all addresses.
> 
> The platform device that GENET instantiates when it is probed without a
> Device Tree node (e.g.: ACPI) does not mask any address, so it is 
> scanned
> too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a 
> timeout
> per frame since GENET's interrupt is not registered yet when the bus is
> registered. That makes the scan slower at probe time on such systems, 
> the
> same way the C22 scan already is.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Forgot to mention: Your tag needs to go last (v3 had it right).
You can keep my R-b as the changes are OK.

Thanks,
Nicolai
