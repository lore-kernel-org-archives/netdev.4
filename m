Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919234;
	b=ibL5tpci7+6pXQVqxy4M0OCWxfJYsbKqsWKoYt7VxAG8tiSBIHkA1fmLCARLTWtTZQVw
	 00v2wzQsBQY0SsHwdljfMiIHQe18lHKPOvR57LWUqpDDOLWvNimjK270JD9e32xpcw8Yx
	 S66rPSRAQV8wi6ApYfy0rOfNJgy66H+Rbe+y6horwOO1rzDBsytk+ohSOJ2eoCCytzFYW
	 CYpUi/EIt0iqSv2+VGeaLm5/E5c5WGGqPjxBA9sd0WPpwHFReDrYEnoxP5CjCNpesaoLP
	 V+ukejt47jj3UGsWbTsLBVceX08PH30xy3rZbsREa82jDIg82pO8MghNyCZZMzgRXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=ztaqthw1TZOojYPKlSQDPVa7+M7Os+mc0dLgJk9oYb7GxWq8oxOdVuDcoom3OWoe4sK0
	 jOqp+ipvpVGvyQpltshMhS0pnksxxQGJ7aQ1AKMDmurmmV5RMneqMXnEo25smY2k6qmNu
	 BLWx3PGpglWtzN4gHnY8qdDBdyqrtD0+xKktndGCmitjWlpUaysVrOQBLSErpMCObcvu0
	 v1MIf1HXVxBUhJvqS8qef7anlfJnGrHNZdFaH+oBoXK987p00iJndlvG3OnIHWZ/xUdiS
	 +J4NOZMn6bvwNCmocoQ9KWzWGtwbd042P3XxWn/z4SO6vSnfB50ns6oBrmThXWqzFCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+T+Ton5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EED8606F896
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EED8606F896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+T+Ton5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so30990115e9.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919233; x=1795524033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=D+T+Ton5B+ZaF0fbiHnvyY2YntjQx5xv4oo3SRyis9tE9qZYw01uSQxYEk6eBzqhzy
         cvmfcut5vgU5INUgRiH5RWTEHzaaN/BZpoZOJy6AnGwUHp/muijCEb7AEyZdrRWDQz14
         QBkkqwLVyesjQ9KJyCsvkx/EfcM2DZvmPm59Wf9+62sa0lUTIUS4k0NM6y527mu4E1n5
         9pwJTSrCyHZSjzCtEfFHrB6ITA4MDiQNgU6fD+pIbUXh13IswYSZqJmtnJeVUnQw9Az7
         vGsBeSnOJ/5f31saXQSFTzuF9xCrGqsFPaYo5s8aV6bERRNt/SPETP2xP4W8R5xvd3Vs
         6iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919233; x=1795524033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=DWJ822zunDVRygC8Zfcz/TOwMSvhtcL5ZJwgE2xzcj4FxwpGYloWCZ339beJy17aOI
         SkrPGbguNPbY28kZGHVDc/BiFfCfiCg73+zc8T808y3VM9zN5bEbrkJaxNkMmFOybPnf
         Eh06xn/VUfPbAAphTwRdH2CA6e3y8UALdFFJfeaEDmpLRz8CBrExdYWxUWVpJY/DClP+
         n67r/am9teOi969DKdlSroSWe1dqZrwK5TFAD8rw7J8AAl7jV4xBkIvwcPtwIxOhuuEJ
         apPVriN2QYHGWD2mKOviUSIY2h1PSQWjLmvIGV78dFrWWlnHBbe7B0SXZVK02quxdOGb
         WoEw==
X-Forwarded-Encrypted: i=1; AL+hErGibRDCbRf4rTR371g6NoeOL0picatkQUUV3bi/1uJLEqCbbK5zF5SmKIvpB86N8DsxvsEV4ro=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q3/1Nh4kq6pecCBon6H+2NYPYgUMkDpcZDC8v/hFbDhe9SD9a
	tqa7NSrHbikn6SnUCEYDRyJ9DbyThEOaxongN8S7/mfCSflyzsycICHV
X-Gm-Gg: AYBFou0cqeJDmIzCIgwMZbjUxTVtBdzD40emLxinDXiOxnxhQlfy6gzsO2mHZNZKZgl
	libmdudg9tMpKSzd6uJru6YJ6zG6FK/BE8SSHLV4zNMHHeVG78hm8BXIsv0YCrJT2IqTXCw9atZ
	cbmp8SxcL1BPk0oa3f2AH6191Gi0zJZUPLIBOJXltzcCafBSGBgv5uYenG3M3v7WzMskCx484ql
	ho4mU3jni3Byxw+ta1o6zQDhvZm0DgXOVjGHg9kUqEIXQlMaOtn/k7n1HNfLHIpY2sWfHtme593
	pQCvhENmqLm31D9q22J9YRrOI45f4/jYZFtKUnpp98rTJAMzltTweXvlFZLZgPeuv/X0hBiAg77
	dlXbauGyZhT/R54axp/3pGO6tRqCmb7lfHnhJfKGyp8piVORA8WZ1vVLC6v39izrjdLiwtZEEir
	Ktu3AA4wfo7ts26PhNbeyoiTRzD9PbSJuymGedjVvu0dEHu4pP1x3OovLma39INh3pL21vZJqX0
	LyxFajttqbRhgB/UeJO/R/upuBJjuExLB+ijX3pWWhVXXD15n8JI82skBAfPkGlz59tUoghJIph
	Ey5cwne1EqPQCoVmV6qEChaCL1Yt9SFMFYQOzGQ+XWXPw9/r6SJaQWfNjPL9IKuNajmVQUPQu7X
	gFm6ptgDzp+5GQAAjRRB/ubDTxe2+rdbuIg==
X-Received: by 2002:a05:600c:3b2a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4bb735ad6dbmr119130585e9.23.1794919232533;
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 17 Nov 2026 13:39:52 +0100
Message-ID: <20261117123956.11981-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0

