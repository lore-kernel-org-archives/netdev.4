Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996490;
	b=uwCtn5C9ZaD729SbyFGZkzMCQmrssiPGRD3sUYxGHlYB6RivtEpk76D9nKGr54SpTmZX
	 GVxja1m1iSsAvWOcBrjvZ5fuMIyKOFipYbf+AjlR3mN4MOxXYLC7SSKWBmwH4csd1lQzG
	 C24je/GcRcXQsKHrDXcb9ZxoUmO2sUdj1eIQuY87iFwTGQcZ4UEh0otKs+2nZlMy5U4OO
	 fUIfsYM97og4nbtHVSiMvjOvyx0pXsNW6NYjLkb+BufkWT4cKwa9nT1DW5OG/1amS5ks2
	 PzRzG+r5p4Yes4UuyL7hiNgmpgAS3jgTNLXyoEEF9JryZC9QTYUIEY3f8mxWVshKzyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996490;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=2fYXTXftmdzsP/+f1B8lN9HNa0Az3yORMxg4vrQ+jss=;
	b=J14PZ5kXC7YeNTQZCIY9SRJta+9gQFi6PEOJkUE0dzqSHRaV/kWZeJ0z/JHw7eT3zX8z
	 jRuDAM9xHo+i0kVS7inQtNzRL5TUOZxqCs+gRRHnUGivEo7zkDaXv9Se8nAkzM3/vBc9C
	 ussqEuO7x/MZQBAkJNMfM6VSMNBwXSzRIoWrr31ecmDEX3AFzJfVhBe4HqcbIMjnG7HTP
	 C0d5+EgqyTlVyNcMm1b8mr8uX0HC9O5L0tB9vAghpUskpBqjHeANtJHE5+xnupkpExGxV
	 J7IPSWFa7oaca9dmjjqZOQKBDXUcT+XLyDv8VL7soFTicGTuanedI1e9dCGKAgOHfZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BB68AZtP;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D1606A320;
	Wed, 18 Nov 2026 10:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BB68AZtP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B82171A16CA;
	Wed, 18 Nov 2026 10:08:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8287A5FE9B;
	Wed, 18 Nov 2026 10:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2AF211BC0FB7;
	Wed, 18 Nov 2026 11:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794996487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2fYXTXftmdzsP/+f1B8lN9HNa0Az3yORMxg4vrQ+jss=;
	b=BB68AZtPrIn+wgtM1x0/qC7DyHiQUVWopQ1ssGA+Y1TOzd4KMKNB60b0LVYKPkFD9VcV76
	ahMku5oXly3kXhg6nJkequfEi/o0utfR/TvUIWlGNImc3vP8BvMvUmRhApieN4/N8KCYwf
	l/hrXd2gA3WjA1e7vKM9KeUyM2WBZtiXXEmgNKvH+TG1Oe06+7l9vFYVM5eu+iB6h5xHek
	T6qgOu3gbAJO4lJ4ZPDdXG1UvhMV/ebWvbqw6X3eYH8AZJsdXGhjHefWqHouqaF3BjGsFe
	WYmaBt3S9BMHRDLD3gqOU6/f4gY/nvcQfrmV9CiUUOFvB1zN3BEx8peLKIbNQQ==
Message-ID: <2b82341c-be67-43ef-9a0c-0bf0394b627a@bootlin.com>
Date: Wed, 18 Nov 2026 11:08:01 +0100
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
Subject: Re: [PATCH net v4 06/14] net: pse-pd: check the PI state under the
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
References: <179477645553.3136.3930514306381646741@kernel.org>
 <20261116182052.1262742-1-github@szelinsky.de>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261116182052.1262742-1-github@szelinsky.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/16/26 19:20, Carlo Szelinsky wrote:
> On Sun, 15 Nov 2026 21:00:55 +0000, netdev-bot+sashiko@kernel.org wrote:
>> Does this description understate what the old race did? It looks like
>> the budget was leaked permanently, not just reserved for a while.
> 
> Right, the budget is lost until the controller is bound again.
> v5 says that, and fixes the old "powered" comment.
> 
>> Is admin_state_enabled && isr_pd_detected enough to show that the port is
>> actually powered?
> 
>> Does this still leave part of the race with pse_isr() open?
> 
> Both were there before this patch, which only moves the old check
> under the lock. They need their own fixes, so I keep them out of
> this series. The cover letter lists both.
> 
> Kory, are you OK with fixing the two older problems in a follow-up?
> I am happy to work on them next, if you have a preferred approach.

Yes, I am ok with this.

> Also, are you fine with the rest of v4? I kept your Reviewed-by on 8
> after the small change there, so please tell me if that is not OK.

Except for comment change or commit message change, I would prefer to 
have my R-by removed if there is code change. Thanks for asking.

For patch 8, I am ok with the changes, you can keep my R-by.

Regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

