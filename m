Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758370;
	b=Qy+huhOKQ4OgEfNK9DiD6ffMJ+qgKm2XWkx/0+Ldpq/25MS3ERX3aZICHMPSeSB1t3T+
	 CJnHQWtZoxn0wMfRWj2G9PFFYHXmOhce3hIDVdRloLUHApPUfBfsaFu46q/kyR4JO5HQe
	 eXFNQ0Zg96zvblJV6kaW8A2I+ormzDZwppdMbmFRMQe6B9NSFdyAb0YlDhx9gm2j5mxeE
	 CGSDmdr+Ns52KqyvNYzNiONahwvONTKPIrWK5BSUht/8ZkljMiykBp0s+3xvjrnuWxnrR
	 D5npI/4HJAMOIwD8XWosTEZtvAbAD8q9EeMSICjG9hqVW7tkRXL7rVVq9shJpEqCfyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
	b=vlFXqNo/cI21kBRIMGlyuXzzEZDi10px2tt2Gz8krGvlJisHpo3N0chGp+j8ju15TQjT
	 aS+zGRhlKFjaKbNULDibmIBFeSVAurs5k/UbIvQ0y31oknhiBDbA75MSqWyy2IEk++e+k
	 /Go9zqVdp2tzDtWsndYTKMRuiLnNZty7bon3F4n6KewZbxw+/XPRkcCArtiCm0a+gpGZq
	 WZop7JqCCWQ0oUXUE45qY/TzXdUMxcS7ayztgZa91EZnrvLbxngdWxp/a2aoeVbgbo2C9
	 sglrQJJVfz0wuq8dbMAGb+ewhYwmXRGQsESGXG3JJOMXVYuCt9fGVKRsIFNAst/jFyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QX8AIqDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y/AX0Q/r";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B7606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366B7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QX8AIqDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y/AX0Q/r
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvwqn3864039
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=; b=QX8AIqDw9EUpdayh
	pMtKkspjplitviDn8nRK8PEpDaxbZmLwQuGe3WeBYgQmmeWJrHvzb4oogJ9jRxuc
	74ySR1joHvzYxkrrzgq7dVBL6VLB5q00rAK5TZmOeb9ez6PRKJY3Z+PRWzTtBBp+
	Tp2OcWmgpN7+XpMMbwD3eN6F2c4t8QsD23zyXd8gZKDsJsrgpprtLHnxZ1LAx0t0
	K4KunrpuzT97TaWDaRR0XZ51x41UjrL9hYWDdOSHUTHuLOmQfHic9Bq4IsrOgyMb
	PoVbLnS+Vx+1aDeSc65PchQB6P+m6rb7WkI2G/G22yEKv/Ryc2W9r24+lKSXu7Ps
	5w8Pkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55sbu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:46:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9417222eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758368; x=1796363168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
        b=Y/AX0Q/rWYrbHmpvSDVVefNL3ygHbo7bsEcAE4E/hpdl8qA7sDNeiSjHCYjuu+2Xou
         yL3QpzrqaxFqdf6QGNjKj/UZSjOlBbsbMEtNiNpvRX6E/18Z7Kt1SYsZxRg3jVf8f688
         q2KqWpjwsBk93Zpq8Tsvx3wpbQJ86FBTV8RQDT9mH3cU1ra+94wD7NCA9PM2/J1qNT8O
         NEWFxlMuYG/TuYbTot73mEhEdCFn71149iE+nPuiULFq8mDA8PC7IilWK7YId1hagJAI
         u/BI3kIkNh4PdgPGt0C4eDjrlXD2BA54r0d8ummtXcuHm68GYpq4Qz09T36VJD0Z5c+N
         /Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758368; x=1796363168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
        b=PShJLPWZV+ixv9UVsyC6uEDLXJHqJ98ac39lHUr9gPpBsg53wphK424eQNLPt1Q943
         Ypyt1nPIemvvTrhSAvzN6AySgxgCBslUHbL8RgKJZ9ou24HPqiCpHLllAepgrrjsfoCB
         1+InwA4tVNF8vwJjv1m8ceKSGeHk4o9OJMsTjFTLWpiT7/CEzCiH0qgUGwMjH+W4vgqW
         Q5cC2jOoXoAMOrB1KQHg/yxGlDjHk+pCL7jpuRr95NuSlh5GqDdfYlwdNdnijJOGYA9G
         83gel8F9zRzjPLIW8c8kdLkkaQsBKDH4qw73Q6S5LwL9avdSelYUajL5EGqKbQkWbna7
         W0Kg==
X-Forwarded-Encrypted: i=1; AL+hErFDvhKDw+ooiKOoJBWoUzCxUG0VfwEwtQNqpcdk4VeSifwUfLSL5k9HvILEO9fWySexK3fAQAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UgRT6ZhasTvAvIHHMe9T6/W8kK29uieX3x86Dt67H9hj9Ddp6
	si1uyt65A6uhUXUfHe/xpWqVUAQ67cSfvSQPpx90mIZPI1YySsVtPkoPFD6FQuttD3AMMvIoWWs
	vfTnSUYJ4u2EZyJaNLdJ53U+0a8pzJ1UenEmw8nlcx+q3omUVMHRBVtNqKC4=
