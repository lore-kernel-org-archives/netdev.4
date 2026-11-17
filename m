Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947550;
	b=ood+C/X7c32lcb0zC3pNJtfLilM71fA7lPg1JZav2br/d1qiaecFWS+ANDHsRAqLHRau
	 g1vgYXmX8eHG8SnvGlvyMc6UBcb9MnI3/h6RaOpp+Ei4kqaVvVA/N165HzI3vWjrmF2U1
	 wvIxvLGlPqed9qa+EFfndHIVngrRA+f6P7HcDiVujFnBvpavY2tRbIA2F2bxlQ9M7D8vk
	 myNC70Jq46JfqCd5BcYIk3HNiKJLURPEs8E5W0cRBlcerPFRclyqCNpNUYW1A4STJD63m
	 B4VJTxekgH313AR9d/MMiouSGm6RDTzG6HnN6OwInbiuPEd7tLDLbQ2X/tj2vyb1FyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
	b=FmTrsxjE1tvySfIcM5t2PDKTBHnF51OVvxNg7USDXHT1QTHSkUf2zFwLRPT089iC1AEL
	 w7lIboAIMf58+0mPO3auRHLKRVOWomc90X4rsTEgimErZc9tZiJ/oouRha5KuPy5l7jfz
	 JWiBqtKGGQySQSoagazYfBALi25FSweayZBY4W40Atj1rdsQWgl6K18JPbDJWLRt+KRaq
	 vbzp//UsZc3RwZWCwWqSwpSOgO+m8KliMKxOueOtoMt0KBaAbggL6foyXEMaBfaywrwWR
	 y8ip2INtwlINmwFdLLzHDZxZQLjboiqd+Vpr/cjw2w887TNBvkpt+AAFOksFLP6cm7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="S/cJHIGQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E9606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=S/cJHIGQ
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ9iOo1553911
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:32:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0kZrkgBlVJ6
	Br1d2+SootkU27cD8cvHld5OQI8t8s/o=; b=S/cJHIGQUWCeVVmYPfyE/H3OXIr
	C+FScFtToC7kEonJ53c6uQzVRAxI+YJlYPGEYds54+MNSr4IEMD0mKcHYDxXAdrE
	SEPPGDvtNUrayxoC4QQ0HERmpoGw2nbQFj8i0wXIDSkLcC48lml+1DUk+GS04s17
	aKXAK1VVdtpBWIznDhE39mOnzZWejBo7iGvPAusT2us4vlKH6wzzDmgv16k1WOBq
	7BA6KrN4q5VJd3ggyZYAvNrpidhK0IacxKYfeeBTXagj9wn8nUmbKXCRAx8g5+bB
	DxboWdy/0RNdniQY/cO3+s4SsWdcJ2VbpTOWc2QySNjCDjuPU8XHOnM93MQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0px5muh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:32:25 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so153548b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947470; cv=none;
        d=google.com; s=arc-20260327;
        b=hzjPYCzYFqrzLEqNphw5tJmf5fftaEgZ22y4jhi/0rmRlwQmyOHpt0VEpCW8wpSnRf
         fHh8Fa/1TWPefhwxDvmrUyYBzF9yVJOWlLB1Px/32fpZsoIk+fUwV/Bv9xEWNBnjN9kC
         lED/yI+iO4duu19eiVBpzWkEg21K60BB+DL/6CFIrFQKwLRHpCPaAmab2fdSUG9aAuWH
         JqA90j5ia7V68NQG9WRBms+oiVYCIwFYK2wmqCbiKJE0L95LMVGKk++ac/A5tnmRES/3
         Xjqi1lC21Q3wzZ7Q/0KVAQLHgnWylkd+qIm9G1eiX7Qd5GVM2KAwPz+z8/vsS7h7qSzi
         ad1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
        fh=bNo8+ygk5Y33PD0xp5ImIfRd6vdj7mkRSfKEwkgc63Y=;
        b=WRrxN6OzsE6WRDulg5XqvoSrgMzINhrGpDYVAEEyCPUu8jLSKlj4VRZfHBMjrEeXS8
         8+Pgbquvi6PshU9yIi90GaWQ+p6NNRygpH/iTh2WwfH96OPLOTh9Abc8xKuNwBctTU7u
         H05To5A+Rgu17z+BqMYV+uK+3FCcFKTFrFC3O6ar6buqPDiys+EQcK805+UOfrmDoVVN
         QSIue4+szkjO1fgEZVCqycFtmXOEefn2v/O5uqQsooduqUKFbpOK0ZSS6tiydknu9wLw
         HC8xn53G7DLGkhaD0/JOFrWxBPR0hTsJJxeodOWju3MTOWU5l6lc/TIJQMR2nCiTlhcG
         DUlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947470; x=1795552270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
        b=aWF9Vq9LuFm1y/zhIVZ7B2IrcT9DjrRDOJQg6BtQSfZIyAgj8hgQnDz/wAkxF52GQ9
         4bUJcmiYV0XKZrtu7sYF98IUXAExIRL3QBqBRHdImbP8oQMGU9HrLa2Lej4wl0IBunKG
         CLj89/oC8OlBYH+VJRV++NNFQkmHhHH3ZimJIxbu8BnusxaoyexM73dqBSM6v0di2Drz
         jQNJsyCRUUldj6VU/VlQ784tOGSn3CaYLNnfoeqiHC7p9vIvM/DObT/MG8nS9cALdkxr
         aQXpIXRXtOQGYT0EzcRIvJScqkqhyEWWgT5wiybiCw3japncCfoUwKDXN0XO4tBxODLk
         q1Jw==
