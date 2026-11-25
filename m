Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623090;
	b=Q7tKJEmohmkhIuR8aT1jLquxdd2jBhg7Nd9Kk04XKrneggBKgfLZXI3X54Bm/QK2UPMH
	 VhM340APEnnlRQb45eB8K7PEH2F+gUxh0A1s0duwAyngNDCJnigVs97rUVjy331+dsNXH
	 o4fpRel3LT1xzFihTr0SvbKhRtUvn4zjzxIq5bKRxFeKooT/u0MzK9hCdcmzpgC48F+l5
	 ShLc5YfIN6Dnm6T8DBAMbplqKMQblzs2KY2NcF+S+rUoWGMSKEHX83jWSVibAUgNeZr2W
	 SIiPiH7Am8861At3k8rqs9ZeDu+fz1UIy9PA4CVSoXXMe0KkOolRRqmLd3r8B+3MhEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
	b=crhUHDu1zwVT+0w5vL60jeZ133fLV38wvvBodRyTdfqd12M3j76LSmNuF4dTrecd5iaN
	 ZihVCOFshs718UJkNDVWVLbjHdAyG8Q8pLC0W365g4dwGBOBhlajYO1gZiF16xfy0j+dF
	 b/05iSKnZ8wAbdNXFFnZkoRG4d8H82EPgBRHXvzuSrddFloMOFOQyKZun3CnJMBSXkCUL
	 V8EnTREaI4c8kkGXvLhfSrqi1ZdzY5+9/zZvjuKnnOuxece2pbVZFRUjZh143mYCvsdeX
	 4fGSoZVpIWOMhx9CM9d+SxtnTE4mKo29ADIYe8LWxo5G4SeowgT82jl4C/kiniwH/QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NODj3lVf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A33D606A331
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A33D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NODj3lVf
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so3623644b3a.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623089; cv=none;
        d=google.com; s=arc-20260327;
        b=RbDmukmSm79N9YddAtzNWUuR0UaJhfMN9c6lMRiwzrroph9UHZBTtqUOSLDlH6QL93
         88dua5EPGL99hGh0g32roPJ6ki4W18f1+7n2GiTbgh0I5Y+SbM4fxu5ojzvV9Gc8d4KK
         1G96QpPheJx7cS1FFR9rky8ND2lndELYx7aIWzBUCThqWgPYgWzqMe9m30M8WAUFDvzE
         SKGPGdeKytOITJ+gqyDNUf2XEDLnrPyeTaEArf/9wF4+rNqnxP2ahCsB3ucMqmZbOq2z
         uqgQ38h1Q0+4YLCrIH0li9u/7FxxlCJ9gGrIylhDRmxxTltWcOuyWcdeQIw5myfBK4gb
         htVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
        fh=Q44qy7rVmEssU9q4ascC//HzX7jl2aqKOhPuYMvWMzg=;
        b=R4Z84L4bf/jiiqoct07X8jQsMtYmEdb+NLSxtmlhlra1QCBEtb85iVUCZ2OXUiZEGh
         N/ktxc0vFdIYgVd+GpDDGGQqC3WSD83zP4Kh3LZ80EY0Gz7zwf5/MyOmDJLOd188BSKG
         Jq9HwzxGBCCQTBwkxuFhAehFdTXvtxkgP7OQeEWzH6LszZ/cOl2R+WAtUxUFENLgf5dG
         TQDPJT/V2teMzZgy5mShLAIJQmPjY7MffqneiM8qVXroS2gsLANHQSE9KhhhH7DghvqU
         8jq9zVwJ5llYrZpxdaoXJWbO2VrwEgx3OxNED8mLWI8NRWMjF41vN7fIiFR91djpqZY/
         wSHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623089; x=1796227889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
        b=NODj3lVf27NLa5PNBNlwhqOy7RD3x4UNdg2eJVTWlAp8lXO71qHafHTQMqdrrrssA7
         Q2SyGZSNrDV0wFNdADu9X6eG20gokyyDnWgPl0Zy43Rumm1ZyNdUc4vVNMiBLUOiUwIr
         6bn4CkZ/kiHORV8fjvHT9sfPHU5PKMdTUmXBltIXxjW1HYed4yuLd9xPpuoQyJpR1skE
         JRdxEN+jAnkLJWxKFiFW4GDDfWu7uOVE9Kc/eCpTTBFZv9UDvGkGObljvZp2IvlVnyz5
         5ndBJTziiNIbzbFFa8Dl7qhco1Nnv7pb98JsaSUFCu8d9uTxgsDibqZ03V3Nmbl4seHO
         6oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623089; x=1796227889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqeM9bcRy4K57cIOrdP0ZMwShWjCWd1IsL+uvjRPcsI=;
        b=s4Pye7k/DRUjTFA2v/iWaZPNNShrro6BNELUT7O18cIUb2grmObVF/y6DQs3WA+I/e
         Dw8X6D0RsyJdQDeBuYswlKhOa+e81n4UV/JDIsWrdnyEXf7es6/LdET5ej5vR/OOFxsN
         RJc2Ykq7hB52P8opmkdkzTsMDE4/JupJF1N5jcN6wHeI5Ji+c+qLPTahhs+lumf99Rcz
         PQ7DVVRjJpnsEUHZnuMdvgtsCAStkcc/7bJjhrNsKtulFQj4yzyI1nv8VOp4wz8nh4dC
         Fo7kAZpVVhoCorYRzrRZqynMw75fNrm991djzDsmwYRvTHh8br5kb/uVALj0FG+ZMwgS
         GMcw==
