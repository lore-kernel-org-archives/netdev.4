Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442118;
	b=vxKFYuwK8IaOLbxI3cwzAwA/Qsi/uCP9arTArpfV1f1eZ96fZgdnQmtDuFAAm/7WshR+
	 EEK8LnJ6yL0q3+Tze1xru1QZ4FYDZX3FkdCVVCWNNn3LHECjEmA4JIa8FjAA5QtInW5BE
	 vMcv91oRIQEFRIsIfaTicq1TD69j90Ur71fUvB7oY8OCcsRKThdI7jqL7uxG4LKCamTRD
	 LJnDyTP41Gnd6OH1kgYvUB+ZYhXCPkO6wrHar2rd+1VSBMtRKMT1ZkfNqSNcDaieMIAtP
	 Cfpj7Iu5idcC9fGeJA6aoFupEf0Byzlro+0IthWpmJz7SslZUm45Q9rklwR7zw6mnMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442118;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ZKg033w3BM4ggMwxJAji0+lm/EJ45L8ZeL5Q2EYCbiM=;
	b=I2wNTuOd277nrIrhK4zlNQjbqtJ2uvglJsHDsq0tzpMtfLc0IkvnrjyV4tyfw8uKP039
	 5vhruJbr5FVbCqGx1pipSpKdT45HQWXzY9h1w74RbQC0VDP7qCmSxHwb5oO3gMsDRUtSW
	 bX9gHm/72Zt+3Tl8DusAPhcyhGKpUC3648PdWFYjO1cOMjbLT/3rq+pPYhD+QRhovNHFv
	 9SdPLa16DD2LCeTrPttnBdRTgUXE0uJjWVBc6MLTT78kxiCz6/E008pHRW6OeMiBJHEeW
	 To/W/CBqNezg6zfKNvim4QnlGeMQi47nC8S2JZZMRmSfr0VX5vS/b9SNUSFWJP77sEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DbyLMNqG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A427606A327;
	Mon, 23 Nov 2026 13:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A427606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DbyLMNqG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 03D444E41578;
	Mon, 23 Nov 2026 13:55:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6AB8601E1;
	Mon, 23 Nov 2026 13:55:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03CEB11E6A496;
	Mon, 23 Nov 2026 14:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795442114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZKg033w3BM4ggMwxJAji0+lm/EJ45L8ZeL5Q2EYCbiM=;
	b=DbyLMNqG59A8Kpd0OpudYyTgKuhWYDrPMj5K2MmGvu+/R+ViI04nll/wNPzneCAOBZ0s0/
	TsXmkGNU/NQKNN2gpIK/Jfky1kO7taZoc9Rf+ALHp/r8faNa5zT4romiOGTwikBwn70GWu
	MtBnpBrU/uJXcXzcNVfv23AhVTs283Nx3aHyPzXJDi+8e5xawtwxy/n1Pw3v7vwd9EFwHv
	pQP7yCT/Z6LsTNQKZR1VvX9/J13m7CklZ0NRu/IF+Fn5h495hDMj49l4M8TAvcCwn/yuP0
	lBpP/Cbz6r256hpHn8eD1RhbjC1FyPksL84qJW6oKXyariGBnaKIkc1Zqh2Icw==
Message-ID: <af5c05c1-f18b-41c0-b516-dbad905c8a84@bootlin.com>
Date: Mon, 23 Nov 2026 14:55:12 +0100
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
To: netdev-bot+sinfo@kernel.org, Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>
References: <20261123133420.708557-1-kory.maincent@bootlin.com>
 <179544113824.3294.17718997849062582647@kernel.org>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <179544113824.3294.17718997849062582647@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

It seems SUIE thinks I am working for DENT, but it's not the case.
Jakub is there something we can to to fix this.
I would like my review stat to go to bootlin stats.

On 11/23/26 14:38, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

