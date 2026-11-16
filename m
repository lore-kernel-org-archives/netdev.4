Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846181;
	b=3ddBGcxdZqNV1YizYNuhyGjCtkh7uuW9416BFc7YHhnj0uHaT8SGeDQuejW48q/t0FgD
	 OUkd6oim+HSMSpZWRR/lI9OtxZNPNAxRQnm5o4cYfcfZbSV72tM5Px+Nz+jH8jHqPFp4I
	 or9eygr2LZScxHbBrRYhpzwDiy3QPgQ5ZalGrpZzI5kVEPPAKcEC6ZtCCTKuJVUpGkFH9
	 9cDL30QoZAVcUg8EMmFtp3Avco3RZ9U52kdQQodpSQ/2Zw/K6zO84OdTmz7+8qVlYcGv9
	 GNQkPpViZstgXvW8FOGDBjLFgVy1barI89DXhOYQnbjybFiXrKIZ9P9Jg2ryHoBuR8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=SeUvXnIFoSN6j6CNuawF7G4cvyL6naHwAbPFU6ulIiaaX5AYRzE1FxgpRic6OkreWOpt
	 idBIBTDwpi/DaYbuV6R5TqXxyodwKegI8Rhyvo6wC4sSSTw/OGd7t8CB2sNgrxfcWiF/8
	 lCzb/UPOvp0SMUNgWB32vD+Vf7Sqo+BYMWAZiBJiaoYC46lUNNr2pZDMPe17YGDgbER1a
	 Kp0QeK3gxiZvXZVzSvl/JQKJHSDiWZTlPC9t+ZtNL/eekxKmenRtWcziGnIbXF0JynCUf
	 /OWeG3PzhKuEiRMrBSpWGBQAVv/5XWtlEWDb6GOtKRVMGN+jbD2xhHZEdnTr4oGOlqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib0iPzvP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C02606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C02606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib0iPzvP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIZfq154123
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=JJXXqVQtYeE7I2LIEKqks+Aj4Og
	6mnE8TIi1ILCOq3qM3zVIKPZcwh5rA41aKqTA6PTkfDdudLi89hQdm0W9KNvl/Se
	V7ZsXAWS9TIyjztwC3XSBW02c2hQsa04UDoTLnpOwWu3P8l3aDQGk3y/heMjTuRT
	nNm5k5Zz+jk+oQGwu5nk/eX64P7cDzS9BS1E6TA2RfiRwgwpbu07xlAIgaXOdyxk
	X76qpzY8fUBZL81X9hbki8jvo2HfuhfgWqE/h0hlG+5IywHykWIzfTG5M6T/EOBv
	s8Vl8bPkaZGplcg+mhacoh3bDccKZF7hLzLP6YotlMs9sona+8iakVmMXyg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghjj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b5b49cabso3194845c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846179; x=1795450979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=ib0iPzvPUgA/uJ1LwPdtWuiAWNzLrv3waGbdm731acG1x+Rj55xQmBMHs26sXh8xTK
         MAXUwNeFNhNQMvHkBk3L/9fygFhW17FghtADOvVrYu8VbMdZ+4k1nP8l/jLsjRv0tKLk
         0T+gbQR5sqpcMnH0PR9D2XHSS+Fc5RGSFoIsWa3xeIF6GOvh8JOmBcZMe3f1JueMMw9z
         LObJDl7WZku5ih7C3YbPmS3LSpfGDt0o27uEHPSeKF6fa/TSp5kh9yF0MR/zYB6+WMVR
         PD5rz/4WhJ+SiAmx19v6NcSHEfukirakWbBwIhbCYTf793bfWhAg84UDhUXuVf4IuqGY
         gDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846179; x=1795450979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=XvkULItNONvZJlofnohMzmWR37SQVq+82BbDleHctEasfvLV4M1/7wJdR3n54QXT0l
         FV0Ah5tdBm5sDu2aBgWe49hRIPz+mcF55MM1Eu5IMOMuhszwuVpELt0RYqwqSAC2mxdE
         z2GZkDmOM6BIcmoVbEE+FB4UnbO4oZLyphUlj8BiOAsQi8/ZlJuYGb3JA2JgnbTLHs3F
         cdBQZ7GqyImNYmE+bwCJ6Ysz+27n4EhP5KzU6osVCUk+jMBQL5WQud4YeYwjBKLKtbnA
         1LbktSOh135bFiKKJTIARWBJgE8ge3bPa/se0iX5hOE5ucD11c0IphKqSrA7WXSNeG45
         0L0A==
