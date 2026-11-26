Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685885;
	b=3MZi3wO9bXsDu8zPHZuX2NmAovlPUmARvqXoGAbRLhtNq0K8JL5qENqsXLmlXKMHpZdZ
	 jKuzauo+ZxAI1S6ewU2KfjIAu6HJ15oVzutcZ9SYzxZroNBY03ngbDAnMgQf/EQrT/xeM
	 wf8HEHLfGyZ+xjEVKRSjlBueEgLt4L4tRtqFlJker9d1OoCiZaRiHdur0dHwpcqL+DnLv
	 qY1T6jZanwkY/pSbCqHM1gpcSwVF6+yGyFQ4JQQuryed7mGoRAhOHmUqJshAzSLpMsku2
	 B9L+GRJiSoyryhiEgZTNlm+YrOdad5BNQJkOeebE514NLep2g62z7tJQ6vbc/QD3IrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P96TXcMA23WG6JolthiehBkQWMHEz8OJSyqIerT2P4Q=;
	b=U1e0SXlYYSUDMO5LjeHfGgBHn2YI22WlhMKC00NZ/1hzhWioKZBMM2dKQLzn9b0H59Tc
	 D0ZmDXCzbVzI0HvTd/kopdPI7wAwGxxawCDgQX2AVKtqVbcs58P8ZdPZ/gAK6gXWuXTBn
	 HcaO0sd0PvQ6aMwcN9PziLaNluXkSAhdOt7EKgQhPQ1dYa4oy/0ji9oN/yR0as++X5aCR
	 Nuhvt3rVrD1nvP/q+ScERxUXnboSI1ZCuiM8x4bCOlDg+ZfpnTIeE9jmiH1weO578Psvx
	 nZpK3gDeKch39vpeNv1sHjV43PXSlROoVQI5M04NQB2Y8Pw2taeyb0jmigPljZcjE/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A308yLFB;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE39606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A308yLFB
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b904d10882so2884661b3a.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685884; x=1796290684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P96TXcMA23WG6JolthiehBkQWMHEz8OJSyqIerT2P4Q=;
        b=A308yLFBhfx0UWudxJTFF+TuS20TYf9zVWIZFL4i05qjBqsX0/xjKgIJqFnj9+Sw1r
         uFIsuJ8JPosWuFpywVUdJrOJzMkUSwZwOxhzDuR/zafSv+aJOpEpKc092ZEJlc1PWn+I
         UAWVu17XmPEEyJ43AU35EAeUsxhqr3/A1DjuFkjc83wCJwJDmOBCadCFxrcQmxuXKhIX
         naaEMwPg2M08IMrAFUvD5Qo8aDBNqQ6XbbkaAqCa9ORR++jalF/96CzU/SFwhUspmij+
         v6900A8Lv36NpYleS2ovLgpzwtfFXCDCLtHE3+2hfBXc2R1CojxUB/6+UZABLS7TgUm8
         o0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685884; x=1796290684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P96TXcMA23WG6JolthiehBkQWMHEz8OJSyqIerT2P4Q=;
        b=BH3QZr+SAQBrv/o5EE7Eo0X51oArOaP8Bw361J6KTFccozvoOPogIzLpTab5ByzlUT
         TF38whzxaSBDT6jesaNWCZOJ5AHbLwBPOJzknAnEyn0mLu+Calc4KEA4Fl56wKLl0wdx
         mxl7PKRuQGL5aefSE/mD19k8+HAuWztEjFMh6KarsqbLrk2ud6LEQNuJ7j7KLG53Fypr
         HYESEoraOKbbzWFfiGexu4qZ1/Ad+7Qk/GiaWNVP7VpThsbpHKbGaRrXoaWnJfr7SnsC
         JQ6ej0T9tVEYi8+r4AmGIC6CVldsPdZ74iCyPJgCmvguGNxCj39IyT4D13tCvcR1tk1q
         /v6A==
