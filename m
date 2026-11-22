Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358985;
	b=P0U7qHhZoFY5MGOhgD5afy10ASRPvDrf4mXaVgjrXHm7dUWAbRqT0TvmroOtwphbXcLj
	 3ZSvaN4KJTRirqS/9nYOiLKKhXd27iPMg6jYIe3qsX2GT/X8hXQmjUMJGaWA4whLpknP/
	 lqzQD9B+l/LsFxdzQI1SC7ibnZ6aqiz9JRHSyG5YCdUFPdPh88h6TbmflL22HNoxVDERu
	 5Le1QTywzlTC2OC160mbsgLB/KIGAYYeCnDaHqIHbE6gyCTnc+Gp8JGhb7+JWvxdZeaMF
	 LSEFgxBOxJ1igsn/UNkmrPe3JF2eEkPf6waYXo9dEF9LZVLxEuAWROa1vEDBu6v5Vaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358985;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=UT6ps64F668nova2kLKPiXUITTrjy6DxQnfrymQobSo=;
	b=3miwnXXYm0YS1EsIN5LWJ4PPG0CUQHLdU/Iggw6ucxIYan8ySPbu8FUDMAmDHazrpxEC
	 8rbSml4c/A82sfUCcYa8GF3dJWBP9X2u0F205XVYyYdDU3VE2tglgWmwrx2S4rDb4Hp6i
	 FCZfK77o2rxAq7VVREPe1EgU9IV3DtYzMrd1q/yommBzln8tWzjQj4g9jX6FMTwLq0z7/
	 MFr0E0WULMUY5ZsJAQk8GT/UcK6gXzlWdlLJP4HWRV4wJWYk+tbIWML7/5ZFB6gn9scXZ
	 /08K3EyDrHKk9lj4F9jq9jBe6zRuPl+7kcqVAgNofw6BenNuUsR8FOXcJ1ZJctM39vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N66DNJa8;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736EA606A32C
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N66DNJa8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A423D4E416C9;
	Sun, 22 Nov 2026 14:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B10D60512;
	Sun, 22 Nov 2026 14:49:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2790711E60230;
	Sun, 22 Nov 2026 15:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358978; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=UT6ps64F668nova2kLKPiXUITTrjy6DxQnfrymQobSo=;
	b=N66DNJa8YjNzKnWHnzM692QDi5itNkxnx6Ayb++iXjPUDAcogJMw+rMrENYvBOWTlFBbom
	mTGXMFnyfNjZzPZSpCZ9BRLDj/vwGTBAsEjw3+M+m0C8MgwD1KQSxrMhgsQsQvBAyCYblY
	P5/96JdenISrIOSaThFIZmtkt08J1BlT9/Drbqd8rA6YHNh5Jp8rfh4JrL2cn0kPUJzov5
	5dIqnVzbbHCwzdGIjAsvUuyzm4v7LomRT5Vw7XoROt3MEDB43GesDqX0O5ybkXMHyKY3tw
	+95lW2RqUXKwLe+eEfIrFCN0/EMgknyHpCFl1qbfn80sxNR0ethuhWhqjal7tA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net-next 0/3] net: stmmac: dwmac-sun8i: enable Flow Control
Date: Sun, 22 Nov 2026 15:49:22 +0100
Message-ID: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
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
X-Last-TLS-Session-Version: TLSv1.3

While running the "ethtool -t" selftests on H2+ (orangepi zero), the
Flow Control selftests consistently fails.

I originally blamed that on the fact that the board was connected to a
peer that didn't support Pause and that we didn't negotiate Pause at all.

The ethtool selftest are sensitive to what the Peer advertises even
though this is a full loopback test, but it is what it is :(

Since then, the orangepi zero I'm testing dwmac-sun8i on has been wired to
a proper peer, and the selftest still fails. This selftest sends tons of
frames in loopback and checks that Pause frames are generated, and
failing it means no pause frames were sent by the MAC.

Turns out, multiple things were missing in the dwmac-sun8i
implementation to get Flow Control to work.

Patch 1 allows independently setting RX/TX FC

Patch 2 is the one making FC actually work, by configuring the fifo
thresholds

Patch 3 sets the quanta values in the frames.

This seems to have never worked, so since it's not fixing a regression
I'm targetting net-next here.

This was tested only on H2+.

Thanks,

Maxime

Maxime Chevallier (3):
  net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control
    separately
  net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
  net: stmmac: dwmac-sun8i: configure the pause time for TX flow control

 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

-- 
2.56.1

