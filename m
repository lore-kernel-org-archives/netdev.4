Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632780;
	b=K4kV88BOaArN585jvdeTBk70i25JGFiCfzv8Zskc0AUNdasB72aN5ZfVegtF5dxEaoRg
	 rrjYE4y+EIiB+ChohTe00e/xrzW7eEdxzUvgr+32bJBmQ/vNplPQjmQ6v547nq/y/s6FH
	 Op9dDUGUbqIeJUQQZPgWjHtm/iWpglx0tm452W0AJMFMi4fEvP5vqpAYmvN/ayFOWtwjh
	 qLxiWSZtp6aU7ryd9DxLErCCk8AqdGqvp15IotKWE/rerMrclgNQWAxwGNh2Lc+BnGcgF
	 LjlJQ0Mk3PSe+fELmgWGMieHSQABMUgNXbuttuWVYoRUlq/mk86y/Yh/kRgtObqwkvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IZVbbZbujlD5JJFyB1xbx4SO9f/2Crn3lUovbiEC2mg=;
	b=RwIT4Flq7NrLDrrRzSeVE8Me1ppITDxRolm0uWqWS/QX5Awk/UQnkNuS3GHZNC6qMKUS
	 DxfN8wfa/+OvcqWSewRPfZdikO7rkMTALxr7rGA+qMjkLE3qLhTGnZ42bvtS2uzeZk17U
	 tuVPnWCXiRUy89rM9fp/PSOwoWiWjng9EwDIhB/PEKOF5muFXlJXDTqmQEjURZGD2j13r
	 tzhBJyqaAIpOGvoj0XMGclMPMNXgpfoqvKL68q7XbWayjI0pis8vNvFxIyXCb1380vXvj
	 4Et/Otd0yjU7Ye3UAP9BJPCZWt5qxdVUydxI9ZXH/Bb0fSZO4h6phs4EL97Sbw8pAIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVqNacN7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44840606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44840606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVqNacN7
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3070747b3a.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795632779; cv=none;
        d=google.com; s=arc-20260327;
        b=KvvqO7Iy6uMEGIb58Q0l/El4cmlMYtcRxs8ilGiKlS6cBfIIP/vrZXw9DnmlcSPVve
         dvw00gC7uUKWvbamI5tKJVwFQx2ooYCKyAwpmMREZ3EhYZToIWOnbpGf3YQF7sWfIXyO
         EnwNlFPD1QPj7omTKOE0GnoSPdOFEFs+ZTas+OTap3h2/8Wj3I5DnXk+rEP9T9xskxgU
         iFY7wjl+fbDUIDWIgvTKdM1jX/vZjG4co3RafP+UwomoIac95W8AFF1fCrNpWkmqgdIH
         2+SmEiSNemOLwcEy2OZMtlk6jONNfBC05Ti8xSMJAc+mQto0AbPLW7bmI/7Hg6Vn4MK3
         j1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZVbbZbujlD5JJFyB1xbx4SO9f/2Crn3lUovbiEC2mg=;
        fh=QweEZ4nfhr4t7QQmxNslbotgvSdulHsv36ixDpv+rQk=;
        b=rKtH8Lqbde3BDbzT7w5BQSADkzoHUXB19mgaM2v472qD5W3NXB+Ak/GMRoHURJRKPK
         QgnEwXd9yoyleLCiT8VqdK9x9NGGQ+H++SaHMvSWlFlKdJKcPjfznn9WRMjgxeyEAcdm
         gYlJml6214GmUuVd4QVpCzUgiKYyFpChe1Ff7NkMXRVfZd6gVXlo56UTW6AYK/TzIiYo
         jYM0XvlJZ5Ae9uEb7DEN2FMJXQRrFuAaRWbFA+6gHTNALT44OicYZWdE4eIvLI+5559D
         edalPOsYdCLf36u39cgvTu6tzrYAfA47j5B0khWJuxsu4dAsZXDQHvvrU+y+aj1xXP7c
         6oTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632779; x=1796237579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZVbbZbujlD5JJFyB1xbx4SO9f/2Crn3lUovbiEC2mg=;
        b=lVqNacN7LdzQjJTMNHqQ7/MUcNe5hD+PE8EIybVfKW6KfzGViUEDzr8OufzAB08c+T
         5r4r+nOK1nvHFSq8X540dDBC6p+Q/IlMzIzyqHZkhqgQ2R0RkotNZvSzptNEXan1adBp
         STiFOSUUaP1nHFRtGl/eijLnj5jkesENMKg6TJYds+VNVGkJMsgxf6I6OC1Tjvtu/8x+
         eohA1mlgvLGG3epvEpUJbvD3Y6I0fcTsVCNB8Dzp/8JV32keqrb8XS9Np07TxmEXIIH4
         oVOt46dPWsqvSn3FCaE/K23N9hZvVA3x/jLo7Sa0VEl/JL8YOcpNN020OUodSqR6HHBT
         UL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632779; x=1796237579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZVbbZbujlD5JJFyB1xbx4SO9f/2Crn3lUovbiEC2mg=;
        b=ToqVj9yVs7mv6ny8BUpw5YT7IJ1dHGru3gAWZaZVXkQ6j2eCSctZrSWW0/Lk0CqbUj
         laQTaSJ8K23yLo9X9SFC0TVLqhGMw/SFNr9rklL6BebMmqsjqzhd3acLe1TtKJXxFB/Z
         3YOhlJFtiZGJWGlomtJjdTCPQ3dhUzQE0Gphk8wG3r1F21RZUddAlTBxNl5wNK/Yckiq
         2jWTIypyvgfFsEWBIjk+mWQsi9xElavoVAZC5n7XhzLC2xgJwDaVJRyMXN3EFxOVf7n2
         O7YCt4Y/HxVbC4u/QseQtt7dsrwEJkMHYJmDm6d1uey55hEwPYwQsaIT5dJ6aKoNdZNX
         1K2Q==
