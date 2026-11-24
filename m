Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526898;
	b=JcD72uavdJBOKWjuRa/mNdIr90XzL98I4O8oPy0idBfMqilHNnlJjOt5Xqr/7QE7HqXl
	 R+7483xpSJ2a7hidW8N1wq/U3ItAk+eFQrsYelOoQGcsWSoLkOQtvLOTL//apSSN6e5Jz
	 G/KFEF9EYZoc0l9wVR5T8i8p9uvffX3lvIouSoQMc3KdslXDsm18Nfymw8moaskAUIbYh
	 HRNJo265tLUV/vY8RycWrieNGS1nCP8/gYZUFhFsgM+5apvRkxX7Xqi283zW8Y7nrCjF0
	 WCdW9ZDsF4Chf8p8OdmKvbU1g8HxwqbtbXWhHzOZ3TG4m+Tr6kYc2nKEKIriX19Snpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
	b=v1NLWD2K9FFJaoOGZXHHGLBeZvlCWfVOBENr74zczLXjgn6VkiAEPlycsQikXdXgUGD3
	 cblbTS9nnBFiYaWULHDjr6fPJqLQESEp/gogMIdae2xSSee+4Hn9iTg3zgEuw/SByEqXE
	 +3EHDZC4EMe1pukVLa19c6Rn14DrnfAuWWSQK3Iv/jfB71EONTkdKRFphQRlXHS3nFYhY
	 gzjacyRAyscEy5HupVMsAgshn65R18zM2cz1YHU2o+z9McIGoUYl76VT0tZpYuCprbbfy
	 gGBN3usz7MldV8SP2ItNF0vcc2yotvW9FTmbuE408mF+ELDOboxoJFjVloBqPtC+iEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVeZZl2N;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8504606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8504606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVeZZl2N
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2579200f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526895; x=1796131695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
        b=lVeZZl2NwyUaG2U7IBIaU9daivsWdX/Xdy/lVTivmmkemufLwiDtPMJFjo9CRqGBbb
         +sGwCL+zWTWiu6T7oyqnwyz65V8xyifG3uzbXk/Sxbl9cN97DsCZLXXAferAXaqkChSf
         6nKc+GAbPdtoQMBDpr1qzRy9ikMlkbnbGmyxpXtPr/4Ew+25ay/jHgsUYzxccdMQGj3Q
         vxm6e4/NWQtN7Pzc8QL6uIAfmpCOZ//Y5bLv//IVUdJt36VaYJ8h8+y0GLd8L46ul3Ys
         7q/JU7lOYOnhizjYGOfkUxWe19W5U0zav+SA2nI8/Vbo+oCfvLvrU3CqysNbT5o9jif0
         umiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526895; x=1796131695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
        b=t0WmliNV91zN3g6wvGTutL20++H0Cf0+e8wozhC66zC4IfmuBsonQ3Hm27U+gTKR/0
         iAf0b3D1IfUwGqadCbq2iLJz7bdtyNzdUHa0L2KPtwO4m/K08TsTphVrs4doBIav0fO7
         l3N2OzXnP58cIMI4UGuvt2skFpbRIZTzOpiQzI1bCy+t45WHReLu+2hqDDuWW1mJykEr
         GVXie2R0Hw1ChpNyGKmoefFeXnN7gVHyWuP1ku5wUb9QFJwrdXNFSzglXUHUTOUPPfd7
         JirYh47ARI/dX/yoUs63kcJaovmXkbNiHdIxi3vedfsq9vD1yHm2Sw6q0MHBiiYYoIq2
         1Frw==
X-Gm-Message-State: APuU4Z84RMUEjwsGGNmIbjXRdMxO/JUMbEK3WS6S/C8qz106b8iZhoc5
	IfWXVc3Yu1KWI45bZw8f8Aa6eJdgcwm8iWGIeCtoWdzZbbzjRi3Yt/oY
X-Gm-Gg: AZFdTZcCVrqCQYhZFYriuT4ERk67zQ5qljjNLRVoPAAwcBRxyJmV5KyxVxg/qlUY5CC
	I7gd3/3kzFSQkCcoEvSIYcQDukyvNuh21FWeqJ/n6HxgJNCu9OTvmRZodnJ5bKyLto7sl0dnbU2
	EC4jqRaAtF3yDAjpgbD825C/6hXnzslCl5xQ6swGIib1OesV/m2AA6pm8jAGXYq6aj60ffVu63a
	uMQtzO8eKv5jzjmUSP2H4eAmPsPqVSYX/7etk71+j3222vHntSQAVKFEnV03LnGV4t6iY4s/JAf
	xRpi5uXaBV3QWCRlqmcuxgcFwNML0B5kNO7vnOg/np0c0/AZCXMDcRUx4priyIsTttqE8aUd2lO
	iW/L34/gz26MWMvGf7ci7GL+fpuo6grZSETxWsBDXnUtgzjBfd3Mx/GmZHK3JoSt4Owm75HQ8zp
	600nWP2kSRFsGIPhBFtc3jswZ+0R+Vsc+i9M2G7STx32QWTb2VyG1s/uZRWSUgHWX8DRbg64OIA
	2ZWioCDZPukSPZ/9DYclIHG0DjiNnP96PQ2s9HpSfH/Sum88r0xJnOuNz1u7pq6LPjcDSgsbvB1
	QTPIbhhRujJ6mO145nhUwF1ufo6wzLLN5Ek6ohPKawI3d5a59GJ0qnCEWeCClUbi1YmY1bk0WNp
	u9qYOPnqhi9LZINO/8gPx0So9DrtQ1KT9V4rmwSiLBq5WhDzEKPNY99ZQVHqKnDkqficagIWi
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr28439351f8f.12.1795526895084;
        Tue, 24 Nov 2026 05:28:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:99e:712b:4aa0:53aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm29256157f8f.8.2026.11.24.05.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:28:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Corinna Vinschen <vinschen@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net v2] net: stmmac: Advertise TX checksum offload only when supported
Date: Tue, 24 Nov 2026 13:28:02 +0000
Message-ID: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

stmmac unconditionally adds IPv4 and IPv6 TX checksum offload to
hw_features and copies the resulting features to vlan_features. When
tx_coe is false, for example in threshold DMA mode on hardware with a
capability register, stmmac_fix_features() removes the flags from the
active features at registration, but vlan_features retains them.

DSA user ports inherit vlan_features and can therefore advertise TX
checksum offload even though the conduit cannot perform it.

Only add NETIF_F_IP_CSUM and NETIF_F_IPV6_CSUM to hw_features when
tx_coe is enabled. This prevents the unsupported features from being
propagated to DSA user ports and reports them as fixed off on the
conduit.

The issue was discovered while using stmmac as the DSA CPU port on
RZ/T2H and RZ/N2H EVKs. The fix was tested with ethtool on the switch
ports of both EVKs.

Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
  - Added fixes tag
  - Updated commit message
  - Targetted the patch to net instead of net-next
v1: https://lore.kernel.org/all/20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f61..d32d3e7b1b8c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
 	ndev->xsk_tx_metadata_ops = &stmmac_xsk_tx_metadata_ops;
 
-	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
-			    NETIF_F_RXCSUM;
+	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM;
+	if (priv->plat->tx_coe)
+		ndev->hw_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
-- 
2.56.1

