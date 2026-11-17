Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913736;
	b=iHL1tsrKVdBqqPZXqdM8s0c02q1auVblWDiD21aCg+kQOracfbH/Ogj+06CVWs2ChSAW
	 gjeSvIZKkRa89PbbO/0FSm3Xukcg/FcIxPjrW5M7Mapm4TsnOuWe3KDIcRqoM95Xgvc5d
	 TsdwPCKcdNa5NSrGjiCB/g1no04FDar7SfRUrC2WDLAnkVOoFHUSm4t5ptJkLnkN2b2Jf
	 m929/PiclXRfE3qYGQugiUR0Bf0H7iNWes6z7F7GN7LwsZu9HhioUIlFZtcn4yII0hT5s
	 EF6hCvv8Mg7tcA52ih0fouDNOSe7Wna1XgGF/E75NGdxBykOD5QLYiULQDDsCgOqmgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ya3rh+b4RSSKfCrvN68HAjlZ1+sxuSEJGaff5SDgpnY=;
	b=TjNoCJIVVuY09jejT+lV+Bb3zTvFtCgapfEeHLE9nVlMtkLd2HS4DLs0CYQeDcCxLjvV
	 RRXS+bHx/dZNoputJKA94RwaySqKUzjxnn8O2L922Zp0f3yenrtgtgiymMBpsBXZ03mD1
	 HNdWdCNcg+ZxP895JdFk4oQ2FjYVaZImsjF/1P6w0L6ooKotSyd2OulOeXg6kOllKo/iK
	 LhD06pOQGQUFE55+ztzOlQaD/d17UyuYM5jzpV7ma364QtxijQfHCa4KPQ7/fAudunAZS
	 HeGYdK6MTU3DimxmqZ2b1o4bouJQm4h9y1NjVbKLhCYs4ITf2CYYJw8z7TAtkgu1/5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=JCzwZlRX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A50606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=JCzwZlRX
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a9f9473029so4173167b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913735; cv=none;
        d=google.com; s=arc-20260327;
        b=Mvb2dQYtgfxiXS5+h0QXOL6H5BRAjYY9824pyZbw2oFflW5targVCTKyZqGGhfwUWu
         kZHZ7wEwe1700rC8dTQXBg+Y7lqgqKAyWRXt+0p/UUAHchoDF9GHZ964iLalQ5uNnMAn
         KGuGXjHue6WbCbz/uZT6+a1JeDhSbQYWL6g25hBdgrn8bxvsg8RD2KEgGRpgTKkL+qyD
         70xsy6Ci4VDjJcz7PXcA+taX/bQNPpEulxF0bDE56cqUb8ANE1zeCBA5YY4rQ2Is2e3R
         kGuea/ihkQ8uF6KnMaIbAkqA02VGTg5/pi9arKUToc/I/q6TJjElOD3064XSVPVw8KaC
         vEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ya3rh+b4RSSKfCrvN68HAjlZ1+sxuSEJGaff5SDgpnY=;
        fh=iQfbA8shMtmnuAsAbOM31UzrOuPcsO9oeCt8Cf6c4g8=;
        b=BQtTuvzbY+3q/S8J+XZYbL9BpXlTUIdIF+vAxJr9sx1PSbWaYGfEoROiGB9J35Mna7
         1xDYNSfdnPAP59KkR676VW1cIg5FwmicYjQjODK7qC+0htm45lMOlrkOBP1c+G+91JSF
         sKHy+0nTefFFht/twIWPlJflt8SnmCN+cwQ51wVMQsdKR6tLFPgeIbeHBb7qvKRCM6AD
         k+erxMBWJ7aOaVwOv6ENkTy2VC6Kz2sOoV/eCo4dapHmoMJtK62KbC303lqW9VcC6sHi
         OjPjB1nc6SZmkFHjl0C9KhHWNtzadNJdyFsKOcZ1dcq31qLqxjFXuoRCxC16/HZwz8ET
         LYvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794913735; x=1795518535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ya3rh+b4RSSKfCrvN68HAjlZ1+sxuSEJGaff5SDgpnY=;
        b=JCzwZlRXovzNOQ79rRxvNbDaH/O1odsoaA0pVWlgcLBlX3LY1ZNuPm/TOJfhs4cqVT
         2H3jES4kEfbHr5JZrebBnnf9KpG2QLYN/uEXXXPtHq+WvPtkmlcGw71JWhZrOynK1icS
         6oEpbE9SMiVtWLNJKhjzDayi8XWZ9a5ATJEP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913735; x=1795518535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ya3rh+b4RSSKfCrvN68HAjlZ1+sxuSEJGaff5SDgpnY=;
        b=pHreqn6pcWys3nGiy2YDBWUNSVnIlEAvBy0WkpcAQ8KmtRv2Ktxa+PZ9xfgnH0YtZW
         aZlko1DCGz2yLodtuMnfX3jqTXTvnuf10LQKSWimpUJ3p0C3oFk3NcU154OzLEq0+NhM
         QdmcRgoPTh7KEBDAUvJ1QcmPHQ0B3MoyQqLhzk5LRX72/QpI0/qyaOwqfa3N9TLDDYDn
         sy8c+I6A6qpUypjfAeX7UpStB+0qtCgRiKt23yMqEAS1nxivcfWJj04h6bkmlA12Z2/s
         OwqvI2gVDIJ3GV5OqLMC+6BLBbrYaZDZL5Dmr3TRilfxUuuI3vn4T22vD+oNB4vKhCjy
         ESBw==
