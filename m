Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019066;
	b=mzNlDhDMRwCmTGzcSHwK4YOxzu10pBn0ILj4FYd2YAMIK+NbSUTCRtxpIIuu+SIkJN5S
	 sKh+7twgwJwVMtdIpOAotpB8Ebcnd4X6W8+gDxdFfzokjES3ngKfT+cUjbMmTsbfPL4i/
	 BCL3cHeQIginfnta4kZGyuu0YgGzKfl1J6PIhb9rzQR+09plA4yMBPzSvlZ98y2m1ScQB
	 dRtv31dP/xDGjxO5aZgzdTHKfAusdktlolG8uSLHSK30If0uvD5pgXKc+TMIL/aqFRdhH
	 GGwzACLbaVJAD44uqDO2HIBOFC0iJtmWrc1qwI2Dz55IxS9981lALaSG9mbaEiDf8iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019066;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=GXcmHeUKm0j2WWfte+u3KR76u4Q2nQBU7GMgPEePmOs=;
	b=IyGXA8ffPTkF+dtXDe/3Q5+5sDNNYBnKfJtsXpwIbepahRzQ++g3RjOMCGv+CrMx0QHa
	 1KRHrjKxI9eeUaswfPqYdMOMLBy7lU2X7+gCsp8pATiJV2Uohvh/lLedupZ3H7emr63uz
	 EaamFOQ4g4ea9Qc0u6bmqFUu/HztixFDyPfY4y+gd5TCnenPSmOh+9QhoVPLrPpBp8Sfu
	 mgCv9YkcFZtpfmx//S2X58DLHpKEm1ZVouNi0ScvrQIgfk3rxWdUp3vmUoIh3Uf4pvMlE
	 LD27HJMM0AM+qgwoURsxgPr5ALggn/cVxa3u3aaSzm1sESG+15cIWgf8DqnqZdimlmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=d3bxgi3w;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=YWm++t+k;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E448560A3803
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E448560A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=d3bxgi3w;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=YWm++t+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1795019965; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=GXcmHeUKm0j2WWfte+u3KR76u4Q2nQBU7GMgPEePmOs=; b=d3bxgi3wxM0MHX5k0ZT2maPt+N
	39nq0+oszPIp5kVq8mBQYqLvZ1S5KUXVvNm51FQzR8MQgNtZ7v8AnRRineBpyTRvu3qNnCQZGYONa
	DIo7DKKORgOnZsszKlLwE9Vj55bGQGjDd8BpjJP1hfRUQUSqiZAoIt8u8M0n/zlV/w3v4ed1dSIEu
	SUQ0qnG9znqaW1CLut6U/Yo0YrP8qmlaQtOxIvpFl2GHT32bZG1qi9kq/JD+9hSg2li/tb7/i1zBP
	73YLGRAfECk3VOj87VLwIooJe4IpdILclHw+BfT1uThhPXTyNyVTzQwIG80CLXrU9jfBhXl5W384N
	e8HiUzNw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1795019065; h=from : 
 subject : to : message-id : date; 
 bh=GXcmHeUKm0j2WWfte+u3KR76u4Q2nQBU7GMgPEePmOs=; 
 b=YWm++t+k52y9H9S1kXtctOpbn9X/oTwZ7E+Xl+vMNX21qmAFU3368ThbSpkIr/rBeBWaJI
 pWb76fqmyO4CPv5K3KS0G0ppwgEv+p5nQwP9gIdTv4dMBDjLvh9fEyXJLmGmdR5MQ17XcUqB
 3EiPrCXueHGHN7Z9CAiYwmGGQ6dcX7p75x8Ebz7yJa9K5ex/FW1CVNffQpUB5TzY9R3O70wE
 u39j2An+N1FJU9ctOhF6b1R4fxDFtzVa8/ZmhRwofLYoJNy4shGPO+76uHlFQHDZWAF4CDuV
 kwCNX1cAlG769iv3xpzQktjj5BDk4F5EYvT1mqmuQ1RaMJP/gMy2XliQ==
Received: from [10.143.42.182] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTiRu-ED4xq0-4q; Wed, 18 Nov 2026 16:23:54 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTiRt-FnQW0hPuZuh-idGh; Wed, 18 Nov 2026 16:23:53 +0000
From: github@bumblecito.com
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/2] net: sfp: add ODI quirk and sort SFP quirk
 entries
Date: Wed, 18 Nov 2026 16:23:21 +0000
Message-Id: <20261118162323.436219-1-github@bumblecito.com>
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
X-Smtpcorp-Track: 9becAdUsZNXw.ISHbrom-Wl6C.RIfK1QcnIHY
Feedback-ID: 1130875m:1130875aWStQz3:1130875sFcvEtkfJ4
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

This series adds 2500Base-X support for the ODI DFP-34X-2C3 XPON
SFP module and performs a cleanup of the SFP quirk table.

The first patch adds the ODI module quirk. The module was tested on
a Horaco ZX-SWTGW2C8F switch, establishing a 2500 Mb/s link with
speed and duplex forced and autonegotiation disabled.

The second patch is an independent table-ordering cleanup, sorting
the OEM and Turris entries without changing existing quirk behavior.

Thanks to Andrew Lunn for the suggestion to include the additional
ordering cleanup.

Israel Cueto (2):
  net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
  net: sfp: sort OEM and Turris SFP quirks

 drivers/net/phy/sfp.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
2.34.1

