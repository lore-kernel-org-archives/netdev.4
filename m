Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073935;
	b=CeE9EMEWzaoY8Rkq4jvxIHSYQ3nq/e46UyX2imAwqBiC60AP7fgvuiEH3Y9aRwtEnap7
	 j6SoFWdKRkgKrV4fOX1arOooUMfG6AtGfRimpIRnYIzu/HAYakBH5fKQuH3f5xb/PiAge
	 /oeqDwqg+CAII1h3WeLKFvPP73MRgNj6yHg+sTX+3s5uYmbdWxwfH/h3ZGLUM2I5NFkC6
	 lUfw5KATEJPSuVRCCsl5vNVSByY23Wv05paNdqu8jTiMGWR9WWAEk3JR880puU0wsW/61
	 HjObmUPiftQ5cipZ8bUiUDdnlTVkakSHsvI//WR6lMw8C1IsvSSIh8Qu6iIc1Z/98pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FwcHmJgjwO7Wx8jngr2JVYKZYHOEfqrD8BdaI3p/Vp8=;
	b=BQZyWvqy/i/QvO5p08EMGiakh6kFXQGQ0YyzsYyXtgafrZ28qKFr21jt5NezeQoBXjT+
	 mL9QJguoDA3QPWPk28hWZM9irPzgc2Hx05k4e2h3hw5ObHRTKkR/cW7zM+23HzcdbCmwt
	 tQqnl0GPKHGLTUQjTYh7ul1Xuvu8WRi02BjTQpY+yCXp2CKBAT2cdD+pAPnZaYTGKICjt
	 ip42QBOu82XUyPwVuB18n73FfaW3TJBn0KH04YIhg56v0McaA6q41lYMtWU8cBkzcundF
	 Dfq6YcUCXTJMApN/EYlDrE0Ql5kVtL67fN43yLwFsjji2wfIy/IpVVHcrkQhraAhxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hVQ20Kqv;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648C3606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648C3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hVQ20Kqv
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso2350595b3a.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795073935; x=1795678735; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwcHmJgjwO7Wx8jngr2JVYKZYHOEfqrD8BdaI3p/Vp8=;
        b=hVQ20Kqv6v+JLij33D+FsamJTZdgY3XvFx+3H0lAV6O1JV+GbTZzZew5KD3Aspaar1
         4csbMngNkYtdC5NN3YrMCUA9MTjMdV1cOLf151Ajndx1zZD9qLGvRYWMsMUmoL2lEKdy
         zIjDMzDuz3YZZVsQwYIwSazGZD61u7iuyg8Z652Ly4L9at9uD8KQ/h4z+/blg7Pg0JT2
         UHLECkIKM1KXoMrKc+0xVMeq9x2B/2XDeiRjDED0RF+21QJ91RAIN61WeuGFbjUHQY8D
         +/xAN4i5Yu/jjtrRkZ/BYTPoI02J2vY83yB4VccsSOETuf8rDwqoGtjrbxDVRUGKMvpz
         GOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073935; x=1795678735;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwcHmJgjwO7Wx8jngr2JVYKZYHOEfqrD8BdaI3p/Vp8=;
        b=hTx1zSX/bPW5D3BP2E5hne0XmAFOYftp/r/fK0z5Orh0Q98pBbkMUJ8trcSUgeG4Bw
         zUjJ9A36+erjNC+wXxiAvWRV3vPowCIFAMKFGOmYWU94NEKuWIvBnw7fPlZQD2aINA0Y
         v/i5fGpiA73WHpyiUR3XQ8ZqqeJySi9kahIoTED71fgJVCzePBxFhjp+Y2AoZb2+24yW
         KPGNng/zo/KVFnbYD6fsAfXnLB8Ghz8pmcQEHmq+0Nh79Hl/0a4yeozD7F4AotOgVXAh
         yIjvmxIaP0iXis7LQ/KYh+LX4b4XU6ZZBPM8ij7ISfL9NmerPRukIqe3Z7hfJ1Dji2+B
         92tw==
X-Gm-Message-State: APuU4Z88GgJbdWJoZ/+TgxxdvqBsmg0ewYhy06NcyM0uffjYJiN0uVWH
	/oTkyHwIMfTW4G+hM0AO1HqCX4E3GsHoXCFFhOhpCQiv3ujOqTGmEgzafGfKRTvaGLxQY+rqCUr
	4tWHHJQ==
X-Received: from pglc33.prod.google.com ([2002:a63:d21:0:b0:cc7:ec41:d571])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4321:b0:3eb:aeb4:2c2c
 with SMTP id adf61e73a8af0-3fe86fcee52mr6114463637.4.1795073934482; Wed, 18
 Nov 2026 23:38:54 -0800 (PST)
Date: Thu, 19 Nov 2026 07:38:54 +0000
In-Reply-To: <20261116200854.3799498-1-antonio@mandelbit.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116200854.3799498-1-antonio@mandelbit.com>
Message-ID: <av6nhGkOn3XlAA1i@google.com>
Subject: Re: [PATCH net-next] net: use inet_rcv_saddr_any() in udp_tunnel and ping
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 16 Nov 2026 21:08:53 +0100, Antonio Quartulli wrote:
> udp_tunnel_core.c carries its own copy of inet_rcv_saddr_any(),
> sk_saddr_any(), as it can be built as a module while
> inet_rcv_saddr_any() is not exported, and ping_bind() open-codes the
> same check for its AF_INET and AF_INET6 sockets.
> 
> Make inet_rcv_saddr_any() a static inline in <net/addrconf.h>, where it
> is already declared, and use it in both places.
> 
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Link: https://lore.kernel.org/netdev/avVVzxL3pVZc6yQ5@google.com/
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
