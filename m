Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115050;
	b=ucLH9rOjnxbRPz2MHQ9/Zy4Pu7MD3g4INuBCSX6ItW+UqztaauPXfu3ZzIRekJ1MeQsA
	 QIfwyZvBUZ0/zCGPXlIhj/5oXF06VC85eTmthgkpk0c1MeO5G9GiSaYrGH1f3+Cyagvqv
	 +1COOIHZ+TeC8hB3KIwIX/sE/KBR+1W/jeiBYCw/TIsloUbNk8hPS1Xe3iIoYq3cBcApW
	 SRcCEd3pdN7h7BmDpyYVP0DTtKuNirt79g6WF2Zg8J+ySb3n/pt7/0oTucRTYa0WesG0i
	 0oSGe7CA4/GX5bhoxr0G6yy9Vf+W441Vx78uxM2A6tVgXVReRjnhQna8WZS77Mt/0Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115050;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
	b=heFdyc3I6G5tyQTU9b4I1I00dfRFMFZdnR/266LzlF7fLeF6GyQgfDmQtxn7dhNwzzg7
	 dqGZB1vsrxCCZJpWVb3HHVB/3DjhfdYESmZ/hVLAJGbpkcDG81oW9+3CZsNjCrCm1nt8p
	 uhMOH+fNEGtGPnAmIfjaZEyUPuNBpE2SN8qvWdiGoRjaUf4G4HDICNXxKvmofyje+Fl8W
	 wbosxFz3FkMB3GAp3lOPrkvd5QK0kXuC+yzhPPL9UXXUpnTRtvyzX3kBk0Tp/GGSgZreD
	 gN5miTAaHUCF534FbGAEvUMHRI+fKOMsTOYZ9wAZSZN+yZ8I7FEOi2BDWwF0UhlBPEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VATJg7bD;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6860A261B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C6860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VATJg7bD
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7cc603a168fso25773137.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115049; x=1795719849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=znFdxAJnEubnXv/OvXegHKLETXRnW3EUwcPdbJN300VdCHPtjSjchgyVWcYI9yKpWX
         HGF80aeHfjZNH9ChYlTyd0v7GI/YiPkDLPjuDWMEL9T7gJjRzeKdRZrYJT8uQiLb9pV6
         n6JIoljjJyzzstBlqsclk0Fany7L0qkRnZ+UgD4fCWqd62geTmsD7bvRGV1g6srOha/B
         2rRL4KtTBWusua47gnyEtLQh+gJSMxW1LzfwV1ctcyL0O3rwaulzkyAV8HEwyp6ikqWw
         rdSGSJCFVcYKaqjJUoLbvsGeJDqrgEOXJkcF3dEUtAoO5ugaHNTHyLjGkFhwH9LbjqWU
         x9MA==
X-Gm-Message-State: APuU4Z+6oCEu52JikJ9/sYXsJ6JBnfeWeCK2rMYnlGD4QmgjS6S+IuKE
	pqNGHTB66uuRnP+Vmg1sT9T+KdCaM9iYKZh0WeEAyhZ4mrLpDbEX1nk8SdGFRJUxmBmARcSodrd
	eliI/2RmI1LCVHd9INGDsH4Nn7WvqQowSqd8QDUb1KY6oqvZunkayT0+njSVFD78ZR+pZX5slSI
	HZzI1u+d8H1VoOT/vGzyyBIXwMC8xrCsCCUMB62i5XLnAoTrSutVObMajzC53622zl6XIqzGk4C
	WvySBMqp67EidYV
X-Gm-Gg: AYBFou3sGOb6N2gF5ujUU2oj3N29k/8xaA4Cy3kECU3s3PXjJwVQx13SOLE884YYBj8
	aoe5szvgAV6glx8HvzmGO4b4FVYc8Hufzhu6tk5vhSz9CIcbtXs1u9O3Yp5bVNBCMEPCTlqAOMV
	WuDDqXF/x3OEflTIwu983ZMfHhu0ItOAYkaPXDHyMiIXRbsUJVxKVZaJZi3VEvTF+iR228h9xNl
	WcSZC3vj+PCpqKRns4x0FVsNDMxeB3qUODLkU/kfsRlNM33omNBBJ2RydoY82lr4FoPbIDEoDmo
	dWw7dOMJt09yb5yn6MvFc893NrQXgbIHAtd00Dq3hrAKWUe0crFNAhtrq5BWwBkP7dn2ivd/tqO
	TFpso57zcE2G1QBbEm1jkNLxGmEHqnI258S9PxdK1TzNVhu6Nee8mjQ/3/XZ1kcIpBPB4zWSKpJ
	UEwEwrHLo6ZT0TXAJVws8I0mpmP32Jy6WxME7cz/wh
X-Received: by 2002:a05:6102:6047:b0:7d2:7c63:59fd with SMTP id ada2fe7eead31-7d7396c204dmr140759137.34.1795115049003;
        Thu, 19 Nov 2026 11:04:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-92134a15bc3sm28476d6.31.2026.11.19.11.04.08
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso26534085a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115048; x=1795719848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=VATJg7bD55vetFvkqwZ8ARjMlUEO90ogmVqaoMMihBeotk+HZmICfCF2HRyU6U+uY3
         RykwkZKOXvXQhmAXDGlx8KAHQtWpBmpm4AoHUgqEK9/5KL23eMEV7xjFvjW3c/RG2tFy
         Bn77L8OWtnccfDtnG+NyQc+osAvtKxhHurdEw=
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr96036185a.14.1795115047673;
        Thu, 19 Nov 2026 11:04:07 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr96025785a.14.1795115046934;
        Thu, 19 Nov 2026 11:04:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:06 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 2/6] net: dsa: b53: fix the SRAB grant timeout check
Date: Thu, 19 Nov 2026 11:03:44 -0800
Message-ID: <20261119190348.2317702-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index e6d14fdc56fd..7306535a892a 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

