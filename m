Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846156;
	b=n44ydTY/gb5bwxhCrjhlpn5sJNMwc2Slbh9EPWGinzxZzB2kOBsHCUWt0Z6gG+QUxvZU
	 O2G5OHjJBpNnKzfgaXrhsmNcdxul3SIjbosg8gHODa5w+IEu3KpnITgxvt9pKrFEK5Iza
	 d+rUW/tW4fCOapIb+onGyUtPHgX/Mx1vmmdwt6RxyACQpeCsVn4GtA9fujK0f1RDZqnbP
	 1fsOYoQPyxoEsDQJtffymcOciq5HsYnZ/w303pjtSAxX0Fp1z9bEFvnxTb3s4q+gbCm9i
	 ZXFwUpULUwslEQQDr4sBbpsXTrDjhYFPzK4IDbcr02mwtWgoNR2XNPXLAh3bFH9WH2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=vXRGIf4bTUNK4sZ35IC+ZUbGkUAsE/RIo1IPQda9lr1lLOtBUq5aD2ngvdiX+EArwsHC
	 gukiXwJe5mbdP2noRoKMJLb6C1aE3eIG4lYGqHH2JxaSEAfC78iajrsaLH92q8N6vVA2J
	 /Zapkr5AkZRnTM1kt++I46233dQ6nOq+AQZ6/BezOvFONP/0MnATjRVwKu+CdXCmN3WWh
	 CmZfXvuqK3jcJLMZiqOxY0cL6XKBYWPMQDBXIpvvNdLAMOpPIqPN0Psd2Pr8yVcfUlHm4
	 NtZpyCQahhSg14UYwBQkEOtoJMF7ndbyLgLfLpieAOOINIKAY0JQoUYk+FhpBYXC3pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KKVB/IqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aXW/QU7w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7FC606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7FC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKVB/IqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aXW/QU7w
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGI6FM3045193
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=KKVB/IqJmIHW43Y5iX/SbkcNv6M
	4wqpIJ0CiEte9tqfaDQrZ9zzJqnYBCXMghfBaExOruMjXJ8ySaPDeUAOikyeXHjA
	IDIh23CX+6N9Hv+dhZ9XUPvO9G+2D63QvC76GObIDhBkOXCjyJ7NW1Il6rL0i1gK
	et8Hi2v5ywKSBGtMzY/ChlxUx3+cmrJHZlDrf1LZubrqw1mnJ7X31N5/Lrr7zIUE
	YSTuEFj5Zes9LFQH/0eCVzIvvr+A/Lqhx4SlG8pg2z3t4ZKjG68W26dfQfbW8Eit
	IHcgJZ0bUc2vLc731T4bAv1gXUjt3SzEzSYm/1aVm+lW9kc+w4K+Nh4UR5w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m8k9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:22:34 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so1238188c88.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846154; x=1795450954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=aXW/QU7wwo0KFJoURXoHe2aKBWEOXzCDZXZFqQ/dPY34of0n9KFFSmIgZ+eT5+EF7O
         h0qXD2JsIH9ZSUSH64HYjkrPt1MXGDPYffxyQy7jNdTQkd7wLlM/por0N41ydhxE/dit
         r7M2/0yhpP2HgRwQfFSuziYhwTIxUNBLa40lJRQgE/Uz/mDDX9tAD+E+QM9jaKA8HwPF
         nltSUXEEX7x4h8LRz9NegWLjGR6kkmE0hLVjRGcVA5zIB41DxGv8kwYOEF1zeyXbJ1B2
         cgrw3kNMtr/ZqgnJZG3HlEc78ZDydaZg5nqQddOdvvDFVN1tYobLPb1VeZK66U43veuB
         qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846154; x=1795450954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=lC1/G44QA9AZixB4QVS0P9J5+QEOkmshu3elnjqaaHpZ7I5fyZoaIFA4XnCQrwP4Sf
         s+sgZpHKlhGr/5j6/Bdh9ongHCW7eldIiBTcCp8CVETuinHGomieZeS5l92hBZfYcxj5
         RpSTYqzHkrCLEF5K850Ytfy7A8UtGE28ulU8pXL1FgYNxjLmABRMdlowuK+in+K0CVuH
         WNKmJL4flLpbHuP2sKe2BvZON5HR4jDkK5HP74rFXoNAGyHOVim8vR7wPjYuEkOT/GeZ
         nqce68uWkuVlqIsH+5oMxstgLi0WimTg+WcmDlJvJ3C11KDPE9KGw4m16HySAz2pLXQL
         BxJQ==
