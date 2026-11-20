Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.148.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149756;
	b=5dusPnLU6GFZ9YIKm8e2pWDjGdTVh7ti5ge8aQl8ozuon+Tj62cYJfPYQ3hJExtCNAyM
	 deoxzsiivk6usuYIoEECK4NszJfhs4P8Au1+BOEjXl4+0yUTk1Lz+GMdG0IQ4KiQIUd14
	 0v38VwMG4BwhmOv7l8Jw5Eo+Pi8uw3Q6K1F9YMdHABlFDiegV5v0fYY0d4W1L/nybrHOt
	 FLWZD3EIGrBYlsVKNSehG3M73CNGual/lAnWIrp3qDfWFSadMuYY5yyurF7SI8eM0q7j2
	 Sw1kNMdjyrqURQlV1BHbrMTacBCku0oUzIzQyIjCahr4jgpqe6RGrylGa9vX+Thi41w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=tv2OWNgaMYmQg4Qt84tkUKl85OdZ6bjkx4NmouYe1y8=;
	b=qLzh3s/KZTEX7d7HciATxSvdpWKMnwakUvvjOJHVlqVRWKc/C3TMUMzJi9kMKF9/d5OS
	 q7bwpW/jrsqHOhu9JVrhCGtT09ru0pjFQI0DlSYDrT8wefJvs9i2+NNSE5BV573fmBUCS
	 XGEc2jdk54QioLJiu6Mpcz6S82/EBTdVWOYvuns+WorZPUDwsU+n/FMCuvOma7KsY79wD
	 IueTZdDyWxkIwcdDCL7HSOltdy3BcjdxEDBpJozWesZ5MWPUkpwHKuUtgjxfuGZhT5xM8
	 oOrN6bQDoBZn3UH+dnywjeNwrIHvoFgECgQ/UHWBjM4DWV3LZ7y5z07TEdIZ4DmlSug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=iF1UAMk2;
	arc=none smtp.remote-ip=67.231.148.174
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E06606A320;
	Fri, 20 Nov 2026 04:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E06606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=iF1UAMk2
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3TBvv2566929;
	Thu, 19 Nov 2026 20:42:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=tv2OWNgaMYmQg4Qt84tkUKl85
	OdZ6bjkx4NmouYe1y8=; b=iF1UAMk2ECgvFlsBXg8K/sOLewBEcVTUwVQxYFrQp
	kBXIt8XyqfYxhrTzyAOOS89mjAKgAE790xRh5gIxmPpKzWVqB06Xz5dIJ5+AUce4
	ePwMvORfED5rlNyrK6R4QVstPliEN5TI3KojrJB194vV4ioRI7yNq1QZhIJ2IIWI
	xzUZyxQgrfg+bmQdAicW1+2agWL4TBfZ7+Qcjo6+KBjvc6JFc23YX9RSW5AKiXbz
	QSeCQq4M6ME3TpS2/forRCSAsbJNQt0Yr8w2e9fDEJIyolZodfuXkv7NDfbesmYY
	pDeaapSEeD9iU6d4bynqIvZbLZdQrdccj1oof1S93n1XA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4j1v1ywfqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 20:42:26 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Nov 2026 20:42:13 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Nov 2026 20:42:13 -0800
Received: from nitinsj-apex-workbox (unknown [10.28.40.177])
	by maili.marvell.com (Postfix) with SMTP id DF2CE3F7075;
	Thu, 19 Nov 2026 20:42:21 -0800 (PST)
Date: Fri, 20 Nov 2026 10:12:33 +0530
From: Nitin Shetty J <nshettyj@marvell.com>
To: <netdev-bot+sinfo@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Rakesh
 Kudurumalla" <rkudurumalla@marvell.com>,
        Sunil Goutham
	<sgoutham@marvell.com>,
        Ratheesh Kannoth <rkannoth@marvell.com>,
        Geetha
 sowjanya <gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v4] octeontx2-af: Fix BPID leaks in NIX backpressure
 enable/disable
Message-ID: <av_PubpMWsFbtNDO@nitinsj-apex-workbox>
References: <20261119085434.2598197-1-nshettyj@marvell.com>
 <179507867908.3291.9474943477334370542@kernel.org>
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
In-Reply-To: <179507867908.3291.9474943477334370542@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxOCBTYWx0ZWRfX/w6bP9O3CeNh
 KkFUm7yopFyilNvESRuUcc3W6D2NdEv255jzGrPWiKRSuUBbKH87OA6qDFZemyYWuVA0Fye9tR5
 a4ZDq0U9veVlJyxXi2dqS83zHgAEVaNiI75i38syRAK9sYz+PVKrBgHHyztCoJa+eoIeqReRIAE
 VHjmqDqa+JMXitaoAgDY4U7oFbw1wNk1lSxW6n8wxIZWiESSOBAt48Ndnie3gSuBJs/jL17I2uM
 ZURdhtLoHb+1Xsclen1uZYFtqrvtE93YmCxp3x5xbNaWAPc/uLDJCYLavG6AWJ2gBJux1tXHFqp
 5It6K1YDH1Jkgl38A0Sltz3HQipxqsaudvRFzWMXMmUaAKjdyGDA5lHkS2QG7gPek8jE1fxHoVe
 /hUTt6qvIAD42Qjnkv9v99LRkOpQ85aeguCPUnriM4SK4HObuAqKbqeyNRF6ABx9rSatx2eWrAU
 aQbQ0d/EqRQO/ruxZNw==
X-Proofpoint-GUID: b-kQXsX65zaITSyubxmXN8r95MBzOeeK
X-Proofpoint-ORIG-GUID: b-kQXsX65zaITSyubxmXN8r95MBzOeeK
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6affcfb2 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=TtqV-g6YmW1Jfm2GSLaY:22 a=VwQbUJbxAAAA:8
 a=wfrYX8O7EWgUh0Dss7UA:9 a=CjuIK1q_8ugA:10 a=lhd_8Stf4_Oa5sg58ivl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxOCBTYWx0ZWRfX/Hvw8fTMv8//
 9J5L6W8qZMqOm5Ha56UJJPoWyDy13Q+j8pC4SWV7ynVurazyFMjkRuCRFaRxVNwQ1AE3AaDxRxZ
 DaYAyPrnDz02oYBbRqNQ+Hb+kJT7Vqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01

On 2026-11-19 at 14:27:59, netdev-bot+sinfo@kernel.org (netdev-bot+sinfo@kernel.org) wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The original issue of calling rvu_nix_get_bpid() after the last channel
is programmed was found during internal code review the same is tested
on CN10K silicon. The other code changes in the patch were added to
address Sashiko AI review comments and compile tested only.
