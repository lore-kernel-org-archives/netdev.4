Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073684;
	b=xLxzQeAxdGXWD0htG6ZO4wzP9MMUYa6/JC2accc15OmhzVo8m2q2RZMBu87hFi4mmK47
	 d+g2VyLJDObmB0M10FnIgZpv+HVPiyNWX+tLEdCD3cweMhz4np1hnfCQvxR57x6279E65
	 fV60h7msGUm8NOUI8EmuSIqHQa8rtJ8MSqECHRs/5dKvFuRObsAGXQDtqgdlPOgQJ8gQp
	 emTvbG6o5n+ivcJCWYmsbuzBcwbX123OiHRkuxafUoobam80f1DCR2IWNcv/4x0baIAug
	 AsMkUTNq/YM9jMo0Rn7Cv7EmC4riZUc+Kno89JsXJo1UtQXjrzo5nytq1OEly0bJ3jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gjusxHLs8BnE8wEfuFeVlYsYGPDDDVtyMEC/lGh7zfI=;
	b=na4rF/1JUStiqqwF8E9F9FIZfLEhGJn4BTqsBJk4rPEtGz9e03kwoxsHLi/vcKifLx5D
	 ODYVPYkhgAnI3RqSEJOuUE4MeOL03Bl4gBaCathgzsWk0hkTT50bYVEAgvpcjcFVTjg50
	 UbnpFNksvM8cd04fL+wuhpNFstgdypzveVc8RhMs+OX+lMamGA/Hzjsh+aDFtUQmvh8kO
	 jv44fLIa7oFTK4NSgJpBMPu+F+8GnYN3Juq2+ywA3M3xRj6EPC4FsXYrHwN6MVuDjVjuL
	 k/cWJU9JaqJT3pWpR+McIL9qraE7IYhDSyq4K5gQT4Rpoc9E2cLhnBPGSfO0QTTizqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="M/lHRTlh";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDB606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FDB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M/lHRTlh
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed02a00b24so17909125ad.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795073683; x=1795678483; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjusxHLs8BnE8wEfuFeVlYsYGPDDDVtyMEC/lGh7zfI=;
        b=M/lHRTlhZoCChYwJ+n2nrsiezOvYh9X65AisaBf+6eCaTvFRCRTo5IssNy1QkTmjHM
         z0l3EvT9OZfA8J/BQ95mvnIEjfyLklJ1leJFbz2NsyiRG3qbRvqyqjcUbu1FTHj13xcW
         /yy5WQGxCtk+/3b5Dc5TZDYnPvoO3pGGDPJDMlimLUiQLYO2hnCL8fFN6UzJV70GfUde
         lAIx4x3hqFNWbw3NSehYyOMm+ZQQGfNxCnmNSUFTrqgNA/S1q1BQJyBsyIUTO2f9U9GJ
         Q2kQ3lsu42dMgSn7o9TwxRK7/Nh3RcgkgHXEn5T8adYjYlqDEo7Qz4fxUyNrs1xsvhZJ
         0qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073683; x=1795678483;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjusxHLs8BnE8wEfuFeVlYsYGPDDDVtyMEC/lGh7zfI=;
        b=G7zbskIsk8/v/elv6Of5YuzN4RudH/A7PON7i57gdnlydj6Wn4dZGDL9iTta3kKpdf
         IrrewOek3re1n/tIzKQuuHQHsz8phZk1BH4C8ibYMTeWDU5EeZeb3lVNUFCuKg4BTDND
         8prac+KguhlBzzYhYTqgHZ3hYAKA0ndSjLXXB6OXbkk7J7179oDO+veqIR9xqYDK5n0d
         Q5JC4Mbc+uXv8sD4VRDTLFFjoreHdsCLdZJRSKCbw10Ym0bGof744q0xdF9g85c0aX2o
         QHUQsDmtJT8sapAu4R0R9yr4zUmt5W4lQpGB60MoCye8LF3wwDwd3/bbxH5kP4gAcsXD
         moGg==
