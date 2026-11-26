Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662787;
	b=sLaJtgf4m2Qzm42uU+nX4PobxmfonOChzej6U1tHrWSwmz58hU/eX1UlMmmrAX4rzTUL
	 neJyQ93oRBwv8mo8pmamBGq+sIKTQ3x+NOInISStHfWAYou/5Dg/CFHMH+S+Gda3owGh/
	 IR+C6BU3fxmY37UXLxqiZarRWx5Grn+B4j96mDj2Ts7dN4yQ7g35P1DGF5VKp0rOArXiN
	 s5rX5D/LOqsOF8DGwJ+CJcyadXbrHZRFI52Gl1Qk7qOrK/lBfEO/9v0B9Wo50odRAQrXU
	 uG+bGhyU8ESo5sklmhsVI/bpIT/pXkGGN6jlx4ScOV0PH2+8zESC8ExhkOpIeyhZzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RU+8FiOFO30i4fnk/N8zX4uZnOpIMX6KLAJ62sGXpec=;
	b=umEBdV+8SNZ+sTdXfuPL8JjyWhVp+RWxjfoqfaWZpGQQe6bMxdwwiwMuNXpMmlCG3FWg
	 jjei3Wvw7T3caMrc6zVCITUzBX9DusW4tXejGsavC0QLuAzQs6KSOEVhGx6+hyLmlG/ca
	 Q+lfSu2l4ryGfnwoyYkpVyVX+vpP0s0hs4AJIkEggBHxvgShQmHroRcc5+ThVx4aoRuR0
	 x1Yk8qLukxZZ9Kus4EZUZF7V70LbcJuSWGu6Bj+LRJbpXxOSUAVB05dNwvJJyyRmm4PfI
	 r6qNp2DZUnNfRdjoBj9dsrtdvdZuo4mBIR1gn/KzrGZaWVEAUAJK7ax533xhQQakZaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qmA0KXyk;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51520606A337
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51520606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qmA0KXyk
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386d1859e1cso1137426eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795662786; x=1796267586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RU+8FiOFO30i4fnk/N8zX4uZnOpIMX6KLAJ62sGXpec=;
        b=qmA0KXykoaWxD83RQcYdwGwK/7TxSa/KUQDZcevXWaFEsr6yX3qocQi5ps96XxUi7f
         48ttXDb8RZ6fsyv6H2cAijkkpUBsqDXxXPBT/0wGhW2eUfVa0nheJDjv0poRY73XROsb
         d0T7josaLJlN40V640h2PiynLhF9yhzsL6Drd2sPFtAFyPN+5uv5EADmQRQ6WOZ1ei2k
         8LAqL0g7wTkk1z5cMO8af/qrjzBktp6FFFfOaqN4qNJ7OvL/2f4XnYDDpxBPFrYn+lbv
         Of32Ik3wPmTrLGWVxT+Px9rZhOitwCs8hWe0BUdBWUF78ApEOCUDpMTzsZYaAFWGbpd3
         YNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662786; x=1796267586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RU+8FiOFO30i4fnk/N8zX4uZnOpIMX6KLAJ62sGXpec=;
        b=JxGGZNUt9yRGY0/i9sOI7U7A1r1OSPaZZyT37pUpqSFLwxuJhELgMGO/SIXqqG/20m
         n/VLw+54Slv0/LkssZi8siQzzBhW4Xc5fwYVC7caz56D14ky1W2AMXK8BSVvT0w7YUK1
         mM5oQO7wMyhj8gTygjPu9wNa06RyO8sLX9ZLObbziJ1IgRfCGEJ1h4AHHInqKc+0SsYN
         0TJl1Jy+5JcTzpVgm7RAui8VJdAnXG36baEV6Icxzi6v30PLNr0DdYaAiqkqwRDc/QN1
         8SObIrOBdPqO57Lz0mPWve+OjmvSepxF9XjMF3yPwL8drd6xdZTxO42puRY8snBsvJcW
         OQ8g==
