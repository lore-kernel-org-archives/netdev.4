Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530337;
	b=R2kNGnlbRFbqXHKKrS2sNatu0qziBMWbBcwM8ezIc0w5XVqk9GCFiy4B6Bp8mTgYR7+z
	 nhWAiGPL6PINSXfgShLidrkcjysEd9BFLnXYNN1KmiSiMV2xa3iOe71yjZMU3OVpHsh85
	 h3krBAkIstgUUvqF0jJhINsg1zfuEwMhCaFb8Rzgz9/azQbe0TXlRlsEmwRHI8QqXnilN
	 bPx4dCdSrq/EReZoxGRT2ZtVKn2Q9OGzFE5CsxF6e5GiHFOmjcdVffDyLg4afFdOOTlm9
	 noCK1PZjzv6of1gutTMND/9GepN7Z6vuOPM+u85HBDRXljGxEvWKjGT5alPywYytD0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
	b=RTmN5Z/DzQ5YTHxlQn1yd/ULuxdwqFmvhXrSoqEMDqLHcN+chkCLTD1jR6KrDIfS951c
	 G1JKRTSyE4o7grX2P0VTqx/7Fk6hHGjpGxg5CTNpGMD253Ri+0aEUn2BTYF2F/PR+Hp7h
	 NSLOeH0U+L56px1rc+Q+Z7qrWca77eBK7KLs8113VTz3UGnW68LSG/+PFeUZCmUQCgIyF
	 SFK5AJIQPBfP6PnRzeMyE9nhfwjA0mBCqZ7ARPjGPileMETApvs6B2iDIgAUQOr7kzRnY
	 iguq/Sylb8/D/l8v78aiCQxV4pM0HSSNBiH1oFOxkAXRh61DpNcVuDQgRvBfL3lTIew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbri3ZFl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35955606A32E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35955606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbri3ZFl
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1762187b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530336; cv=none;
        d=google.com; s=arc-20260327;
        b=IjmpNCmlAMgqOvRMIVS/+kPmtm4CYL1CfgNCobM7ypQzo/enK3wplwHyo6A9elHiH4
         flvcYlxKHk/cTXAdV0K72i7UdF78dA5iWUxLdzqqTVmQTn68L5uLW0H/5n7uHQMDWTaz
         fEXttUGPdoluWeNkcVWkWfBLTaIQsdo0rx1iosllNUw342PrI3KlA/y4Q70UsY1Ok7rn
         oGofB468q+OV1l7gjsjvsasiIp83luTSVS8DMuJmFBhRSwsGLQQjjh81uMp1LTKSXZhb
         p99VvDjqS7VNPc/KNvGz0SGhsI+ldC1A4IAjVAW/FK1dg61NyJ5y7QV5m2Pv84x8h5gb
         ++cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        fh=ytUzVbOBKkcVPM6JW6k0DvysawwIlDipFflnIqgu9ZY=;
        b=JAC6Jps5ZrxjFBdd2YtVo3kVeFsPtG52gfvJA7mamCQuVi+LAZqdU3+aomBnZk34aN
         EuWc0j32OvoSyx8hd+XNGk9TTJqjtvhxAXNZkblicvZU+FiOCD4XbXchuDBf+lasAiP5
         T306+kAlQvSAO7Ynd3R2HSUteMThvr5y6vOdCYHmf1rSJVvVIHrwJja2EK6lS8v5t46F
         l+qD8GllsD5vhi5Dohts4cqOv2A0dWEiPbIIySUh2ulk+pAozQ/ll7W2VZUcsmMfRSOd
         /XSEpkw6JEYGUn33LIZPw+LvIuptgoaDB9sea3rGMHNtjet+jujGNCyzHrkNNJxx4d37
         Mh+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530336; x=1796135136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        b=tbri3ZFlUrXTvmw515RCeHxH0sH7SQMgNgV4Hs5g+fAXiaTlyEH6gd8EcScn0kODl4
         kJSqhU98sY/p9sPCL3A8XWGexJBCuOudwaaHJQ4n6UHDmfqoxTcQO7/9he0guOX3+/QC
         QLBjRtZ0GELPj36h256GZZCXFGO+13FJ630OlVbTUXuo/Z6h/aUfS241CTLqXTMD8oNY
         XP7O81LK5PyurfY+LoA2n1dLA1wfegVhSfIifHrHGpv0aXMh8DMoDeOkcrsSxeR6/nga
         hgdQLMDO3G/MD7T+aiDqeeqHV1d/Nu6326difSM6CAkNrLI3P11MTXexSCBCAj+rxuti
         5mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530336; x=1796135136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        b=k74OfJlMbqFppr88kIDn1BQ8E5/UxZwegTshGwjBmL6xAZNfk4NV00zqC5cVV1FS1x
         LBmO+0TAhITvHYeio2ReBULSf4LccmTSWjCyWPIvMEnrjmPlgOp2sst1621bY7pc3J99
         2+F0yIZmz7ezK3UfDt3HjMQ4/3G3BCB2LdcqWXMw/hQ1etNsoy4Um/8fgNPAgYYOMPbg
         Kdn1zBFqOz1mty/cw5yCRmwz9Fwn0k+UblDt17Fm0Wsn+5Q9vy/PkPxzPcNn8upHK0SL
         XwuscZ9F6rrlS994lyfnw7SMFEU6RAFSUWE9a4JcdBiM1xwNbdtQwHlJ0lhAM/2lYT4Y
         Tekg==
