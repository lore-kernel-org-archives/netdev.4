Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428064;
	b=Pc1v6VF6W3nn6pQhNNKkHOZDysrcoWTCFhXN9VnSiWZ6Dhu+GSrymKdUNfEILCFpOGt+
	 jPpznhVQ2sSvch4k1YOCVTMqjI3JP31dN7FAT54wI+nX7b5i3/bv5VhOlsBeR1jmJs9yv
	 DSGNQfNAlIqVNvadm3RLY5RZpNpmEIa4woW2dFIRnl++dX6/C/UeeAYsHLfEpN+K80fwm
	 Q3zpTdfBjADVUH14C3pe3I69OvgjhpD5fEHwnozG5iEI2sWXq5nW6yz8h3oAgnNaCcSbn
	 u40sSZ7v2rdWIlV8MiogS2xzua1ujFn8WabS6X9wqw5uroCA/Mc1rnjNXntXfqdWsew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428064;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CxWOPXPmnh+FCw4+vi8QbQ8f7brE7jSL7SPa0d7lPk4=;
	b=05DFmB7RrwZtS4uyYBeEM3OMnc0e5ruy65hGYYxFVk6HR7R0GRe08sc1vMHfQJFpRR4X
	 txJMHYpy9GoBlWZL61FyPTuUeOaD8bFYNXDoyZVsC9oVK5sV6r5B6ojMevI/YzsV6zH7H
	 YTtiW/dXAbSW+jjw4vtD31KMZnlOY9NCTzbztGmaMnjF6spm56EM2cdPsGfqqRkiZFnDN
	 Gz0SrVx80oE+7ceV7y5FntHjBoPUtV9LVpi2c2htaYwswGm3R70Xjq6jFbaGEsRMFaCvx
	 vcpKBF8yMUPfTgAYbhxPwpjEuS5bX/JNk98dE7AA1cnuulBlXzFh9+2sHvoNa4ja82w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iaFGflAY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D280606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iaFGflAY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A821F000D3
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428063;
	bh=CxWOPXPmnh+FCw4+vi8QbQ8f7brE7jSL7SPa0d7lPk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iaFGflAYRtt0ktAkz67eikAVWSPw9/DHlZIidVIj4omCzFxGlpOQ4oJPcpvb0QQLu
	 dRndW8mThj0e+Z5uHEqdFMQIB28reXAupf4ZCqsrtTvSq7OSWyh5QNg2EJ8STFko4I
	 ohM/xUGoZmsECH3UvKqOotVus6oY2eGOedib0luECk5dX5b3YVuFIjBXYUBTXC6K2q
	 PqK6Z0Xdmx6f45OzHhrcWjaACZ3BxJAAbvXuLx/CMHLzexEVP11TRAyxW0Ax/jQeeU
	 SoAI0BTH7Jkyo3ev7/WfaRycN64htfqGLUeEkrgdJr1Yt8w10kcG1IGVAZnZRGAjX4
	 Hm4dxO5tvyD7Q==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8633b750a19so543740a34.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:01:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHt9GOejVqu5SAtcUdhqfTZq0pfHLTdioY37s5PtfXF0YFzRCZeChCPASZYAdwLrd4YpPSt1SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X4h1TWRpjhOBz/vHhNgH5XmhCSzqCTVwoo95cZg0cMC6IwpFW
	/JCNHYC1jhyU+QzQ8vMzIivu4+7YaCTBbhWFO9tQz0qHL/s4WAJ2AmUUtpUGveMFozlC5bLRPKj
	smc/i85JsuO2os8OBqHduvq9SJWlOYak=
X-Received: by 2002:a05:6830:43aa:b0:862:c6cb:2e24 with SMTP id
 46e09a7af769-86314fe2c72mr12598798a34.0.1795428063315; Mon, 23 Nov 2026
 02:01:03 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121203537.341320-1-kuniyu@google.com>
In-Reply-To: <20261121203537.341320-1-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 11:00:52 +0100
X-Gmail-Original-Message-ID: <CAL4WiiohGqm_r4he=GVUtzkUKHckChOK2cPeB-c-A5FYqgss9w@mail.gmail.com>
X-Gm-Features: Aa3M54qyCdFC807lvEQdzDMSDVli1h_atQ_J5r15fn0e4Ma0vm-4UnmPg6qXYcg
Message-ID: <CAL4WiiohGqm_r4he=GVUtzkUKHckChOK2cPeB-c-A5FYqgss9w@mail.gmail.com>
Subject: Re: [PATCH v1 net] tcp: Don't clear saddr before ->put_port().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Joanne Koong <joannelkoong@gmail.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 21 nov. 2026 =C3=A0 21:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> When CGROUP_INET4_POST_BIND or CGROUP_INET6_POST_BIND prog fails,
> __inet_bind() / __inet6_bind() calls sk->sk_prot->put_port().
>
> For TCP, __inet_put_port() calls inet_bhashfn_portaddr() to get
> the corresponding bhash2 bucket.
>
> inet_bhashfn_portaddr() requires saddr, but it is cleared before
> __inet_put_port(), leading to bhash2 lock mismatch.
>
> This triggers list corruption or use-after-free by a conccurent
> thread touching the same bhash2 bucket, e.g. tcp_diag_dump()
> with TCPF_BOUND_INACTIVE. [0]
>
> Let's clear saddr after calling sk->sk_prot->put_port().

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks!
