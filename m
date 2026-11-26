Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692578;
	b=WYGQKgnPXMb1sDw9SeDF2pQfnstbKc+ntlPWEQFp5Yq85PozGLISiO4vJoGOlWV5lH3B
	 3Wd3SG/0IeXLq3GJia0x07VG41KFfatU9ZB42w/Gwv4CbC/eQg3ErdHd6hf7NpVK5KVer
	 6oaiVS6NjNWEwwv6wj70wqxP3Z5qA0cDLAkzWSV4Zuu8N582GDKuA775N8okWcMSTRwTD
	 vE9f1s9rA3lhjsZB6wP/Jh1vvytITE3uY1NgL2IZLtg7m4137yUTzLiU0YsuZldTehOn+
	 +bkFoKV5kJAwVV9dW6UJzr2snMkJQSPlIfvTcZgIpPbVihiFbCSKWX//BG222dIIMFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692578;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=KCq99nIEizyaKRWEQD1n91X4WzZ2Y5pdZYj2sQOEyJQ=;
	b=kNS/ktQaEDcbqSBe3tQPm1USldu7aQQ7c0vDkkwjm/MBtG7xXRphyDevNfSIRxdseRkX
	 CCkBABUPseyT9DyaYsQaT+gvQqUk1BvBnms6aMEKC4Au/M78MvqrEWnMgF2vd2dIN1zS5
	 uFQ6/1aWGZkqRc7Gh+ixeHHlNUpoyDJN7rUs1PNvwPtB/sOARskPLvd5VE8ytbwwssIH9
	 r/cT5yJUI9xHxahinBkKAXRoyBjSmx2r61stg2P1lKo1bJQHKDtcZpao/oBlOrxc8l/NS
	 lUomjkL7O+FW3b6x8XNKGa7f1gx9VXpPSBKM36OrMbvYEm+wP+r8dYW6FqZoZyPUDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FZZMWuyP;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076AA606A32C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FZZMWuyP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=KC
	q99nIEizyaKRWEQD1n91X4WzZ2Y5pdZYj2sQOEyJQ=; b=FZZMWuyPfc0u98WJZe
	pWM46C4walpj3ctqynD0G6GnqMpQWlW8oboN+H583QKCmtTGrsFUZyN0697kS6Xd
	e2iJexDbu4J8s0d4nBaC1fW0UvuhOHdKfsXZbkMobF8UasUP8DtPmCRkPwKtR5II
	vXZmDmceXkgk799yEmqYPXf/Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3n9HtFwhrOeHILA--.38771S2;
	Thu, 26 Nov 2026 19:28:47 +0800 (CST)
From: Wanhui Fu <fuwh1120@163.com>
To: enachman@marvell.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	serhiy.pshyk@plvision.eu,
	taras.chornyi@plvision.eu,
	serhiy.boiko@plvision.eu,
	vadym.kochan@plvision.eu
Cc: netdev@vger.kernel.org,
	Wanhui Fu <fuwh1120@163.com>
Subject: [PATCH] net: marvell: prestera: Add fini function under label err_fdb_init
Date: Thu, 26 Nov 2026 19:28:25 +0800
Message-Id: <20261126112825.3957800-1-fuwh1120@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD3n9HtFwhrOeHILA--.38771S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw17JF48uw17WrWfCw17ZFb_yoWftwb_ur
	47ZF1xJr4UGr1ak3WUKr47ZryFkFyktrn5GrZFyrZ5Ar4xuayUZr1kKFs7J3W0gF4FyF9x
	GFWfKr4Sq34jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbgAwDUUUUU==
X-CM-SenderInfo: xixzxiqrsqqiywtou0bp/xtbC7g-dfWsIF+8s6gAA3c

prestera_switchdev_handler_fini() is missed under label
err_fdb_init. Add it to complete the error handling.

Fixes: e1189d9a5fbe ("net: marvell: prestera: Add Switchdev driver implementation")
Signed-off-by: Wanhui Fu <fuwh1120@163.com>
---
 drivers/net/ethernet/marvell/prestera/prestera_switchdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c b/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c
index 2012d00fabec..55a99eafac2c 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c
@@ -1899,6 +1899,7 @@ int prestera_switchdev_init(struct prestera_switch *sw)
 	return 0;
 
 err_fdb_init:
+	prestera_switchdev_handler_fini(swdev);
 err_swdev_init:
 	destroy_workqueue(swdev_wq);
 err_alloc_wq:
-- 
2.25.1

