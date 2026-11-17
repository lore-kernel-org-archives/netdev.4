Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794953064;
	b=V/VNt1UipDuB6rIpIpICOQiAvE/xRX+/lToL7cqCM2Lz2CIoJB4185me3r6khbGPbOgS
	 /FWJxYgooDwADOxjD+wbJrZLHyw+ttwq44Y7wDGAZZ85M1u8Ef1gZUEHUCQatiFgGnR1D
	 3r/PITA4Kp3aezxisipqSyQ4trlzmW9Dm84+TEWp4tFO3WNS+/zth+no6aIJk3bUSTxbi
	 IjAo1uX1XwyNmzI8ei7VdaP01CvbvMZD9uAkzI8nSZVJybCU992EqL+HLsvGs7y2rR0/P
	 h6rPV13qtcpDOIJbGzM59gAKkwPw7MeQe/Ycn2QS/AQHFukDzCIUbaWcDotzi91p80A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
	b=eeeOf1+IPnswD0eGvdrBQV9JZ7cjeCzTf/JN1WO0CJj3W5FPk8aHf/B7AmofRSUZ+CuF
	 mUKieCf/0a7Hqrc0Z+RtgDGuka8m+BahsNJwrjqud8Ur21FiEmDh2DhIx2fvNtDXY2Z5R
	 1WyC3EELNwWUxbiOVQAXaqwhrJcYb3LK3FWp+8H1sMD3IHCsYu4WCuJMnc4gMiLTs/Bxo
	 JW/J2I3ktsKBx4dpGTBySUwVhOGDwMeSjsWb+o/o1e5+ukrOZrq1ZmJx3WG28wNWOPgI/
	 Pw4l98VKlfGKrzuOLADyUu29a20r6axCfyJiXUtrGUbjE4E9c19hej4lG+xiMnD0M2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC09606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC09606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM27Fh4068120
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:04:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=F0h8eziyjQa
	KcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=; b=l7uGjHqQiohs5ekfiARvjRSqonZ
	vfWTdNRDAMTgYbwgHd2DiCaSQiby1P8w8eUQPRR+TIo9nRLlBQFNdDnVag4VjV5v
	zrbZw23J8ETzA0nATXP0IVDkySa05zQZtoRlDwRuy1a2ZoxUH4Pp1yJR43RsCUgv
	tl+xcJlH6woyek733bANbYzH8HReXmgA4za22Txg6BnnOkOdLsXPCv3qcCky4PEl
	oTyV9zDt2xSDfhUpHFVmZaywQ69nMGDlbBxkhLjsgqHBVVkUhwg+7DJBMhDNzWHE
	pFQ8H/gSSYpsYTJQrKrhs1zeRTZ+DY87ItQdcFZRO3NzTPrKdYV1xdB2t8g==
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0t1jccm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:04:23 -0800 (PST)
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-499ca65ae87so83354f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953061; cv=none;
        d=google.com; s=arc-20260327;
        b=nivJ5XIFbMoFek3SEEQ3JvPnHzcumwCb2Rk3iTkHbkGbTXiZP/fk+M7xRI8SQyizVn
         G1cPflZUpmZa8uOq8R20PN8zP/lm8VoEjcmIh8kkHVK3dZFsOVW10uU4jDVlKOLt9GRa
         gIkY6z9F4p/QAOT/MKn/1YAH6g36EtKCJzhKj2aJw8MrjXpWtuh3pXgPW8pDmg1T78Nb
         K1BsrL9VUlOV++xa2bZpHvznIHz8WXaHOWSKnmHKd14waTwdk6lMbNDziZREik6FqFc8
         iCDn+A1l0g8IQ1iUjzDqSNRuycYysyKJCsH1LgK9c67KaSSezxsoQ5gq5OioxJEDHs2T
         BJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=MEyipKHoVygygi0qNB9oI/N6G2TrAIjKGyLslNmVdqfmHWIl6tjcpBb312i9K/vmyz
         rIctAsfZCIOzydH3mwd2thsodeyGIaKMAVzMOgwndzzjmRITq+PF6puYPio3+xKDPI6P
         lXw4ZbszTgQoeLm+RHvsDT5Ah4ELIPRndz5lhWkrhnUK6gqkd2gpCQKBF+b0AvYS7YA6
         7GWWp2yn2VOm1JWs0uZRq+vcHOYeyDpJM2TOK9+PkKF2NhkAN8Es3zd0YqJk43jeVpgh
         ZXCJmdpbXJzXKqRvymrzcNlfd77D8GTUSIIwf5frCv2RSk1X2PKO/2vpYGLti/krNR3M
         J0Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953061; x=1795557861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        b=WqV7TeF3nKljcPfMffjgFIkEgkzsugXsO0r1giLYIQkVWPkX/6lXbBHykpeihmMFoK
         Fgx/jNipuXijwWqYb/9z56Q8GhFphoOS3iVSYyL/N8/SZiQxMeb9gekA4ETRAl8JoVXR
         e1nxGDxLTsoSCAN6yUBsvG1PrBXjuAyCf+eEIxw5UYJABQ7G96qri9qmG57WMSnCY/Oh
         LpDcRTfxtvq3izCx4jEzq8fZ2EP/LqZJNkcd40a2xG7mzTqibv/8xVnzyPFI1is7ZdRH
         J+xP1dMBRkiNo6lp2xg5WrP86QiCQSYIwSB3py3tF2o14XOj76phMeGsrARsUNjWmBzJ
         1uOA==
