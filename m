Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294780;
	b=rLsrj2kKnc32tla5ddVXyYRlCvjSejaHlt6pFg0ZTrAjaGJSfHy5NEIZQCkAlhNTUztK
	 8vIGCI94gDkcH3NvyLSeCRxRA10ZzqCXMCnFfRsC/9yEcScFpGB79ZOuQQY4oOh05PJQX
	 jGRM93lrQJIIKHlqMX4rsn5kJ40YDyn2qO7iRmm/p+wrbhJI0z2kklXWTJsOEyO4XLVil
	 oxNEvYhyCOfS8sh4hh/bl7MZR1rqag/+T5IeXug9BC6VGygKc0ssKsFLXucqPDcFGoVmd
	 tQOfwXhnLjhb9UGsFnk45kBPgh9/evkVDSkqPnsBDid+F5BoekQlDgVwmuirSX7ndhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RVGwbYQ/BaNH5jxmpcByIU0RN5kUZ7bBLT/Duqul7Nw=;
	b=K4oPOviKugB7KUS6i9Q7uAC98lhQVXAVvmp5s7HmnVQpDbv3Q6tAkhJsU2UxKi0JcNOW
	 sVRs/mM482KrbQ/P9hGHW1/1i7yoYCCfniwn9MzXcEsWvbi7P40lrCuhezXK0wDVobg76
	 02A14HWV8DdNbnmgO/E3SHU4tBBssoJuz0+s0CVvxTw0a6SkxH2ENsl4qKMNI52INJB/5
	 zoggPvomso2UYeLdefzYirSrCxG+pzt8OhbM241Dq9l6OmSwJq6T0wNqKZOj3FKFsJ7Zp
	 V/cP+tfQhmvrd1++xj8B/HxS+I/7TOAYHHQ5r2OUyC3KXEH2TRtz3k/+Lm6CZ8STiBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jcshLppX;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B71606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B71606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jcshLppX
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso1562687b3a.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795294779; x=1795899579; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVGwbYQ/BaNH5jxmpcByIU0RN5kUZ7bBLT/Duqul7Nw=;
        b=jcshLppXGdP3eE8tP6dm/Df7IEarVkHSO/HEZ+WaKsqrmNtUq7UrTDn5UZozgWFeZR
         4eaD2mgvmiytcgkRWU+OIRl57KrAtk24pQZ8jsamX0bkb7wQCLBDIK17FbMErGUYPfTW
         DhJ1ECnS2HzLtqVFk+kQ+TUuDvQM5xfN20B/DNaFVwqJJgc/n+UISoCuJ5BAvnQ3XDTY
         n+xl/12iGuqMdhl6IHmSPz9lLf4bqp3jUzXPYMNjDjZ+Hy+X36AidWIu91MIvwxJ58No
         ddQbFn/G6T75wbcOaces1C8j4GatoCAYRu20uIvYHa5R+dtVdln+MxjdDk42SlxYFpBL
         DO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294779; x=1795899579;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVGwbYQ/BaNH5jxmpcByIU0RN5kUZ7bBLT/Duqul7Nw=;
        b=YwpUdaxUxPkTC4skNTHO2IkdRxkxUwWAai7kGfnsLwWdeVoDxRMQoMzc7OqaXqJpoR
         adnDhBjB7Ij4EXjTW1C3K5O/kwsdLNd0fM+cVdlws2TKA3JxfSVU2/hE7Q5C+u/rGbmj
         t1pIq0++3AIIpK07EZ/VpbKIr0mVyKNq9bHw+7B8XcECYY1O1NflNYuAAOV/csBtwySA
         UQBlEaIsqBXbwjYVDI61HgZJzMZw3ppmHkXLp70ADQAA8e9jU+5DOXpXkfbYU/H4I3Od
         WbueBg8f8cabTeSNn1D07z7Pi3BVk0swglFWqd4AqaSqZqyBGVyQgaB5zNAKFVrrQhAY
         Km2w==
X-Forwarded-Encrypted: i=1; AL+hErGXaqtHHAuOPhfCeK6ZcxBQOFOyQt+3krqqF8y5MnJWlebflZg4SHd9Hx2bBICOnXDm5V4KWM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2CZ/VrAbOxSNXvyRTzM1xnBS4V5UF98syfNTgtu0NSm6zTeQF
	Kqr5MVw+xhJOca2S7mRKIEOZ79Zh3Sn4T9W+oZcUBjpXKJRlx9RkSPWnlL90Bhvp7b+R9GTLdxn
	ke8I0nA==