X-Forwarded-Encrypted: i=1; AL+hErFk0PaPzT8c9YPwyVdWaN4tuXCsS/wNe6ruC4LYUjAZRcpKHv98qj25ZoQycGpQ9fhflg2LfF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81vVYV/W0KROolTNtQdLr7rZGcfRuQwSCogh/Kplc4Ds4+VJ7n
	HAv1FNgjX+KZvby6f9IuDvpktGohKSjgnMrruC68FLs4cjfblr5SXSAJwF0u1mJE8pvbfj/5pRK
	LTHUoQCuSPFocjuaEBMLy83KJSgCmsKE=
X-Gm-Gg: AZFdTZdPomNsdtuR30cFWTs2DDup6K2EJjflwyj9OKpppI1w4wo7T3nneY2oGg6+Shb
	070lrdjcxYV9nki+1Z6WoDr24xa5JGRNyhX9m1ytpedqHmYCxPLRiJZtSq9RNrlow4hbjyPgQ+k
	1mGc5k6TsgohljYgw7HmMWjiwp4e4QDHkVVu731Y73qxhuQhHau5vrY3Up+hK+hNI60IoISlfvi
	80VH1LPjWX+5Ql78MHtpkGD85kIra9MN+mpQS5yQ+HPCbKu1s08qI2rQYwCP3wOL1BGze/oD7ce
	IsjumRhTjZaKGurIE9z7HWTrH9N9vJDm97gXmwCqfIASd7PK9JKm5GKTWmfEAU3C/ZJ7vueapBb
	CR/OWCEDB8kuuHpQwCBFACna8IxNRnffR93Y/JsOlleYFHdDIIBuawU9Ey/oFhBzYlPMGd/QYQk
	hF1ZqRZUhYdf3/qXeNCPDen3oGA1fQX3TZEJbCqceFzGGB4Nhz56yVG47iX7pzUEmDow5K
X-Received: by 2002:a05:6a00:85:b0:8cc:9373:fbe7 with SMTP id
 d2e1a72fcca58-8cc93740d87mr6993000b3a.11.1795632779404; Wed, 25 Nov 2026
 10:52:59 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179560159232.2963157.3418291084812904092@gmail.com>
