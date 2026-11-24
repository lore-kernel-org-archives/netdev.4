Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497192;
	b=h3JGRa67dwJOKmQ1G9lqJTEbOyz8AmN4AEyj2BPil+0vlIAVlR65JUbciZF+/+cTnvUy
	 lw+9iPpbFJEZhUimmk0QJCJax/ndgtnYI5NnxuldG4GGgX6in88aBr6VSr0yKwBa50zf/
	 84q2d1gfTHhf+MwbcK/UidK+kbF2dKCl1XnptFi+7mhVg28p1oglllNq+b/cTFGEJ3Buf
	 4XxdNLllyMQKF7rpTMxseCfLbLsMsxiuUPaBeeOhlHfMcfZytC6EMJkWMI611p6gRpSr1
	 mSVueBouqAa2xHsMe8Fe0PV64LbgOleKVUzZvqFwlpxcv4sPWVqIULl7Ttsl7fkbhOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ChElyjeOV56VhhhS6y+bmoegOQ219Y3F4kqbJHEklmc=;
	b=W5w5wWBiGwj2QdocTNQo4+155mRQ3kGqOxIjibJF3rASBxijvtTMPEEN855TZFvgkrE+
	 SnoZT4qtI5VosROQ/TxdS2Qi1Vg4gb24694FyNEOxvNAD87oK1ICEzWaplX6elSJ4A746
	 gtDKmxLpJ6ro73leVgp/VQLKrZvc5lPuIjUUdQ/z4/Ed9g04K2rafOYlmzxTgupFlvspM
	 v6MYrSXaO85m5T4zi3jNa1FyqyazDWXtUoamrCRPb+j5Ds9hWaDz0YNgH61em1TYsy+q8
	 Ry2OyG0esHvmQyFuK40gGF7lm9BwJF5psRdpcvnCfl3IDGLUnPuaXdUtUzClXDtGX0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khgue2PP;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD5606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AD5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khgue2PP
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso2265915a12.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795497191; x=1796101991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChElyjeOV56VhhhS6y+bmoegOQ219Y3F4kqbJHEklmc=;
        b=khgue2PPaBrP38DxFon8dyZrSoodrFVtzOFF7wWddeLQdJ7Ue4YQwRyvzkzhw6kf1V
         GuhObaTkdhOBlgwFkdf1mXMb9aCMDEhqyL4GLaUKCp8ZEzQy8Zw3I3wtEznxAcSyHP49
         N/T5nX66bQa/ufdmfIAFd6oxBtpTaYCbnfu/XbZd5E0tZjVhhcyX3PUhpUl1JbHzSjBn
         KsVhp+bCup+IUsOSHtwU05gERVtqQeRUfGyJg0ryVDMZU4kw70dy08UqZsFc/XfqAcZ1
         WAV5BwAtx2cC8iJxMbx8P4B9k4XXgL8alQT4Ypt5A03RlYKmDgaKWG0yKZtWeibWixhV
         VMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497191; x=1796101991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChElyjeOV56VhhhS6y+bmoegOQ219Y3F4kqbJHEklmc=;
        b=WnoSzJFYPzjURT+iZOwiC7XRVWsKt6yJNLAG6g6VpovaMwmjXx38rKzF8xaNshUpRT
         RPlXzS5ikbTRIwydKV9m1wdr+QiAhnGE1kVjt0tgy9x2F73TibycA2t9v1EXVFXpse1K
         89+UOMjYU6Y8mK6Dbl6BYuZpCzoVWamgod1cb7nWFquIarWq4BgdipgtNmL5r124yjuR
         7m52nCybKwbvC5BycvCQo3WpF/thySoQwZXd/yhqOe05bwVxCIJ2x49pT4D11UZwgAry
         a8dhGujT5z1I3EFih4Ynte0r5XJ0JUxhgbNyyPHDMFwfNucPMDIzVO1Mmd9c4ieU1IIp
         yIhQ==
