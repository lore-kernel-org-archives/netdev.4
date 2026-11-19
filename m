Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048219;
	b=f42yfII3XQHorzPTh7JbqfPJmY/GpfekZLrU1yFpQpOC20H+x3MaqOgcAYgxnT1fJfbh
	 H5DmKiFsLcUUz5Sim4+p3RsunJ77egshaXWJh8OjQ+oxbBebFR4twFSLCtRqUtKgKC+59
	 Uv1wr0zoLmYmV9JTmsbkcLS0ONRuZKq4RSWIjF0XIteYCDReQdK7lhHRyr+1fahd0Zyv8
	 0ae5525Iu9kUhru0szNyzPM+YBcrfTCz0Z7qnRRaEjmC2lZ+K67U8AeDbtmLdAv/8n1mB
	 5BO1drbUxlobuQiZ+C9jc+B9vSQ4v9D83JXFkChvDRifhJFqZIHmqHsYJsrCk4XXI/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zxam1vrXM5B1VwWPDazyd+QQbZEkReFXIjKzqFoHM/U=;
	b=KZgCDAGXqIaBvA3ETeADuWBtL/nQWp4LOsxJ+aC4EQK8T920syagUkkag2POIo2v3H4/
	 q63NDLzSm7ZFPSnHCgpLysIpQxTnIMCeBr7lFmGhePC/EQ5yoc1YHAKMPZZ/KuA1PMDqj
	 hCBy6W2mIZaQ4uJZEaKfEpOLCOWjUHw4DLoEKGCzWsaxZqK3SMji4uDb/2kxt9dyVfhzs
	 4JY3am5BfADxWi2PLWqAa7b33JpihKn3Fh17aqk6eFMGnKiH0cijPlur7cCCzIG1cmRSw
	 xRXJWxO9tH3n2T7S8nrDHDYRskrFqGLNc704fINELHArwnY/Ps9qW6nHZHab9k1ySuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFOYsquu;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F660A2627
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0F660A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFOYsquu
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILQcPZ2240623;
	Thu, 19 Nov 2026 00:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zxam1v
	rXM5B1VwWPDazyd+QQbZEkReFXIjKzqFoHM/U=; b=kFOYsquu6zCav1fN2Mrrv6
	W1KEB6DzoQcVkqQCeZHBvoelML6z57vqXp3+cf5hqbfp7QnzRi9BA7kHr5utIrb3
	oO079+ji3sePXsZkfTe3V38dCl17KOdosNE6pc2piX50ceAsKQiAKjeQ01dR6cBx
	Yj7KJizhkvsjrJGTgwLAO1LKN4291SFbwuaAWqeUWq9RHNe3uYixq/NrR04/2KS1
	US7/x3ub8yApVPQ2fonK0sDSnpEhLbjiQzp5hTQJ1SoxNtBbUaci4iKCStlnB94F
	C3fG49UsHdWBOLOxzaoNCjyT1N9N3hdQsHnuTpzjUgG8P4fUKl0fxAU6KUdA7KDw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105vn852-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:29:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILbNRY3716181;
	Thu, 19 Nov 2026 00:29:58 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1m3hrffw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:29:58 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ0TuJN58917298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 00:29:56 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E7A35805A;
	Thu, 19 Nov 2026 00:29:56 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7A5758051;
	Thu, 19 Nov 2026 00:29:53 +0000 (GMT)
Received: from [9.67.93.165] (unknown [9.67.93.165])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 00:29:53 +0000 (GMT)
Message-ID: <6f0fa4c6-7b16-4561-ad9b-4dcd728e1aa1@linux.ibm.com>
Date: Wed, 18 Nov 2026 16:29:53 -0800
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
Subject: Re: [PATCH net-next 0/2] ibmveth: two TX and reset fixes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, nnac123@linux.ibm.com, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        ritesh.list@gmail.com, sshegde@linux.ibm.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, horms@kernel.org,
        davemarq@linux.ibm.com, haren@linux.ibm.com, ricklind@linux.ibm.com,
        bjking1@linux.ibm.com, shaik.abdulla1@ibm.com
References: <20261119000235.15622-1-mmc@linux.ibm.com>
 <179504684743.3291.10300720489651147627@kernel.org>
Content-Language: en-US
From: mingming cao <mmc@linux.ibm.com>
In-Reply-To: <179504684743.3291.10300720489651147627@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: DPoUV0YR8NOBFJ4MeZWsoCbaE4DT2Pvh
X-Authority-Analysis: v=2.4 cv=HL9WhYtv c=1 sm=1 tr=0 ts=6afe4307 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=anQ5-TqrEUfaeNihTikA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 56rBCxgIaW54lbrGYm1p13ShKgOnnMNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwMSBTYWx0ZWRfXxeBHuqzOEkGy
 CgxVcH/Scuge90Io1Lb1C2GT/dvJALAjB2XIM10r5rpmLxn5ka0FpOmogOBWu6tPvQ0GdGr/8xV
 iTAJdb5sOAMfxLSg2FYBX0jhajscDBSeoyIs9y5rJ8j7YUxwlU5e4F02dezAxMyMhquRjh/X4i+
 7VtfVAKlqShQL/gpMkNAADjHA0UqiHNVv5fU/M8eevh+8lrTwzsqiZ4H0yFuKOMH8zrLXsaVNJ2
 0qQlPKsiHggWyeDCqNm6JhDmrLzOgntIfQpt5aO8J8FKqh0c02U70wjlklhMwlm36TwKMJIBnHr
 PtHR1MF4RcUbBTzx9W9uxpUD6kCLurENRDUYieEvVph4ZW/nJv06yYp8SRsIIQDke2pL0N9na8z
 bwqZcAlKHcJCO/mneLO8y9sCWCb0evPJ4Dkh0JuGYKuIti7zfCgARixRlahfqn5vKG0T31E2Noj
 KpdvaMHCi9M3aVdypaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwMSBTYWx0ZWRfX0kdtqdIjDfSG
 R1Emsdb8+Sm6Rg1CNhpmNkv512PnbaBt/rPAQyae6LzuOEZBmQCj29OlcjbfSWAlsEwbh5n3B5a
 Wk6tINj9mFEf3h12ti3PqxOLpJ11JjA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190001


On 11/18/26 4:07 PM, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
Thanks.

Some of this context was included in the cover letter, but for reviewers'
convenience:

Both issues were identified during development and review of the ibmveth
multi-queue work. Patch 1 addresses a race when TX queues are reduced via
ethtool -L while traffic is running. Patch 2 addresses a race where a queued
reset can reopen a device that has already been administratively brought 
down.

I could not reproduce either issue directly. The fixes are based on 
analysis of
the existing code paths and rare race conditions. I exercised the affected
scenarios on a PowerVM LPAR, including TX queue reduction under traffic,
ifdown/up during iperf3 traffic, and queued reset testing while the 
device was
being brought down, and observed no regressions with the proposed fixes.

Thanks,
Mingming
