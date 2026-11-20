Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134366;
	b=Qzz0VzOhzMxkvyDsvIq9pyX1G82ckwm6pbFuA7lbSBrOrV313Y02rkXWWl11hl0mh6KE
	 5NP5PrIbbNJcqxWeqCIV75YqoM4aupBybxgn2s40SwD/Btt1HAwDC3KdfTyw35HpAFr2k
	 ECCOt7axi/VOerkoLew/q3A/5zgYqA7ioKWmGUtXxarfCVNJ9l8vO9PArDI5zdI5/Ws0f
	 UONwfDmehpJFIvWDK0tnPBWY0QCPQCsQA7TA+AbLn8eZGkRqYgGpPgcgn30bH8Yr/6ibx
	 VlNlWj9FhHVvJ66GgDxwmDkVeNpUaTni0RSBLqWrONUyhHIQ60s7aPxLsHuOGdJcz8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
	b=Q3vVP6BUJk5ruEQDYA3AGAA3nUE9P6tLsgkeQuGcdi0vLpJ3RWZyH8kuMMN0jPiM9uzn
	 n32I4Ya+nLTBSvzQWBy0L+laLjLy34Pvs+EqhKgdYm3sYGVVxGE092dJB954L4kKy3AbH
	 M5jj23i1zxhGRh8lpakxpn3IvahIWaNXs2pKKGcyp39X6pvi9DXeO8cjgiHtKR7EKWICO
	 Swo6+05YSu2OTO9905t50Lo2kcUrBN+ZsTQHd+PMZPry+qe5kmGs9f/QPVnyBanMqnkeI
	 JIZqwSj1onDerZw7UQc6PW1v5l43K7mWtAcL/MJFNxai4sclbiZDed28nBASysLyrwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WEJr/Xcc";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52360A383D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E52360A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEJr/Xcc
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so214471f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134365; x=1795739165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
        b=WEJr/XccmnAH4kdeHeZMrPWCd8ssbOQXMdvRUebc2cy558660ef1r2TSVgqeZ9HFVG
         zmfah62UoIvIb0aoGHg3YuxpGi3toodjBdwRazY2yCQfPJFcP0dpGMVurL4RXHBxzdBT
         FPWTO7Db6N2Q9fjFIRuumapN6TYi+OTlcR12gTbRKQ4KvgpvjtEtsNrnFqLF79jeaXrc
         XnHtwfu+eQe3PzUvgArXx78AM9KNkOucnwFyh5I58YMZnmNvmol7HOxQ9jgR+1XIY621
         460IFhRDH/SkdmoEQ0y015RGcWjLyfXukK5GieW4U0VDNGH/s9snuaBJz5CLqDo381PY
         TqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134365; x=1795739165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36Z92l+HC6VUB7pZKBuw1nWmeeV/t96RMwh5xwHqbkM=;
        b=Mfj8k/GQUl3Ff1phdgtcUJBMJ0VgxYZ0UPKCFjAtXF3Tt6uanmeK0V/qo+6v2Mp2f7
         IAVHmaVe+TkxYfgg4JCJj1FweQBxLCGOV9vguVyMyatdt/nXVrBZLlT9gKYXEJECjgMB
         oX214IDT+0g4sQAwpGfaSmCzGlCTPrHnd7xJ9HV3kDfw/k3CdYuFG/9339xxSqSZ8Exg
         AHOkAHTQ5UiOMmKgG2jmckfENAYCFN+aixdt6LHs9A6jZJXTIoBEI+Aw00ARyV1+mAhx
         VSIwq8nrXwYAGc8OTAzlFoGtOqiAXjvfyVHUE+YKuBZ2mJpUYd9pOwIe+O7HLw7WtpSp
         Prdg==
X-Forwarded-Encrypted: i=1; AL+hErGwLwhXALh9A9cFFX715eGCf5ITJBRgFi6uIX9GfKo5+NZcjrJ/k4qU8Fx3DznuYDS73+v8wvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z8nWi6hKFZxYVGILRBx3c0pVEFrqjhnJBJZl5cKzgKLJuO/eB
	VmY1dnRxGgEHlMomdHnus7EmVbaTR/LBGCT3SBm+GYFbkTiA1XYty8W1
X-Gm-Gg: AZFdTZdTJPnaMX8FhOwUJ85SXhhkOH4Q2e2YdTWvXXj2RDViW261Ff+JDZY/xmXoGzW
	GQ2EpAO+jHLf5RwKotGscqMdlxt7DdrNR1bD6CSfrdjKKxXQzzFy/mzgxyl/4xbzwO3Z5M7CXMA
	Ve0UeeoWuyP4Lov3v6AA9zFuVobcgLwuEaNVBcbIxId0npx9hUtEuD7nRj+HKeBk8ZdrrT6S8Yw
	Ly5Vd0vpj10ymDHOrDHuKQFzwDQ/rvcXWmomoUt1JpHttbHGpHyQx1S4r6nWwNEG88WgH0iVcbD
	BkmGNRoJKVKxd7jxFjfsPlJXd9BxH/EBToLLdw3/CO2wIdHCTgQNfR0/9UACcwzgvZGd+rDU0c4
	HpgOKFqR3XPD09MgR112F8IFtC16KrIcnSEU5xBV96R9q3NpTI3PXh8+S3g850z+Q5c/VYsNW4Z
	Moc3yx6PIw/ZgLvXbXpY2VojMD31uDdzeOAXoX1X75UrQeFNLLSPHdFLUDQ/QNScfD/fylhXkmk
	GVG5CHrxtvlWZXMuHo1lfFxwy3ZzCEl60ORkry8x4S7SV4xnpgU5J4vMM5/Hc3HExyEQmedJwfH
	xw6a8vr022D1shbdMWvBtJPKB2wd4hEGxRdnILzP53IRycdlkm1WlU7ZCJCsvGKsiAiNaVbAGu7
	BrBhhbcyS54nRDkNURaZKg+ADEVNcc9UDGyIdEkP4AU419FaCjyDD/VxP0qj2UdFbEo5vnvi8Rw
	==
X-Received: by 2002:a05:6000:29ce:b0:4a7:1fca:e52d with SMTP id ffacd0b85a97d-4abb0e46a88mr1474050f8f.9.1795134364578;
        Thu, 19 Nov 2026 16:26:04 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:04 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 11/24] net: dsa: rzn1-a5psw: Set driver data in probe
Date: Fri, 20 Nov 2026 00:25:21 +0000
Message-ID: <20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

a5psw_remove() and a5psw_shutdown() retrieve the driver private data
using platform_get_drvdata(), but a5psw_probe() never sets it.
Consequently, both callbacks return early without unregistering or
shutting down the DSA switch.

Set the driver data in probe to ensure the remove and shutdown
callbacks can access the private data and perform the required DSA
cleanup.

Fixes: 888cdb892b61 ("net: dsa: rzn1-a5psw: add Renesas RZ/N1 advanced 5 port switch driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index df3b3f75b489..0e4bbf34ec27 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1221,6 +1221,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (!a5psw)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, a5psw);
 	a5psw->dev = dev;
 	mutex_init(&a5psw->lk_lock);
 	spin_lock_init(&a5psw->reg_lock);
-- 
2.56.1

