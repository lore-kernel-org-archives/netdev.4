Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846873;
	b=jG2nwapbHWr83FKyhfr9KOSqhQjTt7ZBpat1/o0rxq0SgjNVKjL2n8hKKtutAJ7tulSX
	 8gEY3cxKhvAusoU34GSb+S/4lQz9T3ieAw79UhtgzGf1ruPzBr2nPAoGBhp6X1mQCoE3c
	 zyFBGY8BmuI6x6L14wkphpbZqrdyJugH2SAUwHbQC32BMtScdLETOWUZeDm4M+Z1Twtv+
	 kR4pSEU9DhGJRryyMLnFi2dXe3iTY4d01aURIQKCnlCMjI5qLoq0wOpgaMQzzGTgOvlFS
	 dx8uuU+VEcQStmCylTjtwv9oqsjQyQHRQQ/sEdOnygcTtQp3KyJG96gPxjVYIcyc3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=rn0aRRB9Y2A9si5sQfbOuPj9CnjqRgJWkmSDh6/hx1oi9FFii/skPQAKEj/WlYUoTOmK
	 BZka68pdG/qeQ2i5zsipSOWjZtyA47mgojdjUMjZCJneJSfZza8OuLXgnZXvYEyA6op8m
	 r9GiHKY/Psu/JP9OGBhgRX2ttfemv2fsFxzNpFR9PhibuYg8hrWQR+cZKJwlZlMGBV/qG
	 QbXsAKqLy9k8QhSU0mM9AjeHweD018DQLQnALbpb895mr/T+uTvUnc9U3E24rwAwU0/ZD
	 uYQip+lgU7ENQfNhqIC5eHbOr+lmHtcbqHpGdpNxA6Gc7G8A5Nu9DeDg41zcvy5ThAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24E606A8A1
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D24E606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so9442405e9.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=xcOZjTxorByYizNJGssiaOGwwfyU9b6w4K9GiOMTxB1/FYWzqD31nxLNCMayp8ZYfT
         55WgPoRbpyPST//W3OuMjpvw1KCwPFP/l7e9QeNWRfPBkbtCwnsMq9cHDDG2oXTu1bbL
         sYopDicSNp4FQgXY01YPI9cnvbAckqki0hJLitiUfqpqw4bucvPUoMbcJegxGzUVOuLi
         qTWMTNwL6NlO+ViUHjPlfH9k4QzhxGPSiqE7/eFV/ypUj01YbAnTN+KIf5rKQmXZY26J
         V9aR5aYklwZNW2HT4bPogiXRlWT1d8hyWssoCEynKFbUFsbeJ0RjJoSihLgFY9D27lb7
         EcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=kQ00Fa8tvMjGCgLqM2FC+615P4kyg0VMYZ7svTvQoDBWHH1fiHwYg5uUi66vLEEDSC
         TrZe3gd/+Osqp/PYxfImx3hvFwGXEGlJTe3+1cV1ctxsWjlNncTBj5mwzLI2Pu9RiIir
         9iDHyYasULcCspu2m4YZlRFrxjv+kaiflVxkqa1I+e7w0BjtayxcDEkH9PX3BszkXz9b
         aMI4uw3Fogh3Sz6vf5ZxdTj9jLR92eQfMPBJj0vXgw5SCEnSQaeWqXFdPTpB2a2+WcHG
         hntqkjhhFfALRoEK2FleY37hnwg2k39NWkLlXvWGFglwOddAdrizNz00kODC/tJfBfNd
         nxlA==
X-Forwarded-Encrypted: i=1; AL+hErG0hnJAPBmsBgDPrwV+TTFPWP5W2C3JD54qAjmAl13Ly6z/u/PTH/Tlf2hj701HWYvJ1ctFEtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+7v1mGVJNTVQXHODqsLhzu4+bJwXVWVk0tSH1MKke4I/hem0x
	GhMPRV8RTsMKvJReZWIMXf1uNYelh/2EggbbqE69uMWhQrk8x8y5yfXy
X-Gm-Gg: AYBFou03psx134ABggRXn1hFGW1ruxYnlCLCNThiR1SgkNa+gutVN6kzBLVJDt0ujBo
	NQTiEpRVXk+gDObFeUpLkOQSwPdAurD1gWR146KLwIgQjNj8GaYXVmzaqxSHnaLUre4IEDv91wJ
	Y0KTdAZ4FBlFI7oiYkAuBdwlMniKYLCrutfZQ6us1i9Z31kkzosv3uSDepaNp1948mVbUriHWSc
	J2bWRp0T4KgSuZZV5vTeM6xbc/VbgiuTU95KA9H/FjS10IX+Uc/aSoPAkhVXMaegqW/joOBpYs3
	EeXdcuvP1ILjpAznNQIDDitrK8dTZAKkrK11y2eC7P4yegqYPY/l4+uVIjT858hfCu2LjmNMRTs
	D0pj/jnHOrjCnIuf5DjbmgzYJgZkwT7mTqJ28bsW/z73X+Cvphaxxh7BabQu2u6WACl4JFmL451
	LQVibV+BEq0Ci8Yp8lEFIgBb3XPQ3djyUL4XmC2FCKACMxN23LLqS1GPVgQ0qAJYs14v52zaojz
	Pqs/3DrQstNx727fPrxAT8cdLQemB/EPqzP1+81Fglyr0dBxuyabWGOqOXWk+8+ItwdoV3mx2OB
	EiY0h7owpum2HeGty4YZSd+HjPBqoaPJVdwPGiU25qKUFh2wlZeZsh224yVXe45mwulN7jJfhUm
	hNmG33zy8nBpb+SLmSFxGfiuao0n4ijjTm8CbtZ9tzPuUVmgb/rkyTBg=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e8ba906cfba6..091c3a79c120 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

