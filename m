Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047285;
	b=v+Hc7LFzBdD8P8lz52Fefr2F99EZRlrZmfzdhosXsY/1YVqYGMrJCRNcYW5hWVDuv+j5
	 qDCngnwLNqCV2h2YD/YBY/wEgen4e/g9OBorDfX9LfffON65twbMPGElKJBl2alMah0HI
	 DIfY6z6yORP8OUEOyvYAlJOBnpNxj+LJv75S+TrYBfX7l1NqZT3v6SMecUF/aMKC2IwVG
	 wQQ0eZZHti7MiaFOr1x2ftDiXgT/0PlGzTkDQbh4etMIywz1jb126fxvSmXnKm2bz1A22
	 0gauDLECTt45v5cDXeBZTT2Fv0X3UaCaLBsRITLKT/CAJUHy+pZo5pxoIBVZXBvJCgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3GLzeAzCJ32witAApsVMX2chfuFIm2CjMPIrgcWfIwM=;
	b=KlJ2A5uLTyhK1PG7jXmDrX3pAMv4zEeSBjzuKeQ9T4RtchzYCwyeiJBdpdj7/z+AyWic
	 PX6H+hFdq4Ua1tFOvZ+hLk/xFNuV2+lG7LzcBfWfA6Ah9ibLLfqi8VrhRwmFcmqIHltqi
	 nTeOJFRyw/slbzyBSSBIXwMhq4V9gqPSdwA6jDMAMCv2aguot4IvjNtwBTtWOHcC6zl8W
	 B1GfJxwZwpszLXHzYc3PvsMCEYSI9AsFJfnVxRkTejjCbR0obpMNX064dux78KFoYAHX8
	 81kpinwCBOGOO5Q6VHwMfFUv2zMHEOtpfPo918PY/4DXNSmJOsPoigE/+XiAeQi089g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxN61Z3e;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14F606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD14F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxN61Z3e
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILQTHs583464;
	Thu, 19 Nov 2026 00:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3GLzeA
	zCJ32witAApsVMX2chfuFIm2CjMPIrgcWfIwM=; b=BxN61Z3e6KWDZHIfPeHLfz
	ZPTQMLcBLOZpW20w1CqKwbIFwcUHt/VcEgpGH1uRS5rvN7cB1u76T+GIAXSo0oOl
	iV4tvy2Gyn6/eaRw4NUEg9fyxOnD/wqTPZnVHYUR6RHbv8+34CebsoqUq6WYD7Xs
	utjwiuE2/XVWEvrstXf1VYXVmj6gg/uF7/5V1P6EspwueCVPydWJQ8Y9231Ls7Jq
	YospIzCtuYZsKtInm2pVDXwdvZlAnLZ/UKjk2S+haGRaUIjhJqhY7fDfxuP2AGye
	A8051KJXkgyR0XYvxB0HPIloqmcyGpI1tcEsgPXsOrUbdlfTFCowy0sMsv7O3LlA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105rnacr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:14:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILK7fZ2587017;
	Thu, 19 Nov 2026 00:14:29 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j17c4u41g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:14:29 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ0EPnx21824096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 00:14:26 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C555858051;
	Thu, 19 Nov 2026 00:14:25 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B5095805C;
	Thu, 19 Nov 2026 00:14:23 +0000 (GMT)
Received: from [9.67.93.165] (unknown [9.67.93.165])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 00:14:23 +0000 (GMT)
Message-ID: <b319aede-ac66-4949-8f06-6800865d7fa7@linux.ibm.com>
Date: Wed, 18 Nov 2026 16:14:22 -0800
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
Subject: Re: [PATCH net-next v8 08/15] ibmveth: Add queue-aware RX buffer
 submit helper for MQ
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org,
        edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
        nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, chleroy@kernel.org,
        ritesh.list@gmail.com, sshegde@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, davemarq@linux.ibm.com, bjking1@linux.ibm.com,
        shaik.abdulla1@ibm.com
