Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594718;
	b=mVbW8dTiHnEOjzQbWBXfZ02Yqi4Nh07P4pkpvHG2R6kY0f7nugY/ShXo8MNWLzL9vOUO
	 ikgE2ueqP/xveKARgNhpTOUe/eD1WPAIcAcRLfVTnHexzwDWD7I6MG5MrRiZef/KQXnCd
	 71u9eVA/Z40ugS6wm01x28veTjz3KCSw8z3eJMdLpUNcw0L7+TEXmf0ZnDngu1lE2lzvb
	 cXxnkiEG9YIRrKNJIx3Y1Ii6ZUALHuSocs07AwjISM918Onp6ZEFbNsXve9GZztuaL4wj
	 xcADeJiX0lxBVyki9GQLpf+yR4FjOdP8WD5dAN1wYt4cxy49krDCd3GY+N0OtCJTI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
	b=CnaJoz8WS6pb6ipaJ+NWe2gB1v6QLoxA+mZhF0s5IVknaxUy433K1bdEQQcBQXcFkDVc
	 RhE8sjeol9eRcqeK2O7fVtukPnGQ1MguGDd21rCjUew3ps8gk2Q3OPR3FN6NBK8l4bzxi
	 vs2AtKuA2bY4hpPmYa6j6kPdt/bmDBaZUcbVNAJke4uzYQzxMYhzGkOwCRVkFr3a+jXiY
	 eMSvzxx9G7zWgbg0a0pG+MXArzMPo1OVNVqBEV+vuxFk6FrPu3USP6kNpfLHBcLVgEua3
	 3U0MNCeSGZ79exrVpDe4FK5f3BjvApSzWKudrRtf3Fv5/syj6PUZwjJGO762LHEFJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwvHrgXp;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B71606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwvHrgXp
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e9476e26aso1979990fac.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594717; x=1796199517; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
        b=MwvHrgXpqd+rbMUd/L6VoI5wk3cUvTaUoJAEfSj5a4sHllwbV9Fr7yetphCSjYj1kG
         a9pHGvsHj3B12XHLdV8dbsl4teg+HTTMEFQxO8yDz0uAhUTc+KU/KUvPsC1XwH2RWrdJ
         9IQ2YaQE2D+esBv5Ta2fsnfv8bJuncQd/2ulEqc0jRs3QQWYPKFmxrz1Yah7xa/9FyB4
         b+ZGPbrVccY8HubxByFrOd+Rax/WCFCwXDUCVmPGRXHYriHb+EFf/sm2OU0yMrPYcxhr
         i/uYxRPyl8/mJZnYrUVfll4SUdkG9vFsqNLcL1bI4LDX7b6/T3zNZWThR9mwb4MXFwdl
         lHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594717; x=1796199517;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
        b=I9HYh+VqQMASxpGZBIJd0+Eg0X2ZvNVbNT56fyKBsMXzX9X9R7nkDszh8A0fEp34Ko
         a5wQo1jWS7hqCUlp0ZGutL0EbteOVfDhTdYNxvTPmHG+Ful7ufxGsxUQRQiJvJJ1/yGR
         /Z1tC4k6B058G5ETnMG2505eSudPPk7fXc248FHNQ42/ZEX/vq/eM5vRk6ASm3WxqM6K
         nYNQ26PpScz5oL+91NTWB2zY01QG1bfcCW0953nh90/BL1hdLKBhD/RBuzNuKL/WKFmo
         uvduOK9pWjiOVl7RFSqKLJHg0Eh4RZFhxmI0DXf271TFHgPfeRGR5VshHunhb3UZMxBK
         G/1Q==
X-Gm-Message-State: APuU4Z+AcUl/MPlYAvZlWHy1f/UFWRo7nywOh4m/t+5Ci/3r1UxZhy9N
	A+/+qgEDIV+6o7jVc4Z1ByZ0kci1FGf0tOOY/14No2L1COWbSWi7xyII
