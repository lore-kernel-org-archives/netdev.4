Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900046;
	b=Dj8HaOrapSL53YJ78KN0okshVj8oj/djklQetTOg8fw4cfLJt1P3pdDDjpFN3u3qmoux
	 fZwKrXMCn3mqP7wbzvYjUGn/dOs1rNZuMQ4hsUMGtDvOpnK1BrIWexjM9JkdtRiSk0dmU
	 eiMZIUs4IrT4Wuf76VuUJKucVryGhvupZshZxr2XJ6+N7Z3/QYS2IOo/9btp1F4e6xTVV
	 720bmcPGzPVAvbG2f7wwzjbB+zLZqCnXTi+m/lvmkK8+wa4IGCH+DriW5iAUvr/F3GwU6
	 BhVzKRpD5xJ7VjXHtY4GrIYW5sBcTQGqJ3DRJe4JEl+jvL9Mti6DBtLATk7cg1yOnPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wGSN+nm4nJXlMtGvr0vz0Ecn/IBKbBibwHoRey+2Wug=;
	b=Rm27fCNW2KidUlmbNmr0cMztfhTc0hMsnhlJGZpUT6kIeRt59OMpOmi4JmP5IiBV8/Ab
	 wv9Zw2+KF7Nkal4zfWqQX5BAVlUhO11req+YyNqSLztIgm2/n1Iu6SPo41Elo1Miv6BvS
	 Ecuc9L782xiq1Q5akx2j6I1LBRBOXZU9BBUwG7SKReXU5Csz6DTS29WRFQQMfnTIYpCNw
	 CpC6xkSbpPCioS9BRSHZEhwE9EO9aGT9MyimSPkNAWj7n36HXm0MvMLRCUwmxKVdhRlg3
	 5PwLGO+T1dKkEbPzvaY3jLsG2wwemq3Q2atmJ4WNs2DPKYQ8ssjGtpQyGzJjxI3QXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=iMDYPIux;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02E8606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B02E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=iMDYPIux
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so26811005e9.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1794900044; x=1795504844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGSN+nm4nJXlMtGvr0vz0Ecn/IBKbBibwHoRey+2Wug=;
        b=iMDYPIuxcJhOnjf/IbvL4Bvjds5pxwpQ37fo/iu5CTvIPGB5N7mFHWgzFAHihy1egH
         83/yOBKyjxxKTG9bsZ8I1REZ/UnLcUikNT/ikodCrqqxe/aLP38al+JXEzOzT5qmRIxN
         uLv26tRS9IWZ8glqbYp1J4Os4afCJguxLfifvhJjmqzy2kUwLTnTUhSHpjeKYuoasYP/
         5m7Qe4RKZU3umVliDjANpxeuG7EOqfzLoJpTfXsNNa7WQMpFoOM9PJUsBzxLTwMZxzHL
         fRnvqziUBxSaE/jpLGGtnvQ8YUQZgD0elvdS9sEA82HKbHGiDBjVyqhB+JZjSt33IN7z
         YByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900044; x=1795504844;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGSN+nm4nJXlMtGvr0vz0Ecn/IBKbBibwHoRey+2Wug=;
        b=qEygEao2HHmR5L7kdI00FcKTaPlaT/Ge08YgupmJhC/SynMHebjnUtSEYLckO/0S9R
         z7eGb+vMI3acucn0Aa17KSQxZ15uk3ZiBLiYRagr3nex7sl+rHvMbApST/zM+vdjf0Me
         SBLkxbBz1sl41CNUxA+hJiNubu+P5bkNObd/ondSJitG6cPntBLD9G5SLbB0VWMoKSL8
         MfJNy4VFBgQYM1oVeH4miV9n+1fjvG2WDfVpRrQixElWzLXtqVw5ugm/69ioxyHjsyW4
         GCAx3ZY9iiFj9iNgNLIRjq3n5j/ODY1/elsQxKVF5wFb9KyyTgIB0jLbRgbFxjS9bC+G
         PGKw==
