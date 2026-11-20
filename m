Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162273;
	b=EnIxcbikDLpI2vtJgbjTWRgRNjdTb5zBtDRonbMN9wCFJYnO/m/d6IQORR925ivJrgAQ
	 czNEWHUujaPWhArWzbhb0A6HCbhLkHGGg7ML/iYIuNdAGjJSqrocSHSekMPwUQsedh46W
	 /gkyNoVBI99dXL8ulXGocyREv37UeQUOecJL9kxZWUEqTB8AKPGaLy0vejUm1pJIjNTZH
	 4J7MbfuXwY1gg14hw/SoD+q4GaiY0EvPn0zuF4/hrR2N5uaEcDphy+mdlJo2WbKRiNIhU
	 7Zmnl/VzKz8C6E85Nahyns6bbM2w6NWG7yZ7zsIxDigNQuk7Xj7EGI7HZy4r/l47mbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=mi38xU0YrCvftHcaL1AVKK7A6FOikG0y5CgWbs60UNozvSmlnfRZYGlbzqoxxVcTh9NB
	 MmEx+ZmiZmOIvALKjsxzNrKar7h2Fu/X9KRQOZJp38yr0lxFxdXOqA+xT7wBe40C1i6Fa
	 FDirSINryM1wANOvHALZU3CPmi7bMq5tAadtQ5QnpQPr8icZ3LZSSb/9kNFuv6uvv2Mga
	 SJQWS/WVOKs/N8C/B2INqrDMC6HQXvIU9ZmdFxNjdKO2H9esL06/KOiCPGDuS71P90LdP
	 19SF6Iw843OXljAKzBd+SAkBUYShb75L9dnK6r3jQamBFzZIH556ANwg1pcGKMqrSuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722B860A2600
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722B860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso839236e87.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162271; x=1795767071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=w2ATjdeWwzJcMVAzYw2sUM72zVRswVEaXN6KcBeMnv1a5wK4Bz/OGAV2d1vhDrzdR3
         XSaLtIToCMVx8rbKxIZp3xo9oXR5wQRcYGMIURqLx1iNDth4AfZzH6TweIcacdUY8HMk
         bJg+0v5lD/gv2HVUCWrGxTlEdcKEVe8gsGuxfgJOmRHLC3dVgHXJaHN102UgzjEyua9A
         FBJTTjkxchlJuSxcKoMy55A8+5xg80byQe4k5CIR/KAXWb7S3ATcYExMlw0amzQewHc7
         b/Rek8VGAOvZRuuQsRPk6XWPvbOPf2sRdTn1P2oWSbO2q6I5QcHBTfH7c286B3A70ChB
         EYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162271; x=1795767071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=v4ljwHfQXPyqgVXrZ+4/ev16WqAcxgXoDMx7wVgMrp+uxT5AYqhq1ZfClF1IxMiTmt
         bALmwjXHZRSWYzsa2+6X52KlAuDjjcf3+QX65gLWVsQ7mkOaF89IkCfWpIpzvrqeARqD
         uUpDTzJpskW3gPHb+jJvIB4L9W0+kPQrmUI3bSMcQh8x/xpAxXec4UB9v5Ws8/0UD0rj
         S2kmFZMOBBDiG8IoddkVL4x1V7Xe5hXtYC422gYRtgR/UgJWsSOaex7kh9pD/mzf6lae
         IBiLJ14jHtJEEQFvqbjfrr3OEltV/tdbEHSn/Zb52qgH46YSgT4Jo/1iYIkgVXtMuQMN
         SuDw==
X-Forwarded-Encrypted: i=1; AL+hErE4jB3ovqGFgYirJeUPnWzvv7u9uWf2DXRvbxXkFf5pZ67E3w32932MNYr6sYz8SF71BTqhQFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NNvtExrBknOesNrK02FEH3uh627r4bHmsyW1U/8fdsK7UQAAL
	A1YtcCA1W7CwBbjYbZfs592/iBpxIJQC5a7pIEpOvtNezusTQfyE5vam
X-Gm-Gg: AZFdTZfEA6/JODl6ImDlcTxG1UH/m/8ffv2gTYTWvmIwWuMV2HhINWmdSx5S9nR/4JH
	C2s/R4LejsFVEQu2+cxckGQSY+doJ7Y+BnuabpU6Ir6TrriiAZ2BD/qABIQ1Mg3fmozXCmE69IO
	2vtsgR6yhrR3+pSUT02Br4h5h4RT4T0sa/+cW5GejJESAcMm3jsF+bej7bBViXvXbikljR3L9U4
	OYgXtNMnFwxUn0jDaxjxyUF25830kXJUH0EXYgytfH6fKcT1u3ufDm+xeH8GXo9gzegzZx9+I62
	eIhnB35M8GYW1TM5DgF/bqKuzkXBCL8jg490v1s1wYN8MsNeHdlrjeLGZ1zgeEPtRFUYkJwuiv6
	K027rqHZgv8XKHNGPzLGtIFcrg4GReqmzHp6rq6m5Zy47LtJEF5nyH01hYeBTMsknMoo2lUnlcr
	sKE25fEoZxzwoPmKCi4gYexeqiuiiS9DUmqbyTv1KjKqIhdNQicBbxAqI2iFavWgNyItM+OVRd+
	yJciUos0SnkAv4EH8pFFIa3UNjZQHy254r+HSUjcMW+K9OnYXEIQOxBof+4XO9XWswfswzCaM4O
	3QPPzyQDqIc6KY06c2LPAo4h1umqgAU9Uf9NGo/Gyd29J6E=
X-Received: by 2002:a05:6512:10c7:b0:5c0:d102:8374 with SMTP id 2adb3069b0e04-5c1bc7fbfafmr636017e87.17.1795162271379;
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 20 Nov 2026 11:10:59 +0300
Message-ID: <20261120081106.2919010-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

