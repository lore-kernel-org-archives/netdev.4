Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521898;
	b=LtADK4TXxR8eLh8R2n4lSnj9QYQPLGcLL19uv49hrfWNa7zOee5zrUnawCDomgexV7Hy
	 BFkc4vOOYTTUKasSaS+bV6dT8dj8GUA64ppQ53yxTKBgUueCcx9lQYN/YxFW71syUczDv
	 rFhjCHaQDvrjXswLkBy0g2CqQGsYUHhdncPWfCDGbi6pWL2XLYOicy47j7fiCiy5AYYkr
	 opSgxgkMCOQR2Y3GAmmmZUYAasC9egMVDgbi6lLNLoNsEkBupnBNGgiMtYNfqyjgoMvGY
	 579dcPzCiLaaioSmGfGAIaHU8gPBsuXM0oeXphTFwhmyrgWPaRlzqn9OSEbxTWhCxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LLGN6wOiEFOotHX6h8mgF1+AC7lplgrGazriMiESWlo=;
	b=SyEuKFHHII1aqfWTch61vBHvtE+jnIzZzNVsRnf5UDhtxtsqG/k8h9TMN6HXHEN2OTce
	 RFHCK2tHKY1UpgXdoSXMqsTRRAFw4VDHubndvNbcKRcMpqOEF8CL9/F65WUo/qAuiklfc
	 a2MEUI4gIRdS2cSzJZUEjKMFJihJBuKHf4pM2uEy/KLahWAhAs54K9ONlXH8Zfr19Ubel
	 YvbwCWZ0MnPADuCKuLbxJSR+XOZ/sK5CRp/vGgdrc+pFiH6y9PNKt+3uvbbDG0RjYTAxj
	 olN059acqXnIrcVaf/v748kwPu5J4p8j/BaFgCY5kXCIpbubtDMbKnRm3JG0UkwkndA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Iqr87LtP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B6606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Iqr87LtP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so45054895e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521896; x=1796126696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLGN6wOiEFOotHX6h8mgF1+AC7lplgrGazriMiESWlo=;
        b=Iqr87LtPSWs4SNrXQjGqRRgjjJPFwxtdDmnpr5Pvram9LTIReh9hxm1UtYzVzo89gs
         81VD4/f5Ud6JBMcHz685JLWUlYXcP1onp83MKqNJBlstVcDJ1T/fkrtJ4qNjl9bZzvnT
         5qLzGx9Pp9U/w7APh9d7h8hQLdlHqGIcmL6/+Ixlc9lFngTy5vApklKp7QmocJcjKyM7
         AFE3rEpNEmNifirNKnjPkCt8UiNsqgjM01PKihFeVbUaviJTENrb4uTkQ5WhMORpDNDd
         SCNWK9EcsFUet4Lrqdq1Gn8TPYMnAtR8t5nrrxtiykouETc/S9P02jdndH5AzX23jq8G
         0BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521896; x=1796126696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLGN6wOiEFOotHX6h8mgF1+AC7lplgrGazriMiESWlo=;
        b=B4POsC1AV1tSUsE8N5en/EzZRnDEz0Kc7YHLzfnRqfEzuVLCIq4PfDmhRf/TvIHZfP
         zZNGGTKy90nwAYXXrBXXLN14Lq7GDbpymfw7csfxYKzI2SnICfolrO7lrHVI5FgBftVE
         /KaiH0sRGODWy3hnJckbykKwT0+jRpaQs7d//U+U8Qk24jYaDRcLskFASJoL+5ZPTco/
         zwKjlfogCswrKk20ENYeCe9ke2rH7U3JcAuxTgav9xDamzBga29aktTQFPmWSO5A+peT
         n2q1JilBXORok8cB0MYxxnr1jySX6V3jaOseYbQzXRKX+D7JYFhEoGWJLr4XTOtK+rPP
         wD5Q==
X-Forwarded-Encrypted: i=1; AL+hErE4YcuGYNd1f6ych9Wb29nZPxXn13QcT9RVDVenDo/9TuBkFC6IatOlrT4PGvMtNY+xjt5LmVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kOfJedGMBqTPfwaYHONHgQOvNhEvHfE+6etTx3Nw68PxW7RIb
	/h+1tQbJSZmN0X3K+90zSir9mW3ZIFfHrUXsYq9jGooLrKXIU3EstAStIvLS+js/e3k=
X-Gm-Gg: AZFdTZfsZuhbbxxFVKquKE1bWrYtBf58TPaHCVduo+2om1xH0umz0KnS1ppWzX9RfOY
	hWj9Kp24EH9+iD1glJvX9lQm+7v0y7A4dVqUz+XG0oECtTvW8H946JkZOhyija6D6sSNyFEZeAF
	+ojHAK8F02PsLw7CxXxVer+6452ZmnjA2NeEB5AzFnHqe4tPrb6nAFInEBjzT4z/ZSogtXeO8Lt
	DNuApZDiAzTIOLwJnupvceNc04kYMhLELV6L/u1r6Q1CT7Bh3OftOez6mOL9qQFeplVvVtKDsDB
	R4lMmSSm2kX6AqhvZn/f3BWKLF5j41j72D9W7jCRH1CdXISc8LtwzKvKmuTpZtcoeJMCp+042dL
	syMPayLZX3/Kzwglunnw/3n7yN0BaycbDVlBnIWTwzUCFxap9x7YxLWvAKdq+bbGBgvRYonayIG
	uWuzAZeo2yx73QhFcNhGWKQ8BpVAlX5r8MRlfxRREYdlRtg8Bi9iYSSLExZQK9+rptXJauhxc0L
	J/xXb7o/C5t8hwUBgySPDHgnd1QlT/y+Ie7JXus9n1ihwGDizrZ1N+BneosWgP8+SBvTdamoatd
	d8Y12qeLpX/vxmjMPKYuhFoP9QCtzVErEU0gXnzCkj8J/JP3ua6r2DhluyB6lws0N97PJ2czklg
	XLC7DauPKuA==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr344006135e9.29.1795521896168;
        Tue, 24 Nov 2026 04:04:56 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:55 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:33 +0400
