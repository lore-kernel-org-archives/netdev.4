Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695910;
	b=aj2Ly8rLD5/0YkeFQZ3vr6wQq3t218tP7plfi7j/mW1yqxLi/VF2JPdpcMyT1X5Mh9Kd
	 lBI7sTfzCojLlTZjnizZQJH5TvBjdRGV9OtHr3KUjWaXtHc5J5V96/7gb+8mX+iM2RfXX
	 Tg7zKq7r6MrxzutigestPJE9KWrzIcIeMoV459P8eyLgochQhvXiYsXgreOMozWRDe75A
	 Bk9QuAGlbUl2f5RISCi0vOEPolFn1LWVu1s8/5+bTvhqsOZyb1qkM9hkWmybCMOnH6BcW
	 Q7z+dSuZFCFK38pC8gFQQQDFufXTBVlbMnefR03zBby9a/A8nfuos5lTZzKlCxg05lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9S1/CScnjIL++4L924qR25v2xm0ZTSbwlBzEN5E6/RA=;
	b=WnP+wbDfQK93m4Xx9gslnBs4LyLMf2ZgJLOGYXMJE+JT0PUnL1SBLFfbcW+jIvZ7b3g7
	 VnL+BWNCYVFAj81kcY5s/fLN/wN45ZbLrCW3kMTJrgq/9H/Knb+raGVHcUdCgKou8t+Cy
	 IUZXfZUCHO1Dv5T0YWWjXdwwn1/lcfV7n/kw3+ShxUQppea9rVeeYBg97r2upRnyH6DEL
	 huiJCTLj1DWwrVoW8GzG5AaQdmkC6QAg4TAMLJBI+Hah6f7MXqao5qQhwSheAPSmRaWNm
	 IemRJHUF3/GZxuFbYIRDtK51rdRanelmDDQJAGyzoMntvn5wUAdWPsQynWTvpz/oDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cohd1LrT;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B257E606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B257E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cohd1LrT
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b439e37813so3620244a91.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695909; x=1796300709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9S1/CScnjIL++4L924qR25v2xm0ZTSbwlBzEN5E6/RA=;
        b=Cohd1LrTjGJmNCG2WnozJvCZUYVKnbopykoT3jvWYTAtuo3eqcgTbMvhCqpC2UobSQ
         sHWnupmrN6QT2StCJGmCpWqpaQO3bqOnsQeKfTp6LwmwHH8jBRn9y7lUM1m71Rd15UzA
         83wkXRbo0catR9jiSOBt00QTeRE2i0kxpT9A56hk9XL9io8nfvdB+wFleLDebfswhS0a
         jjR31pURUuO1GiJp+u0v/kwaeSXQx7PPrlxkUj1ST4gBup1qbfs/U7Jxi4Gfzbg2eojf
         1QUNe6syueUxffcBBFaih4L961OuFIz+z+c2KtMKMdk8XgH6M23yZN48TrQrdJ/b2D2P
         oMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695909; x=1796300709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9S1/CScnjIL++4L924qR25v2xm0ZTSbwlBzEN5E6/RA=;
        b=VywjF90ZQjl3amCYlh/e65kHaLjhBiEysZo+vBluYMpEb7FDsaC0PPnnAP9y4zkMtc
         mizchsc2AvLxT1zT+HQSAY+64nLXYQmWtjxyX3vK85LSHE7baEvrfGhzqWPNUMs2zGAT
         ZBx7HejdepW51uDXfdn0kHNUcIZzS4QMlXIOZKBLtlw292B6jDoHan33Gz0gtVWB9U+Z
         +I0Q4f4J7Qj+uETtQyNBpMqbSt0Fvipx2ht1A81RRYBilQZ/P/ueBa4dW6JO4Zu7eMqS
         NgzgLvQH3ql1H+VqYfiknb2rtjdmWqk2QAzaSIRjllqahh/voX8TIDZSy8ATMHBKQb5e
         Oanw==
X-Forwarded-Encrypted: i=1; AL+hErEAaACaJP3Apn/I6g+gtH4lp+crz3WPuyvoRjz4XF7Xtiaoqlx/hZA053wQxu4+oVM+hzGEURQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z81mzC4W8lcxmGlWGyZXiHYxcdQvNH80S4uz/ehdxYM5N4JSeui
	KSn9vE23QOEK+EBz1RWOB63l7NzFOV0a4r7rB8nOpMHykKXV7iP9NjQ=
