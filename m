Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169342;
	b=eRcr5qr5YaxfgIjiOivF7w7F2+EJOEhUop6H3CuBAQpQ8Cl6PnH3cMcD90z1QPbqJe6m
	 KK7Hg5MPr0QW6aPRrb814az4W+jdYMNrTkZpHu/YFN/FJ1s/OccYkgh46QoUVgbTvtju0
	 VS8gS7kZ/lCunY7uztpXigrlVm44aV7G1HzLJDc+kiomwtpdckypnkgRmCCfJmERoaRs9
	 KqoDYcAGw05Lc7qA9WjKSagkHADIsYTDlBptKdT7wX0pFgVY7GaPvRlOr0ZY4VCVwCmI3
	 /14oahPkURvZxlm7WoI9XvI9ZXJ3nJd/8jb47h7M3ASvFKgWeGg7T2YuUMNhxl9ubdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=diAxCvBmxCzn9vr9g/QE+jn9NsRfHKLZzB9vtgfyIbo=;
	b=eZBtZlv5K63BurprvRll9DxSVpLhhCBxKUZZN91xzQT4V67oC7saq0T/cpONPdNp0UXd
	 4KBa4Bkvynav9I0Bn2ioXLERNeNdFt4LijMHR8/0G7kXWCLMqwOKZQhRqrc0c4S9hFNXn
	 ZTfPJtXkdw7ZVwosj4b7RRnoxuM2NNHvbKeMVNCW9otUFzlac+5WZ2mY4LS20+kXjvN95
	 YKFVPlVyJ5hcaUZGUtfHcVEwB/rsvCAofV+PAeGBFC7rv3bPfwxlFlaeqnwi3BQrpTb3t
	 l21onmz6sNB/p9D+jFwRdg2j5IdFGCSLxJdQBYBPf6baqs1w2UY7R6WRKV8QTkokAwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b="FIQ/Kxze";
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B67606A326;
	Fri, 20 Nov 2026 10:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B67606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=FIQ/Kxze
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id D5B85E838D6;
	Fri, 20 Nov 2026 11:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795169338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diAxCvBmxCzn9vr9g/QE+jn9NsRfHKLZzB9vtgfyIbo=;
	b=FIQ/KxzeG6h0ta96HSPaw2WZHaHN0HTmSfKaMluLqmmqpgOVusAMDfyYFaMWTzERVhn8W7
	CS2adP+PSifZZkYR9oeQLs/rwqTOiQnvzuh5l1XAa7YD+jna4OxsNKgjhAJo6qimI54ymp
	1nfUAy4rxNmcAeRvoBUJMsAgxFjAkmjbUXnlni3zyb6Jads1UFMR4euTAYYuftmFIliIYk
	XQto9MvsdOJDpuRN0/pcApXT/PvdMZQccqYJ7CYXhog3VQ/vom/FJOTaSFFj5Bx7RY05xk
	PIY/UxJhIPBjteFwFXWCXhTwefX6mLWnbuFExLiZixUBsEkIb2xsrufWv/CEkQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id aRN9OoRJrHc7; Fri, 20 Nov 2026 11:08:58 +0100 (CET)
Received: from p14sgen5.lan (86-103-67-101.ip.tng.de [86.103.67.101])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 20 Nov 2026 11:08:58 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev-bot+sashiko@kernel.org,
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
Date: Fri, 20 Nov 2026 11:08:51 +0100
Message-ID: <20261120100851.2377899-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c84543f7-b824-4da8-9f8a-8e15d8f89140@bootlin.com>
References: <c84543f7-b824-4da8-9f8a-8e15d8f89140@bootlin.com>
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

On Fri, 20 Nov 2026 10:32:01 +0100, Kory Maincent wrote:
> You have my R-by on all the series so we can only wait for a net
> maintainer to take it. Jakub, Paolo, would it be possible to take it?

Thanks Kory for the quick reply, I appreciate it! I am looking forward
to Jakub's and Paolo's feedback.

Oleksij, feel free to share if you have anything to add.

Carlo
