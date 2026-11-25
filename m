Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574229;
	b=wYWO3NBo424EG6YIvji+mOUMyH+9oYtUdrOdILBqpGiSn1dBEtmxOn1C5+MWNEuhBT2e
	 RAWvfk2W23FTEzXNG+831VOzgUTqobftBdM8nJL09f8p5c725cMCTtNJ6+K5ytQ+iEq79
	 Fn+YMyzhIylETjzODYgycDns64izWuBdYz62xqNP4SS4qg938X6slvpO2bkB+QkQmw0X/
	 F3IW++DTk975qkiQ6UuPMVUB/Rzkhki0RKzgCYDhSdzNSqPd4bi6yEOY9XZ9UDuxQb+DP
	 YtmhzaMKauRUy8x4AtPKeGx89pj+7GAJesBsCi04/UVDeorYSVTarF07sPtlysU3Iww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
	b=t7JUC7NOh7x+q2Q61QFVZQOrctnmnvC+KVupCWPdsvYEt39aVmmcQEx2/C2ApeChCZeT
	 UfIKJ2B1VSfCd1Wk4g+1406NV3DDCQPInnb9aCTfZRY2FaKnE+4OjKBfBMNEYDuO8R+vl
	 kuHiAT1ZuPdg3MCWTmIYzPDmCpuEqH/NUTYgGMLwkATQwNFLNDHfX3pJ+wWSRihrAPuNK
	 Rguv1YM3nevFSFnrh2TLI5HM0Wct5S3sBV4l2Kf//ygO5iPEa2OybADDiUFDpoeEdl+td
	 cEVIT++/hskqGCv5gmmnV6POaDinkLWBfYWnwBiztXyNzRdFtQGNF+Ctw8aKgyBjq+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydkvx2eV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98210606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98210606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydkvx2eV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4238759a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574229; x=1796179029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
        b=ydkvx2eVZ1SYN0AGPGkusWDplW/SfOGDcd5OfQBObHQnLrHbSw0fzQlSIXCrCIZXTm
         K2KlE2LIYer9CHk8vMx8QuIa6NwO9Lfu2l3ESmJs8vD7QOBSaRUw5K0u+RKDQm9OI6Yc
         4D6Zw6iinMmyCodrKXDmi/FxW98GYNSkedMPL5oukF3R3g0DWqgs/StnCBNCpIs0TqUO
         9k9mn4ZzVs5hpCZ512ehLMGBhLvhgc4rfGwANX73o8ytoXYgCyv5TZSdrFEtGD4tdNal
         iTHHq3YUbLhBxWIuHpFaAOTdEsShsMz/UoO7BqBi5RPGSLnl+yGm8A7jrRr0wQ2MuPKt
         YUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574229; x=1796179029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FjnUi2pwPR5DHsF2bq9Hbvyd0STLH+1ds5EmTt9Js=;
        b=x+vRaee+ZVvryw6pfaXNFClRtk0zygiQ+yIfDa1FHttcNeveuEgFEtEQy0heh89A/W
         6zdm5qDuO6aETzoSWSgABItA4Y1bgeeTYtmH75fHqMA+Iw+yXfnkiqxQg69HLAs0j7rX
         w6KaW759PB20j5hpV4TY+9qErrNT5ZOohdG792gIPcBxOc7y0vfd0yupCFbUveDyrmBy
         iQUDu/2l6ovmKlg2jhfWaruMQeZLelj7HA3ZWfbFKTz6IwX/1CiAyd6VE6h2/h/VfQ6l
         zoDzmS4MXAoi6F023xV02s28dUaZSZKLF5deI55aeRYUPnne6/2jb+9rrWQmSyhgnYTR
         BIAQ==
X-Forwarded-Encrypted: i=1; AL+hErGW5zHNiWZ9UBK7D37udA8Vg7nKNsJtR9A3VoiuOTTaU5Zx01vCX3O/NRU7vGxH7dhuiCkLswM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cjDVF1LxQ35FO8xuOyKbA4RIAOiCJsW8TfTB2u2+X1fmy5Kqw
	a0UKeGg8DgA7mgNqginQURvK+VAvKV5E2QbmdRTBpGXXJm7HH41MNChJ
