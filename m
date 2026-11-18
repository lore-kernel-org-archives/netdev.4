Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009092;
	b=ESIa9EVyp8V16epy5lnaS9Vy/+sH6B5MD8tqP/ZVz5eag+MV91hafQPd+zhYDtjijjqn
	 7V/BL72Vng+DHWCUfvA0VyXeCjJzPm0oraPuw9gcyEYhpUuGn83SLxwgHMjjq3M3FMS6+
	 z9mZwaEeeKoCHv+8ogg3V5lUG7560UQyihqD/i0SYLX5LLjlhCnXshsQEPxT36Qbn/k7F
	 ufmgp6smKJb5xQiWtFteH4pFMX6jdk5Qh8D5nUrOaJ/PgNxq3UNcav3cS00W1AfnP3uma
	 GInrdaQUfN/8Ve7AHTZMCp2Bd3X4YY25npMDTPg1+l3f9cUNl7nVcmbFeu1i2teI1Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=a5bNHyxaBopSMQv9gyQkBCOwl0pjMAXYd/WU9PGwyfE=;
	b=HintXlyZdXSsvBa+fUkYuLmpMoX2u4G+qNIscdUIcXE17HUYR/OzVynEM8ZQkCdPKbdg
	 9mI38IlQv7Rnuj5rNJReZiG0L6YBezQQ3eyyUdMnTP9Zub26mvJi+cP2z3miFtrz/oHOH
	 51B1kINKG577ksGPwOrmdXEPgvgEJAhmdZqMXuL9zo5jNDgXZHGmLAhCmnTsj736x6Q8V
	 dUd0912JPPNognEfozTOUD3FV3wC343XjjqHP9Hl0e929fSGrCUGNHBMD/Dhx4m5WaPUi
	 0xaUptL7BzZgfWQlpnw7JDSO6PURQgsSWZCXeT53Y/imG7wgkXW4a/53QKW8T+UFxlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yc/64Vhq";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9AD60A260D
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9AD60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yc/64Vhq
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so609406a91.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009091; x=1795613891; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5bNHyxaBopSMQv9gyQkBCOwl0pjMAXYd/WU9PGwyfE=;
        b=yc/64Vhq8tbXHjERtz8Vm35z96IcXW71GyAv4m1s3Irs0PXIlZ9Xra+CyTvFc2Sv8c
         WmR7861gO92zRdkhMbIqfnEJ2cAtRMRTZdOIjIkLVYRZbTYX3Td5Gbd8JeJBibdJzmVu
         i/DioH/xIlPgKNsGhyS0DDWTw1CRzgLCgurCcPgowRLosYLDh1Bv7vgoXQ8WsXgx49tP
         FQesJDZx5lkCzY1T1uHuB7Piv3xTzZ1QdLaTf2iFTLDdICJzkmdtEO+twRcUcb2k9F8s
         dj4PoSorY/wxi8On4WP76mtc7qBh7qvsAttrWX5FpCFkW7pmn3XFrF8VP0jlNpHKwLai
         bmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009091; x=1795613891;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a5bNHyxaBopSMQv9gyQkBCOwl0pjMAXYd/WU9PGwyfE=;
        b=hA4xVxKnKFNBW+p4AhFhD/6MoDDtBcUchmjbRWRrlhAjKKmuP4wWMYxDTiPHbIIzj6
         UI6xkxWej4do/WRuGZ7v/aySzoq5krMkDlwRhqt0WJTThUiovXjM4SOagKMdWhna4OYP
         GO3pvsNXXMlMuZ55oA6Kq+s3a1c8eHJRvQm66ZGJDLM35VrkrvhS4vJDpw0DWMS8ee7b
         zmPbo6XcfQs+fJ4gme/fS5N1g3Ixy2WRlXLfEWgDfvO4Kr7jO28OI/1vim9qUfBZ94em
         4LXVmzQcHj4Yh60f+O0M3iStz31K/mY1x3knJ1jVME1fOfsH0bfh2KTzV8aclKsbWLpj
         yvvg==
