Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419136;
	b=Q6zXDbfH0lEu550xxU2UGPNuBtukmipUdzK9lfo0jlCXXOJS+ld4p4iGHMpWYlnUe7DF
	 I9IaofoOG8gQ61R1zBmnLz9EwjdY9rgJU9nzBG5B4cz72s9VAEQ69dn3QW+JG7g2z85QK
	 du14+8dtsW7+5zJopeRfuaRYin3eBwRWGSkOHNY8q8AccCCKafQA4WyX7tNdRe6q3OO/G
	 4bmAlE9aNNQ6W5ZOx5Vh0nVUnowRm4tMeoMJ5MBg5clsIdsx4mR2yI1IMHLluNnx+2Y+6
	 dRV5rFgtw7YGgy/NmAItLKrmvfjdeG68BUkty8u902Izhc+4ciGnsEommQi846kzxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hHzv9Q9OnZbjwI3vCzRnxwHM3TQIwftV3QfNN0qDtQ=;
	b=SSyqIdcy7cOIxtfA1nVsG0e4B1yEse8KQriqyA5RQ5T8DNIr5uwnUnZVvLTN3QOUX2e2
	 JIcBlwQ72+yq7OPVuiVuycIhZt1QNwX3Pmo0b9E6eftC9CKH4UcEPdqDhKPVu3uf/vBWQ
	 kBWgS4Q5amYghABtaWffnqkwoFSGeG1g2JUJ2vcHj0/cqG2K+v0IyqBqsyO4rwB4A/oJT
	 IIr08Rs5M12ZuhiisYzizC88AAxE7bfj4hMlF6LWNFTyBjnABA2zO3jLLmCAJC2sgeWmc
	 WXOTJQcH12t3Eadvas/s9tJUuDw9l1NFKd6vK57HQQt1DIv2YT+pau0ClAsoLWVSyiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HhOZC6Ti;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227F606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F227F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HhOZC6Ti
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN55L2e983215;
	Mon, 23 Nov 2026 07:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3hHzv9
	Q9OnZbjwI3vCzRnxwHM3TQIwftV3QfNN0qDtQ=; b=HhOZC6TimbTvyuTy4dgKIR
	yFv0kClbNICmQAmSI8iUXoaJEwYVAHJh201Dt2LD7EoDQqn1rPUXT/uylFEZoyzo
	cl5aBQ3m9jfMHD8RGm4ek1+Yhg3uVo5wbVqvBY21U1EwFRXb8fjLkGQzJA/4N1bY
	mJ8NqdFLB92z9MG78tLiJUejUdwv+qvtjnYnoxRSUNwGGS5QtzSfi6B0scImQV7U
	kUKwl7vRSiFwHNyYFU69QYYnm5xva8C40yfj+AXlep97v6ep6S5/2yycrVsYdDI9
	Uta/WsP2kp3baEpMNVUeuz6R6XcetEpe7w6Wpfh2i2qECLBziLcgsaH3xWNSUFbw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g320xk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:31:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54FX2264429;
	Mon, 23 Nov 2026 07:31:39 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3qufnk5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:31:39 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN7Va2v7602716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 07:31:37 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A58BB58061;
	Mon, 23 Nov 2026 07:31:36 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 520EC5805A;
	Mon, 23 Nov 2026 07:31:34 +0000 (GMT)
Received: from [9.67.2.38] (unknown [9.67.2.38])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 07:31:34 +0000 (GMT)
Message-ID: <45443018-951c-452c-a3e4-383b7b9a9cb4@linux.ibm.com>
Date: Sun, 22 Nov 2026 23:31:33 -0800
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
Subject: Re: [PATCH net-next 1/2] ibmveth: drop TX on a queue whose long term
 buffer was freed
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, nnac123@linux.ibm.com, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        ritesh.list@gmail.com, sshegde@linux.ibm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, horms@kernel.org,
        davemarq@linux.ibm.com, haren@linux.ibm.com, ricklind@linux.ibm.com,
        bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
References: <20261119000235.15622-2-mmc@linux.ibm.com>
 <179539467281.3135.6706630717389291385@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <179539467281.3135.6706630717389291385@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b03ebdc cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=TB4SNFFisFmkm4egyhgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOCBTYWx0ZWRfX0Iaygy5T9Jlm
 1IrdC49mei2t/ev5em3R0ePiDPJkwt9a/pc/8MS+CvB1ETSXoHtOXgFqvMhtvbM8+fAu2NLujxb
 Jja8pLSZDVhRJNRUqyC14blBd1iPoAU=
