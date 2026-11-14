Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672891;
	b=ffntBD0Svec7gK9IxJUqP0gLznpLHRkp82h9zR2yVK1e1I5TyKkUUdF8nsKBGonyS4CA
	 KQLK+4Ngt8T6Dc89+nI/1bx7XItgWK745a2is7wyeHHrKEq0/Zw63YnoqDTnIJRXtGsIZ
	 Ls3WK18Lc83bmd45Q5PMP5zRaT6Iv4S0pvpGz86DX83BxQJumlbW91+C8a8iru7uEbfC+
	 /3mxsbIUp5RSrxBBMlbDPldA+j+XoDQSrFzXhMM55mT31CTmaJBo/kGRFBOqlY+/ADZzq
	 lkXhCVXo68ObYcvbt1jH+NyQAwMZEHyEX5hLcoZwKKu34ugV3n3bCsoQyBo5W23HiVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3sqpU8GPZ9NrmcusC926FJ2/d9OHjNPoL86X3BTLLLY=;
	b=QWreShiGzAlW6RKf+VThHGA5y1UIRw3E7fSZZa7KdTKvvhGBmrSST23gJyVtbxfKPDnW
	 bkga2k8912v+0eAEEm0XKfVqWGAS2mDB4fXQyx19llSBnEgJ6JHyrT05SwyiOfykg2wXj
	 J8tnnu/nKOkx1Ldxlz1YNYtIG8hJzA5inMPTUxjdzV3qlRMr68CmfrowN9J74BFgI8VPs
	 HMbrE/n8LBDbAZfnDjKbv51LxnScblTZXakT7r1F1sQ2znz96gMXDZfV930hDnGEr6yhG
	 qn5bUA2Jqg3pK7D4aJJDwWmdHnEjim/8OohE3noSNFIKHJQygRXaZ1zFAEdFdiVIySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OuRN94qG;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B80606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B80606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OuRN94qG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37986eb6fa2so1686426eec.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672890; x=1795277690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sqpU8GPZ9NrmcusC926FJ2/d9OHjNPoL86X3BTLLLY=;
        b=OuRN94qGpwYMXkosjY20bBJ1Rx1uS8Q0bl0tI1pyn/oGTgdx83g/GGWsDzqclGl6y0
         UxrcRE3+hlT9Otv5AbpBkOeIgDwSkLAUnfRjlewPW+ZOePyeXi3BuiIRvzqoiy9oE4RC
         0bNrgpO4YsArYfhzU1pNr4fPGZqLUVK8OItPILVkzyotnkRYHl/0NCA6+8EYRoLqrQs3
         ER2CuJrdt3f0wNZYNUFUnns2q3dNMk93+YLtPpLHEiYzCW0DxudsfKHt/77FBduAfXHv
         7/mFR+5n5YgNQET/IhDkGdgekVaypVpwqY+rF/m1PdPNOBYWTjm+m6xeLC+9J25vW4HD
         uyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672890; x=1795277690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sqpU8GPZ9NrmcusC926FJ2/d9OHjNPoL86X3BTLLLY=;
        b=e0UJuGemZFN8WpuEpuMG1B8loucehHcjfr9x+x2s76jEaiPlwDrSp1ieDFxDv4pUy5
         UBol+LMgeweXJgT+7Qb1vpF/pTKi8tBKQuz+Qw4kNjLITn8uIQAXYq37ZfIYf3WqVg14
         R9Rseuft/mJHHdN2hNYDSNZ22OXqfNIZW6rLgbphrZchKa/Xl1VVvXGtQ0Y80qaSSzJI
         bo3OgKRhN+XKmJwpPxjLmpv3jiiRxgSJqonKnrcT2NLTXMMmnB78vFsVXiJZswKw9zVY
         Zpdpvj+BhrGJHL6wveGnPaQHigFereXpl93NoQu6CuDZHV4xLes+V9YHs6hzwA6Yu/o5
         8bVw==
X-Forwarded-Encrypted: i=1; AL+hErE0eoEskFiG3LNW6fqn3VkzW4BsoSVKY7HdJHxrHUxUotsqJquMT8UXQL45WKgvXzi30sCRN4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9luNX01Ngl109OTraWyVYMoK3ZMpFhr/dQCcoehA4MG/G1d+eY
	9r+eAZgJnpcYVJ1TiaU/Ptk8D0noTN8XJ5Sp8bdyBgyQIrxJvwLVmkxJGNVblQ==
X-Gm-Gg: AYBFou3xzi7NYNHazmZecgzTSYy8mSg46AjgyZaSuzqM5itBiKqjpS734Hak1HGbxXi
	KBSNQxWUuu1Fs7SgAisnUBBECtFlZjZvGV/IBj0UzEO61ly7P1Bi0X5125ppuRFKhustY5Amaso
	boWivgHNYsrKCzV/kemu54F14AvsIbuGR4idoJ9O4SQb2HQzRCrfJIn80TOF+XP/mqCNTNXW8Bq
	i/RN6nH0XdxuZB05FG3L3v9F3Ss7MBhmjhOFXwzNTwed2xkg3lqeuZpxGTCINTxJuEFel6A6sPv
	yWbhn6LqBhHeyG15djY2oI+Sf3KhUu4wxvNakh6uqRjglKyg6yImsWURc3rXWeoVZijGrUou2KA
	Xay4UgMHhcCIjsYdmpqaio7HjdzKg0ZrY4vlxAMv3yNW7AkvetKTOx4a6QQDIyQ1XxqTgpINdXd
	3wmw/e8rGJ/2J2+8mvK0ME9No4psSk8lgyshji3JEMpmdMofaOn9YTjqB3e8KcW9x4liKhg0I/F
	HH4iFPKFwKXXKEaswPemi436X3dt6nuu6FHeSC2NKBxLwm3VhGQoFhza1ynsjE/TOIFH3RQiETb
	jGKinb7ADBYjS0QU4t6ce/zedHOb6CY9Wp9iuRKOuvsNUGv+
