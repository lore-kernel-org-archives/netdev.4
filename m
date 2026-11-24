Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509591;
	b=REufwqU1Sk2LBddc/0afTbJIT7fj8gMkVdk2ELdFDo2DmBUDOshzZ78uYSHl/gkceePn
	 LLl4X6ZmYfWQBpPnY8ENnbLuRCguPGgjc/yI7E08pl+kO48ojJhj4KsQE7pcfUdONtULS
	 Swdlzt1YDP3spVS6wkqsa99IOL5/MnKUEZ+SBAtyWGyhwoflgaBIUthG99eI9MzvCcA2n
	 MwxoGJgXmkZ7oTPpXEdUhdCqy8gYK29UJpGkxgB4qf08GkbiNbSQkaSK5Wp1Udcl3Eqso
	 +Y9cCPR19AWjyruQtek2Gy/Jh/s8kHHFynM+Dcqb4UkWck8VLCQQBhSjYOOqBWWkVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZrV3PsIVthQWvR94PJOjcLJ8y8KziKokZCXJS0PC7Ck=;
	b=0i8skLEMa19m7d7i7HGv4pzR1aRbp8d3OEMvYGA3A0MbWqqCEq8ELkAgvT+xQ/DWU//k
	 CIqEcW5jeOdqs+oZvLicv7p24hxChghk7No5wa1ZGPXhADzHsHSQLrienn+qx1xZhfMdl
	 sFDcA41gvHB/GUsdjnVw84vq4ntnANKhieo3w6A5mruohkJfcbHOu9SHonXhoXwTkw6sy
	 FOjgBi6nTOcQDHiSZJoJ6rmqbcUbLpQgw2QeiFkQRMYaHVnYp3f5H0BAxObWRX/cEl2Mr
	 Zq14RnmWC2/+IfQARa28/HnDd6PD4+dM1gEPutLjLa9kQN/CI+eUAYVfQbQNTls6KoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YdT+6NAZ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365B606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6365B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YdT+6NAZ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3755700f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795509590; x=1796114390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrV3PsIVthQWvR94PJOjcLJ8y8KziKokZCXJS0PC7Ck=;
        b=YdT+6NAZdu89kXGvVdYfI1paVgPLnZM/MDU4MbGkFqcJMCJDH2xOp8f+0Lrw5l7cq4
         +Ro+KhuJRmBjFpVNiWxfEWFi3tl9Z6mEZ/0Lhg2+eVCeftjZUjHs8tJ5381Ttg3Vo8iL
         f32MW6AAwDpO+c3Ib1Iy+sH+d7AfKhqRFGrwDPjjnimXGP/ZPQvq2bktZ1ZSNHrgkoHV
         0tjox3jufzNg3/ajK+oq/awp091RMYStiLBc0+zfbKRkJR/zkjiSgyu7/nrwmaTVBn/b
         MdfuY4QUKIYGm/ODGmKO7wAVKql1FpkSiK8dwlX0c4Bd66v3s+Q+2yOxE+qYZWkqAonv
         8thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509590; x=1796114390;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrV3PsIVthQWvR94PJOjcLJ8y8KziKokZCXJS0PC7Ck=;
        b=2e4uNBCSBrDt6izLXwnezOBRMoKbuTcRZMZWNo/2lyorovQaacfvXNVgbZYlgQGlG9
         tvVv6KSVj1BVCY553SneSBvnnlI6bEH/Gs7LyaHdsQw8oWgwjHppxCNYKaExO5d458Z0
         6LKlWRpQTmZ+LXN0iPr4Ymccv8eksjw2jMmninyT7jjThiJvvqTF9ek8QN4aup8mqSu/
         yCqrPN+9H4gbYpm2A78Ykftuw/RdhwAalaIxB5m8XTTkWxGDYj/j3saOeV7tE35ZYU3W
         bWWTSwTWmuorkBiTEMNMWY6bCVSQ7N2shOEi9+0Vk/mUoS4hypQhhduoUj3t29QIrEz0
         qmrA==
X-Gm-Message-State: APuU4Z++CEJTisWt5qFUk6aLU+XsDiCjRo5XT5dRVOwFu7bKKOc/Dx4w
	crTneypgOB2WOSzUs6ro7pI7tZPqwzU9cKvNGcDKxRvB9o/MUA4T0jd56ae2rqUCWZY=
X-Gm-Gg: AZFdTZfaQfler5Ko/BqP7Odkr842dKB350QMWSBCyV+EOZHwmDe+iunjFOHQTNOaDHI
	vnc4eU+H1gGI0jdthYG4TnUhw7jAJvsnxZQU4fc9+c+V3jxf081HLqSout56quMFVZz7SPXtBxg
	Ci0ly4xJCDH5dDlz2/U6yyIvmp1v99oUnnUiMnAlUuP4TUU3eqRu22qOYAFRQoRQeTvX5/7LShz
	o7Kk1YW08IGX6AXstWl7rbGsVChptiw7QkLu7CMbYZhxpmbtX/HXyvNYaaM+ahYU0FZC9y/K5Ao
	scMSn1LtvdvyUfDePhBmwPfz86ibXXzKaKaZr5oI/Bf6UuqTCxcPLYQUFjxXdQuK0EMElmJvq0y
	n4yTaxaxNieuPyheF/csgUo48Ea4bR3GYuyqLwQVOoUvSiPu4HJUBcAjBhWMLl8KWNZaoS65RaJ
	eBcyQnKO48ZK5qGXiUyLQXEhFJ3pISkXr9Ny5+Pii/SNuB+avZD8cjz0NdA3N8h1WlCjLbvhA9a
	Le/Pw4esQStRkySy811zWqSKWjSy9lZ80/f8pGAT3KvW+sPuvYAtc2l8/7lTPLRsbMla1bZOu2W
	dIxT7qJ2xD05XN0bPuqWkVx4X0EZzai8cBzI/Dy+uQIBFBKI6pehmnncqK4=
