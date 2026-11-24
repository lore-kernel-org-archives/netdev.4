Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543336;
	b=CP1VPQpZoeey9uUsvLAttXGG04bs9xtqkPSiXMT4nbx8/MjzOll5Uk7uTmIsgxe4HoaL
	 I33+sIKWv1rt+o+B6zmwGyqxLkH4Oy8kP3Vq7r5JC/wmboRNdGjPbJib4Da7ofsk8EpJ7
	 V1+3R1G7uYso+3neRqzpZjNm4uNHkNsezDp/4yw/vRvTpMmx/KDcIz3NyEuOTMBMaemVD
	 so1AeW5WYkwP1l8tyOdnPtGYfoVxXSci0ClUtdCJrxRvVrIt+sR/h/LVvgo8Dyy+L9yJe
	 yXymtP6QIHLFjPMtPmcdVfn4wD9Ea5Euhd+hMxIqs6g/JinjKuzOWXf1oK8KANzf/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7vVL+O22Fy4xfBwvf4r81a/dEA1a/72qiNfr/2FpCxM=;
	b=cDTJA5YJfPWXjhTufjVzZTxO2fMJwt1GVkBxAPfZKe9gk7UJbIybSfF5fjUArkmWdsXT
	 IQXG1J2981/tIkEd1RFwdazU+Lq+Mj48JMaE9itsc1aoH/kW/bMdJvL83mS7YzbwHw4TW
	 GBHTzI/3HXKBFztASGglTS+1vfJv+Q3AZpQMIoVZ7Frej9zgnia5fork3n4usDp/dKBJJ
	 PQE+WoNt+PRX4U6JRo93CD0TFxatcAU7MWrBPf1Hudx0YZlrvxXsf99NStZPmYtD2KPEC
	 965iTwA/eCuN5p19gRzy7pc2VwS5Oh+oMI9haU56GXU+Ya4wn+DAypBwDaRaTZ9uilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XF+l6G02;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91DE606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XF+l6G02
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKdr3267085;
	Tue, 24 Nov 2026 18:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7vVL+O22Fy4
	xfBwvf4r81a/dEA1a/72qiNfr/2FpCxM=; b=XF+l6G02+pGjxZjEhCV/pZfVrus
	mqHgiSOxNZgHoaPTZ+poUV+BaGPjXNhEcIF+S+MxlRQpKUUcXAKdgdqMKRU9rjqw
	N46qIXgAN2xUQ3UbLD5EK1pOYPwh5z4B0Y+jzJ5To7GPBz+hot666A5bvFkt6oDI
	ddHhXf8SsZ0wr3YL6cFK7FdbnyyVKgHnpZYmxytXXxiMdg593v0mwZBg+fNVW/6D
	T2ttKEzqK5t/i5vw5HylmjdVQ2iVEGMfgWaxpMJShyJkqyPb/vk1fi56Y335IoCb
	Ay3N4mgv3pwWLjOHn3S58HYUYVx4e1jqeh+T4jBFea9PAIXAzCNQ2jPmGug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7smys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:01:49 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHvYoe992721;
	Tue, 24 Nov 2026 18:01:48 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com [10.81.84.220])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AOI1mDY999514
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:01:48 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 4696302)
	id 20A432238E; Tue, 24 Nov 2026 10:01:48 -0800 (PST)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
        riana.tauro@intel.com, aravind.iddamsetty@linux.intel.com,
        rodrigo.vivi@intel.com, raag.jadav@intel.com, simona.vetter@ffwll.ch,
        airlied@gmail.com, kuba@kernel.org, ogabbay@kernel.org,
        lizhi.hou@amd.com, karol.wachowski@linux.intel.com
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v5 2/4] drm/drm_ras: Remove admin-perm flag from list-nodes operation
Date: Tue, 24 Nov 2026 10:01:30 -0800
Message-ID: <20261124180137.616249-3-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124180137.616249-1-zachary.mckevitt@oss.qualcomm.com>
References: <20261124180137.616249-1-zachary.mckevitt@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MCBTYWx0ZWRfXxxbktzot0Do1
 dIeIbZpO7ieCMD2tiR82P2mM8gkMvAfuB9Hm20pISpV5sAEn/F7bIe3MgBiPPxrJUx0jI7zyHQy
 bwPgYEprtqjs+uFBMnx9cXX8BrKcj3o=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05d10d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=CU0-bA9xmp4BjaDge1wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MCBTYWx0ZWRfX8Lkg1TYnygFH
 LSw2GSQj0dMSeF4EidTpyG27hMRmGQkzxbPQmFOdycuzXPXYvrfrv15HFUH2LlGqG8460pfoyIf
 mcucuBQzPIx4tZmZ7kfqyD1wLaHCug8Ats3TCYku+Wdu6U5YH1DHI1yq6ubQmk/4HAjK3WYEeQs
 GPOC7v0jubCKGTdDdMiFumojDHawxoHCsFB0RylKKs1lpT2sSVj8Dc2SA0ttE66JsvFHBob0x1c
 3HjqGY7eeTsHTpZ9mIL7iuQroD0+2DDjtLMT9nZ9C+VZTCbu24JqAX5dHI/oXvtE4YZrHYwp4DG
 iC6Z1M9hjhIKhFtL9azd4A6UU11gVk8kiJuNsaw2PCtxhZ0bSMjoDeSaIsdyJSRJhwqYClXKmd7
 qMGsj9EXKFIJdk/57fivNToFoYdO7CMNApmmPpFyZDlCOGHkvuwc8yMPktj+EYRb22HUcM85Dc+
 tWSBCBp3FC/Dd4Hh2Ng==
X-Proofpoint-ORIG-GUID: xol-gpWVeN2O07h_yy8stNjAyWZc3zTd
X-Proofpoint-GUID: xol-gpWVeN2O07h_yy8stNjAyWZc3zTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240070

Drivers may want to avoid requiring CAP_NET_ADMIN for subsequent
drm-ras operations. However, userspace must still be able to access
the list of RAS nodes to determine the node IDs. So, drop the
CAP_NET_ADMIN requirement for dumping RAS nodes so that drivers
with different permission requirements are still able to use the
interface.

This prepares the interface to be used for telemetry by the qaic
driver.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
 Documentation/netlink/specs/drm_ras.yaml | 1 -
 drivers/gpu/drm/drm_ras_nl.c             | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/netlink/specs/drm_ras.yaml
index 4c2ac9a1ba3f..a88fdab7a1c7 100644
--- a/Documentation/netlink/specs/drm_ras.yaml
+++ b/Documentation/netlink/specs/drm_ras.yaml
@@ -112,7 +112,6 @@ operations:
            the node IDs. These IDs are required for all subsequent
            operations on nodes, such as querying error counters.
       attribute-set: node-attrs
-      flags: [admin-perm]
       dump:
         reply:
           attributes:
diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
index c9f5e0ceb3b5..ff0dc406c27c 100644
--- a/drivers/gpu/drm/drm_ras_nl.c
+++ b/drivers/gpu/drm/drm_ras_nl.c
@@ -46,7 +46,7 @@ static const struct genl_split_ops drm_ras_nl_ops[] = {
 	{
 		.cmd	= DRM_RAS_CMD_LIST_NODES,
 		.dumpit	= drm_ras_nl_list_nodes_dumpit,
-		.flags	= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
+		.flags	= GENL_CMD_CAP_DUMP,
 	},
 	{
 		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTER,
-- 
2.43.0