X-Forwarded-Encrypted: i=1; AL+hErHjtzmLTYxc9CXW9NgrijN3/OCS7nnA1q7/eO/j1rxaA9GU1Tqz+YxbqomBiGJvPPcgzsi2/rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oF0Hq0VqVfVaQM6CKyKa91YKxAy/lUT/d3wBp98wL6Gqn8LnS
	+gVmal7u5DwpqakGWzEMFhF7g5KSvUkz9FK7nvxBM6swI1262/9OCHaMiX86vheOg0wWGYhXX04
	8eeMkkhcZBhEJrXw7ZL19nTMXa4oYamVeU2jSKKYj
X-Gm-Gg: AYBFou20lDpFOLbKKkVJDHUNRj0bGOxV4H30+5u7Xsx9lHNJgiA+4OOIeZdlawyJ0qS
	3HvAudbnBmArzOnEvDybU2zuVxaEwfwvmat6HShE78KA2J7rAifRFoyyweBoM1I70MJOSkjJ1+M
	/drJoSthpO8QVZq0zldcC7sRCRAylAGcbXqnHwy1XOUL6k4TcIFAWOQIZYaeUwTHHR5qvwvYRYi
	c1LxMU63KihUtg/t8+KeyNSGGuG6EUE/TVupqiIY5/+raX8Jfw6NLucYNn3T7g8ZQFhE4vjAK9X
	d3ZCMVrX+wH4/gY3IB4Awy8KI5PmSOYdctTqbZY3hj0lYsaQgX6G0MS6Qo71kFOvt/HwVyW4mhN
	yYGidw8UzdLMVqAyK3OPeOp2NbUgUyQgvIE0aHrsjeFboBpQ+3nNUG7zT+tTW7QLsdefZDstqKX
	RsJoi0XdJSQS4+Ga9khOqMfJ8Fua5hN20x2/dh
X-Received: by 2002:a05:6a21:3d86:b0:3e1:180b:402b with SMTP id
 adf61e73a8af0-3f7a74bcd46mr10374727637.39.1794913734738; Tue, 17 Nov 2026
 03:08:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115201824.3680803-1-acassen@corp.free.fr>
In-Reply-To: <20261115201824.3680803-1-acassen@corp.free.fr>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 17 Nov 2026 06:08:43 -0500
X-Gm-Features: AclHuK-Ub9_Qne2dBnz2BsGwkjaD6Vrv1a4Pw878kTzLzPVW9NqPVGbYgz20G1w
Message-ID: <CAM0EoMmzUXV0_Dera1hALH=acm-uc8t8d8x3QJ3PvSmCW=fJvw@mail.gmail.com>
Subject: Re: [PATCH net-next] net/sched: act_api: fold tcf_idr_create_from_flags()
 into tcf_idr_create()
