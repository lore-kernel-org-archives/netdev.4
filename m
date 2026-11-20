Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188742;
	b=zcYMDgolIFKMjIvefFLeDqp+5zXtEa7A+VMqdVlIXW58pO6FnabkFf3+sHxXWrWYK6RI
	 e+Y/KyZRlTys1yfw210IBoYWZiJydzMSexEQNU3HzfFiLX3RfnFi3/kqLQ6LzLkFYRDYJ
	 m489UDussNr1+0SgWSRtPtCTbAom9aaVPe4FHO8gkN6qOm4No4xbnYx/8jCGDgymHjsGz
	 V1gIVnunTNTSu0b2JIktEB/kcsIoAOQbcszvof1yTagh7wGXjco9h+XlzIETSvk3ntO0H
	 eCdg7+Y0IB45XasyUaMWk/jyUBn+QF5Z2t3WoC7ptz1AEMjhkFkFBEQye3js90w2bnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
	b=iTWoXvC6uVE+io6nFKYUjpw5qJ7uKyDZTRCI4B6R2M8usB4yQfHVvzbF0DG5ZjZJLwgq
	 kiFw5u+8UxRMI2u6FVmNvlhJAFiibdoRSVzo9SWe/60q3MaSmfo4qb0JkujsjK01lx65/
	 173e0S35SNOnJH4Be85zSlFJhAfkk+cBtWkgz//SVVjfFDhycqs7ypIisC23QtEP6m58y
	 PB3fiYWycrf/vrdCtiS/0DnCnfJeuyV4wIr2W/tBrJkAH4z7iREIsbyc3quHhDh0BAbCJ
	 9ZITAExfr9hUNw8rzWzg02AFeAwK/cNaXEmvWNkzwBBtC/9wY37rN6F3mLKWp9iRWJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiFgf+Ia;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C186606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C186606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiFgf+Ia
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71b45386310so176227eaf.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188741; x=1795793541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
        b=XiFgf+IaEEklHxazQZugiawxmTOm13Rn2mmn0Nd/GP057zHJCgsXiMGWOd9G1/4wUX
         CLlG3MaD56hK34Se05WGNk/hV7wahuybksDhCsANanjIm2U0ccgPE9Si6LYrUnlNHcFn
         XW9znEUMMx3QamBfxCZaWkT5AjA91hhYdomPh6vb/3qMyhXPh118vFksklivfu4rtiSU
         YYdbbZs/11CN6KEhvc9AO2YWrx9fY5QYNU2qrZFjN4bR9+8yDt+TLneEN+/xDWE1XvfP
         04wcb3nB0ZiQ6mRn5QW9133kwpySeVNgVyInzAT7XtShdHq4KiUJhVrW0jSWIhYYyjUY
         R6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188741; x=1795793541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
        b=ySct8KdSjHHEMxfg+pcabZAa8KwjYdrJaLXP2+R1DfjCtyNWIA5ClCIvE3k3e5JV36
         V5Akpd0jazwK/k/3FrA7SZpPRAr6CVgj4YHKM1dlvxdwlttQTUmVFArPFFIozD8Jiizy
         48ja/qVq6sdDXmUmvTmFYbAcixW4nT0I7uyIj36rxas9uAgDElQUh7zXg2IbalHSIjLy
         +Qxg3xn6xGbMGeUBHzL4F5SshQxf4iESfptJNBwN2I1nWFxUVq5ey5T4pIf40MTBCcZz
         smvtxBGx8/VatRRSQb6M+LCYCsUMEGj9ggI+Vkdw+5dkzZ7C+ko+rEnW66ScLVK8ABdZ
         mA8g==
X-Gm-Message-State: APuU4Z+pvRiF44V/3Dg9B/UjmrD1+JWF4mjss5tfEAnfS7GeVdRWmDZe
	XjM6xJZ1zOn5tchYV9B8MWjFhwmUB1PiRr84ADHSBRucG7gdHqiEn1CP