References: <20261109235556.60604-1-mmc@linux.ibm.com>
 <20261109235556.60604-9-mmc@linux.ibm.com>
 <20261116173604.50e83f10@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <20261116173604.50e83f10@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: IJgRdruelLiCpm8AdqdQNwEZP75NNBqG
X-Authority-Analysis: v=2.4 cv=e8uT2qp/ c=1 sm=1 tr=0 ts=6afe3f66 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=08XfsPcixec8zoSJzsQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfX/OT4+FZqrrMv
 UY/cpcyJawPlQ4ZNIAUKXAfwAEL3FlBR/qOaMiciz/oN56v1A4zxTdW5LjSdtDWRxOQPMiwJ2k3
 /0Hqvky6jf0sFHqwuz3GegbYNMOR6ys=
X-Proofpoint-ORIG-GUID: QiLa9tK2bhgIA3dDH2Scczc7u3aWbQ3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfXxWySxni6rPj1
 3zK0MHxcfuHX7JXUUvvoRqW45Smdgn18335L1pMsXQqzfjH7uejZf5kCDE6oetnLutjxTx3vyee
 8Q6rfl21q+NX0xhZKu2TA0AvkW5mB7EBIv5q30rAVoKVl++PXOhgpHdUzcHWLZnl214DK09l5Uc
 6FndM1p7w17qObgof/mgV9j3/RXtZ/RhBSkwzJ16ieqsVspejqYRz1Bw9LOSTdcTF65s6fMmt4R
 7gK8jHojnmsV263CS/E4i0pJC0ex2rc+f3mb811dUjIIL1Yk7pXHBxFD/bprywQKQ1foj5CmhZF
 aXV2epzruguc2z67p7Pt/HX/BdlU092yVn4K2NkdoEcHHQNNnPwCYBnz9lbBJPN0Lfi703WkkDZ
 lUgn0Woc5P4PJJbYCs59uM8BpHjx6LzbhZ1+OtNL/mJoexa/j+lIpSQZABHUcvEemw0De72heqO
 yIrcU6q3yjX9d0tkKRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180088