X-Received: by 2002:a05:7301:9e4c:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-37965da96cdmr4576757eec.9.1794672889400;
        Sat, 14 Nov 2026 08:14:49 -0800 (PST)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm26690995eec.18.2026.11.14.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:14:47 -0800 (PST)
Date: Sun, 15 Nov 2026 01:14:40 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	Sashiko AI review <netdev-bot+sashiko@kernel.org>,
	imv4bel@gmail.com
Subject: Re: [PATCH net] tcp: purge Fast Open RST queue when listen() fails
Message-ID: <aviI8PdhtmKW1cNO@v4bel>
References: <20261114111247.21995-1-edumazet@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114111247.21995-1-edumazet@kernel.org>

On Sat, Nov 14, 2026 at 12:12:47PM +0100, Eric Dumazet wrote:
> inet_csk_listen_start() moves the socket to TCP_LISTEN before calling
> ->get_port() and ->hash(). If one of them fails, the socket goes back
> to TCP_CLOSE without going through inet_csk_listen_stop().
> 
> If the socket was a Fast Open listener in a previous life, and was
> stopped with shutdown(SHUT_RD) or connect(AF_UNSPEC) while an accepted
> Fast Open child was still in TCP_SYN_RECV state, the request_sock of
> this child still points to the listener.
> 
> A valid RST received for this child while the listener is transiently
> in TCP_LISTEN state makes reqsk_fastopen_remove() queue the
> request_sock in rskq_rst_head. When listen() fails, for instance with
> -EADDRINUSE because another SO_REUSEADDR socket started listening on
> the same port, nothing reclaims it:
> 
> - __tcp_close(), tcp_disconnect() and tcp_abort() only call
>   inet_csk_listen_stop() for sockets in TCP_LISTEN state.
> 
> - A later successful listen() overwrites rskq_rst_head in
>   reqsk_queue_alloc().
> 
> The request_sock is leaked, together with the reference it holds
> on the listener.
> 
> Move the rskq_rst_head purge to a helper, and call it from the
> inet_csk_listen_start() error path as well, after the socket state
> has been set back to TCP_CLOSE: reqsk_fastopen_remove() checks
> sk_state under fastopenq.lock, so it either queued the request before
> the purge acquires the lock, or does not queue it at all.
> 
> Reported-by: Sashiko AI review <netdev-bot+sashiko@kernel.org>
> Closes: https://lore.kernel.org/netdev/179450310167.2199510.18107423940014989443@kernel.org/
> Fixes: 0536fcc039a8 ("tcp: prepare fastopen code for upcoming listener changes")
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Hyunwoo Kim <imv4bel@gmail.com>

LGTM.

> ---
> Cc: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  net/ipv4/inet_connection_sock.c | 35 ++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index ca3057192e6d..c33b0095468a 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -1331,6 +1331,22 @@ static int inet_ulp_can_listen(const struct sock *sk)
>  	return 0;
>  }
>  
> +/* Free all the reqs queued in rskq_rst_head. */
> +static void reqsk_fastopen_purge_rst(struct request_sock_queue *queue)
> +{
> +	struct request_sock *next, *req;
> +
> +	spin_lock_bh(&queue->fastopenq.lock);
> +	req = queue->fastopenq.rskq_rst_head;
> +	queue->fastopenq.rskq_rst_head = NULL;
> +	spin_unlock_bh(&queue->fastopenq.lock);
> +	while (req != NULL) {
> +		next = req->dl_next;
> +		reqsk_put(req);
> +		req = next;
> +	}
> +}
> +
>  static void reqsk_queue_alloc(struct request_sock_queue *queue)
>  {
>  	queue->fastopenq.rskq_rst_head = NULL;
> @@ -1373,6 +1389,12 @@ int inet_csk_listen_start(struct sock *sk)
>  	}
>  
>  	inet_sk_set_state(sk, TCP_CLOSE);
> +
> +	/* A Fast Open child accepted before a previous shutdown() of this
> +	 * listener might have queued its request in rskq_rst_head while
> +	 * we were transiently in TCP_LISTEN state.
> +	 */
> +	reqsk_fastopen_purge_rst(&icsk->icsk_accept_queue);
>  	return err;
>  }
>  
> @@ -1477,7 +1499,7 @@ void inet_csk_listen_stop(struct sock *sk)
>  {
>  	struct inet_connection_sock *icsk = inet_csk(sk);
>  	struct request_sock_queue *queue = &icsk->icsk_accept_queue;
> -	struct request_sock *next, *req;
> +	struct request_sock *req;
>  
>  	/* Following specs, it would be better either to send FIN
>  	 * (and enter FIN-WAIT-1, it is normal close)
> @@ -1533,16 +1555,7 @@ void inet_csk_listen_stop(struct sock *sk)
>  		if (!has_current_bpf_ctx())
>  			cond_resched();
>  	}
> -	/* Free all the reqs queued in rskq_rst_head. */
> -	spin_lock_bh(&queue->fastopenq.lock);
> -	req = queue->fastopenq.rskq_rst_head;
> -	queue->fastopenq.rskq_rst_head = NULL;
> -	spin_unlock_bh(&queue->fastopenq.lock);
> -	while (req != NULL) {
> -		next = req->dl_next;
> -		reqsk_put(req);
> -		req = next;
> -	}
> +	reqsk_fastopen_purge_rst(queue);
>  	WARN_ON_ONCE(sk->sk_ack_backlog);
>  }
>  
> -- 
> 2.53.0
> 


Best regards,
Hyunwoo Kim
