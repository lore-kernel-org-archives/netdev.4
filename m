Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.156.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659143;
	b=VU9FyExPIRNibPIQHyC4B2yS1npqLkScDDOvBB/TbZ/mokvrcmwjosk2K87Rg2u5Wbaj
	 M5aHxiL9QkT1F7mr2jkFgdRSnhZcow+0W51zk6JtnVaTe1RZ00upkevSKYLzXJqfeLUsY
	 8b249ZcE32v2qOeTHWEneUIPV704+vQfikZZWSyQ/EAV8UKlMOeqrywrJjaO4KtGtFoMZ
	 49Lt3hc4JiGHJwkEh9z7AQO+8fr6qsUVRVv1qW/2eIEOH/FAyQq3Pt2FD5ZsZ+jKkF6ZL
	 Kr8LEVeD/ZQVNGD9CV597L6pEKUWnY7mvF27HmfZ8MrT0vb5Wpv6+rv3sH+7K69ui1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=cLutpzgR7bQ12PaKKVTTryK4gbCgeHKI+VxxkyoUdDk=;
	b=zpvLLsGyRIGztkXEa2E5j4J7dlfSQS7FsJp8KhCoahoA97YWaeWWYHV/IGfbTPOzzl6M
	 uqqQIeX7p50HvRDNMujtBLNURNi5Z6UnPU03jkh65Moe/ZVUhiYTx44xRuCCeyvoLo8z0
	 GADbqpT8c8unYNN0z7X6JqTDglvVBaxgQdESIIP70NQaJME3ViXbs4pAcSfzoDutJ6qGu
	 i05rh8IpAeHGTRG+EjQbZxnHSUTFwiOwfGT52MBU4ctCUxFdy34zAvInWKHKZSKqqVBZu
	 Rz0LImv2IYvOWLZLDjGVMml1wSRxirRITecePWPnnFVzK8fPAAhGpXS3/kPybGGQ7ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=iDXOlOq4;
	arc=none smtp.remote-ip=67.231.156.173
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400EF606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=iDXOlOq4
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APNgBnh1499507;
	Wed, 25 Nov 2026 18:12:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=cLutpzgR7bQ12PaKKVTTryK4g
	bCgeHKI+VxxkyoUdDk=; b=iDXOlOq4bGiFZ8tndWhlpTEZA9OMZgyzdO1J7nV+L
	nVzChQatEbnhns1mJwx1MGTs2ZU6/BU3MGLvsZyyD1l3tcjVxpYcvEvO32sqR5KJ
	0tR8ijkSKK94Biv9rkQX4PRHVmXStJrTTt2/VrBcj9be8NnmTIvPakrnDZfh9Ee1
	m5FjqrE1/IiRDvVk8ESKBByc0fb2ZtuhrvvWcfFeyrfwFzkdh3zP5PQpje3C0tZw
	8l3DRzptxx91GEM5YGnk90P0W8p3OJsskBKlY7giyo5o1P3nFFB0wosYisTK81HF
	7voPWRJ+znT7MsCYpuwbqWdB7o/z5LEEl33Xz9OVnLIyA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4j5nhf5dut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 18:12:04 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 25 Nov 2026 18:12:03 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Nov 2026 18:12:03 -0800
Received: from rkannoth-OptiPlex-7090 (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id 82C6B3F706F;
	Wed, 25 Nov 2026 18:11:58 -0800 (PST)
Date: Thu, 26 Nov 2026 07:41:57 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Yuho Choi <oss.patchbox@gmail.com>
CC: Sunil Goutham <sgoutham@marvell.com>,
        Geetha sowjanya
	<gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Bharat Bhushan
	<bbhushan2@marvell.com>,
        Hariprasad Kelam <hkelam@marvell.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Jacob Keller
	<jacob.e.keller@intel.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH net] octeontx2-pf: QOS: Don't free SQ memory if disabling
 the SQ fails
