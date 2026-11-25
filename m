Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625084;
	b=Szl96HhWBbMueUkS2WQQcv54icC6W4GaS/txE0WwpMeFd5VguOy/oYtCUND9lKkGpXPe
	 RzLHK6Arov070eyqovYBGgrZzof0FV1MMldFdoQnjwQh7SL+IiHwGpY526UAKFkX+gEd7
	 OHmCFJBgxAZgPoaLiVK0eXngApi0S53NxkH+x2kFBNZwV9jw2hlyQ03BgVItQaDlu8t9j
	 4msVZ13qM8x6sg/RkfjCFHBMblVzaSOWYXZrPg0T8wGN2QVke61TxyV61Wq8xZqidn4MT
	 M4SrKEiDEuocTRo6c9ATEeyBNCQhUmfS0HpxMNfV8dJLcOVtpmXJwcUt2JLSZlDwMTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
	b=UTrvnXLXZZsFdLCuJlX0ydgm/h7vkMLnc0jUbuPovencYYwGTpDPk3RjX8mMf61fkwS0
	 y5VygN3v26EDm6G9m9g1Vwt+EofgeN/XRtyYxWICSq7U311LbBC/uc/1KAa0Ziicjsny+
	 PGYZ2fn9NTYAZhPwGkWuyT9TKEi4E15rQElQ4X4F12brZuXPryvBkHW1VkalzjT/6y54C
	 hW0R8kGUYbHo7dBEJhuOyAjxnXo7i80xXDmERKGpWS8+W/J0GjQxFF1f9sIBmKmc9skQf
	 Sok0V1epfObdQlamgbVj4d7sFafjyxUZpm7j6h17yZPXmZvMjwkuSuW2FY4Z1iOyzYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nTpR210/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3158D606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3158D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTpR210/
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2124153b3a.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625082; cv=none;
        d=google.com; s=arc-20260327;
        b=LhFewPXKnK9s0LscEkhBTb7bhkrjuCWFndFDltfw/WBYUIN1yIXxn8cvCptMP7uPkF
         iCoF9mluuGjOK1abwNr5WqZ8SIWZVzITAvQ94vXQk4MQeZxpsp3GR6kve7gaP3wS2rrO
         bKAXHm6kQaz8QpJbUGy98sIeoo4/nxhvHO0DpNKpv1YUDaSC+e8CUm20/jrg3cMeMf2e
         hWWjh2gXRauO0NldtfNCQGFXFkKyaeXnZmfhjQo7pqOdaDaIz8KRyOenMLtZWxMYDqCp
         Ztnx27M0Cocyi2Ny1vXVQZPtlRfEFaExL9+en3dIEyLHkr75w5J6rutRdXDNBB81l3qh
         7D4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        fh=Q44qy7rVmEssU9q4ascC//HzX7jl2aqKOhPuYMvWMzg=;
        b=kjz498FZ279gvpWDhfvCMoBZ/Ov0pbvB0zAa1BKAfzKvfMlQKIE7YF66Ab4y04hJ/B
         Ex47c4ShMES5UR4Vmc/nrzIJSvBWApu8aL5DeLc9Ajz7VvFGl/k/GAuGFwygqOYwS6eM
         nUhS5jZD+uAaZ1REN5yhcJYwCZ68QS1/iwqNbDhwXK7EjJUtbMmOsKktQ56Z3iogZD35
         WDOZVWvAz28rHwW8bBhLR5k8IcgNz4MRb6LT8xL+5dTMAHg80gDuW1Z1kLrEhJLP0yC0
         iWX99C4PjUsFSEkcVtU0VG8fcWa6oMtPDm5DeKFCPNIVGgNc+ie89LZfNbmkOBicu/gk
         jY3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625082; x=1796229882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        b=nTpR210/7WPhItYFJ3rIvBCK7DgJA6FunfHRYgyCiMiTQKIuFslN2+oqlT6dl7XsaP
         svAAdzVR3fKYhs9mZzRgXgH+SM3y/9q5qjtrl+UFPev0RmVuXohlQ/2taCJa+AHxDbzx
         JXk5SSupM6YK6KxXFaZ6qTmS/K7k36+44GnOimPnGvE8Pcqzz4Ju/6Ump10E8LA2AkUa
         yK28/CRfe4dP74p8lPwzgX78W7xRyO2ZY4iF/uvLLhRIPKW/1MgKvwa//ZJwNE9RvVaB
         dXdRV2ZyCS5LYTQ4Ns/VzfcYEtWTvCsV8ybkkRbGD39jXm6mXllHN6Tkb+hn3rjzk+SJ
         OAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625082; x=1796229882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqQCnrL/aKCm/C9vlxA9BxjPZ3u2dEkyObqv4aLYECU=;
        b=Xq8AXH7Q2DqfUyqwY8xlFt2qK2Ee4JSPINRJaVcmP3xbmw5QGvWk9XELXZqa6k+msO
         WMsIza3RPruKKXxBvQcoYKwuAwkYS1Vegwm5wraBNAbcknH9AaW7qMdUd8hmFt2FaA8X
         MTni6EuWecu4weGogWfC7J8fOa/+2oG5k+p7t6Mm1Bhu1glvO2Qaau4DDZVS7NitNI+V
         44h4McxyhdyrRfizfN7Y5vjQ12iCKSXSiDq4wiEIU+Y/yxXKK3pPl6Vc14CdPtV/2sJU
         xiJjaa0wyBj2BDP4atrFYmykovHfgcKwOMQ9K3bpp7wY6u4BH5q8sgg/VgTqcomHY7GZ
         NonQ==
