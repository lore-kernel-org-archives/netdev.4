Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115055;
	b=vB3mZsYTBbWIcjhmDHpOsMegnwwYV1QBlFRHUBaDturDaTI3nvHelEp7WI8EbEOhonxC
	 M/ygBqcnBJSYb7GMLYw1EocHMSlqI4atTBico38szNci44UfY0NnPKXdA8w3noYIVi3XB
	 BQOB8pfvW4OE8ghP6w6kT1r2gSkQQN2hykCJrxgvYxe9P7KpjkJSVM1579urIvwKr2dWL
	 WChpzM4zMkww0joGnmdN65dwVz6BnjiB8i3zAVpbK9eLeOpA4Z+MWQrE0SqSvskzLpf2W
	 QPO/cphhmyKjULxYXIyG3Uo6B8WbBZ6Ol9d4NLbmGrjGqW94HQxZClzjxHdf4Hp6YZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115055;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LE/ePd9AqgVj4/hO/b86KqcyKMm0F5QDDk4eDLXTswE=;
	b=v6mx1XhDSvJeHJk90574t3X2kXWUHqsWMMT+81Oxgp7YDc3vIiw0o+KkPH5SgJUqNFxg
	 Ef+tDC1PF88p9djAj18XoG+kjy+7JLm60YnPzGxm/TiH+n3HQCWZ6/ISYBT+MO2KIB05X
	 oUY2pd8FzxjpijrJ1iCj8suWyjR3x6jp+3VNYQtOwph3hURxUK6xYl+rNrh9lm+1q2YAG
	 jfTg5Ym23M/C6/MFPMHYYVh9uZcWIik0VCxhG6JXGlMMjJ36QeIldyDl7lPeDcVSeIAGp
	 +dn3uHzrHP7a0rGDiFrwwcfVtfMvZrFTuVpQHX4JuFReZNlxkIfjdCqYrnKLIEFJ6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mevn7kJP;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13805606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13805606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mevn7kJP
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so104010a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115054; x=1795719854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LE/ePd9AqgVj4/hO/b86KqcyKMm0F5QDDk4eDLXTswE=;
        b=YLEBh47aQLBg3V+ayez6A08Qgp9Sjug8x9yce01qjCofKnzqXVx9w/CixO8FX81WPI
         O3fgjOto8c7iIKW2bkNd34CYPDoEjMdQcYHyFCNfV3ojeGTq8BplTTvKQQ8+uxW4viNu
         6TXORSSHApEPu3cnFPX1HjO0UMknnX34pGL/dAEd7oWcF+EuNrxDP0eYjpNa6TTFNSYX
         lqrkN7Y8SLOzyw34VPfrpmtKh7fkKIqb83AqSRtXgfy8VrxrSpMP2RTpcSYp+pZQKO7b
         hH3FwuCAl8njE3sZdLcpI+ixeksOl8M3CD45YzBUJtFUgJswz87e8kcy+ZKlLvoIg4U/
         d1JQ==
X-Gm-Message-State: APuU4Z9iVwd226UfbkaNdD/ApNbw+76pZTSWADOUe4U49Sxhm949aJPy
	P+b/DqFqGMFA150tIZfI8qrKagcZiccEPXfqqS9BXUaTQFg9bKQkvwxuusUYHGUI3qcqgNTQci8
	Zo0ImzYsvbj/zcmNovGsaejILZx9dBVGNSOHiyHGjq5b4q9N0/V3w3WPTmVAjOcfxibILdheZzz
	+7DiQJ5S8FDkG+JCOIsc60la4Y0MgBoqEPfFhESwiCbtFZGmSE274eRM+lulPS3XiP+ngoT/z6R
	SC7v99lRSDcw2yW
X-Gm-Gg: AZFdTZcBOLDlFoCiMQIbt0c7eE2l6mPf2vdwO9vNoIrv52pRqapR6Y7KLDScNpCOcvm
	wMEA0dHVewwT+U40buTFkQnHnnsZ+dYAPBbAt7oSVo9++3gEMLRtucBMzm+ElCDn0oZ3LGWx3AR
	dlY+4bdzh/9fQHvj9aGi8wj248NA2K4zTio6d6c6p8ejgNHevHRJz0dQOwFzMtJezN9SD7gQYvN
	3euP9gdx5oNVV17lCWTgTKGT0qto5KbVaargh+y94WVoglcpT+PIpXnZ27BIyR8OmrEumIO9Cqd
	wY8woueBBTQI4ETLkzPXoXEwexFWCfxFLZPcQtQKATd9xWa4x1pqLFZiScdYmt/uOGk9NHX1Esq
	NZBGfLw6393EfZymfsCg6jymzCZ6Gxp7iPfonRbLN0rj0w2VqLANg7PebfEAI4DGtsCOebOpkSC
	BddfgYWThYimzmT5gYIydkpAEIetEdeFPf5Aloldzy
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b373:6a6a with SMTP id 98e67ed59e1d1-3b41c9e45c3mr239252a91.28.1795115054401;
        Thu, 19 Nov 2026 11:04:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b402aa9409sm784499a91.4.2026.11.19.11.04.13
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so24135185a.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115053; x=1795719853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LE/ePd9AqgVj4/hO/b86KqcyKMm0F5QDDk4eDLXTswE=;
        b=Mevn7kJPVNKqFc+AOtQ1hsf5syzNsB26Jg7eFQCaP5nPZicejo1FzDDc2cVEZ+GtIH
         jfN8h0BEKreJVdOv7AorgEv/iM5S34Qg9KL9y2Wrxz2stk1PDwxCTiQo61EUpIJrBFuB
         G4Y5bBU8LV0/cGiLtjn/ck4l9AxLwJAYwDTMI=
X-Received: by 2002:a05:620a:880e:b0:949:75de:b21e with SMTP id af79cd13be357-949ba9cea77mr82773385a.37.1795115052747;
        Thu, 19 Nov 2026 11:04:12 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:949:75de:b21e with SMTP id af79cd13be357-949ba9cea77mr82763585a.37.1795115051693;
        Thu, 19 Nov 2026 11:04:11 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:10 -0800 (PST)
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
Subject: [PATCH net v7 4/6] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Thu, 19 Nov 2026 11:03:46 -0800
Message-ID: <20261119190348.2317702-5-florian.fainelli@broadcom.com>
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
index dac6013f8fe2..19e36e51be52 100644
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

