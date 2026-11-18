Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.154.239.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043553;
	b=xYyxhqElalgkACjL2KJxH88DNvPG0omIC3EyIGlTgjDI3xWgW7ytvmQNUcRwODxA5JEP
	 W940vLkOyQ9HEqIM+SjNthzD8n6rZo6VtU3ePudgfhrHgcFLRkNj/lqNWqBBItfUAGwam
	 g7hh/FMQyOLwGeNSZn+NhSAAbdqWlMkfNVEJYE9Uef5F/SkCXFeYnM/xu+NW/G1ZkYTnY
	 KpLHztONBNoT0yyy8X9U3xVm0qzjeh19IFPPJJe1wol5iHvpQ6RsCEDsGIBowUqeh9c3B
	 I9FuIMvwoMb3QMP48COWIC7X0mI0H0t24KS3/iLCnhaldSWonDky7sopsTGhz5SKung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043553;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YVDspEK0iLkF1tAiZM9WXoiqd71MESnJ392z8YtPtdQ=;
	b=y6is2zV1S6TVZXIHazTngg0Y9rU5mb9VUYlCAHI0Ik+q6V8QglIijG3qyyCrV8skQx2T
	 URlpU1taVDy+WtfKTznzMIXfba84Ju8XyX349apJ2o0Jexk+iHK+QwPEduvFsiGb4/CkK
	 dFyRy6sMd1MyTleHgXzWHJpJHC13gyEzHRqOMdfnBrC4NcOCsSPTQ/WI8F9jLhTZG95i/
	 Ru+Qvrkv5jHt/FCIrjwLIea4GPnzubQvl/i7tj+h/LChifDtvLlqTk4al8xtmQpaw4BRj
	 L9i4uXuiWEwCeORhablda/wXg0OpFM6/GoovB4EZRGUdGYkdxv8U7yzu8oJ15SpsnFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex-team.ru;
	spf=pass smtp.mailfrom=yandex-team.ru;
	dkim=pass header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=A+SBiDxM;
	arc=none smtp.remote-ip=178.154.239.200
Received: from forwardcorp1d.mail.yandex.net (forwardcorp1d.mail.yandex.net [178.154.239.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0A606A320;
	Wed, 18 Nov 2026 23:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=A+SBiDxM
Received: from mail-nwsmtp-smtp-corp-main-57 (mail-nwsmtp-smtp-corp-main-57.yp-c.yandex.net)
	by forwardcorp1d.mail.yandex.net (postfix) with ESMTPS id 35A3580E78;
	Thu, 19 Nov 2026 02:12:21 +0300 (MSK)
Received: from [IPV6:2a02:6bf:8080:a88::1:1b]
	by mail-nwsmtp-smtp-corp-main-57 with ESMTPSA id JCkYfr0vwW20-hJIPHIu7;
	Thu, 19 Nov 2026 02:12:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1795043540;
	bh=YVDspEK0iLkF1tAiZM9WXoiqd71MESnJ392z8YtPtdQ=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=A+SBiDxMIEUT0J6uZtYuI730PtZZpPLYU7cYw/Ls2+RDYHodrDacY46IuaQGz9PXi
	 gRzw3DIux8SDSvu6PoryMe2ov2hP1dfROPkoTxDiWucwHV1KDtMKwc/B88wNESMwuo
	 4k/PXv+eVQ7KgZZNCiCLc7/DsDFGvG9CwFR7lkV4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-57; dkim=pass header.i=@yandex-team.ru
Message-ID: <b01826d2-63b9-4e2d-8857-a8cb72cd6ed5@yandex-team.ru>
Date: Thu, 19 Nov 2026 02:12:19 +0300
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
Subject: Re: [PATCH net-next] net/packet: don't direct reclaim for contiguous
 ring blocks
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117085951.681985-1-d-tatianin@yandex-team.ru>
 <willemdebruijn.kernel.3b356fe59c775@gmail.com>
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <willemdebruijn.kernel.3b356fe59c775@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 1:45 AM, Willem de Bruijn wrote:

> Daniil Tatianin wrote:
>> alloc_one_pg_vec_page() first asks the page allocator for a physically
>> contiguous block and falls back to vmalloc if that fails.  The first
>> attempt uses __GFP_NORETRY, but that still allows one round of direct
>> compaction and reclaim before giving up.  Under fragmentation every
>> block of a ring pays for that round, so setting up a ring can stall the
>> caller for seconds even though vmalloc would have worked right away.
>>
>> On hosts that run tcpdump periodically we saw ring setup (8 order-6
>> blocks) stall for up to 1.4 s per block and 3.5 s per ring.
> Is this still the case with recent commit 0e05a469c294 ("mm/page_alloc:
> avoid direct reclaim and compaction for costly __GFP_NORETRY allocations")?

I think this fixes the issue for order > 3, so my patch is not needed 
anymore.
Thanks for pointing it out!

>
>> The contiguous block is only an optimization.  User space maps the ring
>> page by page either way.  So make the first attempt without direct
>> reclaim, as kvmalloc() already does since commit 46459154f997
>> ("mm: kvmalloc: make kmalloc fast path real fast path").  kswapd is
>> still woken.  The last resort attempt after a failed vmalloc keeps
>> direct reclaim.  Order-0 blocks are left alone, the vmalloc fallback
>> would reclaim for them anyway.
>>
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
>> ---
>>   net/packet/af_packet.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
>> index 8250e6a791f6..38f35a4f9d49 100644
>> --- a/net/packet/af_packet.c
>> +++ b/net/packet/af_packet.c
>> @@ -4493,8 +4493,16 @@ static char *alloc_one_pg_vec_page(unsigned long order)
>>   	char *buffer;
>>   	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
>>   			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
>> +	gfp_t first_gfp_flags = gfp_flags;
>>   
>> -	buffer = (char *) __get_free_pages(gfp_flags, order);
>> +	/*
>> +	 * A contiguous block is only an optimization because vmalloc works
>> +	 * too. Do not stall in reclaim or compaction to get one.
>> +	 */
>> +	if (order)
>> +		first_gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>> +
>> +	buffer = (char *) __get_free_pages(first_gfp_flags, order);
>>   	if (buffer)
>>   		return buffer;
>>   
>>
>> base-commit: 073d54dc3ccc8c8109c56e4d984d1ad616554463
