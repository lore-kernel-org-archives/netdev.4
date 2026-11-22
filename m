Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333588;
	b=djwcOLu7SuVu/KtstfeO4WNaGOtTCYgE/AvrK5LDcYU+J6O+nrgB2Nw5o11w23EsF+qN
	 sZiHTyiBHYWf4uKTeeVgYscOvOKocrE65mbzh/Vq7QS7vztT46ZTq8tbalS+rusnNXPvu
	 qjimNHSa4ZI6j9aty7hVFFPxicjc+/xvogWaGERmPcBvsv4OBK5VX1IjWhheOuUMa1hat
	 qYrO5c4FPDjR0KGuPWBfiMWo+cu+rZEDzP5g4sZVIDfTlpkNFC609WK+fOnxHdVUNvdHN
	 V+TikU3KHEVJ9xSqwnyQTUOT4paq8MG1yYKtG9Ysb5xganNyqixu5InLdCiSCErAx+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
	b=JqCgn1ynpEtkxkN1wdf5HjcpSghkE/5fadNVgfqKH75e7ZccnZPKdbETpCeZZ2yUxEkl
	 qn2BDlKAkr90P5Gn8uRl0Ey1lgHbeMUz0mzgyf+B3qWQuuDcgtCglub1dDydvN1FrM3AU
	 TwGEx+ZP0gaQK0HLdS/5ld+UWZByZUhZ+GsfenffxIPJJrC/LfxeyYmTfy31kcumzbbFT
	 7l9E0kTUzNXcUbMvnZ3bAIWoGVlWNsbVEMy2VDV/famtwkiv7zNk4OG+cnAhGmyGVMCwW
	 V9QY9S4xRaYDIptG5+rbgDbV0qYCMUqytTxfIXkCRDgVLlENB42WQwDBEYlHLE7jXRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvjMtF6L;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A435D606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 07:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A435D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvjMtF6L
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-5722bc8ddc5so774889b6e.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333586; x=1795938386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
        b=dvjMtF6Lpvzc9uMSUm1ZoZR1vmAud5X/I2jxdRJXOZDkoNaEGcy0RtDFO8OQgBRCZi
         4DmzsyIozNtkrFXv5xXVm4ayDxA98593qlZdm19OOsazLriRG2CoyYk8EBCg5HirH63i
         nlpHFzOKkBIAzvm0rfk1rHdd9X7qSEjcGkVSkESsKN8Xnt9zlrbKAnVwO3aoG7dkXR5H
         +G87zXbgirpjnPlR8LYlb1qvmuh6ER62dH10gzX08DQCxN4sXyB2c6JC/rN0c4RuBP01
         YP7UUkGjjiLHqrqyaXH4yf+7QRnkYrRqITO2cNbJbLu+3QgjKkhDQ9vFjE2+TZUfho/6
         lmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333586; x=1795938386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5rIXOAbRqzpNweQh5zZVLwYn2XFN8mtukNpU08cq/RI=;
        b=chzNV8o/W4CgGNzM0m0HvLSNvN4OUpWkRceGXRHEZtB5DGzDw504eB7qL6yVOGflXs
         AW2CbDqjJKFZ0WoV75WeHbFCADNPVrg1zTiIvJmsUwpbu0JULwI40BoQxG3TWvkfYNQi
         QNFXwbMLsJJx4okXBnB7UC2lKcLMOyX3MDWBUvKEhn/t3lrFV2wRgvreBc0sm5h2Fq5c
         Z9QBf0D8GHKltWi2FOzz+ra5kR0FqJ0M7Kl1S3zDwXCoKgaqjqa++rwrIDoIDPUelqC8
         tsZUXcDYCyBL0XwZnio9PmUVc4UwkuNSK/FdsxTtqpV7IEBYywQtygMZ5d3Pfbdd3bsp
         SE4w==
