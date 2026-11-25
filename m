Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597439;
	b=4ZCHCCO+CRdmRq7RUOjVZGVprXG7cOCet/vD5MpI7nry4oZdM7SOeRo8TG6FSw6dGXhy
	 Ekj43kak4oug2Fo+Uii6M4C6l4U4GbIdUyAIz9TeE9JgX8j7aWkM5IjTRJS2WPS57JnDe
	 OGaaB0BKoAbrG5Bz6annoNWAb8AIKhWMpATapHnusAWjIT/+Rq1tm2Ftz9ArLAK6O+GaL
	 kKtqBqlOoHbnUk7eQtP5KotDS8+P0WZZLwuvlpUtF/W8VksSOo4HkN87UzgrA0sVrhXTP
	 sEj7rsCuAZEbhL5NpZwNwKpXyCNAd495B8HOktDaDBYNqSOnwENVkNAARbK67kFyJAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597439;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=FtvVETUdbfn2lBgF0scix7hGBwFEQj9TpucrkM377Gk=;
	b=I9pf7v7rFxUq1jQaLlo7XNnotdixMxE2VeN1b20pdBDc3bDxhr8ubKlGycqbYxBCkshN
	 bNmWZkVWe3OWSGVIn9INfUJ7yx6VsfHGsoMVt8IcvIZCWwJrjJ9dLdgfv+8IJ0o2F5XRv
	 QVn4ZlDBkdmefrwA9TeQbSCeOnGS2vxmXPxELE3c6q7OAKhTw/rUbo8KOOBrWXzGZGEUF
	 0ltU2wfvi1vHDvEtJsnN2yMGeIpBoqOLliS0Sdqobg/pfO6NHs4rkLd7u+gSrQcbtHtJ0
	 c3AGhQRazPs1LB0pj6cxZs4L3dIG72/rqO75SK1WkX+S3fkya2p3hHLpumqGb/v+fBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b="O3ayhwz/";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369D606A327;
	Wed, 25 Nov 2026 09:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1369D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=O3ayhwz/
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP92IvzC3330654, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1795597339;
	bh=FtvVETUdbfn2lBgF0scix7hGBwFEQj9TpucrkM377Gk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=O3ayhwz/FXa2NCNLwlBM0PqRgu6zfQHib85uVYpq7PRnYon8gKMH+yP1FTcwlCyvo
	 r04WWae9BioF4UgPTIAzWfbquI5O4aSmR3EhQESBuQM6PdgKaf8qaFxq0eoh3EraA0
	 XM+t4JhllmyzADCJvHxdjBX2ORh4CyvhsjqlcZdKOlEGewnmOwnRqC78XT1bUfR1ws
	 Aas+IXiF+j9kVdSdAlB1oUCn8sajrYUp0b6rP9girvMhRYfSB69Kr8aQZ+QGRQBgAV
	 3IaokbgpDuSYyQat6mzr+EAmFN3gsXK8j3WyaRMd/VChD5bHpQQMWS+Qa5Tk6bsLLM
	 c3wne/dV9f+1Q==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP92IvzC3330654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 17:02:18 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 17:02:18 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Wed, 25 Nov 2026 17:02:18 +0800
From: javen <javen_xu@realsil.com.cn>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nb@tipi-net.de>, <maxime.chevallier@bootlin.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel@makrotopia.org>, <vladimir.oltean@nxp.com>, Javen Xu
	<javen_xu@realsil.com.cn>
Subject: [PATCH net-next v4 1/3] r8169: hold MDIO bus lock while loading firmware
Date: Wed, 25 Nov 2026 17:02:14 +0800
Message-ID: <20261125090217.1198-2-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261125090217.1198-1-javen_xu@realsil.com.cn>
References: <20261125090217.1198-1-javen_xu@realsil.com.cn>
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
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

rtl_fw_write_firmware() accesses PHY registers directly, bypassing
phylib. Hold MDIO bus lock meanwhile, so other phylib users cannot
interleave their accesses with the firmware sequence.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
Changes in v3:
 - New patch

Changes in v4:
 - Skip the bus lock on PHY-less RTL8116af
 - Restore tp->ocp_base before releasing the bus lock
---
 drivers/net/ethernet/realtek/r8169_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index f151ab681393..b289ff6c3064 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -2686,9 +2686,14 @@ void r8169_apply_firmware(struct rtl8169_private *tp)
 
 	/* TODO: release firmware if rtl_fw_write_firmware signals failure. */
 	if (tp->rtl_fw) {
+		/* Keep phylib users (hwmon, PTP) off the bus meanwhile. */
+		if (tp->phydev)
+			phy_lock_mdio_bus(tp->phydev);
 		rtl_fw_write_firmware(tp, tp->rtl_fw);
 		/* At least one firmware doesn't reset tp->ocp_base. */
 		tp->ocp_base = OCP_STD_PHY_BASE;
+		if (tp->phydev)
+			phy_unlock_mdio_bus(tp->phydev);
 
 		/* PHY soft reset may still be in progress */
 		if (tp->phydev)
-- 
2.43.0

