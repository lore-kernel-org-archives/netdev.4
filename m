Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981831;
	b=im59Uc7H9Ozqzh8aDyaVYAtWl5EwWViY3UKGNDMvnwTAMhU2OTX5Sr3iI14CbxNFBqhP
	 Wk8XgS2pmu1XL209aHGWBPKpBK7IH6FDWPz2Onwcec4ApToh/rRJU7a7/Kb+/HTswc1xC
	 evWcCEBZZ6x5OPO9jaKr2fU8u6uAJgy+aZx3UNGtythywJLB2Yq1B0rd4dEkD/kmq29Sx
	 VRtyf8CEa8VP6baodv9/oLqhW3PPa8/wk9IVqurw5hmCjXk6GtTlOzkIRbqrE7dmp99z/
	 hE9eC2xK9Ore+apPZnWSfWs51HqqpepeiKwWdEqBuJGlsTRC9Wvi1nyPesfUozoyxtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
	b=sZ8RBu02KeOv2dkr9rNO3RXtt/RFoTdRZOQ0NVdzopvO6mS6EdpoxC5HKdRnVf9CWZDB
	 5kb3IRqm6yOXVxA30mhqbOPrCH68qKTjZW190hBJMKqcYuKO+lqx0ohZvZF78C1MNl/Jo
	 12sXyzOHFABwFg+YGQONWBRW6b9lW5Nf4aorA5IMRhllXYBWTqDrvXwcpVoSghDhxSAH2
	 gmUFLwJYZlGo1dz+9xaon2IXXhUWrcFHt55n6g9Y+vzB8VSowbG0mdtdyAH5XLf0GZZL/
	 m9BYT3i/dbR3t6Pnc7bNeNfqm1kCm+CcYZKsjaYFpUssIaoYI22GlARzAsWI36hQ8Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A1606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 708A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxPf1430530
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=; b=ZYorhPEm7sZKzcvR
	73Hi0ohJQQTWnO7B7Qm42Wt5XnrWHizxkW3JeeGlEfFrhHslC1IcbCeHtzAv2+/c
	UbtY7moUdeGrhi05bn3U86CzWvl5ih8tJ2sldslBhTY1eyseBmgy2AMnbnhPpYj5
	nOSJY6WzHgjmtn2W7s7Zoht00ZIPJ/n10xupzbdc6eDEPxciXm1V3FJyC8jM3uD7
	QTrAOyU2wjAekFjILTe+kCVCm1QBgWkqAVxaRI8hdhBLAcLGXBqA7rwXB5gUyRPH
	ZEPjWuAkejnKrYrGrqmRzxwnw49n2lLdnKDPIAMDpdrndLfa4g352YYaNOZf+lnq
	oRDujg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91fcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so7937855ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981830; x=1795586630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=Q7W+jj9Q3RbdGoHtjsaHSx/z+2yqQPyx+sP7JbIPIZpoI8tt2zpf7qBgLySkFLXyGG
         f4CUf1JnvKIwY7ourblEl9uIlFsKgaSR8OMxpOhIZjm4iBlj0/YuY/q3mIXWRYTU65Cm
         0Dzts+gANeaF3iTlniRd3Ct1RrskS6slN5/kGponlgRSykVlwKMJJmqNfMngx028vVT4
         x8fyM/gcf5ETmiK7Mx/UT5hlFSXFmNNpOWqpweCq/zpDD/qKR3/LBQPTibhETRG0/U8s
         4zQFbk+iD8UiCjtdt/dufB8eGiJsi8qMF8H/Y21H04la3MShbF2+ITlAT3Fg6hyiC8gA
         4w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981830; x=1795586630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=ByAZY1nxtvRMMn/+UHZAjgtgp3db3BQta5ihEQ5gob3lTx8HZ8Ty+JJKoArWsFT+mj
         z5MmbgTCM4uTuntaUnQIi9PF2FwoQtwB7eQkVvjTgpKhcJOFfBkiSM2Dy4LUOxRQ2DTc
         uVjBlzPaI0lfFh7JORnG8JKS3hrWRYHJ0tS1g46oEUAIzo4s869WSwHQxJ/u1sep1h7n
         Hal4ihslziNKs0r+PFRcNE81QaCXSBr/Ntt+SyQh4tGVIumKqDqg5Ygi5RchNDVmaZlJ
         gWOn7qQSxhoy3fNnSXLfRQmZiTbK33eXPQPWa2UvJpjwVH3f3VV9PV1nfYCQiJ8Mhxz/
         7jYw==