X-Forwarded-Encrypted: i=1; AL+hErFvViU9bXC2yg2z3HJIhmDM8Ie2h+znuiqeJwthVNwg2TIMpINX0DZsv9ZF6zKAAFRABoJAPR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8IzdqZOZpEI7YtBFq5nMwxz4bHvJBBXRdYlxZ5gXa3B/q1QRd
	5sEcM5hyQRTuQsQbxcVySywh0BKIneiwFUKprrwQCIwJMpiCSq6jaOu58GQ7yB6i/JB/N5ZeAz8
	DH5oN8+Ep6EP2Nyk638eEe7w8UwiDW1Y=
X-Gm-Gg: AZFdTZc/4LjxuMs3KUyUTBjsGCs6Swc1xPejL5w3sCoru4BerS4qxb1DwtZ4D1r6MDi
	6YKgJiev50VlrC2XBXOVs1borQVtwWnBcR0ecBVu/fde/n5dsDC+6Th5j2DUJKKQLOJV2ss4YZE
	GWCoyeynZ9iwbhxEir0Q/tHSP0B6IMpwvd2mKrXMGHuHvK3pBZlqbzaexy5ln7jsGkSshIGGCoH
	7sYJ1MWjeIVHKom3DjWUCLGX8ZRh96DIU4+AEygUKtDS4P4yYO2xnEhBZyAZtfWukNcIdDP0+Jw
	Jl+FaM/uyNiMpoOeHBmCcGQB1xfKxdUTsr67s2OY3mcGgfWGgNuyMCGLuYwEKy2XyiKbG9C4PPq
	q+fHDzczEPwERpoGmnqg7linmPxDJpDzn/tKVo8lIwzQbq5nSUPrQQ+/6CJEm9riTE1eD+Zn/oC
	+eKG4IwfDE19xlcWY13+SDC6E16b3vdfpZYskbCg==
X-Received: by 2002:a05:6a00:aa05:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8c87d51b350mr14612611b3a.52.1795530336387; Tue, 24 Nov 2026
 06:25:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170342.1508789-1-irogers@google.com>
In-Reply-To: <20261119170342.1508789-1-irogers@google.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:25:24 -0500
X-Gm-Features: Aa3M54q7cf8dGtPcbVzPYANJ8EMqW3ekx7jrSJiP6UuKtxdr80Wu8XceJYu_RHk
Message-ID: <CADvbK_fM=xmwthLnz=j7YqRghc6ncDo8ESVYgWYeR0t_Byubhg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: initialize new_value in custom proc_dointvec
 sysctl handlers
