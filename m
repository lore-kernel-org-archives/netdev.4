Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222108;
	b=AuDFp9F4pA8loOux+CKnB6mMC9wgnomvK8LVbSFEn5TjFsQFO7Chkcp79zed3n/MLE0u
	 DV9Oib8p+pCAvG5jeCFrP+uIW+fopESDPED1mo+tyaTPyNsKBhnlwFDIR1DH+MQwGZpAX
	 DGLtbLvbKXQC4upe1gTXm0Lnmybi/HEPH1rx1lRshqDtofuD7qj6W7CUW+llFU+MR2VtX
	 aGv28JtnQZtjRIurH9FQgYKdpmIhEl7Mc39LoXAf7Mtz1pjF4oZgsbGeHXwNMYjPDtozq
	 gUjuP6UZXM19wRnO6o++6Owr/VnBi9x3I3CzoIzWtgTsaiISAZs6VhCMHNq+EPq3oKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MwfzvTv0x0cb0+KwHKdlTWaN0+a4w378ig/9ybBrmuY=;
	b=RsJ30vqgtgw+kvAe9gxFhLg3hTEG/FT1rqOs8xOPlYClKSdV65HCCx4n5GmOjpH1ddTz
	 Mn59tzldizz4kzSxwpqOm/VwVWOlXhgfDolawF6KerDhvFfJNYQrpCuRG+MIWFmUJ6dhQ
	 r90T3thqPlXi8NIIKkVZbXl2rvbe4FqJ3jmGnY6tLNxNTXbWK0YSbWIPQaYv+W78XL5ie
	 E434u8v2+FsiUhY3hCWBbPaAWT2VD/j4jfsA/k7sB/2z3DXzpt2B3xZmMm80qn/Xd5x4v
	 mCn1fPhx+vUImQv7TmGnZeEcbTz1/6E6kXBD2n1z6pm1PQuVCITq1nPACXedShtaWQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXgr5u+6;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4E8606A6AA
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F4E8606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXgr5u+6
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so2392844c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222104; x=1795826904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwfzvTv0x0cb0+KwHKdlTWaN0+a4w378ig/9ybBrmuY=;
        b=bXgr5u+6ih3KVrxqwFMuyBXs8vSIs9EdY9cgCC/4mkj1SVtcMA0sD1+9QNPGkShfjT
         Q+5XEAre6TojMjEO1zYtL+xjHftp3xhF+nAb6LQvfh/SBATvhSIjEPRMbGboM1qCywly
         uPHM7qioGeVFZ8DupT1bnmwDYAXSR0suLYxS2SWZTVnFjyVLQneaaEwMHv89Ev0GycDm
         vlMk75Rb8KIYISHHOYOlaovX91q5tWsQafIFXi9B6vOTueJc/Jt/+NnhIP1uyUmkD1ev
         aP5P4Z6SNTPsA//ibAfhDRNlm7pp6PgE2LKrDvkVJpVtAxEhYpEaCzTKeWdZMt4gRt5i
         9N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222104; x=1795826904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwfzvTv0x0cb0+KwHKdlTWaN0+a4w378ig/9ybBrmuY=;
        b=mJvWaopd3QOXqqZBEXn52ssngRGCjC+vxashD2EKQRwnJpKt5Uzocy+FQyU6qC0xF3
         3RsiWjMVQ29tEUvaXAIAYu/znP0oFdQFzB0uJjpN42Js4xyyRxxBGRm6LVbNOYHCnY/p
         8jY659AdJDU0ChXulbct2Hi7C4nD6D0ossW0yE1W6v74Zq38zAw0QbfyfLSVqUeSRoTs
         9AjD8NixsbIt2nBgcWf8vbX6OFeKRpzJdXbtVwygi7D46JlilCVPKSnQ/XN7DxgjcgN5
         sASkZH95muelj/2yQGKo8VotlRvJG4jX+AijhBUdhXNKX9EWm4o+Vu5rPKGk+mNIY/YG
         5U3w==
X-Gm-Message-State: APuU4Z/37uM25Oda9NjqXLmsWgOpTCXH+iOIrFZ9jkh4whsAMRCLdN09
	hxYrZoNCStmoeG3elLgv0dx0Xrre+YM0fmKIwEA/qWYbUnhGq+cYOY7aVxXc6A==
