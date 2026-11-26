Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681416;
	b=CuKEceNFiiNeGowHUDgwp2gJ6LobxaQ42lJxAgDuf5uMAwOgJiyuHuQCpKOM9ZnsdZub
	 Z2Ld8KpqX/MmaHak6ykK6FAYjLQLXzTI5AH3hkvZhS7qjGOtvn9c0ZsrqqSHCu/71AsrS
	 4M6QX+hIruSfGGdk++NVM9ew7HmtPjYSg37WfLeBg/PKw9BDqaSmUPJBdf6Akz1XOY0NM
	 PN/+GWz2zxQThpHRMFlZFEH1B/MF1vAzn7a4b2SPI/1MM1mLqQNFi9WiBUb9d6hvsIjVN
	 /IsvFXT0Jtqq+mkc9EJ0LXShoRWWYS8qwj3ty5e4Wj1lHmCGd8b9ZcuWWcCSqCNE9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n8DKzWaI5ELUFTBRp0K5yrnezgsYkqnwt3KFmJKrkiM=;
	b=Tu75P4UmXLxOL0xrRHuUP914ccLzHTcq+owmRKQKbMx1eQnuVSXBPig/xArGBJnGBHzM
	 m7ALRozktg0+ASu2DexHShZW+3NVkvqdIZLz8qzAfdgA9PJJA4VtTgoWQg7wvGSgRuAMW
	 6UnUUphG97MQDkXfwK0yvd6ay9o+tQNKsHSzLx3tHke+tsmpk027ACKCgnCTuPyc0hDS8
	 fOW47JKg8NSdza2JWKHsAr2DQbTZ9oRMeuqezSJOOaOc7W7P6tJH3mKHx9VKKaABuYzUR
	 63xNfGSCqB2TX5XndmRlq7m8TSvFABF+CBY7/UKT3f4kt6SqBlnFDJzlPtQEyF0jj5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHAmU4ZP;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D3606A334
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6D3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHAmU4ZP
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f01f296937so51825265ad.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681413; x=1796286213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8DKzWaI5ELUFTBRp0K5yrnezgsYkqnwt3KFmJKrkiM=;
        b=EHAmU4ZPBbft/5U3ZaAXafRKFvXOYX0mwZzUgotPRaw4sCsLGAXGZTRNqnjbNdZwzP
         A9adXxm1Ck6hzK5eObVV/yYdlzAuC5KU8pK7R7MB8hL/zD9Z6nEOh7NP5T1DUpGG+AIN
         SUML7qLeMDKTNsKUNrWVlEynvf45GcBHwLYwev1YvKWA+S5uArw3Tjw1OdzugGLjVykv
         EUhdyDW654Bq3q9cEd/Awk3fpr4i7XEtuFnzQs7h1ScyNQmQBjfCKsRoByqPfy7Z4jZ7
         WFQraCVIoTmJyaDJU6Ya9E2/k0D+n9PtBZFaYrL4QoxbJRqZ6oCoWPY8le/8pZg+z2TG
         Px+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681413; x=1796286213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8DKzWaI5ELUFTBRp0K5yrnezgsYkqnwt3KFmJKrkiM=;
        b=kanAJc7zFc/iM1lliL1ZdrWq1WASDGiMrVkcoh7ulGUT1roHfVinSJlXGBFe1Scc4r
         EqdSe+Ll2Dn55ONIE4q7z/PbjO0sf0kYx6fV7u0v/NYLq3wtXGYQr/XH21bk8GSbMPxE
         eC6sYkQcez/+jXVaHDqpDLSG9h36B6M9Z6elJUteNjqemgGw0SVgwsilMrNcwEv+uXlJ
         3JillbBCWTfrKn+7r6zxfYDF6v595aYnCRDKnpuYygtu+AqVjEQujpO0EyqjsdkG628b
         1fySLkezQ648k8lUwLjpaEBSwJfxzvWb6d6caWnctj0GDqo16WBd/a+8sdk2XOWxX1vv
         w1kA==
