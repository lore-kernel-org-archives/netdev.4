Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790160;
	b=ZxnGDtluZ7d0u51qf9eVOqaOPuDUAdDjxtAagJvlRU1stGM9zA5c5ClvOl/0HkfQMk6Z
	 2OAGz9ITOnkeuDqQtNk0ZlOAS42M+n84r396oP7MOY6FUg+dT97/r1tWQJz5Eo7sYuuvS
	 WzWrzahXQQ8p1Q6zdCF80K0nCuOPSrcHyAwSrZWAgCb4lCdpMkE96dI0TNaq/DkAUl1vi
	 gX8oOA/8/FdvqpxMUsoDp9TFsPp8g6ir4V5Ic9qFZ6HYMA+t2RHqq9oeZWXn7jWgfXWrG
	 Tzjmgn6WB0ntzTla1ODRgGjgaatXiH/GCAQDkVYRRS1KV8+9GoHIUOUdaY3Y4zUoDtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
	b=QHlvWymNEwnLBim+5IsRreRPMf+sr18veC4w+lfU2uKFtF5YrzC1wjfY6gJtnFPuQzU/
	 3kuRfRzTlzctLPdGdR/l5sbIFLXLtJhv3f7pVODUy7em7/RrPJWmMDXIumBOKWxp1GtkH
	 XqYzfIik0rDSXqUaLPzCFNZaubjqBOmVF0WmGSKZ9I6sjn3uxA24Ems7TLfvvGE0TeP9R
	 c5O/HFmvw/iQjLlsJkBgbcsa9UySOT2INpsZz6MdosHRKqJk6eAd2tg8aFMLYe9BZQxRA
	 IZct3I1Q5aYDj+gY8v1TKmIcYOq/h3gMddrnniqLv3xx7+LCsjqFK7LQOzSNTqFXBAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcGGRzgw;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8D606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcGGRzgw
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-86103aaac12so2668310a34.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 16:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790159; x=1795394959; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
        b=QcGGRzgwGQsL3eNKNOsWPVren8fyDGfV+MneFZ+EMg1vtK2Js/vzW9RDEpBcmgGg0j
         L5C/z1vMan0ckoUThnVwPa5j5JHJvYUupPi6Pc+4lqxjrZw4ebNTHMepsLj1l7ZY7KWe
         7dp0Fc0RaNG+1+nP3lUTChYHftGY3oVdWt0v4MFGflJ78cgE9htOrKw1uZ/QBakcEOqc
         ZCL6DxiJ9gEs4f9qLVTQ5a79hnBNp19o/JO25k1hDvrs1AshvpYSKDqhD6NI6s48HpIS
         ckzhpmS1dMD9T0/pR8F8rNNq9a92Y3e1QL22vSWlvfUmYO0UVf+vBzjApHa7JZda1sMA
         GDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790159; x=1795394959;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
        b=pN3CLcf4dNwXpOiHQtx/RIUCluJ5r16J9in30oz1YrSDzBupllb16epTiaIA/ZMDj7
         1KN7uaqDlPPF5RXXOsMe3X9avWT2jA2w0G3SctZxfF7ZuC5zZypTMthVKxERpI0jKLwf
         3pxwawDblHmFLe+lXyoWmLTpH6T+xHRgs5U6mhyIysbcAwlze8Y6rszDE+/YokBX+Ltz
         LwTvUeOmH3+ut4Ej4iGeXXfJt/jrVDOasAmn5rJwCzXp8ATPLOWC5VUYMZ787YIsUpr8
         MUS/eD4NFmLxeK6iRqViV2qN8yxqR1v5m6uWLcXd00LPvlbt53WVX8Mp7uq0CsAZxLpb
         C98w==
X-Gm-Message-State: APuU4Z/yLZSPZsSJJbyRlF7xLpOKbUwLziSUDFTEHhmLGWpqSYUWj77k
	RQbSFLww/krvYO3CV4HOMfvH+X5wyUpsxZFWmb5dLqy/n4KNHqE4lX8Mldd3Ww==
X-Gm-Gg: AYBFou0kXyVMuN+0V5u0FuA0ryrwHAqWDGPeR0nHdwJ66I6p12BrVSXidFwNxaaYlxR
	B55uKxMUXQJi84SZz4dTp5ljILHgQEv4jqhyvZB+mgLPCCTaT0guH/smSQJm8wabWHOGqBQu5e2
	ebyrl3WFtP6cNHESQ9l5AIsEaHhLaSzYIhxnezA4FEp3FGsFb+ajPyYWC0nC3R/Fw/vBN4amUKZ
	OIUHU+iFUmsS8s8A3UyQwhe7GOqnx+R4m6Vveks1yKxvUBL4MWUw91yDM040dIMaVHFYFemCjLr
	at9IKFVriHwHN0Ks4cnW1Cpv95oUfrWx+VFXwvXDyQu92nC0Hw4sbNpl/QdpOM6VVgVWOtxTbrB
	trRIcZVhJxRhAB3sIkJ5XALY022KOEtV5+HVXG3KV1tGrQLPa9c9FluxyrNcKrqN3yaWQR2oA05
	VjCtY5+IPCFmoHnfzRR5dzBhZ7jPNmggY8w0Uo9tR3ajoLa5yiKFdyNoSPaLZITBNDO+JtkICqH
	Ut0ah+t4b7pW+o0p6FIiKRJ3CORmvUd0Pgc/VWrDOdpaao5m3PjZaX4dMZfFetdXSlrnNlubOZ3
	ju11OvqT13tA3ynlizi8RDy0dijiO0dLW6nnn1IIw98FmucD4le6kgdwp9e/s/wpFiFQkXV3A7A
	mse2QddazT1B9cyUIP0icbyV4c6mGkLbyi211NcbMWf3O8Tcx9yE5mhDa0S9FNVDYu3e38Vhoua
	LraoAFArpvGHFXaRKKoxy0Aype5259VIN9E1T43DyQ0XZxq4Hx33K9
X-Received: by 2002:a05:6830:6816:b0:845:8a98:3f1b with SMTP id 46e09a7af769-861527cbaabmr9725195a34.35.1794790158623;
        Sun, 15 Nov 2026 16:49:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e9abbsm8685537a34.9.2026.11.15.16.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:49:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:49:15 -0700
Subject: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
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
Message-Id: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBAAv0L27Ca2kQp+xXgo6yKrtpJuIRjC3
 616nDnMrKCchBVO1QqJZ1F5xQJmVwENPt4Y5VoY7N46Y0yNOnVBMmoOwROmBWlgeugUkPzoO3l
 KfuNskHvnDvWxadrWQqmNiXtZfqczRM5w+cvSuzPl7wO27QMIgLnVkAAAAA==
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
is enabled after programming the requested state. A zero return is
therefore expected when hw->rx_csum is zero.

stmmac_hw_setup() treats every zero return as a lack of hardware support
and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
then reopening the interface loses the saved capability. Subsequent
attempts to enable offload are rejected by stmmac_fix_features(), which
uses plat->rx_coe to filter NETIF_F_RXCSUM.

Only clear the capability if offload was requested but could not be
enabled. Keep calling rx_ipc when offload is disabled so that the hardware
is still programmed with the requested state.

Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..e162976be2e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_safety_feat_configuration(priv);
 
 	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
+	if (priv->hw->rx_csum && !ret) {
 		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
 		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
 		priv->hw->rx_csum = 0;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

