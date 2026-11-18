Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030659;
	b=UUjSXAiy2VPRi6Gkd0rcYabtYsyJH93PI0+T5v6YuC/wjQqDJLuudmLY+fcB64CShyGa
	 +/Blw9AbHvRCix23J0Nlmb0LpTzvbn+AC/h9E96no6NZYRVErQ8Zy35iDR5dJhZ8QHW8c
	 55fCdAORJDC5wkRLGKUey0rKLOvd9RWOrv9r4cSWylH8dScGwkLOhslm4ofNO+rFBQ/zN
	 g5d5IppfEWhd4GkkzGub0mM7F2G1v093zWrD8cHAwMc8+yM3u0QO6gTR5BjZavUtAmj8S
	 h+b7kZ/uEkn3a4UsoQ/UtayS0cfuUKLrkvT3sfb/y74sZ7oYEqWIdHY7ym3vfIHgPRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Received:Received:From:To:cc:Subject:In-reply-to:References:
	 Comments:X-Mailer:MIME-Version:Content-Type:Content-ID:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=yP5uIeHhWyufXwkEyp3q0ifamrjfDeCYoOCmrgIe0XI=;
	b=mtEiu6A4TZbzMP2fDEYT+IqJ06u3BHNFCcEjSo4GThAX1ll+LDIHKii3MNQxOzeeeH91
	 yCwoVPVZqUzWRz75IVv/DQDXtQsRFrLnUtKzUcE6EIgbTohnh0YrYpQBsuLJQW9HH/vGf
	 6lYA9zugEJoaWTbdo9TRENe6UIG0wQZ3Ui5eThtLrhLKZNZHEtVnr7oeh8ZllFhR/7dwX
	 EsDvPrdps8RYmqJqYOu8eYDI6MeuPWY96ufSYFC/3k/oxhpPS4KPDKbxJEoeeqyRCWapo
	 rqjk9J5QzXnIxLUAyadjwGzRuTGUQoXbKzVSdDvecGKCOvu4sPnm0Zf2Gm6//i9BjgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jvosburgh.net;
	spf=pass smtp.mailfrom=jvosburgh.net;
	dkim=pass header.d=jvosburgh.net header.i=@jvosburgh.net header.a=rsa-sha256 header.s=fm1 header.b=X96MQCH7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZpPPwmiD;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30353606F51E
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30353606F51E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jvosburgh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jvosburgh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jvosburgh.net header.i=@jvosburgh.net header.a=rsa-sha256 header.s=fm1 header.b=X96MQCH7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZpPPwmiD
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 3B2D7EC05AF
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:37:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 18 Nov 2026 14:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jvosburgh.net;
	 h=cc:cc:content-id:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1795030657; x=1795117057; bh=yP5uIeHhWyufXwkEyp3q0
	ifamrjfDeCYoOCmrgIe0XI=; b=X96MQCH7Hrosf8O+PNoIj9xseRzOogJiGKe4d
	M+hOH9TzlKeABKigEr/nP0LigcjT5ai2KSftWIExKNLOUP6WJuhO2RO8xZMt4pur
	Q0Ar4/PcVVSn75uJ2jMUfYetFWLA/48v98k6TDrRpxUe/pU26Ye+eUdmSeD7W0JY
	3uyc5o9qDz5u6xaRzao325OHsXW/YPkSZFMaASF8rP3GSJyyoMCG+rWwZjCrtDj9
	Y7f4D4TH9jAMGKZOc/n3i1FPleaL83MM7YCPKfgE4eBFu6ptYCA6mDhT9QbqUh31
	IEv4QIxEvUKkS6KvF7V7QqlMR/TeOBXg9S+1gcxHzX2G2itDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-id
	:content-transfer-encoding:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795030657; x=1795117057; bh=yP5uIeHhWyufXwkEyp3q0ifamrjfDeCYoOC
	mrgIe0XI=; b=ZpPPwmiDEc8FSvzB5rHBp78/C65e+mBsMdF7VsF+DkzjK+2ArG1
	26L7XqaXV5tzajJMbReIUuST/GIS0zax6Hno8M54r5LCm6Orra+mnjhyCkz/MUPc
	A4pg/vWXnIdCl/KEmIrcbq5xPVSCPUnqEmlxuz7Z5/Rt3CRgly2AMwfXM13FaQ4M
	gWqNHL7axiTb8DUKTBRqBQz4TnE1QgX3GVbZPk2LC7XGn2FA5qL0hm31W05y5ahY
	yz8gejwUOvclptNBIjKYe6nNvFhVtk8/eRxEJIx1tcX0XDKwoqQ2rWfKKtkhGPzd
	EXJqEUZpTrlI+K7oxCSIazC5XsM60f6h0wQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jvosburgh.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795030657; d=jvosburgh.net;
	mf=PGp2QGp2b3NidXJnaC5uZXQ+;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:AUBdFR13WWWcdTuF1ZZbzFXchlZvdlw11L2IrpIoB0e/U8v
	wQhO4mco3z15h10PNUstODPsNbgMktVE6XlNRKQ/cNTSJiHOSzNzrLoRbzB62U84
	QaJE+d4XcHYXzopDU753MgVpP13dIryaFcEGZKyL6BtT/z5RUZIZOHEo4bzpjRhO
	ggSw/0yeSUGv7L9uCPVFKBGZlt93hAvxkrc30PFWwrGH7Z8mkqe4GQxVYbKz+5uF
	OI+uUWIwIU4Cl161t1w5uZkH9uGPvJHgwkq+GV/uARmoTco/no0xYokU+EYIyCqA
	bhILNLv+wE/J0YMjWbiaswXrY0SMsNUpAprQZVg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,comments,content-id,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6dJtZ2y5DCMaVJ40pwim3m9Jfdoq0BIn5WFiGzZeAEk=:R/FiLaTaFITAGo3KiRJd4Iy0sdHbt42m/62u+PR/gjM=;