X-Gm-Message-State: APuU4Z/5j/WzHGqVcH6WqA/HumimCbmFzlRj/lRKYnED+CBGfx1GzXTz
	0+R/0aPofcywGB9Ay8nj5VsE/v6szSKMhcfdwf0vZH30Z3M3rXI3VPIJ
X-Gm-Gg: AZFdTZdKxRCt9AquuQJt5C9xUEArS+iCWSUXXXwtDxG/g4Kxn9F/hBso81dtJMhh8fp
	P/68+DnwM5njxHb7CC5BGR1b3chqSMrjivFIlkvyvFf8w4IFrn8FUyBamtIc4r63ePCnPTTt/hx
	05m1wLaA7mU6TCxHYt2P8bR5dsKNqR7rxybBJyDsfvOT1f6AztWWG9QyOa7YLc7YCArB4catlXi
	S4ylgIdsAbk5mR2ttJckvYsl1Qt3Q+oguWp9gmlXhd16RIjqznMBFyezxLStLHqVUi5Mm9zomeu
	iXx729URp4ocT1AVE+E8y1PCKsOZbSju6xBwoRqnJP4J5sLta7vBAhyI3Gn7dRpJSyWhMap68ZZ
	YHsmae3OFamwRQFyZvowF7CWXQog2nF5IPUG9koz3uMggqTZlxX2mm6PvHm4UIVL7giCFmeCT9c
	YxwG3rcfGxoScdOwO0zPI7YBFztrAZcapq7T90GekvICxluCHHgt/MgGusZPbu3uHrg5kgwyR0h
	YAxOiHyChaMNBfg6J/3B6ltuTeXqR+QKPON4ITPdWW2+zvr8Ps3GZmqJGqi/qRKyYGaULjiSVhK
	633UCcm3f+WLixdG6RRRM7MaRBgNIuzf9ez2vFyCHK8XBR5p6fNZJC9/miwaFjuYFXJuzz2H6Rh
	6p6MBKYV+HrEQHjQ6EqxqemQ6TtJGf+c3qLPmGLAJAFCNCVIPQ0CC+TrXwBaEIsDKWAMCDnsxdS
	qvswPouNuL6CKqhiLmwH9+niS0Jbrn0F8coW0+jRZKXreforo7E5UL
X-Received: by 2002:a05:6808:6404:b0:4b9:a829:f015 with SMTP id 5614622812f47-57a0b645f11mr8031031b6e.33.1795333586557;
        Sat, 21 Nov 2026 23:46:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: support ethtool rx-all on sun8i
Date: Sun, 22 Nov 2026 00:45:45 -0700
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Oy27CMBBFfyWaNZY8E+NHfqVi4TiT1ggMtZ0oE
 uLfawoLxGp0NfdxblA4Ry4wdDfIvMYSL6kJ3HUQfnz6ZhGnpoEkaUQiUZbxHGs7yUaRN386iRU
 Faa1DmMlLktCy18xz3P57vyBxFYm3Cofnp1UcOdRH7cub+Xdp0/UVGH1hES7nNjR0POpJByunf
 q+UC2SUwRGtUTP2sq1K563TaoJ35KF7AqP7BBYz+7o0iAe2Q2PY9mT3zg4rweF+/wOeUeDzEgE
 AAA==
X-Change-ID: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

On H616 the PHY can count a bad-FCS frame even when it does not appear
in a packet capture. Enabling rx-all lets a capture see the complete
errored frames the MAC can forward. On this hardware, a 64-byte frame
with a bad FCS reaches DMA, but a 63-byte one does not, even with runt
forwarding enabled. Both lengths include the FCS.

Add the common stmmac receive and feature-handling paths first, then
enable them for sun8i. This feature was previously posted alongside the
checksum fix and is now separate following Maxime's review [0].

[0] https://lore.kernel.org/r/a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com/

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      net: stmmac: add common RXALL handling
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 +++++++++++-----
 4 files changed, 80 insertions(+), 48 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v2
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