In-Reply-To: <179560159232.2963157.3418291084812904092@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 13:52:46 -0500
X-Gm-Features: Aa3M54qZsmTLB5jdsFQl6LWvai0mPjGnFjyppTnAjbm-rMJPAX5Hrj5RsV-2zbA
Message-ID: <CADvbK_cNs_X+6VmJd_RqJsWMzdH2oY3BEp4O3e+ymTwcDQPdYg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: keep the port of a bound socket when adding an
 address fails
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Neil Horman <nhorman@tuxdriver.com>, Mao Wenan <maowenan@huawei.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 8:49=E2=80=AFAM Kyuwon Cho <kyuwoncho18@gmail.com> =
wrote:
>
> Since commit 29b99f54a8e6 ("sctp: destroy bucket if failed to bind
> addr"), sctp_do_bind() releases the port when sctp_add_bind_addr()
> fails. sctp_bindx_add() also calls it for each extra address of a
> socket that is already bound, and possibly listening. There
> sctp_get_port_local() takes no new reference, but the failure path
> still calls sctp_put_port(), which unhashes the port and clears
> bind_hash and inet_num while the socket keeps its other addresses and
> stays listening. listen(0) then writes through the NULL bind_hash, and
> accept() of a pending association oopses in sctp_clone_sock():
>
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   RIP: 0010:sctp_inet_listen (net/sctp/socket.c:8723)
>   Call Trace:
>    __sys_listen (net/socket.c:2016)
>    __x64_sys_listen (net/socket.c:2021)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61)
>
> Release the port only when this call took it, that is, when the socket
> had no bind_hash before.
>
> Fixes: 29b99f54a8e6 ("sctp: destroy bucket if failed to bind addr")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
> The issue was found by an LLM-guided test generator that we are
> developing as a research prototype. A reproducer, which runs as any
> user with CONFIG_FAILSLAB:
>
> #define _GNU_SOURCE
> #include <arpa/inet.h>
> #include <fcntl.h>
> #include <net/if.h>
> #include <sched.h>
> #include <stdio.h>
> #include <sys/ioctl.h>
> #include <sys/socket.h>
> #include <unistd.h>
>
> #define SCTP_SOCKOPT_BINDX_ADD  100
>
> /* needs CONFIG_FAULT_INJECTION and CONFIG_FAILSLAB; runs as any user */
> int main(void)
> {
>         struct ifreq lo =3D { .ifr_name =3D "lo", .ifr_flags =3D IFF_UP }=
;
>         struct sockaddr_in a =3D {
>                 .sin_family =3D AF_INET,
>                 .sin_port =3D htons(30114),
>                 .sin_addr.s_addr =3D htonl(INADDR_LOOPBACK),
>         };
>         int s, one =3D 1, nth =3D open("/proc/thread-self/fail-nth", O_WR=
ONLY);
>
>         if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
>                 return perror("unshare"), 1;
>         s =3D socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP);
>         ioctl(s, SIOCSIFFLAGS, &lo);
>         bind(s, (void *)&a, sizeof(a));
>         listen(s, 5);
>         setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
>
>         /* fail the allocation in sctp_add_bind_addr() */
>         a.sin_addr.s_addr =3D inet_addr("127.0.0.2");
>         if (write(nth, "1", 1) !=3D 1)
>                 return perror("fail-nth"), 1;
>         printf("bindx add: %d\n",
>                setsockopt(s, IPPROTO_SCTP, SCTP_SOCKOPT_BINDX_ADD, &a, si=
zeof(a)));
>
>         printf("listen(0): %d\n", listen(s, 0));
>         return 0;
> }
>
> Without the patch, listen(0) oopses as above; with it, it returns 0,
> and in a variant that accepts a pending association, accept()
> returns the new socket.
>
> The patch was written with LLM assistance; we reviewed and tested it.
>
>  net/sctp/socket.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index bc68af88e271..519063833aac 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -420,6 +420,7 @@ static int sctp_do_bind(struct sock *sk, union sctp_a=
ddr *addr, int len)
>         struct sctp_bind_addr *bp =3D &ep->base.bind_addr;
>         struct sctp_af *af;
>         unsigned short snum;
> +       bool bound;
>         int ret =3D 0;
>
>         /* Common sockaddr verification. */
> @@ -467,6 +468,7 @@ static int sctp_do_bind(struct sock *sk, union sctp_a=
ddr *addr, int len)
>          * The function sctp_get_port_local() does duplicate address
>          * detection.
>          */
> +       bound =3D sp->bind_hash;
>         addr->v4.sin_port =3D htons(snum);
>         if (sctp_get_port_local(sk, addr))
>                 return -EADDRINUSE;
> @@ -484,7 +486,8 @@ static int sctp_do_bind(struct sock *sk, union sctp_a=
ddr *addr, int len)
>                                  SCTP_ADDR_SRC, GFP_ATOMIC);
>
>         if (ret) {
> -               sctp_put_port(sk);
> +               if (!bound)
> +                       sctp_put_port(sk);
>                 return ret;
>         }
>         /* Copy back into socket for getsockname() use. */
> --
> 2.43.0
>
Acked-by: Xin Long <lucien.xin@gmail.com>
