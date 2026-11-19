Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107989;
	b=RZUDR7QdO0KRmM4rAO9MCvak9JKG1qMp+CtRPlWq3jPOwBLWXirW/TmnaU2phk3QDtlV
	 JsHDT6tw8kjX1TZnQhgtg2G2Pf/4vza3dwN1R09d+jZEknjNIIVSDJt1aHYefJlxljMmO
	 BQTlL2C3sTZXT+cIe6NZ5UrbyExfHdKERbczGFJH/mr9qxmUxS6xahbKb1sMKcRELZe7+
	 Tq3BeVVC74TLrzehe8A7XLCRAonGQwLkfEr9NPRsqx60VGpuvcmAO3afjzrO3dF2kMVrT
	 A0oBg6/wwy0SbFunV+P/AWEmSV8cToz7BDgjDSGGjP33/nZnOU2b3mMI1764GVSmjXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
	b=Rrk7s8TY37q0Qdat6KNAFQ413w8aQ9yyBePTj04Ck8vTiIQCV9bSetYgVKhSnpFcs3OU
	 OqOUAiBsdSDswFUTMpP6zQbh5oTW+rKSoqI0BEPuNyVyz9HDxTMZ400vSYeBRvZNefBys
	 fdRrL/l6rGcp6CZzbu6md03aRkQ3KbqTvHQOo5imAjQdUK7vmff7IIvuDWwGjZn3/Y3/f
	 PGXvuuwr/062uiHzVXogryOxvciDAwtwfUViuIGcFg8XzH2a0oYWchLAAvHCSYqtNbE0q
	 ccaLvCH01LXZNsLGVByACtEMdsppO+KmMMl/h4vcsiEBJvQyHcllwlgSQpWA8fC4q9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZWPE8zhV;
	arc=none smtp.remote-ip=209.85.161.70
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537D606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B537D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZWPE8zhV
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6dd1142710fso3594660eaf.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107988; x=1795712788; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
        b=ZWPE8zhVuI2oOxKdlGh9hwyWpz9uobD/aMVeTe6vNt2ot3ExIEIWAJN7fADNEQW9Im
         Nuk3iZ4JsnzWnb+eB/qsWu/8MPPYEB9nEJVWnNs1UtKSZ9zYu4vpz8dCePHjf7WuHeeP
         08+0pM/H3gpZgOWbz5HfS4vxhD8Mo+F6ZXBLjcm3Twp0gA3oX2gm7NGiaDQL7EKaAOcG
         o1FKmFHLGkwlW5xHly/IgrqgGqdHzfUBBlfiO+VG4ZWUhXTKReBN6PYGmZZltxGrFggB
         ndttMwZ4kxkuiRTe4b7RfkggA5saBq/yPW5mckhapECxb9tKA9PpnFTopUzhHnJ3+Y5s
         jsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107988; x=1795712788;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
        b=f2XFA+Bedj/ieOyKBYBqJkJNbIn/k83PVM7phAThJPh5ClwiOU9ekaV2i73XF5Ccl1
         Qrb1+fqbPsH8vqoPiqOpj7qewda5LjAlsHineffmtIWcWcCTfFmyX5NooqCEdCveG6Dz
         6Xf3XziGEzc3ldv7dYA1uZSqG7KtWcElwUWWkUe0S2BGwvnIkPXHABqTh3K5cCdRLFxs
         QOtMoTgOcj/iH6aHas99Z+IzWtv+2R70tLAvatNCgEYdBVDdb5YfkBauXtabrQvVQ4ST
         +AA1I2+fHA4RPhhEx8uDp6oOHFrhOWPE6VVbfKYatMTsST93xcIO7mOrmkXD2xSWCGTO
         s1Gw==
X-Gm-Message-State: APuU4Z/p7e/E/rvWeL8X9gpaqrvrJX4PaMjTxxcAYCB0/JhQYKyTN3jz
	35H3ogdSk6G9EWYArI7QZpNnJoiEUOiLSaRC9Dl0NEZRgEm7Ig/WSy+hS5iaYwinwZajFH7hneY
	PbqvToSEEIw==
X-Received: from oacia7.prod.google.com ([2002:a05:6871:e307:b0:49d:e3f5:f8fa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:3388:10b0:71a:eb23:a7d1
 with SMTP id 006d021491bc7-71b394fc7c6mr128920eaf.53.1795107987578; Thu, 19
 Nov 2026 09:06:27 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:23 -0800
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
Message-ID: <20261119170623.1519909-1-irogers@google.com>
Subject: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: Ian Rogers <irogers@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

niu_txc_set_imask() acquires the parent lock, reads TXC_INT_MASK into
'val', updates the port's interrupt mask bits in 'val', and unlocks
without writing 'val' back to TXC_INT_MASK, making the function a hardware
no-op and leaving per-port TXC error interrupts masked.

Write 'val' back with nw64(TXC_INT_MASK, val) before unlocking, matching
niu_txc_enable_port() immediately above it.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wunused-but-set-variable enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wunused-but-set-variable; not tested on Sun Neptune 10GbE hardware.

Fixes: a3138df9f20e ("[NIU]: Add Sun Neptune ethernet driver.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/sun/niu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..b2da560edd82 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -4650,6 +4650,7 @@ static void niu_txc_set_imask(struct niu *np, u64 imask)
 	val = nr64(TXC_INT_MASK);
 	val &= ~TXC_INT_MASK_VAL(np->port);
 	val |= (imask << TXC_INT_MASK_VAL_SHIFT(np->port));
+	nw64(TXC_INT_MASK, val);
 	niu_unlock_parent(np, flags);
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

