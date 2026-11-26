Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693621;
	b=lnh5ezA6WGOJX+FKefCaEC6tigGuXB0b3VsxeFofJEHRePs6lvC1wJZwR7APls2mgjXs
	 FXOkm/vmuVEJcQ+xvrJDlZMRJ+CjAdjZnCuWrYl9bC95foEhzoFyFCPol/ZYiQhDoDp/Z
	 3Ve79Y0/r4w9SaXAN3il25uwVCZDfifXUJaqR6olhrapqP+mik8i7bycJ9W/2ZzdPjbLR
	 U3R3SeDvl/0D4OTfoOAXvED2h1YQNXZigEhA5iu6bt4+99498BhlGB3qMGMiFgbduUsb0
	 NAx0eVmvpx+QYiXDIbHZsgf/f3NKSYm6DUVKH1QN+R0VxQQCQS9Ojy0Vnm91vrLnEOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693621;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ivn1Psu3XjOT0UDZhebXauXh6dqjE8h2Fybirczcnno=;
	b=eyvJQpFr+qWwoaoAYTkzVa+/A1ZLGhWr+U3rd+2GJlAs22l2Yz2K//vXaGxxdqKiBoJP
	 MQOdTpSXtsBZF5YtLYmJwQOCM8v40/jOijhbpIcpxaZn2hYf2RWOTArKUfvWKOXpHyLtx
	 1RPZIauLYpsjU0Thrse3E4SkCse7cAEYv2Ttp001U90hdLYjt8CzfJ5AmoK2mZS5iYfio
	 P/dOW3L3vBHAzwuoEqsZSjEo5qhnxqXXoKU8Cx9bA2y4zcy+5XDE3vR3Au/njotKqCjVn
	 8p4q3z2oidebAtMboW1kvoBI0KJA8gJUmeqKvvcVd6K21ja2nKBGj+ruZm7Pw+3h5Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OoWbWU35;
	arc=none smtp.remote-ip=95.215.58.57
Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED9F606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED9F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OoWbWU35
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EARKZi3tUvP34hFIJf/sEqfvTJW+Kcy4TT8XVR4TKas=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795693617; v=1; x=1796298417;
 b=OoWbWU356Tbs4SADZr0kUmEDzYW31C0pKAyjCnF+BsrCBdYuTIV+Pomo83VRcYkr9JbKZJzX
 UBI7QveIwsRSqExtEKSBspMpXlEw+zJwiQPhQ1A4jHzE50XV/8fQ8U+0nGlvap2NyoDakSzwvoP
 rbflLDZD3VDLt2VHjYzGvTok=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e6744248fc0be58d;
	Thu, 26 Nov 2026 11:46:57 +0000
X-Mizu-Trace-ID: e6744248fc0be58d
X-Migadu-Flow: FLOW_OUT
Message-ID: <fae65e0a-182c-4226-9694-152c42cd8e55@linux.dev>
Date: Thu, 26 Nov 2026 19:46:46 +0800
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
Subject: Re: [PATCH bpf] bpf, sockmap: Clear the redirect target after the
 stream parser runs
To: Sechang Lim <rhkrqnwk98@gmail.com>, bpf@vger.kernel.org
Cc: netdev@vger.kernel.org, john.fastabend@gmail.com, jakub@cloudflare.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ast@kernel.org, cwang@multikernel.io
References: <20261126101950.1682160-1-rhkrqnwk98@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261126101950.1682160-1-rhkrqnwk98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/26/26 6:19 PM, Sechang Lim wrote:
> A stream parser can call bpf_sk_redirect_{map,hash}(), which store the
> target socket in skb->_sk_redir. sk_psock_strp_parse() never clears it,
> and it shares storage with skb->_skb_refdst, so skb_dst_drop() later
> passes the socket to dst_release():
> 
>   KASAN: null-ptr-deref in range [0x0000000000000128-0x000000000000012f]
>   RIP: 0010:percpu_counter_add_batch+0x24/0x220
>   Call Trace:
>    dst_release.part.0+0xc9/0x180
>    skb_release_head_state+0x1cc/0x2f0
>    sk_skb_reason_drop+0xbc/0x420
>    strp_done+0xcf/0x150
>    sk_psock_destroy+0x85e/0xb10
> 
> Drop the dst before the parser runs, as the verdict paths do, and clear
> the redirect after it. The parser's redirect was never used.
> 
> Fixes: e3526bb92a20 ("skmsg: Move sk_redir from TCP_SKB_CB to skb")
> Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
> ---
>  net/core/skmsg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/core/skmsg.c b/net/core/skmsg.c
> index 005e09121f00..4089901a9581 100644
> --- a/net/core/skmsg.c
> +++ b/net/core/skmsg.c
> @@ -1131,7 +1131,9 @@ static int sk_psock_strp_parse(struct strparser *strp, struct sk_buff *skb)
>  	prog = READ_ONCE(psock->progs.stream_parser);
>  	if (likely(prog)) {
>  		skb->sk = psock->sk;
> +		skb_dst_drop(skb);
>  		ret = bpf_prog_run_pin_on_cpu(prog, skb);
> +		skb_bpf_redirect_clear(skb);
>  		skb->sk = NULL;
>  	}
>  	rcu_read_unlock();


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


Theoretically‌, we should reject calling bpf_sk_redirect_{map,hash} in SEC("sk_skb/stream_parser").

Putting helpers into bpf_helper_changes_pkt_data may help but it is weird.

Both "sk_skb/stream_parser" and "sk_skb/stream_verdict" share the same prog type 'BPF_PROG_TYPE_SK_SKB'
otherwise it would have been rejected natively.

