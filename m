Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114237;
	b=fBJIPILSQnvfYmdvk7GMtMyL7zttmqymmPYKiPujqc1xTu7aDrqlrPzszeCeuspRrSWg
	 ohJH/8Kd7avL5+3WJIktwJANIj9iYnTZV0nxKvYLxClkZ1Guad+4wUP99raFBdN9XEJZA
	 t+mKXkCT3+6Dj3EP0/kTTfZYrEJIZcLksb469tLP85bMhAX9wWz1Wf1KVhp0HKZTjri/+
	 G8Qqi3+yGK0X1FarcTKCDaWHzAxRFThypkD3INPpTzHSNpRWkNWqcIJE45zFUaBrsLife
	 tysfquInhDqfrJJdmQtQfS9zfW6430aEac9NNjyqflCSyoIjih0I+THH37v7Qucf03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
	b=Hc0hc2SLhdFc8PQ7dNB8jCXfVe72aL2Zs9WSNH910ScRAPgtr5Wav4EDuUPVmGOOJkGw
	 8Cg2Ml2ZI4XiMR6k3wYe1HW01Bog1+h6Yb7rtBMlq0X/usRq/F7V+X64T3fb1/QvedJwz
	 Fho1dXZuJU6Y4455ns0KaFeHtGIHiEkyFe7BaRVsTdSvUmjBdzMTSU0wred0T50O4QDZq
	 gU3AqcMMcMgh7EIzyVOrZxAcmguc1eU07mEBivVo5pgFUrlxC5JPvwTbEwjqcqpE060ZV
	 wSgKlHXa1aOhqWso5hS/QDowaIRxAll+1BmuEuLOU4PBUM1RahXVLCLuM0n8sK1l0uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbHZgpz4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE5606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CE5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbHZgpz4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a32576da88so1712f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795114236; x=1795719036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
        b=gbHZgpz4vVJ//vKAAUuZDXlJrfKwfiVjk6fUGe+eh7tJD4Y/e3f5+7CvDC8fx7x/Tu
         eav+eJdbHMIz5AexBAcy9CuyiuCH3cXssH2NWyPa7dH9EtqgvGCYzdWREK457Fk928VI
         GTyXCcvn/A2hO6+tgiCtvGqtEBTV32+E2hmolNj3/O1fl0mUlTwDHNSJMi7h+GLCfBU1
         sm5JwAheUZLBq4ChdUxhBeULwI+yXm1pQSH7mWD8anFcB+m8pR6/1f6ifAylXfw8/xvl
         wY5x3RkExpZi1xwzhmvmTMnq28e+jZDrzJDyujFP42Eym9kYdGKR+I7vpBuwGO7OxNaM
         KyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114236; x=1795719036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
        b=URNfFrz/+5NWaJJZQa44zoqUhV390dLd469wFDovj/D2Dm7wZQ13VD/ssG5Nr5ARK1
         Z4fKXGLPa1FS5B/XtwXTgwFKutSOGHJco9HA1wMoKf6Ge1vQmPJLP+CdU6U7Ai3Y86CG
         a520xbglNPzg5dMUsU8YupzNdG+nSHh5X1F05c2pYmfPiu9R4jyZe00MwSXxvctxEkxv
         OhTyc350uZF8wKUcn+35uPKXuSS7ZfIhpb/1sz1fo7vaR73WvtgkkizWu7PwZwOoff2f
         gpENGfla/bbTNWVptOY48tI5fFOgFn9tH9Q+5yzz2t8vkzyYxGrGxwn/Hz+KxQsp6jll
         4R1Q==
X-Gm-Message-State: APuU4Z9dMExCxxjt8C3JTmTqPs3DNx+gJ7oqmzCH+ekVwCyVpAQoA8ub
	aU0kqBodJQRFh/fyq/zhQjxD07VHoBo9tocNCzFqvwwYLAGRpVvWUt/j
X-Gm-Gg: AZFdTZedtaAMtbjtFxz12d8tG1D6oCLEX+hJ2uO8UbyrHzUHbB6PSi3zhGYPnAdWmQj
	g+MxVH9aRsgZ0TmAFj4pojhwqEjaImxpgkFJdhBpWQCKw+VUmIOfZ2Ke1VT7RhfuZQhJsAE8ihr
	EcoOI+VyZ2U7fOp+hP3FdaS3x3p6/7MoIuEJMS5ehok0FJjoHHemw+tTRPPdvyraZukrK+9G58Y
	G09AcUhxp5b9Rrik/0c1d2ZuczdOvyh05BFGihW2whYikYqQAy2xyCqIGz359jfFbWq9BQCrifF
	bRzGklHeBuuOlYPuZTjmjR9a5qge15hOSea9d/baS5KIS2xMXT7ijcXBj+LUqUS8vnwBIRFOfps
	UgW2u8uRI28MrrXEELEWFTDSxG92QcEihpp7x2bHeqdHREPCEO3+N/hGpn2tJdJTYlo0+zMboln
	IbuTFWSN/q4d+NZ/y2m4G/i4Tpw4i4+OvoXm3QJW2ASmKVjk5egl7fR0IpNRQw4EQnQMBYAkj8J
	wUy8LrHsYHwm9HJCOvjc7/gPnSOgp5g3k83+07dXemWKiKgYtzD6dRzK0mVsE/tjAgOxx83PBWA
	2abC/qft8trYZzpD6zdpXXd+BMxk/oM2hMxbcjuS60L6h0AhCqzhcWj3YbmMXowcQLqP9UYMFvX
	dWTRZPyHX36NWmIMTLaAhAbrMy4r5c1r+KtyV/C3FjmF0jbmETyka5+rFXhxV3S2hs7AvHLOp1s
	HjRiyRpqj7qh/bS/uF6eHdX3y0VkE=
X-Received: by 2002:a05:6000:46cb:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-4abb42ea14emr442175f8f.24.1795114235494;
        Thu, 19 Nov 2026 10:50:35 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm1147674f8f.47.2026.11.19.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:50:35 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next] net: stmmac: Advertise TX checksum offload only when supported
Date: Thu, 19 Nov 2026 18:50:16 +0000
Message-ID: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The driver unconditionally advertises TX checksum offload, even when
the hardware capability check disables it, such as when threshold DMA
mode is selected. This can cause DSA user ports to inherit checksum
offload through vlan_features despite the conduit not supporting it.

Advertise IPv4 and IPv6 TX checksum offload only when tx_coe is enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4afe09d8fbe4..23d83b8376e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8222,8 +8222,9 @@ static int __stmmac_dvr_probe(struct device *device,
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

