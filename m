Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973520;
	b=xTsVKRzHcrzn7uWq0NgIq1M8G8YJOUIFItvnIIrIZ/woNs/NUDVD4sfFVTOmtkMyWYAw
	 SX2Xb10Tv1K7ZwKIMg8MT7qYhUybD6TCEkddgZM20wesgXbkZ9mjOhBGZLXyjcA5roKCd
	 kNECKQNArMN4sSVEeYK/QadN4GJFHirR/ahYSDCfsUOl2MJeAIkYu5nZLvG89ib9yXHhf
	 2P6um+P4ieaTDK1Jjy929EGe66WcojYhNj9qTXYkdIRemAcVppq98PjpWAU6FbzOzlp/v
	 dTgkjU+4/4Tu8+ZzzCRAzR1oFOmf/p5Vd0f9YMNHgy8ehVDsG6y+61+BvyQj8ir9gvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973520;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=QD99YV81P86vVsdVhSCsb3s1uatJTfxI+KZieoslfgw=;
	b=m3fhy9m9ZlyjQAb3jy0ozVtPRhByzThniHIdXRwnB2VaFXW4lSWsO9zucwiazC2PSDGE
	 Pw/b9P2A7dmOKmH5my5H/XOLdL7KH9uzGB/zY246nQj0yadCS9BNFXZYuWpKMffwLYuxs
	 wHVa8UuA1sKBOaulunCl5ytYOCC4CAilZVziFL6/hACz68ooWc5WJAVWYui0qAHpyoCNJ
	 wTx7EdEk/ppuIbB6GHuTxpvTv0YR+Ud09MjLXcqnbNM+MwGZKTMWuNU1cQALAFUpCGiEd
	 jJmfWim3PmyHs6bOKwLtafltFd8AxKyZLj4L0JH9vFZqDx9GnVoRm5j7IgHC4BW5FrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=pass header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b="khhaC0/x";
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=jAfFDYwa;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B003606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 03:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B003606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=khhaC0/x;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=jAfFDYwa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1794974419; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=QD99YV81P86vVsdVhSCsb3s1uatJTfxI+KZieoslfgw=; b=khhaC0/xVOTvo53pw7L8toV+fM
	/WODlgcad9jbgfe422fnkS9oCgZxPFKmioF5/2dSRG9qpDfUZIhbGORodWI8RfrOKoJZ7GoqR+y2O
	MvzV3jlqd6o7blxTJIIHy1kMGurlBDm1Nsgt9mjjpxaeVen7TE7M6QjVJuRdUjm58ho0dYTs0+Qcp
	A96gvvy6wbMO2eS0H8qLA2ZVAPuA8UE2v8H3tGU3lnyf3Wc1452ejmiIV0NpDnq1oac0/Zm2XRGmP
	RT1vvQuafazxYZW8XLuHC4ijjzBaglvh8J6OIsM9d+B3pQ+t/CbNvuPBgf4R/fipzgJV+GdAva3Q3
	DGh/YoDw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1794973519; h=from : 
 subject : to : message-id : date; 
 bh=QD99YV81P86vVsdVhSCsb3s1uatJTfxI+KZieoslfgw=; 
 b=jAfFDYwa0+0khuUy1sHLhfHrRFsqtb+QXP6d23CDCdmVjcN7d3mAoGKCPzYq2UQxnm/1r5
 MJpU7uoGyST/OuvxMHR9UHywxNQOA/76pmB1QStBfPLAYB/euhyR9ZDYOsFuYKq7v9Wc/Z42
 LLkooNJvq/vR7LlG+A/D24SlGF7FD4E8H3oFUBgWZQzxtzUxwZW603XqDrkMa8uOdyz3XvLI
 XfS93h62wX6SrolK1/gwtkOCz+t3jUKowZJ8ObTgbe8EhMwRaW81JUkbR3hfVF+rSwya930y
 vYQDY1sCamgtr1KPYgfKgFirysx7Dk2naujKY13bsJQIpZKzcniEUEgA==
Received: from [10.97.107.137] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTWbm-ED51UL-HR; Wed, 18 Nov 2026 03:45:18 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTWbl-AIkwcC8uCsz-oD2F; Wed, 18 Nov 2026 03:45:18 +0000
From: github@bumblecito.com
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Israel Cueto <github@bumblecito.com>
Subject: [PATCH net-next v2] net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
Date: Wed, 18 Nov 2026 03:45:10 +0000
Message-Id: <20261118034510.434732-1-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025602.171615-1-github@bumblecito.com>
References: <20261118025602.171615-1-github@bumblecito.com>
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
X-Smtpcorp-Track: GUUYUI97opZp.WjndrsBoXbwV.VKRfPgIQLWu
Feedback-ID: 1130875m:1130875aWStQz3:1130875sEYp0nQxb6
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
Changes in v2:
  - Move the ODI quirk to its alphabetical position.

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

