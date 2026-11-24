Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478662;
	b=JizNRhRUF03z73dkOlv+iZ7S6xpBdJyoddjwY9ifFU74TUH1sy1cV2V2JYT1cYSCGt7F
	 gPdSJkQmaV83HtP4R6IVtKCFulpJXgqjUahR4CwW8H5rtYeXj8QbeVQMgacMGkr+FbxTZ
	 znp0j98/jCQq9ij87/NMVfFXQRJ2lpDLjjR1YdNI+uYh3tHn2n98XKX/EQj3xwPg5wgon
	 aSjUJU/z3ZAmmr+XLEsyqUH5cFHKOfLiux/kra7TvuGvELijk70owm56+07J6fhH3cfoc
	 J9cknBCVFfy+7g/Oy7U2f0+x41I9S8bO2trzp/+E5Z+skW0lPO0Nmj7jKKqHh7DHjaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
	b=AGZfufyc3BulifSF6sVzU+l3Ty4c/XItoTwajC6o/e4J4CkRPC1f0fuar3Nae9dyL9vk
	 3rgtKtnF39i/4BnKwC+DjdlS4mVinxMqhm/dN/o6ivrQCj2FlfBUelw6wXyJ6cvwgcaAm
	 GPkn9NUBB9xVx06A/KKG1oFwdFKpBASFBb+IYfJyd5Qsx90J7aId3JRHjyTm0PcpXc1RV
	 kHFRYkCAsM2hn9VBqMS+V3VSQvT3ugDrv6cw1t0mCJLI5yCCrUdnSI9QqJt7j9NJ1YFco
	 a3fk7EzUxs1Y5Vqzh+j80VzxCFPX7z9QpzOzWaRZjSI/hHi0624brOVJhfjuQcFjIhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWsiGxiM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39697606A680
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39697606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Isdm3+S6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWsiGxiM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJubSj2973633
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mg80NlqNhIn
	EEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=; b=Isdm3+S6dwSMvWxl6cJiPxQDHYc
	TTBkduGearKIXJFdEyftR2lH0dlFfflobdBqpo6hDwArreDSnh/ZxyTGnIF86bZK
	Q9kMCK/nJ5oH00mm4+4KNjoNnRnn0KNQnekv3uxaxrPDKFSh8SOGl/uUrqQga4wL
	sjy7FvR4lMLkh92tF8ac4Dwv/Qn9DsFoGToNny1oFYm7UHCSGGdND1q7hd5R+5ci
	IhEBWUYXy0qvXqvu3IiqxmktPr9PHnLs5qqHpdO7S/qkecQcvVNeiUa7cU9lAUGB
	p2a2+UDFXTJ/pH5fHscaWQcdkaB3RunPiFJWevgRLwm+gDc2CQgDOOm0Tpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy041mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so2489866eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478660; x=1796083460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=HWsiGxiMz9W+RZYRRLNR8QXHiOG5WeU7hChT8rUj8Ic6IrX9b1bJu+JSf9q/QwPCPz
         4cWwc+GceZKxY30vvHQZZBQzQiyz8G3AKsY4n5TrojsCL4xhpaznRfZzTMTsydvh7wb5
         cE5FcBGrTQsgNB7Zz7N8El+Ol2k8P4lE2Ef2kTus7liWU9KzWi5+H1GF4K5JdBG4QoE9
         o0HmKcnRTFPpeuP3aE/zO3RJE05dhaXXLf5AVBqswnzp8yJEhOqYEE5ZkCOx6AC2OLGU
         bAETWFH4Dr7dUmyPYGV+X1WDqEJgADpbvlqhnS7hQ4DFD2fhV11UvIjeaiiyIfiTbwrF
         cnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478660; x=1796083460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mg80NlqNhInEEXsJ4+/dKojyRD9aqcsf2dfBNL3KfVs=;
        b=L/wHL8HCLKBVHyG2lEvK84RptSgwyRU1SDodZ9mNLQoQD0aZHKPPyJBkeD08z8R2+i
         Y5WCt9XN2IzUi4jQo2bvi2RHXvIUHdDrQW6G43k0SlZHXp0KW/jkEYFwhwJCaiSloO0n
         zqnGXvcVMl/FY9IV4gAhoFj2nTbVKsIkg2h9F7PL4GcLhV2QLzVBAt+2eRDBdGEQxT/d
         6yo5Wlub5NB3fqhD0Ss82dKVxSguby6qooHCrM63v8G7r2yn619vtTk83Jg2NqtCnbre
         IuapeZVhKcXoLZZo2PYtwOUd/0LmElMSzZqlAmuTzZNw7MoDS7Qp175k0PNgTQZBt5/K
         Btlg==
X-Forwarded-Encrypted: i=1; AL+hErEy7PI3xcwaebuFYz3YAystW+nk7RpyEUXbkVglVgSTIWgEq7Pa6j9/bFJSZd7SLrw6w+bv/N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96xp5q6EHBlDkf0giDr5HAWZOlQBpOvO0ulVWdfTwvaDT/gvR5
	6dDnZz9IpLDcZ0o4kyqVSBsrIe4VZ67jEXYA/Dn7SQfkllsddQPkHHQi9hGxHGy7G6P3KsIwXMr
	BDED7xrvL8vA8wj7BApxJwp0gr1he6KQWI1LYa4Aea4CCPR4a9VGntQ8Q5Bo=
