Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441582;
	b=WYG3gfBw+tpwakay50tF8nJ8G1AruAnLa4iEHq+/FlNflmhSJ2iLE6bQHRuGjqQisyM9
	 3PcFq2z6QP64hm51DFkCWyvEwK4yDpdzkIm0yCYLTwHSSyyDxrfvNs0AA6VD4Qm7bhCSe
	 Yiy/HTRbVD2a8JdTytzodaqTL7STsIZEZQyDrNwvQEYwyjlWVay2pUlCEFxBy/w2lWeDN
	 ZIZhklt0TCuu68IVrIo8uE4+na2xLlwI933F/yGe5CU7nEAjJfFTIqEo+XXyZLnZDXHOt
	 dZWsL196uGt1s9t0A8KYR0wGN3aYE43MWHGuxr1gJML6tM+yj0XMhKhuCfw76bIWG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441582;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=SotFHZGTiXsXK70nWLsWd9AXfMdw3V7EYm9/120lqW4=;
	b=V7TSXclKfuw5zZHnxccvadvi2zAnRqQmGjlkGJlfncuY65MqGI2MbzhgxQ10eAZo6t/7
	 G3akF+Q8y7sO5BPEuwvEu2SrVE3HY7uBEUTsMY2QmTvqylWPuLgMHXuVIydnlxG7gqNrb
	 DeHEQbN95aEhHjPLFei/8zRWdvAnnL/dfViBbZy2kbsm+H9YgfHiMXM/WWdFpDlPmcmag
	 z2JCPXSW50oz0TFYaSp1ynN3pXnzIxdtmwqAUnoBTx/MSojPsuWtIerr9Na2KeH0p58QZ
	 8+uqUWMzT4I3rEtDAqxNFsR9WpCYe9NbiLrMaK7IRr5ahOvzRiz2omLNTd82/izdn9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MTrPHSHx;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149A3606A31F;
	Mon, 23 Nov 2026 13:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149A3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MTrPHSHx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 444144E4167F;
	Mon, 23 Nov 2026 13:46:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19BEA601E1;
	Mon, 23 Nov 2026 13:46:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 674E811E6A43F;
	Mon, 23 Nov 2026 14:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795441575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SotFHZGTiXsXK70nWLsWd9AXfMdw3V7EYm9/120lqW4=;
	b=MTrPHSHxIkh18uK8raQzgErDoiOhLJSxE5bbrgiiDaonDgjX0Ztxaw+2ED5vhIkys7pd79
	6D67pfL1SpRMPXBOP1ge2I9zzPQVoTt4p49AhI20UdSI1BO6Tds4dgIRyHyfl+7vIiiw93
	G0y2saO+aF12tnIUHNO9O4Hc/mDBX0gGZSAKQxvqPYm8ByTmJYsvy1Q6s+kkJWdV+l3xyz
	JWFUwR/nkogjSsTNaN5V8wXRObZ/NbDjq0KD3nC31TimFWvVdB6Qsh0G61tYlC5TrdwvnG
	OPL9NSuMK/DKR5RU4DA9sYDujfr94toDxW+dVaXK1Jx36tNP3sGnVs7eJUzF3w==
Message-ID: <e06178c5-19a9-426b-a71f-4c6af112924d@bootlin.com>
Date: Mon, 23 Nov 2026 14:46:11 +0100
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
Subject: Re: [PATCH net v2] net: pse-pd: tps23881: Fix reported power class
To: netdev-bot+sinfo@kernel.org
Cc: Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>
References: <20261123133420.708557-1-kory.maincent@bootlin.com>
 <179544113824.3294.17718997849062582647@kernel.org>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <179544113824.3294.17718997849062582647@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 14:38, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.

The issue was hit during development extending the current driver.
I don't see the point of explaining this but well ...

>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.

IMHO I think the commit message is clear enough.

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