X-Gm-Message-State: APuU4Z/Yz4T0QRKi/Y0WcGgUKycc9L591W5a29CXpJnPtHKhWpxKb5J2
	QnHYRs+kIk2TWqRJUg8vPvjRgkAE4a7sgFei2rOi3C7Wuenuw3PygZDNFDns9NHeLU+Cp6qHwyL
	6L7pkyqc79/XMNw2mhmvFmYYpOwuTDjD4FbRwHl45gpOpxoOeCMYu80PTrqz9sxQWDWIyOrToeX
	k5RhqTnihf9dR6JunznZXp54d0IpXPe7k=
X-Gm-Gg: AZFdTZf9m6VPpqcJENqrLMGD3InwTPcm7EksYpXMA2+X8i7/kjZQ7TzChQ1rxzsPJbD
	AciBJxzY2LemK5wzHpmsm/Y1caPioII38/l/Zak8moBwIJD6CWFnBbnuCC6bHug5AAewImbMAtn
	SUnaU0KZAbYgPfkfnxcvdXP53OYKWl1sRVXXYdn90LLnRyp64bdXTAKT9bQxsnqot/HUOiLSLgh
	Vv89u5eL7iEiOjs20538NWUtt/nmlw+MZ0ukZlb8E0B0nA4upw=
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id ffacd0b85a97d-4a377f4f68bmr8136049f8f.30.1794953061581;
        Tue, 17 Nov 2026 14:04:21 -0800 (PST)
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id
 ffacd0b85a97d-4a377f4f68bmr8135992f8f.30.1794953061161; Tue, 17 Nov 2026
 14:04:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-9-toddfreed@meta.com> <179471270271.2199510.4403404984222798506@kernel.org>
In-Reply-To: <179471270271.2199510.4403404984222798506@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:04:09 -0800
X-Gm-Features: Aa3M54r8wXLJNYnHzeKDYLuWuEkGFgDFBdsvsZ-D9Jbgov-qnF9vSIAxOghmZf8
Message-ID: <CADh2yMyL_SSJqD4=H4zkzmUCJCL4OwxeY+iPq5FQrBZyCb8+tg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 08/15] psp: only give time-wait sockets of psp
 connections a validator
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=RsBQvymK c=1 sm=1 tr=0 ts=6afccf67 cx=c_pps
 a=C8Sa+zVB7PeSwznsLr31Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=kH2YsCX8xyqK-3fOXDQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=eYhU8IiCvE_ms1W8Tcak:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfX/yrdfjsctZ5+
 gwf0QQMm8qHU3FEjg6uD+1PIOi0oF/gceZfitB/B6nTbXXmW66beU7Txvyg1bj22w4l/HuZFKjm
 n4h0mpnef/u26BlYx0F0ur1uxAoioLk=
X-Proofpoint-ORIG-GUID: Uf8euHMUy80Ex6h1g5Qb_jeMwPDf5_F0
X-Proofpoint-GUID: Uf8euHMUy80Ex6h1g5Qb_jeMwPDf5_F0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfXyiAMID3x1t8b
 QSoYtiq2SgeOj6clQnCQ+Wm3dWfXTm+SB6DBA/1scrhVhHe8F8B3NYcUkoStT9iGqscx+DmG2GU
 Du9YSeYAJqjpAu8KdEPpVVJjxlI0vm42H9FGpapqHQ83i/JA+b5smHCeQcJYhreCDF+r0h07VJs
 vv3hR1syw7QGKnSaNe3NSaApcqsNgFKNfjnFk4Zym+KpfM4mMPQ1OsiguL1j+sj1TlYyM10Ep93
 mz56BTvwb1LEWrTHjEskx7ppeG/eTr3ufe6sdQIWf9jiu1s2E2kWyjy+DGiKepVKHb5rGXO+Jew
 F6MYUVFtCtRmmOW60Fi9eI+ockC87TIPG595cR4bFKfR7YWtwTyIw/DdWBbqLxjagW9nqoGYB6p
 PH8akFVD4qIa4p5L0ZzBhNHfgFZsYxaud5lVh9a+9auT8bMt3O5/d+FU/2G2yOqoXYqLeUGLrYR
 qGzNgOBfeA4y7yf1vRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Should this also check pas->tx.spi? As written, an Rx-only association
> (pas->tx.spi == 0) also gets the validator here.

This patch has been re-posted to net, as patch 3 in the series "net: don't
redirect decrypted skbs to ingress, psp time-wait validator".

It is now checking pas->tx.spi, as suggested here.

-Todd
