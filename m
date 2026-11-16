Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863397;
	b=pozkZw4GRPOdzCvCcR38gRn82sIusc8mNl+siftD0wABapXdVrtSTEBhC48XYwyjAsaP
	 hQzEghNl3XK/6dkO5aNFs9d2hVTLfq8hayUMWhR936EUV07ZXNW25M3S9/Zqql4fELuqy
	 IBWG+xGcE2K3edk+s/VOuNbh/zlfUnNzlQNi2X42dNpwZ8dO9cHJx5RU1fZUngfA0kTAR
	 wfzr3wMzcPPRxCSr40SDSqetFVt4Wfi4TMEbOqi/mC1Ju6n4mDAAYhEBaLW/6WoRQzFr9
	 W6/FtfHQov1BIfX+u+itIZrVu4Zur5W/UlvVDpJI1SM0VR4xpg0e1yg68dmM9bUDfIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863397;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=b+Tq+JzazEzZKCyciOayH6RZTF4kctIYbumNKqLHuUs=;
	b=3QkHW38/KkADNXCVz5Q5pDzDCsNHqUdnAv0snvFpYkKEOd9XWfFz0QpUkcHklL7IEuWY
	 onPj4KzjmW5Ghxnl3hiNfN8lFY0B9sWxJ/G8wdOhZMOWt61aOqgTlGNW030d30OMFGXAB
	 A5D9YWY0D6+HCH/W5/dc5j1G7Y9BSMJwQjeC7aoKJfjCgdCUMad1ssLO4eV++oZx9D+wF
	 3qnUVTdQh5wxi9tUFmwgfFyjQiuEue+eLnUgIertVrtN8XuMDzX3+QTygmVWdMQk6sPY0
	 Cip1bl9f8V3m3hj3+99j2XFttJ3HBCCqwUapylcUgVa+b+AjpS1BtYDVS7mRQ2v1oJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3cVc0XW;
	arc=none smtp.remote-ip=209.85.217.98
Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59174606A893
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59174606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3cVc0XW
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1203174137.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863396; x=1795468196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+Tq+JzazEzZKCyciOayH6RZTF4kctIYbumNKqLHuUs=;
        b=m1dzMVxkLRCSkPuVsje4XQKwOmExuu/XJLsA5CaY6nzjeoW6AVKxYN2a9ztQkq6jUF
         GF57D3LuNZt7oIb5BflYEr3Bjr/MMwIx9r2pjg4+OAIeToBLEacYhrWSVQHUUC7CeM8L
         RDGCe/eF6e631x32K/Bed16tIlSAQTkHdfScPgMpQL5HsPEFfJP7OskIHKDeE+iiT4D4
         2+3hLhQ9zlODbiRI2c4hJJD7Z6NL0HFql1i1i0JW1MPtBGgGO8FVYPYoqI9uMl2T88tO
         T+uo8dKfJtrJqbmB1kCAEk1RbOnkTfNJfCZL5ofKrcIrMdrWI2LR0spHPU5iyA0anFGD
         Es/Q==
X-Gm-Message-State: APuU4Z/qfmyp+M5HMuz066nR4pdGuiENZ7AgB/TozoBj0vZUmE+oiTxw
	4Faqe4S1zCTOFnhOCBxJq03tiA7jYYC5Qc5aX5J2/5jaumqnBPGS7SdISE3wK7Nody+ZgODwUQE
	Cmon7MHF0QBRpL+Y0F/bj6HTwO973tX0DRtyYTq6d8eFjonRtMW8sS9CRljCIt0siQcg/U5oGZ7
	dO5OmiM1RU+eFFAO45PbKxFvnFQtkFn9byJP3IK6M9DPKti4dIZaRegYJuAzNKPThCiQELfGzkL
	IvLMmvu8wiK6DZC
