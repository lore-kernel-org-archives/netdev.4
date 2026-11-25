Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619319;
	b=lfa0m+/tMSAXf7yyT28uX0JVbVKjPPYSLB6olHvaBTDdUpEQ9CMZvFFSo7rXNTLh/KtJ
	 1fsUWd49d9mKtEhG7NPVaWiN9W+LMME65yqapi9vmkVQGUgAyytbM4EFFZQFdxvQM9oQ5
	 M0Wbg9VZxRggsOB2hxEzH+2DM7s99Kf8tDQhs8lzXLAEjRhfqdFTPL2k77DmPuQ4HD42h
	 FDp9SZGin3mvLBEV6in5bFZHJS9DhxvUU3qIKfiI0WQKg8l4E3r3zKIIPkeOQsscYm74E
	 noV7kl12LR6UtBPiW6JJwzpSuVPs0b2rUJegtJxmBLHOTopPFUj89/JjyqFVjNNb/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619319;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MZhEWgkWD3f07SEDSp2gS86vUycnUIbb45Jy+diiapU=;
	b=e2K807RLAs88DsNqnz0C38SZ+piCofJnEafWRVpcFIwNeJPmUm3WjbA2e9wU8oTiIW77
	 w6KZx90lyVJyk/2c5mAvfaocTeBgMtz8qIWjAhwtFfdjfg9tFjJ8DYzmwPttU9CRzF6AZ
	 LaMxjKZ+X9Va2lCig2OCtqSmJSkM98YAZjxdDO+ieOpVro41vHSGrhP2FYJnA1dmJTtSg
	 1CLBNQErPyr4qUgNzIOyXEkaGIAYiLXr2+6ytP2ylf2+27XhyYtAKV2EDuxZjYRjib27+
	 OdgLTi9hpHZ7MmLz2i3UZ+zouonsyI48Ds9An0QXvz94MmRfOps5vP64gV4+iCmrjDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Moi00Ks0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LH5BjmKW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD8606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Moi00Ks0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LH5BjmKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795619318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZhEWgkWD3f07SEDSp2gS86vUycnUIbb45Jy+diiapU=;
	b=Moi00Ks0Pj/3khoxqdAOs3vBr9CmyKyQ9yMUD1Kv23ZwzNAF0vZCat+YoKoU1xVYgRRsxt
	0n3bzVc37cp/U9V0YYLv4BAAq8OQ8K1wVpMol3XBZz5TFLaSX5hw1G09pqnRsJN2YgiX4c
	fx0Uj0iafkPDBvlPeWPeQnXKx+hntBY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-DLdpJnA2MjGvrXq2V9HoBw-1; Wed, 25 Nov 2026 15:08:36 +0000
X-MC-Unique: DLdpJnA2MjGvrXq2V9HoBw-1
X-Mimecast-MFC-AGG-ID: DLdpJnA2MjGvrXq2V9HoBw_1795619315
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a68703d177so2855767f8f.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795619315; x=1796224115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZhEWgkWD3f07SEDSp2gS86vUycnUIbb45Jy+diiapU=;
        b=LH5BjmKWe/y9phiGSyWMW/cNyqk5lgcZUWFdUvvMV6WsUu9AN0wHVmD05R8Y9oNPrW
         +GeBl3hibgloPlbR+VK/dsW58DfhK2qlpU1Nn6AoL4MpsIxUmRZPOG5E4H9iSTkCsLB7
         /z+efbSULkl9xaXpjiYbgNWJAmleAah5tQs3ZgLPKx5zDDxoGZwDxuCVZV28ppOgNQvZ
         BcgULE8W6//UMvofkYL9Or2Cbjuzz5fBP/GGBVM3huvP9+yXoiQjedtlKgixvLzIQcCU
         3JWrrjF2sfiX9jmOUamuUa31yz7E8+aTTOJqejFn0y7YKa4LjHSszv157j8wEqWhln4i
         kB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619315; x=1796224115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZhEWgkWD3f07SEDSp2gS86vUycnUIbb45Jy+diiapU=;
        b=U5qKVVrPkcFmNvGLXesDKvggLzo285CMV07dDXs7CNuwU/3KgpJcAM3g+Sf40uM2+a
         XyPg/Z4bqPHDfJAKOovj8ogdlnfCYuxqJFPXJWbVllxegNJypsR3HEpNpxTa8ArryXK9
         MSB1+Wzg1fSbuRe61JkfATAtKYJ7D7KMS33nUbHTrz4sVssTMive9od1aZBNlPK4WMZk
         AFtdC8XCAYY8iWaXoLmfnaruiGr/g18fWwiWr/ob7/en/DS7xkbFCLjwxuyfybc7uwlI
         bye6V0vPTOurvDh8TcwiFnbN0mk0u51/ArJQwboAiYVrTWB1ysulqvPxrZMIoPre/z6k
         6PXg==
