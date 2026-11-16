Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863407;
	b=bynW1sqdv1pFCVgcX3rFS3dVTO4zMBueCfudM1epssh8HbP7UtfLt5fkkXrOrLE8P5yt
	 rlceYPOSd771iUoPIR1KCLx30FbwCMA/9ol/GO+MLqkuGJETI3mAy4tQEvQx48vhw+0zz
	 d+7cD4LV7p/m9AQXjeNEFko8Tu1cyzC9rN7SYGrZs5/vBhQw/bt/P06lY+EIeM/aPz6/N
	 bR7Cu7ViZTo72NGdfA7U0BS9KNPLDLzmkcDvFjngKOUt3m5a3j5v42UKD0DTM/uYf4Xo+
	 cJF1NjFUKk8kuyAYetRevUNY24SChpGshy+y4wJFB6NYWRE5axTGhc0x6d6d8T5YWuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863407;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AOBCkUgeExf+j7oQX+n7eUL1E2EGqrF98OLg3M05nF0=;
	b=aWqHPaY3xHbJgnWCfaFRu0j+qgwlBybrel3Zu429FtBV88nJ+LuTP3/3Rzuu28wToZA9
	 2yv747FmZsg0twzOu2uJDLqojAuQjcnIJgYYW7Nc6krOknk/Sm5QndsJaWuurnHRsf5tR
	 Xz+Ds/25ajp71XzwX+uUMaNVHyfpGFlTbE3PdELIpd84oejaNj3mlPzsUWtw/1ukICwAz
	 IQOcd5xCvrrOh0QlXW7kwK+4qmG7htvqUPoB9r+9sVxCLY9apUcDfQFDc/mhk5Fy8vfst
	 Q/b7B0ZUPGXJ4aW8qlsuW2heCtL83jpeRx2md5U/bapr2VjPzyJJBvi2WTzuenw0z3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cAIEitxu;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9921606A89E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9921606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cAIEitxu
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso105949a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863405; x=1795468205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOBCkUgeExf+j7oQX+n7eUL1E2EGqrF98OLg3M05nF0=;
        b=D4PS6yWGLb9tOLrzfrPnfgwO0sFwzzH8D7XFVE8MJYAdfVT692VwRr+8YHyEN0IwJ3
         JrLY1/xFXnLa0zxSObWWyqoo4Y88C43ndekInJIOI+trYU8I6gRgMIR0DUTfkS8Zxnsq
         uuH/aCcrvlpYZoN1oCUzrc3rvy8zwu4qHDvUZ6cGA4mTJ+wd62fuloQ06VwBMtdUaSmn
         IGyVY9sI4jGZqnrpSdrs1FpbDdHgQCFDiWEgMceAlQW2BA/Bj02oFfFhci1Jq4fO+mX/
         lyjayNc4Xkl9hLhyuHRSpMWBZv94/vKEVZGJZ3i+Ln1QUEuBhK2Frp3qk3P9gAxEPxkC
         MSgw==
X-Gm-Message-State: APuU4Z+Ukj6E/C83y60QHEeTCXUMNo0APuEGHolLBj+5Rhy5iIZ/M0RF
	o3bS3lzy5Y21BJdH7kqRz9KMuMq9fz6BlTqL0KgJLkAuohFvmU0I7WQy5I54dDwh5Jgqmfig4rd
	oOALM4jVltIWRINAd/sGCP53dSH7qagNWk4RMGYgxZRSPL+7r+BNfWXV0DsdXtNL1KIH6vCvh8I
	d+yMRFtmyq1Ry5jjFlrx5R9+k3ONm+y2fCLy9di5KAiEqw8eFra8lrWZWbHKsylLy2+7/JGbguP
	sOQcK2MMZ4ErNFc
X-Gm-Gg: AZFdTZf12o5+/nNc+QKH9L1lp7mlAvzvTI7CR1rB0JEauJYSuhr8E4nRiG/9ichgNgD
	82RBeGn7Q92vdSJnHcqQOTVGk4XsoMfZZ6P8lIVxpEP7gitLlxNKzKPWAOlEdQEyl5oJpL360DI
	eZ3nN3JLJ6dvSczqZiVqNbna46noTPbDDCYFT0HgnfVAXbEY7Fv9SWwbc6Y21lxXlKBucMXQmv6
	sWE9pF7yttLPKKlNpP3/3uEWiRzhCFYWUor1MxmaiH/CKdmUHR39iSIB7xgofOBFMucX6D+1d0Y
	u+g9bgC75WI2futcVuUeM+VatbhrDHe+k8c+fLG2qT1DHKNeRHu8KncyYIYIeBABGYpxm749n5p
	eHLIpdBKTChhT0UkAXank2XzZDH2kfcz+rvPsWHegMzzg/Y0IpHM4zwIF4d692i0uXSzhD2aanA
	1RRXhIDuTkBX5URijfrtot0g5X/Yso4W5e6OW/r/Lt
X-Received: by 2002:a17:90b:548f:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b3abd11ccemr435733a91.32.1794863404978;
        Mon, 16 Nov 2026 13:10:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abeb5fa2sm362737a91.7.2026.11.16.13.10.03
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-54af6c38073so6318221cf.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863402; x=1795468202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOBCkUgeExf+j7oQX+n7eUL1E2EGqrF98OLg3M05nF0=;
        b=cAIEitxuKZ6wLpMSDtUUvevcJhvpuvShU8CpLs4sFKWYBiYpqPgmyjeFdbO8+WgMi+
         6IAYjod/EPK9nlQDLVJmW0ysA2Fa3vavPVpBiuP8cyW0UALurylXXitQflCad4sPbIZ1
         Hg5Nkq5bKAJbNftFiV+buLnAvPcQWvIhyESS4=
