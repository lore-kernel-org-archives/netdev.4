Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545803;
	b=wXuZfGg1wdvO951euKP7RHKzqrksUx7T8GbMEBjNiXPKsQrYyBfzjwuILOGfWLnfk9tz
	 CDoaroJsbf4JQPl4F11jTID18yceZOS/SXTLnZSipXt3GiIYm6ITX52zAEGgVGSCVsmR2
	 TgBl4DVQEIM7ieMALiqNbK8my19utC4ksix4eD2YzBJWJJ5bcGtBLTJucfj4J9z5xluEf
	 3erlrineyeujIgkqvoKVlQpBQBv+R9MaSiB9KMHJYRzP9NN6xwAl4zChyiXfE9aAjRE3O
	 aLJDA+EGu+/UklXGhS+Oug5RC/DizwolXrBEcTvlVV1wEKriqOxLy8bQlbGV5iRTitg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bQRQZy30Tebgu8DcmRcM6e1SmYwydzEVaBJXylkhXCY=;
	b=ZcDBiDlI0Jj/OpKYExgeHO4cHYiTG/AyxhET6GkeOZn6VJTEArhOAGLW2YknpG2DAkwQ
	 4tGHm7d7eGR/qMpC+35lj4Vi/Yx0Uj2IJgBQeY/hJNLwDrn8gcIgumFk7X9xESw/9d9dU
	 w5dpoDZTXy45tMIGI8qa9LG/mzyv/2CThaT6S7+9Qv5RCwTOQIWZM8hxee8VG7zTJoE3W
	 4bs7efsycYqNkJo2Hb3YoW4CBTJNqzkOCics/UESZZs5AF1lfzbWU/8AV/Cbg3oWdE1JA
	 U5v8hZUGKvMez7nzB5agNW9eziSNWyPJkvuU1AXQigVasn7rwWgiKg0f7lrzBO5qEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sh1fXG9L;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC5606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DC5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sh1fXG9L
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIYu333378756;
	Tue, 24 Nov 2026 18:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=bQRQZy30Tebgu8DcmRcM6e1SmYwydzEVaBJXylkhX
	CY=; b=Sh1fXG9LlVUlcAqd4zfE9MS34ZSnVc0Ju4U3XPG+4Ydev7WmT6Nxfwku6
	NXw6UqU6/l8JAr8185xqg5gYGB5ip2Kkn2ibZGg2lIwpQZOjTc71hAl4h68pLSYn
	6qv+rzQm523BGrbMll9+iUFE0vHAbON/6wVSqHxtcvFwPizgN0pntkfK6QbsTzIA
	fs+Q/HHJ2orqJx3e+Lt2whmHJj6q559HQclizedZt4UQUNzeheUzcU5HIVtejB17
	RxS8jfUp5KOcQAa4xhX3rHkQQfxede4cdImplCKhEJYLR+IXmYtQBGV1rmDShzdc
	TS8i4PPLMxWkOHg9uLlyOw/onVjPw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fa970k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:42:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIZZjO3855073;
	Tue, 24 Nov 2026 18:42:51 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5dcurm0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:42:51 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOIgncX6882262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 18:42:49 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2C2F5805D;
	Tue, 24 Nov 2026 18:42:49 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 785CD58054;
	Tue, 24 Nov 2026 18:42:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.103.228])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Nov 2026 18:42:47 +0000 (GMT)
From: Mingming Cao <mmc@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: Mingming Cao <mmc@linux.ibm.com>, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        andrew+netdev@lunn.ch, maddy@linux.ibm.com, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, davemarq@linux.ibm.com,
        bjking1@linux.ibm.com, nnc123@gmail.com
Subject: [PATCH net] MAINTAINERS: update ibmveth maintainers
Date: Tue, 24 Nov 2026 10:42:41 -0800
Message-Id: <20261124184241.40470-1-mmc@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MyBTYWx0ZWRfXyzHLLEUDR697
 9ILHeuUH4IFzG3zgTyzT7JbYTrPKjpmDxph2BEvaGqPy6sHwFOdXKiYcof3rbFAAKR8WGgkKkps
 mgCoeoCZd62UeExAEEbg4tD6dzybfk/nx1RhfRqn4DkRrbcin0Gw+JD1noKfVKumUlnQR87CaiX
 m02TfmUNKN5F1WSZF2URcQ6XUhZO9wCoDPMGlWayo4O9mbv0r7h8cnv/Wyg/hDAxMLLDgmwQ20j
 69ablalLWBLdVHoD37klkL5RvUyBUxnIAI332ZP8/yuSM7iUt0dY2oAnT+boYAk/pg8ZYGDInR2
 yOHEHV/HLzrvxTC4xJZK5ESALR0PLRx1tEFjloQyYihVrDZPTeHaNpoohBflDFsnjAoLoTMIrBe
 FdgpEL2Ro9wIqzjrTg6J3st+cdZY4aMfuoQmY42cpbq1xhTC8P+lLH+TZ/AWbVmfM/G/A4tb0je
 Rv1WPTXJ8ImZ7F01thg==
X-Proofpoint-ORIG-GUID: 2bjDnoBkweei-uQJdA2TUAUIqovxFlT6
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b05daac cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=PrzpYAlufntWHnhYRjoA:9
X-Proofpoint-GUID: CBY8R7go3T2zK4WZN1tAkC12FzrYuzE6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MyBTYWx0ZWRfX4beoaIRRBaM0
 QfDhCB2OUj2r6x7q03LrGXP1bxyEG+w4tUi4FvD5s9Aifirz52PAQBOFI7xch9SRCvkZ0dsCRY4
 bkpkol+dFkBNXywTQDxWfFY6h08jfik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240073

Nick Child has left IBM. Take over maintenance of the ibmveth driver,
and add Dave Marquardt, who reviews ibmveth patches, as a reviewer.

Acked-by: Dave Marquardt <davemarq@linux.ibm.com>
Acked-by: Nick Child <nnc123@gmail.com>
Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bde216003f42..8f063466ded4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12796,7 +12796,8 @@ S:	Supported
 F:	drivers/vfio/vfio_iommu_spapr_tce.c
 
 IBM Power Virtual Ethernet Device Driver
-M:	Nick Child <nnac123@linux.ibm.com>
+M:	Mingming Cao <mmc@linux.ibm.com>
+R:	Dave Marquardt <davemarq@linux.ibm.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/ibm/ibmveth.*
-- 
2.50.1 (Apple Git-155)