X-Proofpoint-ORIG-GUID: gQGMCjfmLgydpZJxnMrs6_Y_r_bo7b7f
X-Proofpoint-GUID: tSni1Li1-f6V70ssQDGNe34mtjN9RvQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOCBTYWx0ZWRfX6j2siFgbiYBs
 rrylYcXqDCTBH+IH0Pg1+B83KBzBhTwbu0/mwf8LOZbXT7fCC2Brru+GQOCD4aeG20wgxDAAxxw
 usNX1oNSKHgOxLyVuWofEoW7m8CgJgP4l/m4jQwY3zwctR3rs7HQujHsWUc+dox8RKhxrqcj8N3
 G1bNHWm66q8mN1Gd7CxywISzq2IxbUVntrQSN3AzWMFdSsSy/H24p4Nt+n/IKg8dNt680XzqJ8D
 USxo8IUKQISSh0Re2qwOKz1CX5KzL/NT/FpIGOnQ0NqnZTHEZjRh3Lvxj/MWfTgDUQin64CsroJ
 DLhzzK++hcRwSllnGlCmivZ7wlnaDHySEDSsfArtTDUc2W3JHgJypDGFZQ/M/Lqsdiy++igonb4
 CLtyLtM9PRGJNKxpdue9nyernzpA5hQ37hFvTBUTddcZFsavnthhEDgZuFbHXbFhNAIlmu8pHkI
 ffSpp36UGfxhhjQWqZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230028


On 11/22/26 4:44 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The new NULL check in ibmveth_start_xmit()
>    (drivers/net/ethernet/ibm/ibmveth.c:1312) depends on the sender seeing…
> - [Low] The patch treats adapter->tx_ltb_ptr[] as lockless-read state.
>
> --
...
> [Severity: Medium]
> Is this NULL check ordered against the queue wake in
> ibmveth_set_channels()?
>
> netif_tx_disable() takes and releases each txq lock while it sets
> DRV_XOFF. The LTB updates and the wake come after that, with no txq lock
> held:
>
> ibmveth_set_channels()
>    netif_tx_disable(netdev);         <- all txq locks dropped here
>    ...
>    ibmveth_free_tx_ltb(adapter, i - 1);
>      WRITE_ONCE(adapter->tx_ltb_ptr[idx], NULL);
>      dma_unmap_single(...);
>      kfree(ptr);
>    netif_tx_wake_all_queues(netdev); <- test_and_clear_bit on every queue,
>                                         including the removed ones
>
> A sender still using a removed queue, such as AF_PACKET with
> PACKET_QDISC_BYPASS, goes through:
>
> __dev_direct_xmit()
>    HARD_TX_LOCK(dev, txq, smp_processor_id());
>    if (!netif_xmit_frozen_or_drv_stopped(txq))   <- plain load of txq->state
>      netdev_start_xmit()
>        ibmveth_start_xmit()
>          ltb = READ_ONCE(adapter->tx_ltb_ptr[queue_num]);
>
> The writer's last txq unlock comes before the NULL store, so the lock
> does not order that store against the sender. The only link between the
> two sides is the fully ordered test_and_clear_bit(). On the reader side,
> its two loads are separated only by a control dependency. That is the
> MP+fence+ctrl pattern, and both LKMM and Power allow it.
>
> Could a sender then see the queue as awake, still load the old kfree'd
> LTB pointer, and memcpy() packet data into freed memory? The window is
> very narrow, but nothing here seems to rule it out.
>
> The grow path has a similar gap. ibmveth_allocate_tx_ltb() stores
> tx_ltb_ptr[i] and then tx_ltb_dma[i], and ibmveth_start_xmit() re-reads
> the DMA address later with no ordering:
>
> 	desc.fields.address = adapter->tx_ltb_dma[queue_num];
>
> ibmveth_free_tx_ltb() never clears tx_ltb_dma[]. Can a sender pair a new
> non-NULL ltb with a stale tx_ltb_dma[] value and post a descriptor with an
> unmapped or old IOVA? The commit message says this case is handled:
>
>      On a grow, that sender could otherwise see a new LTB before it is DMA
>      mapped, or one that the failure path frees again.
>
> Would any of these close the gap?
>
> - Call netif_tx_lock_bh()/netif_tx_unlock_bh() after the LTB updates and
>    before waking the queues.
> - Update the pointers while holding each txq lock.
> - Do not wake queues >= real_num_tx_queues.
>
> [ ... ]
I'll send version 2. it wakes the queues under netif_tx_lock_bh(), and only
publishes a new LTB pointer after it is mapped.

pw-bot: cr

Thanks,
Mingming
