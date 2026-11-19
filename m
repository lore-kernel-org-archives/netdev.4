Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102572;
	b=yzahZKYqbvP7AUIjnr5iFpO3PUP5DbPe+LKJqxw3az75kBDqKMy8lhuW3M4wpc+xUdJo
	 0xlAICYUsS5WUEDYYjwQx8Gr29O9U02pGedyH7uhiR0d2ausAG/U5AviQhp4F/62YG9PL
	 eo53nlquRmZu+dXKL8zoLOaHJxHrZtJDts7to1uzKs4l2A9+lVYGWW143SljB/DOEITMB
	 BC+zBttQpoDDF1KDXwCUT9hnaB4D2Ia59dSJ8qOOmCKqLFdN0KFtZdekzo6sGEKNTtjWw
	 9AqjJ7iF8CnBJuLXr1LhTPpCP9iRxBypx8PAfKlcfB4Wgm4bfOs6fxl6y2T5j1BlhnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8q1xFrdKnC97TlJz6hYWenLpJiMoPbfjxZERSrqpSPc=;
	b=pRZfFxXMapCvrXSWh+bZw+G0YaDmCvUU0kXex1kihJ3FSM0cz0yU2ZWlcZu69qJdAjKK
	 212SYJJ7mKtifn9INoiEVnh3wEIvG5H+lOeTqYwYG3sbl85iZMBGjFgrNT2ALQ1sz/fX2
	 Xf+eoo1PDhEPudhoAeOcKe/kqvDquQvYUnz+vRweg1/XVezltbN3b4MFv7X6aaFZA2ioD
	 2nhavWctRUHjvKNdMvfnRnLNwO5fwRayD+l+eq9PO0yIwJDeMrFOOCod2QDAQ4m5mRl8D
	 6W75KKbg5x4FWdk5Fvc3lZGhXwN/LktrCNBpPp3n/YR7Lte9/cbcXWyPSWkpRDdzJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=RbNoaliO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CD606A33D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 040CD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=RbNoaliO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso21627075e9.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795102568; x=1795707368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8q1xFrdKnC97TlJz6hYWenLpJiMoPbfjxZERSrqpSPc=;
        b=RbNoaliOxnW4tm3kUubyUdVCFUVyev+F5D1cpuOGzrY7fcR7egnI0M+oo6OFIaQfk1
         Ww5aJfgeevIOzfLw2rhvpSIv9E8hWiywxxsOkmgiRKahAzUabE5mMuDlou0kNg/NP3Xz
         iXiYm1FY6Y4IUm4xltk32Qy/MDyOaFyzaL0YYIaWyhZ5joAcDUNssFN62z0oIFlJgog1
         yekvXjzgwyneFiWX06tIN6/Rq78onkRavgIDQuhGjcuTEwCrGUQK7JEIQI7ORXnVILMY
         gL1iWswi40Ww+I4oq5BdhUjbFjag7HdYmD5D2LaYP48UxjgY4fIXtCicrGINqS9o9xRY
         c7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102568; x=1795707368;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8q1xFrdKnC97TlJz6hYWenLpJiMoPbfjxZERSrqpSPc=;
        b=VMxVrClyDHTdxewO5Zci9qQNgpZK2QgJCAM7GLzmvY4Wf4S8isP1iMAI9fcbOY/yRs
         +sbFV1DxchXBR3rhwrPJJZU9/5EQoGfR/5GzHjTumtaMj+ZK656ftp3phuLxxhxea0Hx
         86WbAheyOFdcpZccGlGVwjqcLIDLvGATX09kMm3vdiwaF0aAiQGk3VXSS8N5QKOwTq0f
         sF8NCB2hrPv/FYHy7WRzsCDPbEjvZFUIuQwh9oAefQg5pkBg0Z8Xw7TSPzWd8wMixqec
         u6iiJ3ZNpy4i8fAT+A/0per+hdGuFBWwuvRtx/sHcvQSHvAM5pi6gGmmN47K/l0JJhUD
         G1XA==
X-Forwarded-Encrypted: i=1; AL+hErEjSopZLjhVcqyAcMdupqBk4OKbvp66x9zlfSliZmaSoiTxnsWghjf2w5fFGwiyuaJowZKRZ74=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K/LDrqbJ+Ky5sQPtzbvUVbDgk4Z3DOVahAwK0VoAbzB0pNd2o
	55ZUdykGAnAj3sFZVaMXlLxaLqeIT1k+q4p+IsYhNb2Uf/rFXSCDDac+AcJjwdZELVs=
