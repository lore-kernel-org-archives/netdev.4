Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684984;
	b=PKYDCzEFS1Ss6zLfGftNOg0HebPNqB0Vd2CNpTmSQRQ7U7kFlg0nBf8C1wjEYzJlm0KW
	 3Gb/vKPbAwwUD00Uinq/xsCFkWAndWBeg9ukUEqiIYQxH3LaoLkW86AlQjJhcsMDsoJj9
	 IlbfaBp/d6Hj3T67uT+xw9XOmxh0MPfQ8AJkiM6d3EzjQGVpmhYRDkJrTgOj3w0GoGUX3
	 LxrHcPQaJNmm2g0Cl65PK4cI5mp8psfi+XZCZTmLeFfKADqiUR4C4iNDvk3o8r5WuGgri
	 2v2eqahSpYkx/PyJDSHexH8UwRd3ncvwgpdntQP1W0pe7Ab6/RRPZiDvjLC0YbNeoDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684984;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yWyZ1Z9Pbd4bxOXX/sgjyAr1HCnwtGuzuy6z8VWTlYM=;
	b=co7nhGLLLQkz9yaf3MfCJWV0bfrnMKF3PHJZ3FA2AIaelLXbTy3iIG4AZc2WAYd5XcTB
	 9R823bcnk+JLnMHA16A1CXhii0UxxNKe7D1UFpLukWIBgJPrJCdmTL7z6aiwbuSivBwwe
	 MHYxjGMSS19VBG2zyuhhyLVAXm8Ed+KZhFMsMVQZClh+0UbVp2xwPZn9JNXx/7k1g/Xep
	 PqALOVytae5yQ2HDuga6Mes0IKMcDU31sxSiNiuiYO0eCH8/NIOTfFOUwpdAj52zy6iwf
	 9nRgPQLy+Ehb8fqxMrruqsOp+a3Aamurh11Lx98jhY/ARYjyncI9PlqOyT8gVaryphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S+Hr1k1Y;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qFkJpBZX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F179606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F179606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S+Hr1k1Y;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qFkJpBZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795684982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWyZ1Z9Pbd4bxOXX/sgjyAr1HCnwtGuzuy6z8VWTlYM=;
	b=S+Hr1k1YChTvMPunMRiV16r5lcOMovr9Q6P25OnLBdQTO/M+Fg9l9izQUvELyP1Baeye3K
	nn0IT5aWxsW6oMMZkxJwcx7bh6AMnOHZtHI+8bRkKqzF39ycsg+mhTfz1EhDtQEMj7nF65
	jCoJNPsh+H5Wkk1/LuTO3IN1yMcfEM4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-MtWHP-cxMIOqkIKo3iY_Iw-1; Thu, 26 Nov 2026 09:23:00 +0000
X-MC-Unique: MtWHP-cxMIOqkIKo3iY_Iw-1
X-Mimecast-MFC-AGG-ID: MtWHP-cxMIOqkIKo3iY_Iw_1795684979
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so49269715e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795684979; x=1796289779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWyZ1Z9Pbd4bxOXX/sgjyAr1HCnwtGuzuy6z8VWTlYM=;
        b=qFkJpBZXEyThetAAwO7vPpWaj37KdxAJ6F6O2SQRnneOLjsdVBVfTHGTqVeZ5TIOR1
         6PVYWBWciDPvM9B3YcnZTnqMhIRo6Itmo3XXW9ZfUxR+Rz7XFYzhnqEFH+g9dKZ9tfOA
         MxM8zY63sJHh3kO33LYnE0w330Gr33URguexvpXMNceJEnD1/qloqI0c4u9xDT0Ch6jn
         ojRIgkrZAikz6LTrIVKp12c+6JIrb9VEoy4Q+zszDRLA/X6L9cVPkmWLPbOAw45hDhFY
         tbpPC41w+BZ9AnfO0EpanM3IpTneyBf1rR6IBw1W/ljlfXMu7aHRkehXShtJh3JmaNND
         BnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684979; x=1796289779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWyZ1Z9Pbd4bxOXX/sgjyAr1HCnwtGuzuy6z8VWTlYM=;
        b=epCBQZYT9u0FZR5tR/2RwoYmgq9+HgMlDYUn2G0k8DL6iJUSNbfiXN7EIoTqW9tXH9
         w3mqTkxZHO/UeBrD0/XGnrzEU/M5O8veLjCOJQU01QiZrwnOFHiG1Y3gG3auf0jsL0vc
         XFAQg6QlsUWtyCn5qZE3Q9jXDUrcsVev5sM1o7LGgs4+x1JJX9hfyHY2UBquQ5F54zKc
         tih9unFjcSz+6oWoxLjcrQl2rCypvk2bf6td1vHzpUisrPdmynlvRoMaqidcqfXuuU7m
         BPwHqL8a2dP42BDQo6JLClbASV+PE7DxuZd3x5VXEZWsGmyyqJkhv9s32Gf0gGcJYnPW
         9iFg==
