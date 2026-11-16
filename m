Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846196;
	b=mfGTzF6J9f3l7DUuMzeDpMXkgE01uzElm7rEmLR/xjwhGDUmvxF4YwDSqsspXvbEZ9Yh
	 bYzZbZ2Eo8MIECO9SrAK5hm8aKZVvi07Dyrp0avIpKSv1YrW65N5ovm+AhDxJdXqxCbuH
	 9w8FhD5JrUVdLW8SjwH5/Zr3euyZsYtAmnI8uKbJ4NptjL3WreoWHx650s48fHZH8RKYN
	 z7ovCDr8J95742S8yfnc7TUzHYLtxNFZurKiZE+0tDkCvVQpH9NdUoeK07PMUpZWtM7x6
	 6K7YrHTTvBD3NlrOaOo1JHaN/xuVYxIQ+vWZ7Rl2THLbPlTMgKHOo3UqCWSjLO/OJAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
	b=lyQ3wAHSgAL8NxlQXInrOBFPWxuzA06rtPN+QF8befdeXss5dtAciF07SR2cRaHaMtu+
	 cdybyaYS/iyE/L0EaMLthl3f1ajbUKB0myZZHnoxBAz/aYq27CDFR+mctLBEeDkxK3JzZ
	 a/7EqGGp+JXSp7lpdt8EtPbdT322qyBTR9ya7jl7/87Kdqmo1kLYbCuUU99k7EXxuSPHk
	 F6b+N1Kov3BI6oPJLie85cLbc7KWEUzVOYumvD3qOGE1Q1QSe+3kxhkUYlV9q/feQx9NB
	 tYYR3QuRPH3Lzx2tLoMM7yh8y6eD1Q65OksRZvlIZk48pn9BQbAgeLlr+NaFjoKSi/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVZ3YHZ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RgJAw1R4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7A606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE7A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVZ3YHZ5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RgJAw1R4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGICYx1110310
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EPho6yeU36Z
	5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=; b=ZVZ3YHZ59rK2FGx0nxxNalzsueK
	ClmYgIbnhi9BNOktRJNO8GHVNBEMgLHHHqXcPxVNvi4GMOLotmUfjxXjXI1/78s1
	ucWStiSfbicw1PMbIw304IpZC2pK3vRbvuC/fHmPxdrnF7eQVlFBZLqIwSr6u/py
	TbbaQx2zMOXmAJ7DmcaH6HjBlLD/GDgq7RCmnhoVh69cJ2ERq0oxCxNcB9XVD3vT
	1USdn9zmo6SfLRF3fsjYasmj/hKGi4m2RoCO2pwMpTkxgqgS99tfMLr0UXCr6inA
	M7irf1gkE0w3Jbz/mEYQuDvKBxb7mfRGxJynhqWAAAqN9eqbIL+Oo0ga+jw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqghedx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:23:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so3038252c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846194; x=1795450994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
        b=RgJAw1R4943sEz07rWePPy5rfhK3c8Pj/LRqf8QGm6cJoSOZuCm4I13MaFaP/AumSS
         VUKewYHC2l/cvevwyHOCfCAwQMfRwJnfC8/qnqAOZOuyXRfrEhNJurov33UVGH3lXQnp
         AOTOT9VKNRH381Me4euJNx3j+Q+QjjlSN4P2T4qHFwlObvuh2mCP80aBjVqWkJvT/bCl
         ejD1eF2LHxN1Xnn8N5VChagiBLpnjfwLjQALdR8OZCBh2Y83BgyCEtMoGTerZ2X1ErIv
         CpkmDne/mD7Xqy8ArdxsOpHqfGnUo4M+PN0Ga9Z1mzeOrZjwaq9cK9DJUkH9BZQ+mMzr
         3dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846194; x=1795450994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
        b=lAvkhBwrUYICkxJDCcbIvko99F2SrnDsBCaPbk/yAOK8cqIEPGZY3Mw2a1fnwOJgg6
         JCpBnfR8ehqLvLB/LDf4qIyusF9ZVJvGlquv7UvBI17O4cy14bs7BDIa8gxvb4Va4C6i
         h/wBg+Cpw5oupBHuhDFRNPFebOBT5He9ILosFAf313EvidS1JyLfQYtzLcoquC5EGASr
         CKr/g7XS1J7UIQ2gRYKEvi5l0jV2C7sKJLtkkAxdb4pYndGlHLwVowORsVeDpO+Uk3CO
         M1JQvBL36WX0mqPtNHoKfbZnYm7Lmlvo2qLQYoHWIYdglzfrN2mOSrXbQumDv/gzEJYU
         SuUg==
