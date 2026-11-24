Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547462;
	b=LdSbaD546euY0xPn5DRr6Jfu6NITpSJDYdf0ccr9/1auxG4kGyrnOjItAuz/PmOc+WMB
	 V4MSvD0StBg51WQVE0LNCJqYftOB7DPShmBd1Nr/ccSImVWnfnBpBFyg/3GnrwkxM3/zH
	 KIifT8Yb3XPPfLulF8LzQmBrx0e1lBG40UIBo1C5oAuAJLimBAnGUasPNe0QXEnvOWIke
	 701VFa8UCIwrobgOtx3r6IZAdJqhvsPLLRAprfubLBk8zig1K6fi3ZJYrpE75+A/3kyMf
	 ZLinQ1gYx7oQ5Opu191amXpsGyXtF85j32rS1BKSQ97Pz0Aedpm6497QibhQOdgPZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rDDM9aEwpFXDXSs2NT3NL3JuMcLYaZ1LtePbXsFAldQ=;
	b=nIvRXrk3pQlISiFwiWxT/XPTME0q2yD5kA1gjlxFHtjmHr3LBSaigCE8w47kWgkaPtGc
	 MDwOy1KHD4DRx3XJo4sh3Ooqlkp0tNy88425vTEQRH15beiiU7+3K6FFmTI/GCHOA4LEV
	 vdWKEyuIixSaBxpPkrLcFfa9lkvcup9OgsX9rl751iaSstAOfZMGYVDTyI6yRAfJp6xJo
	 e/yKjI+wTC8GWdny40/a6fv0BA3sGaVf0SoZ5qTTR5WXUMd/6yucPkEMNcFe5Pkntrven
	 5pIxaAKdNsn4cguNXK7ws0I5+UwynqmGJVSzBkZSNIix/5S6z2JQNJ0m25zJVP/Z0VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lkC50nhR;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99862606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99862606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lkC50nhR
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIZPad3229993;
	Tue, 24 Nov 2026 19:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rDDM9a
	EwpFXDXSs2NT3NL3JuMcLYaZ1LtePbXsFAldQ=; b=lkC50nhRwxvkD060qJ468e
	qp+upN2Ult0QZpK7/V0Z1R/UF4J6GkPdrI99/ZVemEqlW9CIqlJItQ2v3FRKdBzz
	ND+pefR6Q9fiuyw95xIkXCLb00s5SLyfyFpcLyw9HHAMtC3j7ctzBCk9bgShK1C0
	2U/tH51w92kgvdBs1KgMFzjKpc2u4T6jR1k9MZuB2Xxd6lJEgD2pOjffVYmdjnAY
	+bOJ7g5GFRy6w+VpHmJcqyaFXaqIEgYxFLyZ+oodYjQOTanWNFW1YsMYooJ/5hsH
	zaVbL9sbQGn91ScpeKCwsNSelAWqJJkYznqhlQ0P/UD7EJLOiorglCkYW4IZTmzg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g18uyv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 19:10:38 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIZejd2684691;
	Tue, 24 Nov 2026 19:10:38 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3qufukmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 19:10:38 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOJAalT42598688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 19:10:36 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A89158054;
	Tue, 24 Nov 2026 19:10:36 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23E345805F;
	Tue, 24 Nov 2026 19:10:33 +0000 (GMT)
Received: from [9.67.103.228] (unknown [9.67.103.228])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Nov 2026 19:10:32 +0000 (GMT)
Message-ID: <80e75016-67c0-46c0-a934-f9455d975178@linux.ibm.com>
Date: Tue, 24 Nov 2026 11:10:32 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/8] ibmveth: Refactor buffer pool management
 for per-queue MQ RX
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
        sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, horms@kernel.org,
        davemarq@linux.ibm.com, haren@linux.ibm.com, ricklind@linux.ibm.com,
        bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
References: <20261123075136.3278-4-mmc@linux.ibm.com>
 <179551045236.3135.13521842784287344413@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <179551045236.3135.13521842784287344413@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ggyztGDsF8KOhd_LREHumNVN7EvUt-XL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NSBTYWx0ZWRfXxpt8azr92Tqo
 Ic13zjszeI21WngK9N+N0y7ywBcrq7cmRn849KG/PMBM6+SMQgLxo99YYZf/4GRrZp+XGMgAuss
 EmUPJXjPt8sR9GHQO7BEVEYviHoOWbU=
X-Proofpoint-GUID: -e-cNAQJ93fVYex1pNvOhVa2ruk9ZY_C
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b05e12f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=i_8X3K9gQzJtdaTUWEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NSBTYWx0ZWRfXwGG4I6dQVLyX
 eURLAZoRvnro1VvGBqdnaUVIQzt88HTXJws5a5xRdnWADJ3bZSgPwZuKNt6+lKdJB/vyemFBF/9
 03CPCKIIYOU0+rm1IPtMpPjizrZCy4xtrMc+6lEG/SLTyTgNUc3poebRGWDO/RpHSxdOd4XVfzO
 jwKVSccT8jm3QLamx4ahRbGeqRz4HJNn7fwpQdqSX8QfzW0nb7/o21VX1S8ZZ49b/3qwGGzyy5v
 IOFJWloJhN6OovXPomwUFwa5PhmlAF/YkWexzijrUv7IRphaY2rRBcxf+PYr4dy+nvLRw8MjCQP
 yUxkPmQOPyzS3KgrPzpD5cRAuXVnyoDZHgHd9TXnPpuIxRsSACnlByVbq63Hwah29DNDKpuy+ug
 6ZZ9KbCsHduT1yZdTmEtj0B6cfesXyRRclfuJhdxQWxVn620rEMMZSISIJx5XNNnnkSd56wrU74
 x5hRS8hHZ+yxoU9pM1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240075


