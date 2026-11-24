Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505220;
	b=z/rdZGArUGFFAsrxZxsp7uL/+v+k2L+4rb+kiEPRqV1K8lCzwFXhHCLt2Tdz0K3ere6n
	 C4v6zAL4/NwJxMThnypo2485Kx9uGHa4RON+IWobsDvU20FEMe1VxcjpOgModIk3G11p0
	 aol6ldJ7CS70NEd9/nVBab4jZT7Wi7xdfvqVCUBCDJ62lddbT3WtEsXeqC4ck582GHodI
	 damh7ipKgfOMuQngMYaFsg4t+GlE+4otpNrGRVqznNZiJzRC0qMerDo4lVuLSXay6LdzO
	 W9YVdG2g0X/qZNIHQS5xPLNd9EKlMg0xXHpK6RhU/Z9zPfGD7nGDyppXlUQDwF30C9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505220;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XJSzGTEyrWC+9txJQexwITeFvD2bjQUmZEzyXYqA5Dg=;
	b=KahgtGhOZjw7OdjT5TU/l6qYvJ4MLizSaNtzhvU9vbrj4L4dFrevzo7H8KUuGFc1t+6/
	 Blc/RukDOciqlBgR1GliBxb16E3NOAAkfstFFCRYWOKJOeuogbCIe5jS1WC+i/r+ShjYN
	 v6tiJ/T3RmMK4KBDKL1JzCchynB1N13qg3zE/20Q44Ihya/wsgXkhg03mOg8wk+yOrxNQ
	 8tfQNeC7fbhOf0INP4JMyyE9yjOBX39hk4ahu9vYVGFTDVhmzyjnEA3FfaOfF8U5alciZ
	 R20nElKmYtJ2TcYNwksv73Qgtsypc+hYtX3jo0W3omUeoAWMyr1iz0CuWw08Z1fdNCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b="Lfa+/YGI";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NnZkg7Jz;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67561606A32E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67561606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=Lfa+/YGI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NnZkg7Jz
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9E8E5EC08BC
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:26:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 24 Nov 2026 02:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1795505218; x=1795591618; bh=XJSzGTEyrWC+9txJQexwI
	TeFvD2bjQUmZEzyXYqA5Dg=; b=Lfa+/YGIgvdimgIF7KgIKEpGsn7RjzKQ8lTrJ
	p7FUCisA1ORs9na0RbnrPqykNSz38udIkYENyjEWUNN2U9n62m7yNc5WwUq3/H1K
	O50Ec2CbleR53By4SDpaI6LP+B6uaXdr1ajTqJwAjTGOXRhALBxDeS5Leu6lf21C
	XsBjFduMq0wmzTEkowHa0smrs9raGGk99eJjprcrkTC99g1ZCIIKRIOIgUkmM9q2
	GguQZXVnBiQ9G8f2n2/8vlx/P9NF6stwz8O2Td5Wmnw21/Gw358btGBPNaps6Rv8
	ik8CD+NuEx3te3/Va+L/jiCMielK3WL5HzHpiKPy/1C7P5emQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795505218; x=1795591618; bh=XJSzGTEyrWC+9txJQexwITeFvD2bjQUmZEz
	yXYqA5Dg=; b=NnZkg7Jz1d6ky3itSYKvlyD9ntLVhlTInK5ubNdVrW6DgIW6T/T
	5xdudQ6MEQB9NSehfQoS8+Twfw7mqyqInD3b2STesP97uWyLbgb1FJCIPhWeA5gr
	Uvkd8jQv3wSR5ELOSlA/p/KO0sRCY9wpGy9qkbb7jsntVEkktIRlFF7WkMbnOX2w
	szJImo3+09jt3bnb4CteSTnE/iZ7Wh8TZ+qskG4ii/p6UDZyRxclZZi0ejEParbO
	Cx7m8s/Vm577rxy7DFGIP2szqgha5gLyb2zQVXpaZR+7eyej9JdXNk/cR4n2zXx+
	bOsxr6dyukZA8dJj/E1nA/qrRiQX5l2hggw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795505218; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:goptmPoD4bjD7F5ZR/45n5D7JtvQQfyz2Z9+MzsgtEpOZfD
	wWrr2ef2azuKfqbTNEwY/pf5yV+TI0qlYgDper2TOBTcb9MRh2tJJHbJzVcLUYvw
	Z10w6iChV/gLIuWucfgea2XlY6A618jClwKst5FhDREvbbWuQswlfxzVe1136s5Z
	EIkA1sE5KTmT/gPyNUHsV3kyzmpk2IpCq5Lr3KiziSK4A6iN82Gy2C3o2Irma6SO
	cAD+ebHBsnvwURM2ex0AJdljdudU0F1BrKYZTeGY3IB50+J7FTacQTWoHr2e8XKo
	y4T3Uf4iSH0YdcnXb7uAj6xYC2UdhJK8eHWV6RA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:cXz+nI+wA0uarTOeYNLjlK/9r7a1WVcIAdQnQC8Ux0U=:Ng8LDK3i6l18FaoETpXUxUiH2zDwBfc1sZX3msv1eGg=;
