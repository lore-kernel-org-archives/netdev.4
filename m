Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.148.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975992;
	b=AWStuBczr8iOrjJY/4FSJI7QVEjMsJq85s6KlF7vw4sLGa6abcDXRQ9luhUQo+of+eI0
	 d3DoYGBfRQ8ALMv/BgmYsxmq/Oevna5lqJdoRhOZ9MeO4j0lhDLWarMzOiuIgOCNvntxu
	 g5Jvt+RA96L+RmE2eNI9Iethp56dvrmZTdmTqAd1gwXQ9WOjuaZP4zgp44iYGSTRLBeQW
	 sjb8Qu9YWwoIy8Yzox10XK1tZmKOArew084zqbRsaEXhiDK7WwjTt78/GOowoMepiaVe6
	 5BTT1Y1Y3kEBo9WBr4a2G/Mo0UL/VWXWsW7XomMPTlAEYXxSMp0evsprTDuI428IavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=0WqMk/9EjOE02syakNUAMPGrm2R4TgLrNy35QNB61ww=;
	b=mnizf9r36XU1feVYIV6z/C3SyGNCB6tMjc7njeGpoq4UQIa48PmLWVep7GW47fOHhMAD
	 GBjiRiwQ2YSY9/5WopHJEo53256gnTEUOjcF63AEgOh/pp1yfTU4/ij966dEPl/Q1P7pp
	 bVCuUg6sJwb95rSH3onlNcXITSCX4ery5HfMMfxhQEOT3K9M228EsviiM8UyQshCKHWr+
	 5Pfau84jieYP6m9JC68O3wbnemd9Thp00TXmfYrXNzacvFkQfLi2vtX6tAwhMZuJDzFJ6
	 R2j/Kv2JSoTiqLAhDCBy09F2AWJLxdVEyK7OtU9umWcXgn8Qo1DChDXuLx8GZeivXCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=RgXZClWx;
	arc=none smtp.remote-ip=67.231.148.174
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F9606A31C;
	Wed, 18 Nov 2026 04:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A95F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=RgXZClWx
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2SRNr1183034;
	Tue, 17 Nov 2026 20:26:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=0WqMk/9EjOE02syakNUAMPG
	rm2R4TgLrNy35QNB61ww=; b=RgXZClWx5n4sDHOf6/lJpTaGDP/7MgjOQWQlZJ/
	gGxuE0RfE54jwNQcmk6WFUHaYKs4YdiKzV7SgSClByXUItSoPkElj+xGXiL1cKOD
	RsL3iVfmJ/fdm9uqP/Cbcusl+71dT+rlQ92JJYLCh+7Z1KCJ049cfpSG2ByHTJLH
	8gN3aNYhR2mIWbAICCC/hkyfpRY9m6wNNI9QzgHA0hJkooBwSru/EVEDWLajaok5
	PVTj6XfW/nOMs76xANUnGmt3gR6cuwxAmx2BCir7ejNF3BvvT+bXhOezg7VEQ2S/
	8GLyEte6U+Jkdet8ihQE2i+bvI+6bL+jg4EWqx8kpLkmgdQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4j0ytus0s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 20:26:18 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 17 Nov 2026 20:26:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Nov 2026 20:26:06 -0800
Received: from localhost.localdomain (unknown [10.110.24.192])
	by maili.marvell.com (Postfix) with ESMTP id B9DE83F7071;
	Tue, 17 Nov 2026 20:26:17 -0800 (PST)
From: Vadluri Mukunda <vmukunda@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Sunil Goutham <sgoutham@marvell.com>,
        Ratheesh Kannoth
	<rkannoth@marvell.com>,
        Geetha sowjanya <gakula@marvell.com>,
        "Subbaraya
 Sundeep" <sbhatta@marvell.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S
 . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Satha Rao
	<skoteshwar@marvell.com>,
        Vadluri Mukunda <vmukunda@marvell.com>
Subject: [PATCH net v2] octeontx2-af: widen TX scheduler queue index to 11 bits
Date: Wed, 18 Nov 2026 04:26:14 +0000
Message-ID: <20261118042614.878448-1-vmukunda@marvell.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: s6SJakT3sxQzQghWifN-PwscKYqn09D0
X-Proofpoint-GUID: s6SJakT3sxQzQghWifN-PwscKYqn09D0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXyNuSxU3uesdC
 ZKQ7j9RgfEuBx/ODaGN3CHTVu6LGpoR26XzrjMoc/vNo4Wvz8LORCuMXvpeZ7FF15Baill0/vG6
 sVvXTuNVytoxXX3tIldr4Zx4GhM1EYk=
