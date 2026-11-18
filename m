Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011520;
	b=mo0WkzICEE3J4CFc39rp5Q59cji/yg6md4hm04mgQfG8jW6gBTizZbmoxF0Cmc3sfUu9
	 hsByWHTvZXqQIXoN+QPXnuqCQigcZ8dNqaoaiTjTIH7DXs6LNoEf/kvcoJneIMu0G/Im4
	 zSvIZ58RQcn73WArUpsL/d7QFl5Ifwll6dLXy2jTVqRu8cn5yw1tp8V6yITf2WVh8kf9h
	 JQ0SDHTJ1z29wkOiXcEB6yBHD7IW6AtZn3mzCg2YczekTL2Ql02nl1pICtIDWggkch38M
	 khKDEywumfMWLhtCsF4kHxojaBTim3c/D8L4/vChf+6NSYavKzYqSJSDUwwyzrlU4lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011520;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=PM8GC4O0D6ai6QoDJ1GdgTbrRAjYwDPST4RLoXxC2Ug=;
	b=bzwjPABr5N7LhajqwKbP7YGyAEcnh4GS2J41LhrOOfQX77wkMJkV1K8nG1XCqwGu/OoL
	 Ehb5qQRxv8rxjAQ7HCt0hnM2fKAxjQin2F2NYw2VWR/EWLqwEXeUuu/vOGGUK/m9Lg6vF
	 iswuJeZo2iRHbBqkBSxqtzvEYI+Pp5v2S/dvQtR44MF9cScyuLGpKnXii3BbFRQWHnbZm
	 SImrZNN4Z+MW7fjjbPT/nh1AlcDGDjK3+9EiSo+1uFrMvkI+F8CZYr+HknuWh2MX9LmAG
	 Wf/UlySUulTIjYJIRsjDyKZ5VnRkm6uUyLHHs3wy+8NLzBcZvlNA1mCqFggl32zHLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="gIKJfK4/";
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6C606A33A;
	Wed, 18 Nov 2026 14:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE6C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gIKJfK4/
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5526d78fc;
	Wed, 18 Nov 2026 22:18:24 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: bgmac: Fix potential MDIO use-after-free during removal
Date: Wed, 18 Nov 2026 22:18:23 +0800
Message-ID: <20261118-324f82bd41-net-bgmac-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ef05e9c303a1kunm49a18c861a0fcc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTE1IVkxMSEpNTk1NH09MTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gIKJfK4/A2ZL3N5O2DgWKubTDX4fouTdIqqH8fCMJgryh4ww0EuyMHUv8aQmtd6Sl5sCpUhAojPNRceUsfrBdoH01YVJlGPhNJBxE4R91IEfMqRL7jq0ceUIhirsAmWNxMxqEckXi7wifpmfMHPXcKSLEsSPyDExrsPjhh20FTQ=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=PM8GC4O0D6ai6QoDJ1GdgTbrRAjYwDPST4RLoXxC2Ug=;
	h=date:mime-version:subject:message-id:from;

The BCMA remove callback destroys its MDIO bus before
bgmac_enet_remove() disconnects the attached PHY. The PHY detach path
still accesses that bus.

Remove the netdev and disconnect the PHY before unregistering the MDIO
bus.

This issue was found by our static analysis tool under development.

Fixes: f6a95a24957a ("net: ethernet: bgmac: Add platform device support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/broadcom/bgmac-bcma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac-bcma.c b/drivers/net/ethernet/broadcom/bgmac-bcma.c
index 36f9bad28e6a..e9229d86c7d0 100644
--- a/drivers/net/ethernet/broadcom/bgmac-bcma.c
+++ b/drivers/net/ethernet/broadcom/bgmac-bcma.c
@@ -329,8 +329,8 @@ static void bgmac_remove(struct bcma_device *core)
 {
 	struct bgmac *bgmac = bcma_get_drvdata(core);
 
-	bcma_mdio_mii_unregister(bgmac->mii_bus);
 	bgmac_enet_remove(bgmac);
+	bcma_mdio_mii_unregister(bgmac->mii_bus);
 	bcma_set_drvdata(core, NULL);
 }
 

base-commit: 2e54b3e187300893688c2c7517894f5d96732e05
