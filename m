Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.148.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005106;
	b=tK3EBU1tyicDQBC9gEm+sg14dBlnPxMJ44dTIhvjhsqKQmq2yhIUGYkDLVrNBVwA02Q7
	 8qSR56DRt4RhsWfKksPpSL00oH4gP+9egnfkjMPe6Tzw0NwBOcxiWDzSQuI/3gnV+0tbO
	 TAMdqW7XY0aIN/+5PiNAHueBtKNHKapk6HFQd+tM5KugGcnPAKyEZBC3VVp6y5Gu5ovq7
	 nhxN1xMeq1W/cbWiIISUvcpAOVHkC3w22uXJ7UXzBkthoxEmuGZnIVTmPqJv3qlAEp80D
	 UR8IUXsSIvQHAyHPxCq/MJaZN3a7/P3NoJY1OnzBv+KIbzJ5ksIgkpQCtvYWNwKC9og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=gDOdA2uOEnQHph1pmU0scyCFa+99d4pROs2JpoXQfFc=;
	b=hwgYvz9pnwubDXxe2IiMKWGoxEVIrtPLbX1F2EISGCZDkg3CVR88x/0CpzlKvHeVssy9
	 sEkRfAH9gRuP8lc6mamCA+4aG6S6o35FqcBqf3V/eWB03SgEIAsr+qiHl7VzxT5gGO3jn
	 o9aIzcR2xhxrRSbGCk7tQtqPfwIeCbgBWmRNM6cWAe6sMYGMnRW1HFtb+FxJzU9oOxJRO
	 AKBGDRx1F+0hGiTMuvQ5myu7tLNYNmiCh2HCRgwjgrDi+nhP/jXm4B6l1F4tcJjSNa6BC
	 OX1CU05sXfclcTKYb74xC7iXQ6ACplZyBEqTUtsHCZgo9+aLVFCXLnzvQilm6gIhUIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=AeOn7wY5;
	arc=none smtp.remote-ip=67.231.148.174
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3C606A320;
	Wed, 18 Nov 2026 12:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=AeOn7wY5
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBJODY2192428;
	Wed, 18 Nov 2026 04:31:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=gDOdA2uOEnQHph1pmU0scyC
	Fa+99d4pROs2JpoXQfFc=; b=AeOn7wY5yj9wUJAE5rWInqZHIN/MnNU9LLJkPs5
	8EJDJPTBL0FrjkvMMNnF3mWrmwpm7l92VrfqdnjlQQGSW8J5FWrXEyHSsLCM/vUQ
	83BoNFKqyYBIFo+emfpn6J3waiC6Hg5rvSEiJkcut39PhZi442f6HuiLrtI24KKF
	IjYRog3hnIX35sb/ZsB0hDriEfAxPucVNBZSZ4MQ3gwQYil5Lf0pj/lQv2lGrMet
	kUmv2Rmnn76jih5LEnGCB+O6rt5F3uicKSCZhSxNKgckWXoTf5SxBHhI+fOKQ2ix
	o9jkbNzf75Bl/OVuqi0FwWzo6LheZL/Gf37oUwPqNwHK+hw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4j0ytutfum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 04:31:44 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 18 Nov 2026 04:31:32 -0800
Received: from dc5lp-vrelay04.marvell.com (10.69.176.80) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Wed, 18 Nov 2026 04:31:32 -0800
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by dc5lp-vrelay04.marvell.com (Postfix) with ESMTP id 8E1BC48DF2;
	Wed, 18 Nov 2026 04:31:42 -0800 (PST)
From: Elad Nachman <enachman@marvell.com>
To: <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <enachman@marvell.com>
Subject: [PATCH] MAINTAINERS: update prestera switchdev e-mail address
Date: Wed, 18 Nov 2026 14:31:26 +0200
Message-ID: <20261118123126.326686-1-enachman@marvell.com>
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
X-Proofpoint-ORIG-GUID: Gd5gHn0nGjc7rX9bz9_Glix4uNB_Uzr1
X-Proofpoint-GUID: Gd5gHn0nGjc7rX9bz9_Glix4uNB_Uzr1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OSBTYWx0ZWRfX/2Jaww74iNrD
 0SFKdi0E5c/olXwNBS/I5lAIlaI9XrvQGoU2WrgohYUhRkN+zSeHVlaMFDrQbN/ag5paEA9xrVr
 hXZmlzy5geQJ71YYxJXy2FBjq9F1qUs=
X-Authority-Analysis: v=2.4 cv=MIb1C8Zl c=1 sm=1 tr=0 ts=6afd9ab0 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=NEAV23lmAAAA:8 a=M5GUcnROAAAA:8 a=pGLkceISAAAA:8
 a=6navKHnpQrpsLR3-kjAA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OSBTYWx0ZWRfX6I3kjq+hhOh4
 gAAqPfUboXg4k7DSlBphIJi3W/u3bJQ8+CJCDucxp73JGB/W1yDl1RYpi0up/+AmkGxPnXqk2I0
 39qgx1e8XdgGmM4Sp+8+asUePjsGPrUlyPBr9VnJ7DtRoLC6tLxOz+9rinMWWhyDTq7J3sOP1Zq
 54x0OXOFmmnqev2S/MB4qSMVLFXcsmazQEBNEsf1JBsf1DV9RTRpTfcvpxAfTir+7GyezFLtGx1
 xTfL9lgPY3ZhxQIgjQNZVELJlYVSFASAhE2TjHq6TNTmR5/SNFhD7/tL7Cw+etFYb1lEfyKqTN6
 7y8eTz3cpYFdgFziHZ3OUW4Fp3NE+8zWcmbNMERWLMcKJbu5E2jzQ04YVnLdj3rEAxMbaA055Ic
 h8yUPMIfujOZaXNk5beAeoyAORhs12UIIqqXBnv9t9Lk2mvPnyLEVSE8AEw5/iwHN/qCcrINtCR
 QTgQba37Xw5U6B3ueGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01

Update the Prestera SwitchDev subsystem maintainer e-mail
for Elad Nachman.

Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 986e23fcb020..765d7d3bb582 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16352,7 +16352,7 @@ S:	Supported
 F:	drivers/perf/marvell_pem_pmu.c
 
 MARVELL PRESTERA ETHERNET SWITCH DRIVER
-M:	Elad Nachman <enachman@marvell.com>
+M:	Elad Nachman <eladv6@gmail.com>
 S:	Supported
 W:	https://github.com/Marvell-switching/switchdev-prestera
 F:	drivers/net/ethernet/marvell/prestera/
-- 
2.25.1

