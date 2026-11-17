Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919220;
	b=PU2H2ufqh8zhAllwxdY1LhBK+kO/u5PFqIlow7p8S0D30Sy/76GIrxdo/RKeUIrxFbNZ
	 CohCAzcfcGA64Xa/BORzpfIGs8Pn+QHWVXfMJkn8HNxf2F0AlYHOORQ59kGKwTLQQ8RPs
	 aRDKGNaWyYtWu+qNIJ4eYErGtEwPtTtADh1yONGXSEQvHGk+1tnCyTEcHFc9tNBroY8hE
	 DUzhk71ZzLw5i8o26cPPyI7qvCGh3kUfEbb8mQjWoqD6Mu6uUKu69SGHKkX5woVL+SJtY
	 ujX+sXeXaZ4vnCWck70GmDr64Dj7iRwoWKES5bHrb3BhqborgCc4RzTsSXtQLv6oJ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=JrKBb40NqAS0l5gMbAA+oXo/uFCe64MZ7L+WnPeQfnZSFpCnGwvoN3qdLOb/UWuCHCMJ
	 qqgQOAh907WYDDPVMhSk6xpyT0appX9OcRizttPZRm72Ypt5iU0YoWGR7FnY/Fcd+2egH
	 2Qc0V1xJIa13L/Io7d8FrYi8/eg9jjObnWmoAR9+LqKsetB9OdKmPUtVFLkSEaUzxywM+
	 bsJ68Z8GOcBxHjmA4LNX+QBSizsIs9pvte1r7WlsKXjsuPtavWuLwi33D1nefsBff3hVQ
	 jVVZotWR/78Hy/EIwoB9difY0/9LwpPGcgPNHVMsVDy+Egmcws3NRxE88G+gP65PwiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9CB606A884
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9CB606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47828675e9.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919218; x=1795524018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=cD8I7k4xDGq/qBARL1vrdzp6+zD8+TGMO3ILYOwEhwvbBTbkFKokDA67pD0xhaRcx5
         l25xvG3H1BjIgmcC24KztZzkdeblUuckTV9neVu0CCs8onFLtmVNk+ICrdt6cmtpkfAx
         NTwhd7Rt23vZp79UHXVk/O0zPc6njAMDkXvLrlnq9G0qX5sCBfLbnWTv3ujpFpBl1V2T
         YB2DtCZ2GVP1Lg+cAsrz9UN89V4eZ4eewqaJbKNqLyGONEXdRCynnp2o3mH2KAjCrQsU
         EPZQx5kN2ucNg7FTkd8yi/RSb6yjTIyruRiDvxsjrtKnBnpaUoy6DKRTo2OMMH5CkoWG
         6DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919218; x=1795524018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=F9PFHcaS9WQ7IEFb5+MUGdYpF5x4IVuNk58mAMy6LYqo1C0Uh/vUUIbKq0ESO27O9K
         s6/TcfIOQuEcLSvM1NAzoeR00BEnMv1+9lWfE+dRb2SbxPUkaoL8Q4hSN+kv2WBGfRtH
         pOCXnVJOGEdpQRrpoR5QhuximErZOH1ylw1648DT0GDCsexoN7XvhvQnJGcgYp5G8qq6
         HJCqsTrsRgi24Qo/CZjv87NASLJ4QTsXSceWQor/B7bw+2byfXTDJ96rs8buiqHBOU/T
         q4LFz6fx3da1Ev56G4aBcW0kcP/KLJr852zC8WFnH/oR7yWYkn6YcBg+YSZK8o7I6WCK
         Bepg==
X-Forwarded-Encrypted: i=1; AL+hErE/+GdoLIwR0NwL1AH6Y12HKtVaUJIVjzzlRAky2yEcKmuDVk3I0SJUcFHc8rGR7VMkoOjoEC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CtTkP2t0ZJzsHA93idHyAms4GG528t77JPAvl/EeDWuR/d4eF
	LtGczMVEOuHnd/q6tgSOZpaL5MAUF2yI1gSOY5Yv/+AgMmOcB7BwdrBZ
X-Gm-Gg: AYBFou2+UVZajtiJ+KdKLOCVhSu9JwThaPWeRlmmeYhJ7bsGPkcMuHVtI7i5e0i3MjH
	aT+WwYsYx8CpWoyvUky7g35d3MvOKZkO8j37/g0ApaQBy6vjuNsfLnrGUEuwOYHY65yjA3uwfGB
	iKl3/HvP1TtTf/RFpqk/va+nWrm5FpxNsPmC98/o/WGpMs8UPOinHtRR7Cz3+893mA9JOATJAWR
	LvF22WM0l/fBE+BXwW06FS9mEXgZ3gCEh8gmUwQiFdUNgFh/u/R+NQvMicIyYw6AIqnKOv37ZGm
	lkBycxwNNAnM18y54sxP+oZHfQArDbkg0V0tEd37VFHdxoWH4sgOf6zI0x2T4FlcxIN/MWdDTgt
	qbPCoiTVzUUYkvtshC8LvZQSZiwJmy3gAa2ddQ5o1M9Oum8y+25xLh4FEzX2iFEAENpsZanc4vC
	7TL9sVfx/4LOuKDIhuoIR8VyiccEP6weq/kJpT/wq+sIc7+PTkCZ3JHToAZ6bjIyWw4oDHT9HkD
	dP7TtawoA4bd4LAZpcFLgvqZx+2Ywm78tYBUnhQQNOLcnl1TPhmh6tsjJbYIxGgfMQA53D6h56a
	cw8BhuP6tKAqz1WUWvxCS1BQGRyGmeSTh8xk9zX+tUbSNPqyQ8c0exQdsoVPO9+d+ZvNC21RC+i
	bkoVYfuZFWwLWQucFGrM+QndRmuIoOMpJkyk=
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr220965765e9.27.1794919218079;
        Tue, 17 Nov 2026 04:40:18 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:17 -0800 (PST)
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
Subject: [PATCH net-next v22 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-ID: <20261117123956.11981-6-ansuelsmth@gmail.com>
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