X-Gm-Gg: AYBFou0kMNTIL4JiZ2RMLODhkz8zg0BeM+QvCbz/1QP6JPZOYyzl7ZKlyAvo/jBcgfZ
	/jP19CRqSHEQkfdVic/DRX9X5v2PyG+YAJb/VjJlCyCtAoqYQJmoyMJkgxOWx7LcRroOrt6eyQX
	U0CJ21LTC7IzYqe2XaKeCohxGUOW5QaQIxOz5XLRf06wm6xd0mmC0NA6E8F7Rk6VoMvnfiAyhvo
	QRHk0z6qcnQbU75RzDIpGy5LpQf3qWtpdI4pT2TONZ2gzCTQg/akj2pBa4tjapLzrNFY78gsO2Y
	T1XEhpiQBRWm8ytcW1lyNEXPaghcHiRuccP4uim/VHLV3JbGQOX9PtLQKIi2V1fB372S1wizks+
	gkLdtvjRJy395Q0wR9zHkhYGue0ydw9hTeNsb7xc/J9id9A86Ob1/WOEye8g488GLZ+es/9c8GT
	RpO+YiBvRx3GosVKMZWzw+Y64C9vIQZujcdPzknzL4WJ4+HY3Jq00wwVjum07XlbWERDbuRcbsD
	levCLK8e0/ol4HD8ts0zAfM93OdOGgO0xrna6ub4HwGPhQ+5kFL5pOPJb943EqjQ0cUFCmWmw8h
	JZj4EL9b6Mnz5cJHwBmoicPTvKv1Yw8pSth7nIRn63Qpgasn+pGaiDyyUBVsgmKQ5a3ZDIa/jQS
	DG4lqSoTUZ78k/qYfFYDIOCsyJMKHCDCINVBbWPDiZUTZct+yLVkaT+TWCvnrLtI6llfm/cwzB9
	wFIbJudvcxF1tOoVGos74j6+ucj/1Aa0HrwHCt6uQxpd24hBmIfvs=
X-Received: by 2002:a05:6820:709c:10b0:71a:fcbf:248f with SMTP id 006d021491bc7-71b39528b98mr2217708eaf.65.1795188741038;
        Fri, 20 Nov 2026 07:32:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
Date: Fri, 20 Nov 2026 08:32:04 -0700
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXbBjdQmXkV8qO1UVzBKNi2B0
 rsb9Wn4GfhWMiSF0alZKWFR01esIbuGhnsfb2Ada5Pbu6OIBLb5+tRcJ3rlVHhCn+cE40U4SNf
 BH5xvg6cqvBMmLT/9TBGZI0qmy/+p0AND/uK0bR/+00/fiQAAAA==
X-Change-ID: 20261119-submit-sun8i-rx-features-v1-9177e8328598
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The sun8i MAC has one DMA forwarding control for both IP checksum
failures and Ethernet errors. With forwarding disabled, packet sockets
cannot see bad transport checksums, and the stack cannot apply its own
checksum policy. Toggling the hardware checker instead leaves no way
to tell whether a queued IP frame was actually checked.

Jakub asked how the proposed bit-27 change [0] fits into the complete
fix [1]. This series replaces that change: the checker stays on whenever
the receiver is running. Both ethtool modes deliver checksum failures for
software validation; only with rx on can the driver mark a checked
packet as verified. Changing modes no longer needs a ring flush.

The first patch fixes ordinary reception while still dropping frames
with a bad FCS. The second adds rx-all support for capturing complete
frames with wire errors and runts that the MAC can forward.
On H616, a bad-FCS 64-byte frame reaches DMA, but a bad-FCS 63-byte
frame does not, even with both forwarding controls enabled.

[0] https://lore.kernel.org/r/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com/
[1] https://lore.kernel.org/r/20261119161151.5251fc86@kernel.org/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (2):
      net: stmmac: dwmac-sun8i: deliver RX checksum errors to the stack
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 167 ++++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  59 +++++---
 4 files changed, 172 insertions(+), 61 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

