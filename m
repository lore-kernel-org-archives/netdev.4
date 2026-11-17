Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930644;
	b=3T/YSxK6OlSFLIJCcNn6NjIjBxYpjBillzOEY/Uqk37Dot3xtfjQLK0D5AmDq7YKTGfH
	 6jcMlLdWY/zOR36JsYJwgn/m6S7rQrhKNsI+PdSNwCJK5ttnLEFl7xFhgUVZksJ0jcH0t
	 x8xAUVPpelJsxJ4uhgjxqNWmAXqcV49C7FG6G+jLrEKriu+whAuRBiqoRLAJCNGn49AMx
	 ceVhor9E4GxTdSlu+r6lQ6+zP+56L20EoMobFMQVnnqntBZSUdPaIYMcwWcmYuP1KnAch
	 21DZbfrwPrVH2iG5t8thjvQyfHzerl0xxOfh49/HPzKiYIGxswOK5QtzPls2ABeOCXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930644;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=hlGbt2Dmye+Llm4siD44J7NJ+mTsgc38HpApKW6jFL0=;
	b=LkTtDQwp5mXzUa0GkvPX0rUfU8i/mGk3tVQgMxcUC34HCYI5ctaznvO6+uObqdoFdwrU
	 Eyaw1n4aZ4rl3RDwWFiObXp7POFR8ZPvW4YrxlII+Jy5hROrBUvnf6xWLuDjUfQz575Pf
	 hWXFMk4aYRjFGE8Ii9qKCqIdJY7KNelL1Eu9NsCWMZFmpHc0nfc+rK9G0RGSwygIDWe7Y
	 8wbGNk3zM9tFWhiK6Gy+r6cxyLMAFc/bOF0382gUrFwthtYskByUYvfYFtHHP8oO+h89S
	 fSQVb1xi7+E+b5ZUjPtCyts9vfNNG6O0lVlom4X7Ds00Sg2wREaLUvC51BY7UMPPNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=evrMnYyE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E7606A889
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816E7606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=evrMnYyE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28050C4EDBD;
	Tue, 17 Nov 2026 15:50:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8581E5FDAD;
	Tue, 17 Nov 2026 15:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D25211BC005D;
	Tue, 17 Nov 2026 16:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794930640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hlGbt2Dmye+Llm4siD44J7NJ+mTsgc38HpApKW6jFL0=;
	b=evrMnYyEV+oEuzKpRUip5GJppu9aNSpb1G4PROqRkV/S7qPgG45henCkNgcE2F0fXYJm9y
	1g9aIlCKyfMX7QxiVvLw+pIjKcYyv5PkX5O+SEBMC1Y9Y1Z7GzZJTJax5C0oeiicC2M5Pr
	O8Ek+Ys87/DyyAPBXRkCGRslc+ZCjYVXkm2m+R8u+88myoULrpTj0VMWMnzJ+pLoWXATdj
	mrp/kRh0exmmfF+XCxTAb49xbT5gIeVdvXgeGs9cf4uibK1Ru14b/vfummPGLfvaDZWDRb
	Pr/nBcgyPZ4opdDnGpENQhHaYT/IK4AHSJxInxRiFtOX6sixKZewdRGfJRJ6Kg==
Message-ID: <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
Date: Tue, 17 Nov 2026 16:50:35 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi James,

On 11/16/26 01:49, James Hilliard wrote:
> The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
> is enabled after programming the requested state. A zero return is
> therefore expected when hw->rx_csum is zero.
> 
> stmmac_hw_setup() treats every zero return as a lack of hardware support
> and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
> then reopening the interface loses the saved capability. Subsequent
> attempts to enable offload are rejected by stmmac_fix_features(), which
> uses plat->rx_coe to filter NETIF_F_RXCSUM.
> 
> Only clear the capability if offload was requested but could not be
> enabled. Keep calling rx_ipc when offload is disabled so that the hardware
> is still programmed with the requested state.
> 
> Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")

This tag doesn't exist :

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/build/1212156/14986330/verify_fixes/stdout

Besides that, this is legit. Tested on AgileX5, CycloneV and stm32mp1:

ip l s eth0 up
ethtool -K eth0 rx off
ip l s eth0 down;
ip l s eth0 up
ethtool -K eth0 rx on

Without patch:
ethtool -k eth0 => rx-checksumming off

With:
ethtool -k eth0 => rx-checksumming on

Please respin with a correct Fixes, feel free to add :

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

pw-bot: cr

