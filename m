Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459332;
	b=yxkW/TsTElFSHV6gbCjQv0E8F2+5uym2BjaV4t+blH3Ux/hecny4Q92DJkWcXbt/hwLl
	 tIE/RNkQt2DYzXacJG9g5QD1nWqYcrJWQVzHZNeCDn0tvXEYUB82fd19dHJHo++OloITt
	 cNMOnmhHKSFAjFaX9llNDrMCf5Ppu8FnX5WddN11bPh055PKYRP7zoy0za6RnVuoRteeP
	 nBLAhOyZ6bEejazejqhJzYAN0+U5HwMRzSlNGXdT4Do3IKURhD3MYWpB56UXQn+39HylV
	 agrMQyX2mvNbNTrx/zgibDT0nEqfP1OdfZ9SgcmdguDQOoqzFL5C9/U24GxS+Kll/wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
	b=BaWt3znYFXZSUI6gRrYOU98DeGUC4b1QRVz4+EGm1AJlWWDrcL0RIeRaWwA+JE5rpItR
	 rONfGvSpXMIwXjyMOK/VoBhBxC3AyC8cc8g4QV7M7xpFqav5gaoQ+5dBqYbkw48u7DtLg
	 SUZEioKxHYnS74LAZ5GE19l8rb/D/OTEQZumDMczDcIeZNt8k14c857ycIAo6SJzyu7+R
	 K5svHRf1aX58U8OkslmNujKC4YUlKM0vJpyAhfKU6doIkp+zSA+sKtg1+4TMIhbyp5TO7
	 fnDo96+q3HURCHxXNESnBhtgAg0bhncBXU9jFi3rCoMG6IiVF3Vo9J9o+mnjD4l83/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiXE4TWu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZR7Rqfvx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3F606A6BF
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A3F606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiXE4TWu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZR7Rqfvx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGt6j1861560
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=; b=kiXE4TWuaPJqeD2t
	h5/8ACClAiCz7eFqtrQZDC16RNFSzy/h+qX9CjvCLoDew5m8VnIxYfr36Tq2kkYN
	fVoFEf8mk6Yb+13AwXOPnE4krInuMk9WHXW8jQP5wJQh/2j+9BRZG5U5FdGjWVk6
	mz1aXllFjyPULvPGpPgigklyrDq3AdFFwYKZJiLG4kjktJqG024FIXkrBL0ADEWL
	yUzCEwdOzBRqjhts9doL/FrdMGunnkxzjWLyHuLk8czeQNpgYFnYgD3NSWCKPpfJ
	63WfRfFd1v2FbICoM/POZNDojCkjP4XxtlQ4PhS2j0CK1farQkYQEoRfd1ehGPWd
	emmBxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2vtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:42:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f04561ee04so20748725ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459331; x=1796064131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
        b=ZR7RqfvxchGSHPG8wZw88p3dZv/8o0J1iqKFRjbt5iHwa8z/bmDxWhId3+Dszvibsx
         Wmx8fLlVI7L5IxTuYKEBXEFCUdHvV84WeE8XNSKvs32/wrPNKWVEual57z9B8bmFOJgr
         ow7E9OV3ANS7qHdej9iWdo/SKE4ysyLbSWsX85aUki5yZlvet+gylOpYl3idoGF9htCy
         ba9btrwr/zm5L7ZvGUPChZFHMiTjTJNdGfCMzy+luXXiJ/xZQbDJ8RN+XKOMH0alV2y9
         INfrsUUXlwciZ20f1+5VOMWcc9hECWSshGfXsg/2Zry/rlejHOCBhIC10tbWGVFaEJhn
         RJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459331; x=1796064131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC+1CHyr8WDmZ1wMgSud7pPW/+XpcKVypRcfMkFwDdU=;
        b=todoeb9I6qsHX7mRvc8xpnE4QfZ2Og3h6O/sHyQyDMJtOd7ZiDN6axBrp+pCSY0f/w
         1BVruReW39xKQ1PGK9gYJ7xXr1dRmE2yepLf1XS920OTL+iNCaWbQeqn/DkoIwjUSXFN
         m7fxHh0ofIQwhlzRGShFj4jRb06ajkczOevVb1zK3xPQh/9QhEOx0IGa3bjwIig7G2y+
         2GgpHB7Y2OaTgx2kcVElT/45tfCKdVmS2Ym6RQP9EY46h3c0zFqiYokawauPygfu6tbB
         XbS1kP1OVCnbsT5CIXa3rBNG6Top+V/xKhcmJYMQSPZX5xhulp/cqjzVLMPFHzSokK6P
         TzcQ==
X-Forwarded-Encrypted: i=1; AL+hErHqsrqoPumQiNRPslhwcFZ1NHQk6+XBtoQbfX7eR0JsBO6xKazMDocSkOVzDmZCBek2reS7Rxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KhwgVZU9EWcla0NoKcQK8aCNOGOr3ODp2zshHeqsDzPIOvif6
	0U/Mn6b1zJNsW4xlhFWwrmc8UBeDnkU0aGxMcmzc20vUZ1oHFF1B3KxlDg30QLf2D0qUHdKIJdq
	BjDbKgQtUqwCKIiAR9J0ytQHU7X3YERde0It3thCvZS+swmoEfdZEJgQwgSw=