Subject: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4861; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Van/yrApyWlOlFkwgwXconrk/JcQD3PkoD5ILtTXY9o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gY7rLDcvNDlkPmrKWHeOYLPKvObWPL8OFji+11fu
 X5ZIS7YMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTX5DD8L7czzew/0PJhyRft5x+aV/gdtrRqj4nSEu2/JdA8Y7uoJSPD9bnf45T
 +5kQxp7ll1V+Nq4nYfVdXNX/9wqqnsQLRWQGcAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
ID in the OTP memory and patch them into the device tree they pass on.
Kernels started any other way, e.g. straight from the SPL in Falcon
mode, end up with random addresses which change on every boot, even
though the CPU ID is just as readable from Linux.

Implement the derivation for cells marked as "rockchip,cpuid", handing
the result to consumers which ask for the cell as "mac-address", such as
of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
so that the same cell keeps serving the ID itself.

Follow U-Boot's rockchip_setup_macaddr() exactly, so that both yield the
same addresses: hash the CPU ID's lowercase hex string with SHA-256,
take the first six octets as a unicast, locally administered address,
and XOR the cell argument into the last octet, which is how U-Boot gets
eth1addr from ethaddr.

Put the address in the first six octets and keep the cell at the size
of the CPU ID, as NVMEM cells have a fixed size and MAC address
consumers accept a longer cell.

Hooking the derivation into the OTP provider rather than a separate
layout means it works with any fixed layout of the OTP cells, and needs
no per-SoC knowledge, as the cell already gives the CPU ID's location.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/Kconfig        |  4 +++-
 drivers/nvmem/rockchip-otp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..5776d4e4b391 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -448,9 +448,11 @@ config NVMEM_ROCKCHIP_OTP
 	tristate "Rockchip OTP controller support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on HAS_IOMEM
+	select CRYPTO_LIB_SHA256
 	help
 	  This is a simple driver to dump specified values of Rockchip SoC
-	  from OTP, such as cpu-leakage.
+	  from OTP, such as cpu-leakage. It also derives stable Ethernet MAC
+	  addresses from the CPU ID, as Rockchip bootloaders do.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_rockchip_otp.
diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 7eb834516ab4..eb91e7a34051 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -6,9 +6,12 @@
  * Author: Finley Xiao <finley.xiao@rock-chips.com>
  */
 
+#include <crypto/sha2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -67,6 +70,8 @@
 #define RK3588_AUTO_EN			BIT(0)
 #define RK3588_RD_DONE			BIT(1)
 
+#define ROCKCHIP_CPUID_LEN		16
+
 struct rockchip_data {
 	int size;
 	int read_offset;
@@ -319,6 +324,48 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	return ret;
 }
 
+/*
+ * Derive a MAC address from the CPU ID the same way Rockchip bootloaders do
+ * (see rockchip_setup_macaddr() in U-Boot's arch/arm/mach-rockchip/board.c),
+ * for consumers asking for one. Everyone else gets the CPU ID unchanged.
+ *
+ * The address takes the first six octets of the cell, which keeps the size of
+ * the CPU ID. Consumers only look at those, so the rest is left as it is.
+ *
+ * The cell argument is XORed into the last octet rather than added to the
+ * address, matching how U-Boot derives eth1addr from ethaddr.
+ */
+static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
+				 unsigned int offset, void *buf, size_t bytes)
+{
+	char cpuid[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+	u8 *mac = buf;
+
+	if (!id || strcmp(id, "mac-address"))
+		return 0;
+
+	if (bytes != ROCKCHIP_CPUID_LEN || index < 0 || index > U8_MAX)
+		return -EINVAL;
+
+	bin2hex(cpuid, buf, ROCKCHIP_CPUID_LEN);
+	sha256(cpuid, sizeof(cpuid), digest);
+
+	memcpy(mac, digest, ETH_ALEN);
+	mac[0] &= 0xfe;		/* clear the multicast bit */
+	mac[0] |= 0x02;		/* set the locally administered bit */
+	mac[5] ^= index;
+
+	return 0;
+}
+
+static void rockchip_otp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					    struct nvmem_cell_info *cell)
+{
+	if (of_device_is_compatible(cell->np, "rockchip,cpuid"))
+		cell->read_post_process = rockchip_otp_cpuid_pp;
+}
+
 static struct nvmem_config otp_config = {
 	.name = "rockchip-otp",
 	.owner = THIS_MODULE,
@@ -328,6 +375,7 @@ static struct nvmem_config otp_config = {
 	.stride = 1,
 	.word_size = sizeof(u8),
 	.reg_read = rockchip_otp_read,
+	.fixup_dt_cell_info = rockchip_otp_fixup_dt_cell_info,
 };
 
 static const char * const px30_otp_clocks[] = {

-- 
2.56.0

