Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730031;
	b=VmauTrwOV52kTuzU9Eu6rw0EbWHs+1DAEF5dwuw1j/qkmAz/COT4BwHT3KJ1eHUg8r1j
	 L3+PyGh/9YzjFXMnpMttkJE7b1W0KJVVdfyduecbR/X2rCk98h5LgiwSfDrdOuNOyUyMO
	 jM9CRZb20D4P7PTobdCClbmaCJaYaTf1ZbHeDecdSRn75YQlermep27dStD1uKdDWCmkB
	 Mu5qxagvSEp2FiiC0pT9n6i8zhwFBNpt7vWsuHDmCtaJrMPGfsKdsKMbYnG3wu8E88McP
	 KjR4aD6UJEYIAfnqvUwFy0tCT7+IU8IPQ4FGw8DQq4/xTgzfgtwseeO8ECqysQvxoUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730031;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6t/Kx7UaKW7/Qr0VbeTYmLdhaCkixqabZeLvmPY0ib0=;
	b=TkVmJQ5sxUq9V7mhgCS6SRUqsSYgItBI030w+gfkKbkKldDbI3HxARpcTl6IiX9hSPYS
	 vqCECAeNKtrwVfJv31EUEmUEwLMvsR2Jj3aN5/9fF4ma3sSE4mfFbJSOVM1fksYuJMMff
	 bAJc+0kiwLLPRf3+JtKaHij67Gznx8iW5NsWleiTj4G1E1bkC56f79oZYxlsNukU9OPF2
	 iAntO6/ObcT4vMNnQHsRZxi6dEaAqUscN1ZeGifqKrR9zvKFxeRotD0pN1uXacPjkydVM
	 wsuQDYHpSiGyYh545rJj14riygm1HPAWiqQRA7bFmDX0nQ2nSDmo2pP5QhZ/94zRB1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQbz6huL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA05D606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQbz6huL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCF01F000C5
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730031;
	bh=6t/Kx7UaKW7/Qr0VbeTYmLdhaCkixqabZeLvmPY0ib0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PQbz6huLaBnm4ZPsyiGqd8BnuNjQFyoqva7fkYIIiRaNHhyvTU7oRsOCjTzSbkIfX
	 bbdTdGyRQDBddmdWvhsl55XMBavcO00qyOvUWDQB6QrgOBAydE7tWW0J2WdEXq7+NR
	 u7lt7D9C3RZHKz7SBjftPtpEWFN2c0nu/6yB577HIfmI4U9vJWjDzzxwUoEx672w/S
	 6trvyMKqEuuC97ukaRKBkoRNMHoj2C/qu+p63432NefxHk0Xzpo1WGjsy9YIIayDMo
	 tWtOUZxiL7Y8OzD7ocGh12ZIyjX8ipN5t234G5eGJv1adgsJ0C8y1vtvlo+0eaE9vN
	 fBw+wfUWyYs1Q==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6e560e00a86so2272348eaf.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:07:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIIpM3Mg+vfd8R3rhuebblX/iBG+zITdL8K2bmwBB4Zmk/pXS0EETTfetd+qawOLvd3lFvasg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6CqLp5hCItRMfJqwZUMxMjyh9GtM5mq+ZHNKDC3SpwWm7lnjV
	tiQLLp8d4UPQSXa6EHTB6DX1clTTcfxEGxk5sqQTN/HE1/P86Xbw74fJOoSAikxOdS23h83pG4J
	DkuDvTOquTR6Ai4KZjBo0xySrVElJnus=
X-Received: by 2002:a05:6820:a714:10b0:717:c:756f with SMTP id
 006d021491bc7-71ab504820bmr3233319eaf.36.1794730030641; Sun, 15 Nov 2026
 00:07:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com> <20261114161248.3428695-2-thaisonphan@google.com>
In-Reply-To: <20261114161248.3428695-2-thaisonphan@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sun, 15 Nov 2026 09:06:59 +0100
X-Gmail-Original-Message-ID: <CAL4Wiioi-t+gKL3dLDWcTrd57tv9TEoXUxh8gHjCQSDyT7Xxyw@mail.gmail.com>
X-Gm-Features: AclHuK-amGnwX7gvAl_M3gIeAl5qcDLiV-Dp0ac6nwy4ytb5zA_u4qQGoYcVp5s
Message-ID: <CAL4Wiioi-t+gKL3dLDWcTrd57tv9TEoXUxh8gHjCQSDyT7Xxyw@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
To: Thaison Phan <thaisonphan@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Simon Horman <horms@kernel.org>, 
	Stan Iliev <stani@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 17:13, Thaison Phan <thaisonphan@google.com> a =
=C3=A9crit :
>
> Commit a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()") moved
> the LOOPBACK4_IPV6 initialization for passive IPv6 TCP sockets from
> tcp_v6_syn_recv_sock() to tcp_v6_init_req().
>
> IPv6 SYN cookie connections allocate a fresh request_sock without
> __GFP_ZERO and call tcp_v6_syn_recv_sock() without tcp_v6_init_req(),
> leaving ireq->ir_rmt_addr and ireq->ir_loc_addr uninitialized in
> cookie_v6_check(). inet_csk_clone_lock() then copies uninitialized slab
> bytes into sk_daddr, sk_rcv_saddr, and inet_saddr, exposing them to
> tracepoints and bpf_sock and causing inet_daddr !=3D LOOPBACK4_IPV6 check=
s
> (such as IP_OPTIONS in do_ip_setsockopt()) to misclassify native IPv6
> child sockets as IPv4-mapped.
>
> Initialize ireq->ir_rmt_addr and ireq->ir_loc_addr to LOOPBACK4_IPV6 in
> cookie_v6_check() to match tcp_v6_init_req().
>
> Found in CI testing on a KASAN kernel; reproduced without kernel
> modifications in a KASAN VM (tcp_syncookies=3D2) and tested against the
> reproducer and packetdrill syncookie selftests.
>

Nice catch, but KASAN does not report uninitialized reads.

Was this KMSAN, or did you notice garbage in the inet_sock_set_state
tracepoint output?

Please say which in the changelog, and include the report or the
trace line if you have one.

> Fixes: a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()")
> Signed-off-by: Thaison Phan <thaisonphan@google.com>
> ---
>  net/ipv6/syncookies.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
> index b581cb1ee2e8..b33011b71fff 100644
> --- a/net/ipv6/syncookies.c
> +++ b/net/ipv6/syncookies.c
> @@ -17,6 +17,7 @@
>  #include <net/ipv6.h>
>  #include <net/tcp.h>
>  #include <net/tcp_ecn.h>
> +#include <net/transp_v6.h>
>
>  #define COOKIEBITS 24  /* Upper bits store count */
>  #define COOKIEMASK (((__u32)1 << COOKIEBITS) - 1)
> @@ -205,6 +206,8 @@ struct sock *cookie_v6_check(struct sock *sk, struct =
sk_buff *skb)
>
>         ireq->ir_v6_rmt_addr =3D ipv6_hdr(skb)->saddr;
>         ireq->ir_v6_loc_addr =3D ipv6_hdr(skb)->daddr;
> +       ireq->ir_rmt_addr =3D LOOPBACK4_IPV6;
> +       ireq->ir_loc_addr =3D LOOPBACK4_IPV6;

With the changelog clarified:

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

pw-bot: cr
