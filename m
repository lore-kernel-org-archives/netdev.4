Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846865;
	b=JgFk0NLaudpmZWhzrrXPJJjuc3TySMUPMKef8U/wkCfV27RXgIw+OkFUdu75hg3agJez
	 6+CnUs1nb/kmhGz9MeaT9bTbhYVoFx1XpVpc0LKWu2whp3tq2HsnI5N4pxLWPx4E2YpCO
	 Yy7DId4LCmUKYB78L4dnpTyYAsbdtrz27rt3VuxcjCNHSCvIrCdWh1yjBirWbEDUH56mB
	 JmICikA6fDZX4etLOZ4ob9Hx78iJJgImKV5+CzyTa3dWAJ7509YVqD9z0Dw9X56zro/2/
	 edCIhzgneD1Wvzn1yh+kxrpQ8yz4/MqnZErS1WGa9v8q2Ph/efQukSR9nn74/T/H+mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=gt2fkL0EDJ737o5ld0c3ZPaNVF26vX/gLvYjbalQNggvm77BR/U98E6F87z26Oyfs3xH
	 XJmd0FbnghzLEuVsyl6Wzs02seFAXLNlzkd57gBWpwJEhew2WzpjR+wb5Dm4OVtxzHEkU
	 XNT3khTbUgSQ3v9x+QSRCsxvgwmLBqAlxVBUnfCFv0I3edlBar1GOomT+Au/G6W/5L81q
	 lx2EmXNAcNFjg/BcFlsrn1nfVDToht79KrxhcsXfnN8U7Vy/M0wZ//HPk8H4jL4kHqODU
	 HMR5HCSNf1Z5EfEx3mkuVYgNZS31mgI6AZbwXyIh0gsnlO7CpB656czuwyX3SleFzsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33382606A883
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33382606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1621436f8f.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=y8PZobkTNSe286sthC9hFeEIYis8FpFW7RElSVsmvEjhLIk5rhlvTHbYfHMdZSs27S
         G+EV170+v9GwVuAl51fLoVMULj9D/mL1FN/R3uLdFFKrt8OYYE/QgPCyxDX/7Q3cLjX8
         ybxq3kVQQolmAIu1eU59Sfwi/A6iIdaIcJ3zkQcFWLKKh+3V9002Ut1jI04cOgijC212
         U7zvppPtoHWr9awCEu1AnUCfDh0YXi5Xo5HlgaOZc3/2XVnaXZ4vYbnIGTmCoC7w25fM
         XMOpS+GBZxvJWJQ8GYM1GRZeRRhNGO9Q9KQkdLJ2j56Er3jHA2BVxaxVIoNYniRGzlD+
         v4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=me7NJFGsI/ZtE2YnY+6xtWCJCYIYOb0K15s25U5WcjDhfWsZ14jSwg6KSEKH8UaCPV
         8uFDq8gtJkfWMveFA8mhUZibifHBsKHuW6nGV+QP6dLKL5I0o6W2UjvF+j+jmCNAomvL
         U0CcP6kI6Z/YXIRjuJH1gwtTlodFN+CYXeGdOwZF9dzErEc63GQ4wkJyleEKB6Xl2ZiX
         3YgZCidCkiqC+AkN7H6h+DUBvo7ANK1Q60xe6uFTqI46xPFaZoCGrqtgr2CL1+wLaMbZ
         ifTbkhBNRKLz2anPBpfg78yvzmRVXrKFpDlAL6goTgkVwiSPoGgyswcwHhddEHmW1PMZ
         khBg==
X-Forwarded-Encrypted: i=1; AL+hErHCup+q+/5kaGE+0FBMBApzbZLkLMC5A6IxtgIAa+7FGJtKpeSsFFkA0O109aigN3j8LPn18kA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bmPE1iEbyUv70Th6WRjVPK/IMIGVR/vy20DKCeuG+WTUkszZn
	Cbqr4lgPEZXdUCm4Wb+hfcJ4RSiHXvhC7kuDm4uJYgiCLcyJGPebBZLv
X-Gm-Gg: AZFdTZdT6oYPEO/9NpJtpUGHvQVFTXAJ1UM7cmEO07Xf9CD0krJrgqo7StGIMfSWlwa
	3DBFa3cgUnV0WoeCS+ja7IDlBd3QR90BJ+VGOyhcOVRg+LWjJn4fg86d2Q3cYEp/bC97qqJ0RsG
	wENT75j3+g8PnY5RnCQr4isMlLpz434xvneoR7AW0+0qqRUuDLsEcbV9ZdmWmSwi58232RweraH
	ETM+QS7dnBJm0XWND4dmVcKsEvSP2J/oJnm4/21K6XF9Ey/yq5bs2SaPE8IExyW1MKU/nGJ6E4v
	AtVqQfYxknJJuZLz9YEnx4ZLmGmGcUgvUepR/GoRQu08kHMa0v00lJfOPLPZi/EWP5lrhUpQYOR
	HgDn+xjMecA04KXvUCDDmpMlXCs8aXydfW/4ydDBE57l6Xviulv71stFMYqJy9vNef5GCAIUtnR
	oeTN/cs4UXsCc02FJG+yiEtcyUERq530S9vCHMYlHqiQ9Yi/RbcQNuciHJLKbsOrfqhgvIxu+Do
	GvxCYDQ6ca+4h9gHYOh9LiC9QAFU95eUrKGxOFbBfJXys6PTA4zHfptMunoVqcPro+l8ipbFqaZ
	b++MFF3Cmjk0uSRL/pPxHr32AInqRqtidP08lccIWkeRBwQ6I6EcEh37sTje1+y1fKq20SwvzKM
	SdX069nj99QOKyBfdW/5BlBjKPMAI+MREfQJ71TcmUxZeuPVIqd52B7w=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
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
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
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

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
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
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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