X-Authority-Analysis: v=2.4 cv=MIb1C8Zl c=1 sm=1 tr=0 ts=6afd28ea cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8
 a=EuGbU4x2D8lrRcO57msA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXzisoyrD0DDvt
 Q4+pmoIXdh92dXFN1A/WjQQ/xDbILcMFZRvwMnHl7GxE5F+buj7D+lfe0z7w96d23ekweA9KD6v
 U9MCYmjrqsm/1/hv8gJC9NlRwqJ5OrfZwUybyI0KEKE/k02BaW7L1tJmjeliGkm0qXjXDtObtqG
 XBnfI0DAyD4dX0ZcieZX3VMe5UwdGh93Qf0bm23fia/OUMT37hAaHhdvq2WgJ6AmvAPcPeOXutg
 5+bpTyOOF4LqBTFrYrbTEDoPb0RC/TQyKAuwI0XXdJYwywaCRQXbCyCdgNtVMipPeH2y24vMk9E
 R59aYxkwtC7rRANIZvoluxWmAUJLf0Qu0BLsEYVzQYtCgD/ObfhdwsdM3hrN9hUKF06j9mUkoES
 jK2UdNCQL+8+LAtHtJbWOGD9Ae6/N4DC5GhGCIcbXQkduEK4ZHEk4FR1ELLhVIaueBQCffmS4+F
 vRLueptkAtqVpHnaNLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01

From: Satha Rao <skoteshwar@marvell.com>

The scheduler queue number packed above the 16-bit register offset
was masked to 10 bits ([25:16]). Queue indices of 1024 and above
were truncated, so configuration and readback used the wrong TX
scheduler queue. The queue number is 11 bits ([26:16]).

The SMQ field of the CN20K SQ context is 11 bits wide, so queue
indices of 1024 and above first became reachable with the CN20K NIX
contexts.

Widen TXSCHQ_IDX_MASK to 11 bits and NIX_TX_SCHQ_MASK through bit 26.

Compile tested only; not tested on real hardware.

Fixes: b5dcdde074d5 ("octeontx2-af: Add cn20k NIX block contexts")
Signed-off-by: Satha Rao <skoteshwar@marvell.com>
Signed-off-by: Vadluri Mukunda <vmukunda@marvell.com>
---
v2:
  - Fixes tag now points to an upstream commit
  - Use full name in Signed-off-by
  - Add test status to the commit message
v1: https://lore.kernel.org/netdev/20261026062316.754904-1-vmukunda@marvell.com/

 drivers/net/ethernet/marvell/octeontx2/af/mbox.h    | 2 +-
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mbox.h b/drivers/net/ethernet/marvell/octeontx2/af/mbox.h
index cece197d1074..1b62f9d7f00a 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mbox.h
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mbox.h
@@ -1164,7 +1164,7 @@ struct nix_txschq_config {
 	u8 lvl;	/* SMQ/MDQ/TL4/TL3/TL2/TL1 */
 	u8 read;
 #define TXSCHQ_IDX_SHIFT	16
-#define TXSCHQ_IDX_MASK		(BIT_ULL(10) - 1)
+#define TXSCHQ_IDX_MASK		(BIT_ULL(11) - 1)
 #define TXSCHQ_IDX(reg, shift)	(((reg) >> (shift)) & TXSCHQ_IDX_MASK)
 	u8 num_regs;
 #define MAX_REGS_PER_MBOX_MSG	20
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 153eb57bad06..68cf730a8372 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -2850,9 +2850,9 @@ static void nix_tl1_default_cfg(struct rvu *rvu, struct nix_hw *nix_hw,
 }
 
 /* Register offset - [15:0]
- * Scheduler Queue number - [25:16]
+ * Scheduler Queue number - [26:16]
  */
-#define NIX_TX_SCHQ_MASK	GENMASK_ULL(25, 0)
+#define NIX_TX_SCHQ_MASK	GENMASK_ULL(26, 0)
 
 static int nix_txschq_cfg_read(struct rvu *rvu, struct nix_hw *nix_hw,
 			       int blkaddr, struct nix_txschq_config *req,
-- 
2.25.1

