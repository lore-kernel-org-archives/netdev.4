Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046594;
	b=vD0Wjitk8JRe0XUwmYLWQtZJtmqbY+CzydxemhHGK6DBUnXh9+g6lBasMxKAxFyY3PUi
	 bxElYyn8r1R/rCEuuv8lcfTAo/vIWJd7oSpMhfCsGOIfS09xNnh5Ft4lugZyIqEzLMxU2
	 tLhq63C53jWaxGrV8T8dFMIdKf9KnZA4CVDWB7Iu+7OyQaI3PYYkMUS7b77//Zp+IoZiz
	 6UXwm0z8ULsvykSkTx3tFR2wBpzMcJMiTucTs6cUX7GECdlW7OGSEGZz8IYlEP2N+/ug2
	 OuXUYro2gzOK501O65aHqY+U3PCgKtRQ8CSNfB32084mCjWraOIpaBW48l7eTyL5X3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8xyzpIqpstvyjrdOw7Y1t0/vm/NznKXwBBpGegTuPOU=;
	b=YK6kN/8YrDLCAMf7NYmDQSSva6aCMKu3g3fEv/vW8tDU8ssnZAsrUdWfUyMGAq0rhCPv
	 ZJJI2tFopobVgSO7sGZprpUQaWlhYZoe3hgJI5fS6diENV7o5LD4YOlqhBWrvSvU89PJD
	 WRZP1dJvq6ZH7wVGVyEpgDRlz6vnLl4nVQgj2SsjJ0bLmHvC/2uhtEksK2dg/L/RxMYMC
	 q/6+T3B3CVGv61mkUS2yw42+OqcoJFZKL4mahpjqiuDcGNzbgqJPwhv/VxCENC45t6sR8
	 MqKHRzUGbjV4YG8mMLb+rsjiQgtFyGFnMEfwn39T/a6VpqeWDF9jTZtVlOCb48bYkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sgDoq9cf;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F6606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sgDoq9cf
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILQg9G2240749;
	Thu, 19 Nov 2026 00:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=8xyzpIqpstvyjrdOw7Y1t0/vm/NznKXwBBpGegTuP
	OU=; b=sgDoq9cfBRO92i/GkzO2pDMC4KKuiYtJ0CGmFmi6zqeOxCcj93Cd+Ssep
	Yku6nenlawqPc2XlHAOyE64HsZ68aSPuiWzIkA8QAAmOEHeUy65AyH+OgaQMFDfB
	1toEBBxaotHbWYABSszj4IfCUtjWyNQDvWchg7wWEbgO4nqcvRU7h/7LMrfXEJh6
	UEhqushLMBzexAWtCIdV/RzeOZIo55ennC9SjnDCBlamdb0dj2K70pM9/29rvCw6
	SFlRNnLZt7qCOvFVpC8WNd4f9UkHTEjMznry8I1KPAjVdlyONrDJ+0RifGIud69D
	reilfKHvR/g1KMRL//1roSodS60Mw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105vn56x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:02:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILK6kF2587013;
	Thu, 19 Nov 2026 00:02:52 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j17c4u2kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:02:52 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ02o1K66388244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 00:02:51 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E52375805F;
	Thu, 19 Nov 2026 00:02:50 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DFEB58051;
	Thu, 19 Nov 2026 00:02:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.93.165])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 00:02:48 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: Mingming Cao <mmc@linux.ibm.com>, nnac123@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
        horms@kernel.org, davemarq@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
Subject: [PATCH net-next 0/2] ibmveth: two TX and reset fixes
Date: Wed, 18 Nov 2026 16:02:33 -0800
Message-Id: <20261119000235.15622-1-mmc@linux.ibm.com>
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
X-Proofpoint-GUID: iCAKMgOyH10jR6J70HIh9It-j0RgYZ_V
X-Authority-Analysis: v=2.4 cv=HL9WhYtv c=1 sm=1 tr=0 ts=6afe3cad cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=3XeKXeJX3U8D6EKEFAIA:9
X-Proofpoint-ORIG-GUID: DWFtc_QnFmWNRsDvqF_YAKz3JNLBUZDf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfX5lSPr6WRYyU2
 2VrVahd/WgBzHX1KIrgUijHz8j6DGa8jLp+KPDOuVaKFkrXFfuvvX+5OVA1eBE+qipOcYO9L9NH
 frECs4rfjHcRnSB/tEPuUO0kGlykjrsE71POprRgU13lrAdaNQHTl8Io6o+FwXZBIuAleRRjRJg
 zyfkH7ZNvEKdvH6s3+gAcpq3/Zlk/mB2Wo498hIQP0aEeztszvv+dk9iESfSz1AjSvrKgW09GiL
 fbMzLzkBgZGeTDihqwa6xyJWPUh9DD0VSLUkz+b336pulG7GOwtfVaiXZUdmlpDx6rEK0Kjkbiu
 wvtd739SeH7rs0G0wxy6EVKAKURHTMoo2Fz4DkUJKiY2D7W1PrCGOtAngrmtytTa4bAlY2Z/bxB
 wIqAoWAPpQThzRzzc3mpYOL0CfsWLoFde70UDERk9HHtVPbZ3IlRvlJqhrCb96DwcbWrU3T9XCK
 hTdaYxwvUKRQ3ihUtKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfXwSuAdlx+7ggh
 gnD0jzok4leXiZ63qtaxleRJmHnRmoUOjehevepDSaIsrwwaSA7omHq8RjRSDF0emwRGTqYlteD
 4gglbMD6D2gaVbyIvfzGb2ZhT+ZUUlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180088

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
on v8 06/15, patch 2 while splitting that series. They carry Fixes:
tags, but the triggers are narrow and the second multi-queue series
builds on them, so please take them through net-next. The first
pre-multi-queue series, posted separately, does not depend on them.

Tested: PowerVM LPAR. ethtool -L TX shrink under traffic, ifdown/up
under iperf3, and a queued reset while the admin has set the device
down.

[1] https://lore.kernel.org/netdev/20261109235556.60604-1-mmc@linux.ibm.com/

Mingming Cao (2):
  ibmveth: drop TX on a queue whose long term buffer was freed
  ibmveth: do not reopen a device that was set down before reset ran

 drivers/net/ethernet/ibm/ibmveth.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)


base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
-- 
2.50.1 (Apple Git-155)

