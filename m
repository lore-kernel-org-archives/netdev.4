Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439452;
	b=tuGMzLnrfHL4mhrjPPhHpyupBpD4e8JGlgl4tBy14xBdcBSV9mSXFtRp8pzdCGrnVaU/
	 aPKhVT9pF5OZEh7+pMgk0qU2UPlgz2H084OropkQU6BlphUJel/MoOmdj28dmRZ1+6Fc8
	 9JTRBHUT8Im0jyeAO8DtWVFMhlMZQtL1C8+at4L/r/l73kDAslyfR4Z3wEgwNb46LZ+3K
	 qB64ruCRgkzs11dWLgARWtMVc9psuIEwN0y8YcoV8EEKILGV1lIWVVeWz9avgnk2siFum
	 fCgEy2sU4kxgSm5E2h1ldZL72irCR0b1ga7+DKURSJCkSJKRZyPlVCZU4qpiCnSXWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jUp72NYV7Q0ADhk/tYOKR65YjvvA0NSY2G1zPBbXRx8=;
	b=wPf4SW/O3hHJwIITUN8pxo/4xAv6KWfMV6Z72J7UaU+Fyt465+si1aRTFnLYs5LgaIAr
	 qIBDZBygyXAFeXvHzGHCT4ULaK6HqaBhf5q9AFzk+Usv3YLjX/2irJ/MMW3WEYa2wDLcO
	 MRHbQeAcJckPtXSZDklfM4ab2uwl97Fwihjfvtkh+HL123ieLl/ojss10KUuXx8W8+Jlg
	 ZL8NHl6t97NNTTsqtGkgVwAMWbxC/9ul99KlE4VZ960jOARdYKZqwMzT5kQhPMCY0uZ3y
	 uslEZ/SB4VSNBtju8QxNjY5J8OsOGsFRUXWyzSulHKVyL3xV+ZHrymqQjXE7985cgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tneHtAfD;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08437606A68E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08437606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tneHtAfD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so23340825e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439450; x=1796044250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUp72NYV7Q0ADhk/tYOKR65YjvvA0NSY2G1zPBbXRx8=;
        b=tneHtAfDCBDR5o/j/eojOO0BbMdCpa/FhNiwqbUfae0KUYFL47VIs+tTHGqh3TGSav
         ci5XtM7JoabAeTa/h5zOXa6gT6ych1EcMkcA5BvbwkWEM9fyFfLCNqCvtr5ruGi0vHLh
         +90XBrHxJkVzON3xk/laL29zItoOqgwzxi3gs3+MidhymHXFYHjJS2KrfnwRRrpWIAnz
         8zsQSRZk5TazapCv5n6exeh66fTXL3p1ALkI9wib2eUhEGspV5tRmjkugW8FwVtU/jrc
         aygNj/fn6UChnQ+q8nth2PVyStoKzja+qBSfUhyDJtSAEsWD9cxMQ2DcSYvMa0VwLE/Z
         qSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439450; x=1796044250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUp72NYV7Q0ADhk/tYOKR65YjvvA0NSY2G1zPBbXRx8=;
        b=0zq++z1sV9MwkJTvPoUXskH4zip8yNCtiHlSo6PZBto9kNpEBW19XqiSEcjRNvX941
         5USgMugNVQt9Qok01COm8pWyjaIaPYqDa+J/VwYGLzif1XGsQJNjJONEY/360wv7+6Wx
         YdJY+EaZEK5W224n6a4JH/HKJodDAd6KZIr4grlPkeSDSXFubZfICXZ0u4Phe+8ug2AZ
         ZFVlV1sLtzAJAkglyDPY8wN+/xA40WePZIMhSDFVnx/bhk12QvZ2I9Se4beOf7k5Eo5O
         Cm0Gp7j7N0J1rqpyaYmZz+dlzrELUXZ70bnRljS2gY4QEsO6Eaz2WxQTGfLMdUQ9Zvdb
         6Saw==
X-Forwarded-Encrypted: i=1; AL+hErEjL9LCRomBkN93GO+uBXZPh7cNiypXdjuNjo7dnSSpR6vpaMumabYxmDBG63QufD+JhUylyZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ShjUz14e2ym5Za7O28cDm/q0aqpp+prOTSHT5bXWyTNZ8JKK4
	CeYjnQNLLrIiiahV6K1RKfg8gA3Fp1mcc9S4RwpKoFxoweSP5DdN4CKP
X-Gm-Gg: AZFdTZdYkEfxOQSUVFihXmkI5nnnE1KgxB8IkfCGi+gh3DCxCQJkOyj2n9BpYvIkfYG
	aMPYp7YSDaEC0mUjgVCJgRtkobjcGfDp11eI5JuRivRYsSq/y6/1/D0xbLck2p14oM+hH7zbQ7V
	doJGcHxsmjeHEHalDYhXTjQybuAdGhfEgLPEGsIkHj0xAK40Q6YPN3AL01UThIrVKPTr+WuWlGX
	9ihKZSoN9QNP8PX5Pc0LLVB4HwMW/xKrFvpwT0OS5YIFts2kMXJMvq7XXIayDk+qvy6eALrmrOk
	Gy17jDIw0qkI3NQ3mWYRETv9XXF/a4dU4V9nGOgy1AGEIuEmFWQW3c7DlNaEUrZGnkqAFB27ce1
	7UAw/FAWEEn9bKVhy2P2aj8YTI8ZQlUc8VpYnaaNvtAidPsbcNN42rUjJD8hnkSm3xIZV/vZtu0
	o0RZYbw1tPJQ/if4L1Y0VCZo9Svn1cjL5n+2cPGZq9jdhvmDePjt5T0XaIU8WF0Sv/rRSJa6n5o
	CsKYFG3z2B5TqyZGT0/pVITqdL3emZPS9hUAhGqHFKKwnlP0fjidwtJCpdrGxcP/CzXg1hmd1mz
	vyad3/vvjopPYX946QPeuI44GEwWMiqk0MUc2jA1zkK8a5Yl63FN0NXjxf8u82VfSJYGOAcdSoa
	KQ2bPJyAA9c8vGZk00qIgoJ941TBrb55jBTbroAd0k9ou2TyNUjXp7kWG+MNAuAg+V/k1upOvkw
	==
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr224591505e9.1.1795439450439;
        Mon, 23 Nov 2026 05:10:50 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net v6 2/4] net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
Date: Mon, 23 Nov 2026 13:08:50 +0000
Message-ID: <20261123130852.3420491-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N1 hardware manual places the VLANTransmittedOK counter at
offset 0x8f4, not 0x8ec. Correct the register offset so the driver
reads the counter from the right location.

Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6:
  - No changes from v5
v5: https://lore.kernel.org/all/20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/dsa/rzn1_a5psw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..9693f8503b0b 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -185,7 +185,7 @@
 #define A5PSW_etherStatsFragments		0x8E0
 
 #define A5PSW_VLANReceived			0x8E8
-#define A5PSW_VLANTransmitted			0x8EC
+#define A5PSW_VLANTransmitted			0x8F4
 
 #define A5PSW_aDeferred				0x910
 #define A5PSW_aMultipleCollisions		0x914
-- 
2.56.1

