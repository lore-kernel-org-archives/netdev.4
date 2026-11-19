Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795107169;
	b=4jX6NnDXO5mcNnCHkW1yA9QymMwxk9ioByAVBjw5Ak7tiPRMRn1Q5m0r4H23cG6x/2am
	 Sn6OyNPCYanqRw0XB5QpImhlB1Aq92Nxro7/+UMLkUMm2MI2ODnOElISFrHlvG2kcflVy
	 4B8M8RdqIraQbICCiAWFHljbCKozYFelALImURI9GjemAO5uMwA3VNiRD/NXjvllzVVjg
	 HE9TrRNoi2IluY3suqljcG6PGLwSA/VAnrKZzpXsx7dEZGNNLsDChVHxmbxVPPGAKZsrk
	 jbDyTDShaVbrDJFkC8O5cq9q0FQ5ARJp8XozTNC8A3YWpoiedjCu/sBYXGeLCXc/BvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AlVhwoqPVEfSQ+5fBg8Cjml6CljtON+tEw4OOYgtCl4=;
	b=yNr+FRI95vSJKhIUJv4oP821NTWiDYRMchEdJJbViERP9Rh4YkJk2mKXYZqoR3jXfVJ3
	 qcWJkSOZsNdx+5Qegj+9h6wF0+6bIUNiFsOdjAM033idkHUxI8avdolZfJIDeLO0AJc5A
	 O/wIE9q681O7IeGgAcqGeH8btbkh6abeRA3ZIqDQFZBdDC1RZSaiArSOfm2ZOag3D3IX+
	 TuoWr2eocNY5BhMrlWXjzN8/vgG41GqhJzCIrDw8feZ99dDkdXfR6ZLQRPQjSbwS64b8m
	 UoAy0qdZ6hrvGH3GZD7hIqR5ntT+/glZpjNjN8YfskaKNU/rFos4PLBteFA3iqZyfkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PlnXRgh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21446606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21446606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PlnXRgh
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b6b22be970so16431b3a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795107167; cv=none;
        d=google.com; s=arc-20260327;
        b=RUi+9v9Mssd9NgHW9IdZY7Pc2hvPv/lH7BMPFfGzOdALs4T9MAY27VpvCmZrzkvnLZ
         X2dk3B40II+Nqnyvcf2Kr978CJH8SzWbyjryb3fn6KogRhPkmzYRhGHF7Ss2czipS6oK
         dtzota+kNwL1+ZrSvY7ePDrvoXSkEMTN3ay3T2PLaG5Q214Ap0gs2Piz5XrOh+YhuCB2
         nzamvbCEEZntuNZ89dDsM1jMgRGnkJqFXmWYnEQZm+qR8P/Ad4R+xsrPxC501hQK9Y61
         YNfoDy2w0rV+ZkADreItnBsbc1ZN0vdOzd8BjGao6dk15eTp+sdBu0Jz6hs4WHmN84VZ
         +VPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AlVhwoqPVEfSQ+5fBg8Cjml6CljtON+tEw4OOYgtCl4=;
        fh=wR/ru9rG3jmUfI4ulzbxMYyPVitfwi0rnSw0R1qqmGI=;
        b=KV+NLLiRNU9yinqUtrzm5L5AoJCTpeEEezkru1CtYJOCfSM9iJPEJzmBnOFmVBKgyz
         Mv8PhyQiDRnb2lEkeOoL6TcR6eVcW5PDrxgLdyZ1pfYbvP1QZEoplsanCnCCG7o69uys
         a8AhLw8hF3mYFHSHjmjtDNxUywvzO+zcMFkQnTYXEdzl5WWgUzFzl1wgchxdTkFz/mG1
         BizrlFT8T9eHPHhr0yi+IpbsUHuBCH2FPW1KB4JtGsWnynXQ3mdG+s/AZ4+xjWwklcuj
         iuK3e+gmXeQIkFxjEpVHmAwFhtd7tPtSTm7r8pZq7RZylgKAcDMwCwZ7FvIergROfhrR
         rFSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107167; x=1795711967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AlVhwoqPVEfSQ+5fBg8Cjml6CljtON+tEw4OOYgtCl4=;
        b=0PlnXRghkRlUeFoM4+2Jm3VsmvikbZfKxMDTSeFxjn/0laokhultnNvHR2Rpws5RMj
         +EkLCBkUXxtuXgcJhMD+8iRmvhPtFxJ++ae83fR+J8BEfwC4Fec2tr1p5DP3pIJlNiB0
         Ay+MDJIQAnCdQqnZdBXiNEk5LvbnCd9rzBLACZfks0KioJn/1MdvuSSeJECT8A+m2EOZ
         v/2xEwt+lFu+ikffJBdoIQF7l44IFoQ+3RlZJmizLQd7T1p1WtbWOs7yBcSaeT/Ad0yO
         H9qtSkkFAyz6J4Iye3tv+l8ZwcWp76iIQHYwsZpvF5edGH6UskDm/3p7j3XDBnHdphGz
         KIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107167; x=1795711967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlVhwoqPVEfSQ+5fBg8Cjml6CljtON+tEw4OOYgtCl4=;
        b=fgYGDYsrvlChDl8JNtqvLdH3DgHua0WAewUsLjRsinlpctMlhk4EqAJvfNeo1fj51f
         Ein6a48Opab4GkU8XXXEtGAw/KMF/7XhmJu/dYi7FyHN6z5VDPci44LQIIADlYMJzu5f
         qlt+AbWJlovRccMZeMKzVPoDdxeDwk5qdLRolebVuiH+xCfRZ2aOnshyid/j/3YUTZi6
         yR3642LV3d9Wb/9SE/ct/bhagJ/vq+NqKf9A3e/ogxhsGGi2gmocUblaLfGZf4ysB7en
         7QgMYhv18cv1YvIK726rimnCz5Ogn1p8VhURzDFVHTDiy60RPPr2grmwTHCFhMPlrLoR
         WqSQ==