X-Gm-Gg: AYBFou3HvklfDAl3SaoduPFyzSqFpxJ/U7nmsUSnC8SZmPCfJn0blF6HJJoTzKwhbpx
	jcocWoJK1KNdaRUURiCgJ74/+cvgE722zdioMIYSxUoeMTCFm8LMN+CUCOHtTAePSH7Hc38UVls
	nNlr2Z35Lsc2I+1XRYaTuEHwMNtmlhSjIHCsB+35tx4YI+ZwzbEOD2rJMurIzz3QUPJAzCNGdTb
	2HixeRXZeNVyROtg16MaRSnjhIGXgu5FDI4OfUKC7XP7EME3XwKdPQLnb1pWIX85EnUgofsuwkS
	8yNMsSqkebnk2OzRQhnloKeKraoUlGONnn+gzItoKAsD/8emtSKRB9F5OwTuwYwRIdP7bYQwuGi
	SASKmBCDs1rP5J5MyUKLMUofi6yiRcmBvj4xlh8DRHysGYHeJuabkvkFjuMI8o2F5cUyxsliJNP
	PcIMsgfQ6ZEjVVBuKhqXqLoE/1fjdjgHYjGIxxNNvFaCMlFjho7Mv6KwkWdMM9Co9UH3KtjVaUD
	qOtos8OaEZlT1ti1g93ly3CcPK94Y7Ig+zPTiOqXThfJN86q6iOcuq9vOdJwvQeqdZFC6L6e6YQ
	fHQ5xAcp
X-Received: by 2002:a05:7022:295:10b0:183:e993:7901 with SMTP id a92af1059eb24-1b556898be9mr4256668c88.17.1795222104119;
        Fri, 20 Nov 2026 16:48:24 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:23 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 08/10] net: phy: smsc: wait for LAN83C183 power-down recovery
Date: Fri, 20 Nov 2026 16:48:07 -0800
Message-ID: <20261121004809.1690280-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

The LAN83C183 uses the generic PHY driver, which returns immediately
after clearing BMCR_PDOWN. Section 1.11 of the datasheet allows 500 ms
before normal operation is restored. Starting the Au1000 MAC before the
MII clocks recover can hang the MTX-1 when reopening its interface.

Add a LAN83C183 driver entry and resume callback. Wait for recovery only
when BMCR_PDOWN was actually cleared, and propagate MDIO errors without
waiting. Resuming an already awake PHY does not incur the delay.

This supplies the PHY recovery delay; it does not by itself fix the
Au1000 MAC/PHY ordering on reopen. The companion patch, "net: au1000:
keep the MAC stopped until the PHY link is ready", resumes the PHY
synchronously before MAC initialization and stops the MAC before PHY
suspend. Both changes are needed to address the MTX-1 reopen hang.
Keep this PHY change first so the recovery delay is available when the
MAC sequencing fix is applied.

The specific PHY driver must be bound before the MAC attaches the PHY.
For a built-in au1000 MAC used during early boot, enable CONFIG_SMSC_PHY=y.
Module configurations must arrange for smsc.ko to be loaded before PHY
attachment. If attachment falls back to genphy, loading smsc.ko later
does not replace that binding and the recovery delay will not run.
MTX-1 validation used CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y;
the boot logs confirmed attachment to the SMSC LAN83C183 driver.

The LAN83C183 and LSI L80227 document the same LSI/SEEQ OUI and model 4,
so this ID match also binds the L80227 and applies the same conservative
500 ms delay when clearing power-down. The entry otherwise uses generic
PHY helpers and does not program SMSC-specific registers. Hardware
validation is limited to the LAN83C183; the L80227 was not tested.

Sashiko AI review identified the dependency, binding prerequisite and
shared PHY ID.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
Link: https://datasheet.octopart.com/L80223-LSI-datasheet-11757091.pdf#page=73
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/phy/Kconfig |  2 +-
 drivers/net/phy/smsc.c  | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 30e9d22c8d1a..10466b2574eb 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -421,7 +421,7 @@ config SMSC_PHY
 	tristate "SMSC PHYs"
 	select CRC16
 	help
-	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
+	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs
 
 config STE10XP
 	tristate "STMicroelectronics STe10Xp PHYs"
diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index 48487149c225..c0713017e54b 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
@@ -684,8 +685,33 @@ int smsc_phy_probe(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(smsc_phy_probe);
 
+static int lan83c183_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
+	if (ret < 0)
+		return ret;
+
+	/* The PHY needs up to 500 ms to restore operation after power-down. */
+	if (ret)
+		msleep(500);
+
+	return 0;
+}
+
 static struct phy_driver smsc_phy_driver[] = {
 {
+	/* LSI/SEEQ OUI 00:a0:7d, model 4; shared with L80227. */
+	.phy_id		= 0x0016f840,
+	.phy_id_mask	= 0xfffffff0,
+	.name		= "SMSC LAN83C183",
+
+	.get_features	= genphy_read_abilities,
+	.suspend	= genphy_suspend,
+	.resume		= lan83c183_resume,
+	.set_loopback	= genphy_loopback,
+}, {
 	.phy_id		= 0x0007c0a0, /* OUI=0x00800f, Model#=0x0a */
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "SMSC LAN83C185",
@@ -887,6 +913,7 @@ MODULE_AUTHOR("Herbert Valerio Riedel");
 MODULE_LICENSE("GPL");
 
 static const struct mdio_device_id __maybe_unused smsc_tbl[] = {
+	{ 0x0016f840, 0xfffffff0 },
 	{ 0x0007c0a0, 0xfffffff0 },
 	{ 0x0007c0b0, 0xfffffff0 },
 	{ 0x0007c0c0, 0xfffffff0 },
-- 
2.53.0

