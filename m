Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864092;
	b=lCH2guAHhJjHzVG2Lwh14M0/+OTz9RbSKUvkYAydzlT6E8WLdTXwsN5f61oJ8/724nmA
	 XTfEGn+RQRS893IMnjnFSXL9hW6IRyShfZPBy5Ag8KzJQACfGeHtRwsZk8jatM1Vvggns
	 b/sePug04QljqWTHz0MZ7XMQJ9zEkyXCS/Gc19CSBfyQRS/cgZ+hP9kvnmmgs7zRtE/ug
	 5FcJAulkGtQFbU+WtFlzYmSAwyOpxcZe5DVK0EJD2f2mKl0JX3sWnFoGhT5PS8Bwpvxou
	 +ngWnSGxeiBdjEp1gMmX0mcanglXs6oyDC5iB7++g+VUKxx9y6Ihz4UvujoFQQzRXjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
	b=13Ik6GIgzW+sElKwIPAnQ2yQyH1UjXLNkhAWpBVVEBlZ5SY3H3YE2h7ZBLWyiTcwk/yE
	 CRxNR7mhSJyipYa6ktKkvZLdyRm8GO9YeXicn41s8/5pbH80vGpIC7nDoDsIQBgi2oVnt
	 i+p3iIQPgymv9oNnqU/h9St8ZUHcO0jJHQtLfVx1HoxaHfOHE/KCQRTFnyE7tTk1rTSIE
	 gzhfdC2yzlD6MmO/AF1fbT61M5DUEW5dfqDQB7qFkSpm6MzFA+WVB78cdgKzHq1feT/3T
	 lzvED3pGVmTUZ4C3vpH0OhxsXxe+y9H9or0Qui1RDO6a4y05Zt+CMs3L5Fq75J935+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpc2ulQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13CF606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13CF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpc2ulQR
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae7fc5681dso339c88.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864091; cv=none;
        d=google.com; s=arc-20260327;
        b=JPVNTCs84hjDMIHTbip+Mmr2Y/3lTIZDaim/fDV/Rd9yB8TwAoNal5iQ9YdzTGjbyv
         zB8+191FDSgwygdPyL9bctWLYy5i6yHZXFj3dO6l+XCHGRXUhSZDDJ0KIAcCvwD1y7cx
         73SgJioNyDUeJzM5ebDbpi+LiWthwoPVcHCsKksmsLAkeeMnbIuERdimkEgnLAI/nIZJ
         Aym2RtqXXQjqnQC+aiuadWanRJI2U9dzhH/43VQPBltC79hkiVPUExwlGuRzrggnch27
         ogPb64aI/fKColDSd0sHmqdXMV60fNRGQxehZl+oaMkWJbfHSyjynC+wzCL/jKmNKsQp
         4a3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        fh=hBrMQbnoywU+jXeVnvSNm1tMBTdwWb+7+7Gde/GJI+A=;
        b=nJy8GXPfKpxEA11qhabZJ5uW+BwW1+VwhJnALgl3zjT31t4OEryDFOwGJKpQbi32Tc
         R6+Kw5TaoVprTcomLjmhgCDll5i/sTOHimsJiyZVtYND+hY+JODsqVsKPJVelWHhlqnL
         U90GdIeD1jW3WZUTQhOatARRRVpK/kWAtSIO27D0GYx1VyQX5ij7MkooJO9B7tIFXhZO
         drRZlYOwIQJ6205TAyv39Icip84j6JeQAl4jjWO6PXTDQTwprFAvFpoFVm4CGLwJU+YM
         cgHjxx7utdgGQ86wINncasbASi4l6jbPO/2XXJvFwl0aXsQhs5cJn4ZM1ORq2RYJSA89
         7Xyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794864091; x=1795468891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        b=mpc2ulQRbWKCYMfXteuPNK/WkDbEvq7BHSIozp/WZ5rJ9Ay1UwuDo9j5m255aDnmpe
         GNzvlEuBwblIIy7k0K+/Ti3XB/AJamiDqQwHXrckzMaQaY+AEdBbRckqS48Xy7HcnuZk
         kfiNuOUzahvY9TS+CeaNNQgCR2zzmDklIm/T3kq7FVno6v2vlW5BQC30y+s2wEZskIMX
         odTfuVUIIX8rI6coGiXhokSkAigXX77P9TqXOf7Fs0P7rm9ubE2JCFgv4OBxJvTqo0Nk
         9zJQtMg2R2xQyiElXWglY0jJolpQLWCl1KABb5VYenc2ODepzl9b+0OdTxyyheiE1FUw
         YvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864091; x=1795468891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        b=iWOftDHnyVSCjDjv1frrWKaQMfVKcMEhdmVDKG1Hv61t8LaL7RiZ44EUNg2mgtwcFE
         QnoAEz1SMITI4OmDXqE/4WZ8F2SfxYj/Jx1TFNqQgz20+jND9+N7zZ5HVm5FeIXzv6Y6
         WAXsTQmfJ91cVHNZo0P5zaNex9pUgcCybP15jVMp/dKUb5Olo8xJb1dtISKCUZGGu4JH
         UVPamIT5WtJsfD4PmqUBAjn7Gg94Dz/TiM7QL3dU+wy/vO+78UBC62NTKVadlohJMp/i
         Y9pypXLr+QZh5GRX3x5LfQZfdSHrC7N50Huv1x1Ou353AsEyMQcYJ82RDcVnfQd43733
         IX9A==
