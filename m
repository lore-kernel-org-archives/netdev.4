Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795262283;
	b=5gu65/m0Upz+Nso+YzBTcxkTUAw/cp4OC569wE6qVSPRwLZ4x/ggYONuKzfu5ku420S/
	 qWhU+9zYIHyJpNNWTv8fMd1TV8V1iPhbS3AEdwDgBNoSd+Z/JfAjp4e7Fy35Fe4LkLpKU
	 ss5tVojycGTvM7RRIKtJh0/XzH0qBaFwWi5HHk6x/+f9h0BEH2of+jU1n9dOKePHP90hs
	 IgX9DKYRDlWv+NFtUnmoyyYf4gT4t9ONFYCl91dGNxJEn/LEUO6APY0iO2XUfZ2Y+Vkm2
	 jqVXKAzNQ5ra3ZKG2OFdVre4L/GGf0yl6eG5yIl48PCF7SUvhpoFIuttvKxo70xyC9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
	b=LLqcCDGahzmnWdp4QEKldibTw5JQhoU68So5iv6UkIkZA1WVhZec2bk0OqRvKEJd1wIb
	 MJLYY8ZhYQPmEkowBSpXAvJt/JyT0lYf+jgj2tRmscV/GNu1bpL6UxgnwSzvxXrvc742L
	 /+SdS2iISKaWwJm4Exfciw13d6vtSJ6nbd4HKAyD8ONKIyk2FbGPYuO+bzWXMAJDjuk+4
	 Cx/RCn2Dy8M+KB7CWZcO8mRHDjk1sEzLsJ3tGpqx+R/2ZWXmsz+hhwcjDlwf/59og2TwC
	 2QZVT82LBIXFcDjyN0rKBr5c1p4oTqMt7sC7AYHofL8w8aUkwmA2FwjR/D3M7Ct3hDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=tGuwzQ0L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B7606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=tGuwzQ0L
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so100215b3a.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:58:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795262282; cv=none;
        d=google.com; s=arc-20260327;
        b=sSNsjNYUpRtri5h0lRCfVEtX5vKOov4LNZP958eqDOeYIMVfM4lnQ5b6jtT1uyLazz
         0KMbWj+4oPr3vG+23uq3BhcsLx80m98wq0Sn8gN7n6V2FnDfFsWr2B2lPbnshlof7rGi
         GHU9HDOP6WimDS8jqyG5I8CkcW0s0XnFt7lSFQDHL8Z+PddzmgH82rwQm+Atyz+aGzAe
         YqSjGLIFTkz9TGiB0wTkZ7p3iVP6o2wT6BqrBx8Wt9+S+iX+z72jDRxOKA3q0LVoD/Xw
         MPkaFg92p0SIUSmr/61RBjSqd6PZzvJ6FFhKxXqBCdmWAZh8ATGuDZeKoYayFkPbbG2H
         n1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
        fh=AmIJ+cU4EGVEp9uSS6T3mpCHfUIE0Z+MVX6ANyZoyEc=;
        b=Sr5UDirLIrpmfHQhIVXGklbaGs5w+z9AcsISGfl4wo61qmpkErXoZqBQbhNr8hM9ce
         0hK8EfFsM9cz5ZKT4pkTPvqrcXhlaDCzntspgAxZcMKkqkJIjUcrIha/h6HrMSyEpts5
         ySmUx+kPIPCHna5T8juCGbksia6og3PxfRZy7u2H3q2QSAwFYDUqAUWr0FhC7T4zaPrb
         JqM+R5vC3xp+wFIgVFONzovy0tJlDSer5ljis/4LSlSuLrHyOYJHWIhmsNQMKRyxHrTE
         FFBeFCEay25IQo3Cbwv1O7CshD0PvUDMysj1y7dVycUS9YX6dLjMJPQqjRE1x2C7PQH/
         /+DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795262282; x=1795867082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
        b=tGuwzQ0LPZl1oA7DlU0y5cfAR3if15FhKZcT67HBYIgCFujoCtXIBXnTWc0K/OKoXI
         dxTHlJwRNwT0H8wTkjnUo6QjsV8k8Ue9qN9DTfnhxHLbt1R4+4lVCyqkpok0V0/zl+h4
         QKkDsPstBbd8/Fw50OiiRtymEzae8Ti4Cw50Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262282; x=1795867082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oeoFimhtJH2hxh44JdtBw3TK3noQY8/rbKIHHAErn4=;
        b=Yc9yosLD9MZNfeqE/IpXue5r+Q8jtEOJmCtS6ca+QFfddDnKvtfhAG0SXPCusQenfE
         /R+me0y90Moi9d79ILrLIz96SHFBHqKx6UphF7bL1ZvxXExYtflFEEM3BAEyyzlrO2P8
         CENzhlbxiqd8eenj+XtBBpfgVfjp89qWUH90aq091z2XCg74gHIvue3vjQCUy5mNEMns
         8jH2BOC04K7F9RzB6aS+RUbUWAnrv4+8FdItIN2ceNTXr5Dwqh4vJUCamP3NkzsMjv+V
         ncCkL9DLuuzTRuim9KP3JswdnCPFhoicMRAV892RkcE4lsH4miMpPF6UHsdELlSzA+zZ
         MFQQ==
