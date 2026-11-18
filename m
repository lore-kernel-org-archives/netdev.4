Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992456;
	b=R7JksfLACIR5PGmSsJZYwg+leapzNMvPTkyho5QUPjJiBdrZyoyktDySENcdpTtLkDAC
	 g388m+457T2OfnLH9qm0K6UDsHIbg65KDH57A5OhN615oTqReOV8yX1r0Whcl13HJfhUT
	 2YBkqfDCo+yuzkakocgsMoRvwa7jN7fSu5VjPtKzQ/g6IGxgSCj5sebEOs7ij1h5QGQdX
	 Kk1m//7gthrcWDjTnkrHeTkwCl/aO3IhWQ8+SKWk4fw3xZgP5EKfGAr5zhPJdspKUmUl3
	 1jTDPIXdyQkhcHU+Hl8YEj0GkOG+RnyZMZSJRaKDzgAnesG10WDgNuW52vbNCZzFb1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992456;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Uj1wQ+u+WrEAOr0W1pZvk6npPUvkHVt74zvzLZ7zUR0=;
	b=jD47oMIAT8P962J6U5PA9amZQbzND3vkc6RhN44knCPN9F/0hgl46zgyKKALjsNkXtku
	 GF0KwLdWjPPGN9KUv9o8kNJMALu4urZpFg3Onya/B6go33CteCWAT9Sbb8y/7hwePFtQg
	 Z5UkfibvPbBT/uiudlHMIRz7iZI2CV2WnpoFTV8dRvoMsaUybjwYVR+WLVBd0vwuJIesR
	 qZoA1UZ8QCZpto6TcXZkCjiAFuFC9w7Z1UUQV/vRk/14Anu4EUKAhhuDwB/4WdmYptMqr
	 /s6fogfuoqXmaMD+jQlk28I1wzQfFHAk7XHXW2PubC+fKGV4dVDb+TYnFm4MxnsAh+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsS2jxpU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC1606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsS2jxpU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C201F000C4
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992455;
	bh=Uj1wQ+u+WrEAOr0W1pZvk6npPUvkHVt74zvzLZ7zUR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IsS2jxpU23Tid1ZhUl+72sUwhQaBpoRBevoakbTBmgwww50jea5WT9B0TJ+QaASRk
	 86K1ALa9ztAtacrfcwp+03AV5Q9IT/REH7Q3nvrb2oV9T2IeJB8+oIQ005UOJ6Lk6g
	 jDVRFmwZzGp25KSIufn6s7zAKgzd8PHO8pxLuGnm/TH+6Ng4P3SdcIZEVQvjB1LcVH
	 u3zqE24PMVTaGeGVRwfL2OZhnv9TxAh1T1URST8El9iPvAGNmiaK2pQhBCEpTSqZBf
	 k2SCww7F8Q+vmyq/Q3NZzYuk3vlfaImzHW5zk1PDleAO8hmVCxkoA2OI1Exux47vyz
	 SLO3YaXbtOaxA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71aea92f666so463405eaf.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:00:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEjoBip/xdewN8qOp8KUFknFza1YWXWw/XxK7bskd74tAUBOJkRzChcQENwg8NO1vHzXqtvI58=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dmUAd/w5/zCrW9M727MKyyGkm+vfT49Dmgd0MTSQtd2hJTCKl
	FL0LaiqF4xEJnlYEXmzzsqHJtZ2XxzSHHFRLrIgc6dhYG7U/siemxD3Uc1CH+x4P6eo1XfuKmJX
	vLOIl/orwBcUEVRC6VnHxFLQ5ocOmRUI=
X-Received: by 2002:a05:6820:a70e:20b0:71a:bb8e:7cc1 with SMTP id
 006d021491bc7-71b184d9757mr1107988eaf.41.1794992454939; Wed, 18 Nov 2026
 01:00:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118084927.1756747-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261118084927.1756747-1-bsdhenrymartin@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 10:00:44 +0100
X-Gmail-Original-Message-ID: <CAL4WiirJ4qR5koewZwzr44tJypJk5asS5j84CwUCwb=msMgkpQ@mail.gmail.com>
X-Gm-Features: Aa3M54rKylK6gYh2OnpK0KukidPcty2oOxAkcrYMg7Uk1187Kfw4ZwuAz843W5A
Message-ID: <CAL4WiirJ4qR5koewZwzr44tJypJk5asS5j84CwUCwb=msMgkpQ@mail.gmail.com>
Subject: Re: [PATCH] net: initialize sk_peer_lock in cloned sockets
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 09:49, Henry Martin <bsdhenrymartin@gmail.com> =
a =C3=A9crit :
>
> sock_copy() clones a struct sock with two memcpys that both include
> sk_peer_lock.  sk_clone() re-initializes sk_lock, but nothing resets
> sk_peer_lock, so a clone created while the parent's sk_peer_lock is held
> inherits the lock in the locked state.
>
> The first getsockopt(SO_PEERCRED) on such a child spins forever in
> queued_spin_lock_slowpath().  spin_lock() disables preemption, so the
> task never schedules and its CPU stops reporting quiescent states; RCU
> grace periods then stop and callers of synchronize_rcu(), such as
> expand_files() from accept(), hang.
>
> Initialize sk_peer_lock explicitly for the clone.
>
> This issue was discovered by Tencent CodeBuddy Security.
>
> Fixes: 35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred =
accesses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  net/core/sock.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/core/sock.c b/net/core/sock.c
> index ad414878dc5b..b5e2a2a7741c 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -2545,6 +2545,10 @@ struct sock *sk_clone(const struct sock *sk, const=
 gfp_t priority,
>
>         sk_node_init(&newsk->sk_node);
>         sock_lock_init(newsk);
> +       /* sock_copy() copies the parent's sk_peer_lock verbatim, includi=
ng a
> +        * held state, so the clone must start with a fresh lock.
> +        */
> +       spin_lock_init(&newsk->sk_peer_lock);

The comment is not needed, the changelog already explains this.

Also, please use [PATCH net] in the subject for the next version
(after a 24 hours delay)

With these addressed:

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Two side notes, nothing to change in your patch:

sk_stamp_seq has the same problem on 32-bit kernels. SCTP can clone
a socket while SIOCGSTAMP holds the seqlock in sock_gettstamp().
We will send a separate fix for this one.

For net-next, I am considering to restrict SO_PEERCRED, SO_PEERGROUPS and
SO_PEERPIDFD to the families that actually set peer credentials
(AF_UNIX and bluetooth), so that other sockets no longer touch
sk_peer_lock at all.
