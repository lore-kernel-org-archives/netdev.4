Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634736;
	b=RyljMavKGJ9zwNRnXXOIFBt6L8jrcFvceB2H7Rhn2z7IB46NCt0YVsn7ixG6g0LJ793/
	 JpjvtI6oYFOHifR0lx4yhUpkrg/u6QsR0h+C9zLLAzxmb0DB6FmH3965lHChaYBlyXec2
	 4ve132Z1EjU9/H5/OzrQdgxhNm0+VldP+EWLwrt4gQkpkle2PSiK02HsWPshu+sNUXIRH
	 6BYhr1BxqcTatSuMQA4EWQZsg+ezhma/HDRbJ+GdYYnWkM+7RFW/ZzhrVdJhdi6Z9FdAS
	 HmzLiicM6gIyJz7gxBQvT7jXraykQwbblQ7FoI2ssM+/5W0paNi3LzWJNBSwf8rg9zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
	b=MhZKQ94gqJZV321TjzlnqE4sxctbLHfOyH8Ye/W9A4N/FDXZ4Jvua2RUJOI2ZVKeFIYk
	 DlDXBrMxNNOdVMgWiX73Kfrb50OB4aVKWvy4Z9tWHZRh9ICMl3+YjyX64mD/AsFIE9HfW
	 dXd8MBcKGpUYU6wrgnHqA/Orgi+Nld3oARjPFzeM2ziwXMgKzPv5fHnQ800oBxvGA4dSS
	 bzZYQ4xSHoq+SO8USozcv6CbP5chQlZkijOxq5j8HMINdsEznqcZbH17lg2WPGiD5cSCx
	 85q5kPUj7xaJBhEKcPNqJBCLxFpZvZrKpgQoNd+VCSl9GmG52VqyYWtj2/PJ7JO1mRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i38nKeuC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C4606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77C4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Leh8WXRt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i38nKeuC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAwOc3593868
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPR
	rRtBfFBA=; b=Leh8WXRt5l7hIe7RtKjlc5O4uK+nTw3iOGPprVdaxO9Wigx3D/j
	yseENXSby6OKQIaWjOibcQI4z6ZjpdRZ7tFGzg33to60FU6kTUT8z3afSAgYeWjI
	5FhrOLjTDxITtVOUIsKra7Msfm52YhkkD6Xt/nvqJg1mtroD4J3sNMWJ2jUmbXDJ
	mHsuaEIdJpr5aXCQCWV8Y2rv/qNGTAHeAokCP189kMSKNkmPlY3yWQaMVPzzcqOV
	SDqPwLCepzTVBQujZPAe8worS+Q6CW7b2d5FR3WJceX+47miYTFXBzwYvCuCKdiv
	ePFT52KlwU9/XN39stnSQVwMP2YfpgzR02Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6c5f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:25:34 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso6519690b6e.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795634734; x=1796239534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=i38nKeuCZvZrS9PstHZLOonhmz9vURpO0ke/tlEc6M0mjXwYns0r/eV4+Ihlf67xjb
         z4QtwlYLBk6IRg57erg/PErNC9b1/wUQ0N75T/5ARJF9ENiINwZBLlC3qa7q0dWlq23f
         oqiQZedevnvZrErfmj92whzucU2DBb+nh9tXWxnZSOfChp7egrHyRytAfie+WoydcFsk
         LhkKVK9St39xWUbfpE54ljHFfnQaHpOhkvd+xe59HPOgr74Txc6zNFY16BlwSR0Nubx3
         GXHDHk+tw/jSMR6FiOdaMwRr6T+wm8KGsyTdCReTZGlYzlI5dX6MXh0bsqV1fVwVZbSO
         riBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634734; x=1796239534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY7KokTVNQdRG2xnhQVkzSDE4zg2oGNcCPRrRtBfFBA=;
        b=K/baCxWimrzxK92numRJ9N79KR/eGwuUK6seMPFxyz+BvRObEX84tvRpEpcm9YZAfz
         QquSLjM/UGWvJbzmc8XDx6/rLshIKcieWVcn9Wq9scfXGAm6Ub/rKqo/lKXQ1cmpwzJ5
         CJsWUF5S8IQoIYEuYrKYOWgnjyGuonptdxl/0IxKmle62n13203bx1S3wAsslkTEyYFZ
         5+WmWlIGofUlWbaeDUuZHERPlq1sExCYA1opFFa/00gRDPOP8f2lNsR6+6zHYyzkHaJ+
         4xrp2fbcOcRNfYx05YmCEocdBHIMpm0npg0po8uFh5zFH2pe6L3z1laS5+ZVlBvb4KxK
         MOWQ==
X-Gm-Message-State: APuU4Z/ZsHNLgejvypQmJ00evIMnEsTDHx8SLm7XiRLyqvKtroxY9Bee
	sfW6A121Ilv+HvU6eeRkGhsgEwG8CCpy9GxGd/CMRuBy2Iduq6xogyS8FxCG83ucZkOKWMixxPP
	M75wAsF11t05ZIGPm/xHwuChJMvKf3a69ARWY9r4nNML8Nc4u1csMCk173QU=
