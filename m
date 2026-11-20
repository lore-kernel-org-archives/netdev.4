Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171483;
	b=CHBL9t32PaO2pzU+dUrXgm8Uk8igSoeHr+OvVI54FFeVDmgemJmuYtLYyL7RLWVf0o60
	 myH8Hu7mDsgMjR68JnmCoUeS4D1PyYnUnCkffaXY98+Nd7y86kSCxWS+xoQa/tuXKvXSk
	 5Zw2LTS8DYjc2dE/YT/TFdjqK27/NWoWKst8IKt3e7fm4JhClt8dfeU6cT7+Z7qs+FQQ5
	 fWsDjN12tXvOW9a0X5RW8YDtV/OYrC/qcdhReZBjaVDxzlUzQM0PZ8E4ojXAWTiDzsfVS
	 Azlt8WdhlqPtqRGtSdlRGL/TFPkbtT8fuUMfMd2UOO3K785yQ/WCxuu/Xuu+ixBuG/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
	b=LDG/0Ggib9uz+kyumtwULNlJwC9XMMkT66L7tqO8xSk5DdwJhyhqO8iFk/2fFyoQy0cY
	 YAG7vYCq7nzyO8LBPqpK3Z/JHvpUs738kpTinPI3Z3SbIKi0BGREdBj0Z6kh/CboK+Vbc
	 /uhb4T2CgoS1DhALE5Ot5Q2q+e1gBbWP3suribiAcqQeKoJilNOxQ0BeOHUtAf6cyN4WM
	 /OJ8c3hf1sSHTDglWn8fKNHY+baAz5U0W+3VC6/QgG/rvYzG8bRrQT/lNCJJmP5iIvdqC
	 NIY8D/TZNAXtnkoj/6eDaBXPp6mmWiP91GoRaBGGMhU6Hh6srSm0fNnNOeVzlCpF2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EeLHh3/K";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CE8oAfV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E869606A33A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E869606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EeLHh3/K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CE8oAfV5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq65144444
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=; b=EeLHh3/KcCx/WaWm
	LDQmUDXJ7tCRpkZhlu+asror4GP80v49z6ML17TnNySbeuVcjdnCGlLzQXn+mNdW
	pJQZIGUL02VhoJj9hn+AlpItEXk6fMlLdFZLrrjUeOqfN2hwiWNE4LVNOj08N/qM
	QkZmgSjmbi0VETXDjnrtS2OaYXJsqT454CXy+tSI2yB/vGBScmlSQT6lewPN+u+V
	QeHbynTqqFmS4dcMQtTrjPLJyVLbDl4AoRwgvmqVjM4nYhusLQjmbJimeW6Lprew
	cdSkl7MDtPC6mlEGxTD0t7ru66RfReYEz8jpDI6xTyv/dSdabfy9BH15OEQT4I9i
	/QihWQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhbct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:44:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383f2d05c73so2302424eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171481; x=1795776281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
        b=CE8oAfV58qYjjMqi9g4y/7flkeg8pDeDJMjFgWbtjXCrapAp5BsV3KK1VE3P5JhPlr
         qut+VH/IPsr9K+UMo1U5pn5xnRiW/vHhF4Ik9ox56LDe8c8g7KYQZ8QYhr9lxw6AQ+Bi
         VDmE3zyCV1K6r3toJezZ8hOGnekRbsJrD7cEvYdvHaCOQId3ilq/mAzV+Mu+7YAzw7QA
         QO4myF8X77jovf2jrNc+w1rmhBHUe22FBR9BqsNBl6IOHVIuuCCsWlt4vfClXW1bOESf
         v1AxQCFUAvHrVPjotnvA21M6Zco8C2V1rZpay6XjSjDL1PKR2jcOiSAUDEMOEwes5b0G
         O/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171481; x=1795776281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
        b=KCbVBZK1oJcVf94GHQqwDE9RtVPxtypBu5+fAEUzJesVIu0iRYGHlwU37KO210Dxcj
         ZMss1jjDsr+OGWI2xs7ovBqx++d1noSbRSePq0S7BGmUpVh4IZwT/0TPLVbnS8tiit18
         Ed2CxcYVGOhp0YdOrGH0Nsntm8H/HdkJ+GjEtHYZPfxdJDmhIzo+rn216+s2g6oyY/m1
         XOrLYTgmrqKtgVEg/g2TAkCDW3mrRUmYp6tota3RrsFeICkHxqpeQr3AaJ3LFDxldnYB
         Dp/QYNQo6r5LS3anycQ5aGP9YG0dcHX4DZYTELQWZGpGtJzrxBGCQqL3byXFCXfzfv3l
         v5tw==
