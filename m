Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785806;
	b=aYiE7I+IAm4awGFRD+E3ItC7yOpW0astoujU++fd6gAQfh2JSTRndUQL2tZunooIwiEP
	 692kUGP6TyqEE0CMejSC8ohURp/Il5RIYrZ4CugZbYnaJQrIh9Lzbl8YtOtCc57Opf3GL
	 Ix2Jmsu11HKd4Xf4VqJ9a59mZcMoipp/Nu9+9tjHN+WuIa8kYQXGXaI2vz7vWoMJqA5lV
	 Jdff9K2VnFzjFG+4sBNd1M4n+k44/m7KMvOtHG4iP4l6v3AXMQYCV1C4qB4lQYYvwU7vl
	 S+H7QJNODrsodY+1ju/rlQA1Q3hFSV2h7M0WmaSqXw7B7Y1VWJnXGxt/e8X/XPI9+gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
	b=PkPb5VrTxbXBPhBd0flAOyioIcbosjTkCZN7tXAMO/VRGxwA9HYzOqICki/HUxZWPVnd
	 mRlZzOvHZ5JYjCGrsiq1/tRIUWnvh08TivA3MqXIOVr/GT5VtpPTOzf799tTbT5UTVeD9
	 mjuKpFKBBZ0DAVJ+JZRAvOz0PCLywFEiZ7PMBq7ZUAwnSf8IKDw9is0+v167phX1xtWox
	 j+qFG13X0all19dd8w+ClWeyfoE2GMdZW1U4xhmzsc+UgPAnjBbOZWuYFwom5KFqqvS6R
	 bpl+kxxIZ+VAw0Oe9vMV82yI+crxy5+R5XrOgZyhEBsH8Aqg/F8y2jSIL/I9mdHrFrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zmpxi2jL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BBE606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74BBE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zmpxi2jL
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71af0656bedso221751eaf.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785805; cv=none;
        d=google.com; s=arc-20260327;
        b=cEd+2hyIX1Ai4RkLJdbSt4iyMICBxA5YQsK+epQ/LCg8kEnKN4rJ8G/POmWlb+NfN1
         i31zDaKsyxv6if+4iE26WgveEmy5OFwfkRzsZEx8XJqBjvmouCK+5I6MHNK/6C3gdtJ1
         dS4gsjJq+9sXuKAXSGqiadLvtCB/keiw1pEK9SP0eE2QJg/oaT/PyRG6G87abhRKgNbR
         8mMR7brM/uqE2x9NBS33AdHvBvlzhY+JYRLwU/wneEEqcTJeF7d5EecWSZji5IT5CpPb
         v94HToO97kfsex2REg5zRpbo6r2J8Oogg9p8IVXCslmkZPp90V6RIUaj1N6FBDHnl8IX
         OfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        fh=ChG7P4mOECWOinYcoAPEB7DEIkibiwLJ8IPDI7MZyMU=;
        b=XQLPPL/HMOwdwZnFtMEW9PoaQ6z5BUsa6iut6oWUZ5f7O9pdWV4B09r+c8N033KDp+
         HrYvQ9WPsnAMnwRQ+R6zc9e85blzNNWldes5Pv7TmxOm8X7ZEuZZLBO7PWotv4oky6Wt
         xq/vJqPzvufhH9sNQy74oKKj0KhIfDpJMnqUa0U5ey/ur0j/1lWuX3H9DZf4CBiWqcW0
         xflkWDm/fXS+BNw7vPRuP6hUHx72Dvcgg6hG2AQetymMja67vzh+UpcSj2EP/WgPRDOb
         LEQK9zzweOaJsRN5AY6Y9e/MbZASzp1ze6JMy017krp77p76OlNvMr3nRwdMBXvifyn4
         l59A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794785805; x=1795390605; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=Zmpxi2jLhXSm+xCyJlTdzyhYrYxOhwtwnZiPPOViT6SmtKy4Igqbe58in1dXdljPa5
         odULis3BU8aEvIzMrkCPSOWvtShZW07qQQKGRG/uCEK40LNJvS9VS1MHC+1cK5cE+88x
         Wkakd87wbsOKtHD+85cG9Y8BDYm21VJUwuormhJMhBg6ms6ZqxN7bKewkahZAArP4k5U
         4iyaONp5TNg1pYjLWDT0L0NCPwogNvCbKN8doTyDHkmy/1O8TDtKGuMR+ZhV1GvB4GjX
         YNF9M/z+z1n0JUvO57uhcw7KQgxPFjtEqMAGWnxKoh3OFvh6kp8Z0a12mv3XIxy+drs8
         59Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785805; x=1795390605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=ugAUsxZYrzS0ksHOfCHjyArAc+z8LsWk/80zXjlSh/QX2+yehkde5xAsHgz0C/oNJ8
         25TWedZfBCXa/Kn1UJ4JHK+P6hpdoPh6GTe4Ch9HxM0OKgS+khxx3EtIF5W4/UkZ/nav
         o3KEtwu+DQotF5ACPgz3s1FwYMYCNqPrcD3zgo8FOn/a7ZosKWXpPtDaZwi1e8Lea6Od
         TV4tmn86IpXf+9SeuNsTvG1TbzIUDdBeOjGqXuJAjRNUo77BTrFyO0dL3OfKA/ZfLHyv
         uek83E+MZJvOVBfgMK3+/ZSkIUWHBT+IAch9pj03/spHpwTdiA8JGKK7twY5q4hui6Dt
         g1mw==
