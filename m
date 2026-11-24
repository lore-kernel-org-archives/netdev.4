Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478664;
	b=gYp+wljXTXrkZI1+m/l/Jd72CaOuSjBWnTh2MdQflmfaz5dy6lZ8cdI4xu3o4Hitx3I0
	 gBezmqgCH1YKIpygsaN1UuTN43ZDcCTIo0UE47sgF+A3rInNwYp86irvonY9CRWCAxyDu
	 GN08odoPi74UVlSG5TvzOTZ3NwwaDe/X7tGI5Fk48/c+R3pwY3b6B4mbpiBrw7yP2cUOD
	 CtvG+YzV6G+NBXkNtZAE3Q6r2cTItaBJ6g1tzee0fQ6b4EL6fFJrjCUec6389npI0VIwe
	 8UG0jvFsrryD1c/U3b6lofgM7wDhPEbSrksLREZRnxtIohR1q4kUv33H420im76nruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
	b=F0taxMwoXG4vD3UbxObyhAaH1SwbbzZ0gEYtNnKFvMM1RQQSnXDrveySLHmyGQfAF+z6
	 aKQe4Zhpz3hc4NqcVhxGPsfsRmLQKrnKLuh7ecik8qQ7K13KDgTdwErzyDZEGq1UM6JQj
	 Ows/by7qox8CVPusjHjU66trf+XyoYXMckdCGCdDX1JQN7VeLeJwB4C3RbhDF1GMA19PC
	 SPxxLY+Q8vR6FUVYIfu6pVTZGBss/ch0YQs9MeVmLCp680SO8A7gcQRuTJP7AxIL0A2kQ
	 qsVZOOLPIEJOqnU0ETsIfDKqU/FxBkzZIvThIidpb/MnsfeQ1L0QKhBM88PuONtw6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pom5NQ1D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0C606A6A5
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C0C606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pom5NQ1D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJui1I3962916
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkSEjYs0iAZ
	II4zNsyDNS7uDKaKgENnoiGQDdLvw080=; b=avSY7g7K+veGUjaoH+V+9C6Dj9q
	/3J37fz3iFIuXjNgbV+odze9uz5j6gvfLI/pXYl1+xn6I/SjUNGdx7jfbrmDEx5D
	ppoz9gXGDMr8/MFAEUQ5m+jkZTsd6PFRtPlrOgel/MnN866r8L+4QlBwlvdODSXx
	x7B/tzE2NjyHDpiIglB7ZDfLTXOwWqOD2KK9S+Pip8sZiHCcWzo33y9DRIhwv6QG
	akhEF2BmRga6co4uRbY7XSF60UPDuAWu7YCQiY++gx/PMgN/A3eexBggQ6n4rXBo
	tuyMFrEeBE8nyX7pggQzpyAFTcrUY3eaVsfD3RX5w3wjWRDrjbbDfM9zSqw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7unyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so3651145eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478662; x=1796083462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=Pom5NQ1DlQM9WTClFG7Bx9gJcAQm5uhmSz6OLxzWKDH8eVyZbrLSEjbI5rcEbNSNu8
         BVNIkXlpnedJdZtHIj7Dk+4P4bnwvP/t/u8fi5MwvZe5QMRYdu91fn+84C8TCGDr2WAC
         bIjn1cDYFpr++GdaAh1DeFz/Xm94l6Cs4iVcxLCXv0CHVFWw22h3sWwrVEWpgRlfu008
         1PQyL9h34Ut9uqurypf1SDjQ8kOaGpu9Fp2YGzz6b2nKYckLgfjuqVpVXnBc+78Y75No
         FKPrXuYBirvjV4JE6wr+neGJXAc84Qmvdg+hVCui2by8NAdVioD7Xx2Xy9dGE7Nl4O/l
         heYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478662; x=1796083462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=wbvfMx2Lxri4ij8ZyE/ZuAZFBJyMH4T5oZKZMKH7NrI9rnW4WZlee+mcT9B/bMOzRv
         k6kJLDNeuiKbzNAlXLehMIfqAWnWd/4LV2aNaEXjxQnPGOi3J6dC2Oq8M7SpZTIzmtXH
         WaOJnYpvTVA1KoCVXfhKSYg7R+roMIs44Glwfn0EXpgmq1QA3Qs9cL2nvtyP00CGEusJ
         Y8e/baVVIjNaBpZUGWA/gV6AFX6PbEaJkpSJyAUHRvVO2ujtoj+H2bL3u1sUEAeF/JNd
         o8AJ434NyUddf+PnDVuWzS/4x+VTfFSgqxj/of7K5lJzhW8ow1cIQQHnlXa0mJ0m0IDO
         VzCQ==
