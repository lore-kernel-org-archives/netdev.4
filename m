Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134363;
	b=2kr6PzvIcPjUK7w+n9H94T15/yZ4WVBs0Lsw02I4DFbsStUxQ+Oda1VEAogsim3Wpisc
	 4EEKBZiW5AomO9KrXP0/i2a8Id+IEkKmlupiHmWA7viPybvv1/sj2wz53FdOqUznL7MiC
	 2xLLCcgWUVh0b4APtaPsS5RwzQkeBQUTk8nDB2kntvx30HRxsexDOZ+KusfgfXG0hAcwe
	 qTVMPfHMzlrLbphpZarLPhQyUiWH0NtPU76IQ5uVql3zuS1fKc70wG5Yap3xrMPnuLPgM
	 8mDjBWfkm5/qyTBD2B50UKOYlTUQEUbFqj4E1xLHC2kMq597Gm9PH6t2tJ+iDmUNNBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
	b=1cxt4ZO0vV/22Ze+Cu4IcUV1u+d1ikbskqYNfjX+e/WApyDGrtljo3/TePBTqI4xE9I1
	 UROb1f2SnLleYM47RIKRZ2hgTWM7tkQUXfL0ZXdlKUZ9itYyJU5fHzSPOZH6Y2XYz1JPK
	 upS9AMU4hkdUnA/q76jVJkDfiMGba0fmdZ9iEbAzifZx/2Qwn8oZgb1BTIGCXUJcL8WZW
	 4Z5M1Wzl6Kp514bejNb/w8JZ6VFDlQkXla3on7y7c8+xwVwVH4hmL2hWYM2EykGwWGZ81
	 L4DkRpoOAQwqOymdmlqdrYSGSjtFpuDJHi1emUeoXxsnrGW4wPw84/8KYH3BbTqq3MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9MqcPLt;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2460A3814
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA2460A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9MqcPLt
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso125649f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134362; x=1795739162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
        b=v9MqcPLtxE53SbjN64oHKP9t3rCkg88Zes1tVNDU+ofhyrQCe7iAjOqyGgwoAVAPyB
         74RlAfCImWW4u3EDJgGcEgjAiFs4MrtoR0odM43Nci/Lq5HaIRvqBDlFNbttHaKnzku9
         bvgg/zluqtZ5RKvErgFdFnt6f7vI5DzRhSamnmWF9enY8PTOkPLVNn1Uk327j3Gv0Dvz
         Uc0gpHcmKZClPKqOMRZ8DNI5DhyyGBcDwGGNYxRYkffFwL1VudZ5IVkNevBJEBNTP71U
         u+AVVz3mizW1JfQOmIXe3NZ5ttsOXZB8x9NJVYpIUYbvDBz4BCj1YyYuoJHrAxE/ZTJ8
         5/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134362; x=1795739162;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
        b=T6/1zoeIvvOa6mao4NlahOVwRH8Tn22ofnRFZBlsZyzdDfcrHPmlVZQPysnJSBLMXZ
         STFXGRJ8RAxAPyo2/gyUseqzsG6nd/ESUSUb9St1WmL4QKJPncPOPZL21DSMT22CitQA
         ZAGQHZkBSBAJqgMujcX8bRxKVoDd0MCUfv6dL6B2pxjJ/xLsJ9o7BKTiBhxwGhXpOMVU
         HTDa8KSt2+vVXW4RB30JT4foaozOj4tdZBBKrqEaruBXoIMBFjQQpV9LlI7dXradqwO9
         MMmXjQBWoJ77QxiOBPPFO9zw2nJM6X41RLG9IDXtk1VInLmZKzM8IMMx3cMQWbxTuhfA
         BIFw==
X-Forwarded-Encrypted: i=1; AL+hErFlVH9XFZH9xj1aD/5PKKldyRQXILOAefjjh9S+Gq8zNgKcQCiTSbszeJ3x/kW3+4hpb4Q/eQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jxhgVZ5sfito/w/V7OgDHGVzRPWj1nt6YbKH25BAxUNhK3F72
	nex2rb4P48HedMoqiB9juqIyaylvwxfZEZN1AsmFg9ozK7f5LM2Ii16F
