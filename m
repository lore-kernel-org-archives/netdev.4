Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547774;
	b=ATtnWSM9INKuPy0UDzAAMfUQNMC8l5FlZlDw6RHnUrTEbCasxyV65FQllGRkYy/EKHh5
	 SgQPDSnCrU+Can15RK4nsjAWT+cuXMgTPjbZ58dRCgMgDZ4AjOLUeWYDo1ysVQR2zqzZ6
	 DwZG5Z2ENVH87hzFW5pZBCVJDlLu6iIUKiJnwop755evW6N+NMMzk4QTo3SEdlAUPkycG
	 gFY9OhKJaURwV11rnrV5fPKWCdeguIW3+gH9GLos1eX2p1WUIIqWwnbQSAgm73qhBgHi3
	 s8dMBnDE63aIzxruoub8n84HKTp5RvteSiF4uWGFnV6Vr59J3H2MnVRLok9JPyDTFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PW40Hv+Hjyfbb2h6+NudVKAwbzcMaa1CZCgwM2AGGJ4=;
	b=o7WAo1RxgYyiRsW29J1xGZJsKQRV3k1P4XEMvLAkQtCLLmdFhhGY2C2wos3DZHPr28e/
	 LMiNs0Oltxdu5C66+0bwDD87K0JOt3babWYE0rrxZ9ungfWRV9vyINaE+PuqJpdZleiRL
	 EzF7+QyruPxOFI9C3ij88r44F6MM0lw+2RJ+r8gPl8OXP/tcHYLaybAtHdLoGjOp1P90z
	 7Yugvc1VJghth8GRSP0jgIvmsVHqqaAlD4Zhfsbl94N9tL4DKdu+60X6XYRYchRr6ucQ7
	 pQnvPD7luthPkdadaMmcrZCfsFCtWJLprHO9los0cjiBIlzsuszUMcERLU0/UPOXTPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nr4LAIkD;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22A606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A22A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nr4LAIkD
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIYqcv3378734;
	Tue, 24 Nov 2026 19:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PW40Hv
	+Hjyfbb2h6+NudVKAwbzcMaa1CZCgwM2AGGJ4=; b=Nr4LAIkDnMjXWlJeiEws31
	VZeCgbnjwoEO/XYBoW6aCwior7l61xPr/l39sS63YDe1Dm4/FjsJcvwlCaD77Jz0
	RXHL1mvZo4eBy4AIV35MasD9Q7F24X63/48aktgQW+oRx4TTDyskgHmopum1SDav
	WgK+E4CEB/zN/M5alKqHTrZbNSr4oCj9Zuj4WPJuuua+IT52fiqp4x7ejaRSsVWh
	yHYBHRCQLvQ5lYVlOBhnpE3+B/ezl/Bov0V9ySz4HTlA51Q06RgI/Zv3Nz+1dpRR
	H+5a5hTsv8rClCg3i/5VUWOUSI1tywbGQcdgqiq4ge0cnfvPSkfNSjojU+3/yxaQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fa9b7u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 19:15:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIZe3Q3753187;
	Tue, 24 Nov 2026 19:15:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5axks7f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 19:15:49 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOJEuVt3867212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 19:14:56 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57A845805C;
	Tue, 24 Nov 2026 19:15:47 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5629858054;
	Tue, 24 Nov 2026 19:15:44 +0000 (GMT)
Received: from [9.67.103.228] (unknown [9.67.103.228])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Nov 2026 19:15:44 +0000 (GMT)
Message-ID: <29de5f03-09e3-48a2-abbb-c5c6eb5539e7@linux.ibm.com>
Date: Tue, 24 Nov 2026 11:15:43 -0800
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
Subject: Re: [PATCH net-next v2 5/8] ibmveth: Refactor TX resource allocation
 in open/close paths
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
        sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, horms@kernel.org,
        davemarq@linux.ibm.com, haren@linux.ibm.com, ricklind@linux.ibm.com,
        bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
