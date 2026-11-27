Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774982;
	b=37xjEuglNuvJrje+m3L47OXqT6SbHHvenZqIUI4S6cxvqDst2SpRBR9WlDM1smkRaDNf
	 8knEQkqFIFg5V9wyaXbA/nNotJUGkgdxeQ4/Y3G5az7yZj4+J03okwa1TUpI++YBKgq5E
	 4ChxjVDQexXsxRKdJiQlTC4VFeIeTAUTT8aXvQ6siaBp5pdwsuySW9i9WBMOBX631V0Mf
	 8uyT9EAigjgifF16W0kFSpIxn+IVtw/NZ5CQ22Omrfydm6821EVY9MzqjymNoCmfhbVwc
	 ty3jZ7qVZUBAAiBK52vhLiOOCH55I8LWugDlCz5bqsPiusuSTsCS7w+/HoxNTXO5FWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774982;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=gDwkOnp2LvRTB/zVL5oprT8GvNodnF+cyhcTLQbY5nc=;
	b=1hv8c/6qJzHuzXnXrYQxcPgfZbu3L+L4UUfkQLKnnRxFAnK/Q4Odj8RDw6vMEXiYK1yI
	 GnEl/wm8cgGdE4yooltEFq+oP+XaO+SYQujET+60Gg+ZQkHfB+8zK5ZvZA4BN4sAuJNPl
	 6RmWlLPULVAKZn4qB3uNoWjNDrC1diDAoaBEjAxxjgscRS/1sOH7/oJgrbGETqCFU1Zyl
	 Mn6MMGEfcbgCTtTiva2A9MU2axotFuEIXaJs1HmfxMZq4xVs7xBpC+WI9+tgJtyU6AMgG
	 B81s43+NI8z45ASGBTq4/FgPJkPqXKqO1QNdclNW8Ma+Axp9m7b6uPbJUJzACcFvE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=jqRVQqbd;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8175F606A6B0;
	Fri, 27 Nov 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8175F606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=jqRVQqbd
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DC93A15F9;
	Fri, 27 Nov 2026 11:22:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795774972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gDwkOnp2LvRTB/zVL5oprT8GvNodnF+cyhcTLQbY5nc=;
	b=jqRVQqbdfgPFhTwAiAp6i+43rOP2cVaFUxtS/4kFv6uriGv5LgbTXwlKJjfInSK1h2zXER
	1E8PmGCvxkHEcR7hn+cIApEKBjxmJlk40diwpjLMfKqQZdL4HtzLSYUh6OPJwxSF1f39gt
	qCAK8L9tIj3f+gslTlEC4v2NptvK26MjV56czxUZtS63sxfnWngxV58NekiS2ACwCaVwBO
	l26LryO1AQdiWAZruhpXkboOmQwx03YCbJD+nM3khsUrE+aQohAVKr2tqm9B4p1qtjM39q
	nNM9MEG9CDGA71A94HCqBFQNzNHxjnv1weSmDUxDDQjEB1X0Y7mUZwHG9I9Krg==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 11:22:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH net-next v9 7/8] net: bcmgenet: allow the MTU to be
 changed
In-Reply-To: <20261126121541.6gybeqbkxsvjav5i@DEN-DL-M70577>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
 <20261123-nb-genet-mtu-nn-v2-v9-7-4f93ded19bbb@tipi-net.de>
 <20261126121541.6gybeqbkxsvjav5i@DEN-DL-M70577>
Message-ID: <3a85abf16fd109d255b4d9bd1c40558d@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Daniel,

On 26.11.2026 13:15, Daniel Machon wrote:

> [...]

>> +static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
>> +{
>> +	struct bcmgenet_priv *priv = netdev_priv(dev);
>> +	unsigned int old_mtu = dev->mtu;
>> +	struct bcmgenet_dma_set set;
>> +	int ret;
>> +
>> +	/* A failed resume left the datapath down, nothing to reprogram */
>> +	if (!netif_running(dev) || !priv->tx_cbs) {
>> +		WRITE_ONCE(dev->mtu, new_mtu);
>> +		priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
>> +		return 0;
>> +	}
>> +
>> +	/* Below ETH_DATA_LEN everything is floored, so there is nothing to
>> +	 * reprogram and rx_buf_len stays as the receive path reads it.
>> +	 */
>> +	if (max_t(unsigned int, old_mtu, ETH_DATA_LEN) ==
>> +	    max_t(unsigned int, new_mtu, ETH_DATA_LEN)) {
>> +		WRITE_ONCE(dev->mtu, new_mtu);
>> +		return 0;
>> +	}
> 
> What about a similar check for MTUs above ETH_DATA_LEN? AFAICT, there 
> are
> ranges where you don't need to do a full replacement of the buffers, 
> yet
> you still do.

Makes sense. I will add this in the next version!

> [...]

Thanks,
Nicolai
