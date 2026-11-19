Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047219;
	b=Gu76K6WOe4WLS2JyB+hy5T3PTskzN8DRTaxGn2NkVf6gdlQWn2D2Png266jvvDY6FqpW
	 Z1UzV63MjRdiFeH2ykq7JtNOm43XvGsLsVWxFMX3EeI7pKgPML2ajz46DQSy+Zh8FcoSG
	 GTCGcMOPd8KZ0gkDNcLjmAdQYz2mflhtHB52RoTx9DX4hhbSNK/jmsKHctczM1tctJzNy
	 baX8ru3sXLfmdid0boEKPtemfgas7zZ/gnLxV9FiLj3adR6Co/sQ65gZEvpscD/epOmwG
	 uyvDAra1qKcmI5+cTH+9uIfxfsXD88rKiomo2XINUNlZaSUC14aELPxpyCvW9Rl2LdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NFPTZDpy4IbSNt3TV97Dwy/7fuW90Df56zvQ2rQKtt8=;
	b=151/bmyQKYkpQdCaxW9SkQ1zx9M0rZ03Wyt+q2TZRBoXunkTIFSlYBTF1hnBLtxZ68aS
	 0ayJJuDTaLrEejqf+JasBdnLZn26lOlOBAJ3Iuu5vAIsK0XG41KYWTdnZt0Zb2SlJajYw
	 ZB/3NTWB2gdSxwXeDs7wkHfalLhdAiru1LQzsOq5ob9CX74W5NHYjSeMNvr9F9JDfop+J
	 7p4y3TYpXOI9CF/MHtTsuvC28A6dvC9nDg78m73o9LVMJz+51agd6eccK664sl5F+o+3D
	 dzVPrCU209tF0IwZL4f05HNeei449s4xtfHYUVAbsVRl8Rs2kbm5rnYU1e3YBFuGS4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AvGFILY7;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95DA606A33D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95DA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AvGFILY7
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILQOYx2376600;
	Thu, 19 Nov 2026 00:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NFPTZD
	py4IbSNt3TV97Dwy/7fuW90Df56zvQ2rQKtt8=; b=AvGFILY7IwxZsypkSDlbII
	nJXjRNv3gQIx0CmTxY5nMKhfzPPexoRAQDHSZOBGt4Jkxc93KDNeCuMa0Uzn6zOX
	FBUd+l+2PUb1AGXB1DAw5dZfOGa9lwACDRLo6+4chATy+1LQBkxyf87wyJiPRoiA
	fg3RpUYfyVymwdNgQZRMA1vjF2YS0CGS14Eg5D1YqhQ9pM1TOc4LtSeH8ULXkPyL
	GjPUbRcbp0E17CtV2YRtahlNmybqRr/3eLxYLMKq7GDYdfrGuGZCc7CWfQA/uaAM
	9SQ7xq41PjocvpNRhcZ338iuNPLfxxYx4/kP0ofb2EwDhAHGIFTP+/ggN6tC9eKw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105ndafd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:13:23 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILK7kC1490557;
	Thu, 19 Nov 2026 00:13:22 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j067nj200-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:13:22 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ0DKGU62259672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 00:13:20 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0593B58051;
	Thu, 19 Nov 2026 00:13:20 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B4255805C;
	Thu, 19 Nov 2026 00:13:17 +0000 (GMT)
Received: from [9.67.93.165] (unknown [9.67.93.165])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 00:13:17 +0000 (GMT)
Message-ID: <e6475827-673e-4584-afbf-2bcd76f3c289@linux.ibm.com>
Date: Wed, 18 Nov 2026 16:13:16 -0800
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
Subject: Re: [PATCH net-next v8 07/15] ibmveth: Add RX queue register helpers
 for MQ
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org,
        edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
        nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, chleroy@kernel.org,
        ritesh.list@gmail.com, sshegde@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, davemarq@linux.ibm.com, bjking1@linux.ibm.com,
        shaik.abdulla1@ibm.com
References: <20261109235556.60604-1-mmc@linux.ibm.com>
 <20261109235556.60604-8-mmc@linux.ibm.com>
 <20261116173455.325fbf0b@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <20261116173455.325fbf0b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfX0eNBRuW2dYAF
 ynqwm9XtS2Y56ZXz3PDqeh3ZU+WUGMD+fU0ztzk3SQZCbzdY9h4lnOEgwpmVLKO5i/K5KmgPbNf
 QgXK4eg2Kpi5nwuNtkRuNKneqUl3cWk0HgZ5hNbb5eoKBb3LDFYui3A0nP5PC/ca1yJu68FE48Y
 uUvrMKQrApMmLZXGvLipCq/VuwYV4w1bcBVE6duVSSIqfeIDOAJLBAuUyDkYH9QaQwrTGjY6BbR
 +80VchW5cVF6ahhg8AjrANBfhLTxA00hHmK6KSyKIfb4hfEN4IIyzjfQt+iUUdJijmZLapSVLiA
 orDgGdiGcRwTGmjn6fSzvVXnEF6+xuao8u1/WC5/ADzWQ5/ZqpQtbHez2te25nk8Fgc4Za6ljs/
 au7TOlztSjfRgtyc5pKWk+Vy9pcdWse/1JHnje7y+8tD9yLoLknAV/+8xpxiSC8ysOS/OOwjG5P
 6SrzKRXoUNdiRWuZBfw==
X-Authority-Analysis: v=2.4 cv=HN9WhYtv c=1 sm=1 tr=0 ts=6afe3f23 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NMVmCS7tOBbRudw9hzYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zopTLp6TxzjumrpfD2LNt3zJfHRSyyKM
X-Proofpoint-ORIG-GUID: AWJSCgSP_A6xrZtOWX2aKVCwF4kY2AE4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfX6kSrbreA/hwM
 48f2cpuLgT+YERQRrb/zXvCoX4vuLaN0ZajECUWM/dBiqSZc7+2CyOmY3PYvWaXf3tooJn/YsKu
 lDs/+cnsEkWYbTwIgHc2Y6vBpWV2pFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180088


On 11/16/26 5:34 PM, Jakub Kicinski wrote:
> On Mon,  9 Nov 2026 15:55:48 -0800 Mingming Cao wrote:
>> +	rc = ibmveth_alloc_buffer_pools(adapter);
>> +	if (rc) {
>> +		unsigned long ua = adapter->vdev->unit_address;
>> +		unsigned long lpar_rc;
>>   
>> -	if (lpar_rc != H_SUCCESS) {
>> -		netdev_err(netdev, "h_register_logical_lan failed with %ld\n",
>> -			   lpar_rc);
>> -		netdev_err(netdev, "buffer TCE:0x%llx filter TCE:0x%llx rxq "
>> -			   "desc:0x%llx MAC:0x%llx\n",
>> -				     adapter->buffer_list_dma[0],
>> -				     adapter->filter_list_dma,
>> -				     rxq_desc.desc,
>> -				     mac_address);
>> -		rc = -ENONET;
>> +		/* A kexec can leave the LAN registered by the old kernel
>> +		 * (see ibmveth_register_logical_lan()); do not leave its
>> +		 * buffers live in PHYP. H_PARAMETER if none is registered.
>> +		 */
>> +		do {
>> +			lpar_rc = h_free_logical_lan(ua);
>> +		} while (H_IS_LONG_BUSY(lpar_rc) || (lpar_rc == H_BUSY));
> This loop is repeated in a number of places, you should probably factor
> it out.


Done,  in the split prepare series.

Thanks,

Mingming

