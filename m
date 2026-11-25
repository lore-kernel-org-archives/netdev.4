Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609501;
	b=QfMpFrKqZBXg694Q+CtRJu/U+wGA2yOuNnuFdI9YEnBDTbkH06bouTYyPuFq87rpgt3J
	 rnjm497/wQzsAIh1te/diSdY8gKtrYapvYHEWf4bym65rYMf9P9iK/ZWHW3hDCSu4XPfG
	 q6IRYp171eei0suGCAsvMBMMSJPfa+bAwJR9kpH55JO/oMYy3vHQds0B5Ojzpd42Hm0N5
	 wGmyNLQ7bof2G466xHnqoekL1sWuFFjcRYRW7CLzzLzgZQ4sojOsG6zoYTP7JADTn1syQ
	 nFaZTP9i/xuxm7lBb94JosZl1/4WPuEyistTOpRTroPJM9cXCMimY/TJm3M5GQkXQCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609501;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 From:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k5xzegGZPsdIxHP9LJiqbW2AnSoxon5CqIeHJswRAEI=;
	b=aqMtMCgAnR1A2/7jGqrSlUDeuMc2sERLdQxxfRxAazsENdyzHf2mGtErkK4rIdcf7OBj
	 ESyhwuk5OMsu3Y0AcmjvGhp5Iy0xKqh13cn03ydZ9YOT4iqrtobM9k94zSe4BQg4YvGaH
	 lESrUZFQZRjTEAV9bfjfOasbUn6tbHuJnvcl/IHwz5jMbHDkxE4lj7pQ38TwEQkXLmLEl
	 L16Dys0iofYRghwYDw8MrqfKpTid6GCm3SGALgI7b24HP8YHlt52FPW9qn0iyIKzYWhoq
	 n+0SOmgKAYeZEVTOBBlxOlZ+q72ZY5sWx6o+xmJGJsj4FJvYyaOpQHS2Cu8tPAD8+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FZJd9z0Q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bdS6bzSZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767E606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A767E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FZJd9z0Q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bdS6bzSZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795609499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5xzegGZPsdIxHP9LJiqbW2AnSoxon5CqIeHJswRAEI=;
	b=FZJd9z0Qn2ANrB2Xp1n3gLSBRtR+4K2MSCNbDjmXJoX//FxCPOXS2VnML5nEHs5whk7M/Z
	YC+f0vzQ/Fr8AHgfwr15OiMXrKaC9OVS1E2Vdcln5CDlT0TTrBJF4NLVCeJwoO7TTI14JD
	JjnOqI6XfSW/6A6o0npXbsJEb2+UBf4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-HKWrPfdwM2Ch0kNUTDkIuQ-1; Wed, 25 Nov 2026 12:24:57 +0000
X-MC-Unique: HKWrPfdwM2Ch0kNUTDkIuQ-1
X-Mimecast-MFC-AGG-ID: HKWrPfdwM2Ch0kNUTDkIuQ_1795609497
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so37469815e9.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795609496; x=1796214296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5xzegGZPsdIxHP9LJiqbW2AnSoxon5CqIeHJswRAEI=;
        b=bdS6bzSZfxt9PTfIyaZ7/hRE0/pFK3yanKtP4V5sEw49kWYwMCwaOPyCs/Dn8yWqdL
         o1DfMyBGYA3Le8hSWKVzZ3gGbRciY0A4R8vnYGYnpprXaWc/KdPxpE5US1RRzguCbRzG
         phlo7X/XX5ERhy2Y3KNsNmfh4QiC1+XKXpeKvm4+RbjtUKvw5hw08y6ShWLXL+G3Dc8K
         BfkNkCIuqbte4YVq/30DhdkyHe/T5jhfDS2OxGKVARL1QL6eul3SRxdByQO7QKQJ2qmA
         +j1YiSZxdqq02jkZOMpd1B7E0E7OIiB7QMx4DBUC/VeifmmXL09dPvaKGwWS04v3v5HO
         BsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609496; x=1796214296;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5xzegGZPsdIxHP9LJiqbW2AnSoxon5CqIeHJswRAEI=;
        b=qb8GZVDIoGtsOHVCKhK2RDB/2WIHBdJxfVkP7hpM4yDw18iCe8hCYUHfsQss6rv/4d
         igDBgaWyQx3l6eIolHUWLOjynZBJ/bhcl62osXvpjswlx8pAPbG86HvsdMr5v/FSnZNb
         QwzVHjTRUy04pgZl4t88BOia4zz8Htn1HeF1pRdRlWPdwdbrq0wHfY1fd7A+kp2HG/P8
         lmVDkO+1N9k5pky4fSMpOAaokjH7wJt69st1t6x3lNN/OxOxpqxl1ukTQYaq1dERFKzK
         ac8XnaSkfWtFh0V6tBmk31m89lTIxbKnrlu2LbacLM3M5v1BGppAFNg9ELinTpB75z71
         r2KQ==
X-Forwarded-Encrypted: i=1; AL+hErGG8qMTz4szokIrct+nYZYo+1fvFaDYEVQc1i3r2lkYcFn4y+wdX2fWEIXfiOTI2VWvn6YzGxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ME62LvTZNhU6xlbesExJXM+bAaOnSPCmxCn3XoAjm7teqJ9NG
	/GEmvmFywhg9aOpEij46xBiOGzjE8YTQ3iR+VMnBrOyDHMYFF7ywpoON719fmxr7JOPFWLTd8a8
	Mj4DnsoCmQ44d1uEEMDBjq/zf8pojO/Ko4PChgTfFfUh4Y6aJXpKXDgZUbw==
