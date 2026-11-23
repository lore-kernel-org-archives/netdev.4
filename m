Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439455;
	b=w1gn5/qAfaUNj69H4OotIT1gH6gGatjpQNYI3vDFLeJM0biwAbT7rlZc4NsIBC0K16cq
	 RyI64Z8P8VhMUqlBfaQE7NvNlCW7Qe+fKIwjODpNWEgTueqmJ5qYp6SObTr76m1hqd3MG
	 p0DPBnu+VqSiF3EvWWMAG5Uc7KuiZvDR/t1zEeFMNpu0prUQLT2U019sjoz7UoBc7iZCS
	 5WNYPSBZEC2b0CCUifCtWbRxRmnVpWmaxmk3oNyxqSvmQR1+cgO7I2G5zfl5M0zVaqreW
	 hsLzBJhHqii716sqHsw13vsvOLb5vifXGY1HnQX8yVqcq9ZyNgjWA1k3qtGFCCprMLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7dSUYZEgNCLN4peeDNcu8u/0Z/HyiOcYEuA7oi+4CJg=;
	b=Z5JsTP3xAbpgSjFG36DLXW/fnncTHTqkRjj/pkmwf41McFh6bRTGZiRxC8FM9XWk9V9A
	 M/DXlJsjVvY5cgIzQxRIEboYsPXXvWfLQvPFzil2ImFXiEpRWeyOq008+dqz2WG3RSEXG
	 rXbwDtImyCrTs/MOoHWKzcPSTLcDxhHYorz0pIng0fMeGARY9ydrvvKTD9WEEWNBRJ5Iw
	 BaDnv4oKLecFZlzpx6j10dRJ/2cSN/4irpVV0vhZXAMirjOE/6ibYLGHBzBFPl6A4J3AL
	 NPMXOJrWCdnx6wVvy+Ur0HnJWKnytUoR6qzmOoE9qD1ZiOp5s1DxVN8AtIgvJfT5zbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpg7mrlE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC7C606A68E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC7C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpg7mrlE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17699635e9.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439452; x=1796044252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dSUYZEgNCLN4peeDNcu8u/0Z/HyiOcYEuA7oi+4CJg=;
        b=qpg7mrlE4nx9XMuqFOY5eJZKNJ/e2FFVQF44i1PR0LIdAWJot+5EKNuzCEMHKDDoZM
         3x/PA+x9v70n7md58LQRfkW3JxPqmYL5RerRnSEe90ukVisxYXuN7b3im7TrMRxR+tKK
         y04w3vOyY2kHGHPMObdgCo6aZtAijmoZGoKAg0tIarIVw9kpRFaTMJtNgxxBI5unpcTz
         QlSxo0EqHTAeWXnLvLcVpGZm1N3npH3kU8LZUg2xS1uqB3xU6OuJROrZafzsizwq5xMg
         UfZNlQqPULlRWv866+OkKKAZNlDNWPXfwV8B7qLh7fOWj5FfHazQqoeX8sS+lihCriAb
         C87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439452; x=1796044252;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dSUYZEgNCLN4peeDNcu8u/0Z/HyiOcYEuA7oi+4CJg=;
        b=eZE4Wed60BQpqX7pipdaWehKCy2rpQD5tyJg1pt03jC5lf6oxEhiZvF0Pux9j5eMS0
         FF41hCLpnkCg3l35wUuJdeI3wffzQJ00obyBKetQQ0tvxzp+k+Nwb1Va87pxGiDmOL8C
         lHl1G5ZnDQiX7FjCtF9QSxUFSU5UnjCzIaAZRptNWZYjNKiPL2KaRc43Em9WxbFcWwra
         bwl/VLsS5IlxmzTOx/TcypbVQ5xqudLZSRwKorU91l8wbhbD6lpb0uMANJJ8UFyLHPxs
         lNMmk9ia7X79j2fBAj4iPVpbVXo2TLWh4l0ULU3XEYO153H+CP8wN46H0Tur2KzHgtEy
         Fajg==
X-Forwarded-Encrypted: i=1; AL+hErFCRGQjzdQzs3kBndfTtSBQWoPK7GGRbrxFBt3f0LB6cpjoHzOuofAXd4Fl9TpwVN0WIsdXSeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PBCPn9pHnofgjfc8yAcnzS2T0JXQLV+pwgRqlSK4YOUucq5By
	bGQrdaSMkWIOT7dtdLgKG+vXVcvz3cHkr2FgB7VfY92uGqesEMDFuMcB
X-Gm-Gg: AZFdTZd9C/582yBcVBN792DoGkSe6W3Sz+/pd5slh9dM8dygCnNpcDMQ7OZITj7JeRH
	d86EFZGf/bisgXc8EHxJp0X7cV81PeAYRBPzn2IqnAzXp//eAPoF/JsLgdQ/3pW16DZVmXVMK28
	R9p6/mSjInKuzMbwc3SikFB3cFiuXWQ/2EIeuIDoeaelAJs49MRwwEHtOD5grgsNCeKrHMuMECk
	BjjWwa1o2M79K3VyhiSsLROV3j2pcg0R95CC6B2PzNnMphAlCkH24qTDpgRe2OLK5t8v3bQ2kwM
	Lnq12U/aFdyzjifpM3tEamKTbO+K/6nGPfVC+5YEMAHzpbN62dIYvko2IHyPR9csOLZLlS/cpvA
	bkh/M6Cep4ODwmz3uIx4MBl/Go7dzabpWPWeRMPGuEWwFbYMfFlrr+6sYi3SIl0jxBe4uS1r+PB
	uQb8O47KwbFDgCuY/DQoA/FQ6nzTeDkR7b7lRNuEaedHtsLY1h32ruFJjOKYb0hApXxZOkqJWeJ
	/3U+1es7f+3WCKsd/AN2LgIEERoO6JjpdU2oKgC/cum3nP8mWZKNjf0i6NdhRSeDW6aZ2WLD2V4
	LAXnzbg18lqZtNzlK1mJncVag1fakl8kAqEnMlhdFBXfxFpcQ28TRxMOeRGIeDyo9cHrzaGx+RU
	DQZMAEmgPPNjE9uRPSB1+s0rAHV64BcSBhC4J8ZKd0mmRoCAmFFb0a/ey8jktm+m4wRXJo49Rc9
	o=
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr233753995e9.8.1795439452477;
        Mon, 23 Nov 2026 05:10:52 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:52 -0800 (PST)
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
Subject: [PATCH net v6 4/4] net: dsa: rzn1-a5psw: Set driver data in probe
Date: Mon, 23 Nov 2026 13:08:52 +0000
Message-ID: <20261123130852.3420491-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Clément Léger <clement.leger@linux.dev>
---
v6:
  - Added reviewed-by tag
v5: https://lore.kernel.org/all/20261120002549.1908299-12-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/dsa/rzn1_a5psw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7fc62956c5d0..4925d24ec2a3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1219,6 +1219,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (!a5psw)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, a5psw);
 	a5psw->dev = dev;
 	mutex_init(&a5psw->lk_lock);
 	spin_lock_init(&a5psw->reg_lock);
-- 
2.56.1

