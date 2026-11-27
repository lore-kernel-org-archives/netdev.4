Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773027;
	b=c4xo1xv4rHmkNoNowSb5fLWyWfDax5kXsbEk75r7agrcai4CHcbWQ1XlppjlUIxrNLPu
	 9X+D5gYoFOSC3BzXLmNgiY2ekJ+MPVRyi/v3jyyzayGj58g1pMK+zN0yD3VWYYOYYFu7S
	 /oR+qKKlbA7K5iajgbmdL4AVxIhdDlpBgYOcLV01+BXpX/LhVQsfGbasOQyGRc26XhYTg
	 EBG0cn15sv3vzD/KvWOldTu0BZscM4OCi/yP73fD3zCS9N8UzlzGP3L0qpliGm+WGjizO
	 ns1XokcFEoLop2GCuFzjfMR9eYuv7422Jbu/9fllZME0w6g6EgFiJMO9xygE9PuwYSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2xlrTiIBui9aWfAFYWzg0cTyKWGnnEE6Rn3039eyIJI=;
	b=f1x4cMsgmmTbiRVlk7QFFrySr+LDC/fURJXyGv59F9ZIGw2BnDzAMxQzmtNn05Ruyog0
	 +2/DeKcUdAeBbNaLmuTYq0yCcer8YCaGHF6tSDtJlhj0L0Td0eZe3U/+xgYZf4sXnglfM
	 x4lw79PhrMNunqy3dqW/t7GDhS44wVNWjpQOjBcpwux07bRBh9Pm8IafDkijSlCCuZw9U
	 Bz07UTtahOWAwkRDrPEm9dw+EpnDGL66ilQRu/PixkIW1ojJk/hbwrKFBVHp40rxttHlC
	 oKmhAMxZ/07kus/GyjByvloE41KNitO7bHQW8ghgbrR2PAUcrFE4zG44qjJZrnVOBrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EqxML0rP;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84006606A6BD
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84006606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EqxML0rP
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso3585127a91.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795773027; x=1796377827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xlrTiIBui9aWfAFYWzg0cTyKWGnnEE6Rn3039eyIJI=;
        b=EqxML0rPRNfqd6fRax7B+Ck/Gb72pGiaqHpZ6eonRbbijpU88jMaIjUbjUJUT+iRu8
         LsUiwz+DuMz85znO/na0orkZSP/DxcTh3FAtysAXu6uC04UDUM9T8OZ+QfVGi/96Vqpr
         nbTC+nWEA/HfcxB4upsh7DEMgXQJibFeT922ZCr/r+SkuDIfUmA07Ql4kr/DpuI1RJyk
         8h894A0YYLAoJj60u3uvf/hHyC33Ym/IMV7s/AavaXOT2RlRgqTIhPL+j25juZ+6B2oO
         cAYADc0eWftfM3vZ1iggeqQAmb0+9rMV10IR6DaQrXSN48CN86Ruovbh2mnrOYacahtu
         ogFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773027; x=1796377827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xlrTiIBui9aWfAFYWzg0cTyKWGnnEE6Rn3039eyIJI=;
        b=MQyfWRlgvmBSM4w2CpWEPknncSrxN7KWNpLtbIZO3VGSq4fCGx47ssf5ALXPkAlO5y
         iof0uqoGDlzdoPD7h9Oymn+J6Xc6PO7NF52nTV4XiiDptueGHwx6s01iDunR6ZrRMiLr
         Az0WRs/8X8Zpf6HkGzAEpOm2poeUNN6y1k+00NTWv5aO14Z42hVR5IAwuS0yEWo63+ws
         vgceXGiV3fAUKaaHUkcCRwHbWb3H1VUu4W0onknm+cT8ishmjvbh0E2ZyKTgLMOfpN35
         X3WilFary/C/ZZZIGBEFq8xYpirhFgWXE81TB9seUOKe/tORZubrjWoTVrFjUGSmkArx
         K94Q==
X-Forwarded-Encrypted: i=1; AL+hErHUMuFIBkpV8KlOHbNSZcV73xDwPFfNCxSIdN58xkB39cvrNDpUCkoQe/ZeYOXsLbdRIG9UjmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fz9awaJcj9XiwNNHyJ0GIbnLlcxMJ2rwaQecr1IXGADHZfJ5N
	R6RE+NlX34TAqnAdr9apye1SRgOeixluvJpqmCMmZa6qbKjtwMLa1WoTBsSeVpREI1k8zEJEcMo
	mO+N5L5XDVAI=