X-Forwarded-Encrypted: i=1; AL+hErE/MLG7/Q0nAHpYwpFCUaOi9gfd9HYcx2ndVfs8CoGT+6tNS7mnU6zGSUUqy9/+OC3uSq78PRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9alUiqcBHVWFkt6UxMGTOm3iBClD8so+dZEAFfs0V6AG5qhfHW
	yN5wZi4CjMCf5zE0UY2+HuCrreSQdB86cdyjVN1muiNWlvqEacmIg+Pfrl+qfqBr9+WvFWhk36d
	FDkgSgguY+O/V4E2vMoSkr+8ze4tsfV4yglp40WFtcOsNEwca5d/5HpAlbyY=
X-Gm-Gg: AZFdTZch+WCIjikzm/JwOURsja1TXOhp1cTnv7boPzihSCkDmMby9M6aBIcFjnZlhbf
	17qsTLE2tCNZo/nYyhmNsFGnS7UbIj6oB2f6Dde5prkvvJKvxB7ErdTv/em4isKNkIsUV37QZ9J
	YfcocL7yyUA6x4gAiYj2w9xsJxsW1fXWazJ1OPfNoddsNZlQCaybrEIa9bUdSNkWyYc3NmY9XS6
	/5QmhbGjeJ73QmCMvGxrLfOR5IzB/dLHako/ZUweyGhk6epWwMTQWHDMf7v7OaKkZ5WqklaXKFF
	+Ki85Hdeagyu73F0h6w0v+GRcNRiDYtfvLM9G8JNkjWYFx6kJFeTYknd5eUFwsQkLaX9PRZmN7r
	6VEzbQNKk54dq2HCHbBaPiHsAVEREQwjeZXlia6qNZmg8z+ftC4Xc+ZO9hO1mawOwJMJxTh7z
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr2694718eec.8.1795171481163;
        Fri, 20 Nov 2026 02:44:41 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr2694698eec.8.1795171480649;
        Fri, 20 Nov 2026 02:44:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:14:20 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks
 for Nord
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
Message-Id: <20261120-gcc_i2c_tsc_support-v3-1-e631872e670b@oss.qualcomm.com>
References: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
In-Reply-To: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfXxgBsESnh9mK3
 JDRu0EI7ChWUkEVVFA1FpA2dq+TjSQEZD1vYTnSnNrffkMiQTgiev1bbKA0mbAVnG4/LINJnLGI
 /kzv2dbpInMD8jk8jz78BWUIYrQfV3ikZlAXrG10SeqId7YKGmP6dxK6sOydIO0RMCdHY6FPE4+
 kOVpkmWedoQj66SWkOKwltvTHSaeVlblC2VjcUz5S3NJNlMzf6bCe9JXhIXUl95JKAVDbQChIi6
 XIROKfC2j20vIR9zJ6BKRnTCbSZ9Wkl9jmayBPE40yp7QJXqrZ83nvsCsH7XNCvlF/Ow1NXpKNf
 j08iAeufTSb/oHHzqFVE1eQdJr0jrdvbx8zD+nyYAu7nnyUYtrNc7KcaOkCvtb/OZ7r/JH8S5gR
 4HZ3KJwybj7bWPfHamYFuXLaOR3j0T85kIw1eWeNS1+A1bgCx7RXtcOCyjX0AwOPgP8Fy1pmCSq
 pXWpCA7AzBWLUQdq91w==
X-Proofpoint-GUID: -20yejxNyrJ_B7PCCj6FBMfuUSJhfVKv
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b002499 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: -20yejxNyrJ_B7PCCj6FBMfuUSJhfVKv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfXzitjkR4rsvsH
 gW6He0KrPOAMDrpb9LO4xxoaEhJPh3zOwtr9fx/u09I6RF8toJAqwVQwyiIh5/anSiScyZVxuUQ
 SnE48kIqxWPqZVNrPavtMd/cEMSh+Es=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200042

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..f8d6963f226f151d8cd49aba9ab98f9972f8cd64 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,13 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_I2C_SLAVE_AHB_CLK				79
+#define SE_GCC_I2C_SLAVE_XO_CLK					80
+#define SE_GCC_GPLL1						81
+#define SE_GCC_TSCSS_AHB_CLK					82
+#define SE_GCC_TSCSS_CLK_SRC					83
+#define SE_GCC_TSCSS_CNTR_CLK					84
+#define SE_GCC_TSCSS_ETU_CLK					85
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +103,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

