Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521894;
	b=xeXvXnowHyO8sLJ4kFnzfc+dy45sDns5RtgSJgFKrP6Hfh2dXVml/62UOpY3NVeTe7qa
	 3BvMi3UhibTKEm9YKYbifptK3cFSu0GJyhiD2HZxNZlrbFDgwVezZw22JNhc1rkSdR529
	 60o5FVHtyaSYsTnSsdciE0HWPWaoG2ee7ZgJ6c/obd9ONijIB3LML7ztsQgC7OBqqyTXW
	 LuHQhzanTGPARDWfl7/60/nRdpqi2exWYXjb2F3M6lIQ2hdbBuzCfO3fT+TSbeZWTzval
	 pAAXVoJJ2sAEsKqNuW2k3D1NB/tx9Vn4JxRLRLEx/rdUf11OB64RcTVpPOArpi8QdLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
	b=FkIqbnoLqbEG7+fNrkUtiKgM8cewelhxm3gJZ4IyMOtKyJZh2C8d2rYrt2RiSvdLqMf8
	 LOZnu+d9n5zOMSzrdDJKwJtlpCunxLxCZkIjHlO21mYtg2FYDR2uW7X58XHZrZnPUduQO
	 Vw1nJ3Ydl0Ts5pn06BfIS4fsmixdgNGXx8a4h//ysWQgF1n2xRNHur1Uii2nkEEm48eVq
	 4no/qJntaciHem6OTMw46GrKEMLYdmEKNKmjwpjNQ1d4KjwZSj22YsfY0avpKd8dszr8g
	 61eZVU8OtFvk6Aa57rO8Cf3ia7tBAg9HRAcwSaWGge49uqukF/Pqgr5B1XYZRSXV8nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ztCxAWJc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2A606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C2A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ztCxAWJc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so45054205e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521892; x=1796126692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=ztCxAWJc1VAJUL+s946mNlM8AQeOvHWKnVcsbgNxSNGCvdyV1EFBs8mAn8XL+ZORVd
         sdWFEyucK751/D2uMke2PzypxyR7mhA+JNg20NX14tgmi16Go5mPBNKLmD2iZ2F+tO7s
         HRV5B29lda7/fF8BzbP8VBI1WfioyI43Jw7LU0DEUqsBseOBWbLVQm2fMAquAqR/UpTv
         VQzu5c4yorYOibgSj5n18Zjsd0Z1hBY1qjgtbS7XUbcj4My6Ryy3SzNQUcErDiqsj7Ui
         L0rxBhHJKNC6XJKw4lY3ILXNXW+W/gMjQgtOAAlJNlIfdsDZK4+QciwtR7LrkOF4ipAm
         Tc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521892; x=1796126692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=r52I9cUuCtSngjeZ4JMqO8a2BZIRj5YVBZvE6ws8PvTmhscoU+Ephbo6mwEtfRAEud
         rl+/FiRJtBGY7bq0Bp84sgPKuJmPrMsCPbTd0FOjvmHN4vTiORtjCYmDJs4wc0Ld+nOV
         PEerk9ckODKBTE59u7pckuF2p1wKstLmMvxf0lqWYeeyud8cY7Jf5tIDTgfC+CcF79MF
         VJGzfL9WMcaX8QnNxg+bhTVDsr1PbrW5CyZphDFqFzCmpZmRrZupku5+v3FjiB6RW7C4
         G7ihKGj0AZTlG7FsYNwAkDzrZ7xjHIyk+A1+MSdZE5aLaWOJVznd1J/FLIphOJgk2dbH
         CXWQ==
X-Forwarded-Encrypted: i=1; AL+hErHO8XgEhz4vVCmWvNti3dh5tILQ1Bq4k7mQ7WfciQCFz8jTaBlM6/8upucuBRFuCUyZfaaFC/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8raIPvJN5NOhxLbzsGT7iqTXFwS6E9RuW9KUKPuZVnlCuMnoKT
	eof1x+45RqMUquzkI1hYY4hnYh4bqByw6LF+qo72oCjyXqDyDB0VheqoB0JKWDSNpo8=