X-Gm-Gg: AYBFou1ciX628HbjMBUlkxdGOi6b+zxcuy6rJJzHx6QX0lzouIGFTJ+B+L/VIdr+G7F
	0gN2I2yIeZohkSxLIEZk/EF92zOgmfpJTqfvnzarg5SaCpeEAWYmY1Kc8o/upfn93Q8QSAuGKSs
	9hgrwC72rrwNjTv4+RZ6bUNoqNvOTr+71PdZxGIMwRWGVfk66trUtSCMCuHxMNgTvuYpUx1FyPB
	xc6AnUjotUxt+MRq/aC7XfneIW/nD0XVX4kCLNozCJFBXx59Ww49inXtxIwY7diGUE75qH24a9e
	7KC+SXvD9SaCfVd0aP1o6nA/+r5YdG+R5a8G23S1cRUL7mACdb+FY/gj8F5WKDzp6udP9L98EkK
	mZW8X91wSyYxcSWwU6P7jQu40dbfXlM02Hf2CWOhA67v4jNAZASuY9x4mi8I8gTXgtz4v94dbcM
	Xxib++P38Mv+oLWqOIoZA81TaSdmMobJcZJLkgoPQMJ1M=
X-Received: by 2002:a05:6102:3e8e:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7d64d7454e6mr3411497137.14.1794863396039;
        Mon, 16 Nov 2026 13:09:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e3387e34asm88633241.11.2026.11.16.13.09.55
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920f97bcad4so8655316d6.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863395; x=1795468195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+Tq+JzazEzZKCyciOayH6RZTF4kctIYbumNKqLHuUs=;
        b=M3cVc0XWj9fyB6IM7iR72Nyzn0lx6pjuqa8E0gvBRVdmWJPvAmSetK2SqUIF7Y46+a
         hqGWdHNnZIDeFsl9GiOLCmzjk3oy3mmPFGPZhHDBqtYw123rjtlgDMqYF9h2HKLxHFN3
         TrPTBL/ZiVODFfQgiez9Ebjbc9offWz8X1H7M=
X-Received: by 2002:a05:6214:3186:b0:91f:1719:73cf with SMTP id 6a1803df08f44-91f2422cfc4mr182685396d6.46.1794863395245;
        Mon, 16 Nov 2026 13:09:55 -0800 (PST)
X-Received: by 2002:a05:6214:3186:b0:91f:1719:73cf with SMTP id 6a1803df08f44-91f2422cfc4mr182684726d6.46.1794863394497;
        Mon, 16 Nov 2026 13:09:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:53 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 4/8] net: dsa: b53: reject conflicting mirror destinations
Date: Mon, 16 Nov 2026 13:09:38 -0800
Message-ID: <20261116210943.1352656-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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

The mirror capture control register selects one destination for all
ingress and egress mirror sources. Adding a rule for a different capture
port currently overwrites that field and silently redirects all existing
mirror rules.

Read the capture control before changing any source masks and reject a
different destination while mirroring is enabled. Return an extack which
describes the hardware limitation, and propagate a failed capture-control
read rather than making the decision from uninitialized data.

Also clear the whole capture-port field, rather than only the bits set
in ~mirror->to_local_port, when the final source is removed. This is a
cleanup, the field is ignored while MIRROR_EN is clear and is rewritten
by the next add.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index dac6013f8fe2..64e04c5731a6 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2606,7 +2606,19 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
-	u16 reg, loc;
+	u16 reg, loc, cap_ctl;
+	int ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
+	if (ret)
+		return ret;
+
+	if ((cap_ctl & MIRROR_EN) &&
+	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only one mirroring destination is supported");
+		return -EOPNOTSUPP;
+	}
 
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
@@ -2617,11 +2629,10 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	reg |= BIT(port);
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~CAP_PORT_MASK;
-	reg |= mirror->to_local_port;
-	reg |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	cap_ctl &= ~CAP_PORT_MASK;
+	cap_ctl |= mirror->to_local_port;
+	cap_ctl |= MIRROR_EN;
+	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
 	return 0;
 }
@@ -2658,10 +2669,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
 	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
 	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable) {
-		reg &= ~MIRROR_EN;
-		reg &= ~mirror->to_local_port;
-	}
+	if (loc_disable && other_loc_disable)
+		reg &= ~(MIRROR_EN | CAP_PORT_MASK);
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 }
 EXPORT_SYMBOL(b53_mirror_del);
-- 
2.53.0

