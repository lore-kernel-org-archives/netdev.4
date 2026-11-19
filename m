Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107880;
	b=w8yWWEz2Dzy5ZQIDhjDm045H4LZddMiVmvAnwZlomN6mGRX1Xtos3FBD6oDjrjnh/hKm
	 QwXA685kkWw7cskOp/BxHkj7V1vJ3YnHP51xHn215/LG0BYWSQRu5qn0P0vdRrHyi0IvM
	 PmA0Wn1fV37DnST6jOijr7ycjtA5VzVvX72vLeEKqvWPeW48klU/cLVq9MUzKwRXMhuRI
	 3EPlVsjVmhCSB0Y9kojdzR+5Adl75Qae9TjW3Ewle2kHIu9lBD9jlV+eE308/0VXCgELA
	 Bk1UrQ86BYzIHbTU6U8smp0IRiMLbHchvwlhV891EeUyMjl9xu4MnBkPDbIzULnqoPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
	b=TnYijifXQGnOMdUn8Gn/vZSZpyCna3TewX4MQTfJTuNTU0oO+z+8CP16LC9tPJeN+yr7
	 GWQDfGOp1Hgph81yAYUgWPKH7gNbkYDg/cke7JMeCqXcgdou1tggcUKiq0QGYezeX0+bK
	 S9sSe6n6WxTqRHLLV6uaqDSnI9q0edlm4Z1+Vg0gfLZhMHJRofcg7H2efrByItW/Rn2hF
	 F80wX6iz6tCraJQK2OKLZJfhvniL2BdZbcn178z5NWaye73z6d0yXX3hy/MSBOCCreCcv
	 N3xB3WdgF8D8sBTPRMFc4sL3vAGZ87uT/77wXjNhizFIIVK6Jw4mVq9252tBFoa9fBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTuNbBZE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiz70M6S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E460A260C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6E460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTuNbBZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiz70M6S
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGrp9Q4004293
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=; b=aTuNbBZEAbYXOG8b
	C/Yu31pC4/QFAvBtjK41LgXmCvjHAk1DGATDoLuLeKK9icPJdxDjdl/E7uMKyHfl
	0tl99Dj2PZJM4pX/0abi37EHW7xf72AN0hDDF3h4WdF93sEhnQ9vJZI2ZKvFera4
	PVWj9ImhEKOOx7vTiTyeCTwSYZkUXQ0C0qJesmbnH0+U7CzPnpabwRg8eOpos8jd
	LBbalkSNgXkRIfS1oVw40d02Ao24rS8Y57sztkPZtXwW3LgxKbzvtR5Ij+AhHHVN
	G7bOgmGQNKndT30PvQNdrX39Yk8M6L6Wp+g++rdMrn6a+xR2W8QqZxRR9nz6cnKB
	4s3XCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx19v8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso1051563b3a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107878; x=1795712678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
        b=Yiz70M6SJG9zSa6cHlv/oif7aWaCrSBeMqWVJlXXgrkwc8UYuBPrmkvvvjF1ocXaHE
         mvahlVdbywMDArLq6d8waobM58IStAZPSZPrQ7ZoQAfK2nNrXCbVo8d0yt2irEoTtl2d
         OK49XhNUctUB+FkmKPH4bv7OlFo6W0TLqg2/ybquBnc1kvD8Mcf27tpnpNA66pTqcjUu
         r2ihQzG+Qa+eGOqIP63EfMfQYCYZ+O5sib4i8Nm1GowS/mqi5yjnzGh5pTDX3SNWztQu
         U7bImwaxY1Pr37VxwSPhjRwQHwt+rv6OrFmq6qXte2G9LtO7myBvgC/heDc1QzOW95Xm
         49Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107878; x=1795712678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
        b=CLp6PQm5eMM5UAgj/Qu7GFaYp9UYZ/r9kcrjBPN/o0JBxHQJwaU7DLM3rmqSMaQORO
         cj34jT1oSbrmOEShpp5mMQWjYVXrQxEXhWh/eV+pozi9gjeOBqIRybV4x2XJTcYYaq5s
         faGxLQrYOW8wN4Kb/iNXCy5gWlYW6TcIjJ1NhmzWECOwADnnccLAM6EmOc/a11u4JkWN
         JCoVEvO+XzzSM3ud2HILvL+CjIB5JhChdju9yCyfx1Bjxdnl+iZG5bTqMXgLHr3E7ptX
         0nyUvF9YZ4TBq0T71CGqxCgx00qCih8SElGpxDfbR7RNapjNyMBuY8FfElWym8QO7J9X
         cYTQ==