X-Forwarded-Encrypted: i=1; AL+hErH0+Lc8FzVIfKE6pb9glbc18icg72MW3BummYEaOJv8MXBhdfIcvk7NI+mLj+Rf4eR1UgFdi28=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PUYQ1w/+9OeE3SyeuBp6Uml3ohYztYO3urGhXOtS4gsfr0Fzd
	eIesVsQhUCnk9u0clGWfnizjhOw65tcuJbckcUAB09ztNR7b/Ue19nStXdEKB3xpEf516do3ceh
	OxOvHWEt6WxPBfnMAYD0ZNoMHuUcxOIQ=
X-Gm-Gg: AYBFou0W8AC9ikbSFEHp176z84FOvLt0WSXaDp+Gye/4nOLbgcHPUhKWn6s7oSE+stU
	3RABkkX2MsfZwdqYZ9G13UJaszxl3YB+qs6sZ1VhqeMxzM2fHeC+ECQ6kuGc70W2c8yhjqbF7Pe
	bexinWDbJzxEKRMvNBMFjcmxIfrjOS5sBoTztbTxf4hxYspKVD/e8KRIFlNWl5Nu62DrjXeG2AX
	U1K+tgINMHshbVtsXWrvuXj4PM4p26djOHtz7CY76sGDlBd0w3JZAgtYgZbZoPI8LuhrOX/ZepX
	Y1kjbmqH1DjV2nFhi2LRbEu2FqhsFqZe0b8tu51MMxuoWL5uKUrJd1Q4ZITA1Ub9fw++tEhGI6o
	4gsF/mE7QeJI2mhJ3pIM2GaxVP7wD2DewdDjKcnKLaATYK5thQ216/Anwt9uWBaOS0Bn9hQbtMx
	GUJlDKGcn6THgOF3Sd2eRST4nPkf9+XRWgvADUwK5C1lQETxHNoX16pIpvy6+6J5IfkfGzqQ==
X-Received: by 2002:a05:6a20:a12c:b0:3fa:df6d:7d03 with SMTP id
 adf61e73a8af0-4014a274bf2mr266399637.1.1795107167291; Thu, 19 Nov 2026
 08:52:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116033855.1792036-1-pkfxxxing@gmail.com>