X-Forwarded-Encrypted: i=1; AL+hErGeJRKkUBN+L5zuVGMEj2qYdAdErON2TryJzS8EYnRa9YuMOxo2T3oYnorslKG0IMsV5EZ1kuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j5dOkkrY08sGwnSNl/92kxPqvn4aFlB9xjiKYKCjsvF/0aktO
	sv7PnnD0vRD5+MyJGp7GZAlUdcZoUWu6eq6m612gE74oSfSYvXytnOD4
X-Gm-Gg: AZFdTZf2vxfxa9awyfampOtT9j3xp5xKr48FCues2hVBjJsbvtOmNtSneXjgqbcNbrI
	rkjCgZI0auCFIzP1YO6lwy28XXF6MaLg7BSm1YwfV5lj3PwuaVQ2hsLdMUpGVWjMAumiZ5PlYPP
	oWO+Qvp8Hu9xe8B64UuUYbKOJtheZsFee9IQfYHX/Q3IbVtw/YnMV6KrlW7X3ppKmkATBwAIil2
	W+yyMJIT8ytaRykkDzV8v1he0bhTUv3GcJ9kA0sBTC7L2YdRRbvH72rfgerZZlDQeWdxfI3TFfu
	SJ/zjV0THNfnUt2ELKxNAG2Bw0qj8HfJ41mgJAKygvU+Ad0izhRv1Wzpy0jOTOiHyYSQNp1i3gy
	alJJpzY1DoWcziMETICeISko0oXEIBNH5Nneg/riLSnqi1ZAr6Dce06JUMIBxvFIZR4oI9tvDRj
	bUi529cyyXJPCJuGDWPl6fZvO7gDSMKNiVNwz5JOh2O9yZ0b1EotdC6P6DX0rhRJxNJ6s/eW5jT
	Ok8PQgutYgOrb4TogUXYvjQCNcAVRhGXEJbdt+6aottgbbik6JOhXGiteAXWn3ggvqJo6LgmTpo
	of7EJZORzU3V6xddQ2+8Sjc02Hn4gPw80618CN05qu9B4VyYX9VCUiYYZ88g2l5jxnzST8QZ8Q=
	=
X-Received: by 2002:a17:903:1ae8:b0:2f0:b56f:d865 with SMTP id d9443c01a7336-2f0b56fd90emr102670145ad.31.1795681413416;
        Thu, 26 Nov 2026 00:23:33 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0667679d8sm81918825ad.48.2026.11.26.00.23.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 00:23:32 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	sfeldma@cumulusnetworks.com,
	netdev@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net v3] bonding: unbind 802.3ad slaves on enslave failure
Date: Thu, 26 Nov 2026 16:22:26 +0800
Message-ID: <20261126082257.46411-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

The 802.3ad enslave path binds a slave's port before the slave is
published in the bond's lower list. The periodic state machine can
select the port and attach it to a LAG while enslavement is still in
progress, including while NETDEV_CHANGEUPPER notifiers are running.

If enslavement fails, rollback can free ad_slave_info without unbinding
its port and leave later LAG processing with a dangling pointer. This
affects both a failed upper-link notification and later failures such
as bond_sysfs_slave_add(). A test-only kretprobe forces the latter to
return -ENOMEM, after which KASAN reports:
     BUG: KASAN: slab-use-after-free in ad_agg_selection_logic+0x1a0d/0x1fa0
     Read of size 1 by task kworker/u16:0/13
     Freed by task 110:
       kfree
       slave_kobj_release
       kobject_put
       bond_enslave

