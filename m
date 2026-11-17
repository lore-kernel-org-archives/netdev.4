Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891028;
	b=CE5K2f3bbzzXajxFtAnEjlQjaU1KhCMGRo0WnF1/btz+ruO3kV32B76AVAnL0BLtbNTQ
	 OoaagJYEDi1xhfE4O6sypgGw7H3riYzWSUuJ14hjFMlPupaH1aB8S3HEikG8pXD01cf0w
	 L+5Tz4HuammqpJM9eSXLcrlChQdNcUPKdGsVVYA5yxF16ZX0FTe0QahLm/4l0QCyapaIV
	 sBVQYdZiBjZVDpYgPm9vjCzqZpOBCCCkeLBvvLs7pX5LbAGkMJ+3/9pTvYnXzGVSsJcXN
	 T4OYIgpZRR96JMeFUojxprHL3n36pVHQTqUiz3zv3ORmQmaqoUSbovmTI3MqzjhQyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZoSyoZQWdNOdSM4bWqLW3oD6P4gXP5jD57AsOWSPPmo=;
	b=hJVvnxEVQi1a2bK49nawN0EfoNwhjcjgtSnLtWoZW0kqEahAFsq/00VnHX2bXu3sIgEJ
	 uihtG1lcZmCmSU/KuGBDVsDu9JXcNj7o6h40pILQsSTsbXF1YFshzm1dvpdfrtAekXTeI
	 LrYRMViH6kdpI6uX4ZonoYlIHezTPx+6eHQIb55N3ul+mQf9jx9bITQLOcKGCMc9Z84iR
	 vGHyabrYFToxK4rGi4gzPndf6hk1aIKRuMhHbq755m7QtKVeUiQJYgxGfbjaC9blsS4E/
	 OdCIKIpAORzMBX0g1Z2ktu3PIbV2BjGwlYtlqsQZw4CXWd3uZLvw72MZb82enj7ibQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ODDQP9xp;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E93606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ODDQP9xp
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b37951a397so2048816a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794891028; x=1795495828; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoSyoZQWdNOdSM4bWqLW3oD6P4gXP5jD57AsOWSPPmo=;
        b=ODDQP9xpHuX6IZYldwN6KvAGbIS9mPgl3WX6YAeCyoE3ZeQcGPQyt64N2Pmc8cwLo5
         E0op/gga7XkwAcjSIi+3vJwN7vdMehi7MK6h1iAScMqecB5wOKNGl1BvAJqC+vpTghha
         4dQFttp/BxsItcM6yNk2DpeYDSbi/SDs6BeN0tegwQMad6V3WoR8ObWC94A724hVVvg3
         Vfb6az6HPk/XuWTHCq/unhAG9Gl/GQmvCcfsXwIX351USAaZelmsvYsLKt/N6UKN/upo
         Z+hSdp2CmySe01kbVMunGu29LVsKuI92P5bO8/dx3MAV8Gy8uC4pu8hVyXitQcDo/+oJ
         2BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891028; x=1795495828;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoSyoZQWdNOdSM4bWqLW3oD6P4gXP5jD57AsOWSPPmo=;
        b=XjYnvVWJQ5GYphyr3AgnAnRfUYvuoSTyjBhkSHvjA8VDCpC26TOUostv0J3nERJPu+
         FU79B5bY47bdrh2s90OaKL9ph0T9HmoQvW/YAdM3jY5gy+T9hhfYYVOj1oPyDZcypkZs
         VfzeAAv32hFo7KbGg/aocbbKRS+rw2efR7jXRexynoN19Pzit9yNnSRGOgFO8GUHqKLE
         pmtWrg/LESNxjRBA+vQnAmlBsdf/xLaf6srcdNw6VnmxmiCo4Jdt7ZPYLJdLLnExqSOS
         JmE5UbE+dObGw/S0lYO7VLjcbrw59vO9IIceNkDcvz52IEfi8yMyLBqnK9vD82PKukQe
         0blQ==
X-Gm-Message-State: APuU4Z8hruON7VRAFKDPVMF9IluEWeI2DtKZKQnCTlkTpI1l7g59KgL+
	jx1Sv7CnY9e762sUPU51QffNY3OLArEXIUd6z8QmBeb2lCbQ14e53WuK
