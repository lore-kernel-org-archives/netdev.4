Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795212907;
	b=oZWU7NDjhXIoVM67ECC8+X3oqJpRPFIrJ+hfCK6JCdGBRQwjh6Es7g9lee6XNOWMDRKY
	 nFrsdMBDmtza+gtLvurPk8feFX0fZqN7G43XyLUsLEbBBF0Z4Bx9FqV8ajPfuKISuEvcs
	 Oyqit5KD9vmZ1m3Y4dg3WJvmvmWjqYLPDe7IGyWimlSLjWKRjH9ok7Iaxu7H9K70zfyOG
	 A3L1Al3ncDz2f/X8XBiomXhgf8gT237JGHp22aiyWNS1Op4xw0G8kxfyEZrzI3lN++BXG
	 AxkaFuQ7/QwYvU20NS1WmswWQkVkCqJ5ivJR4j+oRQ3bqWcCsM5x7S80MU6Ja4fw13Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
	b=gUF5Lu03fKboYInzsPhjx7xMq8Nkf3lGLqbXv+99PQL1A15oLMxlpNhZ1Y9BcLMunBk8
	 q2uuJ6RNxPFcd136kjwYH01s63e1+NDTLvSrv/duCr8XK1wIy1hU4qMD0x0ohD2olEplt
	 XVqhYXBcA0dSSubHWp16v0ocv0qPdJormoZDcYoTk8wNZGeUqbFj7Xfybgiax6Ta5/GEA
	 KZOJ9ctnaljSYgAtyB6//sKvKmEQO8Z/ekigJLvF622khkZxqx70pXPzfixZIObOVr0+b
	 FRUZQsrv0oI1DWt6bgWy4oan+bcsTql916jI/16xFG4GaHLJt1hxe6kxJq9wRAh2CQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3SOdlg4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC24E606A699
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC24E606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3SOdlg4
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f13so1084887eaf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:15:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795212902; cv=none;
        d=google.com; s=arc-20260327;
        b=sQmtRtZHtBq+QjpVsCMtU4aAsNdtMrQAwIuFIF7jlYurqjDziPzxG6+M/37f8MbjyQ
         FWEjW8D4fG7VBRkgUyZRYGe+sLLU3KIOrfg+exWVjUBeFNFHEtzCHregVMXXDHqxEz86
         L5WAli/qrg6PloCjsWqDIv388OWiqWps/glfK0AmATWbecpB5b2A9gViXGHbY1kxdoVt
         wCeU86uIwwnkcxBV8biSg7OYEtrkp2Djn+hwpSaniXaox7fwmb9THr0iwJ8k90Kngbgm
         5FCF0N1ZFtS+3oGLoDJIXlNiGEEI+LDFswt6ovBp+pYApFxi+n+v63KMXjbCX2KV+UTi
         azug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
        fh=Oh5IhsrQ53anB/yL9QQ01jtuX8niojyIzwni9+Lg3gw=;
        b=BJvHAYOCR+LHSwVdCqgw1P8jeUQlhQcVaYpmwYhTmb67+Inny4wewc7BdUbkHXvF4W
         pIIyddgjzcLoATBsbXgqcQtuQ/eQbbiGAITnEZMud4kDc/gXb6KJoCJ37JvQd7lsWYEG
         5x6DGebvjqzWtZRmbyNP5JgFHmte83yOMqqWA4klWDdQaP7Lm6TZ29mmj9lnHSrGMTBX
         igTop725tGtBAqkjxyxc2wGuK97BGXCWqFIbTt7akuAtFdlwcNkd5DarIL6jZbpG5Yh8
         H57b0f03y2B6PLq3sDmwa0vBDxdaTp85jwuFTb2/1p+HCLZYblCNsjKLiLcLSOftY/q3
         Ds4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212902; x=1795817702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
        b=l3SOdlg42qbKIlI9+Ac4MBHXRldrvquCDkj/z4faFkQvuVq4q6ueXT7hGjf1x2DZ6J
         xr0kGpYWy6XzLMIYfaRXYEt32hzwIUIh5GcDjS5qMo+NTm/W2h4QLrWT0vjrrNJqAY/V
         DaHg/hTmuXLf/SbZgeXG7LYeRhLX6xEIsHTO6045XjdtPDKJm9dClJoHuo7IikmLqZyI
         LHip8V4qxMZCOM5nMYFwgXFSqKhOQGq15asHuhcCUR+1HQYSdRVD1FRKEvvrmiwEApWn
         r/Lj6QL4JWoSFYjlCjmkEgRPT9oWf0bS7UiyNNPJvMB1PL+uXio1JWvcqawJCFSR4NEc
         ME/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212902; x=1795817702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8E5/bKsqcml1NiDKuxtkXF2hepTan04xWFr5FhLnOc=;
        b=IHGnj5/YJ2MdiL5izchNygXyGJaYop3BoADssyqtmykAv+EOaa3iPx0NuKkEiaNf7S
         54FEbvy5J/jsilpLHiiF2oHEog1hvfmFiYs2nIAsi2wqAc3TDxf+1QL4dwe5yLr02a8y
         n0dAx+zfCMh+8OSsIXKg++LRAE8pg9yq1WyqZQvnvI+TJ8QhoLmd2deIsHlIHWz+sZoD
         1LTRQLoaE+Xs4U46AJSjgRTSzOAsA7odsWgVxK/tcuNcg8t0fyU4BAJMrH90Lulmxwmz
         5XgcFv+D0USM7YYm5B8ggvadZpeyudWXPh01xjq5DryG14AFr9ShVk7Rz0FbNidAhf08
         encA==
