Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807386;
	b=jfRYIBMs0ikJiDxBk2JFjabE7cEWpdXZsptfyloSXKMKIGcF2qrijqEqEwQvpQLkO1Gn
	 bOXNC18v3bcjJbRjfFnl20f71bGnH6NqJcaw/NBfFRYu9TRJ5W795DFQJz4KOEjDSLd+x
	 Jw4fcBFlq3ZRQr2y08iTB1X+ZvqFCaIxgWFoxx3kdX2cizWLSm2VYb1gu7oaXQy41WqHt
	 s04CWykLcf7X5HpTJpHSBgoIsz6VgUD2mC7DGYWhJgxVAdhHp5yJd9T5xdqLFdyNCb4rn
	 925ll1Cd9E4v7UiPk9iyzXdZ/MCgf4+cb1xnJ9M0HN+koihseTstTxd14QZqG3C7vGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AyAXB6xbDDqeZvT6Ombh9u6aR/WB7LaeUdof3GX3UIM=;
	b=0X+H+NrOMNdg3xwhVZdYA7I34V5jgrnDMUl+JlygaGifCKVH+7gtnqRWxLCj+SaYt01z
	 buE8YHuSXW+0HPkJS0NVgqb7jWvj9QR85s40T4/YTQ51VIQScg/SNtJfOekcBbtye+JRH
	 xB2UTl52y3Dufa6KmS08OpBauZYn++L9XiNvf3qJpv85cG1mCouKQ5RjwgPQw8sarxZnX
	 bjRZsptF8VTQdwDs01n9smQHDaJjCNf4tKLg7d01EhCLlYyDee+fcCkDe3i1l6I3DIxqD
	 wPeIXKfJRoIzQVQvtu7vPeToDkiBEzASDy2a+VYaJMqylq1uN4EAiL7i7YTqFVN186Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycTjRckT;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8182C606A32D
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8182C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycTjRckT
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so9545312c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807386; x=1796412186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyAXB6xbDDqeZvT6Ombh9u6aR/WB7LaeUdof3GX3UIM=;
        b=ycTjRckT7iCEnMau9oyTezmY1PRikb1X/mzCP4Zyk+yKSamZZqNv9ezZlVT/0r7dqZ
         VZCHOQL4GzfSvrNkF84KCxXySB2+l97yx2b9Q9w1rYxpqT5OKnzptQNgiU4n4uCQYyIf
         NsA1hTqpvG8jVX6UYzZrbtWtdJgprXvNTSSULv4iY7MLBtHdlCuZK8p1biiYxAQc6I4c
         EVD5sjgMyvpn82WX2y7JIe7suUBC3EGJmXIBER36FA03eTkfiPAecRukm8hqgH+jlnda
         5MPdWY4r6ON5o8fR9ANXSu9oX/hITluVNGs4HSHGnbccMNy+4a9Cy9EHZbThsQEJVNWA
         MZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807386; x=1796412186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyAXB6xbDDqeZvT6Ombh9u6aR/WB7LaeUdof3GX3UIM=;
        b=avWuwlQLZSXsndYb3WwOARsE+/Z/nbM3IOu5s29PfBGWGay3MNYT1P6zagawGl849A
         0I+G2oz6MrtYo5d7568zKStE7VIVIAT7TyhXZtovrYHRXwl11dTCZoCRaC2XuXcWMkej
         lq9Q1dSG3XOGZdo4gOvnPPoEafVp1WZTMX9sHvn2LKIUw6mgxt02FENi96zFntbO6reg
         2LWTYDXfyr/r6Ra9mc5FVCMx/OkBpmUzbTDy0Qa3b+uROrcJ+5nbI/P2w5LPXLCZdUiH
         tQoa/5E7qnL5qfm2RS/etbxycWo1sNqJ7UO3c5+gaDYZ2T72xQ3IQej/Ozxf1thDCV5E
         OVBw==
X-Gm-Message-State: APuU4Z+kLujwIM54TnMEAPcLGJHJNgJ3f6Oxo6/xZ+HqA06yOfxMvg0y
	0HP3ZA/aO0P+H3COz5C3fWswa5FYI/r7TNCEmbqLs8EFoIooQcDIRjCzfNKPeDl1Ej8=
X-Gm-Gg: AZFdTZedNl3zbjGm5bmsnBedS2ML1QSYEKTlCPedlKX0di5NecV1e6t7/sJ16CJP0fD
	GgEq7W/xwpzg0rO6wwowLEOHbigFZoM6ucWRQuNdCLTniyFkJjsEr38EKxI2aBSUoClfvC+kGA9
	AHhQISZnJXOPSXcMRtbYInSngMoDYfWLl7GRFk+K0X/zAS3IyvHOItmC/iQXFqCp4hk3DrhlEnj
	NBYYCJYoRalWVuwoSXq0VMH0EBDaX4c0Zf8gF28Eqkh9ORCCl/gNTV4x/to3LzBRSqfzPpGlxP4
	EklQYo/8dGtSojoFUVeyu6rujksBDdYpMIN8gA8ElMadREUab7phmJxB5mb5K0/zy+Zxgu5c0Lh
	WVYn5ZTs/VmB9Q3wo/A1CWq7Vnwn5c71aSdcmMZCvb/iqBta69CEO1NZphs0LLWvdvREdXO/vVN
	LC7C6Woi5tTYb3mGtIc5hOWhQoKW2CQVv1flkzp3UGePH0mXnpah0/CsS5FM2fV3dRN1IBKIxlW
	5YFEsbPcGKUJdH65HNxpKH5xIhOMKOUBhu0bf9LzhX4sqM5Z6edqffZcxlAJ5bVrwwZTLsKBOjQ
	Xe29DKfPzNBY/FpPoo8UffaW17+cpupuMWb5ncrTGLkxVoj1mNnkXmJNo3Do1Oys8x9BanTmmD1
	c1XZ03Dk08S5rPHAy2B78NhbdnstqwmHRUpP5VCoBwuZf0ij5WjMO7HqKdpLsFA==
X-Received: by 2002:a05:7022:38b:b0:1b5:2dce:1b6d with SMTP id a92af1059eb24-1b55689ab30mr30982366c88.17.1795807385697;
        Fri, 27 Nov 2026 11:23:05 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:05 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com
Subject: [PATCH net v7 1/7] net: dsa: sja1105: keep pin function on EXTTS disable
Date: Fri, 27 Nov 2026 11:22:56 -0800
Message-ID: <20261127-timecard-driver-v7-1-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
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

An EXTTS disable request programs the shared PTP_CLK pin as an input
even if the pin is driving periodic output. Select input mode only
when enabling EXTTS. Keep the existing disable and timer drain.

Developed with coding-assistant support during review and validation.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 350f958dcb2a..da35805152e0 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
 	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
 		return -EOPNOTSUPP;
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
-	if (rc)
-		return rc;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
+		if (rc)
+			return rc;
+	}
 
 	priv->ptp_data.extts_enabled = on;
 

base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
-- 
2.54.0 (Apple Git-157)

