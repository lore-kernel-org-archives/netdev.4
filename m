Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915886;
	b=2Nl/ravNs3QTvKEz0jhQiqLQkB3vMTLqln5uYW0e1fznmTaOtBiiTxuvP9Hl1YJ7d7Mk
	 rPmQ/q0b+6N2FNL0Tg0ZsGpimUlA5F95BMEx205RkupjJfjjUeT4XLmBJr9lRgr7qZMeS
	 zr6MoHjkUBuyebyOhwldUKaUe0vCqdoxuVD3HEHgirzXkxtB9rlw8/7iFE1koSpwW3KHw
	 69gP8HbG592i5fAQO9dAsVxw9TJOfGndq8/1hupTQOY9H9Qyr4rN6elSLntERINz2kt4l
	 KYyOihWIRmDnkbbEJjSfz9RmGER8V1LTiZCJQvHcxGtvyWP8nQxvUB0JXdAou0InHmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
	b=1o6FDGZ+8t54/1aHYqUs3WL/oyIPlpCsAwqt+R8Ue/aCMB+03YvVgDn05pmGKs0hd1G2
	 k8jiYUnmYAGYUtyDxxLkBGL7hkV+vz4k3+J7NPROJqPCQnn1YxTnjCCf7WmhaeppJ0Bjg
	 YFpEm9cwa9gkhFN91lguUnFJvLF6lwM7luZwzG36Lv2rITqWO/QPYsdNtK2ZA9rzBop00
	 6cOnsEyQMZ06rT7YgL9cL2jMM0KO0e++tgYJi8LJSPouV0mvJ5zNHt4W8cfrt20GtuT0U
	 cPphyxU4r9S5EaUavIbX96EaMlqi1AFvVWdiqD8O8HFeU+ctnOELJdYgvhe5WnwLMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EC606A899
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0EC606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab4354db11so46352531fa.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915884; x=1795520684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=f7erzHrWDUVlSzQxnWriHFURIiNqowkSJORhhpLcTPt+vtcUeeOIpBgejK4l/YsU0J
         V4lzAkcmDs15Az5xGiXxSV1ceLSnjv1cN917v0Pmiczd1lOVrSNKun7URJ7Pk/f3jm0G
         cpnlKqlANYS3CqQJWmwjM2SRfwj8pc+KWvWifnd7HJLE3oKjETRb2EH5NQcEl5Ne8czV
         73p0nBib/73qaZ5dGTcVm2RLGrYqZG6iRoX//PwN9YJV43QF2uL6N/yA+Dz4QZRiUF4i
         nBQcKtGZ4e8vIJsS7MoT8ABh4KFz3CN6dP1hH3qVCcWyRx13d8LK6lFbYUDkME/+sBxd
         p5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915884; x=1795520684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=P0RAGI3c4gRqGrLx3v0cPmMTeBI0gWhD4U8atK/e3A7xhgsVXEaRn096QazpjQvZT2
         1/mOTxpaBQid0wCFRXiC7xC0l4A6i/F85lNLzypWBtCuIhggR6+k1ljYknqSm5jD4g55
         f5ctfYRkJCvP7J3G9nbtjhGlCsZv4wxfIWbvgpmjFCaiU/WDKgZmSgTsAXdd+FAjvcSU
         pSOwkZOl9nYtBmUyziprNayVhtfx5R2DqmhmwGnRMMqydCCuf/PbVYW0kIGk+aXI9gAz
         YWcS49dpVJLtRBdJwtSRbrcR62ZA2UgWllLhpXriTdHnYYWJCj5PWlMZjXfJJncjI18x
         dMlg==
X-Forwarded-Encrypted: i=1; AL+hErHAC4C8xfWGLykJ7TLOqhz2dk4yIqtQD/KNmUVBByguM1oCAx388eKgcgEfz0atvWMbYsrsG6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kFn/7yH6W2Sm0lC4S+vULNAojXwOc5TVubttBfQbDyyOnq1Bz
	uT6x0LCbwEzFj6AixXRVbKNnW1arnECRohslSoWmym9zK4YQxX6GTXjw
X-Gm-Gg: AYBFou22cRXiegzeoVtacyGD/Stgf9qwT1vNf8BAHOGFr0yyRV8CDUgtObiV12T0jr5
	ida1Vkna2ExklCJuRzNT7URbbitXvImCbUvTHTxZV1JqHNbAhTu9aXP1dsotfzvlxyJEIUzMLtW
	l+q/TupJZ9U3Ukr99ndrrzWJD/4PsNtBLBh4WH4mG9a1KmZRqT2/FcnfeA3VKCbuSfHgXt1Uc/P
	AElRQ3pVRm9PQ8tOkB6Irv18ESMmAGBtcuFbzBOsuZtHaG62/Eeeo8jB0gzPKUDNTZ7ld0zqqnq
	54DxAraVqMPVv6Jv+LtXNeeyiUu5AxQyl4KgPFf9IRIxq0gPPszfCpyBFSSEXgD4/BF2/2v8diB
	X9bO7u9cw6TbnsQlZNaCkyBF4dw6TBu+dtb4Hp5BOL1+xxJoTRVtqXe1nK6zUsATQDavfygLRfO
	Pr85z0HOH45y2fGFXGJCOq5RxBwotMzzNdAoFtQbKCIqzBxYGkRRKP5BC6o69fInxQRwKNVEzpH
	GbkONS4CIUdBUbLIqaiBtDeQ+fY3XvH35MQ12TrU6QpBy8nYn7FtXhmI3MGXQQXIwphs0Lhsl6i
	Oai/b8ojUVsssbYthX6Xfbaq+l+KlETDDcHqyPtJIzOZ8YY=
X-Received: by 2002:a05:651c:2204:b0:3ad:f29c:e89f with SMTP id 38308e7fff4ca-3ae2b4e80e9mr39665131fa.17.1794915883850;
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
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
Subject: [PATCH net-next v2 3/4] net: phy: dap8211r: add extended register write helper
Date: Tue, 17 Nov 2026 14:44:29 +0300
Message-ID: <20261117114432.2794961-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..f626b43fdee1 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -87,6 +87,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
-- 
2.43.0

