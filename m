Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108225;
	b=yKig5uO2lIrI1nVJhsDWU7RFnDYDvr27Li0bsba5Rg04zq3WJZ9vEYhwNKJsgw4IjgmV
	 wBJvHJCrXAI6cxR+STJyRJ2VMBMTRGSDG8Ux0KiHF6Zsy4mVr9fCVbuMYBLIJAr/d7+82
	 0oRA3qGUBP+ehE5qhXZQsi5EJDqS/ngbVfgWwak74eAn6ufGsQJcriD59QkVKYKnaKvAP
	 l8PYmDcM881rqMJBqy+tOO1b1kfUbgURQiqcV59Xx0F0N76W8aphfGat4cNoWmq+OxSva
	 cG19qtkVtalD2OONwS/IseiWAVjy/kNj+9F9ZsVbN1EFw6FDhgaXZ2uShUfpQHHuC7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=B7nlDoGtQsbCYF5zM2CHlDtWyCwjewwKLZSkkjg+Gqk=;
	b=IpSC609TxWgAl5kzzfczynWKXsgas5s0k67Vtqy+aZ70TdZQnxSq/vcS3w5HY2Y6iZZi
	 0X2i5zI83gLElvuZPtVakvree+kueRNM94/2K4jZnwwSstQBcVVqdla/CA+x5+Lj28zeM
	 8ZdAfvq8Ms8b+TGpu7mKsEwQ4rOjSi7McZqmC1GLkp8ydl4VBc3t5wZa9CAHNdT1I0F4J
	 Rvge4QMbGogt+KDjrlg6+3s5PQY+E27EmqzrCAsS43jC0mcyNYiZ6i39yqu5zznQzhqXz
	 HiSdy8cAlE7QL4XNjgshLSNKGEbzR9xmDoQzjTpNtaKtZ2YZeNDCVG5pmHKTFYxD4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iNorJu68;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D609606CAAB
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D609606CAAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iNorJu68
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so31483115ad.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108225; x=1795713025; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7nlDoGtQsbCYF5zM2CHlDtWyCwjewwKLZSkkjg+Gqk=;
        b=iNorJu68GrFwSRJtcwkfCon1uAi2P0UIqg1t35ZXFHCo/+q/KJH6+pyKCB6+7iHE7u
         eY+gvfCI6eWuDNdPoWjWjAr6dTqWCyFPLjH8c90N2tEIc/JN8ImJCd/qHAFsYUZEtxdR
         WZS6EV/lZbLX1IzHcyepDekL8EGi5WHjaZ5VngMq6S78eYgFKyEau6MoiO/1AsSe7fJh
         HOw/OU6WBClNL38W9o5uhZ7ilvYwmrKMCfOBwUVAQXKcAebPvqfFxtcS9/GctcrRuVeK
         Y1UZkCMks00JhGoQcadaEJ9HY6kkw5l349ZDG7V5Perm1oLGtx//69GJoCtXEUm2nv2x
         TGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108225; x=1795713025;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7nlDoGtQsbCYF5zM2CHlDtWyCwjewwKLZSkkjg+Gqk=;
        b=y4/S/QRkhmAS6w5Q8wEABAOx9Sks7Kny1egHgRseNTVRrHSxiUQRLlEvXBcRTTrO2h
         kDZ335ih5CPpWSNK2B24Oh1SfvfhKQ8BaMDvVvjy/4EXA9M/FmF21SGSgz8GpT9Fwkmf
         LjEvo0vdc9S6d7UMDRGnSD74fIvhXoi2KlZhUxSfEmkQeP03MT/BscTVeCEO0tZkp9Bb
         dJWkhWhYpDKnPV4uiD74Cjj6R5JtSogDoyFipmoCMLHgfgHUWiTRz8HjeSVwpR7hiozk
         OyjlTKhUpUYIDHhP4t1zvL0HWrNYbSv2aMyk/E1AJu/ZAMUd7mL4wLV7jwXR0rHzyFdR
         60+A==
X-Gm-Message-State: APuU4Z+p3tjj68Vc7dIhXg2YsZMUX8jAYqV27r4ir5v1jNyGg5A6Ipgr
	bTxUkBjwE17c4W6Xh0kKnehbZIXGBc3yPfuKF1UGdGL3S1GLGyC7eG4xEnzYjxuLsgY4jL/9mrR
	M5ViNENW2vg==
X-Received: from plbkf8.prod.google.com ([2002:a17:903:5c8:b0:2ea:7221:e753])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2b0f:b0:2ef:d981:9576
 with SMTP id d9443c01a7336-2f03f181ee6mr4877595ad.54.1795108224402; Thu, 19
 Nov 2026 09:10:24 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:21 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171021.1535172-1-irogers@google.com>
Subject: [PATCH net] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
return value of both tg3_readphy() calls on continue and never checks
err after the loop terminates. If MDIO reads fail across all 10
retries, phy9_orig is never initialized before being written back to
MII_CTRL1000; if tg3_phy_write_and_check_testpat() fails across all 10
retries, the function silently continues as if the PHY test pattern
succeeded.

Record err on both tg3_readphy() calls and return err if the retry
loop finishes with an error.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/net/ethernet/broadcom/tg3.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on BCM5703/5704/5705 hardware.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..be2410e718fd 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2558,7 +2558,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 		}
 
 		/* Disable transmitter and interrupt.  */
-		if (tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32))
+		err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
+		if (err)
 			continue;
 
 		reg32 |= 0x3000;
@@ -2569,7 +2570,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 			     BMCR_FULLDPLX | BMCR_SPEED1000);
 
 		/* Set to master mode.  */
-		if (tg3_readphy(tp, MII_CTRL1000, &phy9_orig))
+		err = tg3_readphy(tp, MII_CTRL1000, &phy9_orig);
+		if (err)
 			continue;
 
 		tg3_writephy(tp, MII_CTRL1000,
@@ -2587,6 +2589,9 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 			break;
 	} while (--retries);
 
+	if (err)
+		return err;
+
 	err = tg3_phy_reset_chanpat(tp);
 	if (err)
 		return err;
-- 
2.56.1.708.g77570a6a1d-goog

