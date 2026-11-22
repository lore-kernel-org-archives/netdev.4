Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359558;
	b=HQRa+6tIJ+QMzIf5A8H+kUu4uFV91QGpDAebSHWkjGXacPPJs3Uo7f5+amC2oKAtuRSz
	 nqoNizl+irwpB3Y0WDu4gDxQDA6M6KPuUuPeHIC3YNYSZ9PtYejjqS2kyxbPLXsTisbnD
	 aDW0MonTTD2JYl9ZS9YchpecTiO4ZKCXG9ndrFtAGyRlu3sDl2B2vTII/vEAg4Q/CPLEL
	 e/Z8nXgWQy0EjpU6r/PQrm7Phw5O91JULwkCh6TDQ/rvB+Qmmnbd6RyVS3Y9UBSVKfBMQ
	 qb+7qr6Cf1JhT+m8lE07sEfvkR5sksoHm2qn8BEINqsVpCCBI2R5Iw9Cea650zEqkww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=plElw4fcYLBxg4fD+bZ2DHkzdJMahDB/p7c8IvT1/p4=;
	b=OMzaYWX/JUagUl1T4sSq0Ao+i4GPQjvefx30GzgKtn1yA6N31eYAihqM2poM67TfusQh
	 CYhEyMOwznrmszN4J1+RnneoTR8+Hqe9KikzdLnd3xrWBjVqfKy6fGVrfa/u0RAgDPg8r
	 IoRXsp+eaflnDM5M4AWhdp2J0sKAazdNNb/sYeHlNfpJ/KngnW0mA+BjEg/Gat0G4SQkB
	 7a11aLzLryo1WwXZ4a3/ZVxL4K54eoNShSWiQPOrOuKXEX0kTFwUp+sN06yThBkqHM9sv
	 DDAyhLxSaRYfvYPGXbmMCoLfAr/vxDP5P+caAAt6r1wHCfZQHmLqG2cc3PhSeKxJj0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CS9zI3YD;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C019606A332
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C019606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CS9zI3YD
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so1218592a91.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359558; x=1795964358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plElw4fcYLBxg4fD+bZ2DHkzdJMahDB/p7c8IvT1/p4=;
        b=CS9zI3YDt9LvNhrX12gIocCmaB1DqKi4uyRpsQfMjHgMk0zDOCuBE3RgYQtN89b6c4
         Rj7cbTMaMUUe0JWTSx8uo5J1+Mz9fWnxKuqSqcVLV+HbzRv/UjNaSVbUnk1dt2/pZlZM
         77uv47fSQMTAq7Qh3V1H6DyXzyA0rtY1Ce+31ic6F942FIQgg27p5mEAunoT/ycsZr9I
         0X+eYlzErJ3KwEg5zPwYm7jg2cL6LMnGoemmM2abKeV291vpvELsAEUC+fVulhqdwRkj
         X8DKJ1JiMGRlwnz9qj26+XghLL0GZ7fFS8eHif7uoagh6qHwgv8TlCFk2nP93fnn2LEF
         CfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359558; x=1795964358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plElw4fcYLBxg4fD+bZ2DHkzdJMahDB/p7c8IvT1/p4=;
        b=eBU3Ojn0cxhnc6feQoyVhRpe25PCxd9okUcu58tXPHJB2CbLnVjrMzCJXMZIFjuS8p
         b66Noz83GilS8J6pFZeZdRFw8nDP5wTcTPPc7LbrOOLKFIshT5FBw/14PlNKBfdvc7j7
         HrOtyz+OVGjYTAGa3uoKLQDKuo/00VEQjdPFVnqbli6grXipoOtB1Q6vjnq3G0SfvUDq
         FNy+1J4B/i6TS+6wvlUjOGzxinxL1wfwo5MwkqNL+fFK5i8Qk6SlxDLnMHg3keA7jRuW
         Q8upzNi8eWfxoP4xcP8CPRuJP1TBmbY89XCAp+W0lGQpMlwZWwnS4DV7fG7Nns4hLzqq
         0m9g==
X-Gm-Message-State: APuU4Z/gbZHv5GqNNjXYwEMDJcswgzXFqs8K5wzCarOf2uHIjlZ91qrK
	b0B0sY9Xi+q+7w7kOTt5KPrwf3QYCzfbP3ZlmabiXu2M01bS23oA/7WfXu3Eicot