On 11/16/26 5:36 PM, Jakub Kicinski wrote:
> On Mon,  9 Nov 2026 15:55:49 -0800 Mingming Cao wrote:
>> This patch queue-indexes RX replenish and pool access ahead of MQ
>> enable:
>>
>>    - hcall: ibmveth_add_logical_lan_buffers() (MQ queue hcall vs legacy)
>>    - concurrency: per-queue replenish_lock; replenish outcomes logged
>>      after unlock
>>    - poll/pool: rxq_* take queue_index; INVALID_MAP and correlator
>>      errors refactored
>>    - limits: IBMVETH_MAX_RX_PER_HCALL 12, IBMVETH_MAX_RX_REGULAR 8
>>
>> Runtime stays single-queue until the MQ enable patch; correlator,
>> lock and replenish return paths apply on queue 0 immediately.
>>
>> Replenish is the last open-path hypercall that still assumes queue 0.
>> Registration is already queue-aware, and multi-queue posts buffers
>> through H_ADD_LOGICAL_LAN_BUFFERS_QUEUE against adapter->queue_handle[],
>> but ibmveth_replenish_buffer_pool() still calls
>> h_add_logical_lan_buffer() or h_add_logical_lan_buffers() directly.
>>
>> Add ibmveth_add_logical_lan_buffers() to route RX buffer pool
>> replenishment through H_ADD_LOGICAL_LAN_BUFFERS_QUEUE in multi-queue
>> mode, falling back to the legacy 8-buffer and single-buffer hypercalls
>> in single-queue mode.
>>
>> Supporting that helper means the RX side can no longer assume queue 0.
>> The queue index is 0 everywhere until multi-queue RX is enabled, so
>> the queue plumbing below does not change behaviour yet. The correlator
>> and locking changes do take effect immediately, on the single queue.
>>
>> Parameterise the RX accessors by queue. The eight ibmveth_rxq_*
>> helpers took only the adapter and hardcoded rx_queue[0]; they now take
>> a queue_index, as do ibmveth_remove_buffer_from_pool() and
>> ibmveth_rxq_get_buffer(). ibmveth_rxq_correlator() becomes
>> ibmveth_rxq_read_correlator(); poll still reads the correlator once
>> per slot, as net-next does, and now passes the queue index with it
>> to rxq_get_buffer() and rxq_harvest_buffer().
>>
>> Add a per-queue replenish_lock to struct ibmveth_rx_q, initialised in
>> probe. Replenish is not the only writer of a pool's free_map: the
>> harvest and remove consumer runs from that queue's NAPI instance. At
>> this commit replenish also runs only from NAPI (netpoll's budget-0
>> poll skips it), but later patches (MQ open and the queue resize)
>> replenish from process context while that queue's NAPI may run, so
>> producer and consumer can run at once. Its users are NAPI and process
>> context, so it is taken with spin_lock_bh().
>>
>> Give ibmveth_replenish_buffer_pool() a return value. It was void and
>> logged from inside what is now a critical section. It now returns one
>> of IBMVETH_REPLENISH_OK, _RESET_MAP, _RESET_MQ, _HCALL_FAIL or
>> _BATCH_FALLBACK, and ibmveth_replenish_task() does the logging and any
>> schedule_work() after dropping replenish_lock. Replenish map paths use
>> DMA_ATTR_NO_WARN; failures are counted, and the next poll's replenish
>> retries. As before this patch, a queue whose pools are left with
>> nothing posted gets no further poll and waits for a reopen. The
>> hcall-failure warning now logs against the netdev rather than the vio
>> device, the two batch-fallback info messages become one ratelimited
>> warning, and DMA_ATTR_NO_WARN silences the DMA layer's map-failure
>> warning. In multi-queue mode an H_FUNCTION from the buffer-add hcall
>> schedules a reset instead of the legacy single-buffer fallback;
>> that arm is unreachable until MQ RX is enabled.
>>
>> An IBM_VETH_INVALID_MAP free_map entry no longer WARNs. It now drops
>> the partly filled batch (those skbs stay in the pool for reuse),
>> skips the remaining pools and schedules a reset, where the old code
>> posted the partial batch and moved on to the next pool.
>> replenish_task() also returns early for a queue index at or past the
>> live count, and ibmveth_poll() logs an IRQ enable failure before it
>> schedules the reset.
>>
>> Update replenish_task_cycles under replenish_lock; the statistics patch
>> moves that counter per queue.
>>
>> Snapshot the first BATCH_FALLBACK and HCALL_FAIL into their own
>> copies and log those after unlock, so a later pool cannot overwrite
>> the values those two messages print.
>>
>> Make the correlator check per queue. ibmveth_rxq_correlator_valid()
>> takes the queue index and also requires the pool to be active with a
>> free_map. It no longer logs or schedules the reset, because
>> remove_buffer_from_pool() now calls it under replenish_lock:
>> ibmveth_rxq_bad_correlator() and ibmveth_rxq_no_skb() do the
>> ratelimited log and the reset, called by rxq_harvest_buffer() after
>> remove_buffer_from_pool() returns and by rxq_get_buffer() directly.
>> The ring still advances on every error. The KUnit tests pass the queue
>> index and set up free_map and replenish_lock.
>>
>> Redefine IBMVETH_MAX_RX_PER_HCALL from 8 to 12, the argument-list
>> capacity of H_ADD_LOGICAL_LAN_BUFFERS_QUEUE, and add
>> IBMVETH_MAX_RX_REGULAR (8) for the legacy hypercall. Probe sets
>> rx_buffers_per_hcall to IBMVETH_MAX_RX_REGULAR, so the legacy batch
>> stays at 8 until multi-queue RX is enabled.
>>
>> free_buffer_pool() keeps probe/sysfs geometry (active/size/threshold)
>> and zeroes pool->available so teardown cannot leave a stale count.
> The further you get in the series the sloppier the commits.
> Please trim this text, tell your LLM we can read the code :/

Agree, thanks for pointing this out. The next series tried to address this.

Mingming

