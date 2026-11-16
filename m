Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790714;
	b=iw+vOa3CSHFWL19fRg/lJ8UvSfSIpeBE4Iys817lyvt1WfttUYVJnyuBcXonZsdZAE5J
	 UhZKWgDTpR4fPEj2Hf4XeIXPlngWHWhmz+PbV+RBWYIeinag7PAOvlGNoVtNmAbhT6pw4
	 MnlFwJ2idARDJYWRk+x+QjwiDhM/t8zKAQ1hjSsH6UWRiBi7KxHHLEDDrs/31Z0ahFuDd
	 8eW710JAAEQxAsnKTBrpfxPvZYqYKSBRPfmib6sbJl2uALO7l9NuP4JO8TxjQ3I33ZPdS
	 rCtFtNDA2ddV5NObTNJGS3PbN0gBY7yNUMntyzxjXiq9eNRr1HWxM67srGVkUTsi6pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
	b=Xa8yZUu/mToqHOH3LP6Wl1wCMFxyev/BD8cfgqkd2KBmXX7lenH6st0jjXME4ED/9+lE
	 Kh753dhJ7esnhw66nHdtbDJQaMRONvyY2gacEzrxkbZMkxT/Yii7kZR8AMhNo1rakStZZ
	 GNqwa717/t5YMr+ysjNOHBwZOWqCCUI+leHA5at8LC26Ke4GOMMBB9ntWi76xrHHLSHKT
	 XlR/Ar0vBLup56RFmHmFpo5lDLo5LvALeqWwUFwBTNDda30HKfhVdR9/M8N/GdtRnOvVB
	 Sap3XNlWbMHY+NZIH9wILA11HcyGzj52ebRGrr0w6JXNMF+MvOTBAs+ou3ABlFH0XCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adFyubNR;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA5606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FA5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=adFyubNR
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-845788309b4so1863614a34.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 16:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790713; x=1795395513; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=adFyubNRyB5lbr/hbuJZuDoA/tbLWVfkKW2ELRSEWEjoZpiAHrfISaOdGufHSs0/xu
         BtGZfpmq5zttVgvUP+TuRpGIlYzRVvTp5rW6cJtX14IeC2SCRw22XvOebTvgK8X3OaT4
         s+/kdj4jcoTpxuutgxdxvVupZBGz6tVrr6/wCNcq208GktgtwD03EQWXaTCBHivDJjym
         Q20QVAYcAUoufUDnetnjxvdr++/3DSExpEBOUDZq2i00iu+4MlE7PGfI3x8zhVOXTsI4
         jjZco4sEmUFW2SIeXZv4IPVvLVXsInSyNqphSUAusWOlZFAxgaKvyhSy8RIIAaqx60JT
         gLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790713; x=1795395513;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=B01Zg9aV0xkkS2ETQiwDCIqFhFLrenATvjzqJWNi9VSDWkti1hPBdtpOKmXI5Rer/3
         QkYWId4g+Y45SCD5TqW+Kc0qvFQDz2bo0pJEMXE/YRosZzRqILWIniVVrAlAhh7tBiXO
         VjSeTN+4bjy18E5maMVT5t25P8yTm2ggpNXYyEtutPoeHxBKW2HZ1f8m4wfSHT96qVPf
         DOLk02AqcSQlDOl6tTuVLgRCmN/8zRb56/wGyDGkIEX3c3da8kLO4gFcNEuIgghpKMzI
         4IId391A0/GEthdVJqz+OLi8U7hz/b5UDrQuf6fSbX5HiKDGtgTsbpus5q0osolUdAvu
         18pw==
X-Gm-Message-State: APuU4Z/dp7bo1qWiHoYUz7XWyeq+tY15cnKLG3NFfnrG+ulFalv0W6e9
	fxO0ZE2Vhs0paMqVDP2n+hXejSBaj3LkrcnuUyCMvSxTQhcFtd4z1PYY
X-Gm-Gg: AYBFou2RfctJdQRiDXbHkJB5nT8LYwJl3jvlT0aEYzd4TPgDU0bLrvb3unfJRj8pDZv
	zK7WvItz2ieK+mxE0WTqN++/RAnsGcvHL/udixA4R3i0HQ2a1jjDDp8+Aa6R4uZoftvgkgOKPK/
	qc/yjz1LInN1lnzWStOeLzmkNBHp83bEqym3wazU01HAXYstt/Xxmxrh1KNarT0yX8fLIBDRCrc
	IE+z/sXtQaTrrCVyAC9Im3iwhkfqkboykQ2vIAZQtfsrlFmoPzD3mOfbymM6DBZUctu+nfg06f4
	HeTNJjbXWnLefOzsvjPsWB0t90I7gOWorYdzColNx73xRu+iB5+OVlp7lymvOGKkb0KvPUJ5ikt
	2OfAoo8e2F2loOQbXOYEJRaJONaxknt0Xvegj8+8axAAr2b+es5b1ujq2ruivIFAzrK5Sv5UyYS
	C3Xb2kc6FfhkyfUH5M0C9ks2SO1CFGvsuk/igN4VRALO/XhLBgXqkf/cnRtLzO4LihUPonCQrTE
	1wr8shYjJgIWGKdPJzm1pK17A/AZOgQ5EvezZ6C2o9GxG5/bO1CZSlTSB0dtFzHNpfNpOuG2UDk
	qoAc9VYh/3BoAk/7MWdcb+nJ2c9uvRc1P6I6Mf+MpbLTPWB0A58gZhF5MlOvBHU87LTMgBSNKF4
	5VaAbf+EukSAEBwGAYORa7waJM9d4jTVN8GlXitqCwbNf8XF6J6N0M3F3+mV0IKatEoXVymVU9P
	berTdJIlC6xMKICBMvIi5ygtwHtAxcWadIIWuGfaUiMIdBDpwjXGM=
X-Received: by 2002:a05:6830:43ac:b0:862:af88:e9bc with SMTP id 46e09a7af769-862af891402mr4387234a34.7.1794790712901;
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm9545673a34.2.2026.11.15.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:58:26 -0700
Subject: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
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
Message-Id: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UCmkla8irhIx6kdJVEyaSmU3
 t2oq8/7i/c2MMkqBudmgyyLmr5SBTo0wFNId0G9VYbWtR0RebR5iFrqpJOixMCYV+RJ+GlzxIW
 QR9/50B/Z9Q6q5p1l1PWXuECSAtf/WUUP4fKVw75/ALUwtB6JAAAA
X-Change-ID: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

stmmac_set_features() clears hw->rx_csum when RX checksum offload is
disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
hardware checksum engine. The MAC therefore keeps dropping packets with
invalid IP or transport checksums before they reach the host, even after
ethtool reports RX checksumming as disabled.

Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
offload leaves checksum validation to the network stack. Preserve the
callback's existing success return value.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..98cc7503bdde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
+	if (hw->rx_csum)
+		v |= EMAC_RX_DO_CRC;
+	else
+		v &= ~EMAC_RX_DO_CRC;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	return 1;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

