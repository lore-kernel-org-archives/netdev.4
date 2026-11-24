Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523710;
	b=uVwqZ59F9GsQCE6vaYG4QBd+qCpMO+mrpMDfaEQnnDaz89n7WGj4xuj67OWJ9zQAm1jj
	 mQ26qG/8G2yCbCLd3u5ztl0hTGG42eSFRU6nRkkCiAyuk9ixs/ZYnILw+rKfVGaG3eDqV
	 1IgmcJLwE6wP0quCo8VlGLRZSFuAbTcuykVd7RJGL3vfiQnDUZ/cSclhh5BQG8VUrHDaI
	 5UkZgDcMBu+Azb9JvkEUfI732gXRLWd1Tmc/+aCPO1if3deDxAWt/HOTnY8jzMheO6Llb
	 G8K5e+O4cedKfb/jUDVnBK9PxiDz22HsT4SBl8syw1Z4amOWPf8d02b5B383Kjjbk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523710;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=XXjPe5Ek8pXsbdEkqZpVTiDeauZE69h9WIl8B5p4vNo=;
	b=lkNTkkMLAYw3YERt8Nj6COoEzugbk63rD4NSN5TnzfZs9951Q/orb3p7A9Bp2jeRy9LM
	 5a8siH1O74qvX1sA/Q+wu+BKi+vtqYdc5A0VTueNVTKpSJXKtnGFFB7R4W/TnYfXLMtQb
	 dmcjEBR15ir+HlF4HGPiCnLefNGwRFYhiX43P6L1K7rH0AvKBk3DNpvGHcrQViXGwYQ4W
	 bChaHuLeSn4PgDQp6UoWd8J3iqJEcMc0M5u1K8u2Sj53tmZWBRrscqkaICLV0wMnHIceE
	 PFcOUiQaWSe+KobvsUyU0hW3TFdcF6TxicyH7diE3Ewugbsc/7nayeYQXQJwG4Yp4kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hD4bsTx6;
	arc=none smtp.remote-ip=91.218.175.22
Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702F606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2702F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hD4bsTx6
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6aEj/3h/YT3eGMs5093On2XEql6VSQDAJINouErQmDg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795523707; v=1; x=1796128507;
 b=hD4bsTx6P1bwYVnaP9dKA9Bh1qEdRBVYY4RyQtCHDEO3QEAZdd/eoHyscnK+4JSikYdQyH7e
 FUgj6Op+Dqhmt//z5ujOH/9S4N66DqFqvG48UJWT7B84pQMLIRtPwr1tf67dUPaoW2TaNZhCpky
 t+cc8mOA+rXUAnrEK3QQp/3I=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7a7810e481f97de3;
	Tue, 24 Nov 2026 12:35:07 +0000
X-Mizu-Trace-ID: 7a7810e481f97de3
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 24 Nov 2026 20:34:52 +0800
Subject: [PATCH net-next] bonding: roll back fail_over_mac if enslave fails
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
Message-Id: <20261124-bond_fail_over_mac-v1-1-9caee319331f@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCIBhGX2X81wlTKluvEiHqvtUfpUNtDMbef
 a4uD4dzFspIjEzXZqGEiTPHUEEeGvJPGx4Q3Fcm1aqzlOooXAy9GSy/TZyQzMd6Ad2dlO40Lq2
 jGo4JA8+/6Y0CigiYC93/Jn/dC77sT1rXDfWnAjuAAAAA
X-Change-ID: 20261124-bond_fail_over_mac-e7952797e80b
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

bond_enslave() can change bond->params.fail_over_mac as a side
effect: when the first slave cannot set its own MAC address and the
bond is in active-backup mode, fail_over_mac is forced to "active" so
bonding never writes the slave MAC. If enslave fails later, the
forced value stays behind, silently changing a user-configured
option after a failed operation and affecting subsequent failover
behaviour.

Snapshot fail_over_mac on entry and restore it on the error path.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 drivers/net/bonding/bond_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 9249a79a168e..3817c82e89e2 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1890,6 +1890,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 {
 	struct bonding *bond = netdev_priv(bond_dev);
 	const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
+	int orig_fail_over_mac = bond->params.fail_over_mac;
 	struct slave *new_slave = NULL, *prev_slave;
 	struct sockaddr_storage ss;
 	int res = 0, i;
@@ -2412,6 +2413,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	kobject_put(&new_slave->kobj);
 
 err_undo_flags:
+	bond->params.fail_over_mac = orig_fail_over_mac;
 	/* Enslave of first slave has failed and we need to fix master's mac */
 	if (!bond_has_slaves(bond)) {
 		if (ether_addr_equal_64bits(bond_dev->dev_addr,

---
base-commit: 9545bf5293dfb83138faec013f7ce4184218f304
change-id: 20261124-bond_fail_over_mac-e7952797e80b

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