X-Gm-Gg: AZFdTZfihSFXRmk+nKP+Ux1q35TRfmZU+xNu2GdN0i8Z5SCE8dbKMoUt5gU6cf3JnyL
	7HYRluPsD4TBVpskRpi1j89xZ42b328WjFubx3ifhkOzQGweuyTKlxwPtD4K90Bqi61dkwzgh4U
	VzjpBo34s6OMzRU5RWAeBUHzU/pn3IJ4MazZ7aX6Z4aKfbkMkMmhRDP71saiEAIhip/MtgXFxiO
	mwYQMatnXQwzwJmaCViXYEkuuMjNekQu98WQqkZuP9F4ymITt011UtwuLlqFZ50nBouiYEfXewx
	YQPOJMoxrOl3t2LYyfX0vRRkN/d67USuaNO4NLiFG1F1XxVq0CiR5UdyAiHGubNonK4dHoxLOoA
	Hp0FecwFIEvYpIRJEVTp8eJ6PttUHGv0o6LlzpQIc5a4fVMB5XZt86FfCcYO1Pi9YMiPGneS7oS
	ReZ0DOMXT4H/dQGkdrEL6e2UUas15tKxzKqD3aoYLggE2l
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr376563965e9.3.1795609496614;
        Wed, 25 Nov 2026 04:24:56 -0800 (PST)
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr376563285e9.3.1795609496095;
        Wed, 25 Nov 2026 04:24:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm34078929f8f.5.2026.11.25.04.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:24:55 -0800 (PST)
Message-ID: <116dd5f4-490e-477d-a5e2-30e3e12d6a41@redhat.com>
Date: Wed, 25 Nov 2026 13:24:54 +0100
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
Subject: Re: [PATCH net] xfrm: interface: drop non-IP packets before
 pskb_inet_may_pull()
From: Paolo Abeni <pabeni@redhat.com>
To: steffen.klassert@secunet.com
Cc: herbert@gondor.apana.org.au, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, q.h.hack.winter@gmail.com, stable@vger.kernel.org,
 syzbot+d29af9ef5c96a3f5e96c@syzkaller.appspotmail.com,
 Shuai Liu <847807867@qq.com>, netdev@vger.kernel.org
References: <6afdcf01.ca6cd63e.174a34.0001.GAE@google.com>
 <tencent_46F20906773869221623F9FA26275C133107@qq.com>
 <f38e588a-91cc-4ded-a0fa-08f129b1c920@redhat.com>
Content-Language: en-US
In-Reply-To: <f38e588a-91cc-4ded-a0fa-08f129b1c920@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/26 13:22, Paolo Abeni wrote:
> On 11/19/26 06:08, Shuai Liu wrote:
>> AF_XDP sockets bound to an xfrm interface submit skbs with
>> skb->protocol unset (0) and skb->network_header still 0 from the
>> __alloc_skb() zero-initialization; skb_reserve() only moves data
>> NET_SKB_PAD bytes into the headroom.
>>
>> Since commit 86de3a1118a16 ("xfrm: interface: validate the IP header
>> on xmit"), xfrmi_xmit() calls pskb_inet_may_pull() unconditionally.
>> For such a skb, pskb_inet_may_pull_reason() selects nhlen = 0 for the
>> unknown protocol and pskb_may_pull_reason() receives
>> len = skb_network_offset(skb) = network_header - data = -64, which as
>> unsigned int exceeds INT_MAX and trips the
>> DEBUG_NET_WARN_ON_ONCE(len > INT_MAX) in pskb_may_pull_reason():
>>
>>    WARNING: ./include/linux/skbuff.h:2856 at pskb_may_pull_reason [inline]
>>    WARNING: ./include/linux/skbuff.h:3286 at pskb_network_may_pull_reason [inline]
>>    WARNING: ./include/net/ip_tunnels.h:483 at pskb_inet_may_pull_reason [inline]
>>    WARNING: ./include/net/ip_tunnels.h:488 at pskb_inet_may_pull [inline]
>>    WARNING: ./include/net/ip_tunnels.h:488 at xfrmi_xmit+0x1844/0x1eb0
>>      net/xfrm/xfrm_interface_core.c:534
>>    RIP: 0010:pskb_may_pull_reason include/linux/skbuff.h:2856 [inline]
>>    Call Trace:
>>     __dev_direct_xmit+0x4b6/0x730 net/core/dev.c:5164
>>     __xsk_generic_xmit net/xdp/xsk.c:1288 [inline]
>>     xsk_generic_xmit+0x27d8/0x47a0 net/xdp/xsk.c:1344
>>     xsk_poll+0x326/0x670 net/xdp/xsk.c:1472
>>
>> The packet is dropped by the pull returning PKT_TOO_SMALL and hitting
>> the default case afterwards anyway, so the only visible effect is the
>> warning; reject unknown protocols before the pull to restore the
>> pre-86de3a1118a16 behavior of dropping them silently via the switch
>> default.
>>
>> Reported-by: syzbot+d29af9ef5c96a3f5e96c@syzkaller.appspotmail.com
>> Closes: https://syzbot.org/bug?extid=d29af9ef5c96a3f5e96c
>> Fixes: 86de3a1118a16 ("xfrm: interface: validate the IP header on xmit")
>> Cc: stable@vger.kernel.org
> 
> The blamed commit is in the current release, Cc: stable is not needed
> No need to resubmit just for this, I can drop the tag while applying.
> 
>> Signed-off-by: Shuai Liu <847807867@qq.com>
> @Steffen: looks good?
I forgot to mention. Since this is one of the very rare regression we
have nowadays, I would like to have it in this week PR, taking it
directly via the 'net' tree would help. Ok with that?

Thanks,

Paolo

