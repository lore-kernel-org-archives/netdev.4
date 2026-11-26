Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656845;
	b=IJ8bw9nTGUpzynhR56GXPdAGAFlDeuC8Rrf9wTkqFwsrtXykFBDbVNInJGf1xG1oJKOB
	 7PfVjAjYZG4T/3xMGqFt7GwhfBXYDCBI379J85LF5kGaYIyrbtOw9jhZGCVcgM0ar9SLo
	 MUV/9OYdfqUfore3dCStpUxBSSiTqUN+0/bTcs5WGULazDn4vNHgsv1oBg/W9Xtk+c1ye
	 MWJYtsoOhzFL+lDITRLhyGAJScSH1xM4OEGOGoVdGsMdZwU6AyKysJHhEFqaUVU1AZ7np
	 atWaoboz4bKk1/JM62PNjWKIyAy8zuHDgfp99zt0yxaS5XHr3PMm1EBVyFAUewxg6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656845;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=G7bllFIPBkEhDw/j/Q+awrDKfcyAEVgBF8jD9Pxjvjc=;
	b=NAw8iiS15tI8j0Uu+5WJFZ+tE0A1wzg0PIqAVombxg2wxR3S/Nm47GkR6z2bqemNnKVW
	 d9XLmmTy01l0VoBcQVugaDbfQv2b3aW4zmgDZBcpfvYjjGofD+wfTFfhq6u5jUHSVe3l/
	 WU8UUJiRQFiEt6Iyxw2qkntjIpGBvH2IVqkX0KdfZfqyL+WeunY1uZ10AdXryTSDuRvla
	 9JtCIg2tcdxQzuSys4YWXLvF7ErGDCzeHw3WnDSET3CYtF7c3ZZxoApRNoQLTN8tJwZrY
	 HXlxqsvGsf4SJrpJf7c5vhEUTFsQIo3OJ7HRQMhIKuP5V0GgyK071GXAeZtzMSdSdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AWbitWoJ;
	arc=none smtp.remote-ip=91.218.175.36
Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F970606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F970606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AWbitWoJ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gfxp19gfuSGFy9uNr5UNZjmtNQz45+aFhcvDhalpvBU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795656842; v=1; x=1796261642;
 b=AWbitWoJFlSf3b982VRmBL2sPnuRdsAa4ToWwRIJfT0+fQHgF8/2GtxKoiTtG57A5XmRqE7j
 47/ilW2op+MCnLG7De3Lh2S+f1bQExt03OuWGhTpZxCke441q1sfOWz6dFobyhDzIH3gz4Bwkjf
 9YgPIVocfnaB7Fgul2hImz90=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58bc603968ec4481;
	Thu, 26 Nov 2026 01:34:02 +0000
X-Mizu-Trace-ID: 58bc603968ec4481
X-Migadu-Flow: FLOW_OUT
Message-ID: <f3c62d39-fe1d-44fa-a668-3aae47e31ebc@linux.dev>
Date: Thu, 26 Nov 2026 09:33:51 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] inet: release newly acquired port on
 inet_csk_listen_start() hash error
To: Dominik Maier <dmnk@google.com>, Eric Dumazet <edumazet@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Joanne Koong <joannelkoong@gmail.com>,
 netdev@vger.kernel.org, dmnk+artist@google.com
References: <20261124180600.71138-1-dmnk@google.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261124180600.71138-1-dmnk@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/25/26 2:06 AM, Dominik Maier wrote:
> When inet_csk_listen_start() is called on a socket that has not been
> explicitly bound, sk->sk_prot->get_port() allocates an ephemeral port
> and links the socket into bhash and bhash2 without setting
> SOCK_BINDPORT_LOCK. If sk->sk_prot->hash() then fails (for example, when
> a prior failed connect() left icsk->unhashed_state set to TCP_SYN_SENT
> so inet_hash() returns -EINVAL), inet_csk_listen_start() resets sk_state
> to TCP_CLOSE and returns the error without releasing the newly acquired
> port.
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
> get_port(). If sk->sk_prot->hash() fails on a newly bound socket, call
> inet_put_port(sk) and clear inet->inet_sport before transitioning back
> to TCP_CLOSE. Explicitly bound sockets retain their port.
>
> Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dominik Maier <dmnk@google.com>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
> v2:
> - Move port release inside the !err block after ->hash() fails and call
>   inet_put_port() before clearing inet_sport (Kuniyuki Iwashima).
> - Drop the extra Fixes: 8cc3aef0cb19 tag and move the testing note below
>   --- (Kuniyuki Iwashima).
> - v1: https://lore.kernel.org/netdev/20261119192133.2632936-1-dmnk@google.com/
>
> Found with AI-assisted code review; reproduced and tested in QEMU on
> top of net/main.
>  net/ipv4/inet_connection_sock.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index 9a3b05edb62b..b8df2a05572b 100644
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
> @@ -1395,6 +1397,11 @@ int inet_csk_listen_start(struct sock *sk)
>  
>  		if (likely(!err))
>  			return 0;
> +
> +		if (!bound) {
> +			inet_put_port(sk);
> +			inet->inet_sport = 0;
> +		}
>  	}
>  
>  	inet_sk_set_state(sk, TCP_CLOSE);