In-Reply-To: <20261116033855.1792036-1-pkfxxxing@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 19 Nov 2026 11:52:35 -0500
X-Gm-Features: AclHuK9-as1wTbFo891kSIKMQHM4dkn9fUoJ_KVP5SHbbz1GNMqfHaZuEpH2C-E
Message-ID: <CADvbK_dO0B156LN_05QRqyo-7wCmCT64BYxbThzXYzJdL6kLBQ@mail.gmail.com>
Subject: Re: [PATCH net v3] sctp: fix use-after-free after association migration
To: Yong Liu <pkfxxxing@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:40=E2=80=AFPM Yong Liu <pkfxxxing@gmail.com> wro=
te:
>
> SCTP timers and ICMP error handling can cache asoc->base.sk before
> locking it. If accept or peeloff migrates the association in between,
> processing under the old socket lock can race with an abort on the new
> socket that frees the association's queues. Transport and association
> references do not keep those queues alive. With mdelay() instrumentation
> widening the race, KASAN reported a slab-use-after-free in
> sctp_chunk_abandoned() from the T3 retransmit path.
>
> Recheck the association's socket after taking its BH lock and defer
> mismatched timer callbacks through the existing retry path. Pass the
> locked socket to the IPv4 and IPv6 ICMP handlers instead of rereading it,
> and treat a mismatch like a busy socket before processing ICMP errors.
>
> Use READ_ONCE() for socket pointer reads in these paths and receive/backl=
og
> processing, paired with WRITE_ONCE() in sctp_assoc_migrate(). Take the ne=
w
> socket reference before publishing it. The cached socket is protected by
> BH context and the endpoint's RCU-deferred sock_put().
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
> ---
> Changes in v3:
> - Update the commit message and subject as requested by Jakub Kicinski.
>
> v2: https://lore.kernel.org/all/20261113032805.1447885-1-pkfxxxing@gmail.=
com/
> Review: https://lore.kernel.org/all/20261115100933.75ae0534@kernel.org/
>
> Changes in v2:
> - Use Yong Liu for the author and Signed-off-by, as requested by Jakub
>   Kicinski.
> - Address Xin Long's review and the Sashiko ICMP finding: pass the locked
>   socket to the IPv4/IPv6 error handlers and their UDP encapsulation
>   callers, and revalidate it before immediate ICMP processing.
> - Use READ_ONCE() for socket pointer reads in sctp_err_lookup(), sctp_rcv=
()
>   and sctp_backlog_rcv().
> - Broaden the subject and commit message to cover the ICMP paths.
>
> v1: https://lore.kernel.org/all/20261110120212.1110283-2-pkfxxxing@gmail.=
com/
>
> Based on b3dfbde62cf1981c4638939c159dfd087b7a72e9 (Linux 7.4.0-rc2).
>
>  net/sctp/associola.c     |  4 ++--
>  net/sctp/input.c         | 32 ++++++++++++++++---------------
>  net/sctp/ipv6.c          | 11 ++++++-----
>  net/sctp/sm_sideeffect.c | 41 ++++++++++++++++++++--------------------
>  4 files changed, 45 insertions(+), 43 deletions(-)
>
> diff --git a/net/sctp/associola.c b/net/sctp/associola.c
> index 4521be3bd8..c5d520c8d7 100644
> --- a/net/sctp/associola.c
> +++ b/net/sctp/associola.c
> @@ -1088,8 +1088,8 @@ void sctp_assoc_migrate(struct sctp_association *as=
soc, struct sock *newsk)
>         sctp_endpoint_hold(assoc->ep);
>
>         /* Get a reference to the new sock.  */
> -       assoc->base.sk =3D newsk;
> -       sock_hold(assoc->base.sk);
> +       sock_hold(newsk);
> +       WRITE_ONCE(assoc->base.sk, newsk);
>
>         /* Add the association to the new endpoint's list of associations=
.  */
>         sctp_endpoint_add_asoc(newsp->ep, assoc);
> diff --git a/net/sctp/input.c b/net/sctp/input.c
> index 9494cfa511..e25c94ad08 100644
> --- a/net/sctp/input.c
> +++ b/net/sctp/input.c
> @@ -169,7 +169,7 @@ int sctp_rcv(struct sk_buff *skb)
>
>         /* Retrieve the common input handling substructure. */
>         rcvr =3D asoc ? &asoc->base : &ep->base;
> -       sk =3D rcvr->sk;
> +       sk =3D READ_ONCE(rcvr->sk);
>
>         /*
>          * RFC 2960, 8.4 - Handle "Out of the blue" Packets.
> @@ -217,7 +217,7 @@ int sctp_rcv(struct sk_buff *skb)
>          */
>         bh_lock_sock(sk);
>
> -       if (sk !=3D rcvr->sk) {
> +       if (sk !=3D READ_ONCE(rcvr->sk)) {
>                 /* Our cached sk is different from the rcvr->sk.  This is
>                  * because migrate()/accept() may have moved the associat=
ion
>                  * to a new socket and released all the sockets.  So now =
we
> @@ -226,7 +226,7 @@ int sctp_rcv(struct sk_buff *skb)
>                  * of the current sk.
>                  */
>                 bh_unlock_sock(sk);
> -               sk =3D rcvr->sk;
> +               sk =3D READ_ONCE(rcvr->sk);
>                 bh_lock_sock(sk);
>         }
>
> @@ -292,7 +292,7 @@ int sctp_backlog_rcv(struct sock *sk, struct sk_buff =
*skb)
>                 goto done;
>         }
>
> -       if (unlikely(rcvr->sk !=3D sk)) {
> +       if (unlikely(READ_ONCE(rcvr->sk) !=3D sk)) {
>                 /* In this case, the association moved from one socket to
>                  * another.  We are currently sitting on the backlog of t=
he
>                  * old socket, so we need to move.
> @@ -304,7 +304,7 @@ int sctp_backlog_rcv(struct sock *sk, struct sk_buff =
*skb)
>                  * Otherwise, we can safely push the chunk on the inqueue=
.
>                  */
>
> -               sk =3D rcvr->sk;
> +               sk =3D READ_ONCE(rcvr->sk);
>                 local_bh_disable();
>                 bh_lock_sock(sk);
>
> @@ -377,7 +377,7 @@ void sctp_icmp_frag_needed(struct sock *sk, struct sc=
tp_association *asoc,
>              t->pl.probe_size + sctp_transport_pl_hlen(t) <=3D pmtu))
>                 return;

As the clashiko [1] reported, there's asoc->base.sk access in
sctp_transport_pl_hlen(), You can delete the !t check (t can't be NULL),
and move the rest check to sctp_transport_update_pmtu(), which is called
under sock lock, like:

        pmtu =3D SCTP_TRUNC4(pmtu);

+       if (t->pathmtu <=3D pmtu &&
+           t->pl.probe_size + sctp_transport_pl_hlen(t) <=3D pmtu)
+               return false;
+

As for sctp_addrs_lookup_transport() in the report, I think you need
to do something like:

-               bound_dev_if =3D READ_ONCE(t->asoc->base.sk->sk_bound_dev_i=
f);
-               if (sctp_sk_bound_dev_eq(net, bound_dev_if, dif, sdif) &&
+               sk =3D READ_ONCE(t->asoc->base.sk);
+               if (sctp_sk_bound_dev_eq(net,
READ_ONCE(sk->sk_bound_dev_if), dif, sdif) &&
                    sctp_bind_addr_match(&t->asoc->base.bind_addr,
-                                        laddr, sctp_sk(t->asoc->base.sk)))
+                                        laddr, sctp_sk(sk)))
                        return t;

>
> -       if (sock_owned_by_user(sk)) {
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
>                 atomic_set(&t->mtu_info, pmtu);
>                 asoc->pmtu_pending =3D 1;
>                 t->pmtu_pending =3D 1;
> @@ -410,7 +410,8 @@ void sctp_icmp_redirect(struct sock *sk, struct sctp_=
transport *t,
>  {
>         struct dst_entry *dst;
>
> -       if (sock_owned_by_user(sk) || !t)
> +       if (sock_owned_by_user(sk) || !t ||
> +           sk !=3D READ_ONCE(t->asoc->base.sk))

This '!t' check can be deleted, as the t passed to
sctp_icmp_redirect() can never be NULL.

>                 return;
>         dst =3D sctp_transport_dst_check(t);
>         if (dst)
> @@ -432,7 +433,7 @@ void sctp_icmp_proto_unreachable(struct sock *sk,
>                            struct sctp_association *asoc,
>                            struct sctp_transport *t)
>  {
> -       if (sock_owned_by_user(sk)) {
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk)) {
>                 if (timer_pending(&t->proto_unreach_timer))
>                         return;
>                 else {
> @@ -492,7 +493,7 @@ struct sock *sctp_err_lookup(struct net *net, int fam=
ily, struct sk_buff *skb,
>         if (!asoc)
>                 return NULL;
>
> -       sk =3D asoc->base.sk;
> +       sk =3D READ_ONCE(asoc->base.sk);
>
>         /* RFC 4960, Appendix C. ICMP Handling
>          *
> @@ -526,7 +527,7 @@ struct sock *sctp_err_lookup(struct net *net, int fam=
ily, struct sk_buff *skb,
>         /* If too many ICMPs get dropped on busy
>          * servers this needs to be solved differently.
>          */
> -       if (sock_owned_by_user(sk))
> +       if (sock_owned_by_user(sk) || sk !=3D READ_ONCE(asoc->base.sk))
>                 __NET_INC_STATS(net, LINUX_MIB_LOCKDROPPEDICMPS);
>
>         *app =3D asoc;
> @@ -546,11 +547,11 @@ void sctp_err_finish(struct sock *sk, struct sctp_t=
ransport *t)
>         sctp_transport_put(t);
>  }
>
> -static void sctp_v4_err_handle(struct sctp_transport *t, struct sk_buff =
*skb,
> +static void sctp_v4_err_handle(struct sock *sk, struct sctp_transport *t=
,
> +                              struct sk_buff *skb,
>                                __u8 type, __u8 code, __u32 info)
>  {
>         struct sctp_association *asoc =3D t->asoc;
> -       struct sock *sk =3D asoc->base.sk;
>         int err =3D 0;
>
>         switch (type) {
> @@ -582,7 +583,8 @@ static void sctp_v4_err_handle(struct sctp_transport =
*t, struct sk_buff *skb,
>         default:
>                 return;
>         }
> -       if (!sock_owned_by_user(sk) && inet_test_bit(RECVERR, sk)) {
> +       if (!sock_owned_by_user(sk) && sk =3D=3D READ_ONCE(asoc->base.sk)=
 &&
> +           inet_test_bit(RECVERR, sk)) {
>                 sk->sk_err =3D err;
>                 sk_error_report(sk);
>         } else {  /* Only an error on timeout */

As the clashiko [1] reported, this 'else' need to become:

} else if (sk =3D=3D READ_ONCE(asoc->base.sk)) {

> @@ -630,7 +632,7 @@ int sctp_v4_err(struct sk_buff *skb, __u32 info)
>                 return -ENOENT;
>         }
>
> -       sctp_v4_err_handle(transport, skb, type, code, info);
> +       sctp_v4_err_handle(sk, transport, skb, type, code, info);
>         sctp_err_finish(sk, transport);
>
>         return 0;
> @@ -660,7 +662,7 @@ int sctp_udp_v4_err(struct sock *sk, struct sk_buff *=
skb)
>         }
>         if (hdr->type =3D=3D ICMP_DEST_UNREACH && hdr->code =3D=3D ICMP_F=
RAG_NEEDED)
>                 info =3D ntohs(hdr->un.frag.mtu);
> -       sctp_v4_err_handle(t, skb, hdr->type, hdr->code, info);
> +       sctp_v4_err_handle(sk, t, skb, hdr->type, hdr->code, info);
>
>         sctp_err_finish(sk, t);
>         return 1;
> diff --git a/net/sctp/ipv6.c b/net/sctp/ipv6.c
> index 97390569c4..f96e79ca7f 100644
> --- a/net/sctp/ipv6.c
> +++ b/net/sctp/ipv6.c
> @@ -123,11 +123,11 @@ static struct notifier_block sctp_inet6addr_notifie=
r =3D {
>         .notifier_call =3D sctp_inet6addr_event,
>  };
>
> -static void sctp_v6_err_handle(struct sctp_transport *t, struct sk_buff =
*skb,
> +static void sctp_v6_err_handle(struct sock *sk, struct sctp_transport *t=
,
> +                              struct sk_buff *skb,
>                                __u8 type, __u8 code, __u32 info)
>  {
>         struct sctp_association *asoc =3D t->asoc;
> -       struct sock *sk =3D asoc->base.sk;
>         int err =3D 0;
>
>         switch (type) {
> @@ -149,7 +149,8 @@ static void sctp_v6_err_handle(struct sctp_transport =
*t, struct sk_buff *skb,
>         }
>
>         icmpv6_err_convert(type, code, &err);
> -       if (!sock_owned_by_user(sk) && inet6_test_bit(RECVERR6, sk)) {
> +       if (!sock_owned_by_user(sk) && sk =3D=3D READ_ONCE(asoc->base.sk)=
 &&
> +           inet6_test_bit(RECVERR6, sk)) {
>                 sk->sk_err =3D err;
>                 sk_error_report(sk);
>         } else {

Same here, change to:

} else if (sk =3D=3D READ_ONCE(asoc->base.sk)) {

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116033855.1792=
036-1-pkfxxxing%40gmail.com

Thanks.