X-Gm-Message-State: APuU4Z+iUDjOPzcSWIhgEhSeEufZsEBi8lF2I8wnP48YkZHfzxZcSb13
	EXPtj6p8cqMSOBDVy0cwru5g4luoar6VFh0IzOVTLeCU1X2zMeP+4LGoVFobljFwBiFTlPST0zO
	hACg4/oICmDNqc2nMMd7JaZQ1U6tznsc=
X-Gm-Gg: AZFdTZcFWWXZMI7TtAf/SYMwjlYmPka+HQpDyuzpUsRILJ5OouQf3nKj8wlG9BshnMG
	0h68z7DysTpCt0P8dHHn4hkK7yam7d6tz01JT7oEXLK/hDbpAI76XZY1Vtco//w0EELTI3jbsVu
	VJYi/RD6o3mGPa6fau3qKZMBHrwpRAM/RWhig+k+kbkBU/9KdR7XxVp6ZMIsYuchcyS89AGyPzU
	Yvx2CV3iZGO/q1LPoXnq3yAirw5R74bfXe85zjLXKDUjkYZ0lAnVmtrVSGFk/4XIEfAEwUyqSwk
	CiEcFtcSXLXSANvxkTXxzivkQN1s5hwPcmedacKaZJ2fyMJMV2zDmlRcohGGcjt4n47JSlXov3j
	pDNhqmCwVO+0Q2OWSOIpED+/kIsAmYLG8pS4AxE470p9YZKW/HcL7PplUULdsHzvrRBY8tUst87
	+8SEiRbtEtr0yMgf3gy83Lny2b0x2/8SCdxU14UKE86DVdqjouzMTx+CoMi4l/qGCqvuHn
X-Received: by 2002:a05:6a00:17a3:b0:881:cbb0:6a90 with SMTP id
 d2e1a72fcca58-8c87d80b24bmr16495257b3a.58.1795625082380; Wed, 25 Nov 2026
 08:44:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <e33f69fbe24e60c4f624c08279553be2888558ff.1795393691.git.lucien.xin@gmail.com>
 <179548326686.3135.1885327270671072036@kernel.org>
