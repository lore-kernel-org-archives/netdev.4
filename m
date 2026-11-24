Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478662;
	b=laF54AKfL/6Is4IwqML8OanicenFwLU7VbFdhrPh7tORTLUWWUq7zW9VAUu5mEpLEITd
	 ITfK96RN3CDXTv6z7Z7uNDCjRsTxVtKTR+yqUPV0oxxDa+petARcOqIGgjg8efEBNthUH
	 t9emUkH9OdTA/aD+wBdUPr8U6mySvYAZvmzot7n1P6UljIalde3ONINW4kWyqEpSJPB4X
	 d86Kc0786lAbqlI7TL07RF8MQXXVyi5eDU8JkTm4dPtmSs4IY7KdGF5hrx5uXe1qr5pV4
	 B+EgFvrOLnWzPUFzytiW7Q4Tjq/Uz/SitF/CrZlbj+ixaAP5E9ALb9k+2c+b4Xzj69A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FqFPPbSYP82nhsdI2jqUGxCdqdD+UNbXYdolku+tXtM=;
	b=U08DiS06s+Nkggsfuv7DET302Ksx8AR+G4c2hYtfmjyQnOdkAsQJ6SufryBloPVkDWJ7
	 Dgl9L2ywbMRS+YOBnsHXBLxfWjSYbJziQxzQsgLdws/6zC3Bs3ieOI8OjEYpcXDYnjzi/
	 ORZbGLpcDJvESH/eOFEwGQSezK5gtaxxc0hfVB8Ay0vMHz9/A97MODAMQWqSYHgyi/y6d
	 AyzMPvCTcKEYVSOmENyY/BqCicshucwjKRFY/L5+tpTLh1O/kR/Cj7oOuN6q6Gnwi2fEP
	 RlSd1BjpjsRPkWzYFMd1lghdgkryl/vjQWnU4DTugfRBDK1R5Kgk8A/3jafwX+ToBKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu40dQo9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cvY4ize6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CE7606A337
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CE7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu40dQo9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cvY4ize6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJulx13963226
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FqFPPbSYP82
	nhsdI2jqUGxCdqdD+UNbXYdolku+tXtM=; b=lu40dQo9OizBbcc6s3UJTGvIRYF
	qqU4lyFxqlIu/5N7dHa/LABEUGNw7W4po3R2x3kEzTDPSFSr6954z1vLwslitznT
	f/U/FKWL1Hrzd3qxU+t7l+5fqKf1LRZTa0a/wKz+DiWqQ0nM8Oy2HNJ5DNckXVIt
	3+R0X6Zd7gL/C9pQ+MqnoS7ecCg39mLOMC2ywelGfRFkQsW4hZQOJ6epen65eL+j
	kaXWYo4gSHsp1Ni1PJJ2MhpRZgJdjWhHihZooB+Y0f7Mm6TG6eSsx69uft1NdRn7
	BMH/XTEe/u9R0q+bNoi9fWplZiajW3yPlu+0ulFnxabkEU6x1jHdSob/sXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7uny2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so2549989eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478660; x=1796083460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqFPPbSYP82nhsdI2jqUGxCdqdD+UNbXYdolku+tXtM=;
        b=cvY4ize6ymqBv0xiS2M5UXOkES+fcV5dNfI/JUb8LjN8w8YnFjESEuXeCzz/aH+V/L
         9shHuWTWWMGpG8KmIiPJhbHeHrLgN8jdOOnm1X+G7gA17I3WPKl2QOVb3CN1oGkXYX9c
         KgLzJLct+/ox1xRqeafNNgnENhA3HW02Y7V1emd8wHAdRaYZV1QprNqW1GL42zNA4foT
         c4lK8L359jQImB/RSnpFkO+IQobJ+Xkyb5gjiK5OoBnj1T8TrwnY9Ld+dNhTR2TZHZ99
         y+EhWYPM0oYLPniPFTFonaI6yP3nfi1MtJeBWWP9S7S8knDryX2mLLHCAd31KJJVNnKy
         CwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478660; x=1796083460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqFPPbSYP82nhsdI2jqUGxCdqdD+UNbXYdolku+tXtM=;
        b=KU0vwBEhMiYCMWfHcUW2L3X0ll6Gn3is4Xk1SzsruufiLyFTfHZRLRfFXM3cxeSOBC
         yrLFTWdH/K7LrCwGbyQeKDk/Jl87847ApD4lzzwe3rDTH9VUcAAsFDjyis6/iol8eMVh
         ewZg/tAWELa4zY3miOVPUSqpmChWUaas4W8TkiABWj97tln2sbQMeSKyZt3bfUDiA2/B
         QcZxZmG3B6xpCP7DSl2C9y7TJWBkecUDZJa/CPxrXgaRJGfpZxY/v4HNX8fROwn+36bi
         u+4h6hpKXnDex24j9sGodBvgtIcJX5IXq5cW3pJ4rCNytOcmJD3AkjAHOSbmz6WSjt6s
         2dRg==
