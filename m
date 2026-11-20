Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163596;
	b=ObddTt8xQi5l/ALT9+VxDf0lRfot6X2e7akp5C82VkEM5xwaLXH44RqGfvUKjbuhfQqA
	 P3FvR846tBzxYvZxwIxsHEyKzWcnHkDDyRX0co3SkHykEwdBZlgzphkJGcY8ildt4R45e
	 wL4OaEIajOtvCv2QuOz9ocEo+YgMxdtG1WpYLtgK5eWxwJxZPU2DqMEpg3ZHRdJIQJGAw
	 ExPLUxICAEUnNHyxSx7Dln9U0885wsEUupAU4C4lzbBGtehMYdlvnMeCrbIVUMtQ2mVtx
	 Nww1uc/NEi+ljINMQmuowpTNf87j+i6+BKW9rsr85+B/BihpqnxE80K+MJnSOoIt5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=67HAICSTbO8an1ZEL6M9ZC5fTvGl+DW6mNLPTBI0ZqU=;
	b=lQCzE/Y2AEx4vCw49/IhuJMZ5LhsxbQHpFa8h1v8WPQwJHb48qt6ti0JejU/u6V/PG9v
	 eUC5ADVenGg2AVlJqqCBk6YfnVikCzLCJx2lG0AjyQ1Dw3sPixg96gcpx/xyQ1sgCI2S2
	 P8ESS5kzhKz50Si31fR86wbKv09xpawco9G2tQOz2lB9H+4q53ux0mYPDrV6//tn5TIqN
	 Mmg31AXOlZta7woVLMuXzgZZGYTNRJL7QL/rp5pgr899xy+mJRkjrXfXSS/wdhu83uvzL
	 PFgPu8h7ELaf60XwutpJDXm03Jio1BUdCiv/z+KTWDKMEbNYqwumMvhUc85qxPNcr7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=AsVb+BLx;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7DA606A326;
	Fri, 20 Nov 2026 08:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=AsVb+BLx
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 006BFE838D7;
	Fri, 20 Nov 2026 09:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795163594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67HAICSTbO8an1ZEL6M9ZC5fTvGl+DW6mNLPTBI0ZqU=;
	b=AsVb+BLxGcmkdm1ECDml9fl6nEWpYEd5mxwKKuzjnHeiuJFlkPhKe2exWuTfygz15bd+WC
	mNRKqb2ydTCZ6BUBMR41m/VMg9u8DgwK+KM9C1lW4nC6GlthP2AC+fUtw2EODUEsg33XJU
	/K+fq9sAInRcE8uIN0WbljDapHkvU16YiVI64Zc5PuDuH/ge2zWiv2mAuqQhMkXa2skYGJ
	JVvNIZdb/hcThVEm98Lr4LY1TCzoE7WxBqBDXn1TeFILU0MvYYipcjtjIajOozpyzv2QxL
	Beoju7PtB/mX+67ij6tQ43BQqrNjw0yI0RVW8KZZHQ2otqAZSeHCRyK16d5rEA==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id cjDY1A2HVzy2; Fri, 20 Nov 2026 09:33:13 +0100 (CET)
Received: from p14sgen5.. (86-103-67-101.ip.tng.de [86.103.67.101])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 20 Nov 2026 09:33:13 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: netdev-bot+sashiko@kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Kyle Swenson <kyle.swenson@est.tech>,
	Ross Cawston <ross@r-sc.ca>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 06/14] net: pse-pd: check the PI state under the lock when setting a power limit
Date: Fri, 20 Nov 2026 09:33:12 +0100
Message-ID: <20261120083312.2324522-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179515691045.3136.13671979747174463292@kernel.org>
References: <179515691045.3136.13671979747174463292@kernel.org>
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

On Fri, 20 Nov 2026 06:41:50 +0000, netdev-bot+sashiko@kernel.org wrote:
> The check now runs under the lock. Is admin_state_enabled &&
> isr_pd_detected enough to show that the PI is powered and has a budget?

No. This is the same point as on v3 and v4. The patch only moves the
old check under the lock. Kory agreed to leave it for a follow-up [1].

Kory, one question: we are at v5 now, and most new findings are older
problems outside this series. What do you suggest to get it merged
faster? I am happy to fix the older problems in follow-ups.

[1] https://lore.kernel.org/netdev/2b82341c-be67-43ef-9a0c-0bf0394b627a@bootlin.com/

Carlo
