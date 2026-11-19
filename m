Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.148.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077607;
	b=AIOx5QxA79uZWphJvW0uW/qebkBPDvZpMSJTRFBYfjWsVVyG9rWAkYai2Fj39dImN7JT
	 obvXXZ3rzVMR81MG0piHdmAfFff65uxk5ZGHUS1ULuydGt5BtbTtzC7BzqwLHmwt1CkNO
	 AKlVC5KuOePuHo+P9MHLtLoO/WcoHKz2niX7D/wkn8nJFE1m1If6WoUpEFyeCyquNDC+O
	 PlZlLqlQv40YEfhWMjnD3kqQoIgaRLapouIcaagUPwcWaKkBRfCZccmeAGP/wO1Q32cPX
	 e/op3pVtINwuL75HEUakdo/Zj6qrk1cLupo+OX5WYQW/Cg63Bf/SPcQVPn+B4KbSqwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version;
	bh=+nnppccnrPdQS3oSj2e1f2frou1ho3MirEa2j/u2NHk=;
	b=TUtWMBystRLOUbkHHVkmCM5FK3q/Aev5ruPJUEeRgheb6rw46rucje6WD5rTRIFIez5H
	 obdfjfyJGaXevRnp4QNaH+8G4y0FvKRlb/AegYXQ5Pka7lswDKbb5u4qOkmjgSsp3czwX
	 9vZf6//x5QzPndPsGWaEustI9Ro7reqY8B8RrwnWnq+5moavbXjXhwvBIdDYDseo2qh6Y
	 q+YJ5JKYcc/Fn6HIuGqqLClyKgQUuqrkEZstj+DHX8WIELy8mssXMFmiD30fJgzuUJY62
	 QalG4KOjdXTvY9yfu0gM/cuBQfaFbvKWKGIpzt3igvRB/SMFDS2GbQUrwCb2dse2mjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=fbkECKI3;
	arc=none smtp.remote-ip=67.231.148.174
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105B60A6F66;
	Thu, 19 Nov 2026 08:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7105B60A6F66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=fbkECKI3
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6xCug2692545;
	Thu, 19 Nov 2026 00:39:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=+nnppccnrPdQS3oSj2e1f2fro
	u1ho3MirEa2j/u2NHk=; b=fbkECKI3aZla5wz1113bzZSSRWgzU/a5irO398Tsk
	VTNYOZh2iNuXOqY3qngHOCHosONF2Rd7c0dIwoQaXELtNwwbtIg7Tyi2LGjySOFo
	ZhN+WwCjfwzs00tms+2U49/q8DL3osyiqQqzns2gdRyFWlXQnWmiDD+27G446WLe
	bLDPcI7NXhVXlP8V5qZYWvCGWejS2YS2Sn9wi3FExFN5v8P812ntF8HSjBt7Wh9E
	kcou4MifHY4Fwf8fMvK5bhbjDxnO2LwLX4zNf5aY97TpIWYlO74iQT7H6QhBi5uP
	GZ+cvxEZdnX9q99MtPytC7Hohe4SZJZPqh6J3TB1B40wg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4j1qq594q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:39:42 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Nov 2026 00:39:41 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Nov 2026 00:39:41 -0800
Received: from nitinsj-apex-workbox (unknown [10.28.40.177])
	by maili.marvell.com (Postfix) with SMTP id 9820C3F7075;
	Thu, 19 Nov 2026 00:39:37 -0800 (PST)
Date: Thu, 19 Nov 2026 14:09:49 +0530
From: Nitin Shetty J <nshettyj@marvell.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <netdev-bot+sinfo@kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Rakesh Kudurumalla
	<rkudurumalla@marvell.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        "Ratheesh
 Kannoth" <rkannoth@marvell.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v3] octeontx2-af: Fix BPID leak in nix_bp_enable()
Message-ID: <av611TUcVJ6fsS3j@nitinsj-apex-workbox>
References: <20260928065718.3378580-1-nshettyj@marvell.com>
 <179057876428.31693.4036993774330437044@kernel.org>
 <20261001164627.005ba3cb@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261001164627.005ba3cb@kernel.org>
X-Authority-Analysis: v=2.4 cv=K5a3jCWI c=1 sm=1 tr=0 ts=6afeb5ce cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=EAYMVhzMl8SCOHhVQcBL:22 a=VwQbUJbxAAAA:8
 a=BZ32L7DJohjJ_UDSYb4A:9 a=CjuIK1q_8ugA:10 a=lhd_8Stf4_Oa5sg58ivl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNCBTYWx0ZWRfXzQA/FCO20GgO
 xAdNDZ4W0Bo/Lazuax6ft6o6X2AZfUxq8san/g8y0iT9YVaPHc8zmOaHxOBanTXytFe1rXqFPsC
 aK3/l/uNEeCecPHqRJBT7HpNGCsdg/fQpN2RYSV6C4/iXPyma4+8W5Bp/qnDNdaIjHKKThOj+Sp
 SAhOGFHvi0nLYCLIfZS8RAvtVAcamDdzmfOpfGPu+YTXWTgGUZ2RwggmYvbTfpzT9UklglNBFpO
 4j0LCn2pHmLxzeBDfXHG/1ItF6Guwmn8/+wm/k3d/b3vQPCHsS8He7h8SeSHzvs9v8lXauduCpF
 5Dl+vwJAtOcVWZVD8DharQsz595XIDfohzUBZfNhs2k+CBCTURmCFqK5SMZi53OvYW5Y67P+2Bb
 T+tcvJyJ66B1rUVXh66dp6p71gAFZ7nh9J948BdidtkDkNYeaEWngZe65Lz53P4idc+I96sK122
 dXw6j8PyHUa9MGLzJ8w==
X-Proofpoint-ORIG-GUID: 6PNstYRw1hXL3GbXRQQ8q7i0sH7zqsP0
X-Proofpoint-GUID: 6PNstYRw1hXL3GbXRQQ8q7i0sH7zqsP0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNCBTYWx0ZWRfX1bVX1SfrPBNU
 EpeF4/c5PGT1TVsP+3K1jwFLRFHW/38VkD7VA2lLPSrKeTX/Th2SSH42iTozHWx+E//Cpsxthdv
 KPH/03ulBll91ZSjpsGolB3zd6TYW8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01

On 2026-10-02 at 05:16:27, Jakub Kicinski (kuba@kernel.org) wrote:
> On Mon, 28 Sep 2026 06:59:24 +0000 netdev-bot+sinfo@kernel.org wrote:
> > Hi!
> > 
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> > 
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
> > 
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by code inspection). If it was triggered please include
> >    the symptoms, like the stack trace or error messages.
> > 
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
> > 
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
> > 
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.
>:
> You should respond to this, lets you find yourself with some auto-ban
> for having too many process violations :S

The original issue of calling rvu_nix_get_bpid() after the last channel
is programmed was found during internal code review. The other code
changes in the patch were added to address Sashiko AI review comments.
