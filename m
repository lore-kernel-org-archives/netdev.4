Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521783;
	b=DIM0rPcZurVjzXdcOUvxnYoB+0vLfTgfI41DaRdD1CNQ1XrVD2FPBBkLeqZ0+YFbu5q3
	 nEgEON4AVjHH0Xygsy+i5IARpbVwc91mRk3FZ/u7wewXitUAVW1G3ObOj3jgrHsojddEO
	 kp7UVETX+Y9gvHvHkJrwEIz5Nsb2P3RfTeUc4i250YNMaKAXu+/Wk0NtyxWF8ITScPBsT
	 j9ipWkvUU8ksnJWL5hvlVVgAF7ZpMSt2GLcqrH65pQ5sUjKaI6h1bIebJ+tNboOE+dhvG
	 G+AC6HrR6sFBeNHLMCJ6LDpBHsx23tEhH910ZUyac2kacW4vrU5y/lz2Ct5ANo64lGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521783;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=g2qkyx16iUL/TYtI7M4gJvUrCZfQL5EGjEwdbL91fHw=;
	b=X/+Gz1BL7X7Zeb3k5Jg/IJHfde2a5YfmurTiY0Go/uPDy8YVdKydTXy24qnw/t2qmiGX
	 DOUQX2+lcWHdEHo2PvLvl532RM2hDBzP1DAtrx9/Qj4Ld4aZLGBRS3D2FEj1XLPwegRDs
	 le1EvCcUURjZZDzK29nfJDCm9uTPMAvO2p2M66VIDPRjq7nhpOUEjYf1xq/sAA8pdnfes
	 XMqLpZ8o7E3vFOgQ5nhj9+rfDBRWyJT/uyahZ1D1X4UxG2qev1GV0nxlpKwgamOzYG08w
	 W21rLTEJINOIeKFM0Tse6Ea3MpIgH0TOOSLyYfBKhRwBLuvlDOrwLKQNtRWX/5E/dZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RIP7Df3M;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2506F606A32E;
	Tue, 24 Nov 2026 12:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2506F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RIP7Df3M
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g2qkyx16iUL/TYtI7M4gJvUrCZfQL5EGjEwdbL91fHw=;
	b=RIP7Df3MxVhZPJBLKgTabYmwo7I4bpKq28+KQT/UfwYra59XppCRWM+8KLQxf0ycflH9bVgWm
	8HT1Y9ZyAV9WHqV/zZtb7BGSui5k0q6rvk6ghZT9gHawA52PAOkh8tCS8hLiQkIoHPfd/xM9mJl
	DNC0At4pYcExIvczhMHaXog=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jYhJb6Cf4zRhW3;
	Tue, 24 Nov 2026 20:02:39 +0800 (CST)
Received: from whupemp200008.china.huawei.com (unknown [7.152.184.21])
	by mail.maildlp.com (Postfix) with ESMTPS id 0828520333;
	Tue, 24 Nov 2026 20:02:58 +0800 (CST)
Received: from localhost.localdomain (10.50.85.93) by
 whupemp200008.china.huawei.com (7.152.184.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 24 Nov 2026 20:02:56 +0800
From: JiangJieHua <jiangjiehua1@huawei.com>
To: <netdev@vger.kernel.org>
CC: Jay Vosburgh <j.vosburgh@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hangbin
 Liu <liuhangbin@kylinos.cn>, Changzhong Zhang <zhangchangzhong@huawei.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net] bonding: clear stale usable_slaves in broadcast mode
Date: Tue, 24 Nov 2026 21:01:02 +0800
Message-ID: <20261124130102.18807-1-jiangjiehua1@huawei.com>
X-Mailer: git-send-email 2.33.8
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemp200008.china.huawei.com (7.152.184.21)

In broadcast mode, bond_set_slave_arr() frees the usable_slaves argument
and returns early, but does not clear bond->usable_slaves.

A mode change requires the bond to be down with no slaves.  When the
last slave is removed in balance-xor, balance-tlb or balance-alb,
bond_update_slave_arr() publishes an empty usable array, and later mode
changes do not clear it.  If the bond is switched to broadcast, the
stale pointer remains: bond_miimon_inspect() sees count == 0 and
ignores updelay for slaves enslaved while the stale array remains, and
bond_uninit() leaks the array.

Clear bond->usable_slaves when the mode is changed to broadcast.  The
bond is down and has no slaves at that point, so the array can be freed
and set to NULL before the bond is brought up again.  Broadcast never
publishes usable_slaves, so it stays NULL.

The issue was discovered by an AI code review agent and confirmed by
manual code inspection.  It was reproduced on mainline with virtme-ng;
no kernel modifications or error injection were needed.  With a dummy
slave and miimon=1:

  ip link add bond0 type bond mode balance-xor miimon 1 updelay 1000
  ip link add dummy0 type dummy
  ip link set bond0 up
  ip link set dummy0 master bond0
  ip link set dummy0 nomaster
  ip link set bond0 down
  ip link set bond0 type bond mode broadcast
  ip link set bond0 up
  ip link set dummy0 master bond0

After the final enslavement, dummy0 comes up within 50 ms despite
updelay=1000 (20 of 20 runs on the unpatched kernel).  With the fix,
none of 300 runs skipped updelay.  The bonding mode-2 recovery-updelay
selftest passes on the same kernel.

Fixes: 45fc134bcfad ("bonding: do not set usable_slaves for broadcast mode")
Signed-off-by: JiangJieHua <jiangjiehua1@huawei.com>
---
 drivers/net/bonding/bond_options.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/bonding/bond_options.c b/drivers/net/bonding/bond_options.c
index 9efadeff6a22..f65916444fa1 100644
--- a/drivers/net/bonding/bond_options.c
+++ b/drivers/net/bonding/bond_options.c
@@ -936,6 +936,14 @@ static int bond_option_mode_set(struct bonding *bond,
 	WRITE_ONCE(bond->params.arp_validate, BOND_ARP_VALIDATE_NONE);
 	WRITE_ONCE(bond->params.mode, newval->value);
 
+	if (newval->value == BOND_MODE_BROADCAST) {
+		struct bond_up_slave *usable;
+
+		usable = rtnl_dereference(bond->usable_slaves);
+		RCU_INIT_POINTER(bond->usable_slaves, NULL);
+		kfree_rcu(usable, rcu);
+	}
+
 	/* When changing mode, the bond device is down, we may reduce
 	 * the bond_bcast_neigh_enabled in bond_close() if broadcast_neighbor
 	 * enabled in 8023ad mode. Therefore, only clear broadcast_neighbor
-- 
2.33.8