X-ME-Sender: <xms:gP79apZajHePvO0Nc-36sMhvxgAAxjCzy9nvesODRowNlUfjd4LpWw>
    <xme:gP79aqZzVgs9biebTWJVuZWBremo_87PkZ6ye-k3uWFFVZWbQBaupCmHjtMwzE2QF
    OoohWVw6kPdewMpUWruP2xR90PS13F1I0RXWcrb6adFRjZb3SIWOTbO>
X-ME-Received: <xmr:gP79ainw_DgUKEwYMEsytGzDiE7rqWwQC-BAYHo-1sqa060QQqd0EeIvrjtT3jxHct9j8w>
X-ME-Proxy-Cause: dmFkZTEV7QuZ27H+FBkpLjFfttmg+Bqb8FpUZfuHazUHWfT7uZiMQGOzHcji1JFpFNeprO
    gfpFLOFAXQZmEnUjYqqO+4p/+04zoHQF/1esWPZO9xZINgViTo/jv+dA11FqOTbw9T2fih
    He2rDvXhlmErJlDGoMCt6YaWBoBWeY/ZQ8+sZxv2tUCXKuqoSUK/oe+fmYgbxXeYiakpza
    ASk2v5y2mrO1UWrRs92W8PA/dhfeXC6cMtTFl8PxDA/66czfWvm7M/Qht2lU5MB/t6D3Rp
    mDBfhNjSC0TZRUbMBgDqJsLPk0noIF2eniRKPEnSwHlz/BDoTaA2ZCKpj3tTyAxgyx8/HW
    G7GmMYF0iL3jTDjnmqkWr8AKCGxdMYFJkDQk2kSj+WWFKlO8E/GxE7urIP/NRXttEcWLT9
    MwzMU9HDwyRHJ8Xr9n5Fo86XTnTi8T1D+FFbU4LB8bBTxRq3kfDwumLhczRZe9bVvwkJQX
    hgkvC8ty43OwKHqob1l8OZQNj0KcmW2AZ1ZM6RkfdmeiPgBNhN17+7I8vyOi2WDh/hl/tn
    nb8d+r8sSXxQIsOMv/bKG4+Ad5u/SQBoiX0dQA5Pg4EW1q65vxHkjEjx9pbpP8uuLHguUM
    CO7I8V1WeL9v49KSH7sw8hp8rRUC5IvOVOCf7LEfV1TB0YpNrRHe1kGwpB4Q
X-ME-Proxy: <xmx:gP79al0V-1dsLsoMWU7QMnw1Zek96VPry7ihNyM1-KZP7aGuS25SCg>
    <xmx:gP79ai33mOXKVTdhpKVV2XsyTarX1AfvnMhDSnOwMwbapqnxSwbUXg>
    <xmx:gP79anqMY0ZwuOnd5tlyNN8YUog3Y_UGHXDDgLKed7vwFMJZmWx1JA>
    <xmx:gP79auhALjwuevkGhmiTCxyGd9ovOv0Ycn1_wKifh8UL7pbGW_bChQ>
    <xmx:gf79ajI-Ps8nrKdAe1B490bGhBrsKDDzgRwU0xsG_KxtlrVPt_KkeYi->