X-Gm-Gg: AZFdTZcvmtgyrXiVzxY+KM7q7V/JRR21CjVdDZcN37UZ0B9brrRka3hTsxn3hmgJ5P3
	/mBxq+9t+Dp7Kzh2RhzNbrOtaEQ6reicZrV0LirM6ZeqBFLpyE+4StkBsjBAfSo0eYniUq1HdfS
	QjuwLCWju//kjle/wAzxnjpGHuEmzKg+NlPbTWK4jf30i7cKAFloXjfiGk3AyMG4ZlTnk0PyzOj
	SKyV71cRckzi9CXQgEwWyZ4564HQED8yY5Dv5ygdbsHcJRi63xgX8kAJ2jdu/IedSsRat7HKrO8
	629RZetIORdZXbLgZZM4gOxVak/ADYT7XeCm3Zb1lz0jcwJubt0wws8glKa7Jhz/eU8FCJ1iTRU
	jTy19OKGREtaX33wZwq53L5CMoaG0mK1nzCzIFG49pyjft7QKEwuogKSnh0mxblvhGRfvTbbxih
	nPDlwAzsYSPbomP95VP7jHvPNZY4B5PCKMy+gsmSWTVZdEPG/0URUs6CXyEqLD+fXSLNdR8lsU8
	6wpRFR6HYSlmas0QKCAl2oXsMH8Lsxrhfoqjfgp/kJDQokQqf6r5SAJb3AqZrGlCDOWrlOcTkhK
	U9aQE/RZDS2mfmgQ5ANS2zA+/HmTTEfaUYgn+mPzzvw6L2w3NEGDdpM5KlEsPP8toKc=
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18516740a91.60.1795695909040;
        Thu, 26 Nov 2026 04:25:09 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm15564188a91.2.2026.11.26.04.25.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 04:25:08 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Madalin Bucur <madalin.bucur@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] fsl/fman: Fix device reference leak in fman_bind() and fman_port_bind()
Date: Thu, 26 Nov 2026 20:25:02 +0800
Message-ID: <rc-b1-20261110-vc-176-5127b53b8eab@gmail.com>
X-Mailer: git-send-email 2.50.1
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

fman_bind() and fman_port_bind() call get_device() and return the
device's driver data. They keep the reference even when the driver
data is NULL, which happens when mac_probe() runs before the FMan or
FMan port driver has set it. mac_probe() then fails and drops only the
reference from its own of_find_device_by_node() call, so the reference
taken by the bind helper is leaked on each such probe.

The FMan and port devices are created from the device tree and are not
normally removed, so the leak has no visible effect in practice. The
NULL return on the FMan side was pointed out as a probe ordering
problem in a Sashiko review that Simon Horman forwarded to netdev in
July 2026. The reference leak was not mentioned there.

Drop the reference in both helpers when they return NULL. mac_probe()
is their only caller, and its success path is unchanged.

Fixes: 3933961682a3 ("fsl/fman: Add FMan MAC driver")
Link: https://lore.kernel.org/r/20260703074324.907294-1-zhaojinming@uniontech.com
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_FSL_FMAN=y, CONFIG_FSL_DPAA=y, CONFIG_COMPILE_TEST=y; baseline and patched fman.o and fman_port.o, no new warnings.
No hardware or runtime test was performed.

The path needs mac_probe() to run before the FMan or FMan port device
has its driver data set (probe ordering or module load order).

 drivers/net/ethernet/freescale/fman/fman.c      | 7 ++++++-
 drivers/net/ethernet/freescale/fman/fman_port.c | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman.c b/drivers/net/ethernet/freescale/fman/fman.c
index 46cc28895e56..35a8e25ba993 100644
--- a/drivers/net/ethernet/freescale/fman/fman.c
+++ b/drivers/net/ethernet/freescale/fman/fman.c
@@ -2493,7 +2493,12 @@ EXPORT_SYMBOL(fman_get_rx_extra_headroom);
  */
 struct fman *fman_bind(struct device *fm_dev)
 {
-	return (struct fman *)(dev_get_drvdata(get_device(fm_dev)));
+	struct fman *fman = dev_get_drvdata(get_device(fm_dev));
+
+	if (!fman)
+		put_device(fm_dev);
+
+	return fman;
 }
 EXPORT_SYMBOL(fman_bind);
 
diff --git a/drivers/net/ethernet/freescale/fman/fman_port.c b/drivers/net/ethernet/freescale/fman/fman_port.c
index 1b8fef69114e..5d96521066a5 100644
--- a/drivers/net/ethernet/freescale/fman/fman_port.c
+++ b/drivers/net/ethernet/freescale/fman/fman_port.c
@@ -1684,7 +1684,12 @@ EXPORT_SYMBOL(fman_port_enable);
  */
 struct fman_port *fman_port_bind(struct device *dev)
 {
-	return (struct fman_port *)(dev_get_drvdata(get_device(dev)));
+	struct fman_port *port = dev_get_drvdata(get_device(dev));
+
+	if (!port)
+		put_device(dev);
+
+	return port;
 }
 EXPORT_SYMBOL(fman_port_bind);
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.50.1 (Apple Git-155)