X-Forwarded-Encrypted: i=1; AL+hErGffhHPPIubHmIypzi5VeDmwXQlYFCAxo+YRvYsm5Ow4tSj/R+0CUPFowqMq/S8XqDogIRvwRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vq1I1r5PJ6rD8xPlgERIdo0/BTXHUZVopP//qo6qXksMGNwzk
	Wf5ttPyl2To74S/6+whOLSh2DigjeAK+8kQNW6MtgZWf1WIH1I6X/IRHf7Sp2WlLP2jZQjrueoq
	OSQ1XCosPXkgjlysDNpFsoEKa0yuZt1WgzzkwvVhksg==
X-Gm-Gg: AYBFou1QwK+0y6pWtecf/9bYag4nxeDWCfjn3i1yH8UQFc0jmVVk+Ukx0aaqkBTTRbY
	35d1NtHqm22t8QZpEcJbEuUklMPVH9GUsx3wAyrCXzDziyiAK3dif6Ijq/FERWyTny2uxjz5YIN
	5JQJzP3eDaREIAYLgGxZinbhojAOF6gzes/rN3ktMsdWaZNuYGZ3H1+8bHPS+TTYWl3WOJsCKqO
	bkZsp/EYDuLrfH8cPt/7MQXRto6K9nTOP6k0grV0PkFe5wNhwKd5+PQ2VinoK4QFpvDcxcU0F94
	W1XkOVznTtJE/dz0WZtRpyu3sVO0RAw+MQkZwZkmRN/fiAtZN3+ICP7hH6SLaLkr/cS6L90i0z2
	yxGbSVXOpiTWyO92L+9m0diZiN+7YaT/UA6X2G6nPrE27henhKV45QGxcVtE5FwCeW73GqKsPad
	Yi0yaeiC2cr0/rRxpWm2lgyaxrFw7+VyY=
X-Received: by 2002:a05:6820:3411:20b0:71a:f794:49af with SMTP id
 006d021491bc7-71af7944afamr223598eaf.56.1794785805311; Sun, 15 Nov 2026
 15:36:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <20261115113902.4834dda6@kernel.org>
In-Reply-To: <20261115113902.4834dda6@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 23:36:34 +0000
X-Gm-Features: AclHuK-Ta2Fkr4hOVhZX_y8Xr7mXxa9_sbD5R_U1pL1RP64y3ME0zGRwgXOH1aQ
Message-ID: <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 11:39:02 -0800 Jakub Kicinski wrote:
> On Wed, 11 Nov 2026 01:07:46 +0000 Tianyi Gao wrote:
> > - On veth, an XDP program removes software GSO from the peer, limits
> >   its MTU, and can copy skbs from the peer.
>
> Could you remind us why you XDP_REDIRECT xdp_frames to the veth
> if you end up allocating the skb on the veth, anyway?
>
> I thought that was to let veth run its own prog before skb is allocated
> but you're saying that you want to avoid veth having a prog, so clearly
> it's not that.

Thank you for your comment!

XDP_REDIRECT into a veth without a program on it has been supported
since commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog
before xmit of XDP frame"). There is demand for it [1].

With or without a program on the veth, and on cpumap, this series
keeps the RX metadata from the NIC until the skb is built.

[1] https://lore.kernel.org/all/20210416175929.35c3c389@carbon/

Thanks,
Tianyi
