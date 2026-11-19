Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087974;
	b=sgU99+Lo13/xQYUgGB603Salj4Db9ZX6X8bY2M/aszR+v+sNaQTwdNmWPKmR3PC+WhG6
	 l5I52TxG9Gn9tBUHJYbMow67gpujoCKZiWFIwUxs+kdrfJC6BU41SWDhM01PJEPglO5oK
	 OMZw9iTs4FWHUvN4EMuR+qdglyJMsCTpoq+vWhHuT4mLKVq+cr4m8J2vf9FvnGqGD0cZj
	 yHCBavSBjp2f6pDfAvdWZr5GWU9YLTB3uJIW2lzbYrhAJFh7+9Laojr3Lczv4CHFWkIAN
	 Bx/xym0zvtxHBHEZBI3yTDtHAEMcz9MOMYfVjKRYvHqIdTwvg1VfTJjLuzTsr1rd8bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087974;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3CEJ9vt8MQkHo3fZI8yVaZHlx9R3WaygT/UoGLLzNaY=;
	b=f7i7mckrU9G83B6sumYgazBVks1+4uZKK8Cp9pCTiZL02u7aamlzUTALmD4nZJO6odVb
	 zJZ6RtMzcB2NSb4gacy1YPcxxtlB/8h4C7yIMe5h6wgG6QecOfpB2e5osmJQoLxyK+H/H
	 H3eKvd5mYUQeEBJIeeINh19imrqe+f/801gx/ARuhRjjGdyG4wJVi8OFJk3E0gWNLGnVa
	 sghxqNfA1N/Dny83hfygzFStV57zhrDw2V/Osc+S47LSd8Bil5npank+q34/wMpSEGQDf
	 2hp+nfnwcPKood6w2gC5WEbJYOWsY5Drtddl9FqPXUD5fdG20jeRVOSub+R6HITWWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E9vQ7SX9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=chj+q03D;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4616606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4616606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E9vQ7SX9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=chj+q03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795087972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3CEJ9vt8MQkHo3fZI8yVaZHlx9R3WaygT/UoGLLzNaY=;
	b=E9vQ7SX9VnQwn/N4JMiheqRc/7hogXE54OAI12U3OOMsNOT4+T2r/D6QzcYg77OD9tFoWG
	aUpVt9WlRXnR1Uk4peCTw6/qgiC9gtMfK7h/g8VD+PXnkzTzF0mW+IrmQ9Z/6KgivMUlei
	5kSjcdz+8J5g/dk9OTTU1dgitqLgKZg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-QsOGKnHYNkiYyjxPR9RVIA-1; Thu, 19 Nov 2026 06:32:50 -0500
X-MC-Unique: QsOGKnHYNkiYyjxPR9RVIA-1
X-Mimecast-MFC-AGG-ID: QsOGKnHYNkiYyjxPR9RVIA_1795087969
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ab3061668eso5102371fa.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795087969; x=1795692769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CEJ9vt8MQkHo3fZI8yVaZHlx9R3WaygT/UoGLLzNaY=;
        b=chj+q03DVHIii8/9aLEDR7aYcnOlPrCzqL3YyR/G73kqXhSPvnLBTs1b7aqQwqbXrb
         7lBWyqLx0m0dMyCAW1X9CR9sJli/kJq4w2C2ztzcu5mM/C2rLorRyIf06QUu55Q0gctM
         ciNYP0nhg9oNb+/2GkzH8CGzNxVkUorSCd7fuPqkOEORrMT8TK+2kKBWCrF/5ic0o6VD
         Q0rV6LL9iaZJFf7aBV1B7BHrVRDEzzZoYNI9wsej8CzZZPIVb2Q8BHtOb4Uy+WORJquX
         OjQWApTeAhhFMiSQByGNUDfSvI/rpAA0xpqV1/5NtNjL5+pYJuGZUS4JlFca8hUp6xcW
         VobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087969; x=1795692769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CEJ9vt8MQkHo3fZI8yVaZHlx9R3WaygT/UoGLLzNaY=;
        b=O+uRokkBEJwEl3g0mQYXHWwGrlP09vmt+DEaHFQjIAOX3w9cpC9Vjiy7ibBQnwMspf
         Hry5xRbn0JTezbi8Qm9Lw1Q/WkByamaLbx39XsIh9u8i2ffbNWhk8PSA/hQjFA+0SN3O
         CBiWpk/63FfDRBv1FRIVMtf9Nk5zigl9mm6EAmqjz7z82eI4SHfVAgwhtDUCAEKFCVNF
         ZDxZcjhpz/MGip5VzErLQv2s5DdRzCi3MtQ7Wfwm+h0+mJdMAT6BknRDxjmgHECtSLzu
         JecCs+ZSYjl/shw9FxN7eSCjvDAYuHv1OlPxj+WzfJEJBBpHUQ09B66T/guZn+P5sD4i
         h99A==
X-Forwarded-Encrypted: i=1; AL+hErF8Q3M9qGo9mqGiTmQccHaw1WgrVga1s9MptjZtME3ToRRKdNwiUE3HuIkeRX85iagQO5I2alQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S5LVZtQ2FXaPonYGkvFmfG+wJDZycuLKT2WlR/0BYCn8+xBxu
	oCVr238fs+tNzl7unlXD9KfO9OegsvbvyGnf5NKQArAM2id9Rtx80AGqpBOO04AJXbDHuxYTDKr
	z6Nkfe9ldHAcQzGyGY8uM/TKF/gbK9n4YgXLCZXmGH2ZDA+f+gPVie9GriQ==
