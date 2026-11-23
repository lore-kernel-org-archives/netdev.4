Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439450;
	b=wLhfvN+5LrSOG3PWWH8/K4CQHaWFGWYhno/dMo1XCwMcdVJtO4NhyPWgndiLnbh/469E
	 0/RP/AneOqafwH51+lCLmSmfuDXL1OzzRGNLPXgXeyjM2bB/lUWiDnp0ZLby1ulUrrQWZ
	 XxbqcVsLIuldRD52/HQXgrDLBAymbG76GQWiPZlJdhclqESaDNRiAHORlxg9pdKiNEvkC
	 yDmnIq2X7oy+NIxv9DGofHX6GccrDHuDzjvWPO0AiCJ+RSgtIywbUPV8XhbvMHmPIi6qV
	 OCkBej+7v+nJK8frqd9mx5HvokpMZq5vE472ARY/w6x6ubTSw8oe5W1Mq2cIs9ZomBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=epWsmChu5kxsqQzRaceb7lkrWDeqBaYo/ag/t1gvP4s=;
	b=HTjUQqnbt7RB3P/K9ekPGqfhi4w9kraeRfGUfMA1S2GWISXU8hFBagkl9ZFODg9Eai57
	 BA6rcdfPAzTSdL/PSk+XPuPrC4MgzsNvdPMdTgQPoaplIgfwzi1ROzWqm/52eItvBU0fB
	 LKpS9MGio9nEIrAn5TQiTyenmfqwlUyt/mjTr/NE5k8nP3+EO5SMvbauB9CyzhbDq8jm/
	 x4TLtICqGrvkp1nknztjendyyFZHt/qpH2esLHTqmBlIqgnVPCkglEyjUdv1K5kkS0vnJ
	 mdimTboI1ljaPWbIDVFkTAR2C9npBRd/90A116RxBE81O2GJlb50pp5tLtQpAp0K0aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcLgKs28;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC3606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFC3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcLgKs28
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so29986925e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439448; x=1796044248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epWsmChu5kxsqQzRaceb7lkrWDeqBaYo/ag/t1gvP4s=;
        b=YcLgKs28W5afIxirPBaPCeVHDxFRyu3qkerDQi9cA7HHnYD0QliVSlGxH6ErFMP41e
         v02LdtldfFAKcLjOYUBX8EFVnEFsuMffEQHetOWQDJINYjsAy+bXPSytWpxFHwz0pB7w
         8zWUr04mVIFGoHfO981eBjbpzsWa38dCougTeceWeMa0ZNOGc438G1NZdBP+QeSpoS6D
         Y2Hsjhe9bRBZIGPAV6G7PBIa4MarnOc5XHr3xec0GUNWwf0dqi41cDg7SIgBoPZ95Dsx
         FfsNSQ19q792OxHap2XomAG3ri4xG0zY8YzhtYthUGpTJunLT1fJNkXBewF8mj8fsmDq
         E1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439448; x=1796044248;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epWsmChu5kxsqQzRaceb7lkrWDeqBaYo/ag/t1gvP4s=;
        b=sX/auqc7Zft7v/ybaT3kFd5PKyZ0IBafcHkzFv1WAY31/7OV7AJaS5ePzIOAuCXXBW
         bDOPMGk3rMmSYwQogbAwAa6h+SeBIe6bzx5m2O3/gNcxbcYuanK+jma1sIA9zwh4Zkvo
         Jb5OfNpcUMcTbs1fkWJ2vNIEa5Ee+YBwZEx4AEAAApjpSf/vmH/qwdZaScarNj1V7rS6
         uqcL/z22ZQQLY2Evj2NPy1ivwDN9TFv2UwIQW8ozEAP69MDSSH0nYWojwf3dZ33L1DMa
         X5MwWq7u77nHtGFYsU6uK9EiHgWPlW+kiVGLH4ejFUm+XscPKGcSak3kwbRDulC4+29h
         e78Q==
X-Forwarded-Encrypted: i=1; AL+hErFl4iqbMIfU+6y65nO+wKVQdByFpmdfpO9sxQBUGp0EIoqZG6rFgS7vLB9V21Vj5jMHU+A71/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SS0hl/qlPl30ctnfVRy295n8eXTdWnYfGLLpjexUG4pfDMOze
	HTSRMnFHdjDc9bFrPNb6So5WR+A5i0NR7oYvwgbunpiSMJsXlow18HvM
X-Gm-Gg: AZFdTZdUNo3jGo4goJM6KNjiYeMHVTiZuyaZAZmMZTOk4I0M5svGBYFxcZMTpIc19Nf
	VPFcgLzrs9lWm5VWgnfrcDIk8+0GAG5OUzAhoOe28snqrgItNxXOR2glSDKeo35vQZCmZdgzR53
	Xwd/JbLCk0mkepj10wZoVP2d4IQfit6ymVK6mHznc01BmQZZlSozAFtKZiKDa0Wk8rcj90ezooJ
	DtUBb27OYsZcdXBPDfCF8ez8fSPD7I898Qhi0NxVeskmfCl4mVDNlzeMo+xmFvXIGXuBB+YgJct
	V6oCljIfB+NOgc/pMkkzawyJfv3ziso8SJyIqMXvsdakT84Xoqn0Rq/PBnL1ahHzTgvy6XbE9H7
	aRS8L/4wIFUa501LKNstLfrZ+C/4gWS2rMonbOCw15qO0uoNmGfBr9GNP4z5ibqeALac426cNaH
	2EJ1IkQraTamwf1L5K/oWfv8ug+f8F5qA7cpg1cYJ98JptbNFp9s+siuRloxGzqMr43Sa0JuDJQ
	+q4IB2zkB0JeUl6r0ESCcCa/UPlIQjS4H8oNYV7FGYPKQqkqZIS2CXelsAiSzcWeoYKq60u/CHK
	Bi55miF/QY8ZmYOofB8QkdLpbYUj5j3WTv8LzxFs+pmP9SIK+Fln0z6gGgnMcVA00AM6VuyjYQH
	+DlpxTjSs5Nfv9jdRjUIelaWlu2fD+7fPPoz7YcfI4kFOZFV8oR0/xibwe6YyDZuKg0THusGz04
	M=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr219043165e9.11.1795439448419;
        Mon, 23 Nov 2026 05:10:48 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:f273:2c28:9387:7d5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm400714065e9.7.2026.11.23.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:10:48 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net v6 0/4] net: dsa: Fix various issues in rzn1-a5psw driver
Date: Mon, 23 Nov 2026 13:08:48 +0000
Message-ID: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

Hi all,

This series fixes several issues in the RZ/N1 Advanced 5-port Switch
driver, including the LK_LEARNCOUNT write mode encoding, VLANTransmitted
counter offset, MDIO clock divider calculation, and ensures the driver
data is set in the probe function.

Note these fixes were part of series [0] as suggested by the reviewers
sending this series to net instead of net-next and has been marked as v6.

[0] https://lore.kernel.org/all/20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v5->v6:
  - Added a5psw_set_learncount() helper function
  - Update commit message in patch #1
  - Added reviewed-by tag for patch #1, #3, and #4

Cheers,
Prabhakar

Lad Prabhakar (4):
  net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding
  net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
  net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
  net: dsa: rzn1-a5psw: Set driver data in probe

 drivers/net/dsa/rzn1_a5psw.c | 26 +++++++++++++++-----------
 drivers/net/dsa/rzn1_a5psw.h |  2 +-
 2 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.56.1