X-Gm-Message-State: APuU4Z/lZOUnJUZOl+IIm/ECSIwfi+1c71MaOIqVUeEpjipiOtsf0JuW
	BogBHmNA17tPuJYjHyQVPieAooynSubnJ4WTONmOHf5wl6ONmiAYHHF/NXTS3KJULsb81dm7PUw
	pmCbo2G6vmuZi4Q9Pz0x4FTTAs3zkzgfp6ilEAqyw
X-Gm-Gg: AZFdTZdpF6vMihcULmh3mvdLHjr37hRPyygnC9caat2reuBnGGVu1492T61LGWnCaSn
	JL+/og4aPoDuJ72Yn4jzJZLbi3W41MQ/HUZfPk7VK9R4/jXqDB+kj55uHzMMiS7IDGAf/WQeVr1
	TBZg6aOK/Dx580BMomP0d8IG4kV4iHXKR8h3W11HKXo4KyheCjGbJGnT/g2QmprenDcYgKL76Bw
	6RCHWIItN5zD95FzkDixd9GR9sxONmgFEbF3t+mHi3/zzjH88WvK7qjqzWsMlUSWHPApwYQlzNN
	SSWKlMzfErUSjEZMk4ku+hAywx7TRT0E7uI9k+I3oDTmoa1T+WlTe9n2XGYBPC0oXfcmy53GHbb
	Ph69kyTNpb28g58JHpnIXCf9JlAvJ9fH1T6Rfs9ZIwiUncWaYfqdSZY5oJFPCwz8EJWVkR7We1Z
	eq3L4CZLwRY1BJWdcwpGQg
X-Received: by 2002:a05:6a00:928c:b0:8a0:20e0:b131 with SMTP id
 d2e1a72fcca58-8c87bac50eamr5921526b3a.19.1795262282219; Sat, 21 Nov 2026
 03:58:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com> <DN09YRKU82D1.1QHV2CIFW2C6H@gmail.com>
In-Reply-To: <DN09YRKU82D1.1QHV2CIFW2C6H@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 21 Nov 2026 06:57:50 -0500
X-Gm-Features: Aa3M54qnMKfTBVbIV7vSbL5S723ov1v1Vl5x3Mva5Jl0ckcThjBjDhbh4ZxcYw0
Message-ID: <CAM0EoM=Panth86S2_RcG6Pt8WA-nyR=1P7GDM0sPsPrOrwjyeQ@mail.gmail.com>
Subject: Re: [PATCH net] net: xfrm: interface: restore dst_orig on every xfrm interface
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Eyal Birger <eyal.birger@gmail.com>, ipsec@lists.linux.dev, bpf@vger.kernel.org, 
	stable@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:11=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Nov 20, 2026 at 06:08 AM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > with skb_dst_drop() before the route is installed. The helper allocates=
 a
> > metadata dst per skb instead of a per-cpu one, so the route it records
> > belongs to that skb and is released with it; the per-cpu allocation is =
no
> > longer used and goes away.
>
> kmalloc per packet should be ok here. xfrm_bundle_create() allocates a ds=
t
> per packet already.
> It also fixes the route leak, the double put and the if_id mixup
> that Hanxiang reported on Oct 29.
>

I wasnt aware of Hanxiang report - so i went looking. If no issues
found the final merge will catch what you prescribed below. I am going
to track Hanxiang's bpf_skb_set_tunnel_key() note as a
separate/followup net-next item unless somebody else wants it (in
which case i will remove it from my list)

cheers,
jamal
> Reported-by: Hanxiang Xu <xuhx@hust.edu.cn>
> Closes: https://lore.kernel.org/bpf/48129353.1960c.1a1859496bc.Coremail.x=
uhx@hust.edu.cn/
> Acked-by: Alexei Starovoitov <ast@kernel.org>