X-Forwarded-Encrypted: i=1; AL+hErFMlWE+UFXZS/oJIo3jNRj1pEAiXU+MrR/UpyQvGXUxzNKtCRTHdtRKy3ag/p4qcln+pLcnTj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v1s0y/KmMuXajVc8U1unGpaEgwgVJcKkH3THMO8YxHQ1idhaL
	S0hnIpHy+NdEZZvx4TsGNZHV8tD/g97zQhA/laeEVfWcHXJfMFhCmKZTDodkbnbLYDnMbrfYBMb
	kNpVJDCwnXUWG4oJJuN5+vcT3CF9r6fq/K1g+mvjFWh7rlq8INjzfmubnBWQ=
X-Gm-Gg: AYBFou0vSvQwFqb1NYgaP32y1ArgM2NSp+66HucIcNbJTiAtW7eGAsnXWbPM5k58n/z
	ibe+dpTOSGWf6bLj5Eel5x+6Wmd1qVDMmXF5RRqOwWznmzRHsST1qXEpdWV41BgqA3DCbfnYuwD
	FJD+kEfDWeJqjTjPoSbyqxN6OMu1jZSqx1Bce8Nvwjy9DXLzomD8iWKQPnTcCKK1VBsXIidbtfa
	27DoDn9Co+fQ2alaiouGkhMm9x8629hAyzyKKf4nTUSeidAi3bpAI7JPTgsniWeSrUTEFmuPW6l
	REaguJjjmQXac3RFIXyJBL30BU0Ph3OKqBqlyYF1xE3BFv5VYWavIgmP/LQnmUAW7Yrs52iLVaA
	O/yJE/eQAH21y4z+A1+KDrEoE/OTORh6CcLF6JdiVCaph+Y3BBqu8h63s8eXsM84jy0p7YfTeVm
	ZZ
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533732c88.27.1794846153715;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533694c88.27.1794846153043;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:32 -0800 (PST)
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
Subject: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:42 +0530
Message-ID: <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX0fIW8lvqgwSn
 bzE9iOwn4mQ90Qjd2VsTHRE/2E1WBx8u8FgoAIKlmwQELWMWjZyMRNfWWtjGYMexiPWE97Sd/nt
 IpmVbgucAeIUkR7idwXJFuKmcqSXYTO62Lt0KS+XoHD8vu3Q9XaevyBDL+1981u8NDoGBqjdKU7
 SWbYjqJM7zG85iA8I7rj6QGSZKoXaoIS/misT8obf3YcihLWeH7ENaBi6/DrO5uyyE89UkG0ftj
 rmt8gS2SP5O1K4OocLdyX09fDqa9THafWEYseBsDCC8pA2M9YECTIMoqdUMuN+MIVSf+Ls12EJZ
 896dtxnnSCva2i5YiWD/rxU79EdmJfyiaD7aMedwwezVC6HSDIX1QUNYTL7bxJcT0nacbFBcU1R
 oAoyizf6/khzNZx8A1kBnmuWk/S+Of9M3Evla2UDTH9Qvqd36GwRlWtdZnPf4r28RYnNc6sR6b9
 r+mWAgdQ0EIDFFW+3Sg==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb2dca cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 3ltgSDt5c9Zm3AVaOYThezYs517rQ-xj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX7U84jhowMvGT
 ljt9fqUOoE1q2VzEFIUhcG9kqtU15MW+sZF48X1GjmQZEz0+Alc26hFNPDqbnN/8QbKGptdk+Ig
 hGNcG17ExRrdBdW3SNhb4Ubt5YCsq0o=
X-Proofpoint-GUID: 3ltgSDt5c9Zm3AVaOYThezYs517rQ-xj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

zap_shader_load_mdt() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context.  zap_shader_load_mdt() also calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is the
intended behaviour.  However, a new qcom_mdt_pas_load() has recently been
introduced that works with a PAS context and can handle everything
qcom_mdt_load() provides, along with additional functionality such as
shmbridge creation and retrieving memory from the shmbridge buffer when the
same remote processor needs to run while Linux runs at EL2.

Replace both with qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
using a stack-allocated struct qcom_pas_context initialized by
qcom_pas_context_init().  zap_shader_load_mdt() is guarded by a
'static bool loaded' flag so it only runs once; the stack allocation is
sufficient and avoids any heap overhead.  The manual memremap/memunmap
pair is removed because qcom_mdt_pas_load() handles memory mapping
internally.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..8e4aa8e22108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 	}
 
-	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
 
 	/*
 	 * Load the rest of the MDT
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0

