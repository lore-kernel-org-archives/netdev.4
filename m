Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846126;
	b=eOpklYdz9lC8ufAozapQXEM4PCB+DB4x+NziKfqYzD8Ha9ZqdI8lNUGYRGUSbwR5//d8
	 +jA8T73/4eQRHXgjNiaYw7NTzUlDNmBzJBIVwqoGkxBBv3WLhFvcS8iGpIdaApDDsZWai
	 LjVADVF98TYMwN9Mz0+J9iA2kz5Q3l6FoQA1IjwHly6ImfhQgd5L1p0AJBVzf9g/2qxzW
	 FnOH6GRqVEvBl15NHgpgUuZldPevDOGgCMocFWMcLbMm6dhIsLN4frinaZyjXJJeDzUIh
	 lIULboWM/WDosKUr/fs9zXmZLemLWFSg164UWB/a+Jr85a7cZH4B5cvztMHFDFvmhQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
	b=Z9efHez4tWfVsbwSyI9s6VR0ZnrV1FSRbtJyCrtaY5JpKK0+sXA0GbYfN+rPJ4ncMVOU
	 GaJQLsxbwXLT9tjrmpne2swku/LtzYnPVRk2/g2EAWlmAuwXVvtlaUo75V5OaqEFzHoPb
	 bImpAzD/boQxLaZXbzo5TAO1OFKIU/dY7kCD1bClygYNZkl1rPK90B89C2qLU5XgespYB
	 HvEJyPTcJzicuw70DPACWWbZJ/Cx38GllIxyEEydZ1FaUpVzr13Oy6fwom0KKzuPOXiWv
	 oUT6li7m4Bn2Mtv4Do1csSMjZ2OIYIWkMik2bjaPrJo/iQEUztK1AhmeD0GKn3EPLew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn6B8mkZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C25606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C25606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn6B8mkZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK5f33692944
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhh
	O4gHPm10=; b=p7OfNETpEr68CLI0FHZnru+WSdSkOWcv95PEkSOO17XhebYpD14
	DfEypxXf9qv30Nno20G5GbZdH4vUA3yytNSqTdr3jQyerOMYoNX1kbXLqUeE8Xm3
	z2Amb0sNDDdy1hNjpFWoKsJuhvJIplQtmtAZGdMXE+f5NlINe+yFbbK4RRC5Ytyb
	tAUx0aeQRf8n+viyoAihM06FWVfPSZD9kU71jhEz7na1nkNmtBuqcuBgrY+rrbAR
	ZFAyEDhlZ/4gSypJ2dXu9AQmSvDFrhSrR2tpFFbE04k+Y47f95sguXhUF7fnxqGz
	TLMba/Bnqx6GI/MB5R1SWBV8ytMR4dK7m2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8104k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:22:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so5163191c88.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846123; x=1795450923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=Xn6B8mkZSfmNeEcNaeCxnrHt/+2ZgdGHpcMa5RaA87K7Hbkk7M4aPYMvkrEhFiZ2vm
         Rar/ENgh/HHaZ4bTPH4FLFFlLcYSD3ATSZWPZpgLjLTwMNzBByyDlqWlJauPNryGHRlQ
         69591C/kHb280LmTy8Ch9EnuOFohfsuDTq+ZGB4Y0GRLTQXv7SCQn3Fat0dxcV4jpmNN
         SZAWwunZ+vsmhJKbvFDN4/moW3PjPJ/MCJV2HynRxRDHzuv69KIEFUYweqkseCQKSzHL
         5T4Y8lJzf+pyYLvjj9R3S4KhJ0470t2TdJLUmP4kkJETvASA6Ha67lfn+432dJvU+PQI
         Vd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846123; x=1795450923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=eR5xeMFHDqY09XOnpULP1nfiOtitlveoOq9g429SRP/tL0abdwOc21Fh8L8CFGOJwN
         1Rpd6CZb3Rv4r78GLL1B73n7tyGgFv9yo5LqGe7rk9Uwz9IOFQVOhitTGfJ2AGubLhok
         2mIfhDROA5ZO5rjZkyz1it9x6gkJtUIZxt1SAvf6NTlcFYmH2f7mtUVScT7v64IPq+Jv
         77zrMgVIRj6OozJoVe023RqYhPrGuSv9Y+cNQU66x+xHa6xWYmwIRqbRwyyfuzennLF2
         EB7Wigw1i9oQcp/qHyo4nyARosIqSWgMYvr/a6VDOuLVWpbBrTMgVFXbeIom0Z6C5PXu
         X9aQ==
X-Forwarded-Encrypted: i=1; AL+hErGCvd2U8rjYnyf8g0BlMORh926H7F42sxVyZGdbbri+2hz9FaKYPEDJAy3ia88yVrz9wSPPzLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yMSBfx+D10ILiguwgKD7wmdM/i597nbhIzIksUDt0YZ77UJYr
	cuUqL++KTZN5iSRzNf+3jXOePeC4PXoEljLPkMETy3YxkfykOaAkT5ODyd38VSFuMslnXvmzfcK
	wnw5ko9/UnBwr1iZ9/06yhn5PCv0c7zqcMoqmNLVTK1vh5vL45hNAKwDF+6c=