X-Forwarded-Encrypted: i=1; AL+hErFXB0oQsHMx8cEfbVkJwHtRVf0lzeuIEBOPzSZETjpNJOu52X+MnSs/XOS7UdQfH05gQXLp494=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kSLyhagN8UvOKfCwxB1MMQsB/VxoCVBJu9FqaU6xyBqgw9iQR
	/5PVB8td4NBCrURRvt/pBNamOiRDO5K4MNfsOUNe4lLI0igb4QGaVzduRbjYCqPqirtCdHJrVcJ
	ton45Dj2xYaEkCEF9NI+iUpLtSqw8mxx2JngMslysULOxtc7oL8SyGMJVIf4=
X-Gm-Gg: AYBFou3ckFm4g15SX4BQ6pOBTiDb5PSDr8KlVYtVnM5Ids2SHO1Gp12ZTD9+u11ImHn
	u+OWmR7eAy6iFjHefOHAfSXnP20cQEd2khXPeocWr0wAvRM8L0KV9KF16+IKgK66yFylgRdYWmw
	ubYw/w/hZxqciRlVQfA0MGYw8uBbb9fmbHd4zFvXcS17h8alNGQuNUiRfr7KJf2haoo++CWqXtd
	bqo+WSLzYE2auNo+5QrHTQOV9wk6dnZkNZw7tXSnvOs0bDmYp2JMwve5Us5nYuOr3zIx20I7+QV
	d3YFTLgDOkD8BIfib0ytEszsAeRfk9AyIFj5BHxpW2ZLtV0n9J350aV6Pf0yKvyNyc5nu15+A9Q
	/3e2syVBlcE8VzPKjx6WGF1U0AUpHSLdJa4iDYWil7ympouv2A4a/UfFpLzqbRwGC3fOFmWx9bE
	MA
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214849c88.33.1794846178581;
        Mon, 16 Nov 2026 08:22:58 -0800 (PST)
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214575c88.33.1794846173198;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:52 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:44 +0530
Message-ID: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX1YVORbxyedyT
 /CE5I8RBUkGqoXocLzC4OoB5zX2bTfSqlw/y1MNibAxHEH1Vh3c2J5RRLBXbJCISQP4Kff0QKkG
 QhdYNIiSCATygIp8PUiKdUGGodOx3E5hL3nuljyc2/vPnC8oPUSQzjhEPZMdgXKvK4gz/RFP5cf
 wTbifnCTVRlrPSFQBI8DzaxZaHdTVtqD+pSkcBMS4UPYgAvvZM77CIQ2F++wHH/KEMqV2TQ55pI
 ZRyQ8LAPgD2KBFbsZwvCaD+uul0H/X9FKF9a0i++HF139lGcjF1nkdEnfS7QjBbyY5gqndJ0T+M
 E/tkoxIuIMf1leeovxiF2sGHhpeQo4ZNXXqiCyPWTVTwfmj6jg4LwMgIKPhEaDM/MNVjuBG/toD
 4UuE4q6r5AfTtiNz37YFWluVN36KevMNk/+TaQ4D9l/sW9gJ5h36z79dFxiqmCDPwqm/1BI0cyV
 MSPYnSeN5qu9XJjRP1A==
X-Proofpoint-GUID: PAd6HNtCiITqo-H11-rTdD2mOi08OJgU
X-Proofpoint-ORIG-GUID: PAd6HNtCiITqo-H11-rTdD2mOi08OJgU
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb2de4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6tCn2p0vey2f
 QiWirl4YSq5me1n3v/D3yEGQg9zHS79Pd5nsI0vRuhTIa8HByTVFye6nHpNv+oMjcB/HT4wcXS9
 XXkfnkboKZ7rGudUC1CgADc90vKzFyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

