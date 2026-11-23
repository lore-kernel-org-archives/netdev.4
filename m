Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420335;
	b=41Ev1XzqTX3gZlLTnnZnMqWgst4AHq3Q1B8jsArmc/oj6jka3nPZbQRTB+Ip1mhp4Y7D
	 I5d1fOWhPfbgd+em/xUV7M/GM2dGZJoqiJtDTiVmxb/hh7eUI1nnYWgTvCwVBLbLyElxC
	 wr5XOwJpumyO2m+SThJdrWh8zWwpFK7JTN27iVTx+OvanO2zG2UTGhe5VOoKBC7kH9jXp
	 +pSTtICeUSTeYvmBqnqevhiXvDjYlnlIeRc6REl3lN0ee9V+mE31/ycRSeEnlSL/WTdya
	 fb5I+ICfMeuSX7Zp90ZZdkOl4lqwfNr3sPnFtQljwez39ezrq/KUwV1zkmIj/PPhYMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LRTb7b9P5EWgNK6Kqxv6XCLxXQEMXknfi7m6mgp0EHo=;
	b=2if/Gqywt7q9lIJDKBaS039AmW7wX8yPC9kjFNmjx/X82mlOWRtTez1QaUHrX1zFEbr8
	 lV4DQUDKnFqNJ4Q+GDFohVnpkx0Fkk59X+sENLymE3rGOXUIouCckE6aMeU59Gs9mIfUL
	 NOcqRamVoxcPc11uyoKVQ0SQQzGyg7F7i8v4UJObyNqAJ8mg/GR241seGzhM73wpUP+9F
	 asGeBoLdJLqL7f8z9aGxBSSjKKrbcpTcTa/+6GcTsFucbok/2jsaDIRSVtof2VVso596J
	 vRrmASwrZDPI8AUmjaUBQhxBi28aldnrlh2Qun3pEkB2rEXCFy+WXTsL83NAVzKMwog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D2tKUxJl;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9F606A33C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F9F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D2tKUxJl
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6gg3G1585121;
	Mon, 23 Nov 2026 07:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LRTb7b9P5EWgNK6Kqxv6XCLxXQEMXknfi7m6mgp0E
	Ho=; b=D2tKUxJltgIPnd7QwNDJYFJW6YG4ZBOwhkldpHt9xjB4ydLWg2y9s6+QE
	fMJqcMVuEy78LPD9r00FAWeME5cNnxjai5tofkLYQfvp2tngcBJ0V2g6OSgRggjO
	Ied1LdKi5jX1C1OtQTdB80hw9WNDk2MKWtFmluAVuHp4Z6efTgKuxssxj5wVnlNj
	KGrXkgTmyrvaESW6PMi0AsWTklzxBqw+SnlWqnh3xqoEIp16SK5LHXRDqN3c+L0U
	OPCLFOMwpXDAPeGdrxXwV+PGhV2VmdJ3is6ohgb+0DnIyD4uSqxAw7ZnVsMq1TlQ
	1Dqs05BSddeIvEOQ61Xtt6GoGYByg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34p49p1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:51:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54E2O1436218;
	Mon, 23 Nov 2026 07:51:42 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3raydgwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:51:42 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN7pfsJ7537280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 07:51:41 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 627AF5803F;
	Mon, 23 Nov 2026 07:51:41 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0AA258063;
	Mon, 23 Nov 2026 07:51:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.2.38])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 07:51:38 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: Mingming Cao <mmc@linux.ibm.com>, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
        sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, horms@kernel.org,
        davemarq@linux.ibm.com, haren@linux.ibm.com, ricklind@linux.ibm.com,
        bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
Subject: [PATCH net-next v2 0/8] ibmveth: prepare the RX path for multi-queue
Date: Sun, 22 Nov 2026 23:51:28 -0800
Message-Id: <20261123075136.3278-1-mmc@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfXx7uCp4CBhywM
 MrQKppkScIs7uTn7PE3ttsW+6t0cNIJjSMMfra56rgO7R5tN59JAG7bDffHVPzoNvpib+D7e0wC
 c3NWBf8OJ02Qv2BWZwk2gb3Sqdo1WWY=
X-Proofpoint-GUID: DTfO2c19Cr7xJPSGBTbYAJyd_5-HrquQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfX6rWl0U5Iogwc
 LnUT8RVSb9NmbTplfqRdlZ/BKthVI85oGoYSODcalLjaHgRT1DPSn9D1e1oVQAr7QG93Zx54fGc
 ef+yxzi5mjlM1rtMNvH6wO1pJIGn4Nx/HfhqcFjVHyOQcd1JTxLqQJz8dpKsUwyi92K6yO5GJi7
 CdwAxkUzh9tZHJPtoVvMA6raF6LL8/CG0wj1gnHQzRZdxWmIdVFc6RXQD0QWfI7hkoBo4qy8Wo9
 38Yy944pt2Y9TG9fYw/SZzK3CorBj+8LKzc84ge+Y2I6USoFnydzgySij4sc1iREyM1LP0RnVer
 61GK9mAMQF4X73w0hm/nGrtJA1QCGCylxfzmfCCS7ZJpjG2bv4BMdL1Gld01wQco3ZuHfKzfTMt
 hg0LSbX5C5KpZNll5zUztA9KoBFFeAKyQyj0CukEKI3oJQvijy5A1JHs4mTj7ONvK05/EQWJnIi
 WzCWO+0rg6ntnW9YHHQ==
X-Proofpoint-ORIG-GUID: bIwtpxXFTqGwvbs9TxTaByT9hs7kPh-Y
X-Authority-Analysis: v=2.4 cv=QabzLcbv c=1 sm=1 tr=0 ts=6b03f090 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=pTEnhOEyEOFkSSAe0uIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230030

ibmveth receives on a single RX queue with one interrupt, so all of a
virtual ethernet adapter's receive processing runs on one CPU. Power11
firmware can give the adapter several RX queues, each with its own
interrupt and buffers.

This series only reshapes the existing RX path: open/close, buffer
pools, interrupts, replenish and poll now take a queue index.
IBMVETH_MAX_RX_QUEUES stays 1, so every loop runs once. Same
hypercalls, same ethtool behaviour, no new ABI. Multi-queue enable
is a later series.

Patches 1-5 move the open/close path onto per-queue helpers. Patch 6
moves LAN registration and teardown out of open()/close(). Patch 7
passes the queue index through replenish and poll. Patch 8 splits poll
into per-slot helpers.

This series was split from an earlier posting of the full multi-queue
work [1], which was too large to review as one [2]. Two related bug
fixes go to net-next in a separate thread; neither depends on the
other, and they apply in either order.

Tested: on a PowerVM LPAR, one RX queue: ifdown/up under iperf3,
MTU change, ethtool -L rx 2 rejected, TX shrink under traffic. v2 on
QEMU pseries only, with the net fixes v2 applied: the same checks
with UDP traffic, and the KUnit suite.

Changes in v2:
- 5/8: keep mapping the TX long-term buffers before RX buffers go to
  PHYP, as today; v1 moved them after RX bring-up, which can fail
  open() under CMO. Drop the netif_tx_disable() that order needed.
  (Sashiko)
- 2/8, 4/8, 6/8, 7/8, 8/8: comment, naming and argument-order fixes
  (Sashiko); details in each patch

v1: https://lore.kernel.org/netdev/20261119000711.18093-1-mmc@linux.ibm.com/

[1] https://lore.kernel.org/netdev/20261109235556.60604-1-mmc@linux.ibm.com/
[2] https://lore.kernel.org/netdev/20261116174225.7d9e9611@kernel.org/