X-Gm-Gg: AZFdTZeV2slSW4xbOg6JYMh1REIoJ7zOrUqBeYeuQtcujGd6F8QeMuzRnIZxRM+xHsG
	VJtn2g++7f6i5eYUDoPC0/EY7D6InZxX87TMnr82cmQFkuU7S8pJm/cCxB+eHVLjDnZAwnUlxNT
	N1lANYxr5dD+3N5dIT+rjB0X7JOMulWQ/LAAMiP8flanZ6WUTPjHWw1nNiPGTDFWMujko3hEuQs
	7wrcMOSnQ18We6ceBFasJtDvg7rOJ7ZMqJQ3T1YWiVfvTm4yyO73iuYVvwuDDhqEDmxnkCc6oiH
	MsVd88jnoA8dPFROBUKraloWxmG/4a9arHcXY+FlHViiYWS4fJ/clQPFpyrFxaZ7G9hrT44MYx3
	nDGuE/LYMGrF+KqQQPK+ossShqReNnT2jEVCtzd6cYiqRVfmQhU+XMXA83NrHhM4YTFo2BXi8tK
	0ee5c=
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr112250875ad.7.1795459330682;
        Mon, 23 Nov 2026 10:42:10 -0800 (PST)
X-Received: by 2002:a17:902:fc85:b0:2f0:3956:99a with SMTP id d9443c01a7336-2f03ef861cemr112250655ad.7.1795459330133;
        Mon, 23 Nov 2026 10:42:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:09 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 00:11:45 +0530
Subject: [PATCH RFC net-next 1/2] net: stmmac: dwmac4: accept dribble-only
 receive frames
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ethqos_rmii-v1-1-1754643d593c@oss.qualcomm.com>
References: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
In-Reply-To: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=1878;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=qpbnYxrkzjA1cVIRkiGDBuEbDdF9dtSRfsKcf+jguNA=;
 b=nhA8ar/wB3ULBVPX7fzZqrI64pxRKE9Ib6mlOq2jf8a7U7hiK8GWURoYdJ+ROoWsGMdTctC0j
 HIYvflh0ehDBUz3882jKWHsOwqnnqo1vFKthUCkfHmGQsHdKC4i/Wsw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX9Kpm1s3A3CRa
 J4xLGMLOo0VuuJ6BPNxumrz0othDMKpBa/9Q4F/d6d6HV9olvCktlaVBAwcVCFsXxxW19ip3dJh
 kw42VlpcpwaAX0Xv23wRpglbTmmiPrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX0JKNOBDl0DKD
 6XQpIgMlQuAJYU8duRnTx9ZSaMTWYHpEHBIPn7NTUbdJIJHDPSAPLEMuf9ge+ed8mRtajhU3gHy
 BZrU3ggIlP1inJJdGlfDh/1ymVSi+BTbsHR8/2vJkRcWNkeoRT3lye1g6uW8bpmN3/AfhpowLDq
 q2UBEFAK2z8aFRhyU5Un7WItKYAwe6pJeynSRom0N9L4HHdEtRqiBzxw/5kBLMJ+jHnGA4eYYYJ
 QPgvfc6jX7Vo9OYGstimvnfy+e/1FTxiQtBCq4zxasKLAcaYC2JSMcNBktwu5/QwqbMOBrody92
 4xL2j5K2QbBAvC0CimySZ2vYLyPoxYjVHjuT8m6QNU2/2l35G1CXQK0UOlByBp1+trY4ww9CI37
 9hPqADExDYfxYxBxyiZDWKZAXz282SuvrZzSp9mO32Ex3ny+1e6f0mwtEmab5FD3NsHBakjG0fQ
 aYLk3RoKKXQ6hEwJfsQ==
X-Proofpoint-ORIG-GUID: MhUWnz0Uzg8M9F7pZNu10QGz9bIO5t7A
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b048903 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cAvw1yLwuy3AVl_ujVEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MhUWnz0Uzg8M9F7pZNu10QGz9bIO5t7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230074

Commit 1cc5a735185a ("stmmac: do not discard frame on dribbling bit
assert") removed the packet drop condition for descriptors which report
only a dribble error for Normal and Enhanced descriptors, since a
dribble error with the correct FCS doesn't necessarily mean a bad
packet.

Do the same for dwmac4; accept receive frames with dribble-only errors
while still counting them in the error statistics.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index c6a8f8d73501..2549ffaf9cef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -102,7 +102,9 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes3 & RDES3_DRIBBLE_ERROR))
 			x->dribbling_bit++;
 
-		ret = discard_frame;
+		if ((rdes3 & RDES3_ERROR_SUMMARY_MASK) !=
+		    RDES3_DRIBBLE_ERROR)
+			ret = discard_frame;
 	}
 
 	message_type = FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index fb1fea5b0e6e..8e8762f9e0c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -120,6 +120,7 @@
 #define RDES3_RECEIVE_WATCHDOG		BIT(22)
 #define RDES3_GIANT_PACKET		BIT(23)
 #define RDES3_CRC_ERROR			BIT(24)
+#define RDES3_ERROR_SUMMARY_MASK	GENMASK(24, 19)
 #define RDES3_RDES0_VALID		BIT(25)
 #define RDES3_RDES1_VALID		BIT(26)
 #define RDES3_RDES2_VALID		BIT(27)

-- 
2.34.1