X-Forwarded-Encrypted: i=1; AL+hErEWFgoRMHtlLs+/g+vti1DAx7bvkjGBjeDwp/FY7iaM7xsEoDSxf6n91DYuSG9QP3CBSYPkAHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f143mrNnSjbf1G8MDJrzE+MolUMvao64FeBxWytA2YWByQTAc
	eGNFqy57DuyBwXQ2kobLvflC/u9HWAsuwEBcKJK8weMXlEcdbQ6PKxvm5/qQE0OgEZU=
X-Gm-Gg: AYBFou04pj52CExC8TZF6L0rEbbGSgr/z6RMNSYW/2+Cx5mIy/+HSKLoIz0gf4Ivvzx
	Yc10CHQASwvh6Sj1fo3ZgUYcc95ktyr577uFJZjzyt91jTc/sh6WWxXUAZjVtsl57b08kS6rljO
	I3MwVbni34K66m7vKWcJvpI2WMN/ZfZwFfE3KwTiQ9aAQUqfMfQ5UF4uqc2vQvJmna7K44EXqjx
	llI5fk1aM25nyjYBd07jfUnwvHvmjLX9wr1m3+sziL84ZUQlv//3YHvZmBMOj8B6ySJl+lr9ywo
	+filOyR44wGkQsCUbFz+vLjfBj1A0CqU5XrpUeA1qxfUU7LG2N9sdFa7VvRptYPdPV7JJXyVnV8
	NTSgwq1/ORbicUiaHQTpF/LaQy+EhrmIy82COn3HIww8DAEAH+pZ1jYH/zNItS1lUJBPI1TdqpO
	DnO891Ut5y3mQus9d4YUtkt0Fuwq8T+0rg0PbjtnEdxJeB5h+mKBR55yEpQIGVujH6UThOsKy3l
	hnYLONqdwa19Xng7lEtmT8Hd8lxusJmytZvZ0/MrYonkEAtQJPGSXGFX/oUupPS8VqPSRSDrX/1
	LCHRi5aRnbdj+jzvA8mdoP+Ih3tB/UJ4KnaCUb7tQQeQRtgwFxefZU237/0=
X-Received: by 2002:a05:600c:3f0a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb55a702femr252699885e9.15.1794900043776;
        Mon, 16 Nov 2026 23:20:43 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783853b5sm47198985e9.2.2026.11.16.23.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:20:43 -0800 (PST)
Message-ID: <5bf25689-5939-4c45-8155-48e1fa4c7032@blackwall.org>
Date: Tue, 17 Nov 2026 09:20:42 +0200
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
Subject: Re: [PATCH net] net: bridge: fix skb leak of reinjected link-local
 frames