X-Gm-Gg: AZFdTZeRBII4eLZ/9Xi62RUu24LEN834VXlXkIEJzt/qlU9xrB0Aod/FINrjJfKe2M0
	vcZrimaPKs9D5Avp+rq55DM5b/hZPArvuUFvpziHOmgUq6cyPxd2iiKjHEV7b3hA1fVe6i88oLH
	NHiPL/a2tbPs9153ODYyvHXuBYotbcXSlUVemDep+2nj8vu19BmqKqwgwcIZG6zELPraJMGhHTj
	xrSk4kYBH15/duYYXs1HJbXzo4tgyRyGJ+05l3/lbj5ci1ny3UD+TxZMppWFR9szxscRAVqx6fz
	hUQiNPT3LAi++nMNNY3Vz3eZr3UTNSOZglvaLHQQHngRXSZKc073elVJt+z96EedXTTwZToPypj
	c/fnINZxDcIY2WhDBX0AB5z86LgGJJTqoYHVlmsx0j30uI+Qsxj76wwBOtCOOyvy62axS5NWP+j
	bGgq/9VFFdV0RskxDG0e4b6O+Al/aXWlDxe1gdnzFGBOkuFZ8M6Lp3p/OcUFX9mdM6xfrDWOhtW
	UA9aplGAVu4STaE1k25tIxu7pXQnBVQOSAYU/dv+mB7Xhx9VRQnXSzdSWUSZXZyirsahI8EC6Xz
	NWEoiaYn+v1nrYakJoXHlqeWGc5uTWTU83Wd2rrRdD5e9KsgZIpe6OSMU8qYcy14zNE6tPwXEzi
	HDXKBxMYAd3mx11NRQm2LDicQeNy+oyVcMib8YbM=
X-Received: by 2002:a17:90b:3d4d:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b41c8d49abmr24266435a91.12.1795773026763;
        Fri, 27 Nov 2026 01:50:26 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm27539126a91.9.2026.11.27.01.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:50:26 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net 2/2] net: phy: broadcom: fix one-step P2P timestamping
Date: Fri, 27 Nov 2026 16:50:12 +0700
Message-ID: <729e09f62c40ac871cd6aba1a66f78db4706c61b.1795772837.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795772837.git.jjc@jclark.com>
References: <cover.1795772837.git.jjc@jclark.com>
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

On a Raspberry Pi CM4 and CM5, with one-step P2P, the BCM54210PE PHY
sends an incorrect Pdelay_Resp: its correctionField does not include
the time between receiving the Pdelay_Req and sending the Pdelay_Resp.
This is because the driver sets up the PHY as for two-step. The peer
then measures a path delay that is tens of microseconds too large.

With one-step P2P, use mode 1 for Pdelay_Req on receive and for
Pdelay_Resp on transmit; in this mode the PHY adds the time between the
two to the correctionField. Also skip the normal processing of an RX
timestamp for a Pdelay_Req, since in this mode the PHY does not insert
one. Reject one-step P2P when the filter is HWTSTAMP_FILTER_NONE, since
that filter turns off the PHY's processing of received messages, which
would make the correctionField of Pdelay_Resp be incorrect.

With this patch, on the CM4, the path delay measured with one-step P2P
is the same as with E2E, over L2 and UDPv4. The PHY keeps the UDP
checksum of Pdelay_Resp valid over UDPv4 and UDPv6, still captures the
TX timestamp of Pdelay_Resp, and handles a Pdelay_Req and Pdelay_Resp on
either side of a second boundary.

Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some Broadcom PHYs.")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/net/phy/bcm-phy-ptp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index 4b24ba7115d7..42bd280ec80c 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -399,6 +399,13 @@ static bool bcm_ptp_rxtstamp(struct mii_timestamper *mii_ts,
 	if (!header)
 		return false;
 
+	/* In one-step P2P, the PHY updates the correctionField of
+	 * Pdelay_Req instead of inserting a timestamp.
+	 */
+	if (priv->tx_type == HWTSTAMP_TX_ONESTEP_P2P &&
+	    ptp_get_msgtype(header, type) == PTP_MSGTYPE_PDELAY_REQ)
+		return false;
+
 	data = (u8 *)(header + 1);
 	sec = get_unaligned_be32(data);
 	nsec = get_unaligned_be32(data + 4);
@@ -801,6 +808,8 @@ static int bcm_ptp_hwtstamp_set(struct mii_timestamper *mii_ts,
 
 	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
+		if (cfg->tx_type == HWTSTAMP_TX_ONESTEP_P2P)
+			return -ERANGE;
 		priv->hwts_rx = false;
 		break;
 	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
@@ -827,13 +836,18 @@ static int bcm_ptp_hwtstamp_set(struct mii_timestamper *mii_ts,
 	mode = TX_MODE_SEL(PORT, SYNC, REPLACE_TS) |
 	       TX_MODE_SEL(PORT, DELAY_REQ, REPLACE_TS) |
 	       TX_MODE_SEL(PORT, PDELAY_REQ, REPLACE_TS);
+	if (priv->tx_type == HWTSTAMP_TX_ONESTEP_P2P)
+		mode |= TX_MODE_SEL(PORT, PDELAY_RESP, UPDATE_CF);
 
 	bcm_phy_write_exp(priv->phydev, TX_EVENT_MODE, mode);
 
 	mode = RX_MODE_SEL(PORT, SYNC, INSERT_TS_64) |
 	       RX_MODE_SEL(PORT, DELAY_REQ, INSERT_TS_64) |
-	       RX_MODE_SEL(PORT, PDELAY_REQ, INSERT_TS_64) |
 	       RX_MODE_SEL(PORT, PDELAY_RESP, INSERT_TS_64);
+	if (priv->tx_type == HWTSTAMP_TX_ONESTEP_P2P)
+		mode |= RX_MODE_SEL(PORT, PDELAY_REQ, UPDATE_CF);
+	else
+		mode |= RX_MODE_SEL(PORT, PDELAY_REQ, INSERT_TS_64);
 
 	bcm_phy_write_exp(priv->phydev, RX_EVENT_MODE, mode);
 
-- 
2.56.1