X-Gm-Message-State: APuU4Z8VnX4vfFEiykCXb267iK/dKIhSs8qPTlbDkpmvGFppodNiHVU2
	iofG3nVD6MOnjR8DR88grhGRvzLNTZE6I7OdtEUu8PtuDS669CU8ykxLjD27OKH8wA==
X-Gm-Gg: AZFdTZcFXiSt42FfxBlcCGFbYc8ElucqyVzGzi9BAVObbvtLRbpJF6gg1aFWZZiFr8L
	AXrefzwm/O4/3ZXEJ7LgO4+1BAipRoa1CWvjaT210HQsl7/H9fXebHaxWV7mfs5qRi9a5PS0SC5
	skbkgdO4LXQfVt5Q8n3VdDbcioIKOgS35oTmfULiWEA6r3ZDPfmYusJQrFJ1XXV5Q2S6JjFbLPS
	HJPOWn/GspskN3U/bKLuga1IHlssmDV/erC+WiFcD94PcwjOpJINvaOXfKosAgP+G2N0nXP5kpO
	t4AddhS1XlaIAzKXEErZDmBrQrx0n9FITux8CSqAUC6MMXTqEcfJ9PLZD0dMvmOwxu8RKoHLsSP
	dykoRhX5WPnrMLPZx9RlT94p5wpkF2tNAIdIuvFG/bLMQlvjEmKow5av/AHe2QX8onHVScssejA
	jDaGjZQ2M8LNqrsLItiEyyxyif6uNHTBhJAaZxbp8SCO2AHCWtCqg5HWapwRlIdwzyDTM/zYFdA
	WLjA9BxIGxfQUobF4LTS+RShgpBhpYdElLsaLA7cDTjUy/w4Ly3k86qLiwHgWgTU7buTxnLaaWR
	Q9Z4K3ha4YA5QDlQHbYuvRn8qQZibB/+zhufio/EF7WA1FCS/BUdRGeYfEIYm1Rzb8N6FmqHmrp
	92jsOVL1rKYIMrBjEAg==
X-Received: by 2002:a05:7301:3c0b:b0:386:d466:51f1 with SMTP id 5a478bee46e88-386db4e2b51mr2270203eec.4.1795662786330;
        Wed, 25 Nov 2026 19:13:06 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm70204355eec.4.2026.11.25.19.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:13:05 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Alexandra=20=C3=98stermark?= <alex.cramt@gmail.com>
Subject: [PATCH net] net: stmmac: dwmac-socfpga: disable split header on Agilex 5
Date: Thu, 26 Nov 2026 10:13:00 +0700
Message-ID: <20261126031300.211248-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
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

On Agilex 5, received IPv4 fragments are corrupted when RX checksum
offload is on.

This was observed as corrupted downloads on a Terasic DE25-Nano over
a PPPoE connection with TCP MSS not clamped. It can be reproduced by
running ping -s 2000 to another host on the LAN: ping reports every
reply as corrupted.

Agilex 5 has an XGMAC core, and stmmac turns split header on whenever
RX checksum offload is on.

Set STMMAC_FLAG_SPH_DISABLE for Agilex 5. Other glue drivers set this
flag already. The same failure with fragmented ping is described in
commit 47f753c1108e ("net: stmmac: disable Split Header (SPH) for Intel
platforms"), which noted that according to the DesignWare Ethernet
QoS (not XGMAC) datasheet, split header is not supported for IPv4
fragments.

With the flag set, fragments are received intact.

Fixes: 93d46ea3e984 ("net: stmmac: socfpga: Agilex5 EMAC platform configuration")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 3a89c4da2af5..28ffa5ad12d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -578,6 +578,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 	/* Enable TSO */
 	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 
+	/* Disable split header */
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
 	/* Enable TBS */
 	switch (plat_dat->tx_queues_to_use) {
 	case 8:
-- 
2.56.1