X-Gm-Gg: AZFdTZeiOKABIr0lFfdN4Md2XSyoJw1aSV23JmA6xxwtn082IH3NFZEciU5iIGNQGJ3
	eL3/mgY9jYX72+61LUYqnZVZk6oQqSAjgVP+ch4ZgdggNleyLPL64KGu2pEdwwn8o2exEjYazfX
	J+T7Dte9LtIIhh+WVxPF8JnaHq52EIfbURCJYkoZo2q3vVBmdhcENX0uKCh7LCnuE/oY29VYqHX
	ffy7MaCBm9gYwu0Xc4ta41qgDSh0x96vbHl99FoyHKsznyIycXCm3IPgS13mG6Ni6blLMHW5IR/
	aivnW5Xzb5j5teZJQhcjyhkg5m/SlFN0BsSzc1ZVE+xfKpHnmOQJdgd3wXnF0y7FNQ+jtdP3PwI
	CpWL6QpzR7CLlXC2hzEb+dn4kqK1aEYlEGtYNfp7Un1yCw1XKBy/AgJaNPx81vxJcEpVxYX+Gqf
	EDaI9aP6XjnqKyVTk6Llu/HCFJplB1CNnFs+SJKtf1HhCfny3+vNPxj4UCxl5cX4x31U7U71EDU
	hmLz/upVTcC8r6ggzqhTmRgEBqsXv7u5T7YLZ0QDDtwdHmmZUvkURX3EyYr8w9gTv6m/auHSL0P
	TjQsed1mrHdvfg8WQbfBH8Wan0fDZruvgXbxrvPTfNMIV9FLUk9WKIYwuKcYn8T8ytZBct4aFZj
	KkgKaULrH
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb9de0d5ffmr64185675e9.25.1795521892212;
        Tue, 24 Nov 2026 04:04:52 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:51 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:32 +0400
Subject: [PATCH v4 2/5] net: Accept MAC addresses from longer NVMEM cells
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-2-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=alchark@flipper.net;
 h=from:subject:message-id; bh=niDymIQqvfRIIXXdqI/TGZmfY9YHOucl+/lAZoeizp4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZXZqQ0/bSZxXNP9Hn06upbPoGeitm9n4su2avFi
 86+E17aMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFR/ucTIcCVAYtO/Sf5nGx6silzcJuR58W9xqaVavUtavJ/e4iPFrxkZNi0sLzY
 7q6F4e63J1AW801YtWhkh7MP7zerfD2eOxefuswIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A "mac-address" NVMEM cell may contain a longer unique hardware ID,
beginning with valid MAC address bytes. Both NVMEM MAC address helpers
reject such a cell, as they insist on exactly ETH_ALEN bytes, and then
discard any tail regardless by doing a copy.

Accept a cell of at least ETH_ALEN bytes and use the first ETH_ALEN of
them, leaving it to is_valid_ether_addr() to reject unusable content.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 net/core/of_net.c  | 4 ++--
 net/ethernet/eth.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248..d4a256521954 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -85,7 +85,7 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}
@@ -108,7 +108,7 @@ EXPORT_SYMBOL(of_get_mac_address_nvmem);
  * because that is the default address. If that isn't set, then the obsolete
  * 'address' is checked, just in case we're using an old device tree. If any
  * of the above isn't set, then try to get MAC address from nvmem cell named
- * 'mac-address'.
+ * 'mac-address', using its first six bytes if the cell is longer.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index 39aab0f8035a..b69ef0eb16f8 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -508,7 +508,8 @@ EXPORT_SYMBOL(platform_get_ethdev_address);
 
 /**
  * nvmem_get_mac_address - Obtain the MAC address from an nvmem cell named
- * 'mac-address' associated with given device.
+ * 'mac-address' associated with given device. If the cell is longer than a MAC
+ * address, its first ETH_ALEN bytes are used.
  *
  * @dev:	Device with which the mac-address cell is associated.
  * @addrbuf:	Buffer to which the MAC address will be copied on success.
@@ -531,7 +532,7 @@ int nvmem_get_mac_address(struct device *dev, void *addrbuf)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}

-- 
2.56.0