X-Gm-Gg: AZFdTZd42btm3BagpJBfzbxfXshUOi/aMdHn5f6jpdr3VfUE9PrMTO5F3S5NJLObJjU
	2D2nhzdigUlwqUZvA0KcysDdvFInhVaHPfyu5T35muoTf7i1FUSPCRQEAT+ZASqDTi/CLfpcdt+
	nE0J1ivdZJcIBVFxYVt38fQ27V4mlqGzePF6/93C1QKYX/R+uIt5hoStuT7qKSH6lHyAmJEtWgV
	rzbFhW4zFgvHMPNa2fo4TiBYJnTsZesY/ODUka72st37xpssa1b/49LZsuarltgiHzRk7lRKHwI
	xdq/h7q/bIf5jQQZH2K6NMMpWDtXwK4s/VtB3KOLYMNw45Eav23CEWGJXiV5SkQ5O5iQZuu5bNL
	+qvGpA+PbIp1KJUNyu7Oe/SExtK9p3XBgIrYV13psEe4udNBEPMVWmSqrIWzaT26Nl4R69f4Xdu
	kU2/nT7tPajHZ064r555bhFuC7t5umFwgG3BgHrz7Po7Ns+rm6E+dhcvjvybC4WNTAnrQqIHPTU
	+kB9UemasTkyvoSOnN2yZy1aUhbdsgBP1I8uWvDNOOeLwUVR8cTQ57dnGUuEoBldxiYX5Jb2Yim
	mUeTvcQSVGt5ZaT/USErH/80hvpvDGL0ediXoQmIYTL1uZSQF7UPeHEUEuT3vby5VVM=
X-Received: by 2002:a17:90b:52:b0:3b4:f457:9e5d with SMTP id 98e67ed59e1d1-3b4f457a24amr1003392a91.9.1795574229078;
        Tue, 24 Nov 2026 18:37:09 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm24946594a91.4.2026.11.24.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:37:08 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 0/2] xfrm: refuse route optimization mode for ESP
Date: Wed, 25 Nov 2026 11:37:01 +0900
Message-ID: <cover.1795573672.git.kyuwoncho18@gmail.com>
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

From: ChoKyuWon <kyuwoncho18@gmail.com>

An ESP state in route optimization mode can be created, and its first
packet hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
xfrm_inner_mode_input(). Patch 1 accepts the mode in
verify_newsa_info() only for DSTOPTS and ROUTING, as in v1. Patch 2,
as Sabrina suggested, also makes ah_init_state(), esp_init_state() and
esp6_init_state() refuse the modes they do not support, like
ah6_init_state() already does.

To Sabrina's questions: XFRM_MODE_IN_TRIGGER is already refused by
verify_newsa_info() ("Unsupported mode"). AH or ESP over IPv4 cannot
get route optimization mode at all: xfrm4_mode_map has no entry for it,
so __xfrm_init_state() fails with -EPROTONOSUPPORT before
ah_init_state() runs. So only ESP over IPv6 reaches these WARNs, and
the IPv4 part of patch 2 is for consistency.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v2:
- Patch 1: say that esp6_init_state() accepts any mode instead of
  "treats" an unknown mode as transport (Sabrina).
- Patch 2 is new (Sabrina, Steffen).
v1: https://lore.kernel.org/netdev/179550330841.535592.4607028415857424638@gmail.com/

The patches were written with LLM assistance; we reviewed and tested
them on the ipsec tree. ESP over IPv6 in route optimization mode is
refused with -EINVAL with patch 1, with patch 2 alone, and with both,
and the reproducer no longer warns. ESP and AH in transport, tunnel and
BEET mode over IPv4 and IPv6, and DSTOPTS and ROUTING states in route
optimization mode, are still accepted.

Kyuwon Cho (2):
  xfrm: allow route optimization mode only for DSTOPTS and ROUTING
    states
  xfrm: refuse modes that AH and ESP do not support

 net/ipv4/ah4.c       | 11 ++++++++++-
 net/ipv4/esp4.c      | 18 +++++++++++++++---
 net/ipv6/esp6.c      |  6 +++++-
 net/xfrm/xfrm_user.c |  9 ++++++++-
 4 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.43.0