Message-ID: <aweVbaB3p6C1IlXv@rkannoth-OptiPlex-7090>
References: <20261124190046.415260-2-oss.patchbox@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261124190046.415260-2-oss.patchbox@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX0TQI0E68mWUT
 3tjZSaS3J8BjUwPmR6jb5/WAryPiwfwUDpqRS2C7T9JHxTWTob+Iobd6lZwxNIv8XSu9uGHFahW
 dcCN8aBu3esVtF9bR2em75Jdt7OgZoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX5qGXk5eksDcj
 Wqk9ykj8abQ9765pZR2c/fRUY8EoTFMM10InQnUwo+h/KnSkN/xMCRk4I7/fX/DHpOXq2woPyms
 S7wnGX6YwEDetFGpGnIa4i5kmYRB7ZcqPnVvyV/WlzA1Y4ok4ovHzuWyEJ3x4UmKB/USRIt6M0D
 n8C/GYy3MCp3jyVaMJeVkcD8+6Pq+MFmLIkXJU7FHGcto5MbF8/Ey4+SCVZGGOFzPP5PraVz1Bs
 Qh/7Ha7l/Iu2CF6b3ql1EOiLS64qm4AdYWqBDFL9SWAV2AQKFeykZaREY5Olssg1U4grruWoqM8
 zg6SZbLnJe4wuJWkPPtypoPj6nW5zzA0+7XR6Akf98HvYNh5W//bDgMo4OeOoUK2creJKoz4POL
 wXPgzYeJfQPV1vfZRqtuC7XrRMcJg8Rm4xX6dr8ZGS4T+BHB7ICB/3+EClv55xh2noh84dDlbFp
 LFUfuJKpjafHgqE4tdQ==
X-Proofpoint-ORIG-GUID: p0xmQy6yXczzvsgJZ0FbtBFPtFlP9MHE
X-Proofpoint-GUID: p0xmQy6yXczzvsgJZ0FbtBFPtFlP9MHE
X-Authority-Analysis: v=2.4 cv=GcGCDgXL c=1 sm=1 tr=0 ts=6b079574 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=qit2iCtTFQkLgVSMPQTB:22 a=pGLkceISAAAA:8
 a=M5GUcnROAAAA:8 a=VBWVfHvdHScBPE1V7Y4A:9 a=CjuIK1q_8ugA:10
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01

On 2026-11-25 at 00:30:24, Yuho Choi (oss.patchbox@gmail.com) wrote:
> otx2_qos_disable_sq() asks the AF to disable the QoS send queue, its
> aura and its pool, but ignores the result of otx2_qos_ctx_disable().
> If the mailbox request fails, for example on a timeout or an AQ error,
> the driver cannot confirm that all three contexts have been disabled.
> It frees the SQBs, the pool stack, and the aura flow-control buffer
> anyway, which the hardware may continue to reference.
>
> If the disable fails, log an error and keep the memory: leaking it is
> safer than freeing memory the hardware may still access. If the queue
> is not set up again, otx2_free_hw_resources() frees it later with the
> other queues when the interface goes down, after the SQ and NPA
> contexts of the whole LF have been disabled.
>
> Fixes: ab6dddd2a669 ("octeontx2-pf: qos send queues management")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Compile-tested only (x86_64 with COMPILE_TEST, OCTEONTX2_PF=m, W=1). I
> don't have OcteonTX2/CN10K hardware, and the disable only fails when
> the mailbox request to the AF fails, so I could not trigger this path.
>
>  drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
> index 683efce519af..e9ca884cfb4d 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
> @@ -283,7 +283,7 @@ void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx)
>  	struct otx2_hw *hw = &pfvf->hw;
>  	struct otx2_snd_queue *sq;
>  	struct otx2_cq_queue *cq;
> -	int pool_id, sq_idx;
> +	int pool_id, sq_idx, err;
>
>  	sq_idx = hw->non_qos_queues + qidx;
>
> @@ -311,8 +311,16 @@ void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx)
>  	otx2_cleanup_tx_cqes(pfvf, cq);
>
>  	mutex_lock(&pfvf->mbox.lock);
> -	otx2_qos_ctx_disable(pfvf, sq_idx, pool_id);
> +	err = otx2_qos_ctx_disable(pfvf, sq_idx, pool_id);
>  	mutex_unlock(&pfvf->mbox.lock);
function calls like otx2_smq_flush(),otx2_qos_nix_npa_ndc_sync() [ these 2,3 lines
above otx2_qos_ctx_disable() ] can also fail. Marvell need to handle those errors in
a seperate patch.

Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>