In-Reply-To: <179548326686.3135.1885327270671072036@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:44:30 -0500
X-Gm-Features: Aa3M54rwA_4B_Qvf2uz_eVnjuVavXWhSvilNzKm8mtiFvEJGwuVKtS7cR4uh2Fw
Message-ID: <CADvbK_dW3LHZq1b0Y7pbWBbi1BikLyajruJ=iJz25sp_nkXdAA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 04/15] quic: provide family ops for address
 and protocol
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
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_flow_route() in net/quic/family.c returns -EINVAL
>   whenever `sa->sa.sa_family` is non-zero and differs from=E2=80=A6
> - [Medium] quic_v4_flow_route() in net/quic/family.c accepts any route
>   returned by ip_route_output_flow() and passes it straight to=E2=80=A6
> - [Medium] When the selected IPv6 source is link-local,
>   quic_v6_flow_route() in net/quic/family.c runs `sa->v6.sin6_scope_id =
=3D=E2=80=A6
> - [Low] The commit message does not mention three user-visible behaviour
>   changes.
>
> --
>
> quic: provide family ops for address and protocol
>
> This patch adds net/quic/family.{c,h} with IPv4/IPv6 helpers for routing,
> transmit, address parsing and comparison, and UDP tunnel socket
> configuration. It also wires quic_inet_getname(), quic_setsockopt() and
> quic_getsockopt() to these helpers.
>
> > quic: provide family ops for address and protocol
> >
> > Introduce QUIC address and protocol family operations to handle IPv4/IP=
v6
> > specifics consistently. The new family.{c,h} provide helpers for routin=
g,
> > skb transmit handling, address parsing and comparison and UDP socket co=
nfig
> > initializing etc.
>
> [Severity: Low]
> This isn't a bug, but the commit message describes only internal helpers.
> The patch also changes user-visible behaviour on QUIC sockets.
>
> quic_inet_getname() used to return -EOPNOTSUPP. It now calls
> quic_get_sk_addr(), so getsockname() and getpeername() return real
> addresses through inet_getname() or inet6_getname().
>
> quic_setsockopt() and quic_getsockopt() used to return -EOPNOTSUPP for an=
y
> level other than SOL_QUIC. They now pass the call to ip_setsockopt() or
> ipv6_setsockopt(), and to ip_getsockopt() or ipv6_getsockopt(). With
> CONFIG_NETFILTER the call can also reach nf_setsockopt() or
> nf_getsockopt(). For unknown levels the error changes from -EOPNOTSUPP to
> -ENOPROTOOPT.
>
> SOL_IP and SOL_IPV6 options set this way change state that the new helper=
s
> read: inet_sk(sk)->tos, uc_ttl, np->tclass, SNDFLOW and ipv6_only_sock().
>
> Could the commit message mention these changes? The subject also still
> says "family ops", but v3 replaced the ops abstraction with if/else
> helpers.
>
> > diff --git a/net/quic/family.c b/net/quic/family.c
> > new file mode 100644
> > index 0000000000000..73f3b955e13c4
> > --- /dev/null
> > +++ b/net/quic/family.c
>
> [ ... ]
>
> > +static int quic_v4_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     security_sk_classify_flow(sk, flowi4_to_flowi_common(fl4));
> > +     rt =3D ip_route_output_flow(sock_net(sk), fl4, sk);
> > +     if (IS_ERR(rt))
> > +             return PTR_ERR(rt);
> > +
> > +     if (quic_v4_is_any_addr(sa)) {
> > +             sa->v4.sin_family =3D AF_INET;
> > +             sa->v4.sin_addr.s_addr =3D fl4->saddr;
> > +     }
> > +     sk_setup_caps(sk, &rt->dst);
>
> [Severity: Medium]
> Should quic_v4_flow_route() reject RTCF_BROADCAST and RTCF_MULTICAST
> routes before caching the dst?
>
> Other IPv4 socket types check rt->rt_flags at this point. For example,
> __ip4_datagram_connect() does:
>
>         if ((rt->rt_flags & RTCF_BROADCAST) && !sock_flag(sk, SOCK_BROADC=
AST)) {
>                 ip_rt_put(rt);
>                 err =3D -EACCES;
>                 goto out;
>         }
>
> raw_sendmsg() has the same check. tcp_v4_connect() returns -ENETUNREACH
> for both RTCF_MULTICAST and RTCF_BROADCAST.
>
> Without such a check, a QUIC socket can cache and send on a broadcast
> route (255.255.255.255 or a subnet-directed broadcast) without
> SO_BROADCAST.
>
> On the server side, the reply destination comes from the source address
> of a received packet. With rp_filter=3D0, the kernel default, a spoofed
> source equal to the local subnet broadcast (e.g. 192.168.1.255) gets past
> ip_route_input_slow() and fib_validate_source().
>
> Would the server's replies then go out as link-layer broadcasts to every
> host on the LAN? That multiplies the 3x anti-amplification budget by the
> number of hosts. A userspace QUIC server on a UDP socket would get -EACCE=
S
> from sendto() in this case.
>
False.

The spoofed broadcast source) is already blocked by the IP layer for
multicast and 255.255.255.255, and by fib_validate_source() for subnet
broadcast on any system with rp_filter >=3D 1. The remaining gap: subnet
broadcast with rp_filter=3D0 is narrow, and the 3x anti-amplification limit
further constrains it. It's a defense-in-depth improvement, not a security
hole.

> > +     return 0;
> > +}
> > +
> > +static int quic_v6_flow_route(struct sock *sk, union quic_addr *da,
> > +                           union quic_addr *sa, struct flowi *fl)
> > +{
>
> [ ... ]
>
> > +     dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, NULL);
> > +     if (IS_ERR(dst))
> > +             return PTR_ERR(dst);
> > +
> > +     if (quic_v6_is_any_addr(sa)) {
> > +             sa->v6.sin6_family =3D AF_INET6;
> > +             sa->v6.sin6_addr =3D fl6->saddr;
> > +             if ((ipv6_addr_type(&fl6->saddr) & IPV6_ADDR_LINKLOCAL))
> > +                     sa->v6.sin6_scope_id =3D dst->dev->ifindex;
>
> [Severity: Medium]
> Is it safe to dereference dst->dev here without rcu_read_lock()?
>
> This code runs in preemptible process context, under lock_sock() through
> quic_packet_route(). A dst reference does not pin the original
> net_device. On unregister, dst_dev_put() does:
>
>         rcu_assign_pointer(dst->dev_rcu, blackhole_netdev);
>         netdev_ref_replace(dev, blackhole_netdev, &dst->dev_tracker,
>                            GFP_ATOMIC);
>
> That drops the reference on the old device. This reader is not inside an
> RCU read-side section, so the synchronize_net() calls during unregister
> do not wait for it.
>
> If the task is preempted after loading dst->dev but before reading
> ->ifindex, can it read freed net_device memory? Even in the harmless
> case, it could store blackhole_netdev's ifindex as the scope ID.
>
> include/net/dst.h provides dst_dev() and dst_dev_rcu() for this.
> sk_setup_caps() on the IPv4 path reads the device through dst_dev_rcu()
> under rcu_read_lock().
>
True.

But the practical risk is low: this code only runs for link-local source
addresses, which is uncommon, and the window between loading dst->dev and
reading ->ifindex is tiny. Even if the race occurs, the most likely outcome
is reading blackhole_netdev->ifindex as the scope ID, incorrect but not a
crash.

There's a similar case in quic_v6_get_pref_addr() in the subsequent
patchset. I can fix both there when adding the function.

Thanks.

> > +     }
> > +     ip6_dst_store(sk, dst, false, false);
> > +     return 0;
> > +}
>
> [ ... ]
>
> > +int quic_flow_route(struct sock *sk, union quic_addr *da, union quic_a=
ddr *sa,
> > +                 struct flowi *fl)
> > +{
> > +     if (sa->sa.sa_family && da->sa.sa_family !=3D sa->sa.sa_family)
> > +             return -EINVAL;
>
> [Severity: Medium]
> Does this check reject a valid dual-stack setup?
>
> An AF_INET6 '::' source (a socket bound to the IPv6 wildcard) with an
> AF_INET destination fails here. quic_v6_cmp_sk_addr() accepts that same
> pairing on receive:
>
>         if (a->sa.sa_family !=3D addr->sa.sa_family) {
>                 if (ipv6_only_sock(sk) || a->sa.sa_family =3D=3D AF_INET)
>                         return false;
>                 return quic_is_any_addr(a);
>         }
>
> So a stored AF_INET6 '::' address matches AF_INET traffic on receive, but
> routing refuses the same combination on transmit.
>
> Suppose the later bind() and connect() code stores a bound [::] source
> as-is. Would a client bound to [::]:port that connects to an IPv4 peer
> then fail in quic_packet_route()->quic_flow_route() with -EINVAL? The v14
> changelog says IPv4-mapped addresses are converted to AF_INET, so the
> peer address would arrive here as AF_INET. Plain UDP allows this on a
> dual-stack socket.
>
> Dropping the check alone would not fix it. quic_v4_flow_route() reads
> sa->v4.sin_addr, which overlays sin6_flowinfo, so an IPv6-wildcard sa
> would need to be treated as IPv4 ANY.
>
> The v15 changelog shows the family mismatch check is intentional. Was the
> dual-stack wildcard case considered?
>
False.

The dual-stack server case works correctly. accept sockets and stateless
reply paths use addresses from the received packet, which are already
family-matched. The only affected case is a client explicitly binding to
[::] then connecting to a bare IPv4 address, which is uncommon. clients
typically either auto-bind or use IPv4-mapped addresses. We can address
this in a follow-up if needed.

> > +
> > +     return quic_af_ipv4(da) ? quic_v4_flow_route(sk, da, sa, fl) :
> > +                               quic_v6_flow_route(sk, da, sa, fl);
> > +}
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
