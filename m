Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323212;
	b=fGLFxmfGIw5I+70hugAlwXJuMY84OWsrFW78I6h1A02D//xpqQiGkcQeU47AhZm9ISn6
	 f+LyXhqelD3Bcnd/hJKiuCtehqb8iowE+B0ClhNZrhGmmI6hAwQZ7qrqmDm2IEcGRjzWd
	 2LY6IxyVuDfkELq//X9TN415pMlSEQZyN2jhXY0wwzuwqpdRRF3FaP7V6aNcJu2Zw+etv
	 oaz30E+z2Q99oVBiwnb8GfW8lCrgLaTkCUTlobsVI2ymbQC4+Ppf1CxW88YWHwijOhKoX
	 KOHqFmxRDOjaG33rjT4/9/qA4Am3uNoeQ8iEuMrSKfCUBO6vKThlLTG5zvmK4SF1R8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
	b=gpOdTmmtsPAkCth+urwQ8kQMk/rreD/sgUYInG5zd+YlBfTS7ddBTHvx+PrAFtYf6EqJ
	 uvRV0IQFKv80x+eQd1RZVMq4y0s6NYC6sgv+d9aCkwspXox/BZcYaWgKzSb2N+I7yMkvy
	 eq9kBl96glf+KfK9KTBN5TrPNyljE8CKrGNMvaRpWtr4Zk0XRGxX1eGoRxvlFYJE5X7tN
	 XHvlvze8R7czXb1uJpdOJbF7bUGpFOAConu8ZIucVm2rS+G53pv4qObUWjn9bgqwQCPFT
	 jqETgI/DWKidBWzXVZUkcwAo791EM2qgmEo6sG9yjU2f2yilKVY5mK8YUn7OCpwOx2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RNqyiKh3;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59248606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 04:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59248606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RNqyiKh3
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so2908205eec.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323210; x=1795928010; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
        b=RNqyiKh3LlN9xhq9jphMzBVO1T+UboaR0iWld1TeuvzSCSfci4yP1E8BCwOl7QtIy1
         qRj9AibZlaL01lX3HvTncb+JCjAlfm1nggMgvK2XwW1+rfRKOqrDHYOKoSCXepACFk8I
         kdcFYwow33B8QEhDb7MHuXyswa57cl1Kx8OEgorox1LiXBbKhTZySsi6KW0xWo1W0sc6
         yAGRNvFMmDJv/kkbU9X1L4RtEurmf8Vouf6DX2QB1oJ22YEpcnONi2V1y8r1UkwovzVW
         Le5bUxIeS3XNO/rr1VI0LYR9a11JMz416iKUK5fLZcdxql8TqqL2HocuFWPxxWoQBVFT
         pROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323210; x=1795928010;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
        b=EDcluMuld+h9qZmKRzSg0cUnXJWXNP0Z2TMV3GUKkRCfTJGZQeg/yVa3bp/a8GPSEc
         mzVfkrTvpfSuqOt+l8XC/DlKap0IYcC2zo6PLy7TO8/LMbk6aaHkiy6nl3JDRk98iBnv
         uYXzPvPAsuzJLEaH8WLS2i96+4YH+4+pvmhkNmz+0zT7H6hbSeO4bBAtYhmCH72cF47I
         Bt92w3gpSzryU6T96C+5S5VLIX68Oowc/9nx9aEWwyjg9m1Y5VYjXu+pI5vP74uepakZ
         S/FfUUoQO83JFXvVq9L42o3pTwLCBVdwFtQHBJRLqLdChe52GEy3zRigi23QVjmMLKFR
         NQKQ==
X-Gm-Message-State: APuU4Z+s7IE/B2J2OTPvZYnRv5GP7kTZqVUI71ONRR4kr82Ak04tbXZj
	mVXP+mTu91B3QuNLX0apKvBbhVQIpdS1qUXgSwj0LYU6ySYOSbhOENa7f0wShO0AVDG+/HYTkZv
	MopGqETSVUA==
X-Received: from dlbtu1.prod.google.com ([2002:a05:7022:3c01:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:290:b0:1b5:dc3:209b
 with SMTP id a92af1059eb24-1b5568ac6b0mr7480933c88.22.1795323210085; Sat, 21
 Nov 2026 20:53:30 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:26 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045326.19641-1-irogers@google.com>
Subject: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
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
loop finishes with an error so dead MDIO hardware fails probe cleanly
via tg3_phy_probe(), and zero-initialize phy9_orig since Clang's
value-insensitive -Wconditional-uninitialized check does not correlate
the earlier continue on err != 0 with the post-loop 'if (err)' check.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build with AI coding assistant help. Verified by building
drivers/net/ethernet/broadcom/tg3.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on BCM5703/5704/5705
hardware.

Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Target net-next and drop the Fixes tag (Andrew Lunn).
      - Also zero-initialize phy9_orig so Clang's value-insensitive
        -Wconditional-uninitialized check sees no uninitialized CFG path across
        the earlier 'continue'.
    
    v1: https://lore.kernel.org/r/20261119171021.1535172-1-irogers@google.com

 drivers/net/ethernet/broadcom/tg3.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..4d375328621c 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2544,7 +2544,7 @@ static int tg3_phy_reset_chanpat(struct tg3 *tp)
 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
-	u32 reg32, phy9_orig;
+	u32 reg32, phy9_orig = 0;
 	int retries, do_phy_reset, err;
 
 	retries = 10;
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
2.56.1.750.gf70dc682cf-goog