References: <20261123075136.3278-6-mmc@linux.ibm.com>
 <179551045457.3135.17656003339909508108@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <179551045457.3135.17656003339909508108@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3NSBTYWx0ZWRfXzx0UJabuj/vN
 OgHyZGw4n5ynZ4PUVA+HLLSqy1WeWDrL179sd00QO8UUEwJRrvm58sWAVCHEXojHb07+dGW0Rv/
 PnvnIm6KH15QDolsUqMNajtDA1BxFH5qrVXTfKUJ9Vg/PIlweqUJHFCOQdnTZJDXry1rrxh3OGO
 mGVXzCkrixdcTx+bxj32fcb6xob9mJWAE4GTCtdJPhBYU622AToh/vcYi3pYu15waxDQ/kyvtM6
 MBGfiW9Tuk16BFuY44U33VPlurx/3Zh2/Mob5izYlWPBMJqa+Db5i5M60Dpsjf4Pr4sBmxJsCbj
 y2MDzAkRorbNYS5qeZNJP/ynMpelH2FP2xaO/nu8iRyJhgj8jFkin2ByGpXB6S+z+XOddP/4gvr
 JM9ktLcWw5gO1t3euUftO54TrQ22ZDFm96G5HCv1CTnXRXfELqMDTS+plaTFO6Cqf6QI2G37C/f
 gwwkuh4chDNfNZ7NZmA==
X-Proofpoint-ORIG-GUID: yjwRjdGxkroUyE6E5EukQlV9wi73K4rm
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b05e267 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=2IvOvnFqkrVRcSdH7zEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: DNJPcRHKr3IUmDunPUdhtoy8OS6qTDUV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3NSBTYWx0ZWRfXxCF+SHsTcwAI
 X7ijGOv/KzSbTWZAmneUaaJCEKAoZlPVen04vmXsDlNHcIMtbwXxt8yTTGseE2BRxEDE9/8x/Nx
 1VuNM9x8yxnBxUeEK+VzVzBbW4T/xrc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240075


On 11/24/26 12:54 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] In ibmveth_open() (drivers/net/ethernet/ibm/ibmveth.c, lines
>    1194-1199), the commit "ibmveth: Refactor TX resource allocation in…
>
> --
>
> ibmveth: Refactor TX resource allocation in open/close paths
>
> This moves TX LTB allocation and freeing out of ibmveth_open() and
> ibmveth_close() into new ibmveth_alloc_tx_resources() and
> ibmveth_free_tx_resources() helpers. The TX LTBs are still mapped before
> RX buffers are handed to PHYP. TX queues are now started under
> netif_tx_lock_bh().
>
>> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
>> index ea0e5158040cb..06741a6756b88 100644
>> --- a/drivers/net/ethernet/ibm/ibmveth.c
>> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> [ ... ]
>
>> @@ -1147,7 +1191,12 @@ static int ibmveth_open(struct net_device *netdev)
>>   	netdev_dbg(netdev, "initial replenish cycle\n");
>>   	ibmveth_schedule_rx_queue(adapter, 0);
>>
>> +	/* netif_tx_lock() takes each txq lock, so a sender that then sees
>> +	 * DRV_XOFF clear under its txq lock also sees the LTBs set up above.
>> +	 */
>> +	netif_tx_lock_bh(netdev);
>>   	netif_tx_start_all_queues(netdev);
>> +	netif_tx_unlock_bh(netdev);
> [Severity: Low]
> The commit message does describe this change. It is a behaviour change
> justified as an ordering fix, though, and it sits in a patch titled as a
> refactor with no Fixes: tag. Would it be better sent as a separate patch
> with its own Fixes: tag?
Ah the issue is real. The set_channels side is a
standalone net fix posted the same day ("ibmveth: drop TX on a queue
whose long term buffer was freed"):
https://lore.kernel.org/netdev/20261123075102.2962-2-mmc@linux.ibm.com/

That patch was not in the net-next tree this review used, so the peer path
did not show up here. This patch stays a refactor only.

Thanks,

Mingming

