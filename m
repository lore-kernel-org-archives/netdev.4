Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083843;
	b=GCZoQES/166CoM/aXxjKwKyk8eBuMhQFpodXKuZ34Zshq86TZoAWWbO6SXz2lBh6uSAa
	 3MhYWc6oRS6ZDzOfn+ukOq/L/e/9PSRD7HjhMyFqNg4zDZv7e5znh+TmXvKcM2eTHlpIE
	 rKMikRJPg3btRnlVhHDVJVFn4vP+hHDVWNKR1EBcHx53WB+TgeJGoarLRBrdHLEZCealG
	 kktPmuaQB15bXj4rMC2xlTIXFXK0KU/jOiTJQmXInJWdL1H3HVlsFe4xR0nGvt/rMav4Y
	 /6WNjqR5bD4NQyZbNuZklz1t8aP2MAO/FFd12p0ly8e6Gd5nBknfmgiUEjEp91zyIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083843;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xlbmEaq499875rOI5vwNWFDvgLSY3rciI0JnxyKuoac=;
	b=ginTG52ySOuUYgIBBTAM99hQ3dQT5j9RtFFbs2OBray63EeMPMD1umdt+3fNzqOaj5lv
	 ubO66pBU2lsVCCDLIfYm4AfWrGq3lspxB5L8DsUj/QbbPOdXmgLM5w6O9VzcH+D1Jm9sY
	 BSUws7LeV22p0oZ/bogfeuRegjf6dgcKrOIpL92QZPB+oGjjAzGW8fph4ptVojhjGb0hK
	 5gUzgiKawN9VD6ozlaDHzbqypP+O+sBzNX9l5JuAH16H+p0NTP1Kb0k8jA3yG5Ym31zRu
	 fFaJHs2v/fTeJIAfe57LVFXvVqzt7nYDHzlO4XMGpLzcuUc1Ajb1f5JP71H1AL1rOyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="CNK/9gmJ";
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC25606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC25606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CNK/9gmJ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9tehFAS2+iUu3i78g+gaEId15gNW5inSOvWWXgrmAFA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795083840; v=1; x=1795688640;
 b=CNK/9gmJ4K2rBn8qVe8XbQ8LUxsT+b44lJjgXDRUSJj2x7X55GYpnmrAH3cdNClS9fsI04Rb
 oniGWBz9OeKORxOjHUddSSTo7qU+ZfKFxAvfV2M+4s9MSUHWWaybVcfK8VFiy7ndmSo62H+h8Om
 7NL6ySlMR0X3Ad7PWdskLiGM=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2ed0ae7ef4b3ef77;
	Thu, 19 Nov 2026 10:24:00 +0000
X-Mizu-Trace-ID: 2ed0ae7ef4b3ef77
X-Migadu-Flow: FLOW_OUT
Message-ID: <4b841fff-d909-4bb4-bce8-9ab2be319ae1@linux.dev>
Date: Thu, 19 Nov 2026 18:23:51 +0800
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
Subject: Re: [PATCH net] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY
 append
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Wei Wang <weiwan@google.com>, Soheil Hassas Yeganeh <soheil@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org
References: <20261119090828.343748-1-jiayuan.chen@linux.dev>
 <CAL4Wiip2qPc5D_hRQb871m2cSHy-5++tNOOEr9sQYLhCxxknwA@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAL4Wiip2qPc5D_hRQb871m2cSHy-5++tNOOEr9sQYLhCxxknwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/19/26 6:06 PM, Eric Dumazet wrote:
