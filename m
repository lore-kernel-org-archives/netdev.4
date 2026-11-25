Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631871;
	b=gWEySNKw7MbtUPI5olnjKpxm8HCHXMmrGmhlC/qA9nDVeyCyNEWXQ5/ARDwysoTflwAu
	 u8lk5adTQlLuIIRU0O+oQg7JFpWxypMYjhSO8nXDvfEuUgFa0/pz027GdMxWBPM51vbAp
	 VYod6oe6HRKxMHmMEx5NCm/KwphA00p0fJHkFp0oRpfCg4E6paGmd0dEWseHET5wL+dAU
	 lFZ7z5bOkVmckV7L3vD73XD0yoSY97D4FiiLo2bD32G7YZu+CwFt2cJ6k1XQcugzjkcFE
	 l5n0tIxKQo6YepaM8FqyOnpbg/jy/iLHPCF3ie3T6104hUvMIPNaD/1hBI2oZFcLafA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=i+9GCFN1Xg/xN1AT02gN+WMzAoQibMLJib67/mlmYDQh8sObHrIxrOEgoerCaCf54oDm
	 ROEZJJ/7RiBYUol69AzvT6ThJVrhFnovLzR8ZbIJyzVBkduDqFq+3vUY5+xOCxmjKQt+d
	 /z5w/F/n0QOf1jK2IWs54IsDGJbk+4BYSNc4eco88RGabIscmsO5fsap25iXWxEsHEJ0T
	 NBIFHhLHeAj1pZ4vNHRTEgHKShF7AqrCYY90ySrm3OpaJMac1tXpbqLNa2N8ks1n7q0WP
	 pwIi6vodAyP/PoHu5auV10nN5FfESD3j2S5HD8bUFBascKAHe8nEl9tdPgRDAJfUJbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE5606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02BE5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso5258934e87.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631869; x=1796236669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=IB9x4XiBn42WWx+a0IBFuOzPdoDFdOA9Q77g7vg5kei7js7nO/TgRpsHZWTHGqJDGh
         lqDcuMbNXTNwIpYOPoQT4UpO4L7/bfYHXWwh6CJadd1zKFSOPi2A1B7Jgf63XAun17UU
         d8yPhsGID7+V4GH7ujTExMUsBR/5DbEMAJUSG3ojSiPT4Lwv6tWBubT4BqG/nPqJrbiM
         uhLLg15uderoCOhiArWZKExx/On0zEzZiW/G+hEvORcpjMDWfI1GeKzcutweF9kwZjHy
         uyO1j8XKq/GE2cRDEEJe7kbr6YBH+3hotZH/RzHZ9BG212rd4H+/lZgfAJL9s/tMxC4G
         enzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631869; x=1796236669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=mO2D55Z2uOz8WM5aCOmincy4QajJDLRUxrEkRqYwzJSi3jeZbTi6cr8G1vNUWHNytW
         fNjju9mCxfpfDqJDOqlUw/2B+njjr6CjJNnWXMcfpycJSdkwtOTDHzXgWyU0RWCN8jR+
         GqkC3uRkWSOKwyE+QzFVyRDtWRZBFAbdP2C6g5KBnVCklwFOLRXS7NzNsqaoVU+pZcUA
         ivAYq6s7FghrKmNLheyNqUj1Ld+C6Ep3aH6xpxgOertaaPwEYFfzZaZ4hG2CVGdRA4Sn
         iE3ABeDQzT0GfwVWxVh9i/bG2yOu0P9LFHtK/dRcCruA1yEB/cy/6gt9/rwel4oNnkz8
         LBTQ==
X-Forwarded-Encrypted: i=1; AL+hErFvkJA4MGrf5OFeClBOMea5XpZLE2OLCBTgvSG71PWPhnO01OMT6DfUI6+Il/z5Jw1fF0ssCoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9abwKq0tJ+l0yuojOE5Urum4vv/vlmxwKVG5zXV4952NyDwqNl
	+H4ORk+T9eDoiMnguISR3Fai6D7wEC9gsbKGNGzc7eBPZvUskbr5UrgS
X-Gm-Gg: AZFdTZdxTUQ6nAZpV4igyoQFSV6TZ4a6UoNmli7tVYx2X1JI2vLBemDLNJB22bzUoWG
	2iX62lTSAyEX/W8VSzBtRotcXuVC+KsSvcr7ENnrdDsZES9RhufBVPoVwMg8t6Q3vR0qoATLbBR
	3e1GpBsMOB1k49k7bCXc5s1JZJcDMaAjWV3LUECz1mPQG0f3NsMLG5BO4Vr6VxtpjMsbUns/IEn
	bzbflOilTnRFGEGDvOs/k/kkkV9MD6qXxBVGbSfPyU+FuDummtKPUdXDe2kF0yoCNfIlJcpRJEq
	CFv0G61oRSAnv2/6wnUjVBD7zfbjvPDN98O7LU2wHdnVbqokdx7MhmsmuPPze/8rdCNC3vORQXB
	4T6Uuoj/cCqXXbd6PXVDLWkEzq5YXCzqx/gog4eo6Iv8USABa6KmjdM0W+PKo6Hvt6yVQeFUiSl
	hlP7wBcNg+9fQ0CXfWoovWqmkdtI1/7SDBD3LEsAhwmJ5BG01XgSwz6kkfNMXWfLiMniFSP/ALZ
	nlrPWlaQLii2D8fUzj5LoHcYcSL3YoYMoIvYPlSjVvuZvTw9NZPhu7qV344OwWMAOb19BhUj4Li
	uL77JK/w/dAmwrh2RcVjp98I8sAVnYMiFeeT8D91bbGIAd5FytyTcZIDRt5PrOiMUiVe/Q==
X-Received: by 2002:a05:6512:104d:b0:5c1:5a83:2fd7 with SMTP id 2adb3069b0e04-5c1bc907072mr5651830e87.66.1795631868971;
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
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
Subject: [PATCH net-next v6 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Wed, 25 Nov 2026 21:37:36 +0300
Message-ID: <20261125183742.3039752-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