X-Forwarded-Encrypted: i=1; AL+hErG41xlK3jZ7VVcX2B3MEMfGiuMX3VH6X4bva02NmosBIy/3079yuCVlu9BcZtzn9UPFjjvMdhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uqf3ww7PlGaMlqQQbDwh0pEQ5bg+g7xDpgomwGZhrObx7wLRQ
	fU2pPy77ETotl/FEJFocdbXAMxAvBkNAUdj7Zw8z5s/retsUyxzoddFfZy90oug54EFKqOHoZ/y
	JAqNzuaUDbmHJXDWi98I6YvQI9o/QJKFPKeAP33xQB+Zpa257MUMXcKPwnw==
X-Gm-Gg: AZFdTZevn4IABkGsFNtZdPHxpYVnwrrS5VAAeES5wZP3VGaTs3b+JUQIdlC4gRLixcF
	6+In6FxDxM6X3zd9/h1xw9DfxS0L3YhFC3joDs+6aS+te4JOEchbdi6v8DxY5wTvZBf2paF1gfr
	GUXI8D9IIRscoU8N/tsUvfZPPfuL0Q0ZyX0H45SqQ7RGhi5hi93CdgNuzSW1ZdZKUXjre+7ZCXF
	OeqAI/VH10+TokgMP1yKPNrBt1/E1Q8qBD6wbFMKRq2xIYrGQezxZUH3XlcJXs8mREO+ELpg6xk
	i4sFRLOdyayvnD50t+xsRbN+A1tjHz5Cd1qAbd6x9HlegYY64UoGhq8OhQguQESzx7UGchjNpJ0
	GNyK0XWe890jFm7eOBfTq7lqBddlOXYMjF1nxbBn6eeG9Qpy+OzOIolnghLnKUbqETR9IOj42p3
	Uyvhip1YtYuoVRZjGtTrTG8N1at8ZieE+K1o95SuUmji4x
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr384835045e9.13.1795684979169;
        Thu, 26 Nov 2026 01:22:59 -0800 (PST)
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr384834555e9.13.1795684978735;
        Thu, 26 Nov 2026 01:22:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm593204925e9.5.2026.11.26.01.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:22:58 -0800 (PST)
Message-ID: <0bc39607-b30b-4dc4-abdd-49f5c72fc2e9@redhat.com>
Date: Thu, 26 Nov 2026 10:22:56 +0100
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
Subject: Re: [PATCH net 0/4] net/smc: fix the failover cursor switch and wrap
 rollover
To: Sidraya Jayagond <sidraya@linux.ibm.com>
Cc: Dust Li <dust.li@linux.alibaba.com>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>,
 "D. Wythe" <alibuda@linux.alibaba.com>, Eric Dumazet <edumazet@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Guangguan Wang <guangguan.wang@linux.alibaba.com>,
 Tony Lu <tonylu@linux.alibaba.com>, netdev@vger.kernel.org,
 Wenjia Zhang <wenjia@linux.ibm.com>, Ursula Braun <ubraun@linux.ibm.com>,
 Hidayath Khan <hidayath@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Wen Gu <guwen@linux.alibaba.com>, Stefan Raspl <raspl@linux.ibm.com>,
 linux-rdma@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
References: <20261113-b4-disp-1a9ab9b0-v1-0-4a7c8d85d849@proton.me>
 <20261123165127.2453df54@kernel.org>
 <3e66af3fba5b4744b099734fe5054e6e@linux.ibm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <3e66af3fba5b4744b099734fe5054e6e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 07:21, Sidraya Jayagond wrote:
> I am reviewing this series now; please do not toss it. I will send the
> per-patch comments today.
> 
> Sorry for the delay. For some reason our mail server was rejecting messages
> from the kernel mailing lists; it is fixed now.

Re-stating the series.

Note that you can have a nice view of what is pending on netdev for you here:

https://netdev.bots.linux.dev/suie.html?delegate=netdev

filtering by smc _and_ MAINTAINERS entry

/P