Content-Language: en-US, bg
To: Daniel Wade <danjwade95@gmail.com>, Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115130211.7724-1-danjwade95@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261115130211.7724-1-danjwade95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2026 15:02, Daniel Wade wrote:
> br_handle_frame() passes the link-local frames it neither forwards nor
> delivers (01:80:c2:00:00:02 to 0d and 0f, unless set in the group
> forward mask) through NF_HOOK() at NF_BR_LOCAL_IN. Since commit
> 3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets") the okfn
> only learns the source and returns 1, which becomes RX_HANDLER_PASS.
> 
> That commit sent the nf_queue case to RX_HANDLER_CONSUMED, which is
> right for the synchronous return, but the frame comes back: on
> reinjection nf_reinject() calls the okfn and ignores its return value,
> because every other okfn consumes the skb. This one no longer does, so
> nothing frees the frame. NFQA_CFG_F_FAIL_OPEN leaks it the same way
> with no verdict at all, when the queue or the listener's socket is full.
> 
> Each frame leaks an skb, and one sent from a local socket keeps that
> socket charged, so neither it nor the network namespace holding it is
> freed. Bridge, rule and queue need only CAP_NET_ADMIN in a netns, so
> with user namespaces an unprivileged user can exhaust kernel memory.
> 
> nf_reinject() cannot free the skb on a 1 from the okfn, because other> okfns return NET_RX_DROP, which is 1, after freeing it.
> 
> Call nf_hook() instead of NF_HOOK() and do the learning and the
> RX_HANDLER_PASS return in br_handle_frame() on 1, as the 0x00 and 0x0e
> cases already do and as vrf_rcv_nfhook() does. The okfn then runs only
> for a reinjected frame, which br_handle_frame() has already reported
> consumed and cannot pass on the port, so it learns from the frame and
> frees it. These frames were not delivered before this change either.
> 
> Also set *pskb before the new RX_HANDLER_PASS, as the other such
> returns do; skb_share_check() may have replaced the skb, and the commit
> above added that return without the assignment.
> 
> Discovered by an AI code review agent and reproduced on unmodified
> mainline under KASAN: an unprivileged user in a new user and network
> namespace bridged a veth, queued link-local frames to an NFQUEUE
> listener that accepted every one, and leaked an skb per frame. With
> this patch the reinjected frames are freed and nothing leaks.
> 
> Fixes: 3b2e2904deb3 ("net: bridge: fix per-port af_packet sockets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Wade <danjwade95@gmail.com>
> ---
> Tested in a KVM guest on mainline b3dfbde62cf1 with KASAN and
> PROVE_LOCKING, running as nobody under "unshare -Urn". No kernel
> modification, debug patch or injected delay was needed to reproduce.
> Before: 192000 bytes charged on the sending socket, unchanged 2 s
> later. After: 0 bytes, no KASAN report or lockdep warning, and
> br_input.o builds clean at W=1.
> 
> Not tested: NF_STOP, NFQA_CFG_F_FAIL_OPEN, real EAPOL traffic, the
> netfilter and bridge selftests, CONFIG_NETFILTER=n.
> 
> Applies to v7.2-rc5, v6.12.117, next-20261109 and 7e1392a42ea2.
> 
> The Fixes commit was checked against torvalds/linux: it adds both the
> "return 1" okfn and the RX_HANDLER_PASS return without the *pskb
> assignment.
> 
>   net/bridge/br_input.c |   18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/net/bridge/br_input.c b/net/bridge/br_input.c
> index fc2e381..b5bd9d6 100644
> --- a/net/bridge/br_input.c
> +++ b/net/bridge/br_input.c
> @@ -257,13 +257,18 @@ static void __br_handle_local_finish(struct sk_buff *skb)
>   		br_fdb_update(p->br, p, vlan, eth_hdr(skb)->h_source, 0);
>   }
>   
> -/* note: already called with rcu_read_lock */
> +/* okfn of the link-local NF_BR_LOCAL_IN hook in br_handle_frame(). It is
> + * only called when a queued frame is reinjected, after br_handle_frame()
> + * returned RX_HANDLER_CONSUMED for it, so the frame can no longer be
> + * passed up on the port and has to be freed here.
> + * note: already called with rcu_read_lock
> + */
>   static int br_handle_local_finish(struct net *net, struct sock *sk, struct sk_buff *skb)
>   {
>   	__br_handle_local_finish(skb);
> +	kfree_skb(skb);
>   
> -	/* return 1 to signal the okfn() was called so it's ok to use the skb */
> -	return 1;
> +	return 0;
>   }
>   
>   static int nf_hook_bridge_pre(struct sk_buff *skb, struct sk_buff **pskb)
> @@ -424,11 +429,14 @@ static rx_handler_result_t br_handle_frame(struct sk_buff **pskb)
>   		/* The else clause should be hit when nf_hook():
>   		 *   - returns < 0 (drop/error)
>   		 *   - returns = 0 (stolen/nf_queue)
> -		 * Thus return 1 from the okfn() to signal the skb is ok to pass
> +		 * On 1 the frame is passed on here. The okfn() only runs if a
> +		 * queued frame is reinjected later, and must consume it then.
>   		 */
> -		if (NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
> +		if (nf_hook(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
>   			    dev_net(skb->dev), NULL, skb, skb->dev, NULL,
>   			    br_handle_local_finish) == 1) {
> +			*pskb = skb;
> +			__br_handle_local_finish(skb);
>   			return RX_HANDLER_PASS;
>   		} else {
>   			return RX_HANDLER_CONSUMED;

The fix looks ok, the commit message though - next time trim the AI slop,
all of that could've been 3-4 sentences.

Actually I think there is a worse bug in there, by the time an skb was stolen and
reinjected, its port could've gone away (I'll have to verify it) but we deref it in
the helper without any checks, that could lead to a null ptr deref or wrong ptr.
I will take care of that.

Anyway let's not delay this patch,
Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