X-Forwarded-Encrypted: i=1; AL+hErG8oDDnH8tqPSAF5DYkb9qVIUj1xeTVYTFopvDXiGRnjCbq3oCjPrkh1cH2dceHXFheE68vziw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o6s6klptIswVjGFMqODzkLaBbdqpk27lWvHzfBoFz245ON8er
	wm/VK1+tWEysHk14OrJQRW+CMqTgweXmRgQKmzD8VcEy8PQESXJU2GmZt9MvSKllLLQlH+jyYYV
	WOS0aShg4E4w3YxH45nejGkiuA9rTV+wHmEkUfq4Yvw8r0zvFk24nhigYirA=
X-Gm-Gg: AZFdTZe5TNZo2aSFPXpW9ScU0sP/yHVLyfnziqwnQqI2ZvlbKjSCnryukdk7wcXXAkp
	eDfMMcwnpACVetx1rGVQV/rKwspv+xX7xm+3zdt98TDdEVSawESbjRhBnFN1a+PItqFfztH/hik
	Hah+9Bl2ryewOVlWK8DO2BnaKLVXEe8UBEdhxhzfS0PnxdZWTBfRFHjtC1823xcs30Pm00KeBj7
	5FGUXupI2QvOxn4IQFF8bML0B5Nx/qnYzOljVxbatB0DwpMlhK3dqN5e/v2rsrCMkwQrHCMqonU
	U7q2wIPnIq48tcSRKJR/r6BCauhYX1W8e3qYSZecq/Q5wc1dZ5vjcEneJC9AB8S9Yx8S3e/hI7c
	nszx8h6CimbJMJbuD+XDfoSO8u+8bfTQzJ1/B8yUphqaUZef/+oC9S1w+3xvLeJR+uBfrhuRWe2
	7nyHbGNAKlmZ4a2M4dg9iEgvmCWromKi4by0A=
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr13534318eec.12.1795478659469;
        Mon, 23 Nov 2026 16:04:19 -0800 (PST)
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr13534267eec.12.1795478658473;
        Mon, 23 Nov 2026 16:04:18 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:18 -0800 (PST)
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
Subject: [PATCH net-next v2 1/3] net: stmmac: separate the TC count from the queue count on XGMAC
Date: Mon, 23 Nov 2026 16:04:13 -0800
Message-Id: <20261124000415.4067701-2-sagar.cheluvegowda@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04d484 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=-GhTu_bopkbqAbyB7lEA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX17bKg8DnKoW0
 xuZfZadBpUbC4OSRKmnVu+ts9cXWJlpNGeIeSUYfinnLJlp5i35duFij7NTwTJ/r0lPHYcdeCB9
 dV0FRctBVw5dWtB7hs/ZXgE4rK0YyW2I9tS7tAI7lNU8gnC4vuMAsZ0o4EJEo+m3gcFJ4Y9q3oH
 brFiKjHD56U9K61gDcyxdCjkU11fmkgKtVtW6H3hWQ4+M92rEt/wHHN/0k4MQr5chZ5yoxB/BQd
 P7PMS7LVbbDpy13q5c6nNW4H2+QReucvPLWROqXEWB4b6hwI4D+7gWL87rTcBY/E9MgN096FX4Z
 pQdDpCewux96UNlStPP46QNWauC6Rcx+6rhtQgV0CyJO6V5pxCIObdnz0erM98VLlS6laT+O/J8
 oWxWDz+BK+mb/0JOW0KKyTYuncs8Wfp4t6FIhjZFjAZWV7NN8rX/8U3q07KYVOoC1WzCvtoYuzq
 cJDXb0wdKJpAnVPEs8A==
X-Proofpoint-GUID: 4H8euqITeOSpWR5eGVGOhbEqzqG1bLWO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX9ApRWz4FQV82
 AuspkIUMzexWfh7ZstEl7EMJ8eK1EY0AEf/0hb3HxPVt2ESANw7UVAhn4OjHdIQF59kJ21abBbc
 uMQS3w4Lpfjft7Wd30l39QR8AyluOpU=
X-Proofpoint-ORIG-GUID: 4H8euqITeOSpWR5eGVGOhbEqzqG1bLWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230095

