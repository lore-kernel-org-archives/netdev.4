Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863400;
	b=fWCF5Sp3jKKh0KUPJcmhBvs9RaIiI7SDM4O9lLuv14qfPDTGRU0YuXWkVcUMUZ1/IZHP
	 Svxnlcl7sXbG7fptBvsbTG7Cpa0A3lClMxawPvq0fhAjLrHYtKSahvnI2C35t0zEICbjP
	 /pUwRufU2Np7pvb+KWb+m8s8NUMNBxHD95jRlP+wYu94By3ytCgtqWgCbbsiwAWlZsX9S
	 LCm+C+HcdpxPCRuYBKPd/c3485a6aro/UDcR3b7300oMIlFs1h+aW1p5AFwooNlahk1aU
	 XnO8VJYTePHvOSdW5uW6z4pTkvWA/1cMeKWUq8MmAC0YKL1opNggyXP0vfVumzKetGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863400;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PXCXBeY7TIRm27eW0AuKMtAWfK1RCsmR4cnDc7pYKhk=;
	b=MnCIl4O++JX/wQEVUxjLU0sGh27Ce2loAAsjV85FsORMFsPz8BzdlVwzFlYWKKnwG9h5
	 9TrJIDBISyO7RXcWDbUTArV8IsVnugnZcv3lJbj142oPUBPd2q08znKY1UwU3JTjXK6Nz
	 2WjBmjAyrOaPgrMPfNUvWhQ92lb75dWKBUi8FZPQa1e3RVsMYvL1lgjNdl8VIfiU9Bvlv
	 7EsNGNIG916gyczRg39MqXQMXQSvaOJWE8VMkvzNMeIXaGdufhgU5obXk59DozEDFjRqZ
	 ZkaaCP8avdvfV5G0G5i3kx0FMgL6YOApw/d5JT2rrZopRaQnEWdohJEEhEkYe8pUFIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="TiI/ZtkD";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26A60A2610
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E26A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TiI/ZtkD
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so204176a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863399; x=1795468199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXCXBeY7TIRm27eW0AuKMtAWfK1RCsmR4cnDc7pYKhk=;
        b=0/gTVu7hYt0xndcPq/faPOsBDy06xne3FXIHsvoXprxdst13HKJ5ghs35a47OHe0bi
         dF01Oig8syOLA9e+jEV+XuC8xAee8ziaSRM1VUqTUnXOGw9wi5y37MDn4/klhmgF1FA2
         U7DPYOcvi7eXyXXzNWjTfiOJ0AJi5m0s5ErTSHrU3ekEc24MHv76SWhHbFgeXz2FeSD+
         fkFrDutYCtzImzlQKGYOLjzNSZDp6hQxxx0bshr6h0QjsiHr7LDsB80r9dNAuijLRIOC
         oQiWCE9rbnbwL02OoJUbiDxtNZRVHIUPbkd/dr3bmcObbT0JLGHOdbeglsBcMu+RWA36
         /Qxw==
X-Gm-Message-State: APuU4Z9t6TK+AgiTJKpvH83PdSQ1zboWRB4QuGoz3GREfdpsHSee8DTS
	+VIEXvVBSIosoN7lCZ1RAAeXM+BURhFW/tooMUrZoxBF5aBtWO/JWccopnE5HSmPHf1z+4vmyOu
	pmSdggMW7e1iWGHOyu46qEXzNxPdZf/dsJ0yN3R0ACS+tAja/ukVlrqZQ5nT6ouQz60mOBUf2VX
	7BGr1e1L7od32XeEM4LEoOmjIbis9aGQqTbZ2qWIK1jyfvQpy8vHUALcoGmzptJJroVJKjj0X4S
	SGQi6x8DDveqpOB
X-Gm-Gg: AZFdTZcrRuV3F5Kc5GZiRaiEYXzUD1v6lJU8VILAO9wLhjTschj0zPzjHydJX7VRJPw
	N2EOw8kjX9fzVJhF06CwYqrx6JFkFWOhywQqiCigmKB7rbNuPj8MqwsPcg8FwSm4dWL7/i/xuxW
	OkRGaOQHPYyXWucliMhjLEYkASTbICRCoodKMCPDQRCG66cct9gsnoCoUHxExkEG+mAhpOa2a3f
	hw+hnlHhHo02GUb2ubKommReY5MAR54rXl35r2Uv5/O7OaFmQZ3LTYaSuOzCjtVx/NHOeigkXCG
	P8haEV4/gNzUhIgEK+Mt15z7v0FXSNPJLURFAuVB+w81otKrRNQUFMa7YblI9QtAYnVQh1qbh3d
	fLyA5baG/rlvl6Psff2RNod5dzI9Hfct5sohiWhM37hmrwZm//v2Vl5mEi6D2WOw0XxpQA0V8Nf
	mpXZyDMJHKzdWfJddD20ge9eb26X65+CldKKqfteImG/k=
X-Received: by 2002:a17:90b:384c:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b3abd11cd9mr359024a91.31.1794863399368;
        Mon, 16 Nov 2026 13:09:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c3e09606sm3715263a91.3.2026.11.16.13.09.57
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so66865285a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863397; x=1795468197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXCXBeY7TIRm27eW0AuKMtAWfK1RCsmR4cnDc7pYKhk=;
        b=TiI/ZtkDzhItVyipOlt53bMCDUOXMJkwMiZMa2mnNPazRu6Vx0GulAxf5sCii1PEw0
         PkScxCp73+r+gnt3szXHvSaJEPQ/Fawnq3sxMV3iWAjXb0jbug7MTY/dQglvHYSJefDw
         92Chuu35LL6wRqXpfJV2Iz5CRrFzdnCULzQJA=
X-Received: by 2002:a05:6214:f2b:b0:920:fa91:1778 with SMTP id 6a1803df08f44-920fcd29161mr13498116d6.17.1794863397082;
        Mon, 16 Nov 2026 13:09:57 -0800 (PST)
X-Received: by 2002:a05:6214:f2b:b0:920:fa91:1778 with SMTP id 6a1803df08f44-920fcd29161mr13497646d6.17.1794863396537;
        Mon, 16 Nov 2026 13:09:56 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:55 -0800 (PST)
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
Subject: [PATCH net v6 5/8] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Mon, 16 Nov 2026 13:09:39 -0800
Message-ID: <20261116210943.1352656-6-florian.fainelli@broadcom.com>
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

The IMP and per-port GMII override registers swap the override-enable and 2
Gbps speed bits. Using the IMP speed bit on a GMII port clears its override
enable and leaves any previous 2 Gbps selection intact. Select the speed
bit alongside the register and enable bit so lower speeds clear the correct
bit and 2 Gbps sets it.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Fixes: 41af38324341 ("net: dsa: b53: restore the NSP IMP port 2 Gbps mode")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 64e04c5731a6..d8dafa9e0c44 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1427,17 +1427,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	u8 reg, val, off;
+	u8 reg, val, off, speed2000;
 
 	/* Override the port settings */
 	if (port == dev->imp_port) {
 		off = B53_PORT_OVERRIDE_CTRL;
 		val = PORT_OVERRIDE_EN;
+		speed2000 = PORT_OVERRIDE_SPEED_2000M;
 	} else if (is5325(dev)) {
 		return;
 	} else {
 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
 		val = GMII_PO_EN;
+		speed2000 = GMII_PO_SPEED_2000M;
 	}
 
 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
@@ -1449,11 +1451,12 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		if (is5301x(dev) || is58xx(dev))
+			reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