X-Gm-Message-State: APuU4Z93SzibR04UnQk0CYTY1TkIl5kbPP/tLwYmVlYkjfh4sXM2hsnO
	7ZpgfIkhN6JZQCWKhs0vxWj/Q4ycCY97eW63j9dwaoFS4STlgzRP3OHSg2/oLiurORN2niDlymG
	JZjwVgxXnFqzpGCJXdO697SXIvCxYxqA=
X-Gm-Gg: AZFdTZeWG5sI2a4XxffVG9xaQMKbeRgtfufOvcw1kjxCx4pYzxUe/87BW9QXPjDLUWT
	jyifKLFSVFFtGLBLnmP3Q3ihMgrfkHNiJ97ohT0cYT5aucbfrLwfTkyWY+sQcps01ajbJZtAqos
	hkrU7O6+OKLJU535yQGlyYvsjjJF3fnc3qLTmCx8fR9S49uJly+8Y8s+2SU5OcMN+0C7t4NWgnY
	YCRX33h1Ye8SsEWYaMajMMZdkSvinW0n2db3C5IdBEliUam/0mSWHNcHwdNZYr6yti8XvmnRhIC
	MKGylp8ns/9t4z8kOCtb41GVGUJKgXvI+QYs1DIajtNWIlsfy7g2oSZ+mUMeduHKGb1MD9+q5En
	1PNU1+4Xjph1CHHmZinpn+ZCwJ1slDn2p2m5UTb0H+OiqAM/DsDq91vIjR+lCmg6X6pTUBy84I+
	3aw6XK+o6XkC54g7pQdJrvuA06J/WHhds79UlbAlj6z+ZtsVppfoNq1MYXOT9YToYXB0uK10T4w
	4uzvijWKktodv1oJA==
X-Received: by 2002:a05:6a00:84d:b0:883:4a94:8132 with SMTP id
 d2e1a72fcca58-8c7dd9d6a17mr12973536b3a.20.1795623089256; Wed, 25 Nov 2026
 08:11:29 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6a6d9da5d2d7ae5dfd1a6cdcd409326023fc7c2c.1795393691.git.lucien.xin@gmail.com>
 <179548327574.3135.6574572531783833085@kernel.org>
