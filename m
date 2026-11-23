Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442165;
	b=CczBhhij9loOfbUsrcHWFU2QuI4KDYxtlbckWwtZGhEm2jDqu0QJ2ybadQ99PYBQHEhv
	 ejkZuS7taULQc2H74iu+btyQvoCqxdr8HwNwwuSkwuybau71HIHbOjUppN8KZm2pKax+Z
	 oC8fv6snwM5TL32POhhaJncns2bJqiK6tl/idEFFPdpq9ZZC5zwa3Cpa9fEM9J+CNLppa
	 avze7usKpkkkD416wZ9ULi01NMIJEEpgsXClQYeAwEiADCYOtrAjOy+lJeZxXtjYuOU6E
	 CfWoVoAEMAYOXCwh6HtMKyNlNeQy33Hc2loe1EgnJAWhQ4MSMbMkeDOk61L9A/cbTIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442165;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=fvFQR0xZ1gS1J3KhZLCaw6EErZTMOVs9FN2WmeJUVeA=;
	b=hhkqLEssj0VCry07BtEb4LKScycXR6ed7WDgB92z97ekDcIP5HtsnwrCcZpPbI7oTa5Q
	 h4A0vB2RVujZwDMLKw+PhtT8EvvNZWgKMvAg7+1kdQCOQOISWFKiGzJwlmsjAId+TCuk9
	 J/1QcISrrEKnCe0vk8KsMZRkclDvDUiq1+o3biza/wQY8j5f3h+ExoVE2QuRzw5wp+a/r
	 qTMK/rJErd2dAItTk6scmTfqOGQVpQDf5kHF/S2qcfS2UyfV8lkyaxVEZDw3fokkC/cC0
	 tdrep/imY4kVTYVOmYmJcap+1UNkYp8TWmxfKIb7VP8BPXs1HflMSaatZxLPejMlyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HUYL5rX6;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14A606A31A;
	Mon, 23 Nov 2026 13:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E14A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HUYL5rX6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B34C1A1797;
	Mon, 23 Nov 2026 13:55:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FB09601E1;
	Mon, 23 Nov 2026 13:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9B2F11E6A4A2;
	Mon, 23 Nov 2026 14:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795442157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fvFQR0xZ1gS1J3KhZLCaw6EErZTMOVs9FN2WmeJUVeA=;
	b=HUYL5rX6ln5pmUey4FFC0VmMP/KHDVGd7z3b9cRSkfyJepQG1kUURKsSY5GeK3ASrOupW1
	M4VD/8hwVr8Tg3VK5E2BjjrUxihDN/cTYVQjf8feYzMGNIcTI4cDiu0jg5yF/BuG4CYrsq
	tzW/0aT/MKxx+gNZJgt9GZb5gmt7YvuIkMo9jowqlBiVEbJPexzKEgVdqirwac8hh+4wPV
	LH9vbally66xlPRbbw/6q0KRxO79enePWAG45VwELm4emzUz5PsgsxmSbn+6UKD5g/5Wfs
	ei2kN8LIoQIo5SBM9X/fdgKnpD4SXqbHi7VcA1obpmXhz/a1jfv82osJUSImGQ==
Message-ID: <47e3f267-d4eb-4283-97d3-369d59b309fc@bootlin.com>
Date: Mon, 23 Nov 2026 14:55:44 +0100
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
Subject: Re: [PATCH] net: stmmac: fix uninitialized axi_blen array
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261123131326.7105-1-jszhang@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261123131326.7105-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jisheng,

On 11/23/26 14:13, Jisheng Zhang wrote:
> If platform doesn't provide a valid "snps,blen" property, the
> axi_blen[] array will contain random value from stack, then the array
> will be converted to mask which will be written to DMA_AXI_BUS_MODE
> reg later. Fix it by initializing the array.

Please take a look at https://docs.kernel.org/process/maintainer-netdev.html,
on netdev@ you need to indicate which tree you're targetting (net vs net-next)
in the patch topic. There's the same issue with the dwmac-syna glue submission.

Otherwise looks good, I'll review the resend. (also note you need to wait 24h
before resend :) )

Maxime

