Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115058;
	b=YDcvyf5/gkYuS3zK4DRmh4pjAxU0MJI/yjCgbMXQ19HN3OwP1/qhacf7R6/wXghHu3ne
	 SPYutaAJLpnKebb5YiyxK5L9nSr2kQP8FinBNe1ZpIKIIRe621NDr1b6gZHG3UxcwpigB
	 2XL3+LPAdo610/wN9JrqJkTBW6gVzaHE51b43FwnlHGBxsYU0vOw3ICI99XrWhgFzStia
	 yUJuYsQrhX/RqOEpVUapEmgb+AWHQz6C2pCUrHTsA86UWE2EyXoG8XHPRycxcMIJJDBuM
	 9QiAsxCVtn8iO1jiUOuSI5oN1f1UAALyKKxKuYE6EO/ug1zt0aqnnC7110X2fXKnQuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115058;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QJmqYSINBFIg+HZP7Om7C/6gGEbzaQfQG6G6UpClr4I=;
	b=BROu6brbwUKQxL1d/YIiEWQUkD8VRvgoEju5REMslbYIj55QLohHsVpEeR6AD2Bo/yE9
	 33pj/4CliJ+zSWUzuX2v+1zOTz1VjPpNhtnfNVrtlCOqnoHwJHE0UiLDVjJlttNKNTFWS
	 ccJPAq9TGA42poNjNqWpWejRRFvgEv++M/l0FUx/JBnkGmRrU2xQ+uDxmptajpdhwrMDf
	 lXCwahEMWOK4LIqxx/ZLNG4/gaooyaMUIJ2jYZuao+Gk3YbEfnCVpRZDMMtgNBsdxPdkz
	 c1vYCbjwdjN3/t5zvNec7vDm79aykUvcjhgKHREbx57PYJypK+CZY/V/hEiXC4L2Ymw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="HA/3/Nhm";
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20060A2627
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD20060A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HA/3/Nhm
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-380b40319bdso32221eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115057; x=1795719857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJmqYSINBFIg+HZP7Om7C/6gGEbzaQfQG6G6UpClr4I=;
        b=1RcJKV7ks8DaBdtXpsIXqrZzlgEYeDW5AKPDuateiVHgDMItus9acyv2denugyn7e5
         MhTPzboE3uo0pl6SAw8W3gMFYJTV8FdTmdi6nNvoA8nrR6o7LLCX5D3E+Ki/NeDEh9Ip
         N5XzgrQKFb4AKp92yZlNTX9o0krWnZDSgazcFZQiOopzlE8BcMuCCqT71KW+3heRjK0m
         i2ZuWkDWqy6r48XxaHJKzTCpnGk9zaqUObh5bgG6fdoj02Wa9tslpXt8ahEtQr2fBY5c
         +u4sOJsPfG4Y6gmYLlJvSXBkaiUr22+dDz2EyV07kciNRdaEunE26hQqiA23GlEVB9A4
         bO3Q==
X-Gm-Message-State: APuU4Z8dtkWCW+zypxHnsRup46zmLFBsxY7uWGGuWAuRN023fQd0+DuE
	KycJZmcI+b5TC2CXM+TzFJ9w6Mk97eR4HS36+1OoNrYyxg/dZ3D/3kpTgUFnNM/7cfWRRn7wvoa
	4m2sjU0enReAuVHq4QK79CdHZx76u5faLEWe6LDPbg31ZdjJzSkaMy7ymog8KWW60xYmRrIvML6
	ARjKQY/as1JjwLz6rPcrhR7Cvwder1Rv3sOanSoPAAZd1NBqngh4iZahi3ar18aQbnKbzrkfKMd
	BdnQgNG8Y3Y6mEH
X-Gm-Gg: AZFdTZecVATiMjIBlPiGUfaeiPcOQQXzfpAr1wHzaI8qjm0V210BOg23iXyb5/7vNke
	CAkfi3Q7599YFuV2lmhpoC6SgG7wy210KPtbZeioz3bjXo3+zdGMIGZcOJyYM7mExqS0XFHTiv4
	PzHKTEPOvFzQ96nZ2deyXkS1gK/uMAMRH87A32RQ7/+hNum/esIUh8aV2wW6Ui/GI3wC8ycKtQB
	9y4a/Y5dnv68olthCrCDH3L6QUqWqFS7M8aXOH6LfSDE0N+3lhQQrdisceRM3TdHwLYDfIh3qSH
	4pHttZk175WriWI0Dl0phOpaESiJamr2wVYSZDs5jAQq+X2Qirq+oVuv+8tTpv5huRCnoS7v7Mo
	zF7+rx/4pdfoV2JFBRubTY8j3iD/t09bvPiqN0SdKAKwBZyz+da4yFKwW3/H+GeGQ2aC1zqMzS7
	J/ixB/PkUs+a0lTEzlj+YSf8xNKL/6rRe6iKaThgbbrdY=