X-Received: by 2002:ac8:5dcd:0:b0:55d:2e33:a614 with SMTP id d75a77b69052e-55d492fffacmr12942651cf.3.1794863402323;
        Mon, 16 Nov 2026 13:10:02 -0800 (PST)
X-Received: by 2002:ac8:5dcd:0:b0:55d:2e33:a614 with SMTP id d75a77b69052e-55d492fffacmr12942121cf.3.1794863401778;
        Mon, 16 Nov 2026 13:10:01 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:10:00 -0800 (PST)
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
Subject: [PATCH net v6 7/8] net: dsa: b53: harden mirror register programming
Date: Mon, 16 Nov 2026 13:09:41 -0800
Message-ID: <20261116210943.1352656-8-florian.fainelli@broadcom.com>
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

The mirror destination check can reject a first rule when a bootloader or
previous kernel left mirroring enabled. Not all supported switches receive
a hardware reset during setup. Unchecked register accesses can also
corrupt mirror state or report an unsuccessful rule installation as
successful. Reference counting must not record a first source reference
until hardware programming has succeeded.

Clear capture control and both source-control registers during b53 and
bcm_sf2 setup, then rebuild the source masks and capture destination from
the mirror reference counts, propagating initialization failures. Since
bcm_sf2 runs setup again on resume, this also restores active mirror
rules after suspend.

Check all mirror register reads and writes and only increment the source
reference count after successful programming. Log deletion failures
because the DSA callback cannot return an error.

Use the source masks to decide whether a destination is occupied. This
preserves the destination when a failed deletion leaves sources enabled,
and permits a new destination after the last source was removed even if
the final capture-control clear failed. Program the capture destination
before the new source so a failed destination write cannot leave a new
source enabled. Clearing the inactive capture-port field is cleanup.

This builds on "net: dsa: b53: reject conflicting mirror destinations" and
"net: dsa: b53: reference count shared mirror source bits", and must be
applied after them.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 91 ++++++++++++++++++++------------
 drivers/net/dsa/bcm_sf2.c        |  4 ++
 2 files changed, 61 insertions(+), 34 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 98696bce368f..deb331b3629a 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1360,6 +1360,10 @@ static int b53_setup(struct dsa_switch *ds)
 		return ret;
 	}
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* setup default vlan for filtering mode */
 	pvid = b53_default_pvid(dev);
 	vl = &dev->vlans[pvid];
@@ -2654,14 +2658,25 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 {
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
-	u16 reg, loc, cap_ctl;
+	u16 reg, other_reg, loc, other_loc, cap_ctl;
 	int ret;
 
+	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
+	other_loc = ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	if (ret)
+		return ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
+	if (ret)
+		return ret;
+
 	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
 	if (ret)
 		return ret;
 
-	if ((cap_ctl & MIRROR_EN) &&
+	if (((reg | other_reg) & MIRROR_MASK) &&
 	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Only one mirroring destination is supported");
@@ -2673,19 +2688,17 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return 0;
 	}
 
-	if (ingress)
-		loc = B53_IG_MIR_CTL;
-	else
-		loc = B53_EG_MIR_CTL;
-
-	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg |= BIT(port);
-	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
-
+	/* Select the destination before enabling the new source. */
 	cap_ctl &= ~CAP_PORT_MASK;
 	cap_ctl |= mirror->to_local_port;
 	cap_ctl |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
+	if (ret)
+		return ret;
 
 	(*mirror_count)++;
 	dev->mirror_port = mirror->to_local_port;
@@ -2700,8 +2713,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count =
 		&dev->ports[port].mirror_count[mirror->ingress];
-	bool loc_disable = false, other_loc_disable = false;
-	u16 reg, loc;
+	u16 reg, other_reg, loc, other_loc;
+	int ret;
 
 	if (!*mirror_count)
 		return;
@@ -2709,33 +2722,43 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (--(*mirror_count))
 		return;
 
-	if (mirror->ingress)
-		loc = B53_IG_MIR_CTL;
-	else
-		loc = B53_EG_MIR_CTL;
+	loc = mirror->ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
+	other_loc = mirror->ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
 
 	/* Update the desired ingress/egress register */
-	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	if (ret)
+		goto err;
+
 	reg &= ~BIT(port);
-	if (!(reg & MIRROR_MASK))
-		loc_disable = true;
-	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	if (ret)
+		goto err;
 
 	/* Now look at the other one to know if we can disable mirroring
 	 * entirely
 	 */
-	if (mirror->ingress)
-		b53_read16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, &reg);
-	else
-		b53_read16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, &reg);
-	if (!(reg & MIRROR_MASK))
-		other_loc_disable = true;
-
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable)
-		reg &= ~(MIRROR_EN | CAP_PORT_MASK);
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
+	if (ret)
+		goto err;
+
+	if ((reg | other_reg) & MIRROR_MASK)
+		return;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
+	if (ret)
+		goto err;
+
+	reg &= ~(MIRROR_EN | CAP_PORT_MASK);
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	if (ret)
+		goto err;
+
+	return;
+
+err:
+	dev_err(dev->dev, "Failed to delete mirror rule for port %d: %d\n",
+		port, ret);
 }
 EXPORT_SYMBOL(b53_mirror_del);
 
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 1747a1f20c78..cbaa5de9b107 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1061,6 +1061,10 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
 	unsigned int port;
 	int ret;
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* Enable all valid ports and disable those unused */
 	for (port = 0; port < priv->hw_params.num_ports; port++) {
 		/* IMP port receives special treatment */
-- 
2.53.0