X-Gm-Gg: AZFdTZc4ZuH6k3suOv5Qxex1bsBzGzvFwUSXFR41CdT8I3gSjOWnPTmPdSCexKO13Da
	Yu6wvy1PODeKEvfx6KYH9YK62I7xHMcznsAOI3O1I0dps7OJ0F9WUS9JyjybNSRaNeFfd3XGzh/
	Cyc3g2Cu80EEqosXaXgQvqjumjTaLPp7dYx5LeSXEpGW/kwM2Ex5GHSubVBUml69ieScFx4Sg9j
	cYahmVRzWLl7n2DkK7XagSujr0ZS6uLbyVnBk3VFm6q5VyS3fYULxlbQF1MO0wiMH2HKuu5sU5Z
	wTZZMyPmf1exHuO3poopyN7+eXfF8QPwicRfUjnK+LJNgsSsUtHJyK69Vo23CfbpxITtrYUzkvM
	k207KTCw5WF1JaM2xtxB1grV0EukLGiNyKq1wmWTSL4VyCPjkJroifS4r3OpRgM7burWiVl1ebL
	yBtqAm
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr22911653eec.20.1795758368021;
        Thu, 26 Nov 2026 21:46:08 -0800 (PST)
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr22911611eec.20.1795758367484;
        Thu, 26 Nov 2026 21:46:07 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm77109128eec.24.2026.11.26.21.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:46:07 -0800 (PST)
Message-ID: <f7c526c5-78ae-5369-ab22-2d6f93f9bec4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:15:55 +0530
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/9] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        linux-remoteproc@vger.kernel.org
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX6kR8sauNCGH9
 SVRj3mY6OikB9qypK5uGkITtgLCLkWHLCChN7MQWoDZUQjdOGlIDVRx/KGmfGhxbvAzg5dzRvvh
 r4OcICaR59dITvkFwv7wjfXJrNWvtHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXxLVa3hc6M+VZ
 vqY7di2ErnB5r1yAcNP2C1uLdXwhdqm0uXZGWWIO89xqkwSsJS94ayB7Kvy92jsGf/OE5foDOVE
 WBAAm/3rYTb4rh0fF4xDoLRsVO3aFo/7Ey/QPRE/ES8J/c6MUrwUVizllM1DicfvUxoMm0tVSwx
 6eaRhE7Pbv/11HQyqSFnmgEbQhb+oF+ctd7Ds78UEpR9Ecy4Gp/JuDbefXZIH6XIWVOxDw0P/sJ
 DLlqbjfLHcOznQ7O1c53VJ8FjykL5l0WOMo4jhSDyyjq5u3teqyrF0+VE7ysOvqmz+E1q/KLf2q
 TugvB3IkWV/+bsVeT7MVQclJsr5x0813hLgk611xlTxCwjT74V7A9t7gCbs7GEce6RWUa4RB6Xp
 uvuOL7+/xvpNw+LlnAzijS57yYpZgFp/uPFtC0zZcZda5UK8OG6Uguc1Rq2ODgXeqvNCZOPYegF
 ctgVXnjYyoIIni2GXuQ==
X-Proofpoint-ORIG-GUID: PH0cNnt1VSPvhW6V2Yp-YKSsk1uH0TjV
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b091921 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Px1Cg1egfbfzpgs1NNIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: PH0cNnt1VSPvhW6V2Yp-YKSsk1uH0TjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022


On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
> metadata initialization, memory setup, and segment loading into a
> single API that does not expose a PAS context.  iris_fw_load()
> calls qcom_pas_auth_and_reset() for TrustZone authentication,
> which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with
> a PAS context and can handle everything qcom_mdt_load() provides,
> along with additional functionality such as shmbridge creation
> and retrieving memory from the shmbridge buffer when the same
> remote processor needs to run while Linux runs at EL2.
>
> Embed a struct qcom_pas_context directly in struct iris_core and
> initialize it with qcom_pas_context_init() inside
> iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
> with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
> with qcom_pas_prepare_and_auth_reset().  The
> iris_detect_firmware() scan retains a separate memremap window
> after qcom_mdt_pas_load() completes, since it needs to read back
> the loaded image data.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
>  2 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39..ac73bda072f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -129,6 +130,7 @@ struct iris_core {
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
>  	struct dma_iova_state			*iova_state;
> +	struct qcom_pas_context			pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..b701a7f43514 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	memset(mem_virt, 0, res_size);
> -
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> +	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
> +			      res_size);
> +
> +	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
> +	if (!ret) {
> +		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +		if (!mem_virt) {
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  
> -	if (!ret)
>  		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> -
> -	memunmap(mem_virt);
> +		memunmap(mem_virt);
> +	}
>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;

Please address sashiko comments in the next revision, as they are only minor.
With that,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

JFYI, depending on which series lands first, either I'll rebase accordingly,
or this series can be rebased on top of:
https://lore.kernel.org/all/20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com

