Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169361;
	b=zGiqGGY46OtgV5k6PhVuWNi/HJIZURm+F8cAlK8nzrjvDXOqF/0S6CkrUm4UUYgHui3i
	 Th5PbfWNMi6ylm5TZ4XofpRLo0gXoZNVlETAofORKl5WQig7t/BiDEULDqbMKzF0zTRxe
	 MGVvL88h6J+n6pF8gOyrxLPvfqZBf6vU6XFjYD/FIk2+By38aCZDh0qQIfbHbcb/d/31N
	 Va3mv9UrdpFlDjmea5DgVYeoFAVcojA41XQW/m1yJGVqJHDQEeLZEnFgf94pwbf86c5i1
	 52ateI7N0EvnSN6YOwUYLJ0Ui1tngOb4I7gEk9HDSiCnEWgEF5ObujjD3y9wPOXlcog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169361;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8l1rxUVHALrLazVSWALlznjCgIYdHTWqcToTvFjFBKg=;
	b=yGPIW1wP0O0mVWq3la99oFmNugVFUVeFAmeLIDelBRd53eyjhPeyU/Xp0RDY4jvYsM/K
	 StMMgXIZiQK6mAUpTsh9/Lbw+tXlJpRUUBAEyIiejeD2dGI/fKn5htBJ8bCl6rejEb0LK
	 Cm4tbri/2GDI3HPqWzTF6afTkffygU7tx/Kr6nkXfkr/sqculjZviNhUusaryFJd41pvN
	 4E+PML6NqWd521g+U1xlaAgvN5T0hu8sXPnIA8bJFxd9DyUm/pn5brZaU5SItmoe72atu
	 lhTYG1Jw4zUyHYduybnUmKL4Y1R/y6tSBLodOtwOAfLCOFV03a+LGRrDVV3UFG+JYIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="KK4/wbl6";
	arc=none smtp.remote-ip=91.218.175.145
Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DF606A334
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1DF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KK4/wbl6
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lmupTUCv65fg5pP75anIseOQtkdlOKkZnDml59Hx+vg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795169359; v=1; x=1795774159;
 b=KK4/wbl619CRE9joqmaw8LIvKdOKg2jk4pyiVIF4hVznoWuyV3N6otfaoXWUnWgbBhC6H2rj
 QAV0ijBAhkGuwRWbSwbaVe4Et5hMFScAWdZATXbMESpD6ibOrOzRRufWfOb8Gbmq+aOep6XNsbd
 QDMcI1kaejZZPt53EQ3B6JTM=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3039bbd6bb4976e6;
	Fri, 20 Nov 2026 10:09:19 +0000
X-Mizu-Trace-ID: 3039bbd6bb4976e6
X-Migadu-Flow: FLOW_OUT
Message-ID: <4198a993-1c7c-4ca5-8d31-8f8e36778702@linux.dev>
Date: Fri, 20 Nov 2026 18:09:09 +0800
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
Subject: Re: [PATCH net v2] tcp: fix negative sk_forward_alloc after
 MSG_ZEROCOPY append
To: netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Soheil Hassas Yeganeh <soheil@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Wei Wang <weiwan@google.com>,
 linux-kernel@vger.kernel.org
References: <20261120094605.46063-1-jiayuan.chen@linux.dev>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261120094605.46063-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 5:46 PM, Jiayuan Chen wrote:
> Our local syzbot reported the following warning:
> 
>   WARNING: ./include/linux/ucopysize.h:57 at tcp_sendmsg_locked+0x1e13/0x1f20
>   Modules linked in:
>   CPU: 3 UID: 0 PID: 377 Comm: syz.2.2248 Not tainted 7.4.0-rc2+ #398 PREEMPT
>   RIP: 0010:tcp_sendmsg_locked+0x1e13/0x1f20
>   Call Trace:
>    <TASK>
>    tcp_sendmsg+0x2c/0x50
>    inet_sendmsg+0x62/0xb0
>    __sys_sendto+0x2fe/0x350
>    __x64_sys_sendto+0x7f/0xb0
>    x64_sys_call+0x1375/0x27e0
>    do_syscall_64+0xe4/0x470
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
> 
> The problem is here:
> 
>   if (!skb_zcopy_pure(skb)) {
>           copy = tcp_wmem_schedule(sk, copy);
>           if (!copy)
>                   goto wait_for_space;
>   }
> 
> When MSG_ZEROCOPY data is appended to a skb that already holds copied
> data, only the user length is scheduled, but the pinned pages are then
> charged by their truesize:
> 
>  skb_zerocopy_iter_stream
>    __zerocopy_sg_from_iter
>     zerocopy_fill_skb_from_iter  //truesize += PAGE_ALIGN(copied + start)
>     sk_mem_charge(sk, truesize)  //sk_forward_alloc goes negative
> 
> For example, sending 8 iovecs of 1 byte each schedules 8 bytes and
> charges 32768 with 4K pages.
> 
> On a later sendmsg() without MSG_ZEROCOPY, if sk_wmem_schedule() fails
> (e.g. tcp_mem hard limit is reached), tcp_wmem_schedule() returns
> min(copy, sk->sk_forward_alloc), which is negative. The negative copy
> is passed to skb_copy_to_page_nocache() and triggers the warning, and
> sendmsg() fails with -EFAULT.
> 
> A few options were considered:
> 
> 1) Schedule the truesize up front. It is not known before the pages
>    are pinned, it depends on the iovec layout.
> 2) Do not append zerocopy data to a non pure skb. This splits a small
>    header and its zerocopy payload into two skbs.
> 3) Schedule the missing part right after the pages are charged. They
>    are already in the skb at this point, so this can not fail.
> 
> Go with 3).
> 
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pressure")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
> v1: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/
> 
> Changes in v2:
> - Only call sk_forced_mem_schedule() for non pure zerocopy skbs (Eric)
> ---
>  net/ipv4/tcp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index d510e982dcea..343f6d61b408 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1359,6 +1359,8 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>  			if (err < 0)
>  				goto do_error;
>  			copy = err;
> +			if (!skb_zcopy_pure(skb))
> +				sk_forced_mem_schedule(sk, 0);


I think I should move such code before the 'if (err < 0)', like the sashiko said:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119090828.343748-1-jiayuan.chen%40linux.dev

>  		} else if (zc == MSG_SPLICE_PAGES) {
>  			/* Splice in data if we can; copy if we can't. */
>  			if (tcp_downgrade_zcopy_pure(sk, skb))