X-Gm-Message-State: APuU4Z+i8YgdCCo2GHQtlx8HmzHtrm+Ap3Im9vh4qXjRkmVtuIi6VirC
	ENoUl/X8K8D2UzTmgYBN582icwRQEw8QhN5Tk2y+gwQi6kkNAQM1roSg/9CSbINmsYtRdSnKqqJ
	jvLj2OHV/xtWfDxd8xxzRjTsPzb6Q/B0=
X-Gm-Gg: AYBFou2IyU6AmtaZhq7PGkHE6QyU7bCjFJZhVuMU1HtbcZCary6fRNECq2WVUizkK3s
	Pj+sfS6t1rtncZavta8XAFYfCRU9+csfwOSu86kaTwiGdYxepWDf6XfL64yXb6hJRegqLl8PYPa
	qBps1fZUUw5aXKNhImorRs9KZ9Dfr+Q0TtahmGGQr9UHltOrLw7i05yicEsYBAvSO/Vlm7NI/hw
	f5EeAZXNHxxxiU/cfGX99XwbwdcCkkIvkxIwNPADlO8HRZfyx0OVm4/YH6xEe5SZhhEBXdGG4r0
	vJWF2cGm2Z+Yq2nhPiMJVTwpGV5HhAUkq/39RYkaoZxs6bS2iwCBSb7DpWWukdlKrtIvdhs1E/Q
	bamPzG1r/g1x06Cs0qukUpA296kVg9uuGEA0K
X-Received: by 2002:a05:6820:4615:b0:6f8:8385:52a with SMTP id
 006d021491bc7-71b395ac078mr3579653eaf.58.1795212902477; Fri, 20 Nov 2026
 14:15:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
In-Reply-To: <CORE-5IQX.v1.r0.20261120050801-1@mojatatu.com>
From: Eyal Birger <eyal.birger@gmail.com>
Date: Fri, 20 Nov 2026 14:14:24 -0800
X-Gm-Features: Aa3M54rA3AVclKtpTsDBdZrwTvIcM9OP1ypUCaxAnAe_aZyVGm-fhga0xkyXQgY
Message-ID: <CAHsH6Gt7RkR1kKXQaQUdz-_8VYXfW7NcwPxNtzwaHtBYWgRuqA@mail.gmail.com>
Subject: Re: [PATCH net] net: xfrm: interface: restore dst_orig on every xfrm interface
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, ipsec@lists.linux.dev, 
	bpf@vger.kernel.org, stable@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 20, 2026 at 6:09=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> Found while auditing the xfrm metadata consumers of a steered packet. One
> of them is an xfrm interface, which restores the original route before th=
e
> xfrm lookup; the swap warned on the metadata dst still installed in the
> skb, and only the collect_md arm restored the route at all.
>
> The issue:
> An xfrm interface takes the if_id and the underlying device either from i=
ts
> configuration or, in collect_md mode, from the xfrm metadata on the skb.
> When that metadata also carries the route the packet arrived through,
> xfrmi_xmit2() puts the route back on the skb, because the xfrm lookup tak=
es
> the address family from it. skb_dst_set() expects the dst slot to be empt=
y
> for a reference counted dst and warns when it is not, so the route landed
> over a metadata dst that was still there; a kernel built with
> CONFIG_DEBUG_NET=3Dy panics on the first packet that takes this path when
> panic_on_warn is set.
>
> Two more defects sit in the same place. An interface with a configured
> if_id never restores the route: it takes the metadata dst as it is, whose
> address family is AF_UNSPEC, so the lookup finds no policy and the packet
> is dropped as a link failure instead of being transformed. And the restor=
e
> moved the route out of the metadata dst, which a clone of the skb shares,
> so the clone that reached the interface first left the original packet wi=
th
> nothing to restore.
>
> The same slot overwrite is in the unstable helper a tc-bpf program uses t=
o
> attach that metadata: bpf_skb_set_xfrm_info() records the route as dst_or=
ig
> and installs a per-cpu metadata dst over it. The per-cpu dst is shared by
> every invocation of the program, so the restore cannot keep anything in i=
t.
>
> The Fix:
> Restore dst_orig in both arms of xfrmi_xmit2(), taking a reference with
> dst_clone() so the metadata dst keeps its own, and empty the counted slot
> with skb_dst_drop() before the route is installed. The helper allocates a
> metadata dst per skb instead of a per-cpu one, so the route it records
> belongs to that skb and is released with it; the per-cpu allocation is no
> longer used and goes away.
>
> Conditions to recreate the bug:
> A tc-bpf program that records the route as dst_orig with
> bpf_skb_set_xfrm_info() is self-contained: the overwrite is in the helper=
,
> so the first packet that calls it panics inside bpf_skb_set_xfrm_info() o=
n
> a CONFIG_DEBUG_NET=3Dy build with panic_on_warn=3D1.
>
> An interface with a configured if_id shows its own defect without any
> other patch: it drops the packet as a link failure without consulting the
> outbound policy. And a clone made after the metadata was attached consume=
s
> the route before the original packet arrives.

Thank you for the fix!

Reviewed-by: Eyal Birger <eyal.birger@gmail.com>
