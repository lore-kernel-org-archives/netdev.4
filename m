Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163599;
	b=Lnq/NGI0VNKle+maX+7IJcbAsNePiHPE2plNQYgkSaCcYJpNKcISHIZV0G4m/KPRGrRt
	 gn4j0i++vVYD0xl9BkCV2ssYga04vRy6nml6eu5h9YP2TMQRxRFU3najWswUeiBY8/fDm
	 1W9iPV56FSdHU1suIoYMsyUsPc9RT3p4BjOopl/VjIfXXZET8rFiU8UHEd5egSptdisWb
	 EA/EcPl1QkpDwstdWOO4hJumoiDqXqJG3rZNKCEyzWgaAGBEDt4kfKd0J10TvfWUE4la8
	 Y6+sTeEdwXteKZr5AC7RROoXI6mx0CuyEbkeALYl8fjazC7ol5b4DjjkS0XhNx5mWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=I8TUQ2Otgnw4tRG5pW2zl7IqR5SFMPLHs4wIlFBnDWg=;
	b=cz4BP2f00dC3kQZKaQNLjs+PKE3ohWhI8N92hdstNCX4mNuaZQVYUQ3gxsaWUpoJBFUg
	 I9nvRzM8tVu6uDOt9sS1eHNtaPUk7WRjyadEFuL8X1KFQ36LgJ2XepzHGHgzEBu7PoDYF
	 r7fEuBdV3WfB/A5eDSrrMHJxmDsZXClUlN4a5jfgBEBdRAAnl9ib7Uo3iAJLfYM38/wqs
	 elADqq7+/NPzOL/Q8XfxV2WLNIUq33e+6Jy1gcYpfmqBwfkhu7vF6PftWVItlKsGRhcLg
	 mwqsD4Ed1HmsOilAqmq9Q43SiZlb3+8jVyk+w7qK+p9OWrg6ZLSUOtqvrDeVbTw8kAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Qs887Ed9;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499A6606A333;
	Fri, 20 Nov 2026 08:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499A6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Qs887Ed9
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id E1F25E833C1;
	Fri, 20 Nov 2026 09:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795163591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I8TUQ2Otgnw4tRG5pW2zl7IqR5SFMPLHs4wIlFBnDWg=;
	b=Qs887Ed9Md+Eq3NCAn42k17TmcVocxFAQ3OAbWlIF13QgAtIWDbirI7fT4G1xcQlMbPfWL
	ASNvc0PdwQ22X6bxDtQOehOxv5M1x52SqyRJOZugyInh2d3jsNff25w5MxDF89G/adlps9
	/GqNJtJOjykfsChI8Zed7wwx7Ka4Eh1gugKL28M9+slxfDiyZ/mDYh5yTcTt4yTfbHfl2F
	yQd/p+2CTTDko0cN8iDEc5MI6tAAKJhOw1yYRivpUFu1X1+KKAxa3Xp7NHIHpIHhp1naCO
	ohUxpMcU9a3+inonzhrHwR5dXWb2yww1Neqxjarg6Hv/7DDLzOcd04fO6WqM9w==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id qjp0XZ7a-GVv; Fri, 20 Nov 2026 09:33:11 +0100 (CET)
Received: from p14sgen5.. (86-103-67-101.ip.tng.de [86.103.67.101])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 20 Nov 2026 09:33:11 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: netdev-bot+sashiko@kernel.org
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
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
Subject: Re: [PATCH net v5 05/14] net: pse-pd: do not reach a freed PHY from the notification worker
Date: Fri, 20 Nov 2026 09:33:08 +0100
Message-ID: <20261120083308.2324502-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179515690895.3136.4077280921885475671@kernel.org>
References: <179515690895.3136.4077280921885475671@kernel.org>
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

On Fri, 20 Nov 2026 06:41:48 +0000, netdev-bot+sashiko@kernel.org wrote:
> Would wording like "NULL once the PI has been shared by several PHYs"
> match the code better?

Yes, that is better. The Return: line also misses the case where the
PHY has no net_device. I will fix both texts in a follow-up.

> This is a pre-existing issue, not one introduced by this patch, but can
> the worker still use a freed net_device here?

Yes, but this is older than the patch, as on v3. The cover letter
lists it.

Carlo