X-Gm-Gg: AZFdTZc10gtA9KWGNaCQUsxPFhCpKPMJw/vzrJG6m3Ip2fUAY1w9rtGLSDGBBJzPAXq
	jjQ/JznzGwIQ7lfdbjiY4YbOnLqkDKBYhdwjxH+RJsTYyDl+9VzXYm+J6CI/ELEtVZqNmuMEjru
	DR+pJzH1ZexD00abGjq8WUBgB+8ngZFgs8juOZTfZKBa5Ye3s3F/Op5Zb7RLNye2crj7PKy/Pov
	u+q0RlWC4kXycU+diDsH3ae0UN/dJP0le00Y+Pyg90/0pMdm07EORRz+FzvD97n2u7fwwumfxBT
	lWQJZTlA3SohzJX0nlz8QgiVDm3/4gBB041jFhr9ok+qgbBs1iBkJ3OH2oJ3vglrObLZuhLKkk7
	4N/AUa1pjRCgcrrPA27EhJC/r/LBjdhc5h+uZCDGJF0EDhFgDx5wtjqTjzCfT7FC9WVef9RSLr3
	6X208BB5F4ACkdvVKZ0hMaLu/unv2rUvEvagM+9jgXqhgImMMhcLDvp3O/5toBTepjI3bpZzbBg
	9gVmnZASPdvVWVVCRgY5OMoi/w/05tUT5V6Har4S3JMmcSEzQk36us3LC+8LAGSPAa3JOLKDOBT
	V+edk2Nu+ItqDvqKOlIuWEywVUOJd4rRP3GsFU5tBqnnNGoCBJLN13VbklTzY/Fbzen62LBU4be
	OdZoth4vCZ1yMmNxCBPGN7Hrn5VP8/MqDxrc=
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b1b0ba53d2mr13944527a91.31.1794891027347;
        Mon, 16 Nov 2026 20:50:27 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd06666sm1989515a91.5.2026.11.16.20.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 20:50:26 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 04:50:26 +0000
Message-Id: <DMX7RM93TMGR.AXFN4YJ55REF@gmail.com>
Cc: <netdev@vger.kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 <bpf@vger.kernel.org>, "Jiri Pirko" <jiri@resnulli.us>, "Victor Nogueira"
 <victor@mojatatu.com>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH net-next v4 4/4] bpf: drop the stale dst when
 redirecting to an explicit nexthop
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>
In-Reply-To: <CAM0EoMk10vCoAKZq0P=8A_jed=Z3SudLEUV8uvXO5F=ewNjnGQ@mail.gmail.com>
References: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com> <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com> <DMWXH28YQDYH.1SI4Y5WQ7EPSR@gmail.com> <CAM0EoMk10vCoAKZq0P=8A_jed=Z3SudLEUV8uvXO5F=ewNjnGQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 02:06 PM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> encap ip/ip6 or encap xfrm template the tunnel template lives in
> dst->lwtstate  that wont work (packet reaches the tunnel or xfrm
> device with no encapsulation).

ok. agree.

> For that reason we cant drop 3 and 4. I see the change in 2/4 (I see
> 1/4 not changing either) .  The change is not that small because it
> will have to touch multiple core files (although just small mechanical
> surgeries). Summary it will still be 4 patches..

can we keep the route and fix neigh_update_process_arp_queue() instead ?
The bug is its lookup via dst. Only teql needs that lookup, I think.
A is the device of the route, B is the target of the redirect:

  skb is queued by        skb->dev  neigh->dev  lookup via dst gives
  ----------------------  --------  ----------  --------------------
  ip_finish_output2()     A         A           the same neigh
  bpf_redirect_neigh(nh)  B         B           neigh on A, the bug
  nft fwd                 B         B           neigh on A, the bug
  __teql_resolve()        master    slave       neigh on master

The diff skips the lookup when skb->dev is neigh->dev.
lwtstate, NBMA tunnels, realm and ICMP errors work as today.
The fast path doesn't change. No need for patches 2, 3 and 4.
and 1/4 is not a prerequisite.

Your teql 3/3 queues the skb with skb->dev == slave. With this diff
the neigh of the slave adds the header and sends the skb.

thoughts?

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index d6e9c7c..04758ca 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -1331,9 +1331,11 @@ static void neigh_update_process_arp_queue(struct neighbour *neigh)
 		 * the packet in the output path.  So what we need to do
 		 * here is re-lookup the top-level neigh in the path so
 		 * we can reinject the packet there.
+		 * When skb->dev is neigh->dev 'neigh' is the top-level one.
+		 * dst can be a route via another device after a redirect.
 		 */
 		n2 = NULL;
-		if (dst &&
+		if (dst && skb->dev != neigh->dev &&
 		    READ_ONCE(dst->obsolete) != DST_OBSOLETE_DEAD) {
 			n2 = dst_neigh_lookup_skb(dst, skb);
 			if (n2)
