Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761442;
	b=lKJavsB8O+YLCFu/ZSr8jCnv0/od0qDxHnqMnaspJqwb7n1dDmCbAVjEmEhgsUKIwgNc
	 Pez6B6vftc65pH++hgpO2EiaFL5Vg48wzV/FTjZwpSzLa15tUxTPHdSPkMM04rCnKWb1i
	 I13JE9SDjvxHbw64hMaUzbj04mbFItVgtJv+TSlFiXlSlUbkLsd0VFfTf1/hhtvUG2RZJ
	 nYasBgS2FwupkhN9RyDGXG528XGpPs9Mi8VCI9kuBjYHGslJhhpVFVYcFkXaEcg/2r0N8
	 h4Mg8Kfhv+GBkEylchy0gjD2EO6IASdSTKGtvtUiHeGtqvBcTdJKAW/j4DZwDoMCMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=ayf9/CSr1H7uX0yO1wLoc3COyisM7r/CT69jcAekjMaG+DGDIX4GFxOUojIvDLza0lVz
	 IIStn7/bWbUldYKHmxuhUXkWcAw170wAML2wmjcS8SBKmCbSKCkJU2k+smY8LB5DQ94a3
	 qm9F6L38rXe7DxbFAEE55UjL7JVU8FMZyroY/5o7V46XM68HT4qFfLnXb397fFB7PXcUv
	 2yfRzpuzQdERzXAZa/Nv1r/F9eMbkPRs/IF7046Wzi4uQrLMXbWkbkbGQQ3y6cPL9avuR
	 fRK+nDqxBDUbBH0ujGAkigeWLkXvp5Yz5xELmUM9tWxUDmGbeokjb3Etwy6pmjDI7ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucztA/QJ";
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7D606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucztA/QJ
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c1479be604so5931327e87.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761440; x=1796366240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=ucztA/QJ143mwCYe3kf7A2RaycBZd2xoYXbvWqsW5cbri3/pQzV93kPcHYN9CCaW2l
         bnnQmXcGSWufUwLRWXIDFAM+WQkX6R5SuJomY1IMK3SQbYT/XVX/VcTCtiqRpPM4oVSR
         3r0Ax1FV8YKaxt+rwSQo8jYYBpMRb28Zt6Pz6uutC8KtVETt3fvPjcGdJVuf/uyWZRQV
         ML19RqqoRhgfjNVj+xSLTceTW5eOy3/VT5jUSlptVfHdtOdaZKYBdBV68si5wd8ViWCd
         iyM0U9S3MHMfjBoSum/p2e3pKQpX8IAChJUayLm/CwfyRn4+qsNlxaOdvUVImhb07gmI
         c32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761440; x=1796366240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=zZXURh16lpYOtDNp3/v1ELS75+xHhOOS/2iUkFmQGzXvpxgZg1/b+tj6U1XI6TU8V7
         Gnrj9MZPo/fCNNOvkJQLkSR3k02xDYvZRxyOKaVDzCI5S5HdyAriTtpnlaqJXtEFlRoX
         ZFtCudEFjA6gCdLO4vofC/Xv4vTAJ4oh5xDebP5Oo7hDZM7kMyHzGRWiqOBq9c4WoNJn
         pneEEOOzBtECbTw/eqbTnDUqXu26mNnlD+9xrXZ5BqStwTRbsX+fQeoQQhoHFO82mkXe
         /SbLVly+VQbXJPYRwySeuW8b6dD4YkhwN9gZr1YzmYT7F4epeSPfUeneohegLiOh0Cnk
         2LxQ==
X-Forwarded-Encrypted: i=1; AL+hErHmIVF/+aDv1gsNsvnQ9Iub1ORgu3LYcR5f2erqP5qK8KhNPxT2EyeZSrvwABNNmaGAbv9zcC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CKD3ctxLvDI9SfIod/6uLvPedBQiX+wbGw5S3NkFx18hZcDyv
	NgUHbwxA/cMm9MV+rGt6+ymm1RnzcRnrxzk43wOFgKwc0Dl+3Op7MVgv
X-Gm-Gg: AZFdTZc+CjvfVNqv7AIg8Vr7vogv3ZXtLBMIffpVqGMojS6U2rj44h2WcEzrZ5D/GXX
	XvE/w4O47GFPeWjbkupcYOJW9OvIVJWcu7dZZ+6Er45iEH81dSZUqf/wKNgpT3U5rHMuf9M45+C
	br78FzP/ma0bS9ALgmP31Eas7r8YmIHarrdkNumlqJxLKfM7mrDuyV6cNKQAqgZu+UEndZJ0m28
	XhYv1KY3JdAKBYYThjHm2SLzaksQR2A8ktMD9aRVITDpYt5+Vc6H7X6M9wEVD38O08/bJIyKGKO
	FhqZwQdOhm6UPFbXohXqiZZBwlqc0/Gm3+lA0JEnvgzIeEcPtdMLGUOHQjdoWRAFLMT5OByQ7a1
	1P6JUgvRNVO+4nh7cY7QFQzgBBV8nA5IDuijufA8ib1TTSLvxi3cU5TMKmNuXC98PT2P2V/GQhg
	kfUB4r+Mi8CbvBVtfwNYk3MkbTUw4Okq9aNOjap3WV1Rx5uEOeIxeVi0bPk6tWP4KX9zvh44h4K
	Notn3QgwAAbC6salM89jgoo2wvTNvsSRzSm92BatuFeTXJBoX3jCGxsBprwFE0pyAKS0Fbp7+G3
	hYJQPnCpB9Rj+okn2QN6FRdD7hhdYw==
X-Received: by 2002:a05:6512:2249:b0:5bf:cea4:b26a with SMTP id 2adb3069b0e04-5c1bc86048dmr6197622e87.48.1795761439922;
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
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
Subject: [PATCH net-next v7 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 27 Nov 2026 09:37:03 +0300
Message-ID: <20261127063708.3074433-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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

