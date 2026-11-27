Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773020;
	b=IRpSGjdsvDwvhXgrz5X6HjLvVpzV6wYT1eVLn1ZB8KiTNbISdLPAxz8ZP+tyIlj7sYJj
	 2lqP8F8E9PCaFavUcnjE3GZRfw0u+PIYN9VD/yr3Xq1qiAFhJafKNKgYy6MCWLhlPDT2q
	 Fp2DInBCknmd4ze6Xo+kFgttcAxKVwTTog7vJMQSrAX2hMtVI2hJGUIeJNeb/jGzK+Ajy
	 3XJfR4DQGlTZRZPiTlFXhEHp6LMGg586fgEuk03jntl/ylFGMzoh4CiIbIifPfWjdhqu9
	 9ob8Yq4DQ9WOCXfQVzy0xo1k+GPL/nBF6JsJW56lv7BQzr9VpujOgcqSPw1Kw8dVVfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=si3D1og0Jv6LbrQEBx3gBzBWawtbwCigS7bcMf8sZE4=;
	b=3csKRLcSx8K+sMCeypYICJ/hJk7nvZyFN+US1EM+69XY+ZxxjZA01bzQZCZur80F/Oh+
	 WWQvOyiclbqnpA2Tze2dXqyERz+/j6oEEsxlfNvGxGaVGyDJUEWJaKT8kOX16C6qBc8Jd
	 WIfnGKq4640RyEEj2Cr62R32f8iF8AdcU/coIDMN6HXp7Q/eNycJSWOUBAcefPAyohtP5
	 U3IUlgqX91ejFkWqenpggUKhZlvgcFuxWC80XyuWuR+j2xZfxzkYTP6E8YPVc0yXDGWQ1
	 kILiQPKw7jIAn7AqrMfjjfZB91jSdZknESGyPZfCqvr76RBwH+rkcESD+Ub0IXlZUrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oQYBclTR;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4367606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4367606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oQYBclTR
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b53db3d0a5so102494a91.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795773019; x=1796377819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=si3D1og0Jv6LbrQEBx3gBzBWawtbwCigS7bcMf8sZE4=;
        b=oQYBclTR3hWtCbyi4dvXLJvQ2SswFceuXdgKe/pSt7l8n9WGKDFgJcx4Wq5oI7o8vp
         nq0BlLizyY/6F27fvWe9K83qBPcugp0GT2+EJBCAD5oYWqMGCSPBkETQYWVuti/cFFz5
         f+Ok+HFoMd1xSd8ECrkFTYtvW5tphggy7rQ6sfMdpOX6Q+r8Ano0EPQWveekBHcIu4R+
         yvEvyG76MPHf4TELani+0M6lXmz+8NPkcdgfuhgUVU7RgROGdTKPG/9KL7eNRnL0bdEe
         8I1CJse1Y1hcLxxf3n5066drs6VORbjbis0UsQa1MYR6OGeBODPCdfA3+6gSf2TS/EmZ
         4OCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773019; x=1796377819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=si3D1og0Jv6LbrQEBx3gBzBWawtbwCigS7bcMf8sZE4=;
        b=kgvqa5Hh7yu4xdpjBu6KpNTrtbwiUNlx4Y4DgmQ9P3tdeNThMXfLZVRnKrVF4ZWoZz
         lMUE+hmiFHBfyt9mJ2t2AmMsnHt0jNaePvmZzL6N6izcfTkq23vBbKJr9AoWtyI6HvY/
         9C0FmCnHj85OPss3kED/cvmrsjllRdsFBp3qdWgrGIoZC7hIBICAU/rXIU3I98haFE+H
         4Glh5qR+3qiRteP6iHjlRZ8HsufvZxh1DA18+aevC92MZg3yPGu8y+xRfhK2/Zn0qMXc
         KMnKRzlWKFb3SZcp7OK4WCiq+xepLVP+fYm5V6NEVumihoZg4GI4Dy7PUItdycBCFM48
         DEyg==
