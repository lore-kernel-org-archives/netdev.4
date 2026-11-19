Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078997;
	b=BqocEHa6JWPPWTDKw5qhqlx5kDEtFuy6guQwwlnW+HCrZhcun/tpk3XJygxdMRwOoR+W
	 znVCS8Un1HkDlNwggVQu4eGfXAtZZ7i9/+QW3cn8Ch79sIS3JHq7EgJd/K0Mf+Rq4gJbf
	 CvugSh7DgE+TdGme86kh82KCvtNCwI9DnZK7Y/0TNv7FZVIfUgF0Dcu1ZZI2yFL/B3gah
	 OHKdvacVO+/xUEeXXr7X73PVUV5qaneciiaKShCwXQZqCIpRwZGRRBrDhsAfO1anveR7A
	 d0MTSWoJqluYG1QdmzfaPXzdn/CgQTdgsXyByBph1SFoh+ECgHSuHxtJgiSRAqsANbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078997;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
	b=sBRZMTdWQUxDD5tV2KTVRWjtc+fuXzeYQVvZafLoQydGLa9/ftBMChI6NEdxmD7UIQLa
	 gEuugILFCpQwt1nRokIRSdJJ3Do4OGKpKQomFv9/KHDqt0OsglWbGgxCMvAX6Ve14s8KO
	 VZvs5mXRqk8hk78F7cK62/q+fle93rtAmQQnyackkzkmoGjr28l1BOl9LWp2aHHd3aozB
	 EUesBHX2lJ5zYqfYXW4Bb3Q6t/5NTaMnCni3/02ULNk1BsV6hUFwLY7/uI7cf6vImdTER
	 2ODCaH/YOg1hMXUaXQ2pXTU9P2NOU6/ws5p6bsS2efrpOLI4UI0TNvH293TvNUicoug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzJyUlZd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NDy7OuQA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2A60A2601
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF2A60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzJyUlZd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NDy7OuQA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795078995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
	b=XzJyUlZdvOEvO2tepLebN83cQqiQIRozPgN13M9xjpZuJij95PA+RjISxIAMujcc88nDt8
	I9TQor4SFo8rI3L8adDZtBtO+tiVbHo846/ZWh3ikXD8LewNvHdJPd9dL2QBlazCbIHAgg
	HYq3bYbdciaTRZki8sAJ07oBuxUGmaw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118--560TMnFN-uv4J2vdFTTiw-1; Thu, 19 Nov 2026 04:03:14 -0500
X-MC-Unique: -560TMnFN-uv4J2vdFTTiw-1
X-Mimecast-MFC-AGG-ID: -560TMnFN-uv4J2vdFTTiw_1795078993
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49febef74e3so4235395e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795078993; x=1795683793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
        b=NDy7OuQAYN725puRZGYMqK1SPlFc6PbWY2Mk8+q0b5T27jWFi01d0o8UYL9sETK1uM
         ebNwCyzECEWNUhrJzteVE2FPpw1j+l5wHE5jXO4CQoK59II9NbxR47jNBUoBcSoGGQDE
         GA9R4IQ4DRbjUJvVVcjlxXVG+LUvQhYrcPi9tLHe1iUTObvyysDaD24mNLBAnYv73fzQ
         quZZxXQ8g2oEE/pJgEzVgNyA4iuUgofNiS2fZx3P6IjzpM9a2ZyGmlq2CfQytwjRsRn2
         7Mze0crl74fZvW/X1qiBatVWkaq8M2AfrZPvxrNi5FuCWbHw+wtDNk2u1MvK6H1XdFH8
         TGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078993; x=1795683793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ev1ALMDJ9rqPsDXSnREH7pDpCBz175oayjjOjbBvQOI=;
        b=k8xDQGeSLrAFSWwqNfOOmSHgEDwaQMzN5AV8iSepsu0TA973+Q/zYlT7qr9DJ3XAZG
         1wF+qedDfdpy6nRbu3PmU7c8gjUTCBNgpecwMkf62AL/XNZHmLLUesnaTRcLAfNV/WnE
         kkT4BhAXGi2fjFcTfZjVPUqFDZrSYGaUdJjtZzZu4XSEOjRGcdSXNY1L9yK6FI7T6Bz7
         /1E1FxgwLcgKK2uKM+AvFKEDWgvlMqBqddF22fn5L4PUuqjq7UuGfU5uhhAQheNFVQmp
         8hHqQVJZTomF9uJn4KFEvgYo6jgWYWKkrM3UXrInCMg5TJxIuoYHnMhnynHYQV+CI7NR
         +Sdw==
