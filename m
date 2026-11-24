Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513762;
	b=bc/5mkRPxCzJg8YmBZR5BRCVxwrLT7MrrFalLPNjKkKI1sXhFgpr2i/GTpy/JColnZpN
	 iXrMrVcVBVOc4eGLuRfhBHpMxH5gm8+PPY9agVx4R7QTYTBvqL62WL+7dn1mNoBT17sLT
	 1e8JT4XgV8PLD/bFuubBlII45CaeXMbzZWLECOm9DdkIaU8HRDq2+zkFvciAhIEQYR+QM
	 ZzlOvwZ0zBsW051VcAikNzket9bTcJ9AFrQSSdg8Gycft/SOMcb+B3gubIbHodA/FGEQb
	 agnjpY6KmmZrmjeq0bsdwpEivYKpCBJlNi/HqECVcAMD+Bokdy0lRDmqprhaprWqMIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=LmiQjCuy9/2dnVjNykS9K5XJJW4ne6nimqKjl4XghGTzrH4cVp6mA4ZiEuENes/JfnFx
	 QEowPYi4B3SA77TarIyfYj/Uo3dxdP7ob426A2MzxchbMLjmNw0NGO5qNoQ8xLOgH9Q9s
	 klkcWBxV/yv675bu5wvwSomsyk1SHR85eZcRAd6sbj21CEZkbX89kelEsiILRj306qvhD
	 RnHBw+fRa58w2hihEMTbOGJ/vCx5Hq1F8tho9uYHlRM8+EbYkomMxDy1cL7LS+Afq5o62
	 J8wFIC93wQFE2vv0s37RgzRy5tADEQ4E1j1tfadhvQ1ka1MricPqWPJGaH7Q7F3wiiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1495606B009
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1495606B009
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso28931581fa.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513760; x=1796118560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=Vra8ahew6DCh+xOD3B9GVIIHTWftq7Q5Qh7dUmEvAMzOoV55LkwToKUZBLTG1gL5cz
         zIOdB95FAKOrUv9f8QxF6VCY0l9NqwLtppZdhJTkmZoTMQV7xAY0euFq//1pewgqhecn
         po9Dm2dVl9z31VrI21h1TuBn8VZEz6nZNh7cEnPDz8TNbitavR91C/z8Q6k9eATDavVM
         LA9SgmWNB+wDn8RA6EwLRxadydgqeVAyYHTMnZ23YoXee1W0n8isAaVPgOn20V4i/Egd
         hgFUp+cmqgTN2/nLV0MFuNzrfoSAKtcl4Awjy7NJhzulPebr3aMxeSmGZmhVaB8qteNV
         o+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513760; x=1796118560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=I8cYBcMUZHbQEzuE8rvUdscRHnUWBE+62nFljZfKuFsIb7SaGEClLtwR5h8A2HTge0
         rWBCUl6qNWMXP8fqh3c2+aJAuWojy6YGkiIPESCqdrwE2F/zUQX5hW6ZDvEP7JMUzcPK
         A1SxgiPz2sad5gJ0AlN5uIue5VyDokqflC6UJCdtPd8IZMFfJsOnfIY+Dh+J/Rye1emH
         LtHjwbiK/gBh51jgLM8lSREO3kA0AIUPTrARJAbmVeY3Q+cVuO5ce3833IRNYE69gTWU
         6DRU9HaezRj8TupR5uWTc+B7muHSOgfESJOFLNY4AT6OwOmA9aIp00yzH4fddvAvLpZ7
         Lq2Q==
X-Forwarded-Encrypted: i=1; AL+hErGUz1lS5GaIUzutxEy6sB9ltqHIHM1n/1D5nW6tOC1wPJHHM/Lih6nmjc/O5CqCp4FxxE2jHYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gJf/+HhWUctzPl+lQ9KrrF4HKiCXpKc2OmHdL7VmByKDMRv+2
	f/XC+fw/tn3cNF7nNOG/OZZOSOIUUHnswTEAbzIppvW0YhW6MuBam/kt
X-Gm-Gg: AZFdTZccHcOfcenlZJA5+r2LEZRAdA4wcTKskaD5TyJQh4zQ/yKLhHkkoHxMbZgLZLH
	nkh7+IfdAx8F/zWQBTHEpvxjFsaB2xVlpXtxDRONffeatP1Wko942wcedJlaDChXoWO5JSzRL0v
	ic95VCp9SMPdlDEyv/vGANjP0e4D/X0ilLuEdTahZ9m+IPIC64gcffPGb3dgTocEV59Kq5DC9VD
	i2NW+5LxxGZGmOR4rUD67JlqOHrDlXPINX+VO0NBJdnraXOjP4UBaz2TfW/JbtHsArwu0fQDW8T
	jPQGFlo69+JkFVRvA+cab7OTLSVdF0FUYNO36DKSdTf7h1ab+BbY2rSHZuADiUceBR+rd5zUXyn
	4Nf1WqyobpMKw0JcXmVzfMUxSkNcratxmyJBii480MMTlNbWRtbqdmSaRjP3OaS7aJqAT1q4K5u
	pjhFLHrzmL91x6ETGNoTL/Ae0Id1XWVjuz57izYf9/up9jDiw1r8FRcgDjFvB9aZlOnWsOcuyn7
	A60Lr9D/EdM96z+oQIQgyf/U9C3Nt7kH68S3ah3UmGhZvWGKXsKW43FVjf5tVg/JjzdXAlUc/dJ
	Om5YVkwocWbB0FWW8j+thk3mD+ZDh9PYgCekRbkHs0pHl+c=
X-Received: by 2002:a05:6512:3a94:b0:5be:5222:5611 with SMTP id 2adb3069b0e04-5c1bc86cfe7mr3678861e87.39.1795513759856;
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 24 Nov 2026 12:49:10 +0300
Message-ID: <20261124094914.2993988-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