X-Forwarded-Encrypted: i=1; AL+hErHsrBK2EeL76JAsGi6IWZCsvG3Ky9rG3rwFcp8FqsvOIWL1q7lt/KQdiyhpY14ALEFQqWn4UNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cezGFc8WF3Y6ndpzOlx3R00CrXo5qtljUVf86q+CAv+23Yyu5
	TKe3cbK04m0K3ZKdm8HRHAAWpDfz4yZmDlW7+RNsFUhkUly10KSGiBI=
X-Gm-Gg: AZFdTZeTlaBxNYUPkGGxFzxKWsG1nw7bnYz5s7U3u9LJ3tA+BGyKrAv/3NXQnWqJIPN
	8s/HDnrHTYtvr3UoNY4WfiTpg0n/CPT5HpFn/KJBig8rseITOdw9IjB+5UkqJm9tqa2IBHMrPkI
	tteHplPrU6/noy/hj7mPg9jKgXXBOuc9D09ge9F8D866RjTieehp2EBNlHGVGeCWyrhvslpMnw6
	fQTFRvhd4REQEsIMOSK7N7/A0X6cFcWbb8Ftxu4QnPcMgOR0/wcVRSPhPAp3jEdctCw+Wkv8Hdw
	XYjGUMO6gRqn+Y4hq5pewusZI81We/XMf+eVq2r8091meVJsIbcgK5ouOwCAHR0oMpvjlrPSZe0
	uK9PbyUnFBd5aCw2EWlxKDyV4qAPIZziYZgTIxP+M/cOKvwElQHiFAKzbqQog/B0s0Rz6ONL9GQ
	/TCCF7ddJOgwfeplHd4Kvm7UVZKNhTALwnFhhsghLMiKu9LlAm2jtSMx5eWLZnuuU1vfQCcUbH1
	/P9dcsoS7QHyK6b8zy98NmI7ousYQyK/ervyzEchqVsLK+/JhxmgSkWFVWkPeXv9k5YQ33+HcEX
	m88J2x8+GoLo5VVARXHx9QdPbc2sO1I2xhL683h5L9YoR7Ui0GwUE97bP72zVvndvcm16Ym0UN8
	y7A6/vCkfgDVMXQ==
X-Received: by 2002:a05:6a00:4189:b0:8a3:23c1:c0e3 with SMTP id d2e1a72fcca58-8c87ded5130mr18749858b3a.59.1795685884373;
        Thu, 26 Nov 2026 01:38:04 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm10357231b3a.14.2026.11.26.01.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:04 -0800 (PST)
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
Subject: [PATCH net] fsl/fman: Drop device references when dpaa_eth_add_device() fails
Date: Thu, 26 Nov 2026 17:37:56 +0800
Message-ID: <rc-b1-20261110-vc-177-85d2478ac4b9@gmail.com>
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

When dpaa_eth_add_device() fails at the end of mac_probe(), the error
is returned directly. This skips the _return_dev_arr_put and
_return_dev_put labels, so the references held on the FMan device and
on both FMan port devices are never dropped. mac_remove() would drop
them, but it does not run after a failed probe.

Jump to _return_dev_arr_put instead, as the init() failure above does.
The devices are created from the device tree and are not normally
removed, so the leaked references have no visible effect in practice.
The MAC state allocated by init() is still not freed on this path, as
in mac_remove(); that needs a separate change.

Fixes: 1dec67e0d9fb ("fsl/fman: Fix refcount handling of fman-related devices")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_FSL_FMAN=y, CONFIG_FSL_DPAA=y, CONFIG_COMPILE_TEST=y; baseline and patched mac.o, no new warnings.
No hardware or runtime test was performed.

The path needs dpaa_eth_add_device() to fail (allocation failure or a
platform_device_add() error) after the MAC was initialized.

 drivers/net/ethernet/freescale/fman/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 29c2fa2be837..4180cec15c0f 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -307,6 +307,7 @@ static int mac_probe(struct platform_device *_of_dev)
 		dev_err(dev, "failed to add Ethernet platform device for MAC %d\n",
 			priv->cell_index);
 		priv->eth_dev = NULL;
+		goto _return_dev_arr_put;
 	}
 
 	return err;

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.50.1 (Apple Git-155)