X-Forwarded-Encrypted: i=1; AL+hErECac9GSuoR7PnYQc2zZ2/Mc03f8pbJeQWiUAEA6O5e1rkOfM4tsAGaw7lDc71QrnxmafM/hNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HZwdpyp+ZuBrqM8j5mt5vNBtiQCsthTmw2V6l8LoNzXcdo8xH
	k/zN0xq7S50CXTXNaU6RsMKwvGslgboJntGQS+Gep4UamcgS04cGAFCrL5xIi5klIvJpTb360Wj
	WAO7zukYPXXPOsTOSqGL1WrtE7EHWyGoGKc1D4XFBDo533kGqZMxfADFZo00=
X-Gm-Gg: AYBFou05oTKZGbnATAQOh5CTXV7yNJL7BJMduoZLN6BakuL2sRRqz10DozzlbcKT6n3
	xPbrQNfTKuwVeXGSAToTHTpCuiMGy1cRN7zv8GukRAWKJuv8t8c5wFoIIFCFSNHw2u1hWsrcvGD
	Wg1UaDhRLwtCorCnIo1dfO0I8YbSxeoVV2epPyCWIXT4CrA5xomsBtwiL5QhhHMioiPvan+IrQN
	066xRkLWgTx6+NQNB5mw8sguSCyKpBZ11Ivo6HEKNrPdzObt45C+aA84u+T+ZhjYnWJ/X3PHZR7
	8JqVecjacdxAQdxNCXQLDVLXE59PJPC8KOwXC7cOB8IVgTE+mzOjLWiln9BdGLGYnMnp140Tf5q
	QELKUt1tfeXWfkAfIn3+tZ4UNJdQZt0lBv/YYStPZZPYL+aUqefs4YtLD7AdxBsMKdNDaIE/Azw
	==
X-Received: by 2002:a05:6a00:2eaa:b0:8b9:7b94:19bd with SMTP id d2e1a72fcca58-8c7dd3072a6mr1299150b3a.13.1795107877580;
        Thu, 19 Nov 2026 09:04:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2eaa:b0:8b9:7b94:19bd with SMTP id d2e1a72fcca58-8c7dd3072a6mr1299117b3a.13.1795107877077;
        Thu, 19 Nov 2026 09:04:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 22:34:20 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks
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
Message-Id: <20261119-gcc_i2c_tsc_support-v2-1-dcb91a0b0013@oss.qualcomm.com>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
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
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6aff2c26 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6SxTUwQ9VCv-Pb_4EV8BxcPhvt5CKDZK
X-Proofpoint-GUID: 6SxTUwQ9VCv-Pb_4EV8BxcPhvt5CKDZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX7CKRI2mnyptP
 VdWf6x+MCtP3BbGAZtfm6JNP8ueax9euNuOuTFjPESOdaMAq8IDaNqXPnZ/LSZ+oz6JihdmYk2/
 H4au2CTG66Vk/t1G9PEopBcMsIwzLvDOCCw2s9Gydj4g9oq7T2RAIVLxy0qk6hdS9SnvSO4rNSm
 YNBAUZHRfQA86iYvMz6CtJn1vUhfxh5mQGXC/doBQwOjMoqtUKlB0d4ZVghM59eEQb2reWCoo9c
 ItftNDuTYhnRazPihIk1Tbp2/ZLqO9/fc3MtlWUgeoS9X1sicXx8+p1rDQ8BYiUU/0Qpuhklucv
 RYxqmZ02njHWjlMVvGykuHnGWjaTh5LCXsWhzl4z7Lep0Rx6y9VFmB2Q3jvTUCKfSlP7Pwpsv0G
 PMxTUpzknOG0Ljs/ftmjVAtUBNaM+srvLtOsgYNyCdQSrucbXMQ4IgPcvI+vF0IqjGprKsopQsq
 l721Cbhx4Y9Mc9T9uEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfXwGauj9nQtvEv
 WRAfmel3r9jedX2muTAa+D9/sYAMaw9IQmzvR8UfIt4Evpc79Cd4CKQKYot0G7nwmkwf1DJ8wdF
 7YJtgcmW+7laD9dN2fCzNR9xsHodouY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190067

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

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