The driver assumes one traffic class per queue and bounds every TC
based register write by {rx,tx}_queues_to_use. Newer XGMAC hardware
has more queues than traffic classes (up to 16 queues and 8 TCs),
and the number of TCs is reported separately by the HW feature
register. The result is writes to TC registers that do not exist.

Add stmmac_num_tc(), which returns the number of TCs for the queues
in use and falls back to the number of TX queues on cores that do not
report it, and use it where the register is per TC:

- TX queue weight, CBS (replay on resume) and TX priority (TC_PRTY):
  configure only the existing TCs.
- ETS: the loop was bound by MTL_MAX_TX_QUEUES, use the 8 TCs the
  hardware can have. This also keeps it from walking off the TC
  registers when the macro is raised.

Other registers are per queue and only exist for the first 8 queues
because they are per 802.1Q priority: Qx_TX_FLOW_CTRL and the PSRQ
fields. Bound them by STMMAC_NUM_PRIO_QUEUES instead of the TC count,
as the TC count is not the limit for them. Writing Qx_TX_FLOW_CTRL
past queue 7 would hit RX_FLOW_CTRL and MAC_RxQ_Ctrl4/5. Reject VLAN
priority filters that name a queue outside this range, and only walk
those queues when updating the PSRQ assignments.

The checks are in the callers, which can return an error to the user,
instead of in the callbacks, which are void.

Link: https://lore.kernel.org/netdev/20260601162537.553512-2-j.raczynski@samsung.com/
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  | 17 ++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 21 +++++++++++-------
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..77a54792893b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -291,6 +291,7 @@
 #define XGMAC_TTC			GENMASK(6, 4)
 #define XGMAC_TXQEN			GENMASK(3, 2)
 #define XGMAC_TSF			BIT(1)
