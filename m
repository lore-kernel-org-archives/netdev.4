Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795260931;
	b=nwUkXzrDwzfub24IEPpgdnomFLScD9P+DOV/Duu8Ai7XOsEmRMhnL162mUdwPGrXmFc7
	 rScEZEbznNTVPnFA2SwVK3Fxzn3CkhGfo7JjXyPJDcmOToQlardFykAqq1HDCOfH4a8VV
	 d8QzoRzuxl+DHGcBMc4ERi4ATMqukxUbiOz+aUAI9hKISUvs4dqSU/LQcOaw+Y1IcYXFe
	 Xgb7MBhujTmlDn3emCPl2kRwbU1Vw/DYFkJH5y7LrsZY9V/jjaQ81JPuQlTERTVSux1Hs
	 fzMp1cDw2X8Ls4lGhvzOZ8XHrsai1bSqH7+anU75tuni5ZOeYzOsBkY33qUlvDoGKZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PFg+qpMqWg6ZdZREgqR6rxXhJfQ64SZVwcKwbvaP2cs=;
	b=3IbAQ6KOjthX0bsld712/D52Nm96wmIY5py54ZK0sazvWD+FZCtwxHmF8t8hCZae2MFf
	 MgXnQiyX5TpZL+An2jWx6sEKeuUnCVYoCf27UetuozS+O+heQg2C04xSNaErq5pi06jzQ
	 SP5du5IzB4hZAcCc5aNIKjHtkxaobMAuk2JQ6paJLSRyFGawpfCZ/XU355OSOBonFvPiu
	 06f9HVuQ/wjvQrBsfQ3BHHATmOwyU+XXoRQl+VSFKfo2m/Cr9O8dKBEKqhf7L1riBnFFj
	 hwDp0dDUsqPvDkHDc9NU+I3FvueaHQiNG8KB6JuIZGIFZFUMkxVIpipN+putTJM9LZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=iIHzRdBI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE0D606A325
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE0D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=iIHzRdBI
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b271e573adso820653b3a.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795260929; cv=none;
        d=google.com; s=arc-20260327;
        b=mEevbfnoxJ+9d0NxPC55LFFbvyFBpBLl/h1b8VblNxRlKa/fjQxiHRbaCIZQN/P7z9
         CMNE4K593IwlkaVwQYsuLWKX32m85+gf42YnFNts7Op4VuZzMSu7jlYQw2T9tJJ5u81S
         E4nU08weauT/uhQq2cZS39D+Oskklw71wBwFPIHbZNkZZYLCEXlKav3TAPxyx7yr7hw1
         +xa+10zzXnKUNyoRMM64yIk6GpdTvG1FJE/MDxoP4XoZpC0xteMCJZi1U9EaD9d+X3fW
         aMZK3WuadOm8eLG0wSPNAZXIcIc3rD0hDmjGb4cMQZjCuT5SK6m8MKs5SYP8TM+nbfvo
         652w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFg+qpMqWg6ZdZREgqR6rxXhJfQ64SZVwcKwbvaP2cs=;
        fh=RRj9K248yJOUnyFItYOGlX84FdXX0jZAYFgodBRDLcE=;
        b=hxu/SSAR9bf4GCOgIITIjSy7FEiACaQq1NWpkp6t5dkhO/TjtZFeLlVV0RMdeOriZc
         k7c5qh6NvFfsI3X29u1zDKuuW4oDgEtTiWnsRXpeznr9d+xXp/7zocsGBDYrphITFoBe
         goELUdZhKGf/O9HdY6fmo2PQnFTPpkIXHwkLfEA24FqdmZG7H4Q9pd+gCRix7uci28Sr
         QCnz0mWYQZr2oxggXULFWgd4zNBr0KkVs2lTzzoD65RuMFsK8tQrl6Y7YUYtkNLxXLM6
         KWdM08ksLn9BglUm8M9dZVjw+YsSQt2Ca5YdU4D3/gRPsbOmdGUF/2mF6mwztooQOBgL
         Mu8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795260929; x=1795865729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFg+qpMqWg6ZdZREgqR6rxXhJfQ64SZVwcKwbvaP2cs=;
        b=iIHzRdBIHTm9ReknsaiSijgujHBL8nI64ecVfCA/UvNAEHg0DVbqs3+HInuUOT7eg+
         JhefxyzWrEIZbeYJG1ZThQFYhdsZ6Yq2ZYaNdLaZFslSJNCHhJFcNL2tbaDPhIVhuGJk
         DaL4usxMpeCn1XEZeRE53VF1ZrQtTaWPRM/N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260929; x=1795865729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFg+qpMqWg6ZdZREgqR6rxXhJfQ64SZVwcKwbvaP2cs=;
        b=ntgEgN+ZLUQgR+7Zj2XpRJlenSnM77rmRWlCCAYRh/m9O4u0Km8WlCkOx0z7z3nWb5
         bdn9CB8b8VY5vo8DAZhWSsiAVgA3XABDUBluXgBrcFXo4NKik5kXqSc6dO8CbIUhCoGR
         MCnpTIMujpMoLs8+s5MPwCTYnBl01R0/6aDX27rT1QFQrN3liVeLjnhPYvPqTAyVSOED
         7HnAQaZ016Rf51B4ZVCa6P+LnqyfblzscHKrkowcxRjwknHgnRCgXTNlKhYEaz/VczXj
         sW/GiYkEN7DvcaVJEXdvZEHSz3m0u6ezCpjB7G8UHSceCVl7C3ae6Rr1i+HvZPgpRMii
         Cu9g==