X-Gm-Gg: AZFdTZe8zIgpE5UhVMDEPe8CxgSyDEP05grWT0VTEDLytoqJtGPadz3uwYZm8p0vKs9
	DHI5fffv57Va3gz2a1HjCwAQS+unQGa532L0Gmd9bkh+ePfYvChugSetyvE17xRpr7vru/wsAdJ
	RV5u7g18PWY22RR1+UXtZIruczrieRj6mRa0MHnLx8zcbzY20nRpmcOHmYbSCQfK0li8sKN3PG8
	gd6+G7NlV+4ZjwguvRF0+VWozXmQZd1K4+gA3ZnWLoe+V3730LK2hwWkKv3roNRCCRTXDVxkM7A
	++z3SEpm3PcdIFyIzkaabLwN/Je6MXERBc2olNrGHdFAYIwxAx53XWDkrUcbhzfyvGmwUk3v4XU
	6u6RoQEp0nOYPvFf3MCSYLMH2gHbG2HomybBkgLp8/3Vs2vIMXsBcpP7+EDroyaFzy4dP8/luB5
	0IJqsVRMaQ6lBD/HnwDe/bFouONpRqBcsocQBf
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422922b6e.68.1795634734043;
        Wed, 25 Nov 2026 11:25:34 -0800 (PST)
X-Received: by 2002:a05:6808:23c3:b0:56a:7702:b341 with SMTP id 5614622812f47-57a0c4b9064mr20422896b6e.68.1795634733588;
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm18125768fac.16.2026.11.25.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:25:33 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        Jose.Abreu@synopsys.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
        hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net] net: stmmac: xgmac: fix RX split header length on multi-descriptor frames
Date: Wed, 25 Nov 2026 11:25:31 -0800
Message-Id: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: A7j1H7DBVofz15o7wPCYLgNp7CftYq31
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX0E2dbeMTlI5x
 3Fdjr/jBLLQJmeutjb5GPsJMoT8wzVbg16Y2wQK+WZ+CjcmO/PpzT+oBB5PNS4sazAmDEegG7lL
 EPzoPmp2lTKZc3PdDhBx+dGkuKJt4hU=
X-Proofpoint-GUID: A7j1H7DBVofz15o7wPCYLgNp7CftYq31
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b07362e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ojtf-fZehEoJ8Fw7nBAA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NyBTYWx0ZWRfX71rudWAWmDA6
 KaXTwGA1BuxsU3KrSsjN3wl0CXzFOQODBjlgb7hQs4MuojnHXDhGGBTrHOXd1sKKRyWZJUPdns6
 RRGvVOR8rH6DP4OY5unjRdHOvN6saxhSwgKszIhpxmbl88Z6UqzLsXOydNz8KjokRLwTt8llCKc
 +rTTuF3X8V1Fig3CuakPo90acKQ5Fy7OI2kCKXim95bavpWlb0GjMK4GiWf4V2KImcpJUsssrwI
 pSEoEg8Pfkmu0rMB+upBDUD9wgn94V3ixvgOVbcdxK7hYrrt7uoYOP66vZf7OdjK4atV14TmR5P
 yhFvnr6ekKj82NlagDihnkKVK1JnZOx3yjCkjSw9xxsxTr8z9IC/3IzlXwBtmgzceJVddHCgAWN
 +7Qytxaz4hI/5YFoH8I4teFzlPtiFktS7AHuqE0H6DIZ6SHvcNbgfzxD5U02ELMDU+AtnMJZS+O
 IbRjQy0NXptk3IQmDNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250077

dwxgmac2_get_rx_header_len() only reads the split header length (HL)
from RDES2 when RDES3.L34T is non-zero. L34T, like all RDES3 status
fields other than bits [31:28], is only valid on the last descriptor
(LD set). HL, on the other hand, is only valid on the first descriptor
(FD set), and the databook's "Header Length Availability in RDES2"
table states that HL is available in RDES2[9:0] when FD=1 and LD=0,
without any dependency on L34T.

A frame spans multiple descriptors when it is larger than the RX buffer
size. This can happen at any MTU, as XGMAC_CORE_INIT_RX sets GPSLCE and
WD with GPSL = XGMAC_JUMBO_LEN (16368), so the MAC accepts frames up to
16368 bytes while dma_buf_sz is only 1536 at an MTU of 1500.

For such a frame, the first descriptor has FD set and LD clear, and
L34T is not valid there. When it reads as zero, hlen stays 0 and
stmmac_rx_buf1_len() falls through to the rx_not_ls path, which counts
buffer 1 as a full dma_buf_sz although it only holds the split header.
The frame length accounting is then wrong and the skb is built with
the wrong data.

Read HL whenever the first descriptor is not also the last one, and
keep the L34T check for single-descriptor frames. Also return early
when FD is not set, as HL is not defined there. The caller already
ignores the header length for non-first descriptors, so this part
does not change the current behaviour.

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
This fix was split out of the net-next L2 split header series after
review of v5, where the multi-descriptor case was pointed out to be
reachable with the current GPSL setting and to need a separate fix.
The net-next patch will be reposted on top of this once it is in
net-next.

v5 of the net-next patch:
https://lore.kernel.org/netdev/20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com/
Review comment:
https://lore.kernel.org/netdev/179548403438.3135.1804854034587814346@kernel.org/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..0cdc0bc695c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -437,6 +437,7 @@
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..ed38aa358642 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,7 +292,14 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
+
+	/* L34T is only valid on the last descriptor */
+	if (!(rdes3 & XGMAC_RDES3_LD) || (rdes3 & XGMAC_RDES3_L34T))
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
 }
 
-- 
2.34.1