Bind the port only after bond_master_upper_dev_link() has succeeded, so
an upper-link failure never binds anything and cannot race with the
state machine on a port the notifier rollback has already unlisted.
On failures after publication, drain the RX handler, unbind while the
slave is still listed, then unlink, re-evaluate the carrier the way
__bond_release_one() does, and rebuild the slave array after aggregator
changes. Earlier unpublished failures keep their previous behaviour.

Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
Link: https://lore.kernel.org/netdev/20261124024319.52145-1-ljp1205831794@gmail.com/
---
v2 -> v3:
 - Bind the 802.3ad port only after the upper link has been established,
   so an upper-link failure has nothing to unbind, cannot race with the
   state machine on an unlisted port, and no longer sends a spurious
   LACPDU on pre-adjacency failures.
 - Re-evaluate the carrier with bond_set_carrier() in the rollback, the
   same way __bond_release_one() does.
 - Collapse the error unwind into a single err_unregister block gated by
   upper_linked; err_upper_unlink is gone (Nikolay Aleksandrov).
 - Add Signed-off-by.
 drivers/net/bonding/bond_main.c | 46 +++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index e9f5e753f677..c0c6fbcc8745 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1892,6 +1892,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
 	struct slave *new_slave = NULL, *prev_slave;
 	struct sockaddr_storage ss;
+	bool upper_linked = false;
 	int res = 0, i;
 
 	if (slave_dev->type == ARPHRD_CAN) {
@@ -2182,19 +2183,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		 * aggregator
 		 */
 		bond_set_slave_inactive_flags(new_slave, BOND_SLAVE_NOTIFY_NOW);
-		/* if this is the first slave */
-		if (!prev_slave) {
-			SLAVE_AD_INFO(new_slave)->id = 1;
-			/* Initialize AD with the number of times that the AD timer is called in 1 second
-			 * can be called only after the mac address of the bond is set
-			 */
-			bond_3ad_initialize(bond);
-		} else {
-			SLAVE_AD_INFO(new_slave)->id =
-				SLAVE_AD_INFO(prev_slave)->id + 1;
-		}
-
-		bond_3ad_bind_slave(new_slave);
 		break;
 	case BOND_MODE_TLB:
 	case BOND_MODE_ALB:
@@ -2243,13 +2231,30 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		slave_dbg(bond_dev, slave_dev, "Error %d calling bond_master_upper_dev_link\n", res);
 		goto err_unregister;
 	}
+	upper_linked = true;
 
 	bond_lower_state_changed(new_slave);
 
+	if (BOND_MODE(bond) == BOND_MODE_8023AD) {
+		if (!prev_slave) {
+			SLAVE_AD_INFO(new_slave)->id = 1;
+			/* Initialize AD with the number of times that the AD
+			 * timer is called in 1 second; can be called only after
+			 * the mac address of the bond is set
+			 */
+			bond_3ad_initialize(bond);
+		} else {
+			SLAVE_AD_INFO(new_slave)->id =
+				SLAVE_AD_INFO(prev_slave)->id + 1;
+		}
+
+		bond_3ad_bind_slave(new_slave);
+	}
+
 	res = bond_sysfs_slave_add(new_slave);
 	if (res) {
 		slave_dbg(bond_dev, slave_dev, "Error %d calling bond_sysfs_slave_add\n", res);
-		goto err_upper_unlink;
+		goto err_unregister;
 	}
 
 	/* If the mode uses primary, then the following is handled by
@@ -2354,11 +2359,18 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 err_sysfs_del:
 	bond_sysfs_slave_del(new_slave);
 
-err_upper_unlink:
-	bond_upper_dev_unlink(bond, new_slave);
-
 err_unregister:
 	netdev_rx_handler_unregister(slave_dev);
+	if (upper_linked) {
+		if (BOND_MODE(bond) == BOND_MODE_8023AD)
+			bond_3ad_unbind_slave(new_slave);
+		bond_upper_dev_unlink(bond, new_slave);
+		if (BOND_MODE(bond) == BOND_MODE_8023AD) {
+			bond_set_carrier(bond);
+			if (bond_update_slave_arr(bond, new_slave))
+				bond_slave_arr_work_rearm(bond, 0);
+		}
+	}
 
 err_detach:
 	vlan_vids_del_by_dev(slave_dev, bond_dev);
-- 
2.55.0