+#define XGMAC_MAX_TC			8
 #define XGMAC_MTL_TCx_ETS_CONTROL(x)	(0x00001110 + (0x80 * (x)))
 #define XGMAC_MTL_TCx_QUANTUM_WEIGHT(x)	(0x00001118 + (0x80 * (x)))
 #define XGMAC_MTL_TCx_SENDSLOPE(x)	(0x0000111c + (0x80 * (x)))
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 09194b9d8322..e50c0f4c482d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -235,7 +235,7 @@ static void dwxgmac2_prog_mtl_tx_algorithms(struct mac_device_info *hw,
 	writel(value, ioaddr + XGMAC_MTL_OPMODE);
 
 	/* Set ETS if desired */
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+	for (i = 0; i < XGMAC_MAX_TC; i++) {
 		value = readl(ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
 		value &= ~XGMAC_TSA;
 		if (ets)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index fcc395321816..24bbe72e0071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -57,6 +57,11 @@ struct stmmac_tx_info {
 	bool is_jumbo;
 };
 
+/* Number of 802.1Q priorities. This is also the number of queues that have a
+ * per-priority register (PSRQ field, Qx_TX_FLOW_CTRL) on DWMAC4/XGMAC.
+ */
+#define STMMAC_NUM_PRIO_QUEUES	8
+
 #define STMMAC_TBS_AVAIL	BIT(0)
 #define STMMAC_TBS_EN		BIT(1)
 
@@ -441,6 +446,18 @@ static inline bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
 	return priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp;
 }
 
+/* Most cores have one traffic class per queue, but newer XGMAC can have more
+ * queues than traffic classes (the number of TCs is reported by the HW
+ * feature register).
+ */
+static inline u32 stmmac_num_tc(const struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.numtc)
+		return priv->plat->tx_queues_to_use;
+
+	return min_t(u32, priv->dma_cap.numtc, priv->plat->tx_queues_to_use);
+}
+
 static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 {
 	return !!priv->xdp_prog;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca4c7fb11b73..5d02f7034a7a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1023,7 +1023,11 @@ static int stmmac_legacy_serdes_power_up(struct stmmac_priv *priv)
 static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex,
 				 unsigned int flow_ctrl)
 {
-	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	/* The per-queue flow control registers exist for the first
+	 * STMMAC_NUM_PRIO_QUEUES queues only.
+	 */
+	u8 tx_cnt = min_t(u8, priv->plat->tx_queues_to_use,
+			  STMMAC_NUM_PRIO_QUEUES);
 
 	stmmac_flow_ctrl(priv, priv->hw, duplex, flow_ctrl, priv->pause_time,
 			 tx_cnt);
@@ -3531,11 +3535,11 @@ static void stmmac_set_rings_length(struct stmmac_priv *priv)
  */
 static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
 {
-	u8 tx_queues_count = priv->plat->tx_queues_to_use;
+	u8 num_tc = stmmac_num_tc(priv);
 	u32 weight;
 	u8 queue;
 
-	for (queue = 0; queue < tx_queues_count; queue++) {
+	for (queue = 0; queue < num_tc; queue++) {
 		weight = priv->plat->tx_queues_cfg[queue].weight;
 		stmmac_set_mtl_tx_queue_weight(priv, priv->hw, weight, queue);
 	}
@@ -3548,12 +3552,12 @@ static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
  */
 void stmmac_configure_cbs(struct stmmac_priv *priv)
 {
-	u8 tx_queues_count = priv->plat->tx_queues_to_use;
+	u8 num_tc = stmmac_num_tc(priv);
 	u32 mode_to_use;
 	u8 queue;
 
 	/* queue 0 is reserved for legacy traffic */
-	for (queue = 1; queue < tx_queues_count; queue++) {
+	for (queue = 1; queue < num_tc; queue++) {
 		mode_to_use = priv->plat->tx_queues_cfg[queue].mode_to_use;
 		if (mode_to_use == MTL_QUEUE_DCB)
 			continue;
@@ -3591,7 +3595,8 @@ static void stmmac_rx_queue_dma_chan_map(struct stmmac_priv *priv)
  */
 static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
 {
-	u8 rx_queues_count = priv->plat->rx_queues_to_use;
+	u8 rx_queues_count = min_t(u8, priv->plat->rx_queues_to_use,
+				   STMMAC_NUM_PRIO_QUEUES);
 	u8 queue;
 	u32 prio;
 
@@ -3611,9 +3616,10 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
  */
 static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
 {
-	int i;
+	u32 num_tc = stmmac_num_tc(priv);
+	u32 i;
 
-	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
+	for (i = 0; i < num_tc; i++)
 		stmmac_tx_queue_prio(priv, priv->hw,
 				     priv->xmit_qdisc.prio[i], i);
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 5df6ef1dd438..d18d064b42ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -686,12 +686,16 @@ static struct stmmac_rfs_entry *tc_find_rfs(struct stmmac_priv *priv,
 
 static void tc_update_vlan_prio(struct stmmac_priv *priv, u8 prio)
 {
-	u8 prios[MTL_MAX_RX_QUEUES] = {};
+	u8 prios[STMMAC_NUM_PRIO_QUEUES] = {};
 	struct stmmac_rfs_entry *entry;
+	unsigned int rx_cnt = min_t(unsigned int, priv->plat->rx_queues_to_use,
+				    STMMAC_NUM_PRIO_QUEUES);
 	unsigned int queue, i;
 
-	/* Restore platform assignments with the same precedence as setup. */
-	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
+	/* Restore platform assignments with the same precedence as setup. Only
+	 * the first STMMAC_NUM_PRIO_QUEUES queues have a PSRQ field.
+	 */
+	for (queue = 0; queue < rx_cnt; queue++) {
 		if (!priv->plat->rx_queues_cfg[queue].use_prio)
 			continue;
 
@@ -706,19 +710,19 @@ static void tc_update_vlan_prio(struct stmmac_priv *priv, u8 prio)
 	 */
 	list_for_each_entry(entry, &priv->vlan_prio, vlan_node) {
 		/* The RX queue count may have been reduced with ethtool. */
-		if (entry->tc >= priv->plat->rx_queues_to_use)
+		if (entry->tc >= rx_cnt)
 			continue;
 
-		for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+		for (queue = 0; queue < rx_cnt; queue++)
 			prios[queue] &= ~entry->vlan_prio;
 		prios[entry->tc] |= entry->vlan_prio;
 	}
 
 	/* Install the new assignment before clearing the previous queue. */
-	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+	for (queue = 0; queue < rx_cnt; queue++)
 		if (prios[queue] & prio)
 			stmmac_rx_queue_prio(priv, priv->hw, prios[queue], queue);
-	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++)
+	for (queue = 0; queue < rx_cnt; queue++)
 		if (!(prios[queue] & prio))
 			stmmac_rx_queue_prio(priv, priv->hw, prios[queue], queue);
 }
@@ -749,7 +753,8 @@ static int tc_add_vlan_flow(struct stmmac_priv *priv,
 	if (!dissector_uses_key(dissector, FLOW_DISSECTOR_KEY_VLAN))
 		return -EINVAL;
 
-	if (tc < 0 || tc >= priv->plat->rx_queues_to_use) {
+	if (tc < 0 || tc >= priv->plat->rx_queues_to_use ||
+	    tc >= STMMAC_NUM_PRIO_QUEUES) {
 		netdev_err(priv->dev, "Invalid traffic class\n");
 		return -EINVAL;
 	}
-- 
2.34.1