Feedback-ID: i53714940:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 14:37:36 -0500 (EST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 62AB39FC91; Wed, 18 Nov 2026 11:37:35 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id 5F60C9FC4C;
	Wed, 18 Nov 2026 11:37:35 -0800 (PST)
From: Jay Vosburgh <jv@jvosburgh.net>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-reply-to: <179500849159.1877154.14715369660816392826@gmail.com>
References: <179500849159.1877154.14715369660816392826@gmail.com>
Comments: In-reply-to Kyuwon Cho <kyuwoncho18@gmail.com>
   message dated "Wed, 18 Nov 2026 05:38:10 -0800."
X-Mailer: MH-E 8.6+git; nmh 1.8+dev; Emacs 29.3
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <527764.1795030655.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 11:37:35 -0800
Message-ID: <527765.1795030655@famine>

Kyuwon Cho <kyuwoncho18@gmail.com> wrote:

>Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
>devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
>when enslaving it changes the bond's type. A bond keeps the type of its
>last slave after that slave is released, so a bond that once had an
>ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6
>device, such as a second bond prepared the same way, without the check.
>bond_open() then adds the 8-byte lacpdu_mcast_addr to that slave with
>dev_mc_add(), which copies the slave's 16-byte addr_len:
>
>  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex+0x26a/0x6d0
>  Read of size 16 at addr ffffffff878a1620 by task test/115
>  Call Trace:
>   <TASK>
>   __asan_memcpy+0x23/0x60
>   __hw_addr_add_ex+0x26a/0x6d0
>   dev_mc_add+0xb1/0xf0
>   bond_open+0xaa6/0xf90
>   __dev_open+0x2fd/0x7f0
>   __dev_change_flags+0x480/0x670
>   netif_change_flags+0x7b/0x160
>   do_setlink.isra.0+0x16f8/0x3960
>   rtnl_setlink+0x474/0x870
>
>An unprivileged user can set this up in its own user and network
>namespace.
>
>Do the 802.3ad check for every first slave, not only when the bond's
>type changes.
>
>Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices=
")
>Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
>Reviewed-by: Eric Dumazet <edumazet@kernel.org>

	This patch looks like it will work, but, since 802.3ad is only
allowed for ARPHRD_ETHER, I think it would be clearer if the block were
moved up a level, i.e., above the "set bonding device ether type by
slave" commentary, something like (not tested):

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_ma=
in.c
index 7019e5d8fdc8..b5d7e0ebaf21 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1948,6 +1948,13 @@ int bond_enslave(struct net_device *bond_dev, struc=
t net_device *slave_dev,
 		return -EPERM;
 	}
 =

+	if (slave_dev->type !=3D ARPHRD_ETHER &&
+	    BOND_MODE(bond) =3D=3D BOND_MODE_8023AD) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "8023AD mode requires Ethernet devices");
+		return -EINVAL;
+	}
+
 	/* set bonding device ether type by slave - bonding netdevices are
 	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
 	 * there is a need to override some of the type dependent attribs/funcs.
@@ -1957,12 +1964,6 @@ int bond_enslave(struct net_device *bond_dev, struc=
t net_device *slave_dev,
 	 */
 	if (!bond_has_slaves(bond)) {
 		if (bond_dev->type !=3D slave_dev->type) {
-			if (slave_dev->type !=3D ARPHRD_ETHER &&
-			    BOND_MODE(bond) =3D=3D BOND_MODE_8023AD) {
-				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-					     "8023AD mode requires Ethernet devices");
-				return -EINVAL;
-			}
 			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
 				  bond_dev->type, slave_dev->type);
 =


	In my opinion, this would be clearer to the reader, in that the
802.3ad restriction has nothing to do with whether the bond is empty or
not.

	-J

>---
>This was first reported privately to security@kernel.org. Eric
>reviewed the patch there, judged that no embargo is needed, and asked
>for it to be posted here with his Reviewed-by.
>
>The patch was written with LLM assistance; we reviewed and tested it.
>With it our reproducer is clean in 6 of 6 runs on v7.4-rc3 and in 6 of
>6 runs on net (2a324a58a084).
>
> drivers/net/bonding/bond_main.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_m=
ain.c
>index 042d7c75548f..f2e645f869b1 100644
>--- a/drivers/net/bonding/bond_main.c
>+++ b/drivers/net/bonding/bond_main.c
>@@ -1959,13 +1959,13 @@ int bond_enslave(struct net_device *bond_dev, str=
uct net_device *slave_dev,
> 	 * ether type (eg ARPHRD_ETHER and ARPHRD_INFINIBAND) share the same bo=
nd
> 	 */
> 	if (!bond_has_slaves(bond)) {
>+		if (slave_dev->type !=3D ARPHRD_ETHER &&
>+		    BOND_MODE(bond) =3D=3D BOND_MODE_8023AD) {
>+			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
>+				     "8023AD mode requires Ethernet devices");
>+			return -EINVAL;
>+		}
> 		if (bond_dev->type !=3D slave_dev->type) {
>-			if (slave_dev->type !=3D ARPHRD_ETHER &&
>-			    BOND_MODE(bond) =3D=3D BOND_MODE_8023AD) {
>-				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
>-					     "8023AD mode requires Ethernet devices");
>-				return -EINVAL;
>-			}
> 			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
> 				  bond_dev->type, slave_dev->type);
> =


---
	-Jay Vosburgh, jv@jvosburgh.net
