Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933610;
	b=IdwOi6JQdoHjV7TBR3zIFPHkd3h08/ce61V0Ct5lsvQ7lF0YwvqbjXcM0YOepNCI8cd+
	 0g1qir2+6M3+QOst4Lv41vNz/K+3BIITMtO+hF3InRLm63u0q/9DuAFK/LWEWd6F6VwgY
	 1Xn079Yo3p7kWfBHlYcGLaeXGoMsrNQO0NNJlBFTApZFJwKasUhrukTOOBI4/TOsDlVYB
	 FHx1XW4XrAZueIe+GQ4+eDxUCTfAU7evxPYDTdJ7zV5DKdEGiZYG953NricFKcXKQqeQJ
	 H/zlE4EH8XSAZbT5bmssuyT+FyBiR5cKU+exvgdqqsajcg/3iltmy+/bAlDmq9n5GHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
	b=TdkvrLBQqE9R+s3YzmBYmy1jbkV3bs47LYWaTDzLG7CuyyBAgfxm6jJtOe/EIv9yRqwf
	 bHQcAy9Z/7gVkvy/umv1bJH8El9tBH1JGuH9viPOhAwjgLkDjRBtboihITfVDwUCZY7tL
	 7ChkdOyKVXtP3KzIA3ptAo+EzYWLo4PcDymVESOhKpSIQAW9zWYOr85beWvoNVDWfHbnn
	 UwyX7DnimQVceTeIcfed6MAK5wzXPTvFchDhdNNTTf3frCwU0RHqYBsvSjUAjiKrFza+P
	 KHIDW7sGslYCWWOnkpElvRiRyzydDkRWYyleyvR8TtCC6e5YYEORaIqZ3M1bZ6HIqJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B2V2B/k1";
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD29606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2V2B/k1
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad587ba293so9756fac.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933609; x=1795538409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
        b=B2V2B/k1ENbb5cOuJVzSrspC/eEsnIWd7CrCELRHJMLBanLffRr8bSll/DACeB8dp0
         3R4M8j3GmT+BmtoZdNBF496uEJ2ZyG4Kj+2MLbJB/dXpt1YUgPNp+gHAuPd7T7JcDIdA
         wMSFRqtMqsxM7EcEIQYeSq8XOOqXYZwArRxvoq4a2kikVjzbLSO+24bCK8VRxxcVP6V0
         nbW+8U5M6vNd6M9UqkvaVeFuWRxLYgCnK0kHqQDrj5MS9dBzY6TV9H6/VdmfC7osJSZx
         4RniRUfABrBHmj9yJQ/THGAiNnW8O93VBmzE83jnEWXYRZx+wK6ABAWLTEPDxJxWk/hM
         jAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933609; x=1795538409;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
        b=auJg1u4tRcR+NWA6SCXeR5KwmHyOgl4O+ePlBB8O3tXY/7bsXp7a8baargQQczsuaY
         vQ/SYo2KvarBlkLSvVwaT4ckA732XuqGi+ndsbaboRomMOKiJL9RQt8m3K+1wVpzTaBo
         zgI5uUe3fEt/xCieWsjrrBxmcigbm+YLWcJowzqQMrt2TD8ztRmXGD9Offd8x3LA8LFy
         XdqclLKIpcf6NeiF3+zNP0x5YcD7bpeZltQ3XDo7hieuFDpm6N3Ix+U5rl4GoB4E9oJE
         JwO8TPtDOSuxNsiL+aVjHLzevnOdktFCkrU+Q+vsUdx04pDDQcQEgiHColzQnKwlnFBQ
         coEw==
X-Gm-Message-State: APuU4Z9bHJRD1l5fqcEQg77Pb3NhFbaEBC3HVt5k814i/a0ADKXDv0o9
	erAwrRyBZCuIKV7ydRd2IWhpeQ84siyEU5/rlHx4VskjLXTO0JPiy8h8
X-Gm-Gg: AYBFou2DxB/nqC0RxHSZyQbfznOulq0nzrm4GpwX1CL5QFjYVxH6n1+AL/C6hy4OMRE
	6jn9McaNnGWKiQBGbzG7ULMglcFbjoz03i7ZkW2ohQkeb4YAUFAxFYm9yoT4dANQYqXmxkrh6Fe
	6GasLe2gqhgj3vE02GC+OKoE8Yarb17se6iQD/TjonY12APQhWhZD50/CeOHuURMESqpaX+L/vO
	OpXY/xqEqDosxXdVe7UHBNqZbt6ri0XkIpa3LM2xACnsctKG/QexZuIZLbZCHJMuGDUU4W/tv9Q
	m81QJfGUGNJ3nhoNqTinuWZM05+ldX/I2Oxrg9XAcw9yD4lSq7sSO9S4zdSk4xZmqlHpqJwUm0B
	cg3cBFzqgYLJVRi6fyAXuCKzGK6MeVD8AmZ4pUMM2bxHvY+IYvEHNczS3+Nq9S7j861zjRl0gKN
	ewOYzVHyO7CvsIcbqcazn8dGW637L/7ummhdyQ48g2nuZs1VoPJdknw5nYr+g+GUFjF+VG8vKRS
	STB/CM/+Jug0ts9IFzYhfPy5prPBNSiwzgJsQRsCHYtZL3iFRmqBWxaoYK5L3GX7K46G4PEJtgX
	VQi0lUz1p9O83X8kcbK8yfneXhLH8YA50BQEziUSc611dc6TOCjGkhIdnmGyhXCTVXaFUFQrQtK
	TyV6w/FHrUpNL8KZcTZFezoBzP70y+6FV9MqKv9Pz5P4FaXg4bvcLspzOxxtT5ICq2fNWPxtAx+
	t9s1w5BXlOffm0EPUNXlBcgo9Kaz/eYdju/6zeSU4Augxw7ohbbSSpoQ==
X-Received: by 2002:a05:6870:392c:b0:485:d31b:775b with SMTP id 586e51a60fabf-4afdf3e5cb1mr12548756fac.25.1794933609320;
        Tue, 17 Nov 2026 08:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70e175c93sm36148fac.16.2026.11.17.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 09:40:00 -0700
Subject: [PATCH net v2] net: stmmac: preserve RX checksum capability when
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
Message-Id: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBREr0L+2m9slQquvIdhUeoHvlogbSEQw
 t0teAKT2cxkMm8W8OSYPNySBRyN7Llro5GHBEyj25qQn9GDPEklhEjRD6XlgD5Yqw26CU1D5u0
 Hi0b3uuQPhxlHgVQpdUmvWZbnEuJa76jiaSc9oKUAxS+Mey8yYWNstYZ96Ny8/xnFXv4bHRX5W
 qpKn1WWl3SvrebP0XQWinVdvyK8tL31AAAA
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
X-Mailer: b4 0.17-dev

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

Found while investigating RX checksum offload behavior on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1 and verified that this change fixes it.

Fixes: d2afb5bdffde3 ("stmmac: fix the rx csum feature")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to reference the mainline commit.
- Add Maxime Chevallier's Reviewed-by and Tested-by tags.
- Include the discovery and hardware confirmation context.
- Link to v1: https://patch.msgid.link/20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com
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
base-commit: 5e9b2ad9b8384cd3c417cd5e2c3bc7eee4a72791
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

