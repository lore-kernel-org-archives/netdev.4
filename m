Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420292;
	b=oWbwYlYiLEvmLx7MfHuz+CkG2kvBp8Phs0pbKOxEQWGRBzjgdiqqqz57xbtZ9UF90Cop
	 Am7V94t5fqc+GRq83HZaWewdYBPN08X0I+SdCX+6BG1VBIOjjYq1TkbfvL+lWd9NGoD/s
	 IcEZeEHnqsmbhtYyyPnUVME4PUYAvFUcH6r7kuwsxQaD/lknNBqCg49kR4p4ZVjpTHNPb
	 jzxzrX53Og3C+YFEMqU7Eq/8Tyrzu8DCAHujeo2semKL8KxLuLOzZZNMTW2au31htjuPP
	 8fuB8IEtqKj8hxI/IlpmF63j4pJCdnWiEgbd5cDvQWRkSF8miSGSlAYv/rqRe4pnb9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NnmWGe9a+E123Mgyj097ItDVybjMM+ktVdi/Zst0ynI=;
	b=aNHkUyEdSL8rJdLk0EpxbFgUA1vnaIPyq5nE+PrkZnPrequFZz26FA3RnlAUuWQh2oXe
	 icGtNFZEk85lhl5oUojgTLcb9tvBJfFVoO1ZYJg+688pCa0SSpb5cw6/9jOOGP6j96YWX
	 tHdQ5VFwMOKmnvjlzIxAUPNvfwW+v8LW9ZKSJtFvdqN60zB3SaQwtl5jjcNZ6C2aSKCWc
	 ptdBq+JSgEunlGreUUJsGJ70wuUsqmqdgru1v91IZ41HxAYHixa2CcNzXjuOmLzqe5WgB
	 oOp+mbGZudGklZItBwLlSkHdvJVjq6B2WhVWqRyt+NL1GoOJ3sCSYjxUy4UEtxgW7TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qGKS1ask;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925D606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7925D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qGKS1ask
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54b1v981894;
	Mon, 23 Nov 2026 07:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=NnmWGe9a+E123Mgyj097ItDVybjMM+ktVdi/Zst0y
	nI=; b=qGKS1askR+/DF9BSqtkSa8nJzCtQfb29NK4ZN+EcV3sStctgJ55JyZWnV
	oHL8Lsid4x0zB3bArx/fgiqhGST3mlXJcmAyD6tOiZhRffexI04V/nXgI5GwjtXv
	+XkUwcNTL3cgWYJK9ujEnGwtrVoycdeb840xrkheTBY/0sIs6u53xUdxLewT/SpI
	QONT1PEKTWlucN6pcKPNLc+y1sApBEZzp1iQFDVbGHLqEt4wFLa2QYvLt6P8/+Y1
	J0PFlgrWKMmz9JvDJ6+PE7UHB746+Bf1p+VnjUfPtVRy3D6s93Zhqb0OR+w5/hdo
	QzZRIZdilwVtijINRK193ZQ0Q9fBA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3238q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:51:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54KZ92487377;
	Mon, 23 Nov 2026 07:51:12 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3q4h5rgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:51:12 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN7pAJO28705500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 07:51:10 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58C1D58056;
	Mon, 23 Nov 2026 07:51:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC80E5803F;
	Mon, 23 Nov 2026 07:51:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.2.38])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 07:51:07 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: Mingming Cao <mmc@linux.ibm.com>, nnac123@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
        horms@kernel.org, davemarq@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
Subject: [PATCH net-next v2 0/2] ibmveth: two TX and reset fixes
Date: Sun, 22 Nov 2026 23:51:00 -0800
Message-Id: <20261123075102.2962-1-mmc@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b03f071 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=3XeKXeJX3U8D6EKEFAIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfX9J7kNQzwMnBB
 EtSoahheacZYsjuvifjbQ3xZMUSEH/gdhMWaQuU7TeKfHU2HMct4nislDcTtktuRRadB/V4/gWn
 B8CVhKirZj+kNulIawIb+omKjYJp6O4=
X-Proofpoint-ORIG-GUID: wjIrpWgzdPXzkBLwgNyrExVsaxPWTxI4
X-Proofpoint-GUID: OTiLYXGmYa-CDWct8J9vd4aHwFqpStx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfXxiE+GV+LvtNJ
 mv0ZtR53z8R0jTuwomK2CYqwKnhAPELL7dvV3Vez+FSiZVVQq0WavPPQymXdXP9hjv1G7wusaff
 68vAT/Xdyl9hRXiC0G7S7ViRHbl4dasea92iLfTg8INJsemUHvvLK1VNPswYc0Kg18b9gIIn61d
 +eH1z0Qcjxi2xLfbLDz79uP2o7+CMDebZ56CreF+o3RVhf0fc6NxXTYpo68/96XPPqu8up30BWe
 trqH+1bUjZaJCEd7kZFgLr3jVoTc8AZ+RFnJj154PYvWjd47BLz/FBfV1GOttq3EIFsnSm9xtP4
 I9+CAHOvKxxV7JL5GxzhhPUEvJLfI6ZZhDbr70EUAUMiFdDIXWh2i6rp+rfHK4r7tlGcOc+ngKX
 /b4nQsGolrxwxXk3g3lPY1Qr3G14sbLAwU9gypSmNZn6MD3CezyPTiCS4KEcEYfpU1qKb3SMGxH
 Ng+7TwfgthmBqg5qiLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230030

Two independent bugs in ibmveth that exist on today's kernels.

  1. After ethtool -L shrinks the TX queues, a sender that already
     picked a removed queue (AF_PACKET PACKET_QDISC_BYPASS, pktgen)
     can memcpy into a NULL long-term buffer. Drop that packet, and
     stop TX with netif_tx_disable() so a sender already in xmit is
     done before ethtool -L allocates or frees a buffer.

  2. ibmveth_reset() closes and reopens the device without checking
     whether the admin already set it down, and can bring it back up.
     Skip the reopen if the device is not running.

Both came up during review of the v8 multi-queue series [1]: patch 1
on v8 06/15, patch 2 while splitting that series. Neither was
reproduced; the fixes are based on analysis of the code paths, and
each commit message says so. They carry Fixes: tags, but the
triggers are narrow and the second multi-queue series builds on them,
so please take them through net-next. The first multi-queue series,
posted separately, does not depend on them.

Tested: on a PowerVM LPAR: ethtool -L TX shrink under traffic,
ifdown/up under iperf3, and a queued reset while the admin has set
the device down. v2 on QEMU pseries only: TX shrink and restore under
UDP traffic, MTU change, open/close churn.

Changes in v2:
- 1/2: wake the TX queues under netif_tx_lock_bh(), and map a new
  long-term buffer before publishing its pointer (Sashiko)
- 2/2: say the bug was found during review and was not reproduced

v1: https://lore.kernel.org/netdev/20261119000235.15622-1-mmc@linux.ibm.com/

[1] https://lore.kernel.org/netdev/20261109235556.60604-1-mmc@linux.ibm.com/