X-Gm-Gg: AYBFou2zFp4P3saBvvebwB2zC3LITNvrdvgeb9FN+LYl/OhRdJOB+/AbmOF3B+9LVsG
	ntT8ftdtjwla14IIHa0aRtg5I1C8dnE0LrBlTlp3ChbJkOCdXLVgyCpWEUTz2w5zyhFdsRlS3/z
	JpnLTlZSmUJS9psJGjJG4+aMPbYI+RFt8ZfCKhhoRoDyw8CYtFCx76XMY0R0/Y0grIxTGXKSIcp
	Bd6a3pG5C8pB9nJdePYmnLU7YWf/tL9T8TSpIE6GJEW5dRnzgwz/sOgTvKk/X4L6jeIvdCiOYlb
	/czXd1HbDQ2Ab0JkYfOiLDHj8ZYifbHJcPYUg7Nrh91p9s0CxGCVsMgipIpF+SB1gmJ+jHCiViz
	JX3HfGO+RXKavrqa5WG7vM2971zFFFVr8Am0Gwl1EUnjOcXzl85J15RJpsENdh2SgJDokUrUZsi
	g0g06tRCcYRxgzd73JJRPpwqFU61M6vnJJIjfXgvwNUOVq
X-Received: by 2002:a05:651c:552:b0:3ad:fc9d:3b94 with SMTP id 38308e7fff4ca-3ae7b71af84mr2844271fa.2.1795087969041;
        Thu, 19 Nov 2026 03:32:49 -0800 (PST)
X-Received: by 2002:a05:651c:552:b0:3ad:fc9d:3b94 with SMTP id 38308e7fff4ca-3ae7b71af84mr2844041fa.2.1795087968528;
        Thu, 19 Nov 2026 03:32:48 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a885b81daesm5134470f8f.20.2026.11.19.03.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:32:48 -0800 (PST)
Message-ID: <99480e51-50f7-425b-b8e9-95b7734c64bf@redhat.com>
Date: Thu, 19 Nov 2026 12:32:46 +0100
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
Subject: Re: [PATCH net] net: af_key: fix use-after-free in dump_sp() on
 policy migrate
To: Daniel Wade <danjwade95@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
References: <20261114223529.1791-1-danjwade95@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261114223529.1791-1-danjwade95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 23:35, Daniel Wade wrote:
> pfkey_xfrm_policy2msg_size() derives an exported policy's message length
> from xfrm_vec[].encap_family. dump_sp() derives it twice: once through
> pfkey_xfrm_policy2msg_prep(), which allocates the skb, and again in
> pfkey_xfrm_policy2msg(), which fills it in.
> 
> dump_sp() holds net->xfrm.xfrm_policy_lock rather than pol->lock, so
> xfrm_policy_migrate() can rewrite encap_family between the two
> derivations. The second length is then up to 24 bytes per template
> larger than the first, and pfkey_xfrm_policy2msg() opens with
> memset(hdr, 0, size), clearing the difference into the skb's shared
> info. Four BEET templates put 80 bytes there, which reaches dataref:
> alloc_skb() had set it to 1, the memset makes it 0, and the skb_clone()
> in pfkey_broadcast_one() leaves two skbs sharing one head with a dataref
> of 1. Freeing the original releases a head the queued clone still points
> at, so recvmsg() copies freed memory to user space and consume_skb()
> frees it a second time. The CAP_NET_ADMIN that pfkey_create() and the
> xfrm netlink receive path check is namespace-relative, so an
> unprivileged user can reach this. SLUB's double-free check fires within
> a second of starting the reproducer; the oops kills a task, or panics
> the machine when the corruption lands in softirq context.
> 
> Racing SADB_X_SPDDUMP against XFRM_MSG_MIGRATE as an ordinary user gave
> 4585 use-after-free reports and 765 double-frees in 300s on mainline
> with KASAN and 8 CPUs. The reads reach user space (addresses trimmed):
> 
>    BUG: KASAN: slab-use-after-free in _copy_to_iter+0x1d8/0x1430
>    Read of size 240 at addr ffff88810f98d140 by task pfkey_dataref_o/433
>    CPU: 3 UID: 65534 PID: 433 Comm: pfkey_dataref_o Not tainted 7.4.0-rc2
>    Call Trace:
>     <TASK>
>     dump_stack_lvl+0x66/0xa0
>     print_report+0xd0/0x600
>     kasan_report+0xc6/0x100
>     kasan_check_range+0x105/0x1b0
>     _copy_to_iter+0x1d8/0x1430
>     __skb_datagram_iter+0xf8/0x820
>     skb_copy_datagram_iter+0x6c/0x1a0
>     pfkey_recvmsg+0x1ff/0x500
>     sock_recvmsg+0x15e/0x1a0
>     __sys_recvfrom+0x182/0x260
>     do_syscall_64+0x10b/0x5f0
>     entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    Allocated by task 433:
>     kmalloc_reserve+0x108/0x2b0
>     __alloc_skb+0x123/0x5b0
>     dump_sp+0xdf/0x490
>     xfrm_policy_walk+0x1d9/0x6c0
>     pfkey_do_dump+0x61/0x420
>     pfkey_recvmsg+0x358/0x500
> 
> Take xp->lock for reading across both calls, so both derivations see the
> same encap_family. xfrm_policy_walk() already calls dump_sp() under
> spin_lock_bh(), so the plain reader suffices, as in xfrm_policy_timer().
> The other callers of this pair are already serialized against migrate by
> net->xfrm.xfrm_cfg_mutex.
> 
> Fixes: 80c9abaabf42 ("[XFRM]: Extension for dynamic update of endpoint address(es)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Wade <danjwade95@gmail.com>
@Steffen: do you prefer we take this one directly into the net tree?

/P