X-Forwarded-Encrypted: i=1; AL+hErFEmfpFX4GsMrKvMnzEPF2JYz712j/9AJ8pQF1wyvoXQbHaqoXkh+dxT54O4mGmrIZ6tX8x9p4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xKPiM6+XsI5uJglKKRhn8b+pVUL8w9Q9n3dizel0w8y4P506e
	JRN2zI8iDZqZHmtdEWyRzYv1SZozoCB7e7xxcx7LFLh6NKl0EQijcuqtHc3MYIUgc11ccHOZ49C
	5KV5aan5C2DJdh65IH6Ab5xFT12H0b+/RGESU9r+XJ0G4Pp2PGE32HCaCdQ==
X-Gm-Gg: AYBFou3KSQGJo1DdSJJJM0Pg0PVA7c1eOAXoffPKVBb48vEqPG/J5dWWtz/QvuhN1V1
	eBSNY4yBeT30vCubHr9I8hbh7w81d2pFPsqHu9/kHEOMkJ6JKIAX3OFbheT9acmo18w3J6dx7AL
	O01HGAJCS0e1gf1kB9lV/7oeB1gInBGuMS2nbMXXZ4sCrxPZz1cHIF118SBdxicdn1kI4eP1AY5
	fkT8zOR2huW3OLbSbiQz2n2q5EObwmuj80HS3F6rc0eFRGqqf7szVa5RJG05QXhHuOZLsHVTLNm
	Q1rXlEtH+9AN3SNDoqnUycDU7SRyGo3v19hF66O90Nvidg7zJfuavXNovhIAHyH/3t6SCJoYEGM
	CGNKxAIiFjfRJRgzDOtzd6ElhI+NUaGb0CHrXEDoc+BvweCQGuGJ6ISHsbT928kts/hP2mBzIBf
	GhiPDkEO657PKLOp013t6KdXWN0yeo6YU7FMJtfvhXbiKh
X-Received: by 2002:a05:600c:b90:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb860f622cmr10713975e9.1.1795078992820;
        Thu, 19 Nov 2026 01:03:12 -0800 (PST)
X-Received: by 2002:a05:600c:b90:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb860f622cmr10713525e9.1.1795078992313;
        Thu, 19 Nov 2026 01:03:12 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm29541955e9.0.2026.11.19.01.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:03:11 -0800 (PST)
Message-ID: <a3049b70-fae9-488c-9de7-0c1613e6c480@redhat.com>
Date: Thu, 19 Nov 2026 10:03:10 +0100
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
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can reach
 the device
To: Bobby Eshleman <bobbyeshleman@meta.com>, netdev-bot+sinfo@kernel.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <179487315810.3291.12142099363352099423@kernel.org>
 <avur4Uwbv27bGG67@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <avur4Uwbv27bGG67@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 02:20, Bobby Eshleman wrote:
> On Mon, Nov 16, 2026 at 11:52:38PM +0000, netdev-bot+sinfo@kernel.org wrote:
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>   - How the issue was discovered, e.g. hit in production, hit during
>>     development, syzbot report, manual code inspection, LLM or static
>>     analysis tool scan.
>>
>>   - Whether the issue was actually triggered, or is only theoretical
>>     (e.g. found by LLM and not proven at runtime). If it was triggered
>>     please include the symptoms, like the stack trace or kernel messages.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account.
>>
>> *IMPORTANT*: If you do repost (for other reasons) - please include
>> the relevant info in the cover letter or commit messages.
>> -- 
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
> 
> This is a known issue and has come up in review of the guest netns
> series (so via code inspection).
My reading of the above is this feels like more an improvement than a
regression fix. As such I'll move this to net-next. Please scream out
loudly very soon if you disagree.

/P