X-Forwarded-Encrypted: i=1; AL+hErHV6UqFtQepTP3uWRKEDL6Uq7fG4OC5sA/QK4En6lajNAkus01XXdK9cO9Yar/Q0/iGJABdtwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89a4yq0GGdLyAMeuHJ1aoU8p466ar3t8/au1/kClJ/DNS6N/hB
	Rb6CG8vMQiD1DTBQAU+gHpZQrzzDPe9c6lTBsKKQNOtHr0zvh4YqenOhmaDvbgXwpg8grFAy0Sk
	XvzXhkXehcmVLkgDt3SnIt72OyGP8XlwhNoOwyrhDetoYGlScdZKaXl0moGA=
X-Gm-Gg: AYBFou2nT8cUpy05Gkk3ZLCtjYsXC/mQnw1ob4M0PDJ3T9DoAz12iTKnQoKTDpcM8xJ
	ToHZ2vt3nBHLA4igjwafITpNBrLA8C7xHUUWFieizfLtpXDHVfMAVuO0dCo6Zh+pcCFktGZp3c6
	TBzZFGW4aMfGcwbxKxJudFDDD4ErniP9lwmOW9rp/k9UXk0bCJXY06KE1azFPNSIlbhAUkQ+XnN
	E4CO8ZKaqTnz5TEmP/5WTrLIkdaQiyo4vRxGRbIRDRKONvzBHtYi29tgz2V5lZagAGd3j0B7nYD
	pHgbRrVfZ6U1NrgXt42d6LLqM5TsX1uRDzlqZMHWpuA+/CavFqEv65lU3qKHU8AncvbAZ4Ra4Ic
	oKYzfaIufSUcw5Bp8xGr5vKZfUHOZcj4i7g1Or0xt5k2BbCPp55M6Dax4eBPXD1NdrzDAB50r/6
	wc
X-Received: by 2002:a05:701b:4553:10b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b531e499a1mr2421694c88.8.1794846194075;
        Mon, 16 Nov 2026 08:23:14 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b531e499a1mr2421666c88.8.1794846193436;
        Mon, 16 Nov 2026 08:23:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:13 -0800 (PST)
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
Subject: [PATCH v3 7/9] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:46 +0530
Message-ID: <20261116162148.2864501-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX20viTI2gMe03
 yRl4KUIqqAsEqYwvvNWI7tFUKZm9cKoGfnGG4JOmKFJcKCV17L1fdag7nDN1WHpty/Y1SE3rePI
 VROTvH6RbEElNogj6H2gdRtFBXOrU8Y=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb2df2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tFPd4D2tFowRDCwbfnIA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: FEuEeGyhdSNu_haZrJIHeq15ChhgNJEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX3lQzRm4j4Qht
 k43SXMshcp3TYlFeD1dGQqJLxdcoTZ9nZVEPGDtHX4TssOwPVDO5rjVB9ZohGs47SyotRiyc1T3
 iMDUWeaULCmSjnmjtTl9IOBx5Gm0YRgA98PZjNmhiQIjhNgnRTFMfWHCawGDdvl0SVuYwFC+Ej7
 5D/FyRv2VCpWxZDoXLuL8sJQNCZUBBHUn1AiDWc5C1gdg30nITclw/tSZRT7fsZ0keOUGD3/AJx
 rz8IwsxMVkkHDDF3XuMidPj2VnQBC9FZ2bYA2avEcNaT6t3Meb8ZEIDwgwq9ME1hYmaEcTxdEa+
 BlW6QCcisVjY4IE7EQpl12CZQQuLfW1kQYGJQH5DurUAcwYNwgjcMIdYacG+D61OpK6/N8V03pR
 1/GzFVo2zSsQ+siF9CsILCPIfLBBQ7bg7aMau2ze9rL3ftlZIeKU3lVTfsdZh2ugbaF9DLe8mXG
 Hg7UtdnJ2OCs3trCXyA==
X-Proofpoint-GUID: FEuEeGyhdSNu_haZrJIHeq15ChhgNJEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace qcom_mdt_load() with qcom_pas_context_init() +
qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
retains qcom_mdt_load_no_init() with the caller-provided mem_region.

Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
consistency.

Acked-by: Jeff Johnson <jjohnson@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..75d3141f968f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -418,6 +418,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context ctx;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -451,14 +452,15 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		qcom_pas_context_init(&ctx, dev, pasid,
+				      rproc_info->mem_phys, rproc_info->mem_size);
+		ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -492,7 +494,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(&ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -1056,6 +1058,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1074,14 +1077,16 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	qcom_pas_context_init(&ctx, ab->dev, pasid,
+			      rproc_info->mem_phys, rproc_info->mem_size);
+
+	ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0