On 11/24/26 12:54 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] ibmveth: persistent pool deactivation in
>    ibmveth_alloc_queue_buffer_pools()
>
> --
>
>> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
>> --- a/drivers/net/ethernet/ibm/ibmveth.c
>> +++ b/drivers/net/ethernet/ibm/ibmveth.c
>> @@ -660,6 +660,100 @@ static void ibmveth_rxq_no_skb(struct ibmveth_adapter *adapter,
>>   	schedule_work(&adapter->work);
>>   }
>>   
>> +/**
>> + * ibmveth_free_queue_buffer_pools - Free buffer pools for a single queue
>> + * @adapter: ibmveth adapter structure
>> + * @queue: queue index
>> + *
>> + * Frees every pool on @queue regardless of the active flag;
>> + * ibmveth_free_buffer_pool() skips what was never allocated.
>> + */
>> +static void ibmveth_free_queue_buffer_pools(struct ibmveth_adapter *adapter,
>> +					    int queue)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
>> +		ibmveth_free_buffer_pool(adapter,
>> +					 &adapter->rx_buff_pool[queue][i]);
>> +}
>> +
>> +/**
>> + * ibmveth_alloc_queue_buffer_pools - Allocate buffer pools for a single queue
>> + * @adapter: ibmveth adapter structure
>> + * @queue: queue index
>> + *
>> + * Allocates backing storage for each active pool on @queue.
>> + *
>> + * Return: 0 on success, -ENOMEM on failure
>> + */
>> +static int ibmveth_alloc_queue_buffer_pools(struct ibmveth_adapter *adapter,
>> +					    int queue)
>> +{
>> +	struct net_device *netdev = adapter->netdev;
>> +	int i;
>> +
>> +	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++) {
>> +		struct ibmveth_buff_pool *bpool =
>> +			&adapter->rx_buff_pool[queue][i];
>> +
>> +		if (!bpool->active)
>> +			continue;
>> +
>> +		if (ibmveth_alloc_buffer_pool(bpool)) {
>> +			netdev_err(netdev,
>> +				   "queue %d pool %d alloc failed (size=%u count=%u)\n",
>> +				   queue, i,
>> +				   bpool->buff_size,
>> +				   bpool->size);
>> +			bpool->active = 0;
>> +			/* Undo the pools this queue already allocated; the
>> +			 * failed one freed its own partial allocation.
>> +			 */
>> +			ibmveth_free_queue_buffer_pools(adapter, queue);
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ibmveth_alloc_buffer_pools - Allocate buffer pools for all queues
>> + * @adapter: ibmveth adapter structure
>> + *
>> + * Return: 0 on success, -ENOMEM on failure
>> + */
>> +static int
>> +ibmveth_alloc_buffer_pools(struct ibmveth_adapter *adapter)
>> +{
>> +	int q, rc;
>> +
>> +	for (q = 0; q < adapter->num_rx_queues; q++) {
>> +		rc = ibmveth_alloc_queue_buffer_pools(adapter, q);
>> +		if (rc) {
>> +			while (--q >= 0)
>> +				ibmveth_free_queue_buffer_pools(adapter, q);
>> +			return rc;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ibmveth_free_buffer_pools - Free buffer pools for all queues
>> + * @adapter: ibmveth adapter structure
>> + */
>> +static void
>> +ibmveth_free_buffer_pools(struct ibmveth_adapter *adapter)
>> +{
>> +	int q;
>> +
>> +	for (q = 0; q < adapter->num_rx_queues; q++)
>> +		ibmveth_free_queue_buffer_pools(adapter, q);
>> +}
>> +
>>   /**
>>    * ibmveth_remove_buffer_from_pool - remove a buffer from a pool
>>    * @adapter: adapter instance
> [Severity: Medium]
> Now that ibmveth_free_queue_buffer_pools() frees every pool on the
> queue regardless of the active flag, is there still a reason to clear
> bpool->active here?
>
> The active flag is the pool's persistent configuration. It comes from
> pool_active[] at probe, is turned on by ibmveth_change_mtu() for large
> MTUs and toggled through veth_pool_store(), and ibmveth_close() leaves
> it alone so the same pools come back on the next open. Clearing it on
> a transient ibmveth_alloc_buffer_pool() failure has two effects. A
> later ibmveth_open() quietly skips that pool, and it can succeed
> without a pool large enough for mtu + IBMVETH_BUFF_OH.
>
> None of the callers of ibmveth_open() put the flag back.
> veth_pool_store() only restores oldactive for the pool it is editing.
> The ndo_open path, ibmveth_change_mtu(), ibmveth_set_csum_offload(),
> ibmveth_set_tso() and ibmveth_reset() do not touch it at all.
>
> The old single-queue loop did the same thing. With per-queue pools,
> though, a failure on one queue also leaves rx_buff_pool[q][i].active
> different between queues for the same pool index.
>
> Can this line simply be dropped, since the unwind no longer depends on
> it?

Yes — the clear is not needed for unwind. It is also not new here: it
dates back to 860f242eb534 ("[PATCH] ibmveth change buffer pools
dynamically"), and this patch keeps it so the refactor does not change
behaviour.

I am dropping it in the multi-queue series that follows, not in an s1
respin. With one RX queue (this series and base), the only effect is
that later opens skip that pool. Once there are several RX queues, the
same clear can leave queues with different active sets, or disable the
pool on every queue when queue 0's template is cleared. That is where
the footgun shows up, so the fix belongs with that series (first
patch: drop `bpool->active = 0`, retry the pool on the next open).
Until then this prep series just prepares the helpers and leaves the
pre-existing clear alone.

Thanks,

Mingming