In-Reply-To: <179548327574.3135.6574572531783833085@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:11:17 -0500
X-Gm-Features: Aa3M54o1KhSLEBbvf_IuXRh_AZAPAxe2wdTrfHcpNM5mGPKS186BqyC7tIAvBxU
Message-ID: <CADvbK_cacMFPHz3hAqXcY92C2yAzq=+ajxZYZL_RQrYmY5Ft9Q@mail.gmail.com>
Subject: Re: [PATCH net-next v19 08/15] quic: add path management
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In net/quic/path.c, quic_path_bind() decides whether a path
>   may take a port by looking at the credentials of the task that happens=
=E2=80=A6
> - [Medium] quic_path_bind() binds a real UDP port (explicit or ephemeral)
>   on behalf of the caller via quic_udp_sock_create() ->=E2=80=A6
> - [Low] The comment on quic_path_detect_alt() in net/quic/path.c does not
>   describe what the function does.
> - [Low] Two PLPMTUD field comments in struct quic_path_group
>   (net/quic/path.h) do not match how path.c uses the fields.
>
> --
>
> quic: add path management
>
> This patch adds struct quic_path_group to manage the active and alternate
> QUIC paths. Each path is backed by a refcounted UDP tunnel socket wrapper
> (quic_udp_sock) kept in a global hash table, with helpers to bind, unbind=
,
> swap and detect alternate paths for connection migration. It also adds a
> basic PLPMTUD state machine that is driven by probe sends, ACKs and ICMP
> feedback.
>
> > diff --git a/net/quic/path.c b/net/quic/path.c
> > new file mode 100644
> > index 0000000000000..946f5e44b6350
> > --- /dev/null
> > +++ b/net/quic/path.c
> > @@ -0,0 +1,608 @@
>
> [ ... ]
>
> > +static struct quic_udp_sock *quic_udp_sock_create(struct sock *sk,
> > +                                               union quic_addr *a)
> > +{
>
> [ ... ]
>
> > +     us =3D kmalloc_obj(*us);
> > +     if (!us)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     quic_udp_conf_init(sk, &udp_conf, a);
> > +     err =3D udp_sock_create(net, &udp_conf, &sock);
>
> [Severity: Medium]
> Can this let a confined, unprivileged process bind UDP ports that its LSM
> policy does not allow?
>
> udp_sock_create() goes through udp_sock_create4()/udp_sock_create6(), whi=
ch
> call sock_create_kern() and then kernel_bind():
>
> net/ipv4/udp_tunnel_core.c:udp_sock_create4() {
>     ...
>         err =3D sock_create_kern(net, AF_INET, SOCK_DGRAM, 0, &sock);
>     ...
>         err =3D kernel_bind(sock, (struct sockaddr_unsized *)&udp_addr,
>                           sizeof(udp_addr));
>     ...
> }
>
> kernel_bind() in net/socket.c calls sock->ops->bind() directly. That mean=
s
> security_socket_bind() never runs for the UDP socket that actually holds
> the port.
>
> The socket is also created with kern=3D1, so it gets a kernel label inste=
ad
> of the caller's. The user socket create hooks (LSM and cgroup-BPF inet so=
ck
> create) are skipped as well.
>
> The only remaining bind check is on the QUIC socket. SELinux classes an
> IPPROTO_QUIC socket as rawip_socket, and sel_netport_sid() with
> sk_protocol =3D=3D IPPROTO_QUIC does not match any udp port labels.
>
> As a result, the port bound here is not covered by udp_socket
> name_bind/node_bind rules with per-port labels, or by Smack/AppArmor netw=
ork
> rules. Per-packet LSM checks and netfilter socket-owner matching would al=
so
> see a kernel socket rather than the user.
>
> Other UDP tunnel users either require CAP_NET_ADMIN (vxlan, geneve, fou,
> tipc) or take the port from an admin sysctl (SCTP over UDP). Here an
> unprivileged user picks the port. The CAP_NET_BIND_SERVICE and uid checks=
 in
> quic_path_bind() do not mediate the UDP bind itself.
>
> quic_path_bind() has no callers yet in this series. quic_bind() and
> quic_connect() arrive in the next patchset, so the user-reachable path
> can't be confirmed here.
>
> Does the UDP tunnel bind need some form of LSM mediation before the port =
is
> bound on the caller's behalf?
>
False.

QUIC does not implement LSM hooks yet. The UDP tunnel socket is an internal
kernel transport detail, same pattern as SCTP's UDP encapsulation. LSM
mediation will apply to user-facing QUIC sockets, not the internal tunnel.

