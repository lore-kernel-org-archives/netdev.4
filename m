Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046602;
	b=h238jSGK5R4bLgiK9WXDVRF9uc6wBVrCTa6+RZlKvuEKe7NBMNbI0je3+gFnwxgYyEHU
	 vzEZBY3Y6QyWf5I62IE4psfFI5FlUkDkPhywfPId4emENqNtWU64rZ+EQ3LV1EZ29VSbT
	 H0HYjNe/G3MjQI1CQ2UWNxL6JJeICUs1vVshBlVo7me6rIFbVoGXK8dOGKZTd86pZE+YA
	 vQp5+oIeQUA0y8Wofcnq/CgRDjHsmDGQLRYacqqPCVdC2X4SdPsnLsdaq0uUXj04dDMAe
	 Eg5JW+9w5s6pfsC7/52rCCc8ewXS5LL6PoqPAXeeH5RZ9M5WPLo3734vCFEoyxVpTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qoSYqZJPdjw0NsMcF/B9lDgsmrULr/nipvcr+oftmd8=;
	b=XMS9c0Q636w59IRsT5npo4NDSzyXjAAOR+B3yF62dMHC4zM9PLPSIbt9VjLCxKcN6Fyo
	 7ncUAwqOCl1zObPFgx9QK6OQ08+uiBZKE5A5yVQRkBRy+/GH+gWkzaLkE00IpxDuzNAa7
	 O/i7YYNTwdVgrheV8ubU6cewT6DBWgDl5WFU13+UuSKoZ/nnUzNRU4Y+o8FFeuRmzOyct
	 LfVkrvzxRCZlZVS0/oCHK0orHOb1CMUQ8xRv7SrX1q9q4C93JA5kHk6VD9Z1GvXTOCBwn
	 g7pbRKTieznER2OQV/EKYfKcYchVWAHid1BHBIwjsKGozj1ZhkaOfr7Q6kBJgCtwSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EyeJJuBX;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE55606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE55606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EyeJJuBX
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILQpAo2377736;
	Thu, 19 Nov 2026 00:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qoSYqZJPdjw0NsMcF
	/B9lDgsmrULr/nipvcr+oftmd8=; b=EyeJJuBX4md0a+1AuBafuC2ejWawt7JtX
	FmMjCwyB+7xHY+zITSSMpPDzRXKWPuc/Yw4agOfJYEzbTyudfcXcZxTN98RQmaqN
	OjvUNKosaERU5SJlrjt0LJf16Gev+7g3NihZ5WKEDnej91lgX8bTmqG4gp27UYi3
	c35k1XSTAJzh0P7yLNZvRxTKhvZlR5khuSadB/wMb6q8aNPPFQsP6JEkKodPNVvH
	dzJ6nqd7IeRu8REx8bS9Y8h7V/zDoWYPyXeDRunr/WiteK9LEtpn5pibm3FCeZPc
	YXLMoLDZc2jtsm7SqpwI0zO14GhG8tBMFxSeBq7CLMS3bNCfg+00Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105nd990-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:03:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILbI393716116;
	Thu, 19 Nov 2026 00:03:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1m3hrcm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:03:04 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ032TW66716068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 00:03:02 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EE5658062;
	Thu, 19 Nov 2026 00:03:02 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D475C58051;
	Thu, 19 Nov 2026 00:02:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.93.165])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 00:02:59 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: Mingming Cao <mmc@linux.ibm.com>, nnac123@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
        horms@kernel.org, davemarq@linux.ibm.com, haren@linux.ibm.com,
        ricklind@linux.ibm.com, bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
Subject: [PATCH net-next 2/2] ibmveth: do not reopen a device that was set down before reset ran
Date: Wed, 18 Nov 2026 16:02:35 -0800
Message-Id: <20261119000235.15622-3-mmc@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261119000235.15622-1-mmc@linux.ibm.com>
References: <20261119000235.15622-1-mmc@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfXzCu14CiuczPS
 YbiB0aMey8x6H6iaa/KtTTVoXT9UoOchtQKimgfZiqJTNrv5U6B8yqf6rHRqc4inuDE1FF9MgvA
 zYD37hEFT4ndjJ+ciNVM1lVShIOsFvJ/iQFkPS3r+wJLi3nKk+R89mhe8zsKW13Pdwo1n1LdPuZ
 MLGygkrf2abouzxfIsxV/JmkQBvVaKWSavfpnkBmsG5RJoqij0Dv4AtWiYAlCdhS27oDAaY6hri
 YhhBEI3ojDTDQOtPOF+PH/NHERSCcCPUhkBt+f2Z9j3Er16G0Fa7sFo8IZZaqVcz58lVYnv34cH
 q0L2RKLzXrkuuP6WYIB/nkFYZ123vVmbQRTzAfnSlNupJjZEffY2a26+q5afWawYJ+/PE4NYmcq
 D4xG1sOxysmA2aPm8dXL79NXDhyS/lBC3vEGc7nWrJVulN7DM6pS0+WvoiKuszv4QE4F6MJiJ0y
 cyOOZVfASMmaXWDgLPA==
X-Authority-Analysis: v=2.4 cv=HN9WhYtv c=1 sm=1 tr=0 ts=6afe3cb9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=u5j9OXQO57bvaG0S:21 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=1uTVibehr-0tYGdTOcIA:9
X-Proofpoint-GUID: HBSUZ640VcRUSUDNVOWfBpJwOQxFDtfR
X-Proofpoint-ORIG-GUID: dj9mtO1vteOVG8AloWG0oHsR_TNrl3QW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4OCBTYWx0ZWRfX29JD8GF3WQmV
 eEqN4GAoOqNaN6MdsPMi2iNnedtEroylDKaemoYkp8bxChclaIpDqg9qAmYSqA8OiboPoMsAWwm
 v/WDwLCv381ZCdYumFsvU/P4vDCTy5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180088

ibmveth_reset() runs from a work item queued by the RX, poll and
replenish paths. It calls dev_close() and dev_open() without checking
whether the device is still up. If the admin sets the device down
between queueing the work and the work taking rtnl_lock(), dev_close()
does nothing and dev_open() brings the device back up.

Only close and reopen the device if it is running.

Fixes: 2c91e2319ed9 ("net: ibmveth: Reset the adapter when unexpected states are detected")
Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index faacff14841b..34745df8daaa 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -904,8 +904,10 @@ static void ibmveth_reset(struct work_struct *w)
 
 	rtnl_lock();
 
-	dev_close(adapter->netdev);
-	dev_open(adapter->netdev, NULL);
+	if (netif_running(netdev)) {
+		dev_close(netdev);
+		dev_open(netdev, NULL);
+	}
 
 	rtnl_unlock();
 
-- 
2.50.1 (Apple Git-155)

