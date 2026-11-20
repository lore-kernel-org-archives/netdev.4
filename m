Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134368;
	b=zyeYrdWLntHt3euZkI3fWLjETJ9SRbs8fiCrGylrDI0Dmx2IAsdWmNXFXIZQhycc+4qS
	 yYTgzGuycvJA8u0OmBu6cjH3z7bhtlFO3KgT7Nwne/Ac738fMfxKBvMXwpxSWL+Ucca05
	 h8OO3LK3xY7RJMIARLhX/74n3V45XlNZOOG5OD+mOYaJqixvCJDX1+eFDErc8hwLhtD4D
	 XR99zU4ADDUVAlBpG5msxjAQwsZcMl2bvC9/hJPMA3ptv14dIa/r9S5pxarQj5bBnqXeI
	 15+OGbt5KmXj+rgrlpP/Y9RLotzpZlMFNzDEm9vzwm1O6fNImiquO0D98Cji1QY7gbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
	b=kKJpyVfvHMXUDhvd05vmuxGh/vwkpmhR9hdSgSAq/J4dOj8SM/Ed4+BLfTcb3d9NUke8
	 NpWz7C6achQlknpt/1BbE3Xd8P3NcPp1y+JHQ67nWE2IY644txs7Hp0xFGBSBROe/s7Jb
	 71lbVCFmwyNhlN/sL0K2KUm8HVTymVhA8D8UYyYyqGsgxrT/DAVGzFj/1WAhoIxrXyMNT
	 Lt/bid3Eopo25aPiAff877JruGRw/YXqX4qLrXpCIXwzm7F3JCdiI8aMQrkwG2Qx0BS7c
	 XWZleomXjypBt7s+m0bdaynTGbVOQtYoFf95qa4wdZB9n8nHGyQP6CicccmoSS6feWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd40TbB0;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E57960A5BE7
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E57960A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd40TbB0
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so157359f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134367; x=1795739167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
        b=vd40TbB0uflLt4DjFBLgec/FN7GfDut6M9wIu3JPk00vzIUT7wcRxsTKWDKxdLGc0y
         HCINz0GLSWh9Qgr4NRDOm44RoGPqiKrcuSznKHLmOerYFu98tZg8xIrI+ZEXv7T70R7n
         jZWPJrK3tY8nC8ckV722EkkxFanqNijXd7b1G42npeNo45yVrt0YOG05hNLGs0wjSkIT
         KauT9/+Zn4KeWuSrg3ViG3dydVYhN7M6Z/pZvi78TT/IQY3zNcCHilJ0CguDiG/0PWnW
         vruV6ij7ueVP494XtV8jXdXdBH5ivVsLIi3qtGpm9Vu3vwpZIBSP/L+7TELCjiTeroDl
         8WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134367; x=1795739167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
        b=BgMVbvj9dfSWitvm3XM2EOWnxdUSGdNF1vstcx46x2zo2AIrvkBstAsVgnigBxsF7b
         NxJpQji8mbqDlm0eHY5uYl1Ht+3k/Z4yIufus7TWCiCK0B+as1sRNJJzC1BLEjp7LmT2
         bZVEDDI6F/nKn6KZE4pKvISEy7Tz4IENRxvIHxvKvk+o8oe5egdTK21ClPNCElwwbEuK
         znQIz82NZsDi+kD0Ni2Y2Kry/NZ6ieU36WpImLL5CZroU1fjBIOEZWbZtHOk/Ihns2dP
         SMp2hGj3e+UW6FFdDcgl2zszezTHlrJaDKQ20MsSEjQstTq2j0OZWeg/1gFhLZO9dPcJ
         0rRw==
X-Forwarded-Encrypted: i=1; AL+hErFxBm+r5PRdhfdpvUIJqtjzr+gnGgg1AnBpGljhut7RViNTxjKrvS/LQjrdqlvgRmgSkxWnzpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mVUbno1m1Uu2tkYeID0ba1AxeqWwXod9LqnWJwBn7zlxQsAjo
	oT8fnUPWG6XAmL39EayCn/UOgtkrXOH9ScHtOqXVnrCQGxEL3PSZK2ZX
X-Gm-Gg: AZFdTZf7O6opit5xG2VW8aJ+8TBy92V0AylvRXyH39R4xHRR20fYy9cSUZPRIEZ6SAa
	jF51Hq7xPsgQFr0WVeZfXfAWo7DqfzEy7bQR8NMBJsMN7sDSt/3D8TRZd2t+omHaaKPW92DunWH
	2s+aBofe4GsLwNBkrUv8DWtDTVJjmK24stiN5zDI89Qmt22krFwWTMm9INQAZrONDZvX4XDP6hI
	ZcQWmnjWPdHuigDYP2NW68eeeSXPZlGaym3c9VcIrsDHF8Px4dFrxplvQlX91M2vGwjmqN1EKIa
	6iIUgk8zEeJIQkChazyB1XDPLBQMDTicaFCeBN55pAlRFA65OkfdfN2yOBXB7ZrnIQ/cp8YcJhL
	zRLlx8F77yMVfvQqLIU97pvRdjIVIpCHLCCaF19qZzTcWhfk1FPoW4MfL3Es6HMP+fAAD3yU/IF
	cN8a9miT+MgfBAP+YCeJS5EdqM7DVpG5lECfb/SHrkatkY1apyweDvb8RYLPFprpWtZe8qv7L7p
	23QhWk1uArd97fv1CsT44FANH2YxEyVsf9B22FwFdWzmszZz2AACnQgVYmk+TH+TSqNs+gwHtpk
	gxpnkIMPngWUx4ztB6NnX7XWzyr3nC8FfZpu1dbawUWQCEuQ8UyBAITeAYdCYaPPcJJWmpoL1pS
	aAlsCXmCM/oi4fc2NdGOCAsF22/iaawtImRjpKvFmUfXE0amhrBuFdhfcoKx3s0SO7qSLgHwbau
	VMulDm5k5hfOhpF38zig==
X-Received: by 2002:a05:6000:4704:b0:4a9:760f:183a with SMTP id ffacd0b85a97d-4abb400aef0mr2164738f8f.32.1795134366927;
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 14/24] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Fri, 20 Nov 2026 00:25:24 +0000
Message-ID: <20261120002549.1908299-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace dev_err() with dev_err_probe() when reporting failures from
devm_clk_get_enabled(). Clock retrieval may legitimately return
-EPROBE_DEFER, and the current use of dev_err() incorrectly reports
such cases as hard errors.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 4b31a1d331e1..bccfadc1d5e6 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1240,15 +1240,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
-		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
+		dev_err_probe(dev, ret, "failed get hclk clock\n");
 		goto free_pcs;
 	}
 
 	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
-		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
+		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
 		goto free_pcs;
 	}
 
-- 
2.56.1