X-Gm-Message-State: APuU4Z+BlqjKMrJx/k/B6OYD+HJUdMXNj6ykDxGiRRrgfEIrH1y+pFV7
	iyVdIsqycZuvijIS9KMz3/HZe8MW0OACEJ69Bxe6O2C84UBFhzC2Nhz47G197Yos0C/KNbu00dF
	NDuMSy7s2scrN7fGdRpKcqp9eTj6dzyk8mc/SqZvg6p9CiUlYcPuTbcvAbhbQjeAIYN/NOWKGv3
	C/eW2z58SOzTFxTwNJ4yBh0l664aMOWh1mggaBzj8=
X-Gm-Gg: AYBFou2WlkqHvWWg8HAHAq0se9B1SKXk33YWvrE70XOZ5iCr2dSKBhqlgWBF5r1ZUMI
	31nKp+rMyiU+ySb8qq9oNJLz1o5fAUtbKih0ndJYpSq5tK1vhzX02SRiVZxGbxjeRAw0fbzJSOX
	iSkZ3Ht2AZXwVb/hnktbNdDptMiIhYMRH/hVGvqQRWZcXX5+l7z6slmuvgRwaWXhnMDO1ZUjaxv
	logfJLVJ2YlolwnXIP1z/pUtEoEbWTXHqNYZroCm+2gUgqXCk8=
X-Received: by 2002:a05:6a20:5491:b0:3f9:bcb9:30dc with SMTP id adf61e73a8af0-3fe976e2e5amr393704637.38.1794947470153;
        Tue, 17 Nov 2026 12:31:10 -0800 (PST)
X-Received: by 2002:a05:6a20:5491:b0:3f9:bcb9:30dc with SMTP id
 adf61e73a8af0-3fe976e2e5amr393672637.38.1794947469714; Tue, 17 Nov 2026
 12:31:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-6-toddfreed@meta.com> <179472727319.2199510.15887061947101112689@kernel.org>
In-Reply-To: <179472727319.2199510.15887061947101112689@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 12:30:58 -0800
X-Gm-Features: AclHuK8h__y1ykH_oWn3mQ1fV3WrPBL6thnn5AjT_UEvICUWUOHi7PKgkI-L6EY
Message-ID: <CADh2yMyYxVE70K1BnbqzDB5h+7vDBzpL7r-yxnhq=7Wgb4480g@mail.gmail.com>
Subject: Re: [PATCH net v5 5/8] ipv6: icmpv6: don't quote decrypted payload in
 icmpv6 errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX/BRKUWhwB4Tu
 V0B6Dg1vyfJ0iXIlK7nTzTtER2VV3QdJ7YvFRAOCRDLYjZoQ5BZMp+eJ+R2OTlEb+oQ/rRIih7D
 qHmy6TXMpfTlPBhEFUK7EYgcYFJTfGw=
X-Proofpoint-GUID: aFDKt5lSJkBeZmEXxVNJtHTe5D1osb-n
X-Proofpoint-ORIG-GUID: aFDKt5lSJkBeZmEXxVNJtHTe5D1osb-n
X-Authority-Analysis: v=2.4 cv=adD0Dhot c=1 sm=1 tr=0 ts=6afcb9dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=Ve4a7iEx9DEsMjZA-ZQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX6iWewsLNF0Zw
 Lxevi4Ei5Z6Nn3XRSNGMVzaMneO+3pwM866zOYCGW0DOkGIpnGOQYMarxcJe1qInnBnXXuK7P/A
 JBlt12sBqV7R7noqq7zZ2VfltM4c7B4ZLdWD1IfSbWO/ISFqU8DUSJJI8Kh4Vg2W7OuX2aCaxAs
 TRNI78SFNf2m/gcUbSH2FqWcx+A782Jeawkh43XamgxdFQ6U/+yxpMv5ntkbe3tGC14GBzciFg6
 iS4llKhfl0DvSU6qsCZmjNGCyMiWCDtu0U1isQGagaW/kY8tskQencwtHFRQdj770d6n373cqYd
 9MSrzcDx9wxIQhKTs7ErGFd/QghR9GHdo1UJT9YY0ExO8HRWlU2CQQYG3hFmAYjAn4/vtrVlo1j
 ZCPSVoM1/rPKZ3tyvQjvg1jYqvsM8AjBhEw5fVyjiA+YVIc08fnQqoftrXAHvcNRf2P27rh05Al
 LrzaNm2tPkx//jyln1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Does this cover every ICMPv6 error builder that quotes the invoking packet?
>
> nf_reject_skb_v6_unreach() in net/ipv6/netfilter/nf_reject_ipv6.c builds
> its own Destination Unreachable and never goes through icmp6_send():

This path is covered by the nf-next series "netfilter: don't send decrypted skbs
in clear text".

-Todd
