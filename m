Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708247;
	b=0ObfYvihFlTNewA3RQQM9gih1UuL8OuVe0dSrBS8BkKoHl6m1hbAh1bkjpDUo+DXYU+i
	 7avGFTSToz6MT6nDL8ePwgpffQEp+pJBSm+0X53LDqo2jTSHj3gBtTqPz8ITf2QAlWij5
	 GYs7bz5pxMGoEvk/88PpHqhEjJUaWA78tFAXZ9R7Xal24c1cSED/sTQB/mfNNUzE7X97o
	 B1mDB2UFDNH+Qtjse1BmyoKBYW33PVgZArU5HxiPabgQDxKXzFC7qcyoKUhsyE2E6zsU3
	 NtwIP8acqiCCAUap2xN1/pgdY6boe8OZudrirXnu1EU/veSPkzDTxQXjK+F4capWdyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=glyjOGPDQ3KqGdbTgWLeYjcqz5k2+ySsomlMSz6dDO0=;
	b=JjRO4xG/nbCxBIIqhRaa70J01Ufo/AcaS2XXRIZf8v38bA7YNW7ralccL+FFZjk4dXuP
	 xMwUEeUGeuLvxSA9UPOPE/IbEzL5HbYZ4d697uJQjCDZI9HHe5HyYxptn5zD7oIxswXyq
	 qtJRbq0xdBebL1/VxKqyX9IEHEEZDkkf5inw5e/XJzv6sbeqzw7S0cfryqyj/iOsNNCNM
	 zbZd7pxZyLGV1SyCbDbUqHdfOgvc6hOBWBcd5vvVxq4MulmQwU/n4P+vBq6cFHg2e6aRJ
	 E22652VZApHz90mOEgVSCO+ZdzWE4Ktmij5izzX0AcKlKVk8wcd4M5dkD80CxSzI9Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBQXqR8Q;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C3606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 159C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBQXqR8Q
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1150395866b.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708245; x=1796313045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glyjOGPDQ3KqGdbTgWLeYjcqz5k2+ySsomlMSz6dDO0=;
        b=eBQXqR8QXglxtIrWeTn1hf+iL1MOC+PES2qgSa0gV34XItn0fnb5gKHLUOyNehF/yR
         aytIA1u7fERR7FfBVSSdRxgsfzglq95/Vek+Y9dhb/7qabeWE2fo3oK83uVQv4ggxpSD
         0d7qwfkmYL5NIP+8S7U7FvMlkvW0vzq72VS9SPIAtAwIcYsRBGfINlahZbY7b3UAAZdq
         Tai+vGYZ1yCyK9JVnF808Iw9YFMFLtf2SNS+EeMJWoPd9h1OHFfoHElrP0IhQ5Di3bTZ
         TNOu4hYlfamFFGfl3nWBqRxBaSJTtmo6CBw3ro6Hx70cWcXIgrdU2QjR8f5ApLfynyFP
         eVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708245; x=1796313045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glyjOGPDQ3KqGdbTgWLeYjcqz5k2+ySsomlMSz6dDO0=;
        b=Ee4rf99Of6bTdT2kxfN0+O/nPDKHtaQbHn0EjYHsoca9wptQgVj6OOTQTAX5ORyTJf
         kOTnh0IlXGGUTcUyL1svYUO0eX0Wlzg05+Us+ifEdi1T0NWdgjupeudKKoIaP3aHvuVc
         cH2GXEnojBSWaCgUJa5pJmwEZHR8QJmjjn3Lp2NH8qLhStvOcdrekHHNqzgvW1VXBR3Q
         /WtO4yDjNiwgTX49gY6Yw92C6P6wpqEJH5Bb2rr+zoRk6BRyUqdBKFKRB4LA4arIX85u
         vIEGbjKUlLr+UGgfkWfuGWQNRmIbGxT3kz3dO45B4C9Ppmh2bTru7M11aUCybBUiDaN1
         TOUg==
