Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846186;
	b=nvKD/qtolHcvHuVgUDdwB+PxWdtyqkC8k4mwySla79TcifYQshp3I/QjVcEh5QlUPYwg
	 kZ52ByqcXhIQoNk3jUpzwYMgWxYXU65Ljmgs/cAnAMYfhmu449AGoRMtyzkUad1GGX4VN
	 q2S7WNG0YB4dV9HaFuP83plRBu5RqaWds2xtz6LZ2P+PUwhMsLVt3kIMeG8oBDjZBPmSl
	 0SqMOr1iVDHtLEhBw3e+EgbCeZiDVhbpcJOQCqYYZYOx92yUJwhTxTcQv7YOSIRNOGCPH
	 G0aR0ZQutC1btuDlO1qhmHUa+3RF7mUakE1xSX9/t0p/6BlaEz4fPkGDCVgdaKHBcbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=PuNkAUJ1WeO/da+aViZYMjss+upL8MJf4a45BEwTOfArz1N+0rs3X5tuYg/qvFry5Hl4
	 /vxs7Lxw9JmlYL7upu86vjv4eHZcNg3YZpkzO+ZLVQD6pFnWxboYnzIKhYZhKvELNyJQY
	 zh5FM//THwCqojB7wQuNfzkgRSMwuxQ3+o7qEVtyifjRCmGoa2o3S+3mq7kL7WJuSES7f
	 K8XCaSuFs+FmkITiO6JzTHJYV5jMftzojRtdMFNRkwACjuUny1Cqb7W7MN4Ju06c5LocV
	 UF6J1XzNuMZoas+WsynYDqMduE3QLGdwzABi9WsQSwWWu2XMSEZED29zsSDNGUtr7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB806606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB806606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIJUt450656
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=mmVTds2r5rkgKTwEnGI5LCpN5b2
	/tLsDWF6guoPca0gYr5QEN4hCVmdEc+pATQVG1P751FBpszfBZsJ4Wybc7N//Cyq
	43ND00eDQ58lfF/yy5tgXS62HcNfy8tR1JIkrA+VHr+eEd8xANlKBfWkJcFZ5j4H
	zeGe2aop2OFMX+rcBxESBd3QXyhNOIS0pEoUptM9zXiDPChmK7gDObRqHAG8TYph
	4v9/DfUuuNaEQj3EDbVGsS9aHrWhzrkEJn2bcONk/h+wY9NimNbIfnqZK+vAT6+7
	R4/5QQkkWc8KSYkzM2upY1JO0UgXH0Hz7eOs39KTTK7pf/GC77z+GqgB9bQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y0m55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37158b53d06so2754882eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846184; x=1795450984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=DkMT9f5VmNHjHlXwYqRyUbNqwzIvW7+VYHRCXlY1t1Egzbd/VLPPZoKi2T9GYAyUh7
         DedFpAjngg+J8FbIhCk0XY6cWv2FkwaJYUTKAYkX9TEDewgvhNSLok2By+m6IzvmWcIh
         7vZeBn6LdmAjRp5Mi8KIdAqxpQWht1EBLHl/zUrFuTSJJdxJOuY9VYDizjIJx2qvUbJs
         jWuUOQYwfbKh0+Yxco6PgdX0E6/SAQCvn/++8RCgAnWKKToz3CPs7xwI+lpBKmHhH6mg
         +tgVkA3LQ9t7gvtJwER0bO/Nx11e0yh0ib24/qgB11ZH3Ey/5JbzHpUQKyf1j577Z1D7
         NGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846184; x=1795450984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=Ei9ykhCTOiIV20LuRCctW3nCz8LsCbbduH57jF6PjyUp5e5HV8hNxXiucC+t8J25Nd
         3pkaIbwLjDshCTrWm6ZBX11jWsbHwa/CZvfzevotA4TGLlqvY0AC6UyZ3fyrenRUCH2G
         l2dw/3ditBcanHY/XFoom6AmJRY3MtPyLdU+LgOHl8vLZB1vbo/UTikmTXXc7VqHGRdd
         Lo/t1M+bnlx/nmKi+13fU716HGPw5wzb6Nm+rly2u9J1oaXsVhBhjnR7fv0R5ogMa19w
         LbOeDB1i2Ro5eanp4/JIEsTmwx3a6VUwX+PWfFEEzPAt1kFYvQdVEvqCCHCXefF9INHO
         E97Q==
