Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074336;
	b=UMnH2Yy+gmYU9kUXmA+R/j6HcvTEc5+tV0ifsEPpXGwsGw95LjS+Sx+1W4uiyVd5Hg9l
	 F28drS6zuhBJlf/fwHHhnH/7oidL8+ZJvgubrevaYNfgD25TwBPJGxPD4YbRJKYLmZQAx
	 jGuvDB07FdXV3+I7EKubmPR9fAotqykemDZBDOfPk3/P7Vgzz2ZGb/dVxqjpNh6yyqhmc
	 P2PFggNBG9F+mjjcKTknZOHn/vh8vByPpOWbf+tDQFpteSrKDIxX3fywWbtVqKhNtfSCa
	 q+jaTqk+21yWz9kTXdI61fQxvHy+3//YK9s40rCGm8ilwgwlEV1C+DSlczH6vg5nk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074336;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SBUfgzkZdSg6rC6LJU9CWg4kViQWPy795hwm8knXZ/Q=;
	b=bCax9sCI6RE+Z+6EJy6M5hLD3cgzTHhI/6AjkDOFIYVQfM8ZFmlskKHIZEoNDpLMMZpU
	 D9DtBCUzw/0HPFJDijA9OVTbzFCEWEIcywh9XYGWBxxed++dbmpy04+3VxCJiW28aeHKb
	 7i3QQHukR9//c2ZlnsWRh6uB47vVptF3M7aLf/a4+YG7y5hpnmK5V8ACDld+iZ5o4HUu4
	 lZrgGbhqQ4FH2iAHEDbGBtBY8xvFYhAMJp4yS5l58EzvI+Mj9ntrBK8xQfG68vfWIkW22
	 DNlz3evy+gHarZQyRy1Y3phiuk+IgMMYiKjNam059Q2osDIjQbPqG/xM26uiix4ACFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhdaBLgk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E6606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhdaBLgk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5577C1F000CE
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795074336;
	bh=SBUfgzkZdSg6rC6LJU9CWg4kViQWPy795hwm8knXZ/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mhdaBLgkvEtXqgRwh1/NkJG2t/tp9Pjgt/q12/QrCu6/JOQxB+roB+NiTfGEI24xB
	 KBcE40CCvrcBTrBF65KO3Iit2I2yAjqhQRGIQqGfRy8uBx9/8gqW015Fk2KcLCOjFU
	 YnU6sPd6uLYAPHOVFUefuGFmuXDn8YDNooebEAkBe97epRR57U9/sdSff6o+d2rq7b
	 NEracQs48j/9cJqxxsOkJZyjEi6mM5ExePoetQFIagXSPGy9BRZKUd44AmlyOc+mQ+
	 sJQOnL8E0jCuBxJ+48WAQC6gT9M6OBOXaD0TS49RV2wbxLXIvjV74wRLBWMex/lgxX
	 GzIkHWunPnqjA==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so1103015a34.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:45:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEfpyLFhS3xh2x2xvdAAFIsf7/ftx5I2Far3LEu8YCyo/McJ2wyOpJGlkjw3w0ET334cx4FcUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UdxC7JnlDoEqsP5h+qJHT6QMUqyQYcbVs5iJnhUgRoFUaaFsc
	0Cv1xZGbwJb8zUTni5IVmB77BuOoJda+N93iFW6c8LI7v90vBUMXVhx3ECQilEEcLGLitoSxJD+
	kmnS7BS2dHrNGpuJmG0iTNfSPpJvtZcA=
X-Received: by 2002:a05:6820:1518:b0:6f9:4f1b:3987 with SMTP id
 006d021491bc7-71b185a5970mr4488025eaf.59.1795074335679; Wed, 18 Nov 2026
 23:45:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119071649.374106-1-kuniyu@google.com> <20261119071649.374106-8-kuniyu@google.com>
In-Reply-To: <20261119071649.374106-8-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 08:45:24 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqxviZXjjKiq46nZpi_gJhv4t+Zt-pjDNGo6YomG1UUMg@mail.gmail.com>
X-Gm-Features: AclHuK8q1NYPy7OwMZm_4Qfybi6kVjrj8aT7eu4EHODsBtRYZIpM839xh-M-_AY
Message-ID: <CAL4WiiqxviZXjjKiq46nZpi_gJhv4t+Zt-pjDNGo6YomG1UUMg@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 7/7] selftest: packetdrill: Add test for tcp_collapse().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 08:17, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_collapse() now does not collapse high-density skbs and a
> low-density skb sandwiched by high-density skbs.
>
> tcp_rcv_collapse_bloated.pkt verifies the behaviour by
>
>  1. set a large SO_RCVBUF
>  2. send one high-density skb with 100 bytes read()
>  3. send one high-density skb
>  4. send one low-density skb
>  5. send one high-density skb
>  6. send 30 low-density skbs
>  7. send one high-density skb
>  8. set a small SO_RCVBUF
>  9. send a small data to trigger tcp_collapse()
> 10. check TcpExtTCPRcvCollapsed via nstat
>
> Without the series, the first high-density skb is collapsed.
> In addition, the first low-density skb drags the following
> high-density skb into collapsing, consuming more memory.
>
> If we remove sk_forced_mem_schedule() without this series,
> sk->sk_forward_alloc becomes negative at the end of tcp_collapse().
>
> Note that 30 segments are to make the memory savings large
> enough so that the margin can absorb minor size delta of
> struct sk_buff or L1_CACHE_BYTES across configs.
>
> skb truesize, TCP_COLLAPSE_MAX_SIZE, TCP_COLLAPSE_SCALING_RATIO
> depend on PAGE_SIZE being 4K, so the test is skipped if getconf
> returns non-4K PAGE_SIZE.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
