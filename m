Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077440;
	b=EyykNkZTpd+KkpPRktYIvA8Y3ucxLhY5b2VIRi27pn5ut7gAobATDzM/V23uq6lt6ZFL
	 90HTgFwtRr1Lfg0S8iSVDmvT7+7ZYaeNnVuoi2UiReyV5h8guFTwBtU7PsPUvzgot+0TA
	 FpvolQUYBwpY5OSWiwGfPZYIqhMYngUJPRuDNZQ6P0ChK9acXaqsF/E6oSMq+XZ72CKma
	 j/nZYaLxf+R9HagQ/pMI+O7grJtHywB2MGkQ6qbJZcRLyeE6fUJyFFOpYMECa0NzdcCe8
	 P/hc2DVi4iQwIBKZ1OATS2VtCknodEY1U5Eix9faCFaB3SZCQhSPE0yzKz5j7vZ6dsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077440;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=OEvSG5RTeI+fg/i5waR+u3f8/plLy5P1A28O4+06/2Y=;
	b=fC+3SdxNgXzWUpG5U3tR3g2kphvdCpf8vcZi9GL1zBUigGVELDJk/XscdAa6mWiAlPTn
	 Tgjtm7jjxToKoNpQr8SHDKgRHQ+bJMxJcIXwnWnpudW4r6WZB6Yb84sdnQa5PnSwQk/2g
	 HdRTEbdDkGCnpLqu0uxdZddbcoT6QD0ve4cIzJTk+CyhEz6jaAZ2/quC9DfRoezbszDvd
	 2XU6jgLdPA7pA0/+zWpfE/4Mp/CC7CIcSGZnzjPFL9x5q1yOF7LsVtxpupPLdEYYrmeb3
	 IedzN26ZdfQP5BjD78u9/7NLZTfbcw4TyTZhsIWQ7Leg0Vj5xpgwvVF4PD5fvAnXb5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Hhj/HoKb";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DA606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545DA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Hhj/HoKb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D95A7C4CBEF;
	Thu, 19 Nov 2026 08:37:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5C5160237;
	Thu, 19 Nov 2026 08:37:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49E7511BC31E4;
	Thu, 19 Nov 2026 09:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OEvSG5RTeI+fg/i5waR+u3f8/plLy5P1A28O4+06/2Y=;
	b=Hhj/HoKbH/p4BCNUecTtB0nPfOPf7B7pvbMZm9lpG9RuTLYVGRYsUU2ikxh5DcSkktPbxU
	NXd2aiaA+HLTQls+TCSwQPsyPh1OutfAY2MBuEFfHWJR/604cueOcF/MN3oXCE3samsj39
	ikRZQ9OoWyd/s3MnLwdAUrANmkGG8ZwRxyRV9DO/KBuaT5iCLI4BNK7cyQuKQA4Q/tO9tR
	fsBjvxNCuQs3vMMwAbxpCca9AzBacXPjvsQW8txc+2+TrH9SH6opz7CXbHL86O2rBnuoyC
	c265qXp/hqGHWkliDIq84f6dLsKKSxRBKNxtDQTSUSTHZIkuwp6K/Dw/ru2XuQ==
Message-ID: <63b50406-f264-4492-8586-bf2d9cde91ba@bootlin.com>
Date: Thu, 19 Nov 2026 09:37:08 +0100
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
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable
 into enable/disable
To: Coia Prant <coiaprant@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261117182502.3045841-2-coiaprant@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261117182502.3045841-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

I missed that one, please make sure to run get_maintainers :)

On 11/17/26 19:25, Coia Prant wrote:
> As the great Linus Torvalds once said in
> Documentation/process/coding-style.rst:
> 
>   "If you need more than 3 levels of indentation, you're screwed anyway,
>    and should fix your program."
> 
> The gmac_clk_enable() function previously used a 'bool enable' parameter
> to handle both clock enabling and disabling. This resulted in deeply
> nested if/else blocks, which made the error handling and rollback paths
> cumbersome and prone to bugs.
> 
> This complexity has led to bugs, such as the bulk clock leak fixed by
> commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails").
> 
> Split the function into two distinct helpers: gmac_clk_enable() and
> gmac_clk_disable(). This flattens the code, removes the boolean flag,
> makes the caller's intent much clearer, and simplifies the error
> unwinding logic.
> 
> Additionally, this refactoring aids compiler inlining and CPU branch
> prediction (trust me). The reason is simple: no branch, no prediction.
> While the compiler might optimize it, there's no guarantee it will :P
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

