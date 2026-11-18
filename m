Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969302;
	b=NDNUGZjyw7tDGjBPECXrcy8yKOr0YN98shkB4rbMqLjcO+Ry3a8NMSgh51r8VObzOFkj
	 f0/Dej3sRydsAaZ3t8Szc9reSbc+hgqnjZVj3lUt77Y7woPJnA1JOcbF/TCi/9fVn/SC6
	 /1tyKZaKR5/rFsOdOWQ3O0e1ZSJC9PWHmhf2Eg0Cb+0f3RNxq01CRCgMMkF0a3UqbX02v
	 jl6LA4XiDdv5yE1x6fRoiZ6UmtsHqwKYqHirvS1Cjvj0BTfg+4hEqZAsxAr0d3a8vLqgv
	 LtOuhNB2WAM21GTBJHgrjxzZPIoMQr8y6khbhv3ZcmDaL6xysUFXzBWvMuF6bSOz72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mHWggqLpnauq8V0f/6VAUKeVELzCOKPOXIB0IXf4NPc=;
	b=yPxnFwzzlPRx/zUUuEPy5KtDxV6FhVgkGq5i+OIubk1Q8+L963gcllzNwuVzqWuoJ69R
	 r2wCHKSulveickbqofi68uYpBSWShAKPsZ21ai08Hh8Cqs4bOgG/hcwNuivlQ5prGjSpS
	 b8bR3oTaZHkDMueq6WL8Z93XGXZFbucLo5xoWxyqa8nyaDD5vHFW0mQLoxWOs/sv3VAvO
	 m2tW/cPcXqrbpCC+6+cA3qN7gAOWB+oqfDVNO6GfzDN9Nw+lhRkNrK8dZKNfdtAvzIY6V
	 WPSI+O/azhgANJsMIXrW/6bHV3Kq3IJNBcVS0//+CErJgbhIpVCRu1UcgWhPmsdHdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgBopbYG;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F99606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F99606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgBopbYG
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b600fae14dso217084b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794969300; x=1795574100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHWggqLpnauq8V0f/6VAUKeVELzCOKPOXIB0IXf4NPc=;
        b=hgBopbYGPttjpizSBDDYLhvsVhl19nNbpKHW5AW/Yfr/sBuasj5k4pRrIKLeV+BfL4
         rDt3WruEU/azl5Z0oit/bX/h6eCf7jow4fA/So0yFOxi6mwHa6GDG2jK/Bk8brCufwEF
         VOK21i4s+CY48i2mCzF7EsWM8jwN0+2bgKuOyDQvJlUCmUYetA0+kuy1BVWfkcFv0NHW
         TZG9aMGVMVhr3SQvYxQv9xQOFuCVoCOTKbQMD+jY4eOipypgAHPSEGO9mrPfvBLNElie
         l8iWjMftgdX23LqnzsfIHTikxC6MlgCUeItHVZxMPBFQTWrQhhAIM3dxlMTpXLgWE8MR
         uShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969300; x=1795574100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHWggqLpnauq8V0f/6VAUKeVELzCOKPOXIB0IXf4NPc=;
        b=hXpc60eyul9e2+7whQnxNsy/BLeVwhmblQ+0uKsvwL5G8xI8U0MZaCiNsk6w1qmAkP
         8WhHHsQQxnPxO8R6IQXSXBKCgo6jE5PuK8gHTJ1VfUQd0qbU84Dsj4eurQDvrzUJI5St
         CA9E8Dz4oYUuIwJImHU3rPxjGBeNcufb5kfeA3msuWZYtryehpch+c09brGb3fGmcnVv
         zJMTc2tSWPIF4ZDEGxApM9v2Vj6Ch5fpSiMzhT305vulH5txEgtj3Rn3yHBPjMJBRr2D
         d2LhfnsOe6oBE2xQy234jIEdpwsSqi40MI3gcyRAfpS9gzPCcRCjHXKU5uLzouUCJT6h
         wUFg==
