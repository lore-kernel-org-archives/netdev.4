Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287686;
	b=IkG49mg4km6VRw7osLeRJOqYyivcUCV70UiExXklhR1mXOljFLrSgkiefUXjmK14Makn
	 Kmp3dzbTFLGBDDdyVNA0OlVh/mIcurbemomWf7sf8re8QyBsTFEScy0D89dUvoZ6WAXMI
	 nqrsUKblTnw0GUbkZtPRLYqUH/Lto+qpxRvt46cFFk1DdB9InUX3pwtOEeLa3tu+PV8Sx
	 pHaR09IRxRGYIqMD4Q/kTsHTgGRQNi2hH3GIBajOS2KLMEP5sGAtVYf8VMf8HDbcY8YN8
	 RRaIzAiRcCZxuNf0WJWKVKcr77W09wLjdieJ7tmFh9oTksaRtDO1nk0lanDcmPUJyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=npJISL2k/U3/3aMtKq93LtOIkv0lviALR3+CkGMlie0=;
	b=bODFpoVxX1pHAjrJvUZlz6Q5QIIvsyqcxWFI4ERqhHD+Xumz+Rm3Oh6Bm3iJn4/9igor
	 u0UYpmtc9bPdSOO6f4/OFfcvL90ygp2+d2wt4dDDo9si9pUymf+TNGa9Fj+Q9xfyJPw1O
	 c2ot6YxxtOFVOuYeUZS+EMjNTSUxtlGpSGlYkxjwHxj5e6jMl/PVzqU9zNRknTIYTq28R
	 cgFDVxurKmQeyhioR6Xr/S9Q7IyyhIU/s+SgvQGewB/cZiNKzwTqXqiQy5pIxf1+a2UWq
	 qgWC2OGsVLv0/obaG3RpsMReIB1MxScG+EsQUS++Ce2Lt88VguhFZt5lQPm9yYIORAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Wl/gO4RR";
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29B606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B29B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wl/gO4RR
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed05b3eaecso18214965ad.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795287686; x=1795892486; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npJISL2k/U3/3aMtKq93LtOIkv0lviALR3+CkGMlie0=;
        b=Wl/gO4RRcivDQLsntARvYG5i9p4EkTTFyeNOCu7pbNdwX1PiyyiWgpK4rueNSQWcLo
         XOGb2CUIIIR9iui+ZEvMa/lG2NnozK90NDKD7y3hCsV7m7ZZVpiYePcIzJAnfcycAanR
         wRZwQiFlsPmvOH3foUkiCFdUgahJtEjydLm0wKVCHwFYXwne9F5hqY3cTc6oc4cqmfKp
         zij1cKiyUZ6eNcP6nbkTtQYnqUvHPSkVN69cIJSrWfS4y+KGbCoH2hLUEpQ5TEmnS/bc
         oONd6xfAYmmCL6aLoa1yNg6JW9yCI9lB8v18uyV/9zt8iFfqUeGSAGSS6RJZ1D4z0eS7
         +0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287686; x=1795892486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npJISL2k/U3/3aMtKq93LtOIkv0lviALR3+CkGMlie0=;
        b=VNujfej26KiDkIawOX2Ak/7q8KhgjVXAzPvZAMRgrRnC0qh6DUu67oMAmu007kzloH
         GKkzeyZuitWkjSgYqXAoUQ5y1f1sQkXMvqKAnUDGGkfocXb1vLA0cTu9LzL96x0xtmPo
         b33jtzs4t2xoCWWydcAxLG4kkxO/usp+9NmS1cKHfT9FN4/Irr+yFW1ow1b+kvkZH55k
         M5XwivIvsRxDTpRfkN1hXl/iWs3jLkpUW9IxKdyybgL5CD3LXwZudE/PyQz/gryY6FxS
         swYSfPweCTUGwW9I22tGY9xGq7QiUVFH7qxdv4wkTVyOiS0U2cuu8Zk1RkDO5uDPknbN
         F/lA==
X-Forwarded-Encrypted: i=1; AL+hErHpxU6Tz5xJ7ue56KrNwntg2r7IqYPg6mgIJ8P9DkGi9aWOFc/ABOLEbzcZAb9dDc1UMQJ/OlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1oFCXTQ61lWNv3fkH6AdrSDPS6qh9PnaQdS6p5S0jXq/iZSfS
	7ulxohCGGbeoXHMrsk37SFlE+ERsbCa8qh+tEKjXGkFO0q26F4yp6k5Uwf7cPX7y4+FSX1LVzwU
	hNbIuPQ==
X-Received: from plgs18.prod.google.com ([2002:a17:902:ea12:b0:2ef:a639:8b2f])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b0e:b0:2ef:ced4:35e8
 with SMTP id d9443c01a7336-2f03f1e0d60mr67172675ad.52.1795287685430; Sat, 21
 Nov 2026 11:01:25 -0800 (PST)
Date: Sat, 21 Nov 2026 19:01:24 +0000
In-Reply-To: <20261119100414.13635-1-zihengw03@163.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119100414.13635-1-zihengw03@163.com>
Message-ID: <awHqf1s90w124GpI@google.com>
Subject: Re: [PATCH net-next v2] net: do not use SOCK_INODE() in sock_init_data_uid()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, 19 Nov 2026 18:04:14 +0800, Ziheng Wei wrote:
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

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
