Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443806;
	b=Zjnp03EW9m13ott7SRoVGRazzKK8g3upLZbGc2D9r0T4bHzrANvPd82ezXKVVIYKlSOc
	 ZVG3BU5gq9z4NNDeXwV8+HkrO1fEXYpK4wzzmLD5xlUOLW74n0MZi7U8cDY571N26QZbC
	 lSLCHL0NUfBdyknGbsbhsgtLGnqSpLVchdJC+Qa+KiwEmD33URm/wlRr0accO039FwMhd
	 8TT30JLrP56U3EHCKf/gnnPggVRVvbNZd6Q3phHJJ6FovlL116+ajvtYiChrxtvNJNatM
	 uFqzidwms3KEd+sPGWm4JhA7NQTaHxO5x4t4hSJ6fa3gWs+flsW0agfMnWhuILn6E3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443806;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=OpQr4PRrzddDAqShvvVLVLwmk/lLDIsrrmjqDSHpTHo=;
	b=HyM9oZqhTl/rQXUiVZOmxB56IdomxWreb0JWF7KC1TziKAl82LLqpFzwwtcL6zYYX8Zz
	 Hbfelt1AvHFjU4cPsRkDrp6/zWZKgk9kDQ8vw4dBn73P0dM2q492pnAQ2XInrgzEg9NEc
	 7Cqh0FH7nUSuANmWJWctFP+svCCNOourPsJBPyxcu0YES3F4Ph3O2BuGAdkt93As6QhZJ
	 HZs6mUY5OjZUFnQAVrS5flo30gexqbFxpR3RILDI3zSDBJPT428oBjJiCZS1Wzl5kIxoc
	 IZnI3hOXdiPGyK3z3X9onmgyTETk/FhEzlXI8kzfSzLe10QFf2JJFzh5Hp44MH4ejzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Q0EReoL3;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1D1606A31A;
	Mon, 23 Nov 2026 14:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Q0EReoL3
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6564CA05A6;
	Mon, 23 Nov 2026 15:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795443802; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OpQr4PRrzddDAqShvvVLVLwmk/lLDIsrrmjqDSHpTHo=;
	b=Q0EReoL3g1wpHAY0/Q9oDwbs5Qle42cSV1WRXxEnU/OhWr3Jr5xyVLWqnfryK3VFozkbSp
	dkQR0Ut1AWUbGBeI2PExzoAPDk3ZDXEy8WtYA4N/BxJYO53xvRUGnKag7hYRSjoJRO7S2U
	wIEVj6aZj0iMCR2Y+k6DJ0J/rMzjJihErIuPdpSi84mV5mRvE+MxcWaPbMGkC0TaX+NBAd
	5YHCs8z5SnoeloCxCcQz+SvM/LVOQT74IpoQkkOxyHTQicKvPzkgf/Xy4ba3UXMcIMxDU8
	CdCU/wwB7JiTSnyGE/NYAgcQaOmzS48xP6hxo7QJWprG8ASYoh3drPmQXpMhAw==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 15:23:19 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pierre-Marin Leclercq
 <pierremarinleclercq88@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v9 0/8] net: bcmgenet: support larger MTUs
In-Reply-To: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
Message-ID: <a87b05ca08afc7ff02c0abcb3978302c@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 23.11.2026 10:17, Nicolai Buchwitz wrote:
> This is v9 of my genet series which adds larger MTU / jumbo packet 
> support.

> [...]

Patchwork mentions a conflict with my other pending net series. If this 
lands
first I will rebase, buts let's wait for any other feedback on v9. Maybe 
9 is
a good number and MTU even lands first :-)