X-Forwarded-Encrypted: i=1; AL+hErEVZH3iNVmNDJAFdaKTDA1vZqHqGiYJnVWrTPVxj24pUJrJmkfP6D5TCdobLNncRZf0KVA8JZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z82iPUrs5hEHsTtgY/+oizhvvYhW+mg1SWXVVWwQ8iC0yMa4a5E
	gL66rQv/VSMMax06gEHrulgbXZcBw35tB5oJwXHEndePtJDl7Gk1NCMKAvy/YmnFtFRjbB407gs
	us6Cy/VHJPZ3a27lS67hTqK4wxXIQ3l6e+K947D3T
X-Gm-Gg: AYBFou29RIb3VV9SHjPhVo+SzoqjHGlv3dOWkNOwWdCCIgxL8VGJzrytdGy02pJ5aic
	Ap0sK3jnB3vIyhsi0I1TifOsd+gup+mzzu4QySEMaYoppcbvlMSNk9CQQ5VXuQLowSisNJjpxpG
	C839yxei3XzQZslUVCfROhOjQFwydmPXC9ZGgihWTSg0BqHYxMkmFxaQZVlcGfNESkMJM5njfrD
	UxuJcMgfKoURABDeg6RC4Pn0t5Vve4bI20iL2b5CYOU6xEwxvfkbPiROwKedYdRFHRNHXd4dww7
	NMMx5MAuNn/DRG+xUu6T6Fv5hRFoV13+vuaBQIpJqE1QglrZp4to0epURNELSFWfNZfLG39qB8U
	Ji3ZQXgN4IEV5kteUG/ogkL39rjeeLmecomk=
X-Received: by 2002:a05:701a:8457:10b0:151:5aef:b375 with SMTP id
 a92af1059eb24-1b53b1cbb03mr26870c88.15.1794864089874; Mon, 16 Nov 2026
 13:21:29 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-5-bjorn@kernel.org>
 <CAHS8izNC9APadHg9yPtROkii1H7TPMAB7Xhxo+y9Cx-XCw9C1Q@mail.gmail.com> <87v75xj550.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87v75xj550.fsf@all.your.base.are.belong.to.us>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 13:21:16 -0800
X-Gm-Features: AclHuK9w3CNvroM5YXJNKwgkBqNWzGZQCQodYorHP8v1Ci-t1CG7mz-WEanoHTk
Message-ID: <CAHS8izMxaRKkSKqp3x4dLgTrzuzz5=8WMbEvq5W-oiqoL5vckg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through page_pool
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:55=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@ke=
rnel.org> wrote:
>
> >> diff --git a/include/net/xdp.h b/include/net/xdp.h
> >> index 1105bb9e3292..5ab7802ac4e1 100644
> >> --- a/include/net/xdp.h
> >> +++ b/include/net/xdp.h
> >> @@ -368,7 +368,7 @@ static inline bool xdp_buff_add_frag(struct xdp_bu=
ff *xdp, netmem_ref netmem,
> >>
> >>         if (unlikely(netmem_is_pfmemalloc(netmem)))
> >>                 xdp_buff_set_frag_pfmemalloc(xdp);
> >> -       if (unlikely(netmem_is_net_iov(netmem)))
> >> +       if (unlikely(netmem_is_net_iov(netmem) && !netmem_address(netm=
em)))
> >>                 xdp_buff_set_frag_unreadable(xdp);
> >>
> >
> >
> > netmem_is_net_iov() check became redundant.
>
> Hmm, not quite... netmem_address() is also NULL for a highmem page
> without a mapping, and the stack reads those through kmap, so they
> aren't unreadable. The net_iov test keeps them out. I'll add a comment.
>


Oh. I missed that. There are a bunch of docs actually that explicitly
wrongly say to use netmem_address to tell if the memory si readable.

Can you, in a separate patch, add a netmem_readable() helper and
update the docs (and if possible code places) that checked net-iov
when they were really checks for readability? Now that you're adding
readable net-iovs, all that assumption break right?

> >> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> >> new file mode 100644
> >> index 000000000000..fdd55265a6cd
> >> --- /dev/null
> >> +++ b/net/xdp/xsk_pp.c
> >> @@ -0,0 +1,246 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/* AF_XDP UMEM as a page pool memory provider
> >> + *
> >> + * Each aligned UMEM chunk is a readable net_iov with one owner at a =
time:
> >> + *
> >> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page=
 pool
> >> + *       ^                   |
> >> + *       +-----RX ring-------+
> >> + */
> >> +
> >> +#include <net/page_pool/helpers.h>
> >> +#include <net/page_pool/memory_provider.h>
> >> +#include <net/xdp_sock_drv.h>
> >> +
> >> +#include "xsk.h"
> >> +#include "xsk_queue.h"
> >> +
> >> +enum xsk_pp_chunk {
> >> +       XSK_PP_USER,    /* owned by userspace */
> >> +       XSK_PP_POOL,    /* owned by a page pool */
> >> +       XSK_PP_REUSE,   /* on the reuse stack */
> >> +};
> >
> > maybe should be xsk_mp_chunk.
> >
> > But also, why is this 3? Usually the mp's track allocated and free. I
> > assume PP_REUSE is actually free, but I'm curious why it matters to
> > your mp whether the pool or the userspace holds the memory (or whether
> > the net stack holds it. Can't it hold it?)
>
> REUSE is free, yes. USER and POOL are both allocated, but userspace
> gives chunks back by writing addresses to FILL, and it can write any
> address, also one of a chunk the kernel still owns. Taking that entry
> would hand the device the same chunk twice. So the provider only takes
> FILL entries for chunks in USER, and drops the rest. io_uring zcrx
> checks the same with user_refs, and devmem with the socket's token
> xarray.
>

Sounds like devmem choose to do extra-pp-refs on netmems given to
userspace, io-uring choose to give extra user_refs for netmems given
to userspace, and you have choosen to do something new? I need to read
the patches more thoroughly to understand.

--
Thanks,
Mina
