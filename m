Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653078;
	b=XVTTlUySWxgjnM+vA5vkVak0enQl8p10z0WmUFzjHmk4SIg/z+Py0D7YhkrWOJGUDGE+
	 JnCUGy0VQ4Sop0WW0wDJiWzn7IvuHSBdnWZGqskaPdiY70wgzGA/98QyzvokG7Ke/Movk
	 Zx7KIKo2GJNaRuRoBRQXdKZwAtKlIO/uVp38E+WSuEZyRespoIba9dHG3Avi8Ov5VNUQJ
	 h601BdDIZG1UPwkMvwtwnUkmh/Be7Rluj8VefBxNWlve9TgNphL8VaNLOiEutFqaN5Q9W
	 yMbDkJYHLu8yUXntxofU+b6HIme8c3KLAZCGFjNwnVWfR3hIvxWnKePzDIhVlcNIepw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
	b=eLKctJNA9ihOj1BytA+S2slTH9zJgEX7J1kVIE6FTxwFjzQH3Gmn9/IHIKuvMPnzwhWt
	 VstayxHVa2uuxCVQzF6tq7HYhkHneClUj8tRhzZaFjCjFa4Slga7b+hw4+/M0LuyJfigc
	 Cw7BQ3I6lxK2G1896CkzyvsimEDZQsGQ6kBwm7+cKK5pkBR/4yhGq8SMjc+CN6JXt7vxi
	 mFQfSbRmd+5ubpAN43yEG/feicAGO0eteDTteJuuueGDbDmK2mDSeVlPJCv5ENGhKQRHR
	 4Wt2l4Wnl7SH+uu8cOvFvLp1z53mvWoijoJPUiYEhbvUOASWu0ZyCablDUfy3PRqypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0oUyz3M;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE71606A8A5
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE71606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0oUyz3M
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49134c8509fso1972688f8f.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653077; x=1795257877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=g0oUyz3M9pE5NvVzo8DmuoJiVKr+lEG6XjqgZnUJypGA4hL5Mi7l8Csc3q2TH8pnSM
         u4eBy0FBllABc2t4SvnHlMp9XIHtsPnWh/g1tlopwD52Kb+RhD7RxE1wyrVRlNeUXrY2
         Pd7Y0GaxEXsMVBuw8QhxfYNe+pchh/B7iaXeXVPJhiWhmtOKsIfoz1a2epPsV74pc2bu
         jQZ5PMLTU/HpLWOFs+Jie6cZolYTMahycMI/6gPJDNHk9Iohv9SU94BuiHsr6KMUsSeR
         5xJT+Oc6/+WmiS6JYVxM5Tm4KSmLCGUzLNSxsmGv8cfcOZdLrGO0TNwXiOmRlUzNT7Ki
         EKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653077; x=1795257877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=h1hnt4JRV5SE6JiHsSmaLLo5afNcXW9q3s0TM911OSUSt/cw2QuSj3gJNGcSzAAvSx
         zWFL5JiWri60wWFHE1jPOqrHaa3mEyRTz8nrTMBLLU51BMHLQf5k2Wgicavmp6SHtLX7
         iDOLd8GE0Xpi7LLf+FSaSS38merhJKhmaNuIY+eGlQfyDy9gyetCCdMH6825O5y5+8yy
         396HwZf5+YvdlQ54CVJr1ExFa8MP4wnRERao3vPyOczHlzFUnAb5WVi6/BZAJsCvbGDJ
         DOwQY7OKQtJ61VcgaUKv/gtAiv71eUQ+OBomNzbE6KdIprVB5FvO0w/f/p0xeRTtVjAa
         2Flg==
X-Forwarded-Encrypted: i=1; AL+hErGokNgNKYap2M23UydbHz9rukqdGLOwM0EjMSFFUC9g/chrmMwA2M3TclPLW4ShDg9OYLduAJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lco/KK1eLjkz3Tgccao9prbxDCvaageVQ5eEptf7UE4/sVLxo
	dNxu6jmIV7LhuPG3OJnSV1m39gIYibfvP64g5fhTi6q+FWk8c0l0dhsw
X-Gm-Gg: AYBFou0XSa8Wz3FeGRANw/iMU8o1JEUgFg5rk2Va+cDyr4iFVYFMpZZBH32514J9S6z
	5452awFEZNa3l4+8nJSnjNpd0ksO/fLPko4Afhkt6kUSh7LQqoxQrsSmV4Hm51wOY5DLvnJQa6j
	S+E9p/tfFhBd5+GvEhTUnx9f6PZ3cKOKUc8721p9ViT4288E+ZzHnlFenJs1jk9bLMdCvRHr0B1
	FrqPEJXbDpkQPMLWE+iFn9LQBzIbPeOmofUh5aqZbzN9W1JOkaf52Y01vDzuaQ4jBJ5uAV+FEe+
	eGwtWeLY0uATDnB4EnLGJrkXnH2WoeYcd6d4pUjzgyVpe87EPhorkgnZrF8dH7CHu++q2UoAxpQ
	enEJmcMvurRiN0iA/W3yJAbR2bIn4ZVjS2538yhD40g1tL3byIxKtfbMxRvFE1OK6GTpPkZgkG6
	7KWQVo3Ob+vMCv2iI5TBj/F9L1x7b94U14znFIDEdVCW+/CnEaAHqWAgq7EW8cy2Ad2PvYpUwBi
	c/guQVNtpEqlCQxpQSEFsw5Gmps1ATBaHLzhiyLLEpSZOBh6TdImqfG3jhCsHPOjz/+OaMEzxc2
	eGFYdHz9KTnDRXd4ix/h564nII7si6grT1n6YYc+RG9cIwn5m1loEd344wJaeST9SGoygT/P392
	uhPd8clLiqF0oXbYVfLG35rWZ+CHt1USq9g==
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr75369625e9.31.1794653076664;
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
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
Subject: [PATCH net-next v20 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Sat, 14 Nov 2026 11:43:41 +0100
Message-ID: <20261114104426.235620-3-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0