X-Gm-Message-State: APuU4Z9cU/qGM8lrosFRBUywdxGOYd1aC9SOUoiwcsHcB3JnxyC7prUZ
	6FDIE5lDIXcSpLx7f6L1Cw5e6hxyc7uGcHmwtzaomEqmGe9FiLvUd6bEZ9aL2M7B3CNSKljb2Ry
	YkyRvxqXPG438goE0YuPLLbz2jISqDbefZGz7wDXx
X-Gm-Gg: AZFdTZfvD605n0Yb1wu6Go68h03++VPalGHNe0MDH+fJKw1lQTdv4a4JEpqLhJVlEAr
	YWbtXkXG19lqnMR9m14zlJ0BRQ2/JjJ5Nw2shKJqTp2qOkrn7sFl9mge8qDaUUy18hUq+dEpRVK
	idmmfKsNWrEnaBdKK6LKz3KHsA9AB/jpNkehw3YDu1KeQl7nzD1hblHASCZ+ieKpvdrA+k02D6c
	lOXDW1v4VAJRbOpL6yQrgdWp7eJya8yU9iXUrR2W6KqPTk9D3MBk9L2NvyucCXa14kYNrvVOJBZ
	3S4RMxKzYHg9PlZTu2ai7cirGxIbrPEjJvLEOsE3HSGtFvmqDikWVysDzlredYJuEfj+DsjmJWK
	xgOJhO0vB04sWOydaB7mtT1WmLbFhFmE+ADBsFnZIM/p+HbMGnsbLAmGlWK3XRyRhTJB0i5OO13
	vbmJ1De4RoQErzQNUkpy6Z
X-Received: by 2002:a05:6a20:748f:b0:3e2:1218:3ea8 with SMTP id
 adf61e73a8af0-4014b564283mr6992874637.14.1795260929405; Sat, 21 Nov 2026
 03:35:29 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-J9UK.v1.r0.20261120103344@mojatatu.com> <CORE-J9UK.v1.r0.20261120103344-1@mojatatu.com>
 <DN09UU4NHKLV.29WR92GGDPBP5@gmail.com>
In-Reply-To: <DN09UU4NHKLV.29WR92GGDPBP5@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 21 Nov 2026 06:35:18 -0500
X-Gm-Features: Aa3M54pLSmB9e1t62DD22qXWW6Wd6hUo92Znhze0v7AddURdYqDarYPQPAr6_T0
Message-ID: <CAM0EoMmYSkXjvpw_rGi_4Y49jnHXV0FSuc112zs4MSm2SgPxFA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/1] net: neighbour: skip the stale dst lookup
 for a redirected skb
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, bpf@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:06=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Nov 20, 2026 at 07:42 AM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > Skip the lookup when skb->dev is already neigh->dev; the parking neighb=
our
> > is the top-level one in that case and can reinject the packet itself. A
> > dst that is a route via another device, which is the sch_teql shape, st=
ill
> > takes the lookup.
>
> It doesn't. The check never reads dst->dev:
>
>         if (dst && skb->dev !=3D neigh->dev &&
>
> In the repro dst->dev is va, skb->dev and neigh->dev are vb.
> The lookup is skipped. teql takes it, because skb->dev is the master.
>
> That ends with 3/3 of your teql series:
> https://lore.kernel.org/bpf/QDISC-6HS9.v6.r0.20261119070330@mojatatu.com/
> Then 2/3 of it and the lookup itself can go. It can be a follow up.

IIUC, that is the plan i.e a followup (not a respin of the series). To
be precise:

- v6 is on the list as 1/3, 2/3, 3/3. 2/3 has to stay in it: without
the restore, 3/3 parks the skb naming the slave and the drain sends it
out the slave through neigh_direct_output() with no link header.
- 3/3 carries Cc: stable, and stable trees will never have this guard,
so 2/3 has to travel with it there.

Once your guard and 3/3 are both in the tree I will send the follow-up:
drop 2/3's three lines and the dst/n2 re-lookup, and back the "dead
branch" claim with a runtime check (kprobe should be sufficient)

Thanks for the ack.

cheers,
jamal

> Acked-by: Alexei Starovoitov <ast@kernel.org>