X-Gm-Message-State: APuU4Z81IgxsL8dyz4IySKnQeeIHlb3ZTYzkQ28oNzDSNX/RiGMch44G
	a9dmhS4e97bzDRo71gdA2jjqkjhNySX2y4MyU3RCJfZjC7IeXa9aMAgX7wawSZeWODYCpFQZHdF
	KGSK5UreJ+RM5WBnm5tNRiymk1/9+T7vaVF7cDeT4EVnDzhANtqbWqZxxkA==
X-Gm-Gg: AZFdTZfyHL0DR6M2W3bwmStRE8Ziq3vGCMiKnvU3fXYPp2Gwwv+aeiNLF5ZHgx+7qTx
	nwp/YkBax3nzXa4D6ujTSmKSZQX4POefmbGLpTTDbp/kqEq6zhCeqzaLAo+yuvyf6taQGSceP0X
	apEHG0cqXGE116f37yHj2842jLlarclv7QdshnBJ5duyRzAS5pnFLp4YkRmKgxXmRVZhgHG35RI
	nHNDlV9oNOn9erniEGIADHyaJAv5aNwPYifdj55P2qY0/tC+reyIUTP7HHlKQ1SMbxIVewEd0u0
	uYIbIA1nWwA92so0Ubz3icNTcufu8MgAFgZv36X8yVGsFjbrckCuGNxX6z+/BOJ3pLsqJ7+F1zL
	DzQijke3zxR0pTkeYbmtDNsU2nHm1RxqM+DA+fOYvBpdN+uVjTO0ka38IWPijXExPdKnUCj4m5o
	dXwBUMP3alu3iGQBM/vucwsaJbcwuulMahIeax9TPeLfs7
X-Received: by 2002:adf:e014:0:20b0:4a6:b87:d77f with SMTP id ffacd0b85a97d-4abb0f3b5a5mr27264230f8f.12.1795619314753;
        Wed, 25 Nov 2026 07:08:34 -0800 (PST)
X-Received: by 2002:adf:e014:0:20b0:4a6:b87:d77f with SMTP id ffacd0b85a97d-4abb0f3b5a5mr27264195f8f.12.1795619314359;
        Wed, 25 Nov 2026 07:08:34 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm32762851f8f.26.2026.11.25.07.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:08:33 -0800 (PST)
Message-ID: <9943aea5-ebaa-4003-9578-ee2ba0ec5592@redhat.com>
Date: Wed, 25 Nov 2026 16:08:32 +0100
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
Subject: Re: [PATCH net v8 1/2] net: wangxun: protect ring accesses with RCU
To: "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>,
 netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, hramamurthy@google.com, jacob.e.keller@intel.com,
 przemyslaw.kitszel@intel.com
References: <20261118081329.39551-2-mengyuanlou@net-swift.com>
 <179533642599.3135.8576432289828139956@kernel.org>
 <AD0ED59F-3879-46FE-AA7C-E97C81CA57EC@net-swift.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <AD0ED59F-3879-46FE-AA7C-E97C81CA57EC@net-swift.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/26 07:21, mengyuanlou@net-swift.com wrote:
>> 2026年11月22日 16:33，netdev-bot+sashiko@kernel.org 写道：
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 1 · Medium: 0 · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [High] The commit message describes VF suspend/resume changes that are
>>   not in the patch, and relies on them to argue that the new __rcu /…
> 
> The commit about vf resume/suspend related commit, just merged into net-next,
> but not yet merged into net.
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?h=main&id=a6c3e4c1f7032e44cf5dc897a3d328b138e770d1
Meaning even this series must go via the 'net-next' tree.

/P