X-Forwarded-Encrypted: i=1; AL+hErGpWQnBc1JBacuuNrltH+Nr0T9ZANZR4BU1+AdqkgHxP4HUBrW7g/5qXox8HdbOQAH5po6XC0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xGWbg94byFqVWxxmg8O79mFEHph1KaPtsTT8OEUZZZFOEvpA9
	hoAI4N00sHfEg3BmyrkW+eiImBRoDA2JDw3FGzui+1JJNveYt6ffBlbRIZGcUksIf+YZNBZIEc+
	KGrnaEBQobO05eYeD7QFWgqFYiKfyDAsJwlYcLcFnCzWMCJTsSyk0SYnTUhE=
X-Gm-Gg: AYBFou1n/Cs6tLEsnZxWltpySqaURHSKiNto3/XhPj8SB41FXmGGlAQ0ddyGEjX8rAP
	IspAK+0pTDl3TpV72N1JHhCjHCsVDCxgWIsSIB1cn4FR8o212RPVCOL9vFRnnd3pvZrQU/V6Lus
	lJkoMbyBdkjvR9TkRiGDg0v/w5Xn8+n6V/Haf80TRkN/TJysrfYhYcKSIOuiJ6X0v9SbWOmMe/m
	oaOVAJ9BRTF4osDfGzehHsMwSqVSkTlyIkEj2jhMD11KOKTsJaZKiJNOY9Zea9ubNuENxvWM3XA
	fIzx1TyXaO2n/RwQjSz85E/pYZev7zODhefhQ7dq+Oz1uaAdYIWXTvWJTh9SywBBLwWHcwb5s1n
	MemAiNAf86xAPNxRoOac9pA0EZrieKosxkCP8+qxax5JtoEfO1M323eGwusLitkbZl6cV5LlcXy
	yN
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218973c88.18.1794846184047;
        Mon, 16 Nov 2026 08:23:04 -0800 (PST)
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218947c88.18.1794846183414;
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:45 +0530
Message-ID: <20261116162148.2864501-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: _cK9KJVzxTBdMJIZ5Gh-uG4tYUiFIyK9
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb2de8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: _cK9KJVzxTBdMJIZ5Gh-uG4tYUiFIyK9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX7uuimnsJi0ly
 IqD6eoV9sxDY6T0X1cb//BZAwb7tf2O8tABXHNaEfQeKo7epswza/D2UfeyhBYQ3H72djeFxTUo
 8bXCwfVDeufenBM9pqAeQ0Ml/viAwaE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwn/dzQeGW7Si
 +htomJXQCEDuEaFlT+CY/F07gHlg9bCTYA4Gp39ucvhp2iVnh4EYdDW621msguQnOlYVua/D1EK
 XpQ791/j6VMtUdL9JcZDhwIAQ8ntHrycj6Z1qPwGcr8oUtbpgew5iHjVTRlIH5vE1nm/NbsgzuI
 jWvOT5XgLVmvHIXq/AjbRD/v/dX/hxr9i5ga7v+PYz/CIp+QmmI7wrlFZJnQocHWriu9CyBqw74
 2JqIWfF27k4MpZF6dpDj8BL7t+Rrjq5NK9h4QupK/Xj0c4KtYjlzAtK3vD1rUZlxSPrmL3WMrA4
 VybcegyiNxJISbOxi/16L9X23ich+bstt3PvpsgNx18BxlB0EubDM7qfqsNmO+ezQLEqL7Bjq3w
 JfDfA55DxI7/bQbT6FBOUAE74VWmMlKOJDiKTOtjrPUWRrlfJgP94VkN4PXp2kpFLE+OHxQZlpw
 paoWohxo38Fg4Sgquag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

