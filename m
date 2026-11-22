Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366000;
	b=nl1gvgYIF3RPUbw1TIYdpcG5n+p4ezkMaJiDJmvo/9ka10R0Jk7d3wsgQP0/TlDVI55S
	 QTwCZ1o1tLlvLVIoRdjCjYSK1QdzBNv+R14D/8GSsDWKi42eItWM3Jrk5GO12Q0/3Llia
	 J/YWSDeoM1hK3GWfwUvfCVFQFxsVWWeMg3uvK/aOZUsR03cmkt4+M0SHY5KA/0U4dR0J2
	 vTFyszwAJ0XwFvZT/Bagxs6qiPblBW5jvzmGjCyyk028LjnKeDI3ySEgmyADOO0BwxqYE
	 HJFiYh9IQMqdb49KdnDSQBnRLr7h0Gewf9RIWk+/TYCV//80kOeuKWq7WGReyrw4cgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366000;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=kvebEYYRpBibXTgS+DExvB7j4D0K7uBYjg5knaplyCw=;
	b=GzNuLSe3RIUxtgMKO8Cv2YnQrMa5X5RAlkvi7FK6sJLa2y6Vf5b0ytl/rjkSNdAWec/Q
	 AHFQdKOpT5IhozzUGifPtGvNvkwGTnm0V+imI5GWnWYdCyvkB0JVqhLMBoYCCvToujVoF
	 L+pRmIbfrOmxTF7qQTPY7Cx/17mSDItnyKYaD/wc4JyXMwt+af1nlKWX+TcQkHvZ1357j
	 w1+6wT/34Lxl/7YbBZ7sYEJDhINXz6oUuKURA+4OF0qxnAfa0s8EJJaTot0EkF6hVE4qR
	 hRv9PlLqTBpn7EsC/F2vuqhSVJSxDjhjaEgCz7UyiYR2YZy+OuCFgS4gV5NNzPKqNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=QcAyzoY3;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9389606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9389606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=QcAyzoY3
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18107A157F;
	Sun, 22 Nov 2026 17:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795365997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kvebEYYRpBibXTgS+DExvB7j4D0K7uBYjg5knaplyCw=;
	b=QcAyzoY3KDt3s0WUG84t5JVayXocmtRV3c7ffhKWsrGqLdLcROvcp1oXcMnP3+s9YEbZw2
	D1SF5m74J2XcH/54Sna7HLZxo2QpDlfE170nIE7QDiH/MSiH449FnwuvSE4TW22lDgG7hu
	R7t+ykbhqaibbNW8AHcq1xe+VWIrwrVg+nbPBmTv7O38tkkt2ERleMuT43UVMQbP3G2Or4
	td1PR5kuIuQ6vFr883JA2LKofKJVtugXS0OTp3vAuOWh4Zr+ze6o4tan9+z2dH1Dp2OTsM
	WLGgEmrnE3GmnZ2wfuZ5JZn2+kezECLkzlT2hOVRK7WmpCXAqsHhjIUHPQqwXQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:46:35 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Artemii Mashanov <ralerrdirsardx@gmail.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] net: bcmgenet: reject undersized RX
 classification rule buffers
In-Reply-To: <20261122091748.18292-1-ralerrdirsardx@gmail.com>
References: <20261122091748.18292-1-ralerrdirsardx@gmail.com>
Message-ID: <d1b3a04e0226d857415c1e72110e0168@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Artemii

On 22.11.2026 09:22, Artemii Mashanov wrote:
> The rule list can grow between ETHTOOL_GRXCLSRLCNT and
> ETHTOOL_GRXCLSRLALL. If the supplied array is too small,
> bcmgenet_get_rxnfc() currently reports success with only the rule
> locations that fit.
> 
> Return -EMSGSIZE when another location cannot fit so callers can
> detect an incomplete dump. On success, continue reporting the number
> of locations copied.
> 
> Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
> ---
> Changes in v2:
>   - Retarget to net-next as requested by Nicolai.
>   - Clarify the commit message and drop the Fixes and test lines.
>   - No code changes.
> 
> v1: 
> https://lore.kernel.org/netdev/20261121001550.732679-1-ralerrdirsardx@gmail.com/

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