> Le jeu. 19 nov. 2026 à 10:08, Jiayuan Chen <jiayuan.chen@linux.dev> a écrit :
>> Our local syzbot reported the following warning:
>>
>>   WARNING: ./include/linux/ucopysize.h:57 at tcp_sendmsg_locked+0x1e13/0x1f20
>>   Modules linked in:
>>   CPU: 3 UID: 0 PID: 377 Comm: syz.2.2248 Not tainted 7.4.0-rc2+ #398 PREEMPT
>>   RIP: 0010:tcp_sendmsg_locked+0x1e13/0x1f20
>>   Call Trace:
>>    <TASK>
>>    tcp_sendmsg+0x2c/0x50
>>    inet_sendmsg+0x62/0xb0
>>    __sys_sendto+0x2fe/0x350
>>    __x64_sys_sendto+0x7f/0xb0
>>    x64_sys_call+0x1375/0x27e0
>>    do_syscall_64+0xe4/0x470
>>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>    </TASK>
>>
>> The problem is here:
>>
>>   if (!skb_zcopy_pure(skb)) {
>>           copy = tcp_wmem_schedule(sk, copy);
>>           if (!copy)
>>                   goto wait_for_space;
>>   }
>>
>> When MSG_ZEROCOPY data is appended to a skb that already holds copied
>> data, only the user length is scheduled, but the pinned pages are then
>> charged by their truesize:
>>
>>  skb_zerocopy_iter_stream
>>    __zerocopy_sg_from_iter
>>     zerocopy_fill_skb_from_iter  //truesize += PAGE_ALIGN(copied + start)
>>     sk_mem_charge(sk, truesize)  //sk_forward_alloc goes negative
>>
>> For example, sending 8 iovecs of 1 byte each schedules 8 bytes and
>> charges 32768 with 4K pages.
> This part is a separate bug: these 8 bytes sit in a single page.
>
> zerocopy_fill_skb_from_iter() adds PAGE_ALIGN(copied + start) to
> skb->truesize for each iov_iter_get_pages2() call, even when the
> chunk is merged into the previous frag and the page reference is
> released.
>
> With a corked socket, one copied byte, then one MSG_ZEROCOPY sendmsg()
> of 1024 bytes from a single page:
>
>   1 iovec             sk_wmem_queued += 4096
>   1024 iovecs         sk_wmem_queued += 4194304   (sk_sndbuf is 2626560)
>
> With your patch, this over-estimation would become a forced charge,
> above tcp_mem and memcg limits, with an amount controlled by the user.
>
> I have a fix [1] for this accounting (only charge the pages a frag did not
> already cover), I will send it shortly. With it, both cases above
> charge 4096 bytes, and sk_forward_alloc is still negative after the
> append, so your patch is still needed.


Thanks for the fix.


> Thanks.
>
>> On a later sendmsg() without MSG_ZEROCOPY, if sk_wmem_schedule() fails
>> (e.g. tcp_mem hard limit is reached), tcp_wmem_schedule() returns
>> min(copy, sk->sk_forward_alloc), which is negative. The negative copy
>> is passed to skb_copy_to_page_nocache() and triggers the warning, and
>> sendmsg() fails with -EFAULT.
>>
>> A few options were considered:
>>
>> 1) Schedule the truesize up front. It is not known before the pages
>>    are pinned, it depends on the iovec layout.
>> 2) Do not append zerocopy data to a non pure skb. This splits a small
>>    header and its zerocopy payload into two skbs.
>> 3) Schedule the missing part right after the pages are charged. They
>>    are already in the skb at this point, so this can not fail.
>>
>> Go with 3).
> Analysis looks correct, and 3) is consistent with what we did
> for tcp_collapse() recently.
>
>> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pressure")
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> ---
>>  net/ipv4/tcp.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
>> index d510e982dcea..8bd377542a89 100644
>> --- a/net/ipv4/tcp.c
>> +++ b/net/ipv4/tcp.c
>> @@ -1359,6 +1359,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>>                         if (err < 0)
>>                                 goto do_error;
>>                         copy = err;
>> +                       /* Pages were charged by truesize, not by copy. */
>> +                       sk_forced_mem_schedule(sk, 0);
> Pure zerocopy skbs are not charged, so there is nothing to fix for
> them. Please avoid the extra work in this case:
>
>                         if (!skb_zcopy_pure(skb))
>                                 sk_forced_mem_schedule(sk, 0);


Will do in v2.

