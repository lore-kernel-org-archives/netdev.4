Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019070;
	b=ha/BJnj3m2ta8P17xEpupPPwWF7s98LFMKGwUeWuEvNRbiluIOs8A2dwoY/+m+F5LTKX
	 P9a2pvg3Aw47SgWeSb9HmiN+wUBVl/Q3UUAKSbiekLjAWNkdTd/5tj+GtxHBDeghazdg0
	 db7g6LjqP7I+XwJIdAdW4z3nqgkg+YOAv2/BqaFj7Nt6guJDYytzpAtqagbkxg3ry4mmd
	 SodwcCccOqQyALMHB30Aua6R9DfkrOKbCgsjy6Q/Y6G/CEP8qSKDm3jxesXBMMyzM3Qux
	 zt5dGRM9dgBrn4sj0gXd5Fod+DYa7nojQyoF1zJSwRee79W2QxgfFjCqm8mESEOV2Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019070;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=XOYmTp1Vrhbc19yqIzrUeKxVoL+mHARZX0vwQ/q/7mg=;
	b=XQK3i2yP8xMbw+HvjDAg/FF9ryrY8VdoLd2uGwTt/RnIfFtBi49hLr8mXvpKmSn68XmW
	 qUT/zmV6afdjrjYTq/npFKWTISn6Lwdk1sQq7h5XiXX+NxaPkAuGwDwAt/kEsRMon8c8O
	 gmlLSIzzOKxOMStgDmbITPjlcMgEL2Hw7Of0satKCD1t5VcowyEtWompM/DZxntIDlTkd
	 3glMcTIdqY/3uoCtz+W/YkpD4SozfW9e67f/rdXn/ZItXih13DOWGO36djSuSgv2718Y8
	 5TNJRqPBsjGm3TQc4v4LMgP6XgPWS8+9XVFdcOrOB27xV9YP63rTp0Roq1CelhZrjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=temperror header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=xz95gJ5h;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=VdtCR5Tw;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002E606A332
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E002E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=xz95gJ5h;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=VdtCR5Tw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1795019963; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=XOYmTp1Vrhbc19yqIzrUeKxVoL+mHARZX0vwQ/q/7mg=; b=xz95gJ5hZaLvUZIg9ql/EM6WqK
	IoYNjcpoGMGc+gDULNLYqkmAsPCe28b2WbNFdmycaNuYv/1Xi3EGuLNi6e0f4jFCADU25/QuWJHU5
	0X+DRCprlkPDnMAvYEljJoWY39YYhMPZ15SOxZHnIQ5gJ4IFqWxUGIJDrdzO8xPum1ORIjDCDU6nf
	d7qYB5OU1aJI7SRn+g8Jxc/+sXAQ81ptrJxEp78n+Tp9N6RQ0DftKkwogsb1u/SXHRF2Ilo6C7VzN
	yXWH3NisR0UWwYQCqP0OpeGNBf/CX11+zxoP6i78uSWx0soYEtiDeVcf/4rSXkdijcpjBlYaoxP3v
	9qcDxLzQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1795019063; h=from : 
 subject : to : message-id : date; 
 bh=XOYmTp1Vrhbc19yqIzrUeKxVoL+mHARZX0vwQ/q/7mg=; 
 b=VdtCR5TwaBzJQPYJ3lTeDCRgzWFPr3JCRgezmTVQ7p2oH5Edjo8wUzFPiQfqcekqqopTCx
 ip5qaH9PWSJJYYMC/WwHUHa8qmbp8egdRipl2t8Bc3Urd9e+XEgOzPQoU84hajSHx+pPjwHg
 CctKRNSAwDLRbsjGzkux7GxYG+f7BHy79tLNdK4qWpz1Wwkmr48wchmuoG2Y3WGo7AigF1Xm
 7obf38H36tfiyqtJJVbbQTIzG2guP9XuLu13j00TlunKCOR7Wh6qSWdqeqxfddSC9hi7Gcb9
 XWrrRP+jJaWfKzptseqJo4SrlFePZ9IYnxirY81OldXNDgXYjK1KMwZQ==
Received: from [10.143.42.182] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTiRv-ED4xtD-3D; Wed, 18 Nov 2026 16:23:55 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTiRu-FnQW0hPuZuh-iQFe; Wed, 18 Nov 2026 16:23:54 +0000
From: github@bumblecito.com
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
Date: Wed, 18 Nov 2026 16:23:22 +0000
Message-Id: <20261118162323.436219-2-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118162323.436219-1-github@bumblecito.com>
References: <20261118162323.436219-1-github@bumblecito.com>
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
X-Smtpcorp-Track: T_qnivu3rEEh.2KJmxYPHVd9U.vB8PzAB0KJ8
Feedback-ID: 1130875m:1130875aWStQz3:1130875soaZ0uTq5X
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
index 915156743..960ac89cc 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -614,6 +614,9 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK("Lantech", "8330-265D", sfp_quirk_2500basex,
 		  sfp_fixup_ignore_los),
 
+	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
+	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
+
 	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
 
 	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
-- 
2.34.1