X-Gm-Message-State: APuU4Z8/ORMj7IavqTz5J7R/3iCef9RroC++S+xZcr1fWaqEMHKf5tty
	vH4UaIuDSVD6Syh/xKp024iim4CcEmtPcJl/f/FdMm7vJsOEXSychNTwj+SdgvMnp7oDPg==
X-Gm-Gg: AZFdTZeH2wFj+f5gJA0aoWcsW43JkCqfEQ9Kgnv8O7UzaSIHSoK8qvLbEw5qYf01kuu
	i1tnpP4eB9i5oAwT1vJL6c9iJsYY4LjozlBhhWMI5OlcLQDbN5r6+ZVsxAhckjyhVzPB0yc6Gp1
	tN6eESEZTXm/z30MgLRLZJgq+QN8BsZLd6hwYizyKlU5sUFWPU12ivas8K2cFaOjstBnnb/lFyZ
	ywm1vSuOEPZqldLsWj6kh1bTRr8RATnOCZCIsikVnIrZifLlVWdTCVnN3V/+AykoNywJ56H1svy
	WEpQp21mQyT2LmJWd7Vq5AHk4RUzUgjIqnPoZyr20EHVMzUEktXAiOmvTALWo4+EbUNN03mmSnf
	HFwD19HMmWkHeJ4hTZ0wWePYBPojWzZY5kAhd/1SIix1pZldRMUmIk0ELkkarokdFYmq4GR8rj+
	RYIbWLbKu96CxaLrCjEA+tByw0zR0huzbk7gRh3obdlznWNn5WuH7IJsIjmiBzYsetp7zbyZnOQ
	UOKyeSGRSsMWLxdS/Rn8ktVsps6NQpBg3Q6JAca1h9h6vIk+8z2hh6vheCI1g4Ch92VIWc=
X-Received: by 2002:a17:90b:288c:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b3d0689ademr2728689a91.5.1795009091301;
        Wed, 18 Nov 2026 05:38:11 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187daf4sm4671824a91.4.2026.11.18.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:38:10 -0800 (PST)
Date: Wed, 18 Nov 2026 05:38:10 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] bonding: reject a non-Ethernet 802.3ad slave even when
 the type matches
Message-ID: <179500849159.1877154.14715369660816392826@gmail.com>
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

  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex+0x26a/0x6d0
  Read of size 16 at addr ffffffff878a1620 by task test/115
  Call Trace:
   <TASK>
   __asan_memcpy+0x23/0x60
   __hw_addr_add_ex+0x26a/0x6d0
   dev_mc_add+0xb1/0xf0
   bond_open+0xaa6/0xf90
   __dev_open+0x2fd/0x7f0
   __dev_change_flags+0x480/0x670
   netif_change_flags+0x7b/0x160
   do_setlink.isra.0+0x16f8/0x3960
   rtnl_setlink+0x474/0x870

An unprivileged user can set this up in its own user and network
namespace.

Do the 802.3ad check for every first slave, not only when the bond's
type changes.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
This was first reported privately to security@kernel.org. Eric
reviewed the patch there, judged that no embargo is needed, and asked
for it to be posted here with his Reviewed-by.

The patch was written with LLM assistance; we reviewed and tested it.
With it our reproducer is clean in 6 of 6 runs on v7.4-rc3 and in 6 of
6 runs on net (2a324a58a084).

 drivers/net/bonding/bond_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 042d7c75548f..f2e645f869b1 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1959,13 +1959,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	 * ether type (eg ARPHRD_ETHER and ARPHRD_INFINIBAND) share the same bond
 	 */
 	if (!bond_has_slaves(bond)) {
+		if (slave_dev->type != ARPHRD_ETHER &&
+		    BOND_MODE(bond) == BOND_MODE_8023AD) {
+			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+				     "8023AD mode requires Ethernet devices");
+			return -EINVAL;
+		}
 		if (bond_dev->type != slave_dev->type) {
-			if (slave_dev->type != ARPHRD_ETHER &&
-			    BOND_MODE(bond) == BOND_MODE_8023AD) {
-				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-					     "8023AD mode requires Ethernet devices");
-				return -EINVAL;
-			}
 			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
 				  bond_dev->type, slave_dev->type);
 
