Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167134;
	b=G7L/V3dnuwpcu2Kbk7Kqs7/0IyJ4iY/tr3WmyicGdmaSt0tFqUKCtApN/SBnY0+o5wBd
	 Bx0MR7r4gkvUk+1RHDf5VfF/zPL00kTMQ2Nk0CYgZuQw6o7y1tTZBQvlmycZbTHG+Vn81
	 My5cIg2m9K97l2G2oBl/Mpc8cMa7tG35D5GwxIZV9+eS+U3zJSux6km+xbtW/JwxmOO7k
	 +87s1GRJGn2kIrx6didVlXy5dV1NEvEROjgjeKkr2VncQFEmbWIX/sWru4kg1XtmhAD8q
	 sr8v8oED5gTK+CyQWHpVY24cU5yX6rFKwjFRAJgTm8dbtlSo7Owq8K3pUH0m3lA7RQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167134;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=NOdHN8HSi06sDrJLUdjkF+/dA9o+toApfuz7TH64mOw=;
	b=ZFnjwt6SKYTpnLA28Cbj4ewpLoenXHwJfNSDt1+ljrr6c806akQHPSEWfQs2zNfy7Apu
	 FJl1+W2sQWN9RQ9lI8Ya93fQGjrSnGzaUzpGvE7hr/QCUNOlengXzLSr/X8UX7Q1rKUzE
	 d4KusKbaTBgaKAVIP8sk2Xw1SiJHiM0iDGrPg1qugshWQPb2sYVjVpO90OVkCo7TgAFH/
	 /u9aKLN4Hso+6Xab2219afPxn30BmTkqXb/8YOKPW0XNugJZM5vjziPhWPtbsI+CC1HHP
	 bYMSp3r0IhNhdIwA1crYTZZVzESbiy1wIdlIu0S2DpFcv9OhqxIK8KpTlFqSUJ2yDFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0xS1lnJG;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C10606A337
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C10606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0xS1lnJG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0DF491A1740;
	Fri, 20 Nov 2026 09:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7E3A6017D;
	Fri, 20 Nov 2026 09:32:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB32611BC0EC9;
	Fri, 20 Nov 2026 10:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795167129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NOdHN8HSi06sDrJLUdjkF+/dA9o+toApfuz7TH64mOw=;
	b=0xS1lnJGlmwliZy8MMggKiEvVyPYie91pstHyIlVCfKnUZl+K9fiSAoHeuM1sxmGCl/WIL
	iOeXaqpzFKJ1PBmMXGtDnfeggNgvqyJ4eLiHih72EgzNnvf9YkZzhZcoHPtnfmwbs3Gc7Y
	6063AIdoqm1KYWamSxnlj4fMf4SR5fllXmmLNvVYYLIAFmudegaicrIyiapkzOCu6Fh6TM
	4hvBrZafbqnTjhHPYVjS1OIQIw+Nm9eEnLPzdFiNWOEg/lmt59YdZZqRObu989gAr2YocD
	tSanyMLyCWdvKhJI7fpKykRVtP9XYbM9fLWcRFh5EAsNw9vhLqqSg/Vw1BmTpg==
Message-ID: <c84543f7-b824-4da8-9f8a-8e15d8f89140@bootlin.com>
Date: Fri, 20 Nov 2026 10:32:01 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net v5 06/14] net: pse-pd: check the PI state under the
 lock when setting a power limit
To: Carlo Szelinsky <github@szelinsky.de>, netdev-bot+sashiko@kernel.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Kyle Swenson <kyle.swenson@est.tech>, Ross Cawston <ross@r-sc.ca>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179515691045.3136.13671979747174463292@kernel.org>
 <20261120083312.2324522-1-github@szelinsky.de>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120083312.2324522-1-github@szelinsky.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/20/26 09:33, Carlo Szelinsky wrote:
> On Fri, 20 Nov 2026 06:41:50 +0000, netdev-bot+sashiko@kernel.org wrote:
>> The check now runs under the lock. Is admin_state_enabled &&
>> isr_pd_detected enough to show that the PI is powered and has a budget?
> 
> No. This is the same point as on v3 and v4. The patch only moves the
> old check under the lock. Kory agreed to leave it for a follow-up [1].
> 
> Kory, one question: we are at v5 now, and most new findings are older
> problems outside this series. What do you suggest to get it merged
> faster? I am happy to fix the older problems in follow-ups.

You have my R-by on all the series so we can only wait for a net 
maintainer to take it. Jakub, Paolo, would it be possible to take it?

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