X-Gm-Gg: AYBFou3IcgnE1ap4LKkvIREONRKGofnBE08sW4VrgFEXxGg5wrur5yGlVg5xEWr9hD1
	vjZE8t3GJjKFMwiql7Adxmh3VT+nmHxq2hG78vyMqQgTgCfHGjXNQGMwqYzflbLP3MHJWxkExfx
	WUU6QSqH7/6v0IMaelvegLYnaN+//gwnuH9jlGQHxYsQpTScSwmpXUqcSXnRvfxpCjZSodlEoT2
	NgZ+cnv8OX3VI+rzj8cyAdUMWANA2s3MGn8KCcEIgnY8hfxEu0MoxncRWlOHYxuc5kcsvQQMh0I
	2ccZMpIi7z5aawp6U5pNtWvcDC5WFF+BtALPxkw7iPWqXnI3EV2kwHYNVtVfBnBJ9fI6o2h+AlC
	Pt/IrjG59J8qsmtkALD1rZj3Pw9qOCG3MkXAh3VPEYyOdQTX7z5MsgEAJVlGhjXWjo0HCT1CXnS
	0O
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928398c88.19.1794846123201;
        Mon, 16 Nov 2026 08:22:03 -0800 (PST)
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928366c88.19.1794846122515;
        Mon, 16 Nov 2026 08:22:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:01 -0800 (PST)
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
Subject: [PATCH v3 0/9] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:39 +0530
Message-ID: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXxATmQVB2btQl
 b40Vzc3s3kWJy33MrGRVNIC0t+Xbo79MkCUzMhThPUoWvemD3n/z5hfl9nbh2cOOTo6JpWCIJjd
 mjfcl2iW7wFPGmpV/pZ8S+0leVpzdaLAGI5xgTzxE0nIa1RCWvuF8MHp4zW6CR7svFuFnfiz0YR
 yljaKgHJDhhtx69DVfUljNxECKt/D5Kch1gyNp2Q0maDc/X2gu3Ot1t3zIX4KWN47OFFIDsJ90L
 hivmmUEghZuL39egU4MuwqHhQhPuqTxNB4te13gMrWM+x0Gj/yQBaFrHGD316R6PgDdnyDqKHZ8
 fuOPEkB90nLMedWY6ucugu2HC6BiSR0cZ8BKpuoIfMMDQU22uoLskF6Abt+9zJe9F1RmGrJ/3T4
 DfDrdllK/xHLBNvFYPqw13gEJQyhXsC/QwUkJ8ozdRmoU6d6o1+VjiZ4KRj3caqRgd0Vsf2Z4cd
 yfZn5lc8ITyX+rTtnsg==
X-Proofpoint-GUID: guIk2hXUyVsQpx8SUnqYteVB2o63JmWG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX0/eyI2dEwssG
 jxAJga/+6JT5zVHKy3LEuO0UjybRrctdocSeSIfPGxcl1BGLEXlOKx3BdkpMfuvhhj28Imlax0V
 YtMSH6t5vJsUXvuUE8IG9RfCcsw3gqg=
X-Proofpoint-ORIG-GUID: guIk2hXUyVsQpx8SUnqYteVB2o63JmWG
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb2dac cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HLFs0uR_R7ZgEvxmAyIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
public function, migrate every user to the new PAS context-aware API
qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().

This series migrates every remaining caller of the deprecated APIs
(qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.

Requesting the Ack from subsystem owners to get this series merge
through Bjorn's tree.

Changes in v3:
 - Added Acked by tag.
 - Fixed build warning.
 - Link to v2: https://lore.kernel.org/lkml/20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
 - Addressed Sasiko comments.
 - Addressed Alex comment and added 1/9 as new patch in this
   series and use the  API to other patches.
 - Commit description change.
 - Link to v1: https://lore.kernel.org/lkml/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (9):
  firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated
    context
  remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: iris: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: venus: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  net: ipa: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  soc: qcom: mdt_loader: remove qcom_mdt_load()
  firmware: qcom: pas: remove qcom_pas_auth_and_reset()

 drivers/firmware/qcom/qcom_pas.c              | 42 +++++++------
 drivers/firmware/qcom/qcom_pas.h              |  3 -
 drivers/firmware/qcom/qcom_pas_tee.c          |  6 --
 drivers/firmware/qcom/qcom_scm.c              |  7 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 22 ++-----
 drivers/media/platform/qcom/iris/iris_core.h  |  2 +
 .../media/platform/qcom/iris/iris_firmware.c  | 27 ++++----
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 29 ++++-----
 drivers/net/ipa/ipa_main.c                    | 23 +++----
 drivers/net/wireless/ath/ath12k/ahb.c         | 23 ++++---
 drivers/remoteproc/qcom_wcnss.c               | 12 ++--
 drivers/soc/qcom/mdt_loader.c                 | 63 +++++++------------
 include/linux/firmware/qcom/qcom_pas.h        |  3 +-
 include/linux/soc/qcom/mdt_loader.h           | 12 ----
 15 files changed, 116 insertions(+), 160 deletions(-)

-- 
2.55.0