X-Gm-Gg: AYBFou37hzeERoOFTEn+uJWp1KiO+XvS2CGpOwRRNgLryUFog2AeJX/8LMv3+JYggh4
	4gxa0s4zJgZIWeJoksRKFOgymJmUj2Zxrs9oCxNChL6xKsVtvl5zhcAO9TdO59s2Vhq2iAA2/v1
	UIglzKnVNSb0T83AtyboPAEyLigUiaKpGVkDcfRpy3U6xsLaAAgfl17AMVlLMukXlKKZgHs2HB1
	0X0nkcodt1E0WOdH8Kg0fa5T2M+ZHGu0rmzkN0RzQAopiyTN/yo5d/1fcM/pvo5FluXwbHIlmy8
	xWINPWIY5QNXyoH7nN4masd6X8qyw13MnKHhAwpHonT6VUfv82evyX8sGbWDJJCQKn/1Oz6ij23
	Ted1WE4ns4Iuj5/KXyv8z7JJ2hoYMHnbKixhaanC/lEnIeuclFqRgRdv93Y+EDs78gRAANykaqM
	OsmDQ/I8b9UrtUWO6gO3NmsvIpRLR1GRKfIAYrJl/klUDLRYKHaCoJzx0gdYUb8jzceGZFcWzTX
	dcOLC0DgkDH4P6VPCoCA8YLzd23N0N6z8bqr7oxZAEoy8tPmMaB9s49q4ScRNkAOV5fHcjvB2l8
	axeq6v4TuN1cCUNiPG5jZ1kIC6Ff9SZVgDF49+k6JTIIeB9mAG8nBgdNK38=
X-Received: by 2002:a05:600c:4e50:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb7da1edf4mr120554325e9.20.1795102568093;
        Thu, 19 Nov 2026 07:36:08 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e58ab3sm28200175e9.4.2026.11.19.07.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:36:07 -0800 (PST)
Message-ID: <ada68cd6-93dd-474c-a11c-6a851d9fe3c3@blackwall.org>
Date: Thu, 19 Nov 2026 17:36:05 +0200
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
Subject: Re: [PATCH bpf-next 3/8] bpf: allow bpf_sk_assign on tc egress with
 refcounted sockets
Content-Language: en-US, bg
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: daniel@iogearbox.net, ayush.sawal@chelsio.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, john.fastabend@gmail.com, sdf@fomichev.me,
 horms@kernel.org, kuniyu@google.com, willemb@google.com, jhs@mojatatu.com,
 jiri@resnulli.us, sd@queasysnail.net, paul@isovalent.com,
 alasdair.mcwilliam@isovalent.com, netdev@vger.kernel.org,
 martin.lau@kernel.org, mason@kernel.org
References: <20261119142231.2612515-4-razor@blackwall.org>
 <a4c31b033613fa51016f2cf42f90e3f2c61d0e9a8c1012c20e5074a0e92bbe95@mail.kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <a4c31b033613fa51016f2cf42f90e3f2c61d0e9a8c1012c20e5074a0e92bbe95@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 17:19, bot+bpf-ci@kernel.org wrote:
>> bpf: allow bpf_sk_assign on tc egress with refcounted sockets
> 
> TL;DR:
> - bpf_sk_assign() on egress may hit BUG_ON in skb_orphan() for test-run skbs
>    with skb->sk but no destructor
> - skb_do_redirect() may keep a borrowed listener via syncookie reqsk, a
>    possible use-after-free; also possible socket double-put
> 

oh well, both are good and valid catches, I will take care of them for v2
my local Sashiko run missed these too

Thanks,
  Nik

