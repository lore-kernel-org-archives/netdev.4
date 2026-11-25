Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595332;
	b=Ms4jAhwKP1jOvWvAkP1Azq/oQ5gSwV06sYTquO1J9Q3OWdRYWLR2HXBI6KXhz5otvxvz
	 E1Z1oqTz/KN0Rp510u3jDwQ3b30EHhzs7zhbpBTarEl7VJoo1+3qdV1vOAfCapNAZlnsw
	 X9SK0FtRFXY8POOl/DWlWOaO/rLobdlAUURADP+gW8xNKQQOsuluMwnjeUI2MfoVEW4KN
	 UDwmVpdqobzHcwD3aYgBfuEk5xSuo33kYYHxF6cRi3434R1TjviL46k8hlsHJSXw6kZk6
	 VfUxjNxV5x5uqVvQqQwCMqbmpPWceqRrEBx9YYzfqdb7HO4QMgbLi2VcHyVesucBc0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595332;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=4/x7j50MQJx15iZQDZRl//Wy8YqZBKp5oVRm2ztPBoI=;
	b=5s2kEaUnYYa572nQPTGv0n5yX91CnHN1IgwHNM3I6nzbRUGlCePPCBMnMSWuCw1udzoE
	 rDFSEi+5hhL4dHiMYOL0aOiSjatADtXcaKJu7TPH+BUP3KqxqmcfKfp6UivZjkeAcbD0N
	 hdoFEPtMjvelODciM2PTVnAMfbsgaifPXsB3szHRkzqGmDze0U361uR4Mnf5SMu3c+vEn
	 AijNT5WLaev5vXFmDRFlHwU2xK8t105P3yNXY8mWPdyy7q8BoSsbr8UMgrp5BclNHakOC
	 RcdtDV2KX9w8maaWoPC9g5scHPNzl/WlyI/BnUH0psQlOrlPRZ2yvGwEGtcmKk2t6hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a25X4E02;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C372606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C372606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a25X4E02
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FFA84E41770;
	Wed, 25 Nov 2026 08:28:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A9EF60480;
	Wed, 25 Nov 2026 08:28:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBC2411E6993C;
	Wed, 25 Nov 2026 09:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795595329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4/x7j50MQJx15iZQDZRl//Wy8YqZBKp5oVRm2ztPBoI=;
	b=a25X4E02hlHdAZLeh5VeHxN6+rjmKkzW9i2wpZ/aAVuugJ3MhGFp/MhlILboBpFeQrLS6p
	btaDqDM2H7xJlrfcz+RX7BjG78aD4/ETSqwQCSyqhGkrbhsHwEkozspZam4CAi6QNErfla
	X4cZFjL4zk+R+7axwU3Lts82blj93HcjkzkiSEjLEnO8XGY6cNRu5eTaAvhT9TaGGAsCH6
	EYOgRgkcR8ifvWMI22u/GwqXqhKoPjneZf8UAyjxbj9neMT5lNZwyFv5sqMrod0fIPcK23
	tFEf+qgwfm2eO9AZ/3N8Hwxzz7t37W+uw5aQMybCXkIfmRgiNX5ApaBhMAAuyg==
Message-ID: <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
Date: Wed, 25 Nov 2026 09:28:35 +0100
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
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: zhu xin <zxyan0222@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
 <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
 <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/25/26 09:22, zhu xin wrote:
> Hi Maxime,

> Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s a
> PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
> about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
> FSM is still timed during a flow-control stall, that would raise a
> spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
> link locally to verify it, and the databook only hints at a large-mode
> (LTMRMD) without being explicit. Would you prefer bumping the default to
> 4s to be safe, or is 1s acceptable?
> 

Yup, this should do the trick. If I'm not mistaken, you'll add some
better controls once you start upstreaming the glue for your XGMAC
device, right ?

Maxime

