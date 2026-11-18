Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970616;
	b=Uiw1jFbxR9FKH/FaVxIHcpJd/POWXi5zSxn3bHo3dP+QMw7A8aeMZHVerTULXneZnRt3
	 /zvrpSmQhpmTll7hybL6X8FepMWuNqCBJEVRrsutfpu63xcD1w6RDxcaHciPV772qkTy/
	 AJtgG9kNAFtnGIoj+b8PxGsq3D4tE5E20oHt4kDjofauuWE4mXABZjF8h3ACBOf/kKfJ/
	 SvzVQcqJ8pqwXadCnZkZPH2VbrSsgtxJd2FgYFsJ/xq4FUHZCIQuJTTkJK9TQInkv3teA
	 8QLnerxnrQCcnSEh7I8VOcyEF30gT9y7CHa34vmd6ymG1l6LUjodROwBBSd0TW1x4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970616;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=eg7NMuzPwVvUZHsljdV+WNXSBJJGrbA0gnIcZswSWFQ=;
	b=1hpYPURtQ1opySPr2Tk++x/HdWBK7mXCiBeFhqHn+rdavc5oEY+uVuVD3sqxZi24yWAL
	 0oAd07Kj6iTcRc0tE2ax/MyJzHzb8FvoYIMO5+EdY4zz/aqWmojfod/OHNv54Oc3cQxa2
	 pdjCYBcTV/Vbs5HtcCHg4E0km0IsTvrnLu2A2ovATs2pUxYGcrvsph3tjo8iEQ8TyuaZC
	 x3DBa6FO03mtqJQp3oT3bU0yRzUU1aLgwaJS2J/vzIsrbT08dtzZ5SVjerm1UGbRaTBQF
	 RegZKlE0TUyGEzB3jxd95kiGNtHinlrG+cpBrUHVfp5Y99SdsXjdyMhb2zrovTrKw7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=pass header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=OvqD57Ls;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=AcTXsxUa;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA0606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=OvqD57Ls;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=AcTXsxUa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1794971515; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=eg7NMuzPwVvUZHsljdV+WNXSBJJGrbA0gnIcZswSWFQ=; b=OvqD57LsobPjxXx8gghja4Trfa
	mD2FEp8aR/NRsGFXh+ws+49t/zhoybHCKOCXU1nfRd3sg9wKcALlU1ZcloVsy6GyAWGhC7xOlxGtD
	Rcic1T/BOr1sRLjMsElgJO7a+MbT3o3CODL/HGzx/RXm88I86PvoJ8M7m6XTMFaSnZYmHMT5LOEKj
	AJlUilItKcZf71FWh4FXWQkHcDY27mW8gwZ4/Fzmv+DyeGu0Usj6eHvuTBsKMf3EgG9SW+NMxBm2Z
	t+mke+Pt+oW+1xekZibyFYFvnuk/MTuco3vxR+4OS2ANw1m845fMOExar8FWUg1Vc+EfFI4S4gKbf
	2Kk5sQow==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1794970615; h=from : 
 subject : to : message-id : date; 
 bh=eg7NMuzPwVvUZHsljdV+WNXSBJJGrbA0gnIcZswSWFQ=; 
 b=AcTXsxUaG0PdYmz4ca2FuAtyDr1SupBVjoTyA+hXuC9wNOgK96zbT6hykUJSlCHDN00LVC
 1seU7ir4N/zQ/odPk06angf/bOVd5pslejrvYNW6aq4QdfexAv89EmQGxrQRzc+Y+3l8UZfx
 OlzQLyqfmM4qU2Wipd9fbRr3uf8C7Eh/UBnQ8GZ3Z+yKODtCp3oNAeY84U8hYZxa4n0qSzbl
 RATli3SozcWLPT5nHpAitb2GMfJ0N6j6IJA9orSogjoymKmL2Q8QfZOZNtWaIymBFyUnHlsr
 +YaRoUNDIzYiiLjeUx8s/W+c2zrzqplLKBzjs3X7fhXQqbWFDK8xVh7g==
Received: from [10.45.79.114] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTVqn-ED4yOy-AK; Wed, 18 Nov 2026 02:56:45 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTVql-FnQW0hPz57a-NHO6; Wed, 18 Nov 2026 02:56:43 +0000
From: github@bumblecito.com
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Israel Cueto <github@bumblecito.com>
Subject: [PATCH net-next] net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
Date: Wed, 18 Nov 2026 02:56:02 +0000
Message-Id: <20261118025602.171615-1-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
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
X-Smtpcorp-Track: hGvVdTBzboae.5JGv7ZQCDVt2.O6MGeQyJ53j
Feedback-ID: 1130875m:1130875aWStQz3:1130875sO5hQYxWT0
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

The ODI DFP-34X-2C3 XPON SFP module supports 2500Base-X.

Add a quirk to enable 2500Base-X support for this module.

Tested on a Horaco ZX-SWTGW2C8F switch with an ODI
DFP-34X-2C3 module. A 2500 Mb/s link was established
with speed and duplex forced and autonegotiation disabled.

Signed-off-by: Israel Cueto <github@bumblecito.com>
---
 drivers/net/phy/sfp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 915156743..666e515d2 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -606,6 +606,9 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK("HSGQ", "HSGQ-XPON-Stick", sfp_quirk_2500basex,
 		  sfp_fixup_ignore_tx_fault_and_los),
 
+	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
+	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
+
 	// Lantech 8330-262D-E and 8330-265D can operate at 2500base-X, but
 	// incorrectly report 2500MBd NRZ in their EEPROM.
 	// Some 8330-265D modules have inverted LOS, while all of them report
-- 
2.34.1

