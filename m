Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294118;
	b=Oi+6DCFAkHEaDWorYvL/x90nq491fXDudGoxn7bzjM/M3/IWcDW+lN4KIsi0bKLE8wBw
	 xOiytIJxtL4pSuGn/LL7muGYyhGmzxZnOFN10OA+mWFOHqWNNHX5ha5oZqS5gRwjvLmGC
	 x5+dI1TEofW14yw5fLFfczBPbZfIbNgTZA1a4CCRwfzXCPkKtaKeNZCMQkZzbIj6+kDA2
	 FA5NAyX/xqeX6Di9kN3JwQj5CY2M1My/EO+Bh86OKxUh3+UTAyRvNcU5itoaSjoyK/d9b
	 DAHtvVwRf7yTY6CGzJ8F71V+gBz6qjn9uQNsk1hO73yjJnLYGicKzXwar/rHoQRfUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294118;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Cu8M8myR27197bFUTzm/cb9kFMHIioPDvWEVg0mEDBc=;
	b=pvfYHwKjdWlRQz3Ey2n0rMRyhaIF0tijjuS+HLHD58eIKK1vEGAkhFaDFzGy1CiSP84U
	 wNlj4wRoJF4/+NER1JWBy5PhhirwaaKFIn7KtKZPVlgDXMqXVOK1El9aXufiEj8FeRBuS
	 wz4AozrpevxFgiFw/LTZ57fyY6B0TVA3o7sdKq0B35eWsNov51l13/1FIIp537pfwutTp
	 ldd8dfjSxobxUeRwnuHR1h79dekI6A5/akjGQbh1FZNNBI2EhI04cA+zOagymm78Zm9E4
	 vfqGmcKkPzncuCa2U+n16ivklYBVrXAmSx199jOMp2SUjcrYGqDLOGhEYzR7+K2OwVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Yo4wWPvO;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454B606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3454B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Yo4wWPvO
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4D1DA08C5;
	Sat, 21 Nov 2026 21:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795294108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cu8M8myR27197bFUTzm/cb9kFMHIioPDvWEVg0mEDBc=;
	b=Yo4wWPvOoAGkMVe/QWu3eAYRP9JFDQlBhE5ARVhRu7M31zjXdQVQ+arPNZX4AeWrpF4xZz
	7mKrITeuEAdidPySwEnnBjNT3yzRZxvhMMYlfn9HHMWSQDho9QjTAGsXlIW6/K8R32o/jX
	u6TirxDk2QJDtZa2JlaId3mMsJMBpyVj87Cs7n7KvxEdEJuJCbYKMcLVugtFCgAzMLA7Wm
	iQ8mLMbnyEBdG3+hAEJzMbP692RHPe8rqYc6N1VQ0OYlTKqp2vad/ibTiZE2+tZzig8q7+
	0SVOniY9Q2A2p6eUoCKVvy1ZdZxxSYhX/FaCQXDIlffIZLlCmXNNTrKi7vzj+w==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 21:48:25 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Artemii Mashanov <ralerrdirsardx@gmail.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net] net: bcmgenet: reject undersized RX classification
 rule buffers
In-Reply-To: <20261121001550.732679-1-ralerrdirsardx@gmail.com>
References: <20261121001550.732679-1-ralerrdirsardx@gmail.com>
Message-ID: <d4450968850aec1ae27961fd02db2ebb@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Artemii

Thanks for your patch.

On 21.11.2026 01:15, Artemii Mashanov wrote:
> bcmgenet_get_rxnfc() returns success with an incomplete list of RX
> classification rules when ETHTOOL_GRXCLSRLALL receives fewer slots
> than the number of installed rules.
> 
> Return -EMSGSIZE when the next rule cannot fit in the caller's
> buffer. On success, report the actual number of copied rules.

The loop already stops at rule_cnt, so nothing overflows. The short
list only can happen if a rule is added between the count and dump
ioctls - and then ethtool -n just shows one rule fewer.

Fine as a cleanup, but please resend for net-next without the Fixes tag.

> The source-extracted ASan/UBSan regression tests passed.

Please drop this line, it doesn't apply to the kernel change.

> [...]

Thanks,
Nicolai