> [ ... ]
>
> > +/* Binds a QUIC path to a local port and sets up a UDP socket. */
> > +int quic_path_bind(struct sock *sk, struct quic_path_group *paths, u8 =
path)
> > +{
>
> [ ... ]
>
> > +     port =3D ntohs(a->v4.sin_port);
> > +     if (port) {
> > +             if (inet_port_requires_bind_service(net, port) &&
> > +                 !ns_capable(net->user_ns, CAP_NET_BIND_SERVICE))
> > +                     return -EACCES;
> > +             head =3D quic_udp_sock_head(net, port);
> > +             mutex_lock(&head->lock);
> > +             us =3D quic_udp_sock_lookup(sk, a, port);
> > +             if (us) {
> > +                     if (!uid_eq(current_fsuid(), sk_uid(us->sk))) {
> > +                             mutex_unlock(&head->lock);
> > +                             return -EADDRINUSE;
> > +                     }
>
> [Severity: Medium]
> Is it intended that both checks here use the credentials of the task that
> calls quic_path_bind(), rather than the QUIC socket's own credentials?
>
> The ns_capable(CAP_NET_BIND_SERVICE) check runs before the lookup. So it
> also applies when an existing tunnel socket is only being reused and
> refcounted.
>
> The reuse branch then compares current_fsuid() with sk_uid(us->sk). That
> value is the fsuid of whoever first created the kernel tunnel socket.
>
> For comparison, the SO_REUSEPORT model in inet_csk_bind_conflict() and
> udp_lib_get_port() compares the new socket's sk_uid with the existing
> socket's sk_uid.
>
> Consider a server that binds port 443 as root and then drops privileges. =
A
> later explicit-port quic_path_bind() for 443, for example for an accepted
> child socket or a migration path, would get -EACCES (capability gone) or
> -EADDRINUSE (fsuid changed). Is that the expected result?
>
> Likewise, a QUIC socket passed to another process via SCM_RIGHTS would be
> judged by the receiver's credentials. A kernel thread caller would pass
> both checks no matter who owns the socket.
>
> The commit message and the code comments don't describe this model. The
> only mention is the v15 changelog line. quic_path_bind() has no callers i=
n
> this series, so whether a reuse bind can follow a privilege drop depends =
on
> the next patchset.
>
> Would comparing sk_uid(sk) against sk_uid(us->sk), or at least documentin=
g
> the intended model, make sense here?
>
False.

The CAP_NET_BIND_SERVICE check uses current task credentials, consistent
with how inet_bind() works. The fsuid comparison on tunnel reuse prevents
cross-user hijacking. In the accept path, the same process that created the
tunnel is accepting, so the fsuid matches. A server that drops privileges
after bind would not re-bind, and it reuses the existing tunnel created
before the drop.

> [ ... ]
>
> > +/* Detects and records a potential alternate path.
> > + *
> > + * If the new source or destination address differs from the active pa=
th, and
> > + * alternate path detection is not disabled, the function updates the =
alternate
> > + * path slot (path[1]) with the new addresses.
> > + *
> > + * This is typically called on packet receive to detect new possible n=
etwork
> > + * paths (e.g., NAT rebinding, mobility).
> > + *
> > + * Returns true if the alternate path (path[1]) matches (sa, da), rega=
rdless
> > + * of whether it was newly detected or already present. Returns false =
if the
> > + * addresses don't match the alternate path.
> > + */
> > +bool quic_path_detect_alt(struct quic_path_group *paths, union quic_ad=
dr *sa,
> > +                       union quic_addr *da, struct sock *sk)
> > +{
>
> [ ... ]
>
> > +     if (!quic_path_saddr(paths, 1)->v4.sin_port)
> > +             quic_path_set_saddr(paths, 1, sa);
> > +
> > +     if (!quic_cmp_sk_addr(sk, quic_path_saddr(paths, 1), sa))
> > +             return false;
> > +
> > +     if (!quic_path_daddr(paths, 1)->v4.sin_port)
> > +             quic_path_set_daddr(paths, 1, da);
> > +
> > +     return quic_cmp_sk_addr(sk, quic_path_daddr(paths, 1), da);
> > +}
>
> [Severity: Low]
> This isn't a bug, but the comment doesn't match the code. It says path[1]
> is updated with the new addresses, but path[1] is never overwritten. Only=
 a
> saddr or daddr whose port is 0 gets filled in.
>
> The function can also modify path[1] and still return false. Suppose
> path[1].saddr is empty but path[1].daddr already holds a different peer
> address. Then path[1].saddr is set to sa, the daddr comparison fails, and
> the function returns false.
>
> That leaves path[1] with the new source paired with the old destination,
> which matches neither candidate. The "Returns false if the addresses don'=
t
> match the alternate path" text implies the false case has no side effects=
.
>
> Within this patch, path[1].daddr is only set by quic_path_detect_alt()
> itself (saddr first) or by quic_path_swap(). quic_path_unbind() clears bo=
th
> fields together, so this half-written state may not be reachable yet.
>
> Could the comment describe the fill-only-empty-fields behaviour and the
> possible partial update on a false return?
>
> [ ... ]
>
> > diff --git a/net/quic/path.h b/net/quic/path.h
> > new file mode 100644
> > index 0000000000000..c2537cf65a7d4
> > --- /dev/null
> > +++ b/net/quic/path.h
> > @@ -0,0 +1,191 @@
>
> [ ... ]
>
> > +     /* MTU discovery handling */
> > +     struct { /* PLPMTUD probing (rfc8899) */
> > +             s64 number; /* Packet number used for current probe */
> > +             u16 pmtu;   /* Confirmed path MTU */
> > +
> > +             u16 probe_size; /* Current probe packet size */
> > +             u16 probe_high; /* Highest failed probe size */
> > +             u8 probe_count; /* Retry count for current probe_size */
>
> [Severity: Low]
> This isn't a bug, but these two field comments don't match how path.c use=
s
> the fields.
>
> probe_high is also set when no probe has failed. In SEARCH state,
> quic_path_pl_recv() does this once probe_size reaches the 9000 byte cap:
>
>         paths->pl.probe_high =3D QUIC_MAX_PLPMTU;
>
> so the field works as an upper search bound, not only as a failed size.
>
> probe_count is incremented on every quic_path_pl_send() call, including t=
he
> first probe of a new size:
>
>         paths->pl.probe_count++;
>
> so the probe_count < QUIC_MAX_PROBES check counts total probes sent for t=
he
> current size, not retries.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
