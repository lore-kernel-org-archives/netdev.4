Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163598;
	b=MRyp/JxpiC041j645NPjQftTyMmONQf/4npPjFyCGZTmeVNr/V2ABSweKJd3/G9qIPfe
	 5NfbufhnZ97GK0tza5WysvF1SmDbYA/Lo1fs8SjaqpJBmOk8efA7i+daGrQ01DMrikGvb
	 LriLtgcuz3ZJBTH/xIam68m+tTixViDDRJMi2p9rBcgTw487BvWqWQw6ZNeLpk3/YdBCv
	 KGpEalZ/hA2jwGQt05b/mukqNGYCQqoVmbzo66I8dKFyJWW8oVQhJwuLOmJk4qTIU/RT1
	 XiDkdrXqqv/eZuOUTqvcCF7O2V4CV3mFYOe/rsxA6vYr6C4a5nR8MA5/Dm9eW+IQPKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=gRK1+zXwWbXbbdS2C1qEkPcV9//G+Iq/IxEP4Q9tnnY=;
	b=wW088vRmX7or1XIui0mBC36ELxi3nOm6kgno8qDvJ12H/JhnESZeUSHZRVPPa2QcaL8Q
	 0HOwruCItHsROAxd5368ObIhlZ7NpYgchXWveZUAwbV9v48D3rOQ3pLtl/4fYTprllsKP
	 SjaRTyP/BXbW5wCW+EGMkU4Vhd2EOEfhWLlmEHz8ogw+QuaC7WUfIgxqLFFTWdQFWwres
	 D/Q5Oqqnmvdr+YIXqKqN/GAgA8GLF/7d+jqX4U1d8eVWAGw8qYmqfirbvC/taPe4ZIAwH
	 Z/MOaS47XBqVU3tLjS2E/oj+rviQC1vL7ExJdwxhZE2W/s2xJWNOvLvenYENFEZ47SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=auWDDlEM;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED3606A337;
	Fri, 20 Nov 2026 08:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1ED3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=auWDDlEM
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 3EB4FE838D9;
	Fri, 20 Nov 2026 09:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795163596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRK1+zXwWbXbbdS2C1qEkPcV9//G+Iq/IxEP4Q9tnnY=;
	b=auWDDlEMGAhKa/3TjVLnkyVPreNpRUOGVb7Fgv6/oHjwWh8fuPMhPrv5GKuHWZotkTijOV
	QOUV3ze7F0YCESUI7cZ9GL+/y+jf8Ie9PFNuIWTGbV1x2m+KMsTLjd9mOhzWYX9AukMtel
	LmdHb0jS/rW2kMUl2DUxodN3BJ2E1CP340NsccSeaQuSzyinDFAp08q4sX53NhEy35S1HX
	ikLB9J+3/o++tw1mpXT9Z0UTNDmptaBsd0mD1lLluz8hmTRbiMYyzvbRzELmkTR8QVXzGl
	A/DNcJQSXRsl2+0HH0NLGZFygdqhZXTp0xMA+NkMo3dPjpsWYevVnK/LUN8xRA==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id NjzHu2G8p-oY; Fri, 20 Nov 2026 09:33:16 +0100 (CET)
Received: from p14sgen5.. (86-103-67-101.ip.tng.de [86.103.67.101])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 20 Nov 2026 09:33:15 +0100 (CET)
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
Subject: Re: [PATCH net v5 07/14] net: pse-pd: do not tie a shared power domain to its creator's devres
Date: Fri, 20 Nov 2026 09:33:14 +0100
Message-ID: <20261120083314.2324583-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179515691186.3136.7466953769773810210@kernel.org>
References: <179515691186.3136.7466953769773810210@kernel.org>
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

On Fri, 20 Nov 2026 06:41:51 +0000, netdev-bot+sashiko@kernel.org wrote:
> The new kernel-doc for pse_alloc_pw_d() says the domain "must not be tied
> to the lifetime of the controller that happened to create it". Does that
> hold for pw_d->supply?

Not at this patch, but 12/14 removes pw_d->supply. This patch does
not make it worse: before it, the whole domain was freed with its
creator.

> Could the kernel-doc here be adjusted, or could the commit note that it
> depends on that later change for the supply handle?

7 and 12 have the same Fixes: tag, so a backport takes both. If
there is a new version, I will add a note to 7.

> This is a pre-existing issue and was not introduced by this patch, but
> does pse_flush_pw_ds() leak the PI's reserved power budget on the shared
> supply?

Yes, but this is older than this series. The cover letter lists it.

> This isn't a bug introduced by this patch, but the commit message says
> the PI regulator ops use pw_d under pcdev->lock. Is the publication side
> in pse_register_pw_ds() covered too?

No. This is older too, and it is the same short window during probe
as the cover letter item "The PI regulators are visible before their
power domain is set".

Carlo