X-Received: by 2002:a5d:64c9:0:b0:4b3:f000:1bdc with SMTP id ffacd0b85a97d-4b3f0001c13mr8456154f8f.45.1795509589524;
        Tue, 24 Nov 2026 00:39:49 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm26878482f8f.44.2026.11.24.00.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:39:49 -0800 (PST)
Message-ID: <38460544-04f5-41e0-b267-39c155bb08bb@blackwall.org>
Date: Tue, 24 Nov 2026 10:39:47 +0200
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
Subject: Re: [PATCH net] net: keep skbs with a prefetched socket out of
 gro_cells gro
Content-Language: en-US, bg
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ast@kernel.org,
 kafai@fb.com, joe@wand.net.nz, daniel@iogearbox.net, bpf@vger.kernel.org
References: <20261121160204.4024204-1-razor@blackwall.org>
 <179548941922.3135.9577858774980848901@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <179548941922.3135.9577858774980848901@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 05:03, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete.
> 
> --
> 
> net: keep skbs with a prefetched socket out of gro_cells gro
> 
> This patch makes gro_cells_receive() send skbs that carry a prefetched
> socket from bpf_sk_assign() to netif_rx() instead of the GRO cell. The
> goal is to stop GRO from clearing skb->sk and skb->destructor on merged
> skbs, which leaks one socket reference per merged skb.
> 
>> diff --git a/net/core/gro_cells.c b/net/core/gro_cells.c
>> index 31352cac355ce..4e8b9c3cd7da0 100644
>> --- a/net/core/gro_cells.c
>> +++ b/net/core/gro_cells.c
> 
> [ ... ]
> 
>> @@ -26,7 +27,8 @@ int gro_cells_receive(struct gro_cells *gcells, struct sk_buff *skb)
>>   
>>   	skb_unset_transport_header(skb);
>>   
>> -	if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev)) {
>> +	if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev) ||
>> +	    unlikely(skb_sk_is_prefetched(skb))) {
> 
> [Severity: High]
> Is matching only skb->destructor == sock_pfree enough here? An skb that
> got its socket from bpf_sk_assign() can still reach gro_cells_receive()
> with a different destructor that owns one sk_refcnt reference per skb.
> 
> One path: bpf_sk_assign() at tc ingress attaches a non-refcounted socket,
> such as a TCP listener or a UDP socket. It sets sock_pfree and takes no
> reference. ip_rcv_core() keeps it. Then an NFQUEUE rule matches the outer
> ipip/gre/esp packet, and __nf_queue() converts it:
> 

Oh well the bot seems right even though it's a weird case, I'd suggest to change
the check and orphan on any skb->sk set, i.e.: || unlikely(skb->sk)
instead of unlikely(skb_sk_is_prefetched(skb)), that is cache hot too as
skb->dev is read before and will catch

Also tried asking an LLM if I'm missing something and the only case it could come up
that will not be aggregated is:
"the only correct aggregation that's lost is software ESP over veth or netdevsim in tunnel mode"
IMO that is ok.

What do you think?

> net/netfilter/nf_queue.c:__nf_queue() {
>      ...
> 	if (skb_sk_is_prefetched(skb)) {
> 		struct sock *sk = skb->sk;
> 
> 		if (!sk_is_refcounted(sk)) {
> 			if (!refcount_inc_not_zero(&sk->sk_refcnt))
> 				return -ENOTCONN;
> 
> 			/* drop refcount on skb_orphan */
> 			skb->destructor = sock_edemux;
> 		}
> 	}
>      ...
> }
> 
> After an NF_ACCEPT reinject, the packet is decapsulated. With !xnet,
> skb_scrub_packet() does not orphan it, so the skb arrives here with
> skb->sk set and destructor == sock_edemux. skb_sk_is_prefetched() now
> returns false, and the skb is queued for GRO.
> 
> skb_gro_receive() then clears both fields on each merged skb without
> calling sock_edemux():
> 
> net/core/gro.c:skb_gro_receive() {
>      ...
> 	/* sk ownership - if any - completely transferred to the aggregated packet */
> 	skb->destructor = NULL;
> 	skb->sk = NULL;
>      ...
> }
> 
> The frag_list merge path in the same function does the same thing.
> gro_list_prepare() still allows the merge because p->sk == skb->sk.
> 
> Wouldn't each merged skb then leak the reference that __nf_queue() took?
> That is the same socket and netns teardown leak described in the commit
> message.
> 
> The tree already has a general rule for this in skb_prepare_for_gro():
> 
> include/net/sock.h:skb_prepare_for_gro() {
> 	if (skb->destructor != sock_wfree) {
> 		skb_orphan(skb);
> 		return;
> 	}
> 	skb->slow_gro = 1;
> }
> 
> veth_xdp_rcv_skb() calls it before napi_gro_receive(). Could
> gro_cells_receive() divert or orphan any skb that still has skb->sk set
> with a destructor other than sock_wfree, rather than checking for
> sock_pfree only? Checking skb->sk directly would be one way to do it.
> 
> Separately, the "sk ownership - if any - completely transferred to the
> aggregated packet" comments in skb_gro_receive() look wrong for
> destructors that hold one reference per skb (sock_pfree on refcounted
> sockets, sock_edemux, sock_efree).
> 
>>   		res = netif_rx(skb);
>>   		goto unlock;
>>   	}
> 

