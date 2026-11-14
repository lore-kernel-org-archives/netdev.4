Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653084;
	b=cMnDr+SHlCEgpLsLr021yCbbJpCdB3RnMVqV/qnMpVx38SjA2wW/rFDvEQRSysQxztk9
	 /6se/4Rp+Q5w+2weMi6iI5PNvZFq0dz+AoX0UoCXa47Kv2ucSn/Q5JhPZS/YmTMrNs/tY
	 OKYjZU9kagyV8jPoKSIlhktNomjLIAJ0weHe1x+iyLYFtmo+ROD/y/1pS8XBQvrM6f11k
	 HhwOs0EheTQadnMdEabocf4z+3OBYRJMDBm/t1za/EUnozgHDzQP+jBW77dUkL2bHcLNo
	 tZp/JASDx/OUxARI0SoKQgdYRiTNkkW/Yq4jldsGAHANx8dIFX6Cs2oOg+Eblhh7PEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=ZeOSQQcRES1GOgcdmpnXv8dRIzXcLdhK52Yd2Fet2dEQ1EyDmN6JfrOi9J3frAGrL5cy
	 qB5ScAPBI6U+x0HlbOuJDeUA4sDu7d5pzYrlaFznBVIje5NJVUVTXgxd+i0Jux8ryjK6W
	 B549O1UJJSK/cuHxTfmfcxG6KcaLLunOvc8mYi6O9U1SSdaPXvgg7NsUApvVWUpXdrONo
	 mObucPgLSdYCL0YTZYbN34BpGOh0uUf/5H/5ivmS6FGyk8XtUUdYi7ses1nsomvFQWU4o
	 EZB1db4CDD5P0BQpTWLxN7B4T/0AxO8YbPWfQhIpt4OTOSp8Jy7Mjk/5ms5oqdxjWAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9098B60A380B
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9098B60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6754bf2dso904635e9.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653083; x=1795257883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=pVOWEp3WOe28qHag/t5ZSnvAb/yJWXgEYMDc9O/AXCJJhNh87hjSurMqxSevp8BUPA
         47os7gAgol87q1XUkyFhP4KDC0Rrc0HKpC/MGriNoqvenaMsS33T+8IfzXvwfqqZqTZN
         Y+8IXGqhR4fb83HfwdqYMWq0iNgGQpv+ISOfWgGe1V8odOo8doM2JLdocyDkQ3HHO+XW
         /CKSh8dcfjaweQxN1sWFHQeDhMTXeZxO/O4nvPutektuHyQ+PxWp/gcSmKUoriJ1OLNf
         5XV0hBqrXgILz5Iey4nz/oJvMiMJSpqJUklTXmzCeJWuu6l6w97xx2/6sJd//3fxdqkw
         zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653083; x=1795257883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=goSB2VfZbFK4A6XzofNVHjUs+8s7B3zcrRJ3Ef/BiHOKverq47k8UJsXqczsRKrCtd
         xViKJRU3ywHFb5wmMwqKMhEaFv6kUaebDmDDRaVGZ3icMTmMK553e6k0xCL8Fx2MXKQC
         ++WWVsFmXfBdTuMXZgIKW2sFaldi/lpOPHxp5cEUzrlkduWaqZzRM5btaOpLqY4RbtfF
         QeUcBs5tqJu07c6snQOSccxkLydfnzNKSYTr3kG15ZSRbx1a6twSbRYThLSye45BkWLX
         Yo7Tr2Uh4x6leh5uaZpRnS5ykBrXQd3i0Oe8TXeuTslvVGWNrox3/QjLPXS7KhQ8MclH
         C9Tw==
X-Forwarded-Encrypted: i=1; AL+hErHqp+vyO6rRopqF3d/YeICZ+MIhPdrT7vIaIzxY12cLQMghBiLM+wPCSXsG/DUx2UEUfxBYNns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mdTr/lLTiz1yaK5yV6rIORt23zGQWdEqDabG5SV9EjSmfqaQq
	ZlIFmiLJ0Cwu3FIMV+If28U+eaN0wp8n2Adiesq8ShWx0GvHAFlRm5zm
X-Gm-Gg: AYBFou3TGfk2xRZyp8mZj/muf+Lz8QDkReKXTuUWE2w8FsVQY3BcSSuf0rZQOBrInxT
	G2ySwloGB7FR1ghnZRj5gXK/zWJLAIHACDXMU7+48OB+2LIeqSILabRslJ34MwZWSqGWuPuwNEU
	mPWQoEmPtOgmlgvVkpD5FvsV94H5/1n+GdsM8UbJWjkvij7e9lpkCANLCRXJaosktQoh5GI78+d
	62y+5eWxm2XjYar6fDOUx3d4Q7Ce46B66kOleqVZDkXS3Ad9j6+jBipthXHoc1I/I9caB78tmg4
	EH+mVZ+ccsKqaB5Lkx/qiZf+IdMqz4qREIvQMBSahLTf/gyJ/EVvc3qJK9iEL+dTmEKoxkp8kk3
	pM+G2eTWin9d5iuSe+vdBnsnk44kmFkNcnKMfukGplR/FVGPBSTe1IecdCq1Tu7INDXLJMiHnUy
	Nklv6EF0dJUo+t1jTsV5octNk3mhsIgj7MKYOS0zfSPgrKQefOoORnAqki0w1m5f2C8iiKNed7x
	zHSIoCga3kxj5Y12E0I7ZPYun6ZbRz8R99g77ikslLImZn6zO0AnNv2OWjywN7kGfMKk56/x958
	XGKOTa3ozG8i2BWv9tbojKGesoLYBNOLiLqXX6vMl0B+A5jpbxkp7ph7k/jBmWmET3KeBQRrmAA
	DGkOiHhLfaObaDecy3ahcUsXqhs78r86+FQ==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr107792215e9.20.1794653082907;
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Sat, 14 Nov 2026 11:43:44 +0100
Message-ID: <20261114104426.235620-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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
index 64b00d324988..e2e0b313fd61 100644
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