X-Gm-Message-State: APuU4Z9NzzSwXXBb1i+vO9bRRkoLf1v3jeRXkJCUIuAMd4pDZm2s38gM
	0GgxDlwMgCacxskEmmfrOeDUb25T3yIBcKpe3uD5D+fTDLwcpPN+dW4ZiLrDvzN0
X-Gm-Gg: AZFdTZelWZ/KXwHT3bXPRg2KNlwzCUAp+V1x5gaVkD9VakaK3BwqpSq4l454VlKeIEl
	KQH+sndy5Mgo0lVkCWcpqrccK+JAjc3f24xykWRcZ4xq9XjTOlZkZslj3Tm1EIO9C97HbpRe4aT
	8gbSdSqDYgqzBHQiiar24v062cNsXvdLCTczDb4US3gOzjVsl8+g3Q+Rjr4L/w/AwSJe4EZ1vxN
	CPMrdFu6EGotqR4guLevr9zRwCiT0Mu/vNiinreTeXIU8YS3SJoYGni4x03OnjPT6L/TJ+xbW0T
	snGEJ9QsppJsmwJySNaztgDvvAGDVcdjobM/OP4Jh3CVRWXRrJZGLmuCnfQB2qQ/uCdtck90pMb
	4v4JK9b4Fl5lkWIraiaSRTvR/4qS6vcRUVl1gsvltJjbLETvukpFQ6Kb91R1FwQaeSxH3SpfIuI
	pk05mbZPVhU+XaUHrq7GCAvSHKniXL1584L4LA76Ghc+W+0S09aQ81QdP9yfdMBHi1t18BWcgZq
	yrQHb7UoqWsFUwFjLAOCZ5rGzHD6F2rUDAhlFbpaXyY1N9yU/RQQaM/qXutTm/nMp9ZWnZ6Z5YF
	4NYacsx3POK/AD/PbPzlQ2FJMv4sSNu2mBFyPjqAxPZRGu4+oCnuCc/SdxvYrKJk02Y=
X-Received: by 2002:a17:90b:5289:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b41c908147mr9432607a91.21.1795497191050;
        Mon, 23 Nov 2026 21:13:11 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7500992a91.1.2026.11.23.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:13:10 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/1] bonding: keep non-Ethernet slaves out of 802.3ad bonds
Date: Tue, 24 Nov 2026 14:13:03 +0900
Message-ID: <179549697473.218888.6814133305133689781@gmail.com>
In-Reply-To: <179549697473.218888.8044828119056769556@gmail.com>
References: <179549697473.218888.8044828119056769556@gmail.com>
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

bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
802.3ad bond with dev_mc_add(), which copies the slave's addr_len bytes.
A slave with a 16-byte address, such as an ip6tnl device, makes it read
past the array:

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

Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
devices") rejects such a slave only when enslaving it changes the
bond's type. A bond keeps the type of its last slave after that slave
is released, so a bond that once had an ARPHRD_TUNNEL6 slave can be set
to 802.3ad and take another TUNNEL6 device. A slave that is itself a
bond can also change its type after it was enslaved, when a
non-Ethernet device is enslaved to it.

Check that an 802.3ad slave is an Ethernet device before the type
handling, for every slave, and refuse NETDEV_PRE_TYPE_CHANGE for a
slave of an 802.3ad bond, as team does for its ports. Other modes still
allow the type change, as bond-eth-type-change.sh expects.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 drivers/net/bonding/bond_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 776afdb9df43..cf67104777d0 100644
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
 
@@ -3992,6 +3993,10 @@ static int bond_slave_netdev_event(unsigned long event,
 	slave_dbg(bond_dev, slave_dev, "%s called\n", __func__);
 
 	switch (event) {
+	case NETDEV_PRE_TYPE_CHANGE:
+		if (BOND_MODE(bond) == BOND_MODE_8023AD)
+			return NOTIFY_BAD;
+		break;
 	case NETDEV_UNREGISTER:
 		if (bond_dev->type != ARPHRD_ETHER)
 			bond_release_and_destroy(bond_dev, slave_dev);
-- 
2.43.0

