Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059072;
	b=nmYmulmILLsiCT7NFT9jYEwugswgxK18OCfWeleaqqKyJZiS+a8vhw/rwev5P1ullL1+
	 ShBmT0JxhrqXVy2eOp9ged6rFvrQWKGbLXQ1h72aJDT1s+VEPyftMUGJXC2iq53kVaFkZ
	 BxPimrl4O2nl58d+SkCxLkuKcIzd7cy2TSCYHw6KEboxVzvL8F2kpEUvxIiIphJtg24cb
	 bCBGLrkvyv0oqoIiXtC7ArYHt3pvIsgdH1/JVeaHOIgK/t96U9cRrUwamw2nfpm0Blsmh
	 ewIn/fTaYW4HOC8ceP+4qHBo0y/jyZ2P5xcxJ28fTM7TQfUTRowj2QWu5kVH+tCa3aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=ZLlkYj3mBfiUcAIkRHyiL4FHQRqTFutxEfnrI2U+Iuk=;
	b=2xRG31bcdbagr9KGssmiC/bfZLC5Oznod7ICG4Sq4PkxxYI2MTI1aBhc5pCx2q5/pfML
	 dOc7NJOwH15VI620hlw83FCRAWyJ7Gig6tT+sOYD3KYKRQA8bD/A+RNw5cGD4kkq8A00F
	 /kUOUB2R6KCDCfEC4hPPX7N/Sa2l/886jYFe+1W4JA31nNT1LEBZ5VJu7pi3+e5V2SW5+
	 iX2c65WT/u5Lg2RgBloswCYCTAxLTK+ZkiIyVHUdqZaHPg6EqNQvjWoB/RTGKoBSqdrfu
	 FXjHXDdKg8Gu4p6Y6oAimjOtDgTKe6l+LWJ1M2+iHSHCEZxdzgof4Xwa8U19TY6kkfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FQh7JjM;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6460A2600
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B6460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FQh7JjM
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1355124a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059071; x=1795663871; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLlkYj3mBfiUcAIkRHyiL4FHQRqTFutxEfnrI2U+Iuk=;
        b=0FQh7JjMzMxqIXlV+YFPS3msR8b27sQJGLsSxfXFaC5aWWJ1nATPtAlHexGCutYqwz
         6vRlMMji/8aykSLt2osM7jxzzw010kO/Zgeyuw4oJldVk4gjXrcI3VDhW+agphjpQyF6
         3gr0L0t3/mDctLutM7g2AoG7nYrLNAKlUevPRkliCdFhlpsrRXL9xCSHd/2iYAXZoCFW
         3AiHMEbSTMeT7Yz0e8fJHGSwA3BvlhmUXOjy2ADvz7dEh2U6qeWL3dTK4YNtCg9YAyS+
         DZfFxEgDiHPStqtGEI5q95iWk8qE0Py0vvpSK5IbwnMfKT4KcLaKStaePqD6Zd2ppsYi
         w5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059071; x=1795663871;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZLlkYj3mBfiUcAIkRHyiL4FHQRqTFutxEfnrI2U+Iuk=;
        b=k980kNPMXeSoF2JZKj7ZPE9u6/prQABZwO6/krH1fqYz5b5f1c/L4nYCvc0W22zKIT
         Qc4ntVEL5GaMIuyR/e5+XC6erqhn8dXSbDqqHwuENZJsVQQX4k1UXZWz1EBJm+bnxnAs
         vO8+CQ2fU44jm+aG6p7hhTCR8soPJ2sqBPFJTI3BYZjEoQXRQ+/dDTqd/ZzBJolNNgw3
         6KVN9ac4IJC3rlYKYwSlHCDdD9Ubbxdp2SQWutxXl8JUyAykh13R2jR72CguL2fqt3aJ
         lAee9f4bWg0Z+qtb0oSOdVLTLw/i1iXazzjJ916SogCEFdOlWdR0RwZSO3i2AmWHqrmX
         aBMA==
X-Gm-Message-State: APuU4Z9TLqVH9IMJqFvzmrQtgXJs06TgA/ruiqi6BsRTgKjEmydldvCH
	7PEB7nmmjA4ePzeBljkze+IW8XpW+uMGBLlIvdX24LZjuqKZ4iAdV4H7YUqyvju2
X-Gm-Gg: AZFdTZcujnafqbQhiNnjfU2TfKYegZing+Sh55PKpoWGzKPgccMJhyWx0XqcNapQ98C
	0lb9wEvchrf4+5BEat29rPHIj8+mCpNDD78czULgw6xDYPAWDi2OqxDR51kSKsJovu7YA7Nqb6x
	mkDU2btQkguWYyLxsBOr8WKElUIA03yqj6RDS+n9IgLuBSwH4sggOS0K8QX6V50EmwAs04fJBL7
	dF6GtWzAEu6own74/zr888FkfnNyE0Mr7gLuMkdRUfXU1VUfKxEhgxe/oxUn6tnMH+a/RvOtfaL
	KGjr1wFfroA5kDFhRDj+Dmnppnag5vxSTIpiGIkwiuW3hH47vcTEbj2aGdyL3NjTf7I/FfsRViA
	bLFXyFHX8z7AuLub7aaNvevHu/M8GossavAlK7wjTm5twvRdX0j3RH5bZ7Ho2+5NCGoB9Mg/dfY
	XOoFNw7/bVjDtGFyt5TE47esHcfENBjHDO/N+qbBimry1aoG5HTUrunFBLMdpCm+hwJjlEdqmAE
	Z20G6W1oEXsTcjhZ82DLKFhHtxbvqt9XbP9EUTxCeOjdqqUSMoJckuVhrbWTJz2k9wG5IM=
X-Received: by 2002:a17:90b:3c0b:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b3d04d0f80mr4639475a91.0.1795059071362;
        Wed, 18 Nov 2026 19:31:11 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm254672a91.10.2026.11.18.19.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:31:10 -0800 (PST)
Date: Wed, 18 Nov 2026 19:31:10 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even when
 the type matches
Message-ID: <179505868590.3571070.12381528230330714812@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

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
v2:
- Move the check above the type handling, as Jay suggested, so it
  covers every slave. There is no functional change: the bond mode
  cannot change while it has slaves, and a later slave of another type
  was already rejected, only with a different message. Kept Eric's
  Reviewed-by.
v1: https://lore.kernel.org/netdev/179500849159.1877154.14715369660816392826@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, our reproducer no longer triggers the report, and enslaving
Ethernet devices into an 802.3ad bond, or a non-Ethernet device into
an active-backup bond, works as before.

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
 
