Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653100;
	b=z0T2Z5ll382z+kYq1JF/o7pyJ5iXnneVg4UQQsXtCGh2gIH6uYmic7ryOu1701abC0z7
	 D0vkbwtfJT+NfrAojPthsfVefCACjIAiKHHGK5ECg6+05KxzbAMLxncSO68AgKizMmjVz
	 JutGXRxUg7wJ2LxuOa81ITAyppszP2B/RIuSoaqN9q2fW483fien02hlQTsdaAegZ9m0N
	 JvNy6JfVOmeG/N+nSAjbz1rupV+R7chxe4a10vFcHW90VIpu/bwimrn5eKXTwzL+gS4qn
	 oVpBJPZz7EyTWCPb/IMasOi5/RpxejoXsoiHa2JBzqtOvkjR91eyayTHaag8Bpj/OIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
	b=5Or9bp91mHEk1l5ofXPDP5qSmEWnzXaO+1SuMgfbHeRD5O5mtoBRlQa2SDpuGsLEGau8
	 OEw0cKOIdo4zMzKGXD5zPTHmdxukIDudVowTI8TOblb/Ssoo+MSm53ifMos3ohdf2GIT4
	 7lY7w+Dhik/ktaxZzPlGLiO29dmBqD9hG5iqaZg1tODKHUmwhDqmNwvnygFbhBMU02NVu
	 T0p0TWBntna0qqvctoA3mt6uGO2LM+cgFCmAbFeHGVXji10+DyWL4PUI7WfPRP6fMRQnx
	 C8cyZRUVwyXRj2rZqdhXGFIkyQVU4aBvd/D+FaHTotyMVPGdEMfLssh2jly5qWEiGhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh4jtnEe;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19EC606B94E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19EC606B94E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh4jtnEe
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso3767695e9.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653098; x=1795257898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=Hh4jtnEeY3Rr0KON++uTGejBqMlfxJn3gIiWmWlmp/w1Y8KYpSHDD8ckECMiBkpAHx
         l3XtEN1sOm6CYFaZx/XwPB/JEaH+hPLA+rj8M7Ac9fu5Aiy3/4/Nx3aMPK6uUSX7cpho
         uWC5hS3BNMladdq7gEDU4eel1iBe0h9W0umalPVdwRARqShKscKh1S//LfyOUAWfKRTL
         qT0sNUi+Tr4zgBnDq1l8aiu+55uc9dBYTBRyu9OrC3BhZCpJu9PkDKyXwnpeTI1PvFAS
         HnA+xYJDeOjnmRvcNIFboFt9FkZHhQa3NDakZzfpIV9ifWviN7L9Z2dEaWReMr/qZW+S
         h72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653098; x=1795257898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=ZXVJ9czofDtxWYAbl1sid7snCFHKUKYcDEyUeD6+PAiKrSF4vTfUkgwOmVxSY7Z1/6
         LgM1fsELazBdRiLD/6VbVOJ/ABlqlMpUe0i1kuNI1ActbVBN84d2zTrDkU1u0ZRZU6lv
         OHam5zNiOqlp6QRoj+CH7COALJ9RklFyYpaV8CzQFtLP+nJ9C64LB4ZzRchuDSAFLWuN
         zZgY5fvMy35ot/QXN6vUEXmksM1vYokuLO7HFL7XKUJOSGHTlo++T1WDFBnol5MIkJE3
         bLXy+4DJCHclZZ/nCNFNEp3/XvAI/opPWkmVQlb96TtJamyQbROGHCW4AjVx2vTuOeS0
         KiMA==
X-Forwarded-Encrypted: i=1; AL+hErEgUcbsTdqANRS9WRl6jSaYUgzv/ntt62PqGeycarK/NMOyqN15nZSIxwtSFk/xmRizMCcl6A8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tXHUpR3l2d+UH4QPKFkneyzG3Jc0wJky3L41bcW6f7hGV6bo8
	z7d2bv6czpxPJXIk2TxMatcwWZLcvQMnzqCRu6R3sGB8aKrFJ7IHEi9r
X-Gm-Gg: AYBFou3bwBfpZ8+UFxmQx4ApDoE5dclryMAckOYb/Hk5fymY9ftWXY60537zOk3m1yD
	8mN5w2TbeZAwOjW3Me/le6q/SpUZ+Ny0N0laDeInX1R74+53yvx98BbIjZC1pUwmMcfXE7w3qNL
	OhV1m1kTTlS5pHLKBHMDoQxlY5Nl0+ONPOQJH899kQlAK3pjw+U35urJtdB6v6ldEgr3gd8FI42
	sc2wgpjTPYjeyJAqonmsWTE5NJRIzGGiq5vlbG/PYCFQmU39CmLR4TAJYUwd0uWe8DWbf49j4Jr
	PVn82IyrXtEdBPoTjEd7RhQEzt1vUJe7jBUoANwUCordyw115K/4FqARCCn/doUYeWrabgyV+2u
	CklvmscQKToOK4K4z+GetHw4iLCiMf7njDCzwVBeGxITh8WLjB3Gh/hfHnMBow+vpaLyRO8DTfO
	dBheotrK5UDJJbfHq4ovqWZLwdaOu2aGYLKhwJ3hv+X0AeW+cKNSnEqu8J2T1nHNCtgGJSypsWn
	P9l7m7JfSyYRy1UjhogOEsLv3yIb8gzMC3rqua/uKEu/+PwYp/c6tb2naj/fe0g3p+wvM+Jh/q8
	TO4ps63UoD+lFkzG250rMOxPrHQr6fCJTyON0FngeG2+mH4QCGgP5zsPvhDPucVKXtaGipBbT/d
	Cyo3mC5cced/7GPUdH5dNpSMkjXaXlNL2Iw==
X-Received: by 2002:a05:600c:34d0:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb559f3737mr101333915e9.4.1794653098050;
        Sat, 14 Nov 2026 02:44:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:57 -0800 (PST)
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
Subject: [PATCH net-next v20 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 14 Nov 2026 11:43:51 +0100
Message-ID: <20261114104426.235620-13-ansuelsmth@gmail.com>
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
index 2bf7a1ecebd6..11f03f985c2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1044,6 +1044,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1756,6 +1762,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