X-ME-Sender: <xms:QjwFaxy6Rj3l6arcTfePCGDjpdqpm4F6i91I6OHyG8rSKN0N2WP07w>
    <xme:QjwFaz1G1q5hyjm9ofCqFejWCYJ0NzWk_Pg4LtUv3dFh2ke3yytKCSMTgcCdQ0d4U
    dxia19csINWWiIiSGgSiqkP2zfdMN0QRwFA36d4kcKY13sHhUQ06w>
X-ME-Received: <xmr:QjwFa--KsCGjl96dZPVyt_NuUIba9UIZ26aaiLIbS_EvNlxpXdoJv5mtagJo-E5rzmEeHZm279Cp3NKojV4>
X-ME-Proxy-Cause: dmFkZTGhVnm6XmrBZ5v2iyq81k2nP3W7fcpOc3rg1ktwJR/lJkRnqt4u2hI0d3q7ylXnRG
    Thn8apclR41rs6KkmFooV1cPvqKa5+U6DHcsM9FevPsx0OUt9ffYF9mLoOGkBhYPtMImD3
    nto5ICdBvoZSHZVJoMCwEDOHieKA3O35sGodpDfXJs4sNDTt5/JZ8NDhCBY4cJwMSgk8Kw
    MWI+W6qs2/SyvyM//kMvTYPlIiHpfp67Z+u8FIen4h2l/49+zwEaT3k7cpxtZZkOjHYc7s
    1KPPEOoKuJYYPcjVAsUdSlcAFrvcTj1i6qf5nkPcwDIWyXaZ/HR8OiPQ37Nns5nzAFdphy
    RDzitJdg3HOst/XmcfmCcCTX0AyikrPmGfBmTL+L+C3eAnBG/CHTI+3H1x1RcOU7DnRlgm
    JurjmBUzkfkOtN4oLtk1f6oywoAG4aTw/rPVplucRfARz/n+3UuppH9cwWtwlVI5fMlayQ
    hcIwKx1VancEfJCgIoon19jGga+Quvdvlir/TLQ4Vee/IPTYXful++f3c6lDWy0PtQDRIc
    354RIvSdGp4t1+eZaAxKBcFZ3aaoCGmksYGDyxrHlqRCBbZ7tzLwY07hSxj0sxf1FFH/sL
    o98cRU6bUZjEb/oipdsy2BXkgp6KLSHIlW0dcSkp88XP817Os6UkVuOLyuqA
X-ME-Proxy: <xmx:QjwFazqX3lgasTSlF-2NIhawreuWQTJ0h0MWDP3c63xjGNbRJt808g>
    <xmx:QjwFa4SvnAmr6rqN-oG8zVMUF4VvMZuQwa7krhlHWBK4qYdy_PL-yQ>
    <xmx:QjwFa2MJuTQIy-P9RaJSyH-CLyIMWS3bQ07rHdTc6ZvILMO1W5gjVQ>
    <xmx:QjwFa2jtgvs1IzTewLVOaE-jYv4PlyTArX_vfbWmlU5_pCajRPsz3A>
    <xmx:QjwFaxnYEAE8XrMx7GVOHUpEvt9wY056M0H64ptP7if-gNO-4cHwrByw>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 02:26:55 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: hfdevel@gmx.net,
	johan@kernel.org,
	netdev@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH net] net: tn40xx: terminate the PHY software node property array