X-Gm-Gg: AZFdTZemR5wnsQ+1sJpIfcoGG1T1GPudS1fs1gCt2jl04gRMEyRRQ2nYzCmlhiP4Ex+
	yQX6TyrQKwglhkvlA4uKf7y9I1Xm9U3Yelt/JOyi3GEeG8weTaLjHqFmYMXwTXnl6FwyaK1MSuS
	nFi7auxtXf/c0uo+KNObHzZ3mxj71L3iuvoL/1j7katLat1w71Ws5YQF+xZDpG3FhTVGqaZZ7k8
	tC1vA/X06/XAXWlV+0JF1gjvSTAZh6blQ6yBns6lgA8U3xN/QEGTW/MODLcfCfDzEmY7BXqTE62
	A399r/vJUBfdvhwc+fjZPjn8WTFB1AbeKDgbCJqPrYRr1mxvK1Q09jsD3WfIfr++52CnkM6+pdA
	rujPoKfjMJp7dJVlsbNHPFvnWLALCU3D1ORMZOfB5EasUZ2FROFd+0c2qPi5Qtxpvtswhd1zZrH
	uvD1wXnbx5lt4SevohM74bflEvSVi6mANiEWc=
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650575eec.15.1795478660243;
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id 5a478bee46e88-3869c6a3f0fmr9650534eec.15.1795478659631;
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 2/3] net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
Date: Mon, 23 Nov 2026 16:04:14 -0800
Message-Id: <20261124000415.4067701-3-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfXxcc20Se7tCcJ
 DNYQLC6ZPMK0YEbZMx25/AP2hTyXqyQrsEnw/93ol8N+t4mYMYwrvrBN+/I5GOXJbLJGmcgGiCD
 TtpMSb6RvGv7k8YbFHkQd97ivI08uixllU0E5S9JYBroQAlMkyP7LGuTqp9k7yRrWvsFk+MpG2m
 haz9DIzizCGZjkAnG+K8G5yG3OGRottxmvUGInee036RK+rcOssH1Gak4wo53S5I5TLBC9FyTt2
 f6C1dVAbru2qn3L53hK7H7Rbh1O9Us8b7A7VwPrbLV2vj8s4dz/W1M/pZYjvNtKFevfnoKOsLO/
 XyO6bRQZvcNRFonBIYIVq5lcW2FH9K334cSTLDtA8SroPnqFNOBk5rGwqHululwYJu1yMeXFJDl
 h2oh9Pvk5iEvPKK6i7UEjJ8tZCdtXzovnjzslDbeFJqmyWDzi2AfrPkLiAOdtn1RwLyUpCfjNUI
 OICooUYhRnjW5He4wgw==
X-Proofpoint-ORIG-GUID: o4tKaqLc6hcERrvpO4gxZey-jDw2UBZD
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04d485 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=Hi6WPrPG3QlE4bLLXg4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: o4tKaqLc6hcERrvpO4gxZey-jDw2UBZD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX3QccfNlinDVX
 Bds1a0/79PWVIW1kuM5IrS0wuE2w+lY0YGmMY+kc8TIJizALr1VFCprf0Av/82h6AE/NTBvOvlr
 WGSJR23rmHH29AX29I4J21bhaQ+ASSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095

From: Jakub Raczynski <j.raczynski@samsung.com>

New datasheets for XGMAC (3.20a and 3.40a, depending on product)
support up to 16 MTL/DMA queues. Before we increase max amount
through macro, prepare dwxgmac functions to handle that.

The only caller, stmmac_rx_queue_dma_chan_map(), walks the queues
below rx_queues_to_use, which the devicetree parser limits to
MTL_MAX_RX_QUEUES. A queue above 15 is therefore a driver bug, not
bad input. v2 reported it with netdev_err() through hw->priv_data,
but that back-pointer was only added by v2 1/3, which this series
replaces, and a log line from a void callback does not stop the
caller from carrying on. Use WARN_ON() instead: it needs no
net_device and its backtrace points at the caller.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 21 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 77a54792893b..5b83fe07c1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -257,6 +257,8 @@
 #define XGMAC_MTL_INT_STATUS		0x00001020
 #define XGMAC_MTL_RXQ_DMA_MAP0		0x00001030
 #define XGMAC_MTL_RXQ_DMA_MAP1		0x00001034
+#define XGMAC_MTL_RXQ_DMA_MAP2		0x00001038
+#define XGMAC_MTL_RXQ_DMA_MAP3		0x0000103c
 #define XGMAC_QxMDMACH(x)		GENMASK((x) * 8 + 7, (x) * 8)
 #define XGMAC_QxMDMACH_SHIFT(x)		((x) * 8)
 #define XGMAC_QDDMACH			BIT(7)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index e50c0f4c482d..8aa69647a207 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -259,9 +259,26 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value, reg;
 
-	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
-	if (queue >= 4)
+	switch (queue) {
+	case 0 ... 3:
+		reg = XGMAC_MTL_RXQ_DMA_MAP0;
+		break;
+	case 4 ... 7:
+		reg = XGMAC_MTL_RXQ_DMA_MAP1;
 		queue -= 4;
+		break;
+	case 8 ... 11:
+		reg = XGMAC_MTL_RXQ_DMA_MAP2;
+		queue -= 8;
+		break;
+	case 12 ... 15:
+		reg = XGMAC_MTL_RXQ_DMA_MAP3;
+		queue -= 12;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
 
 	value = readl(ioaddr + reg);
 	value &= ~XGMAC_QxMDMACH(queue);
-- 
2.34.1

