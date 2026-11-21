Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222105;
	b=Fr2dL0hfihj6JWExJG3IHvCPBJA+cJJBMYxQkCUWs68P3kjNmGaTa7pXTmCaCtsdBjMj
	 aPV2p/6Cdqg2r/51YbJExteaB3oPlOR6ikoqvbSnjwF3rrur30lyIHo0dQNdBtl0iEqh3
	 BJWZnMbyuGtsdAgJ8B22ymgOtss/c+NrQORZu9dHGKAne7+0rNlqpLBo8gEBhKuekczR+
	 n4/XecmEbFcZKITIsWpnZfWhgnjyAGM9sxJqQQCghylVvoyZDPXrNokpeqdyFaNo5oOj5
	 onip8i/B/Uvf2qefktAOj5u6PXtySiyLFDNv1vRX1CVWJvyrZqmUH1QF6/HGzOsd33g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UFWZWstMGMaVQ6jTjM817I1SbsECX0IvaSBcjmU5x2E=;
	b=FIWooAEWA5fKwypUZ4MSZqFLu6BIZcEY+OEe08J+vjdeD79COUgDINwvyqweD9fJKBoc
	 KZHKXpheMcUSvuxEe8GsZFwiswp5mo20VB0U1gfq48oHUivUUzSpegju/4jeYjXrPYE02
	 hclhjNAcKJKfkS2GFZxwQSKiJtKC8ckysPdT/x26mvEFQYfvak8/JIDKFtwfA1yHSV6W9
	 z+IljxF6OSBQFUPf8xDMAuCB+0ZXp9Nx4iT4yEEejqrFmFQwsM9XzlTKD7rlZCWiERffM
	 XSUXq4pSOr1O6DZF3PZnZOMropjmbM7uVjsRG0myHvvy+l+yY/B69tsPBYg9KiCc/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egEy5DYh;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE060A2637
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EE060A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egEy5DYh
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1502901c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222102; x=1795826902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFWZWstMGMaVQ6jTjM817I1SbsECX0IvaSBcjmU5x2E=;
        b=egEy5DYhVrzgrGPfmSniIUy6G8710z0MSMVx2nz0ojo8F8eU+eUdXdmF7/C0D8eBmw
         sqDVTf/T7Ayyhs0+d8Oy0vDe64lH5RoaY/nQHIZ9LXn/Xz/pl7KgovH+hcHucnHdfS3z
         i++hlEhT+KDvkcof6zYdCPWP5696C+zzmcmMYM4P8VzMDkXDvFQjyiTyp7FhnSRcun57
         o2desbsej4F4KSu9QpgMCqfitBBXbBIUH/x3w3Dc86a+jb+9NVh3c5yFL55NpOWpJOEQ
         BBsi5bof2vGdEOf5nDsSKqubcJQFaCOO68kt3gLvk5ukfC4Kmv8UkucU4wJVV0kuNcy7
         Z3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222102; x=1795826902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFWZWstMGMaVQ6jTjM817I1SbsECX0IvaSBcjmU5x2E=;
        b=Dh7B22Eouf0/KAegROz3r9QsgSrhK17+76+yL4PDOwFe3Wy1YcyfPPuPMzNUkAuOj9
         NkdTBH/9EcAP6mGBBLbtd9WbRGGZPjbfE+RQbufWbhMBx+1HQ2DYDpqPmle4U5GZsjP6
         hEyGy0t7ZlK/IjuL/YXt+yxN8bRSgQhWDkDewNAraTlbkABS/2Ed5DFY08IxGz8bE+Hn
         abAkdfkGbYrxXcaMjFgge0TYu26bbv2CfCUiLE+L7R/sGpoWqzwzwAxazGMmkGcxJeY+
         6EsUh2qaDn6jq65xrCc9GNXPxtjO248twrfqMxOKwpnh39TyRms/jggZYbgprzLreOGt
         /XMw==
X-Gm-Message-State: APuU4Z9bzAQlJoOVUtPmwJOU1v6O3aBULEVKHeIjXK16iSNSWk7z+XAd
	Pj+iIhE4a1xNccGSG4LXdfVKSmZUkzOds0HxUHRl+Rsod289o6pptjB39jNAJQ==
X-Gm-Gg: AYBFou0W47ROtk9k+IknEcmr9TvxZNWJJ9DsHaU/R+SE8nmi7LeMMKtwGNnQAwkW0GH
	s6VHE2QOvDll6L7Q0fZsC41zLiDVtIe4mRSVuNkBTY+3vHiitbgqtJTSnkyPGWTlP4m3JZkxwRM
	mFJCrtZz7MPQbLyom3NyTDoABKQFaXpzaFxrK5x+X8PbdO4vz+JG4DE5eawq77cVN+MysGUlt9c
	fg2cJTqKLQhHpgVD+ITUR3tsdvhysSa3XaRepBuoBDEsOW+oltzZvomGgV6vVpl6hz/PPRHDIV2
	UDQI0BnGOS91acvbcggZMQBNzamVIAgi6lhmlqorqo3hTL4EnE5FtIIr93pPLjoWo0KJLdLaY6C
	6ZEyQLbPHVb2MP15uz7PYyKLENQxx7wvg80dTZouZYzjNmfvlH+Bv3kHiSDGOGyYZfCTB9dAcyE
	ugokZP3isSaqQoxTLE3HUWwOSjLYYl75nRyXuSNJ5TCpBccMreKoMe3eUL6Dn4PVrpBLLir5HkQ
	8caxnIMYEhy5tJlvHPNqg9Tssv4utpvN7bGDqAIyMvsKpzuim3Doj6XbNfQ8xQLiKiZhoOnVnK0
	/+08B0qm
X-Received: by 2002:a05:701b:4513:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1b5568cf65bmr4503989c88.32.1795222102439;
        Fri, 20 Nov 2026 16:48:22 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:21 -0800 (PST)
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
Subject: [PATCH net v4 07/10] net: au1000: restore RX buffer addresses when restarting the MAC
Date: Fri, 20 Nov 2026 16:48:06 -0800
Message-ID: <20261121004809.1690280-8-f.fainelli@gmail.com>
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

The MAC DMA engine updates each receive descriptor's address as it
transfers data. Clearing the descriptor control bits during reset does
not restore the buffer's starting address.

au1000_init() only set RX_DMA_ENABLE on the address left in the
descriptor. After closing and reopening the interface, a receive could
therefore start partway through its buffer and overwrite memory beyond
the allocation.

Reload each RX descriptor from rx_db_inuse before enabling it, as the
receive completion path already does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index ea2766343d51..ec28ed33bf69 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
 
 
 	for (i = 0; i < NUM_RX_DMA; i++)
-		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
+		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
+		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);
 
 	wmb(); /* drain writebuffer */
 
-- 
2.53.0