Date: Tue, 24 Nov 2026 16:26:46 +0900
Message-ID: <20261124072646.3438910-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The PHY software node uses phy_props[] as its property array. The array
has three entries and no empty entry at the end. Property lookups walk
the array until they find an entry with a NULL name, so they read past
the end of phy_props[].

This happens on every probe of a TN9510 card. When the AQR105 PHY is
registered, mdio_device_register_reset() looks up "reset-gpios" and
"reset-assert-us", and the PHY node has neither of them.

On 32-bit kernels, the walk reads napi.weight in struct tn40_priv as a
name pointer. napi.weight is 64 at this point, so strcmp()
dereferences address 0x40 and the kernel crashes.

On 64-bit kernels, there is no crash only because of the struct
layout: the NULL entry at the end of group[] happens to be at the
offset of a name field, so the walk stops there.

All the properties are constant. Define them in a static const array
with an empty entry at the end, which is the usual way to define
software node properties.

Found by code inspection. The 32-bit crash was reproduced in QEMU with
a test module that sets up the software nodes in struct tn40_priv in
the same way as the driver. The fix was tested on a TN9510 card on
x86_64.

Fixes: 25b6a6d29d40 ("net: tn40xx: create swnode for mdio and aqr105 phy and add to mdiobus")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/net/ethernet/tehuti/tn40.h      |  1 -
 drivers/net/ethernet/tehuti/tn40_mdio.c | 14 ++++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/tehuti/tn40.h b/drivers/net/ethernet/tehuti/tn40.h
index 25da8686d469..73c81cb3e23e 100644
--- a/drivers/net/ethernet/tehuti/tn40.h
+++ b/drivers/net/ethernet/tehuti/tn40.h
@@ -127,7 +127,6 @@ enum tn40_swnodes {
 struct tn40_nodes {
 	char phy_name[32];
 	char mdio_name[32];
-	struct property_entry phy_props[3];
 	struct software_node swnodes[SWNODE_MAX];
 	const struct software_node *group[SWNODE_MAX + 1];
 };
diff --git a/drivers/net/ethernet/tehuti/tn40_mdio.c b/drivers/net/ethernet/tehuti/tn40_mdio.c
index fb1a4a2e4dbc..c6139f92c23e 100644
--- a/drivers/net/ethernet/tehuti/tn40_mdio.c
+++ b/drivers/net/ethernet/tehuti/tn40_mdio.c
@@ -113,6 +113,13 @@ static int tn40_mdio_write_c45(struct mii_bus *mii_bus, int addr, int devnum,
 	return  tn40_mdio_write(mii_bus->priv, addr, devnum, regnum, val);
 }
 
+static const struct property_entry tn40_phy_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "ethernet-phy-id03a1.b4a3"),
+	PROPERTY_ENTRY_U32("reg", 1),
+	PROPERTY_ENTRY_STRING("firmware-name", AQR105_FIRMWARE),
+	{ }
+};
+
 /* registers an mdio node and an aqr105 PHY at address 1
  * tn40_mdio-%id {
  *	ethernet-phy@1 {
@@ -139,14 +146,9 @@ static int tn40_swnodes_register(struct tn40_priv *priv)
 
 	swnodes[SWNODE_MDIO] = NODE_PROP(nodes->mdio_name, NULL);
 
-	nodes->phy_props[0] = PROPERTY_ENTRY_STRING("compatible",
-						    "ethernet-phy-id03a1.b4a3");
-	nodes->phy_props[1] = PROPERTY_ENTRY_U32("reg", 1);
-	nodes->phy_props[2] = PROPERTY_ENTRY_STRING("firmware-name",
-						    AQR105_FIRMWARE);
 	swnodes[SWNODE_PHY] = NODE_PAR_PROP(nodes->phy_name,
 					    &swnodes[SWNODE_MDIO],
-					    nodes->phy_props);
+					    tn40_phy_props);
 
 	nodes->group[SWNODE_PHY] = &swnodes[SWNODE_PHY];
 	nodes->group[SWNODE_MDIO] = &swnodes[SWNODE_MDIO];

base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
-- 
2.43.0