X-Forwarded-Encrypted: i=1; AL+hErFcWyHTwlAc/89ZPhtfBBQRSsidV1zX6yvaVu6KQI2Qv0ajob+dI3wAVoLHca/2LgNu8IlWrTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fpUQv5LlNPsoE2jVKSf0uBeA3vqpCXK+3qXMxS8MvEiZ0/vF/
	+xKYhzJyaX2fmkXD+wibSRLMbL01i+fxFNpZuXAJF/ZTkpzD4P70K3J3cqe97tlTG1dUJyLffZ8
	RuGG3Bg==
X-Received: from plpj2.prod.google.com ([2002:a17:903:3d82:b0:2e3:1b6e:33bb])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64e:b0:2ed:12a1:c4a9
 with SMTP id d9443c01a7336-2eff752924cmr51702555ad.11.1795073683031; Wed, 18
 Nov 2026 23:34:43 -0800 (PST)
Date: Thu, 19 Nov 2026 07:34:42 +0000
In-Reply-To: <20261115161820.941166-1-zihengw03@163.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115161820.941166-1-zihengw03@163.com>
Message-ID: <av6mbcM5wdGnmdM4@google.com>
Subject: Re: [PATCH net-next] net: do not use SOCK_INODE() in sock_init_data_uid()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 16 Nov 2026 00:18:20 +0800, Ziheng Wei wrote:
> Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
> sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
> sock_init_data_uid() calls sk_set_socket(), but its only direct users
> are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
> are embedded in struct tun_file and struct tap_queue, not in a struct
> socket_alloc, so SOCK_INODE() points at whatever follows the socket in
> those structures and both reads return unrelated data.
> 
> sk_uid is overwritten a few lines later with the uid passed in, and
> nothing reads sk_ino of a tun or tap socket today, so the result is
> not used. The reads themselves are still out of type, and with
> CONFIG_RANDSTRUCT the inode fields can land beyond the end of struct
> tap_queue.
> 
> sock_init_data_uid() was added so that tun and tap would not use
> SOCK_INODE() on these sockets. Set sk_socket directly there, clear
> sk_ino, and let sock_init_data(), whose sockets always come from
> sockfs, fill in sk_ino.
> 
> Found by LLM-assisted source review and confirmed by code inspection
> only; the out-of-type reads were not triggered at runtime. The fix was
> build tested only; it was not run against selftests.
> 
> Fixes: 5d6b58c932ec ("net: lockless sock_i_ino()")
> Signed-off-by: Ziheng Wei <zihengw03@163.com>
> ---
> 
> Notes:
>     The changelog was drafted with an AI assistant from my analysis;
>     I have reviewed the code, the fix and the text.
> 
>  net/core/sock.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/sock.c b/net/core/sock.c
> index ad414878d..b4499be84 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -3831,7 +3831,11 @@ void sock_init_data_uid(struct socket *sock, struct sock *sk, kuid_t uid)
>  	sk->sk_sndbuf		=	READ_ONCE(sysctl_wmem_default);
>  	sk->sk_state		=	TCP_CLOSE;
>  	sk->sk_use_task_frag	=	true;
> -	sk_set_socket(sk, sock);
> +	/* tun and tap pass a socket that is not part of a socket_alloc, so
> +	 * SOCK_INODE() must not be used here. sock_init_data() sets sk_ino.
> +	 */
> +	WRITE_ONCE(sk->sk_socket, sock);
> +	WRITE_ONCE(sk->sk_ino, 0);

WRITE_ONCE() is not needed.


>  
>  	sock_set_flag(sk, SOCK_ZAPPED);
>  
> @@ -3897,6 +3901,8 @@ void sock_init_data(struct socket *sock, struct sock *sk)
>  		make_kuid(sock_net(sk)->user_ns, 0);
>  
>  	sock_init_data_uid(sock, sk, uid);
> +	if (sock)
> +		WRITE_ONCE(sk->sk_ino, SOCK_INODE(sock)->i_ino);

Same here.


>  }
>  EXPORT_SYMBOL(sock_init_data);
>  
> 
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> -- 
> 2.43.0
> 
