Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289025;
	b=WRgFfvhAs+X0FEB+XejbO6xqGtHqeBUTdfs+HHvFQA8yRrgbhDiyl50uBjcSUkC2iTmB
	 msQB7xxtS+NH+KdLc6RmeKnvCet8O46fEABO8ZivekRtKF97FFchilzrge7M6p6YojiLJ
	 qPz+NXKXNXUu2JpH8LsYgZ/aXiomkHOGuCe5ngsuJflTub9kiy1Z/g4LFSOdh78eDmHxq
	 bX+J1GSaDHDll1CqYok8OlKsvFgMGFwClqpT1Hkh7ESP76YlbCgQq8Ri6g9NAmflyW6GN
	 dDyUUbOnSQAJ97Ly88tgtIY71mRJ7bMKT4Vz+dfTbsTFzDl7KbZ1fDrubmjTkQ9icAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289025;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GqiMSWFjg1MsHTdt1zaF4HrbzuxDGISoMaceZCX5cFg=;
	b=ljX35+xJCcdkR00K7S41nWv5Q7/i1yQD2yAEBVxqam1vG3afQE2jI1TE9KzRo83RBPjo
	 wKcX3MIkBIcbRjC5eiAwAshnN8/N5xIFItgHdSg3Jv3rXYRd3uqMhbwzHRoAOCDmkHNBd
	 X+JrM1M98l2tS1UsR2drFiUN3fBApp2ihz8ECL4ObwAsMNnRO6MINu7nKmprONu0Eaf4z
	 0ZZKhz0d1CJ4/3eTIuB2CZ1couPShjSBDTvPyjlsINzgcAEIUEcvdI7Fr2VqMxnex3oEb
	 D5aOIYC0WtcvY3W684PRAIT+HN32aPLgtr1mYCwVzxypfYJMA3pd8HKUPSrdTldzEVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MzpQ85Nr;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A76606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A76606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MzpQ85Nr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GqiMSWFjg1MsHTdt1zaF4HrbzuxDGISoMaceZCX5cFg=; b=MzpQ85NrXGWQuhq1m46Vrn4LCB
	E0dDEiNdWqXqfHX9+t3qAWNgk50PFdKqCfjcn5o2PO9uWxgem8gb4pc2ygRaWy2z+UUfRhtS/0uTD
	cIFhWYqJ3hInRNweb2Fy++vMN91o/FuImxzLyOiN2zi7x9wK1rgFv1ZMBFYw8daZOBfeo/nUgr3Et
	SJrURgbacufhVVbzSbMxYqbZpJptzyN4unntdClh2v0L6HIPkWKeHbIKogJFK07x9SRCDh23W2uPR
	t1ODUk9d8c2OZ5H5GSD/j5MupjS4ZxHBJ1SCPKQ4oAQK2YmLCGPQ6BtRU+x8HNvpE2kYUtJoIEyp6
	sgWiOJrA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqga-000000006s9-3k4l;
	Sat, 21 Nov 2026 19:23:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: netdev@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: ethernet: fs_enet: add missing MODULE_DESCRIPTION()s
Date: Sat, 21 Nov 2026 11:23:43 -0800
Message-ID: <20261121192343.932171-1-rdunlap@infradead.org>
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

Add 2 missing MODULE_DESCRIPTION()s that are now required.

WARNING: modpost: drivers/net/ethernet/freescale/fs_enet/mii-fec.ko:
  missing MODULE_DESCRIPTION()
WARNING: modpost: drivers/net/ethernet/freescale/fs_enet/mii-bitbang.ko:
  missing MODULE_DESCRIPTION()

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>

 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c |    1 +
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c     |    1 +
 2 files changed, 2 insertions(+)

--- linux-next-20261118.orig/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ linux-next-20261118/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -218,4 +218,5 @@ static struct platform_driver fs_enet_bb
 };
 
 module_platform_driver(fs_enet_bb_mdio_driver);
+MODULE_DESCRIPTION("CPM2 Bitbanged MII driver");
 MODULE_LICENSE("GPL");
--- linux-next-20261118.orig/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ linux-next-20261118/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -216,4 +216,5 @@ static struct platform_driver fs_enet_fe
 };
 
 module_platform_driver(fs_enet_fec_mdio_driver);
+MODULE_DESCRIPTION("FEC MII driver");
 MODULE_LICENSE("GPL");