X-Forwarded-Encrypted: i=1; AL+hErFTLb26iJpnmdXu45qXicNbozgTHhT3CDv/wyBP96b4Pk+Wdj5Q6nEY9B7FAgGw4VBTDfEl6ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d0ySoTN2p/b9dUqkfKIJw5BN97ZiTY5AhxK+LE2tkugPI4rGo
	SXuAgY0BcZ+OrnA/5S3pHJobUXlxdDZ5I18ZmDskNTgiPvu452NJqjGF
X-Gm-Gg: AZFdTZcMvGinYENMhdwHZwZ0Rq7KdAR2V9dqgqmJD4I4EEcW1lqgspk9siheyn1rhIA
	0utfUHrhWoW2eQPlwXB7mHcsDtVJcKKoKArbahjgUEClGeOwa7m6sAQuZ3juPSFuZbJYT14i2bE
	nrpJ+9q05p5s6GBX8inBospfBkGa74cTbVVvAMES/HuEeCmsx6J7Ddw3EYiBhEHmCqpzndpPqZK
	yaVkbdmmwoFtb8xk11th+sXb03QCcHy1VvS3uCYXE/uBZ0xC81Zx7RV0ijPQ9nCDvHkHtlLbArH
	Qi2a3fp0z45mkRB6IkSYBVExSO74BiwioVV4t5D1rleL0zN1egjyl1CbwsI0d4qNGbl/f9xyJZN
	Pb8Bf03bwasjXBdmT3bZRCLuW3YQXOCosAwZ1fk82JeLdPfBmUR3oCoptYbaF20dcGjV0eOzZ1r
	ChebA40qI/6i6BNVZMc0se+1gRVEIIHMIMmsIqC+6kEIrB03TPNovgjc9+5zdG/JG++7sTD942U
	DTwpQYEaKuhJ5UkAz/oHZcPjDsr8C1/RprALkCjkNYTWuPuio9J9Vyqhi3fb1KJ8gKWqs+KYyxF
	gkCK005iJaFJ+b1lPXEKWaV2Hvyn6DYUFzsTSn2pNs4oBQWHw3i9tQ==
X-Received: by 2002:a17:90b:4a48:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b3d07d8066mr1199082a91.42.1794969299849;
        Tue, 17 Nov 2026 18:34:59 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56c9c2csm426127a91.3.2026.11.17.18.34.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:34:59 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>,
	Jordan Rhee <jordanrhee@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Tim Hostetler <thostet@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Matt Olson <maolson@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] gve: clear flow rule cache state when freeing its buffers
Date: Wed, 18 Nov 2026 10:34:29 +0800
Message-ID: <20261118023429.29330-1-enderaoelyther@gmail.com>
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
Content-Transfer-Encoding: 8bit

Freeing the flow-rule cache clears its pointers but retains the cached
counts and synchronization flag. A successful rule-reset command
invalidates the cache, but a failed reset does not. Recovery can then
allocate zeroed buffers while retaining a nonzero count and synced flag,
causing a later flow-rule query to return zeroed rules as if they were a
synchronized cache.

Clear the complete cache state after freeing its buffers so reallocation
always starts unsynchronized with zero cached entries.

Found by code review. Compile-tested with W=1.

AI assistance was used.

Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

 drivers/net/ethernet/google/gve/gve_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 35cf0f06a0f2..747f5229d7ef 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -189,9 +189,8 @@ static void gve_free_flow_rule_caches(struct gve_priv *priv)
 	struct gve_flow_rules_cache *flow_rules_cache = &priv->flow_rules_cache;
 
 	kvfree(flow_rules_cache->rule_ids_cache);
-	flow_rules_cache->rule_ids_cache = NULL;
 	kvfree(flow_rules_cache->rules_cache);
-	flow_rules_cache->rules_cache = NULL;
+	memset(flow_rules_cache, 0, sizeof(*flow_rules_cache));
 }
 
 static int gve_alloc_rss_config_cache(struct gve_priv *priv)

base-commit: a2239d5dbbda3a61b6323df8836f605921a29f7f
-- 
2.56.1