X-Gm-Gg: AZFdTZdkOgDSdPYy71vehCZe3/UzYAdVTASGSRTADQAZ7KYYb3vZEpX3KX0j2vXCtrF
	FqphHip5iqjQVVlIjboz00L0/XoyUIwmBkMZycH8NPz+Fl2TPiBi460IiLQfYU88k/h/V4Gy7/B
	h9XnTxmmSeyR5a7Y7dAuET78s/7+0D3Y5dW8ESd1CzLsN4EqPRmJQN9Ww6I/gBnH+Me1JFEd1w9
	+KcHzYaEZOfavnF0GpeUa4n/pmdhK6QMx6myNoMhgdk+kwkEWrIErQUxXdgMAokgphTk4/r0JJz
	bh2bidjTmMBUPG2mbRRVl2YDiijU4s9RkTuypH3vU8N3BDdC1C7ziJiA2dHXYmWsSOFfq5x6DHR
	zQNNpTP4pCe0z6dKpAiByPsafTrHSdcDyLBgYM8ykR43+ZXMF2Fp7AqEh6cJwb7SvHaV3DX3HGu
	qUfNf8qLLgty/U9K+USgpBScYai83upvq9kpa0i8aVHGNQBSgM5Ef/Y7cGdGeefkt+ERq1StZUL
	++OEYkRaW01DLGYijLHaeO6BA8xaVjGGTxnCEoZX+KHGB1aGERvdmRSBzWPKTCnynM1fP/LULsE
	WJ1GeqV4aLhfxqB/exxyuS2NgE//R2EwGBaLznSaePxQKQZHwCZHoCZNPCgSNj/Y8VM=
X-Received: by 2002:a17:90b:3c11:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b41c97bc96mr8597683a91.58.1795359557713;
        Sun, 22 Nov 2026 06:59:17 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm16387442a91.10.2026.11.22.06.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:17 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] bonding: reject a non-Ethernet 802.3ad slave even when the type matches
Date: Sun, 22 Nov 2026 23:59:09 +0900
Message-ID: <179535729502.2645501.7669047222441539373@gmail.com>
In-Reply-To: <179535729502.2645501.5219010464870440@gmail.com>
References: <179535729502.2645501.5219010464870440@gmail.com>
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

Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
when enslaving it changes the bond's type. A bond keeps the type of its
last slave after that slave is released, so a bond that once had an
ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6
device, such as a second bond prepared the same way, without the check.
bond_open() then adds the 8-byte lacpdu_mcast_addr to that slave with
dev_mc_add(), which copies the slave's 16-byte addr_len:

  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
  Read of size 16 at addr ffffffff878a2940 by task test/114
  Call Trace:
   <TASK>
   __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
   dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
   bond_open (drivers/net/bonding/bond_main.c:4405)
   __dev_open (net/core/dev.c:1762)
   __dev_change_flags (net/core/dev.c:10022)
   netif_change_flags (net/core/dev.c:10087)
   do_setlink.isra.0 (net/core/rtnetlink.c:3294)
   rtnl_setlink (net/core/rtnetlink.c:3633)

An unprivileged user can set this up in its own user and network
namespace.

Check that an 802.3ad slave is an Ethernet device before the type
handling, for every slave.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 drivers/net/bonding/bond_main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 042d7c75548f..bcc12ef34d9a 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1951,6 +1951,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		return -EPERM;
 	}
 
+	if (slave_dev->type != ARPHRD_ETHER &&
+	    BOND_MODE(bond) == BOND_MODE_8023AD) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "8023AD mode requires Ethernet devices");
+		return -EINVAL;
+	}
+
 	/* set bonding device ether type by slave - bonding netdevices are
 	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
 	 * there is a need to override some of the type dependent attribs/funcs.
@@ -1960,12 +1967,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	 */
 	if (!bond_has_slaves(bond)) {
 		if (bond_dev->type != slave_dev->type) {
-			if (slave_dev->type != ARPHRD_ETHER &&
-			    BOND_MODE(bond) == BOND_MODE_8023AD) {
-				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-					     "8023AD mode requires Ethernet devices");
-				return -EINVAL;
-			}
 			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
 				  bond_dev->type, slave_dev->type);
 
-- 
2.43.0