>> diff --git a/net/core/filter.c b/net/core/filter.c
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -2559,14 +2559,17 @@ int skb_do_redirect(struct sk_buff *skb)
>>   	if (unlikely(!dev))
>>   		goto out_drop;
>>
>> +#ifdef CONFIG_INET
>>   	/*
>> -	 * Prefetched sockets may borrow a listener under RCU. Orphan them
>> -	 * before redirects that can outlive this section. Peer ingress
>> -	 * stays in the same RCU section.
>> +	 * Prefetched listeners may be borrowed under RCU. Drop borrowed
>> +	 * assignments before redirects that can outlive this section.
>> +	 * Peer ingress stays in the same RCU section.
>>   	 */
>> -	if (skb_sk_is_prefetched(skb) &&
>> +	if (skb->destructor == sock_pfree &&
>> +	    !sk_is_refcounted(skb->sk) &&
>>   	    (!(flags & BPF_F_PEER) || (flags & BPF_F_EGRESS)))
>>   		skb_orphan(skb);
>> +#endif
> 
> Can this leave a borrowed listener behind a redirect?
> 
> bpf_sk_assign_tcp_reqsk() installs a syncookie request sock whose
> rsk_listener is a borrowed SOCK_RCU_FREE listener:
> 
>      req = inet_reqsk_alloc(ops, sk, false);   /* no ref on sk */
>      req->rsk_listener = sk;
>      skb->sk = req_to_sk(req);
>      skb->destructor = sock_pfree;
> 
> skb->sk is a TCP_NEW_SYN_RECV request sock, so sk_is_refcounted(skb->sk)
> is true and the new condition is false.  The skb then keeps the reqsk
> across bpf_redirect(ifindex, BPF_F_INGRESS) and non-peer egress
> redirects.  For example:
> 
>      sch_handle_ingress()
>        skb_do_redirect()                    /* no orphan */
>          __bpf_redirect_common()
>            __bpf_rx_skb()
>              dev_forward_skb_nomtu()
>                netif_rx_internal()          /* queued past the RCU section */
> 
> Later tcp_v4_rcv() -> __inet_lookup_skb() -> inet_steal_sock() ->
> skb_steal_sock() takes the syncookie branch:
> 
>      *refcounted = false;
>      sk = req->rsk_listener;
>      req->rsk_listener = NULL;
>      return sk;
> 
> and inet_steal_sock() dereferences that listener.  If the listener was
> closed and its SOCK_RCU_FREE grace period elapsed while the skb sat in
> the backlog or a qdisc, is this a use-after-free?
> 
> The updated comment says borrowed listener assignments are dropped, and the
> commit message describes "sock_pfree + !sk_is_refcounted" as "the true
> no-refcount case from ingress", but the reqsk case above is not covered.
> 
> Separately, refcounted sock_pfree assignments made at ingress now survive
> non-peer redirects into egress.  complete_skb() and
> chcr_ktls_copy_record_in_skb() treat any destructor other than
> sock_efree/sock_pfree_ref as charged to sk_wmem_alloc, and chcr copies
> sock_pfree to nskb without sock_hold().  Would that double-put the socket
> when both skbs are freed?  The commit message says only sock_pfree_ref
> sockets are meant to be preserved; would testing
> skb->destructor == sock_pfree alone, as before, keep that and close both
> problems?
> 
> [ ... ]
> 
>> @@ -8115,21 +8118,26 @@ static const struct bpf_func_proto bpf_tcp_gen_syncookie_proto = {
>>
>>   BPF_CALL_3(bpf_sk_assign, struct sk_buff *, skb, struct sock *, sk, u64, flags)
>>   {
>> +	bool egress = !skb_at_tc_ingress(skb);
>> +	bool refcounted;
>> +
>>   	if (!sk || flags != 0)
>>   		return -EINVAL;
>> -	if (!skb_at_tc_ingress(skb))
>> +	if (egress && (!sk_fullsock(sk) || !sk_is_refcounted(sk) ||
>> +		       skb_is_decrypted(skb)))
>>   		return -EOPNOTSUPP;
>> +	refcounted = egress || sk_is_refcounted(sk);
>>   	if (unlikely(dev_net(skb->dev) != sock_net(sk)))
>>   		return -ENETUNREACH;
>>   	if (sk_unhashed(sk))
>>   		return -EOPNOTSUPP;
>> -	if (sk_is_refcounted(sk) &&
>> +	if (refcounted &&
>>   	    unlikely(!refcount_inc_not_zero_acquire(&sk->sk_refcnt)))
>>   		return -ENOENT;
>>
>>   	skb_orphan(skb);
>>   	skb->sk = sk;
>> -	skb->destructor = sock_pfree;
>> +	skb->destructor = egress ? sock_pfree_ref : sock_pfree;
> 
> Can skb_orphan() hit BUG_ON(skb->sk) here?
> 
> Removing the !skb_at_tc_ingress() rejection lets every non-ingress skb
> reach skb_orphan(), including skbs that have skb->sk set and no
> destructor.  bpf_prog_test_run_skb() builds exactly such an skb:
> 
>      sk = sk_alloc(net, AF_UNSPEC, GFP_USER, &bpf_dummy_proto, 1);
>      skb = slab_build_skb(data);
>      skb->sk = sk;          /* no destructor */
> 
> tc_at_ingress is zero there and convert___skb_to_skb() never sets it, so
> skb_at_tc_ingress() is false and the new egress branch is taken.  A tc
> program that does bpf_sk_lookup_tcp(skb, &tuple, ..., BPF_F_CURRENT_NETNS,
> 0) on an established socket and then bpf_sk_assign(skb, sk, 0) passes
> sk_fullsock(), sk_is_refcounted(), skb_is_decrypted(), the netns check and
> sk_unhashed(), and refcount_inc_not_zero_acquire() succeeds.  Then:
> 
>      static __always_inline void skb_orphan(struct sk_buff *skb)
>      {
>          if (skb->destructor) {
>              ...
>          } else {
>              BUG_ON(skb->sk);   /* skb->sk == dummy sk */
>          }
>      }
> 
> Before this patch the same program got -EOPNOTSUPP and never reached
> skb_orphan().  The selftest added later in the series (probe_timewait in
> sk_assign_netkit) goes through bpf_prog_test_run_opts() but only avoids
> the BUG because its socket is in TIME_WAIT and fails sk_fullsock().  A
> later patch in the series that accepts listeners does not add a guard
> either.
> 
> Could the egress branch reject skbs that have skb->sk set but no
> destructor (or the test-run context) before calling skb_orphan()?
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/44548126067