To: Alexandre Cassen <acassen@corp.free.fr>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Ido Schimmel <idosch@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:18=E2=80=AFPM Alexandre Cassen <acassen@corp.free=
.fr> wrote:
>
> All actions but act_simple pick their per CPU stats from the action
> flags through tcf_idr_create_from_flags(). Merge it into
> tcf_idr_create(), which now allocates per CPU stats unless
> TCA_ACT_FLAGS_NO_PERCPU_STATS is set.
>
> act_simple prints the packet count of its plain stats. It now passes
> TCA_ACT_FLAGS_NO_PERCPU_STATS. Its only visible change is the no_percpu
> flag that tc actions ls now shows:
>
>   $ tc actions add action simple sdata incongru
>   $ tc actions ls action simple
>   total acts 1
>
>           action order 0: Simple <incongru>
>            index 1 ref 1 bind 0
>           no_percpu       not_in_hw
>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Alexandre Cassen <acassen@corp.free.fr>

Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal

> ---
>  include/net/act_api.h      |  6 +-----
>  net/sched/act_api.c        | 15 ++-------------
>  net/sched/act_bpf.c        |  4 ++--
>  net/sched/act_connmark.c   |  4 ++--
>  net/sched/act_csum.c       |  4 ++--
>  net/sched/act_ct.c         |  4 ++--
>  net/sched/act_ctinfo.c     |  4 ++--
>  net/sched/act_gact.c       |  4 ++--
>  net/sched/act_gate.c       |  4 ++--
>  net/sched/act_ife.c        |  4 ++--
>  net/sched/act_mirred.c     |  4 ++--
>  net/sched/act_mpls.c       |  4 ++--
>  net/sched/act_nat.c        |  4 ++--
>  net/sched/act_pedit.c      |  4 ++--
>  net/sched/act_police.c     |  4 ++--
>  net/sched/act_sample.c     |  4 ++--
>  net/sched/act_simple.c     |  5 +++--
>  net/sched/act_skbedit.c    |  5 ++---
>  net/sched/act_skbmod.c     |  4 ++--
>  net/sched/act_tunnel_key.c |  5 ++---
>  net/sched/act_vlan.c       |  4 ++--
>  21 files changed, 42 insertions(+), 58 deletions(-)
>
> diff --git a/include/net/act_api.h b/include/net/act_api.h
> index fd03f6319e88..8591486cb877 100644
> --- a/include/net/act_api.h
> +++ b/include/net/act_api.h
> @@ -194,11 +194,7 @@ int tcf_generic_walker(struct tc_action_net *tn, str=
uct sk_buff *skb,
>  int tcf_idr_search(struct tc_action_net *tn, struct tc_action **a, u32 i=
ndex);
>  int tcf_idr_create(struct tc_action_net *tn, u32 index, struct nlattr *e=
st,
>                    struct tc_action **a, const struct tc_action_ops *ops,
> -                  int bind, bool cpustats, u32 flags);
> -int tcf_idr_create_from_flags(struct tc_action_net *tn, u32 index,
> -                             struct nlattr *est, struct tc_action **a,
> -                             const struct tc_action_ops *ops, int bind,
> -                             u32 flags);
> +                  int bind, u32 flags);
>  void tcf_idr_insert_many(struct tc_action *actions[], int init_res[]);
>  void tcf_idr_cleanup(struct tc_action_net *tn, u32 index);
>  int tcf_idr_check_alloc(struct tc_action_net *tn, u32 *index,
> diff --git a/net/sched/act_api.c b/net/sched/act_api.c
> index 13317d1abde1..7628f64faba4 100644
> --- a/net/sched/act_api.c
> +++ b/net/sched/act_api.c
> @@ -799,7 +799,7 @@ static int tcf_idr_delete_index(struct tcf_idrinfo *i=
drinfo, u32 index)
>
>  int tcf_idr_create(struct tc_action_net *tn, u32 index, struct nlattr *e=
st,
>                    struct tc_action **a, const struct tc_action_ops *ops,
> -                  int bind, bool cpustats, u32 flags)
> +                  int bind, u32 flags)
>  {
>         struct tc_action *p =3D kzalloc(ops->size, GFP_KERNEL);
>         struct tcf_idrinfo *idrinfo =3D tn->idrinfo;
> @@ -811,7 +811,7 @@ int tcf_idr_create(struct tc_action_net *tn, u32 inde=
x, struct nlattr *est,
>         if (bind)
>                 atomic_set(&p->tcfa_bindcnt, 1);
>
> -       if (cpustats) {
> +       if (!(flags & TCA_ACT_FLAGS_NO_PERCPU_STATS)) {
>                 p->cpu_bstats =3D netdev_alloc_pcpu_stats(struct gnet_sta=
ts_basic_sync);
>                 if (!p->cpu_bstats)
>                         goto err1;
> @@ -855,17 +855,6 @@ int tcf_idr_create(struct tc_action_net *tn, u32 ind=
ex, struct nlattr *est,
>  }
>  EXPORT_SYMBOL(tcf_idr_create);
>
> -int tcf_idr_create_from_flags(struct tc_action_net *tn, u32 index,
> -                             struct nlattr *est, struct tc_action **a,
> -                             const struct tc_action_ops *ops, int bind,
> -                             u32 flags)
> -{
> -       /* Set cpustats according to actions flags. */
> -       return tcf_idr_create(tn, index, est, a, ops, bind,
> -                             !(flags & TCA_ACT_FLAGS_NO_PERCPU_STATS), f=
lags);
> -}
> -EXPORT_SYMBOL(tcf_idr_create_from_flags);
> -
>  /* Cleanup idr index that was allocated but not initialized. */
>
>  void tcf_idr_cleanup(struct tc_action_net *tn, u32 index)
> diff --git a/net/sched/act_bpf.c b/net/sched/act_bpf.c
> index 3aea3ff5785f..f651098deabf 100644
> --- a/net/sched/act_bpf.c
> +++ b/net/sched/act_bpf.c
> @@ -305,8 +305,8 @@ static int tcf_bpf_init(struct net *net, struct nlatt=
r *nla,
>         index =3D parm->index;
>         ret =3D tcf_idr_check_alloc(tn, &index, act, bind);
>         if (!ret) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, act,
> -                                               &act_bpf_ops, bind, flags=
);
> +               ret =3D tcf_idr_create(tn, index, est, act,
> +                                    &act_bpf_ops, bind, flags);
>                 if (ret < 0) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_connmark.c b/net/sched/act_connmark.c
> index 0b6ac6be60d2..2844eca7cd26 100644
> --- a/net/sched/act_connmark.c
> +++ b/net/sched/act_connmark.c
> @@ -129,8 +129,8 @@ static int tcf_connmark_init(struct net *net, struct =
nlattr *nla,
>         index =3D parm->index;
>         ret =3D tcf_idr_check_alloc(tn, &index, a, bind);
>         if (!ret) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_connmark_ops, bind, =
flags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_connmark_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         err =3D ret;
> diff --git a/net/sched/act_csum.c b/net/sched/act_csum.c
> index 5fff52a8ca90..72f5e4f3d82c 100644
> --- a/net/sched/act_csum.c
> +++ b/net/sched/act_csum.c
> @@ -69,8 +69,8 @@ static int tcf_csum_init(struct net *net, struct nlattr=
 *nla,
>         index =3D parm->index;
>         err =3D tcf_idr_check_alloc(tn, &index, a, bind);
>         if (!err) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_csum_ops, bind, flag=
s);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_csum_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_ct.c b/net/sched/act_ct.c
> index 7602733d7f6b..342c6a8d4964 100644
> --- a/net/sched/act_ct.c
> +++ b/net/sched/act_ct.c
> @@ -1427,8 +1427,8 @@ static int tcf_ct_init(struct net *net, struct nlat=
tr *nla,
>                 return err;
>
>         if (!err) {
> -               err =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_ct_ops, bind, flags)=
;
> +               err =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_ct_ops, bind, flags);
>                 if (err) {
>                         tcf_idr_cleanup(tn, index);
>                         return err;
> diff --git a/net/sched/act_ctinfo.c b/net/sched/act_ctinfo.c
> index fced4b1094af..876cf8f7e3c3 100644
> --- a/net/sched/act_ctinfo.c
> +++ b/net/sched/act_ctinfo.c
> @@ -212,8 +212,8 @@ static int tcf_ctinfo_init(struct net *net, struct nl=
attr *nla,
>         index =3D actparm->index;
>         err =3D tcf_idr_check_alloc(tn, &index, a, bind);
>         if (!err) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_ctinfo_ops, bind, fl=
ags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_ctinfo_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_gact.c b/net/sched/act_gact.c
> index ec9a65dfc442..bcd9b87ac347 100644
> --- a/net/sched/act_gact.c
> +++ b/net/sched/act_gact.c
> @@ -104,8 +104,8 @@ static int tcf_gact_init(struct net *net, struct nlat=
tr *nla,
>
>         err =3D tcf_idr_check_alloc(tn, &index, a, bind);
>         if (!err) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_gact_ops, bind, flag=
s);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_gact_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
> index 711cf2443540..6d64c1d43a23 100644
> --- a/net/sched/act_gate.c
> +++ b/net/sched/act_gate.c
> @@ -411,8 +411,8 @@ static int tcf_gate_init(struct net *net, struct nlat=
tr *nla,
>                 return ACT_P_BOUND;
>
>         if (!err) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_gate_ops, bind, flag=
s);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_gate_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_ife.c b/net/sched/act_ife.c
> index ad77eb303ae7..01f7eef261e1 100644
> --- a/net/sched/act_ife.c
> +++ b/net/sched/act_ife.c
> @@ -549,8 +549,8 @@ static int tcf_ife_init(struct net *net, struct nlatt=
r *nla,
>         }
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_ife_ops, bind, flags=
);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_ife_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         kfree(p);
> diff --git a/net/sched/act_mirred.c b/net/sched/act_mirred.c
> index 1c98e4d81ebe..657dbc86c31e 100644
> --- a/net/sched/act_mirred.c
> +++ b/net/sched/act_mirred.c
> @@ -171,8 +171,8 @@ static int tcf_mirred_init(struct net *net, struct nl=
attr *nla,
>                                            "Must specify device or block"=
);
>                         return -EINVAL;
>                 }
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_mirred_ops, bind, fl=
ags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_mirred_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_mpls.c b/net/sched/act_mpls.c
> index a870386386d9..58957f6fd3d8 100644
> --- a/net/sched/act_mpls.c
> +++ b/net/sched/act_mpls.c
> @@ -196,8 +196,8 @@ static int tcf_mpls_init(struct net *net, struct nlat=
tr *nla,
>                 return ACT_P_BOUND;
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_mpls_ops, bind, flag=
s);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_mpls_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_nat.c b/net/sched/act_nat.c
> index a201979ac7cf..f9e8e9e26cd1 100644
> --- a/net/sched/act_nat.c
> +++ b/net/sched/act_nat.c
> @@ -60,8 +60,8 @@ static int tcf_nat_init(struct net *net, struct nlattr =
*nla, struct nlattr *est,
>         index =3D parm->index;
>         err =3D tcf_idr_check_alloc(tn, &index, a, bind);
>         if (!err) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a, &act=
_nat_ops,
> -                                               bind, flags);
> +               ret =3D tcf_idr_create(tn, index, est, a, &act_nat_ops,
> +                                    bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_pedit.c b/net/sched/act_pedit.c
> index 99d7e36510bd..a4eef302cc00 100644
> --- a/net/sched/act_pedit.c
> +++ b/net/sched/act_pedit.c
> @@ -196,8 +196,8 @@ static int tcf_pedit_init(struct net *net, struct nla=
ttr *nla,
>         index =3D parm->index;
>         err =3D tcf_idr_check_alloc(tn, &index, a, bind);
>         if (!err) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_pedit_ops, bind, fla=
gs);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_pedit_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_police.c b/net/sched/act_police.c
> index 0b0c09e3dfd9..e36cd8e0c08a 100644
> --- a/net/sched/act_police.c
> +++ b/net/sched/act_police.c
> @@ -80,8 +80,8 @@ static int tcf_police_init(struct net *net, struct nlat=
tr *nla,
>                 return ACT_P_BOUND;
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, NULL, a,
> -                                               &act_police_ops, bind, fl=
ags);
> +               ret =3D tcf_idr_create(tn, index, NULL, a,
> +                                    &act_police_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_sample.c b/net/sched/act_sample.c
> index 3029e93c4dea..2acdfa939a81 100644
> --- a/net/sched/act_sample.c
> +++ b/net/sched/act_sample.c
> @@ -69,8 +69,8 @@ static int tcf_sample_init(struct net *net, struct nlat=
tr *nla,
>                 return ACT_P_BOUND;
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_sample_ops, bind, fl=
ags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_sample_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_simple.c b/net/sched/act_simple.c
> index 80e5084b4dbd..5bded0695482 100644
> --- a/net/sched/act_simple.c
> +++ b/net/sched/act_simple.c
> @@ -134,8 +134,9 @@ static int tcf_simp_init(struct net *net, struct nlat=
tr *nla,
>         }
>
>         if (!exists) {
> -               ret =3D tcf_idr_create(tn, index, est, a,
> -                                    &act_simp_ops, bind, false, flags);
> +               /* tcf_simp_act() prints the packet count of tcf_bstats *=
/
> +               ret =3D tcf_idr_create(tn, index, est, a, &act_simp_ops, =
bind,
> +                                    flags | TCA_ACT_FLAGS_NO_PERCPU_STAT=
S);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_skbedit.c b/net/sched/act_skbedit.c
> index 1f958b7d2a60..52e999b14284 100644
> --- a/net/sched/act_skbedit.c
> +++ b/net/sched/act_skbedit.c
> @@ -221,9 +221,8 @@ static int tcf_skbedit_init(struct net *net, struct n=
lattr *nla,
>         }
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_skbedit_ops, bind,
> -                                               act_flags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_skbedit_ops, bind, act_flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_skbmod.c b/net/sched/act_skbmod.c
> index 72dedb9b19a6..bde17f9626a1 100644
> --- a/net/sched/act_skbmod.c
> +++ b/net/sched/act_skbmod.c
> @@ -171,8 +171,8 @@ static int tcf_skbmod_init(struct net *net, struct nl=
attr *nla,
>         }
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_skbmod_ops, bind, fl=
ags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_skbmod_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> diff --git a/net/sched/act_tunnel_key.c b/net/sched/act_tunnel_key.c
> index 28d9cc080101..357be7b3f9e2 100644
> --- a/net/sched/act_tunnel_key.c
> +++ b/net/sched/act_tunnel_key.c
> @@ -507,9 +507,8 @@ static int tunnel_key_init(struct net *net, struct nl=
attr *nla,
>         }
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_tunnel_key_ops, bind=
,
> -                                               act_flags);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_tunnel_key_ops, bind, act_flags=
);
>                 if (ret) {
>                         NL_SET_ERR_MSG(extack, "Cannot create TC IDR");
>                         goto release_tun_meta;
> diff --git a/net/sched/act_vlan.c b/net/sched/act_vlan.c
> index e666004bb919..4f784626802f 100644
> --- a/net/sched/act_vlan.c
> +++ b/net/sched/act_vlan.c
> @@ -214,8 +214,8 @@ static int tcf_vlan_init(struct net *net, struct nlat=
tr *nla,
>         action =3D parm->v_action;
>
>         if (!exists) {
> -               ret =3D tcf_idr_create_from_flags(tn, index, est, a,
> -                                               &act_vlan_ops, bind, flag=
s);
> +               ret =3D tcf_idr_create(tn, index, est, a,
> +                                    &act_vlan_ops, bind, flags);
>                 if (ret) {
>                         tcf_idr_cleanup(tn, index);
>                         return ret;
> --
> 2.43.0
>
