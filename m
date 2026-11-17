Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952497;
	b=RwWvGY9mJOxsjELDszv0oGazSb1MyEeSk3RtOkfwGWPJ30hz8nLAqNAYEqK+9vU/dssC
	 cm9TLhwvYF0vBr5Xq1/jFWKvJuCyOUbi7NDQd8KsTRoBPBk78jaJbRdVOefHd0YQsTl4j
	 zopaaGBbLwAVNO1hNdDnLIFBJs6DeeXFrA9H/C5GCGNm35q5tb6OpRHxkikgJkTxtgkqL
	 82m5OmVV4/HFqSMWaEKkN03PXc3SqDWsgm+SXeY0QQ3YNtXmsqiQOy+bjK9TT7kygUl3A
	 hLVvkpCZBhGyRDGzLXOuXJn6eFVrBOjMzxGOKHFN7JIE3C+svUky53Yll0cu7igMiWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RcRX8bqRjaSVetvCkAy5m45ZgWHcmvyLy0Z8oTre43A=;
	b=J0j7QFVbNNYRpwLzy58qOLNNGUvhcWDPFU82S6N5ZIIrMsUuIQP8I7H2FgkelPwcHveQ
	 9L0Y8lvyqY01ZeC8IHFZ1qz4VG+FsYt0G9KELD88oF98N18Yy8W36oHZpFtUoK94z1ezG
	 NkJPTFuCw2kmOTbPyFgSpvAZN1S3J2XlZNHSS5ZVb5aWsLRma0ewgSkE3Q3tOB7OOvh7E
	 MgEroCjNlnjW3OsuTYvqhEPqiMUaow9dE39qOcC+GLytfnYULmGt8icYXrVvyGOsDY+Gy
	 d0pON6dGZiqwWwgbgTnQVGWc+jjtKM1LhHfnCjZ8EVCruQBFCryKaqqUptdt1n52KuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkTZML68;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BAD606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BAD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkTZML68
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so703256eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952496; x=1795557296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcRX8bqRjaSVetvCkAy5m45ZgWHcmvyLy0Z8oTre43A=;
        b=RkTZML68vRcewlJnOF1Bz0/MYkCN4dcXe7c6CjYSHnll1rUQ2Yiawq2Wm2VFWTzAv/
         27Z91WaUKSVq3QbS/1vY2moZiNNvjjYHzqXRhRnfVd6YbB4QIcrA9WKNsaSDHY/+bbGc
         RG/aBioiJhnhk+Oqlcom37qVFyAK87dY6Z5yVN/+gALhO5zdqlaD1bdJouPEBVs1Nhsa
         faR/3v4xkScoJFv4J0lQf+tINYZqXb2SVxqKscCv4PYX9c7SaQuHWoXzDhh2V+RonaVP
         +nWkNtlJJsyloPj3LwERsrQqIJmn3B6AUiHzFrZun34SphyGz5ngikgXVv+aWA1UlNXq
         qqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952496; x=1795557296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcRX8bqRjaSVetvCkAy5m45ZgWHcmvyLy0Z8oTre43A=;
        b=GEYm6dPnOEY7QX+wUEgUa5qWNk0NZTpE1NqUFozM160IU0Zod0ehzfanByE7P7zsUK
         aPFfH7p7RzCmCLreBFEqgMt+2Ib+xVitXWE8L3ttVg3fqV5XUhJi4NCr3N+B3TftQ+yZ
         yhIdLjTEB1WVGGW87tsRVOd+lhquJj3diCUNhO25NBKWdVOBb0ZYcouzG/q8M4Wo5iso
         5hwgLFBoMBpaZeBjnRhktQK0QQeAqVsyMkbJuWhM/qTM7Z5W0j1Al6DVaQoHwOotWCNK
         YXOF5QcN2hdCe4MhBh020850w3g01PQkvgP1XkKP1QbACdeH0pXjw2PxbaEfXvv7uX/R
         GXtQ==
X-Gm-Message-State: APuU4Z/F77Xyj9hHBYF7ou/byLpSSQk444x1xcUZvLObC93ABEt31qrC
	oZOyHPJNR7Uu65UqU5uuw5DP3PkFD+bLw1j64FiEQFMxWptcUqftv7+RNnPbOw==
X-Gm-Gg: AZFdTZflhNsRau3vucpkMmBeoQJPMud5WKjBuGvBDh8Hgj21zIb8EDyQ5rs6EuhLPr6
	ZZQhWrAV1z6idYKkmXgBHcuqQ0/cc3zcpCIzZCpDp+T426kK6Gq+b5o4Rp6unkcvHMtIcbdsyLe
	CwBVeISHjMFTp2GvOtPrZu9qgEWQNO1JOSth/9jFd26GAhisjta3pyJo+56BtW/opa824WOKprk
	wkYAqpj2r6a2QVH6dNKEY0d1jIeeoV/bw/bLk4aVWMF1ZwtjTlohoZRE/6BvpULodGLjNXnotG4
	UZaoyNcWT3i4mXGVspcKr3/NRNEp8oL/Ux1G5O4KPv3f4Y61ZFsi5M4A5UFl1hxyxdg5/zs0VZV
	7FEA/n2PrUL31H2V6FzE+msf9U4eFeuTKbGxYc7FFrG4DQAahUVuPgBb2YgfMCxxqgXSZR9o2L+
	sH7UELYyGmf9tuG8N0kPzXqkDkvZUHccBz+gnOo56NadHFCo4I3KG3s6yrqhE/pBp1B5hsTCuoh
	os2EGfzR7mNtLQBQx/RLS/v4HwuURTu4Yv3Be6QCwVGCtDZ90PwDOneDJMP6Wt10mqd43Y7FEkP
	znID+KR6OSFi9GShZfj2seoOTCkIDNn5tVMlSpln4K2sZQzRxyvSxG9qLAGURxfYlTSLIv9lFvn
	5aQ==
X-Received: by 2002:a05:7300:101:b0:375:388:a6d5 with SMTP id 5a478bee46e88-38281213cd5mr636277eec.32.1794952495726;
        Tue, 17 Nov 2026 13:54:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm1423784eec.7.2026.11.17.13.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:54:55 -0800 (PST)
Message-ID: <abd36a9b-5094-4b74-b24f-704405d3d362@gmail.com>
Date: Tue, 17 Nov 2026 13:54:53 -0800
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
Subject: Re: [PATCH net v3 00/10] net: au1000: Bug fixes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jijie Shao <shaojijie@huawei.com>,
 Simon Horman <horms@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 David Yang <mmyangfl@gmail.com>, Herbert Valerio Riedel <hvr@gnu.org>,
 Danny Kukawka <danny.kukawka@bisect.de>, Mugunthan V N
 <mugunthanvnm@ti.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
 <179494428616.3291.2255681676266334895@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179494428616.3291.2255681676266334895@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 11:38, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.

The issue that was found during testing is that doing an interface 
open/close/open would hang, every other issue was a result of code 
inspection hunting for other bugs.

> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.


-- 
Florian