X-Forwarded-Encrypted: i=1; AL+hErHoWgIIevI036pU1IHpKoQWNKgY2QZO3dbt/t+wJ9wVH6L7Dgieli8Say6lwJMoxS0aZjQ69YE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nwI6RMttQK3BmhH/hMdrW6/u8HPdvtL++aoOx22y5n0MXy/X3
	4WpwNLRizJ9XXuO7/TVezwinxwjptJZhqd/vQHpb6bnDmTUOrGfDoVFDTRqCbt8eUw==
X-Gm-Gg: AZFdTZeBKikACGm/dsjtSg4QQWGBdHa/oIlofEm10DDasuvO+ci9NVEAPTWrqL92IaM
	9+3NvkNbCURSWQ4abw7gPBurz9wU9YZIhrjO6O5SHUu+8iNhwfXOqxHdkTwDg5LeYxWVr2JlX1H
	lAmt0W0JYiOAFx1kKy+fximLP4YMpFqyvTg9kVe5cPsfcWqkGd47Cgdrx7fSivsI6QcO9Nk4dHs
	4pSVW8T9Z1xu4/bXBKeRW2lAor/M4exoqdzLgZOva8u0Nj1rCFMqIWR5apDkKvfC1ImNIO7fdoa
	b2//6jtETcTzd5GgGIPKkKKj3RvWZMwkCQ5GwCcCF/41uuF619Yw62gszsOOF+X4GXo4s53eHEV
	478igJ24PvCTSqEYF7hNXbECvlRVtoyJ11abLljDFta7VywfBef06OVi/WnTbXu4E92SpayutmQ
	hKB1nH9ruRBEpdCStxYmKwMQXxUaSftRG0oPEpuYI7M7oaN6WtF/T42blG7vWAm8XXh3hiT1qYQ
	tkBpAzYaPqCh9A6eN5PFFX4WtpknRxODQ3uIFsVzlTr7NazuZJ7B+DUuJBKp/poKfaLauwwtPPg
	ayQPTaq/G2649ddxA3xuZjSGvwITWTGjnkEgaVZb7fLvxn5/FUAyYJ9sBYQKtP07kNNTkPoanGV
	NxrqvsN2FuRXbw3QSbg==
X-Received: by 2002:a17:90b:2d8a:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b41c952eefmr23027584a91.41.1795773018800;
        Fri, 27 Nov 2026 01:50:18 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm27539126a91.9.2026.11.27.01.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:50:18 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net 0/2] net: phy: broadcom: fix P2P timestamping
Date: Fri, 27 Nov 2026 16:50:10 +0700
Message-ID: <cover.1795772837.git.jjc@jclark.com>
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

On a Raspberry Pi CM4 and CM5, the BCM54210PE PHY sends an incorrect
Pdelay_Resp, so a peer using P2P measures a path delay that is tens of
microseconds too large. This happens with both two-step and one-step
P2P, for different reasons, and the two patches fix them separately.

Users of the Raspberry Pi CM4 and CM5 reported the two-step problem:

https://github.com/jclark/rpi-cm4-ptp-guide/issues/34
https://github.com/jclark/rpi-cm4-ptp-guide/issues/49

Patch 1 fixes two-step P2P, the common case. Patch 2 fixes one-step
P2P, which the driver sets up as for two-step.

PTP over UDPv6 does not work in either E2E or P2P mode, because when
the PHY writes a timestamp into an outgoing message, it sets the UDP
checksum to zero; this series does not change this.

I used an LLM coding assistant to help prepare these patches.

James Clark (2):
  net: phy: broadcom: fix two-step P2P timestamping
  net: phy: broadcom: fix one-step P2P timestamping

 drivers/net/phy/bcm-phy-ptp.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)


base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267
-- 
2.56.1