X-Forwarded-Encrypted: i=1; AL+hErGRNZFZu7T4Rei0C61/uzpbZhH6oO3sDTJ/uiZ2sZEe+yBgjIIzAukFzy4/qdkjqJ4I89JkPxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6AvCYfwhloSJBn2rtdGRWXGalSqnCkWBoBjJ0bPpB2tHpWiIQ
	9jOmZ+YRBQdZ7IWbjrHua/nZy38CNf/5wsk1t4jFjEW+t4pCsbIiNj05fOqFv8923x8D0qlpQjl
	74fao3tD/TujmIjXowsul6GXpK5RO1DeWeoMlisZTry6+9tuPQW1MhRzoPtI=
X-Gm-Gg: AZFdTZcsmSY9FTNJB+W2mcqwlNWXcZYCOMqykyMHMWcM26/X+VL6yVK6KFLGafeqUFr
	ZXo21aR/f4XKQcitN3nrfS3EA+muOPw/le6f66gkp39EG1Uam3c1iwJUN3+k7uXRIW6wh1KeA+N
	dDf9elzTe20Zzk1HaV+tljNz1IVQX0UWmf8HZzr+GAqNQqK2uZk4IVZ7/i+f22p3faiVzVAHJEG
	bL5Cr3F5idueaxjsG1zZVvdejNexZAeAjs0cTJYkQVOKg4PPKDvlktfgz5TSzXRFjWWLzCyyf4F
	nWmnwX6rAG04FM63Dip+xAWb3+1WxexOwk3Kx/7sQO5I5FkkEHFB2+JOcVkucUcXfXpi8Kcrfrl
	Zwcs3flavbE2M6H4L2pl/xEomHFuzNi25vI/TEUygRCSi6pP8FEfT+koJ68ZlMyOTb0vq2yKv0a
	oM2SR2W+6YreYox6QE6kT/mkUkBQRCUmiHhm8=
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414825eec.19.1795478661465;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414791eec.19.1795478661002;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
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
Subject: [PATCH net-next v2 3/3] include/stmmac: Increase max DMA/MTL channel count from 8 to 16
Date: Mon, 23 Nov 2026 16:04:15 -0800
Message-Id: <20261124000415.4067701-4-sagar.cheluvegowda@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04d486 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=H7QzycyVpUVBSTYqnZAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX6RAa3aru2KSy
 J6qqlDvrNoHKVMlAhuQNPP5f35a9VLHn/wvs8SzNRh/iHvL4hsZBx0FVNokMIBKoO6E2/t51Os+
 98Ef/VVFpVJ6VQmwRAXDUFHYSvI3N6DQr6rj9bUngWeCiutZKu9yHFcLrVSDNA47vf074QsxdEW
 XofMyxON+Iqq2F29gRvCVGrBKFyOk/xXy+/sq6vQPrm2okkuXhHoAncM3eiXy5wtfJw4s9yIyoB
 vG7s4hWwNzc4kCbQ+54CehX7mSIz+6RzAgmJp5twR7SQKMol6xhgnLfvQJEp6cggMJpZgo83fDJ
 pDdQqBO/NZ0eFg+kIYLVIe2+52Ucl1JBaz3M+jCd8JIyfuQh6VQXEw7dMRn1Cgw+BMjDRC8Lz+z
 F7VnVzyoDEj5FpcRPUE4yLDoqbEzSC1wjodOQ0e+iKxyYSheXBGJUhPK63AwKuVcNwqm0low0ns
 GmDBXXYRWNfIMxxCuww==
X-Proofpoint-GUID: D1gvw1wjn6XNFTl-LbTeGPFrNczlYmUE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX718l8sTpHHlA
 u955LjR5b1HdH2ZUOnmoXRudOwf+DjlopslJmN1iVMxVoIxu3cROuqVkKvRoAQAjW8MxCvq1M3v
 CP29lLhux4+0W33cSk1aCvoAIzJzFDA=
X-Proofpoint-ORIG-GUID: D1gvw1wjn6XNFTl-LbTeGPFrNczlYmUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230095

From: Jakub Raczynski <j.raczynski@samsung.com>

Newer XGMAC hardware does support up to 16 DMA/MTL queues.
Add support for these after previous modifications of driver to accommodate
for that.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 include/linux/stmmac.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..b91c8d069dc2 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -15,9 +15,9 @@
 #include <linux/platform_device.h>
 #include <linux/phylink.h>
 
-#define MTL_MAX_RX_QUEUES	8
-#define MTL_MAX_TX_QUEUES	8
-#define STMMAC_CH_MAX		8
+#define MTL_MAX_RX_QUEUES	16
+#define MTL_MAX_TX_QUEUES	16
+#define STMMAC_CH_MAX		16
 
 #define STMMAC_RX_COE_NONE	0
 #define STMMAC_RX_COE_TYPE1	1
-- 
2.34.1