X-Gm-Message-State: APuU4Z9SMxRuwZs704Q5C7D9csCHCp0v8ecT8CxkC1gA1iqa4vpbaNk0
	AAhl+O4y7/c5s3vE07YJWpch/2e9byklfIVBY38vb7PtVWgB1ZScmTQr
X-Gm-Gg: AZFdTZdjS16r/iAPF5WFSIqDSnBI01FEh2PPwzQWxKGVs0vLUIsk4vqMMBCI5Ngw4Hy
	N4rxNUUaox1suzSxFOMdC5AWLUO8S6kyuJpFoYHe2ERSxnei49NZT2mTXKHj/1aZ/HQ+FwvycE+
	TIzt/6NkjGZYMF383BI6X9Xgj81P5awFGYRLWxIvCWRIwtv5/GSXQVJfApfET/ijoAfyLolv3oi
	4iA7ehoFvnbKCk+9mOvKAHrH0QD9AcjzXWxfRyQa7nSL0hvHn4CJlOFZ9DTlG13pP75Z0DHXzMk
	oN9/pYEAb3itNXZO5Enxoekz0vb75X8Xbe45ESbDM+L2AGfmOMwZerhkDFJgDOyqrp+H0K/oviK
	3C5Tm9NommCHkFRX7OZCOhg5wJonvHMxPVgRY3v1HQ5EPm/QpoMVSiHzMArkHeVSECUYKPvF6AU
	cLpjJX2LihP1eN6Dfzw5WxsviMXjx4vE2mu6qE7ZVgPRTJVUAdFXL7AI8a9aqowYOujryGvHgok
	YwP0s+fAiJUi47FlIDz/RmxJ5gg16c+d7+ofGhwNBjqggxBm0MHprEoRufJMu/CDTDcozltlBc3
	Wkc8Lrhdzw2Kc1o5LxXR59Hb61BBU6+3BvwvqFjHU2pL6MufSdI4Pa1lAzo/Ld8UAXKTGX439Ie
	rC9ndlPAb0qfMIEV/poUy9Y5zsbopoAAIcKLygqQJpqh/qdmqnArdwgiDtmXAOH+Y6tWaislZUc
	Pz
X-Received: by 2002:a17:907:6ea9:b0:c46:645f:cee2 with SMTP id a640c23a62f3a-c513a3ab024mr1869288166b.4.1795708245307;
        Thu, 26 Nov 2026 07:50:45 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm766559666b.11.2026.11.26.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:50:44 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: netdev@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: dsa: realtek: rtl8365mb: fix FDB lookups in VLAN-unaware bridges
Date: Thu, 26 Nov 2026 16:50:37 +0100
Message-ID: <20261126155037.2897040-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125131339.908183-1-stijncleynhens@gmail.com>
References: <20261125131339.908183-1-stijncleynhens@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Nov 2026 14:13:39 +0100 Stijn Cleynhens wrote:
>  - Boot: the CPU port came up and passed traffic on 6 of 6 boots,
>    without the re-latch work from your v8.

A correction to this: it holds for that one unit only. A second X50-PoE,
with the same chip version 0x0050, came up with a dead CPU port on 2 of
2 boots with v14:

 - the switch sends towards the SoC: s00_p06_ifOutOctets counts
   (9884156 after about 20 minutes), but the SoC MAC receives nothing,
   mmc_rx_framecount_gb stays at 0;
 - the SoC MAC transmits (mmc_tx_framecount_gb 5606), but
   s00_p06_ifInOctets stays at 0;
 - the two user ports forward between themselves as usual.

That is the symptom your v8 describes for the AX55. The same unit has
run your v8 with the re-latch since early November without it, and it
came up good again when booted back into that firmware.

I put the re-latch back on top of v14, reduced to the check and the
edge: on family D, read the SDS link status once a second after
pcs_config() and, while it is clear, park the SDS_MISC mode field at
DISABLE for 20 ms and restore it, for at most 60 s. With that, the
same unit came up with a working CPU port on 10 of 10 boots; the link
bit was set after 2 or 3 edges each time.

Stijn