X-Received: by 2002:a05:7301:d194:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-3856925be77mr243852eec.0.1795115056644;
        Thu, 19 Nov 2026 11:04:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38567ea2a72sm28848eec.27.2026.11.19.11.04.15
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso20471885a.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115055; x=1795719855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJmqYSINBFIg+HZP7Om7C/6gGEbzaQfQG6G6UpClr4I=;
        b=HA/3/NhmYMNlPtI6zo5YsfMsdFQSTWa0WMGVNvBDiFY0i61/zKXaX/9AsdlVWA85Kk
         nzwXL8/oQ5kckuTT69yxr0AfvWYAH5uibU5ftMi37eH4dUCQePbKf+jgq33P4ANUM9jA
         dI//2NauaMApYY+6YnPMY9qsRhuJ3wvqe6Bj8=
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr99007585a.40.1795115054799;
        Thu, 19 Nov 2026 11:04:14 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr98998185a.40.1795115054234;
        Thu, 19 Nov 2026 11:04:14 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:13 -0800 (PST)
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
Subject: [PATCH net v7 5/6] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Thu, 19 Nov 2026 11:03:47 -0800
Message-ID: <20261119190348.2317702-6-florian.fainelli@broadcom.com>
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

BCM5325 and BCM5365 use an 11-bit bitmap for the mirror capture port,
whereas newer switches use a four-bit port ID. Programming the port
number directly can select no destination or the wrong destination, and
can select multiple destinations. For example, port 2 requires BIT(2),
but writing 2 selects port 1 instead.

Use the bitmap encoding on BCM5325 and BCM5365, including translating
logical CPU port 5 to hardware bit 8. Apply the corresponding field mask
when checking for a conflicting destination, replacing the destination,
and clearing it after the last mirror source is removed. Keep the port ID
encoding for newer switches.

The ingress and egress mirror source masks use the same layout on these
switches, with the CPU port at bit 8 and bits 5-7 reserved, so apply the
same translation when setting and clearing a source port bit.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 35 +++++++++++++++++++++++++++-----
 drivers/net/dsa/b53/b53_regs.h   |  1 +
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 19e36e51be52..ffbf5efd8d95 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2604,6 +2604,31 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+static u16 b53_mirror_capture_port_mask(struct b53_device *dev)
+{
+	if (is5325(dev) || is5365(dev))
+		return CAP_PORT_MASK_25;
+
+	return CAP_PORT_MASK;
+}
+
+static u16 b53_mirror_port_mask(struct b53_device *dev, int port)
+{
+	/* These switches use a bitmap with the CPU port at bit 8. */
+	if ((is5325(dev) || is5365(dev)) && port == B53_CPU_PORT_25)
+		port = B53_CPU_PORT;
+
+	return BIT(port);
+}
+
+static u16 b53_mirror_capture_port(struct b53_device *dev, int port)
+{
+	if (is5325(dev) || is5365(dev))
+		return b53_mirror_port_mask(dev, port);
+
+	return port;
+}
+
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack)
@@ -2617,12 +2642,12 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		loc = B53_EG_MIR_CTL;
 
 	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg |= BIT(port);
+	reg |= b53_mirror_port_mask(dev, port);
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 
 	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~CAP_PORT_MASK;
-	reg |= mirror->to_local_port;
+	reg &= ~b53_mirror_capture_port_mask(dev);
+	reg |= b53_mirror_capture_port(dev, mirror->to_local_port);
 	reg |= MIRROR_EN;
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 
@@ -2644,7 +2669,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
 	/* Update the desired ingress/egress register */
 	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg &= ~BIT(port);
+	reg &= ~b53_mirror_port_mask(dev, port);
 	if (!(reg & MIRROR_MASK))
 		loc_disable = true;
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
@@ -2663,7 +2688,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	/* Both no longer have ports, let's disable mirroring */
 	if (loc_disable && other_loc_disable) {
 		reg &= ~MIRROR_EN;
-		reg &= ~mirror->to_local_port;
+		reg &= ~b53_mirror_capture_port_mask(dev);
 	}
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 }
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index cfdb5ed38326..ee049927a63a 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -239,6 +239,7 @@
 /* Mirror capture control register (16 bit) */
 #define B53_MIR_CAP_CTL			0x10
 #define  CAP_PORT_MASK			0xf
+#define  CAP_PORT_MASK_25		0x7ff
 #define  BLK_NOT_MIR			BIT(14)
 #define  MIRROR_EN			BIT(15)
 
-- 
2.53.0