X-Received: from pfld16.prod.google.com ([2002:a05:6a00:1990:b0:8a0:8283:82bb])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:898c:b0:3fb:5a07:e08b
 with SMTP id adf61e73a8af0-4014e255372mr5415345637.80.1795294779171; Sat, 21
 Nov 2026 12:59:39 -0800 (PST)
Date: Sat, 21 Nov 2026 20:59:38 +0000
In-Reply-To: <20261119192133.2632936-1-dmnk@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119192133.2632936-1-dmnk@google.com>
Message-ID: <awIFzZAOeSiQsUCY@google.com>
Subject: Re: [PATCH net] inet: release newly acquired port on
 inet_csk_listen_start() hash error
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Dominik Maier <dmnk@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Joanne Koong <joannelkoong@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com
Content-Type: text/plain; charset="us-ascii"

On Thu, 19 Nov 2026 20:21:33 +0100, Dominik Maier wrote:
> When inet_csk_listen_start() is called on a socket that has not been
> explicitly bound, sk->sk_prot->get_port() allocates an ephemeral port
> and links the socket into bhash and bhash2 without setting
> SOCK_BINDPORT_LOCK. If sk->sk_prot->hash() then fails (for example,
> when a prior failed connect() left icsk->unhashed_state set to
> TCP_SYN_SENT so inet_hash() returns -EINVAL), inet_csk_listen_start()
> resets sk_state to TCP_CLOSE and returns the error without releasing
> the newly acquired port.
> 
> Because inet->inet_num remains non-zero while SOCK_BINDPORT_LOCK is
> unset, a subsequent Fast Open connect on a dual-stack AF_INET6 socket
> can update sk_v6_rcv_saddr via tcp_v4_connect() without rehashing the
> bhash2 entry. Disconnecting with AF_UNSPEC then invokes
> __inet_put_port(), which locks the new address's bhash2 bucket while
> unlinking and freeing tb2 from the original bhash2 bucket without
> holding its spinlock.
> 
> Record whether icsk->icsk_bind_hash was already populated before
> get_port(). On error, after transitioning back to TCP_CLOSE and before
> purging the Fast Open RST queue, clear inet->inet_sport and call
> inet_put_port(sk) if get_port() newly bound the socket. Sockets that
> were explicitly bound before listen() retain their user-bound port.
> 
> This issue was discovered with an AI-assisted code review tool (ARTIST)
> and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
> kernel modifications or error injection; a standalone reproducer is
> available upon maintainers' request. An earlier revision of this fix was
> verified against the reproducer in QEMU/KVM; this version, rebased onto
> commit 342e62fd34c2 ("tcp: purge Fast Open RST queue when listen() fails"),
> was checked with checkpatch.pl --strict.

Please move the last paragraph under ---.


> 
> Fixes: 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash and lhash2.")

This is not needed.


> Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dominik Maier <dmnk@google.com>
> ---
>  net/ipv4/inet_connection_sock.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index 9a3b05e..2f367a1 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -1369,6 +1369,7 @@ int inet_csk_listen_start(struct sock *sk)
>  {
>  	struct inet_connection_sock *icsk = inet_csk(sk);
>  	struct inet_sock *inet = inet_sk(sk);
> +	bool bound;
>  	int err;
>  
>  	err = inet_ulp_can_listen(sk);
> @@ -1385,6 +1386,7 @@ int inet_csk_listen_start(struct sock *sk)
>  	 * It is OK, because this socket enters to hash table only
>  	 * after validation is complete.
>  	 */
> +	bound = !!icsk->icsk_bind_hash;
>  	inet_sk_state_store(sk, TCP_LISTEN);
>  	err = sk->sk_prot->get_port(sk, inet->inet_num);
>  	if (!err) {
> @@ -1398,6 +1400,10 @@ int inet_csk_listen_start(struct sock *sk)
>  	}
>  
>  	inet_sk_set_state(sk, TCP_CLOSE);
> +	if (!bound && icsk->icsk_bind_hash) {
> +		inet->inet_sport = 0;
> +		inet_put_port(sk);
> +	}

Please move this to the block above after ->hash() failure
and call inet_put_port() before clearing inet_sport.

---
pw-bot: cr
