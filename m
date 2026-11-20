Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134359;
	b=MlMA5jVZXd/pDbPFQkcTW7y0YFGMQnHzZNJ0pkZ2ShPiVZrAKxGVJy3ng30moPR4eXqU
	 HSXa9JeAt2QhJRs4/hLDKc9MZJdGGBdR+tf4Am3DvjWAsx7AwkPTd/KkauF2q6lSaFOeY
	 LqMJyLrmd28Eg9AjLrbGA5ADFHsfPchyRXTjVsxow+zDjLX+kqWALQhsZx/5suJJgyYxQ
	 2csaMwKgkRLcABJiS9wQlhjhFL/UUAtFNiaqRso2hLA1LRc2WJC9tixBtRhudcL6a9y5W
	 JoscHbr8Eae8kdgkNopAIx+yNKbmSYNBffU+/B1C3Bs8DKauavSC4HX8nr8gFpLBifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
	b=moNkcCx+MKUskP6Ixo3QHCLTneSkI2IDdLnEWWGzB3bQjoT41TFQL2U8YQ3G5sSMtlIe
	 3E9Eh3gmiAV3bP9D30Pv3S9nSzwU+Frr+MtwGwNrMjIWkcTn0MumMQVCy8o57ZPj3CQJF
	 SVtVNzvF9cp69Ig1RXl6WTkm0uX5eCmOo+jDViItw7aH6hY9n4d9XVx6Le5vgCeG6rwHz
	 k3L/YcVz6k8cPJAmfMteU2UvJrYm7BuT2f4Fu5ALrI+9DtvkmfV/ynsxXieC1DpvDoZak
	 GAQr8oDcIl3g2oZGjfgnmONQ46NxM6tck6Q813HABmEpet1/900zViTtpXiFMD7A7vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+68JXiw;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFE60A261E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DFE60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+68JXiw
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-497614c95f0so210867f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134357; x=1795739157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
        b=Y+68JXiwd/j08nP+pIDYDnrw+BUax68CSMjbEUagvJEJ1zGW2O7NTGBVo22nVZVbcd
         kjPzUA+KXrlyPpF0QX0Kd4xaVh/It/jnKEcSbZ5yP7HFEwEPf1io5L7Piply6x5s4TEn
         0AEFaNip/3lk3KPAkrxqE4U5kju9s3r/QvZ/ViR8/KM6Zx5IapY9LGd4bjCC5AMEgVpB
         TaJyZNVj1RrHswqWcyaPCyYCqDOz8UxjHM3rMAC85EHFmtKsaN2pOS2BLUmXPMK/7Km7
         1bLbV8WaxLIl1E0p5vaLuqA7GItq1UWIYfiZQcsbRSgP3fIdi3yPNl1paaDacZqJjGgk
         0LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134357; x=1795739157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaopBpwoWF+RnZA2cd1duCoPdrlWpidx5tjByE/+bhY=;
        b=s1HZPZTfiW6HtVPcyGYC0Q/Vc+Jq6j4+3EPYLtx8PWhQBQcYN1as3EvCdcUjAr2dj2
         bMyKgIOP9ux+w8Y5qXk+R889k06WNMZLxpuCT9rOVtIpgtg4ZVwaAXc5gw2F1dK7AuRm
         8/fX9ndk5zM9ajzbKTQEAzOabYTy5rrjIs02JyC5WwVfsVMvN2rcIFOOppenRvQEKxj0
         +XhmWbyALMndvj3fpP91fPJSPbbgWdm5UVoDBoPv5Jhsz5yS+wK7zdQhGJOn8u2KYXt/
         9fbUxhE3D9gXXS7azNprAlKI93ZMVSPCxk8PzMW0c70sm5C6hinEhoYEVej+4wpfVdcl
         8qsw==
X-Forwarded-Encrypted: i=1; AL+hErFulWw9RlEIz5QLa/swSLS/dI8d7ETyHIHm1UfyXEWzBFRcHorO/jkCV/nWtUuforPeqLk/jFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OP8dLOM62RAPxyts86/XkcGWGpMplhrSN1qd8MzqA4xICqegl
	gCN83/IE8+bn3T6eNe/xZ+RFriE8vaJyJMKX4vRQrCXWhXP/xOI2ewKi
X-Gm-Gg: AZFdTZedMf4GkZUvU4PX/YoN2mBhYqswnstyyo+tK6uHBjEdKB1ukPGchE9eQswhulu
	lmGDxxL9ENKZf7OM5p1tDQoiOvVm/OjJgAGCRIF+8g0GCZ9xmOnr2Lh9cIbaYlIyrIv0RD2x9X5
	cx8uaH8tSSHlK8BROV5oKKia5lLzpNovTPxKKGy1Dy2HT4NFFI9rvKk5r2kK/sQ4kkcdo5acsl8
	LOOmBHuEjAs0SWxhtDIDGrQv/JnY+C3ZJd5DGgSV5mebAB+7yXOXGYlHjwg3hmFx/g5hzYtReMZ
	eM0B93X79FeI0J5yzMay3D2qAY82rFgfcbQO3B9PCOb5WDxphEVlFFdSyE75CcMYshGsIc28rnU
	/O1Hs2bTnPAvCVCsCfFolI4xrxA8z5ux4qzXp+yTNt5o7bAGtZJwMPNpqC7b60iNONPr2Ip0RYn
	KWZ21x4fyBz1vUBdZj4LW2OoS/BLx3Jt/2DaAmx3kYIg6E8muv/GmqeeTRdORU78YEcGwWC/dQj
	ZpSLHV35gdZISlBFEKVVyuK9cCAeACx3NrG2/whKOdZBWh1ovw0/AS4Ily8ls8BxDBWLsmt85yI
	nzyzRPrCKZTWkEey+mm1oLORukS62zbqKVr4xRcU7Y0MhU3Y7cxFRhMEiBCYnnqlk/yGErgxDbm
	C3tQWDaKwUCj6yZ+SJweAicxHHjDUPiALn3WJUGjlfTcwhei7usc3LlC+VeSCe04vpnqTAeIr
X-Received: by 2002:a05:6000:4705:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4abb225e5f9mr2180361f8f.24.1795134357345;
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
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
Subject: [PATCH net-next v5 03/24] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Fri, 20 Nov 2026 00:25:13 +0000
Message-ID: <20261120002549.1908299-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHSW
---
 net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index bdeb60af764b..3c18314aee95 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -199,11 +199,12 @@ config NET_DSA_TAG_RTL8_4
 	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
 
 config NET_DSA_TAG_RZN1_A5PSW
-	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
+	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"
 	help
-	  Say Y or M if you want to enable support for tagging frames for
-	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
-	  destination MAC address.
+	  Say Y or M if you want to enable frame tagging support for embedded
+	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
+	  SoCs. These switches use an 8-byte tag located after the destination
+	  MAC address.
 
 config NET_DSA_TAG_LAN9303
 	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"
-- 
2.56.1