X-Forwarded-Encrypted: i=1; AL+hErHiY+JqrNFMyZL73jMO5qbh+PPy89Zi1nfqEQFlLNGkAdwlmVcmckLQ9Mogv7KIzIYKRVWGmJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JG8syLHHygHYAbyZ7jRUH8elOQtQnnSXqBahKu2nErOaPk2xn
	4O/UNnPx0PiM17z4a3m/DqWEogu6rnIk+EUOUkqhX3lcgjR8KF9FHpJv+pX6obctgTdoL65VTqb
	1fKV+FbFlm0uzSbRZR3/0riSX5+2/yVU9cF8TbQzedXqddTFJy2v1emwqKlM=
X-Gm-Gg: AZFdTZdX0OG3LVqlIP55gImlKG2PbRRg3wQo3R8pgzFWKD1LsdpJ9nDvSdr7hWr4vvO
	UvcvM3BJ3h93pr459ARKLXEFAsW+gqa1CXqMoyh9TrxUYNYZxWDnDojEOWhiigUi8wBYnRpSqVJ
	Wq+nRMBlPgpCTaAuCaE9gZC5R6mQhEMHtKoNhRnCOmEnZ6ps0Xdj2OYQRWUKIatO6lt9qQZjvsQ
	RkQj/agCrQxhp945HxkqUSdPSX+nlqOK74ag5c4xd+Uxz01ttkrdWFceqqFlPW+QP5u44E0dScK
	WJ8/2i1XMJyqRjz6WCy7RpTNiAOAK68ftBdisIYlh45a8j3IZmmthg8OwEmjKJ+TOOVq/SKMI1V
	qedIY3bYAqZD83USjFTAJAiRTk1EL1Lsm1YAaDpoI1llrmnvR7adYjGyqSCuBig5beciAhcuhPA
	==
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550665ad.61.1794981829992;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550345ad.61.1794981829476;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:42 +0530
Subject: [PATCH 11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-11-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7pXq2YgQd37w
 Idg65vXya7KSnbWHX2Y1Gor/NarTfp3aDyxtTZH+1Z2LOaiO/jmzbfH1nbpn8N8dDhen4KoPB0s
 RXkGhMzkebawFAgVsjQ0c/OvvFqqGBLu59BCWr8PDzfYnyOSl+bYaMa0l8oz7aJ0hnI0CfkVUZD
 ROCvBS0FSTClyE4TRI8n1z0f6uZxVby+RtO0VyhRpkHDvzCVCxjpH6t5YVkgsmwipvrMeS+a/OY
 EA/J3HYWaaFiH4xB6GXC1aVUM9Cq2+7i398nnT7qbj833b8h+yjf/MCN+Jz75KZCK5U4eBSxqX/
 mkIXHDr5r2MKZDwR/HDNP5gbOmoWHAWMiTRgEBdmEAOVAGQR5kOFArz8TSt3ZQiKkwJ6jiM1l7U
 1qlv6C0OdTMY0mWftdhLclzd46o5Rp6KJ1G3qu7QaOpqEC44DSHQg+e+r6Vlq2+8dxcVI+5LaIC
 hqMobvwLvXR8hNLah0w==
X-Proofpoint-GUID: -afMXR-DtJRIQYJkp-m4svgG9xODB8n3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXzwBfpqkD/4ue
 iswYpPa64bujq84fcElWlmCOMzYGipxnc/a9MXEAEHlUcS4oanOEf9W0jhB6EbLuFF7bWqKy6dz
 bQC7KSJDOFE3PKVBx85gGL0gZihpbSY=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd3fc6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -afMXR-DtJRIQYJkp-m4svgG9xODB8n3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Kaanapali TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index ea7d4768483df5a3b5b8fa85a686cb9f8192e673..c9406a9ddfc54746da2b38ea1f02fd117a472c5c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
                 mdp_esync0_out, mdp_esync1_out, mdp_vsync, mdp_vsync0_out,

-- 
2.34.1