X-Gm-Gg: AZFdTZehG2UIyYN9QTU9x3PtO8OVY+qvn6yzdl208AUX+lfE/DVoWpoBlKkSVvBnlQg
	l2HgnOWxDj0rcXR+kxmjZDHeI/1Zn3qHZn0PMG03QKZhfHeANWKGrDJy+IDCGQbafAwmzOQYSCx
	eoamRs9QD4ShfD/DXPlrxBBUfpypmkDcPNyjZd4pdnL4UDKUjx2Du9VIq/kenlw0UoPfNqgO08X
	NSwNvnK5QupHbULPdTTljaw4M5H00lkRtnG1dJcVDtwU7dA2MAM+uwx+xGBq3JRFHckoDa9FNm9
	3goLzSH8bhoIj0CMGuRfI6Tx58ZpsOIC4kY9E/3Zry2hyFwcahR+XgxgJTmf4fPcdg6EzkfLiiT
	yo1n7dk8YZv9D0L9Oj7AyaLamlHE5R5jJZ5Li22v7yAwHViTnVUvDTWtW/794qkM4Hinl9lUF0s
	SDsWKPZ/CbBP0tWH3owJk3sOZx+aPeSRT6OQl9+VTyIM7/t6iyiqxnYyJ7qIau3gW6DYW18N+hb
	2uPUhsvK3Cfj3i84kSN42FSMCoWF4xo04iMUA8NlJBfuG7YsNzAXqBt8pcSZE1VdSlO6ysxfyAM
	PiX8t/Cgeznj9XnmpJvHx/aTQ+IWa2QBxsTeJ+byhoGKwjrb2xonBdQBYn4x6TSntPfW9peH+3m
	qcwfEJ8/2wRFQhgCR4m4wFCwFNwp53fNzxkqs3CNbcvZpOeVL7XEWW7oRhW86PbHelsQ54Bbf
X-Received: by 2002:a05:6000:4916:b0:4a5:e50:ea5e with SMTP id ffacd0b85a97d-4abaf64bdfbmr1921927f8f.9.1795134361869;
        Thu, 19 Nov 2026 16:26:01 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:01 -0800 (PST)
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
Subject: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding
Date: Fri, 20 Nov 2026 00:25:18 +0000
Message-ID: <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
and deleting one writes "set LEARNCOUNT to 2", instead of atomically
incrementing/decrementing the counter.

Use FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE so the mode lands in the
correct bit field.

Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 13c46cf2c420..7fd2652813ac 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -5,6 +5,7 @@
  * Clément Léger <clement.leger@bootlin.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
@@ -545,7 +546,8 @@ static int a5psw_port_fdb_add(struct dsa_switch *ds, int port,
 		goto lk_unlock;
 
 	if (inc_learncount) {
-		reg = A5PSW_LK_LEARNCOUNT_MODE_INC;
+		reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+				 A5PSW_LK_LEARNCOUNT_MODE_INC);
 		a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 	}
 
@@ -604,7 +606,8 @@ static int a5psw_port_fdb_del(struct dsa_switch *ds, int port,
 
 	/* Decrement LEARNCOUNT */
 	if (clear) {
-		reg = A5PSW_LK_LEARNCOUNT_MODE_DEC;
+		reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+				 A5PSW_LK_LEARNCOUNT_MODE_DEC);
 		a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 	}
 
@@ -963,7 +966,8 @@ static int a5psw_setup(struct dsa_switch *ds)
 	}
 
 	/* Reset learn count to 0 */
-	reg = A5PSW_LK_LEARNCOUNT_MODE_SET;
+	reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+			 A5PSW_LK_LEARNCOUNT_MODE_SET);
 	a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 
 	/* Clear VLAN resource table */
-- 
2.56.1