X-Gm-Gg: AZFdTZcIb1N8JX5NxbOC+SPNH/H9yVPUbyNHVoKdM9+oGfpWIrILT/nMJZGwnSVqKbq
	wyQzpN/FOqlXWQRcoHtlkFaxY/wZdGJXoPJZ4xNqhdMdmAZSxh4lARyK+TQCRzxANLkoGD9jost
	EgpUdWPBz/DbMZAhfdHiuz2+2n+vk9SS5etTTLdqYXBhNzxJqu+467k5QF8kLSov8qMoSIC+KX5
	Y+MEqPbuBAHyr+K+Tr4auIjPO2xr+Z07C/TneusDARGVQXPrfxcpE0YvcX1lm8zHFJ4xtqf5lon
	LtvijuEj8M73STR+sBe5yBsSXnuOY/br97adrbutNTvPIeUJ2/tvS4UDK8HCzoKOosm/+uf1R+t
	/PCH9Cm5thMI509jkUvTna6SKs+aAFfOidEelSoxcNBqdi8tkubrVU/JzPnJQHX66v6dtwO+FRt
	3DulsZQGwG1hetvSq5mPa13jSOP38c/ThlYkKpfW5if5iF469FYun61bug8rkbmm0Q7EF7endVw
	EMGYp97HgsxhqZdojNf4UEoRi7kYxJ8gCiR1ABNJuLc1Fczy+w5qC/J/R0ucOoaFDYENIWs0bIJ
	Hx3cSizGEDzQHB4h9lwSZ2ROGHgk1oG8pPA3ALP/D3Q6LCX5pOGVO+ioQtMh9FiF+3DaWgi17ka
	5QHDq8J2qKkLnjiwn2KGbFfh76PfQGYMgXOesA/2Ami805BnOOI/W1nc8NL4GpCxriX9IrK7rsM
	V3JSE+/6obUlwTxc8x7shnuVwYnF71IN2cTA7Xpo/P5Gv1I+PaJkE=
X-Received: by 2002:a05:6871:7429:b0:475:a112:1270 with SMTP id 586e51a60fabf-4ca12632e01mr2463194fac.29.1795594716914;
        Wed, 25 Nov 2026 00:18:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/3] net: stmmac: support ethtool rx-all on
 sun8i
Date: Wed, 25 Nov 2026 01:18:29 -0700
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQy2rEMAxFfyV4XRdLGb+y6n+UWTiOMuOSR2s7I
 cOQf68nnUXppiAQQtLVubqzRDFQYk11Z5HWkMI8lQJfKuavbroQD12pGQpUAIg8Le0YckmTCTx
 ubhj4ChyVUt736AQKVnY/I/VhO3Tf2USZT7Rldv7pFIkP8vkh+5yN9LWU0/m50LpE3M9jOdRUC
 tCcTFdrUqY10hBIAxK07MFLUsKSsJ0Gy34jFwcHMNi/wLwnl5cC8cC2oDWZGo20plnrA/AaUp7
 j7fjICgfPP+ZLCK6E1sZqjV6qt8vowvBaHLDzvu/fCvjn5mUBAAA=
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

Add the common stmmac receive and feature-handling paths, then
enable them for sun8i. This feature was previously posted alongside the
checksum fix and is now separate following Maxime's review [0].

[0] https://lore.kernel.org/r/a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com/

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Drop the RX_CTL1 lock and leave DMA start, stop and mode setup unchanged.
- Align the EMAC_RX_MD definition in a separate patch, as Andrew requested.
- Apply rx-all alongside the other receive filters, independently of RX checksum reporting.
- Link to v1: https://patch.msgid.link/20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com

---
James Hilliard (3):
      net: stmmac: dwmac-sun8i: align EMAC_RX_MD with tabs
      net: stmmac: add common RXALL handling
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 22 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 4 files changed, 59 insertions(+), 19 deletions(-)
---
base-commit: 612848d37e68b858e15815175f1c5e609e09d719
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v3
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