To: Ian Rogers <irogers@google.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:03=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> proc_sctp_do_rto_min(), proc_sctp_do_rto_max(), proc_sctp_do_auth(),
> proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() point
> tbl.data at an uninitialized stack variable new_value on writes before
> calling proc_dointvec().
>
> proc_dointvec() can return 0 without writing to tbl.data, for example on
> a zero-length write (*lenp =3D=3D 0) or on a write at a non-zero file off=
set
> ignored by proc_first_pos_non_zero_ignore() (such as pwrite(fd, "1\n",
> 2, 1) or a split write where the trailing newline is written separately).
>
> When that happens:
> - proc_sctp_do_auth() unconditionally stores the uninitialized stack int
>   into net->sctp.auth_enable and sctp_sk(sk)->ep->auth_enable, both
>   corrupting SCTP authentication state and leaking 4 bytes of kernel
>   stack memory back on subsequent sysctl reads.
> - proc_sctp_do_rto_min(), proc_sctp_do_rto_max(),
>   proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() validate
>   the uninitialized value and overwrite the netns setting whenever stack
>   bytes happen to fall within range.
> - proc_sctp_do_udp_port() also stops and restarts the UDP encapsulation
>   socket even when the port number did not change.
>
> Initialize new_value to the current netns setting before calling
> proc_dointvec() (matching proc_dobool()), and skip tearing down and
> restarting the UDP encapsulation socket in proc_sctp_do_udp_port() when
> new_value equals net->sctp.udp_port.
>
> Found by enabling Clang's -Wconditional-uninitialized on an x86_64
> allyesconfig build, with AI coding assistant help to audit the warning
> and prepare the fix. Build-tested with Clang; not runtime-tested.
>
> Fixes: 4f3fdf3bc59c ("sctp: add check rto_min and rto_max in sysctl")
> Fixes: b14878ccb7fa ("net: sctp: cache auth_enable per endpoint")
> Fixes: 046c052b475e ("sctp: enable udp tunneling socks")
> Fixes: d1e462a7a5f3 ("sctp: add probe_interval in sysctl and sock/asoc/tr=
ansport")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  net/sctp/sysctl.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/net/sctp/sysctl.c b/net/sctp/sysctl.c
> index 2b94c211427d..0c33f05fa532 100644
> --- a/net/sctp/sysctl.c
> +++ b/net/sctp/sysctl.c
> @@ -425,8 +425,9 @@ static int proc_sctp_do_rto_min(const struct ctl_tabl=
e *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.rto_=
min);
>         unsigned int min =3D *(unsigned int *) ctl->extra1;
>         unsigned int max =3D *(unsigned int *) ctl->extra2;
> +       int new_value =3D net->sctp.rto_min;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -453,8 +454,9 @@ static int proc_sctp_do_rto_max(const struct ctl_tabl=
e *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.rto_=
max);
>         unsigned int min =3D *(unsigned int *) ctl->extra1;
>         unsigned int max =3D *(unsigned int *) ctl->extra2;
> +       int new_value =3D net->sctp.rto_max;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -489,8 +491,9 @@ static int proc_sctp_do_auth(const struct ctl_table *=
ctl, int write,
>                              void *buffer, size_t *lenp, loff_t *ppos)
>  {
>         struct net *net =3D container_of(ctl->data, struct net, sctp.auth=
_enable);
> +       int new_value =3D net->sctp.auth_enable;
>         struct ctl_table tbl;
> -       int new_value, ret;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -522,8 +525,9 @@ static int proc_sctp_do_udp_port(const struct ctl_tab=
le *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.udp_=
port);
>         unsigned int min =3D *(unsigned int *)ctl->extra1;
>         unsigned int max =3D *(unsigned int *)ctl->extra2;
> +       int new_value =3D net->sctp.udp_port;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -541,18 +545,20 @@ static int proc_sctp_do_udp_port(const struct ctl_t=
able *ctl, int write,
>                         return -EINVAL;
>
>                 mutex_lock(&sctp_sysctl_mutex);
> -               net->sctp.udp_port =3D new_value;
> -               sctp_udp_sock_stop(net);
> -               if (new_value) {
> -                       ret =3D sctp_udp_sock_start(net);
> -                       if (ret)
> -                               net->sctp.udp_port =3D 0;
> +               if (new_value !=3D net->sctp.udp_port) {
> +                       net->sctp.udp_port =3D new_value;
> +                       sctp_udp_sock_stop(net);
> +                       if (new_value) {
> +                               ret =3D sctp_udp_sock_start(net);
> +                               if (ret)
> +                                       net->sctp.udp_port =3D 0;
> +                       }
> +
> +                       /* Update the value in the control socket */
> +                       lock_sock(sk);
> +                       sctp_sk(sk)->udp_port =3D htons(net->sctp.udp_por=
t);
> +                       release_sock(sk);
>                 }
> -
> -               /* Update the value in the control socket */
> -               lock_sock(sk);
> -               sctp_sk(sk)->udp_port =3D htons(net->sctp.udp_port);
> -               release_sock(sk);
>                 mutex_unlock(&sctp_sysctl_mutex);
>         }
>
> @@ -564,8 +570,9 @@ static int proc_sctp_do_probe_interval(const struct c=
tl_table *ctl, int write,
>  {
>         struct net *net =3D container_of(ctl->data, struct net,
>                                        sctp.probe_interval);
> +       int new_value =3D net->sctp.probe_interval;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> --
> 2.56.1.708.g77570a6a1d-goog
>

Acked-by: Xin Long <lucien.xin@gmail.com>
