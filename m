Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776376;
	b=OJRDGnbr0fwhLRBcdMm3X2jut3uSygPElYICfjJMJTz3FygCTMixb1vazjgXsqYKHSU6
	 1ffEQrzQfKN7iggbiJvvgtAoYMWrLZj5fNPa+AUFoIC7ogG7RDpoS7DR4kCik0M2+v7GY
	 mwiyak+aMt8NAGcH0bHCclfLukgx9m5c/b4f9+Ejg/AMhhJlGPH0YUpepRPd2WtXOBwvc
	 joaKN/XIsPTSRYylNf1v1qSxaEjJ+sl5UxFKLIciSfSgG0ZAbtVsw6FWYxwsCTUFizRDk
	 7kly1Za66V9ZdzyR/5hQH5M6y8SOo0zEGZciFAyiop7x5CdcBOXeTJSsZc/IKhKrLYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776376;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2Wuf2F36HJ2XxV5MeacajP2DupxV2D11RTqyQO76IBk=;
	b=S+RbXFJnwyvrCxpLwO0z3Pd5rSiSZ3fbPp6/pBonJVCUOp82MBFzq0CE28cjCVRTzaxe
	 x2HJjgeDAe+jnOJqfgUJzs4L/iX67fTv7bRJ3F72fg5mS1poGalPTMDOuobc+jSiPtVdZ
	 lCvaF7+VjubJuZhNLxqmCYnTftY/rRkGc8VOCaenVi4l0euFSBjPINgCa5P76Z2GTL7tc
	 I8SomYNQFofF790jQQA7ZZ2+OKlusdU7lDjI3HtIPNVR7vM0vlp1RcyOaOE09kpLdEmK7
	 Rs0g9AAV55AOQelixmlYVKAI5Cjhl08VosArPaZQFEbPQTLkenJIur0UhbaO9BKQIqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=TTO00Emq;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E0606A31C;
	Fri, 27 Nov 2026 10:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=TTO00Emq
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A9D9A383E;
	Fri, 27 Nov 2026 11:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795776373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2Wuf2F36HJ2XxV5MeacajP2DupxV2D11RTqyQO76IBk=;
	b=TTO00EmqyMFBthjSxEqrU7DFZisSFYmLzPHTo8f4SQOiQcBHcyaJ/ZArLodvlnHt/ajrnf
	O4wiDVRcPmIudQYJeN9jsS0rAKhroYRvXsbQCwmT8xbhKSQFBL1xIw5E1hm1NcFMSoTkd7
	QyhOHNUF2mNTfxAqyAYKKzevXJKj1SDYLbSN/S6vUVYpDWu79ThCXAWfCRdmA2lMcxXLrn
	4Duk8jQ2IdiJGAG8EXsvz2ciK4Eb5T1+3OuGLACTZtx0Ko5BLmnua0A8/1aKGVHBqMtjkm
	JAaAFLFxNHxybwGEpyNrqb3e0cRfOhu3/MSsk4rQ49t4bGsrMCIqq72M1dpayw==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 11:46:11 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Justin Chen
 <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v9 8/8] net: bcmgenet: reassemble jumbo frames
 from status block fragments
In-Reply-To: <20261126120757.gdz5lo4tw7bhgzax@DEN-DL-M70577>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
 <20261123-nb-genet-mtu-nn-v2-v9-8-4f93ded19bbb@tipi-net.de>
 <20261126120757.gdz5lo4tw7bhgzax@DEN-DL-M70577>
Message-ID: <97e5f84e077c346d6cfe238b022ea439@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Daniel

On 26.11.2026 13:07, Daniel Machon wrote:

> [...]

>> -/* Largest MTU that fits one descriptor, with room for a VLAN tag so 
>> a VLAN
>> - * interface can use the parent MTU.
>> - */
>> -#define ENET_MAX_MTU		(ENET_THLD_MAX_LEN - GENET_RBUF_ALIGN - \
>> -				 ETH_HLEN - VLAN_HLEN)
>> +/* UMAC_MAX_FRAME_LEN is 14 bits wide and counts the FCS */
>> +#define ENET_MAX_MTU		(GENMASK(13, 0) - ENET_FRAME_OVERHEAD)
> 
> Now that the driver supports larger MTUs, should the flow control 
> thresholds be
> scaled for larger frames?

IMHO there is othing to scale, GENET has no software programmed flow 
control
watermark. Pause is just CMD_RX_PAUSE_IGNORE and CMD_TX_PAUSE_IGNORE 
plus what
the PHY negotiates.

The only MTU dependent thresholds are the packet ready pair, which this 
series
touches already

> [...]

Thanks,
Nicolai
