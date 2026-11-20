Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134358;
	b=jJfZSXqyh073ReALnoRk40zUY8VI/VMcug9Lbk6u7TNvnItsG1K6waZDNbg/aZwxvyun
	 dX3jj5CPbojqYtzKfDN36TbHlVkM6H76S16z51GWpz/3GuceK+fJ0o7biPgEmpUxHJy28
	 7YoeWfMTD8EYEwR5f+Cv1/EiN1ArSI5wjLjorIeuf5dm1Xq1tiThg6TMpmAkUcJgprvuW
	 /mahMSv0Ao2WYvW1Wc0MEIo9teS12j+JMxojRpOj4sq5gFxDBkkgUezOh6oG4IecGfr5l
	 fdwM4Wz1F6kDjVxBowRn4xs7euJENe7DDF0N9jEZWpdtUlAzHIb26fsRxOFMm5i9wug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
	b=3gzy2rhQSnaEpbkvmLHjRoFmXvarIo5fgM012MZsSuuO8tsKeqwhVZrXcGXDFgd+0b3C
	 dAPeo+dRDi46D3t8xHo+LDqg5vdhWcp4WtSU7B7+NGrUBkmyV5MJOy73rQpaprLOLVGUe
	 HxQDBamgSyJvDVwLipdZxqk4iOLo2ViXi+s1RA2xb0ZLAhnc/9pb7Hj5D48vcZSrqZles
	 yGnxp+jCNns3gZJczQVx/4W1V7PoDWgI1LrXp5UA8LAKxWoOga2TclXfHjUWLAEf/oZMT
	 KNGjwjM7/NXMGV2RknASj0rK8A8o0sK8C6jS4EAqnWK6D0oGKzZsbQOmnZpJtkr5Bzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuwbdave;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A9606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5A9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuwbdave
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so2171525e9.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134356; x=1795739156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
        b=IuwbdaveVu0dQdWfvEKuykC3MeQS2t2S+vvZyH94+kcwIftMXRbZ+6Pgek6qeV4riw
         rXbJE1Qm+Tq6Mw3Ey1ExXSX2tTPQkh7s25kULq4Iw1c+DPaXDMlleephapy1Ls7ouQM0
         kmP7UuFVttFu9ELPBdGGgGEOMMkZtaVWXQnyv19fsTSCLYKELQSvsyXskFn/F2gFTHEg
         uT5iIlFnB3yd3IoGMf9lkLdja1EHYMy+GFnZuGN5+qog8YNLsYl3o0aIaWHNpdtvwFl0
         SEfGLr9V/BCFvlMXDlryoCC4Cm5QA67us2yaUBWFZF6AE4jdwseJxJXS7zANpaGPrPe3
         DC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134356; x=1795739156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
        b=oR+i6CTyxx6rr2HEPNxT3acUAwC/e4Xw2RJ+QdZkU/cG+EV+4jOtqTT6Nox6we5drG
         0TNaAyjnjKYDsdp3qPvjfaa0W+m2JXNugeZ9nWyDW5OrIjTShnArW0k+LFGL1kE0tEef
         u2TWwqLblvDTvKPwIxbwSVQD77VyEpTyfsvy+nyhvYs20ujL36PAyr+3IDlJfPFXj0uh
         49pokVfgTINUtS4ZOy7oyPlx7RXxR+zu1qKOCbvCyI7skmyseA9I8aHPpFi4rePIBx/D
         KucluP35HRO3Xbm0t1spnDD7YG474p2DqJYgXvXk9mWkYPO1DkVE5C8e4QFOMoAGUeso
         D6ng==
X-Forwarded-Encrypted: i=1; AL+hErHfgfpqS6CXpZWrnxzgr0pB1zjjT38+pixzzr0qjs2+FfRbcoucDJ/g2mFaZYaVTVytuRBbkVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r1vpImaSjLwfGVL+Vj09wgknbPNq9ySL31yM5W4qs8Ez+cHGA
	vSNhylwDd0e9Yc9nT7y2TqRbF0rWy53wpFt7T8IuoS7gGG4fg8Hg0sgu
X-Gm-Gg: AYBFou2XVpa2uxR3/lNpzZxiEjEaykFqT2cbisXvb9Kv19qpTBTVdykab+7mrH5rxCp
	lEFFoIglVrvMo7IZ++YnPvJq6ZXti//O5D1HvG5WaAd7I4PD4H0ymYWMlA3BKYgx3gIU1+LWzNR
	CSCtyVPaPkLuVgPHclgDkoWzpFD4Lw4fhp8D5NJe+EsvV0B9EnM1ie8N31MN0vyYnpOyRbeMWx3
	FXfXs5q7uErfcvqMhcqZ+OGFwF3YWfXY0PFIY7rWoeqIPXkfOdlXVrymkiIa7usT1L9srrF5g/B
	7FBoEKYwWE35v6gCi7pxy2sVhGccN8bHctBw9M5rl14GaotLGfRp3PwZ7fqkbHJrmcDIm6BbYao
	nTYYhcM1ZcZO0nKxl1DEowRaHEpCZex6qLv0VHcJUfoHWWhxKgjJLRB7tLSCiTDLXcYhJreS6qO
	0qif0MhhzFNRx35C+WS9hDI60HMmtwRqgBjSY8/TRDxNDDX9S8o2Wf0NHjW8HLf2zu2eTnqlmoB
	KNsi+4/eM70VVrmvFqqn4tSaSRaJVQ59zjvpVP7sqgkdif2ehKg3el8l5A9dO0yTMjGJoKEfXqk
	JomDGQqkvTDFHZ4OOXlcWKOeRd6wQo/NBA5J3XpFqYDGk7Pmqp/BkPdsJBGijXQx/E5KcGIF5nt
	joMSPxXxspdwJbtCjVo0IZBXPBttYs86hLrUUigC2GtAvnqdQqvgOCKC7jFmXftXtdE1UWTJR
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr25136615e9.25.1795134355703;
        Thu, 19 Nov 2026 16:25:55 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:55 -0800 (PST)
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
Subject: [PATCH net-next v5 01/24] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Fri, 20 Nov 2026 00:25:11 +0000
Message-ID: <20261120002549.1908299-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.56.1

