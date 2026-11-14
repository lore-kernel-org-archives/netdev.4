Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676031;
	b=euFV0e5ZeTuxTG0dHnZXR6DErpiSsbD1Sw6LZX4foscxeBrf7YWWnQCMxmivWqVmnNv7
	 EPhv6Ir2cT7Hm3MR6dccfzK+VtEIURM9kLgcBhV2C3aF1X+zxZisTwCphIkOAy8Vcjncz
	 SEzo1uOfAMm44CetElZS2TYbYSGeqe2rJ6j/wZjeCL7BS8cuUdOPO2SK04hyyjAFBQzna
	 2VpsVMrWKqVeUJLSECPJefRChzQ8NMGYu8pZRXm7EvUOwKis4Vx+ah6iI3/P1KqjA1pRa
	 75r/tEJHd1TZS4rSnMkqKvdOoHUQvbfAOQnwrmkO7m0VFSiIKhmfN5l0a8uEYfTwc0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=850KMb3eeOIlKVm/okio7rxraGjj+NvraJo0Czjpdcg=;
	b=0nT7YIyv8THo1WfT+gw+m5vYrP606SDeTdwdqq/k0ELWqA9cr60yoA1x0+qcDAyTCld9
	 zWsjDN9WxGtcpnT2QTpTPA2nKu/5hUVaqs/Ls3pxCyZiWjJX4iOvIAdYzS/Tq4c2R2hip
	 VOJCoQJRYhjn/F8eOFQkUdLuOuQ6YTAqzpZoLaJGCZxhrnIklik+nKjB91SGOaiUbtycf
	 pziw0/fP8tmU5tdzRsaftib8BOlYlRsRxZuSoonEb7qVo0vieNyZZvcKH5htLHP1XbZ/l
	 UZ4vh7pzNAhLq9hw4XszNEWHsbk8oKvx2U9HFciw0vY6qLYjnsJorj6kYPsSl51fUOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GcOYJFur;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16B606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 17:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F16B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GcOYJFur
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3617775a12.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676030; cv=none;
        d=google.com; s=arc-20260327;
        b=QlHeoN2GiIlMeAmDEbB7srWK3LNHG5jKE64PQYcpq5k2klTetltTrknQXY7Bthg4rK
         MfElVJAUgu9Uv349XdlsGg/RU49WeQUaQHsqXd06hAhRZOUSAdO1g7VkrkebO3/hIJL2
         M644OWFzF504XFrY/WKBqD4FM9vtIG113irB7eQCcrJI6rEXg28Ji1mF9AXiqIFjQV0/
         RoJtfHntvvA7+T6swd0kcKUSEJKfnIrZgbiT6bisxq//VaUqwiMfpUCCqoEdMWaIpIC8
         7Vcho0DaWFuzwSOG9axWeNbuyOlTp02z8ifd9Z39UxSMhc5+6bg9hB+zfOaJoBH/SQlI
         SHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=850KMb3eeOIlKVm/okio7rxraGjj+NvraJo0Czjpdcg=;
        fh=7/bc5OIDMN1SoWR/UL1uDQThcAW6VlUhVyhc9ej3OBY=;
        b=V/hzpsWeBMT6J3ndri6b5QAQISjVgQMw4/HBz/fCugDroYAT7vQ8+bhPb183qidp/Q
         /jo97BpTcZR+g7NFuUqYkQXV6EHumbrtYz9b+x4tO+cow30l7Gd2wgeDJUC+PRkd1Fyp
         LeFiKzf4B4U9TgkjqPGU653z/oAxNUgCxCgDYJMhJgF+oyTrpyySgaS0wIx+eF6uzFzU
         CBfaQro5+kiKmmhj7SC/ykoa2UGwP2ZDU5y7I8eUocJF3k8URJIKIap3QxniPQ41GaIN
         JSI63OOiiY0G7cocLTF+nPDkty14douU+BvWrdhBrJmADCKI2I/DvqYGqDeEjfVkeIJ9
         SYvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794676030; x=1795280830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=850KMb3eeOIlKVm/okio7rxraGjj+NvraJo0Czjpdcg=;
        b=GcOYJFurxoIPhg7CP8p3/LyJZFmx77gO8a30s7h8PxpuxygmOBnxPmU4o1VvQcG8k+
         cKEyUXJ2x3A1iT3JmUDlP/mwJpywVMl/JhBo18hVva1+6iR6/pFcx/YwU7P9UFjgniPN
         p4dj1rW+EPxyQuw7M1EpIiQ+h1nHFzGU3AcPkSUmxao/f58xjVFmKBDlcQBGtjDkGahT
         P7aP3VVB3IKH5SGcfz5DC+ys3vCzt478yn33jUntHIZELPnTQ0e+b1RoE3JtLIo8mqBA
         8Z2qKt9u5/diGqt6ZM+IsZBiIFqHGvZZKzGbCR7TiR+foXBhQiz+6B/k/6ue+NOrPW+3
         9usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676030; x=1795280830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=850KMb3eeOIlKVm/okio7rxraGjj+NvraJo0Czjpdcg=;
        b=zGke0BLyNw1YdC3VXOUzYmVN3pfBqZWCyszxYgPaGuvqkJpe6O4XTSN3nmwiGhzAYG
         L6FbfwAQ1ckry8wYVm441Vr6O4lwhQ2/DbprYj1EhE+XaGL5HzPjzz5UW+WhO3pjVSIJ
         jTupvuV00HPEIIGnFiQk6MYERF3ZLdIlA4YY9c0kaA4YLXoMmb9Wl7zOtgIlefCtDA8P
         JFKBj41HMx7b8NicmC04g81H2X3C5S1H1J4mFdaSUgrguR/G/BDWwLOtlSsL3QfoN2U8
         ukC9tV1b6awoK2y2X6Qyys/O5hHgDEgXS/2adPHNieSnL4JqoahCLJ0+i+XZATgZgCNk
         vWXQ==
X-Forwarded-Encrypted: i=1; AL+hErFzOKZcKJfVjSuvuZhngEzvjHrFGS/+UvHVB7X85fsvmnwzuEvEEcWCWzBxYEMV6S86prNP44o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+91TdHKLEk7b9emMG24aqHD2oW+WeueSE8vTvPPIjrX8N5nqM
	SAxWTbQG/tBErULpCAvfQLyKQjz9YAmBsMPw2BFuScAJDui9cxyJMdKJq29BdQ4Wk4yfdDN3q58
	+1+jtEjPNlYZinWHXmuKnTxfXzZMhIjQvBhBt/qC8
X-Gm-Gg: AYBFou0hTK1ZGcLLDurWYAa+yhXRCzVJw9lNNgAnl2UnGz+LBLijicxD91Kz77JV1yN
	M0hHeXS3dxqcDO5utMGJvAhF5B/bx/TYAJG3dkybEQ/ryTQ404db8d6WpaB3dMWaUC/PzYBLGK9
	9aP7JKlh2PwBoGVurnrh+9HQrF25tltkpy2+Wou19PGb2HV/I0mn+S5jT2uCRdyyYVWCPtjRToW
	U4oIPxy7ncr/DnzerQ5JWrbwaRddH3t3A8g3LX8dxvkx/Cx1f9XemYscqv3xvG3bY+hEz5hdDAc
	cJEvN6V9rg0JlGQT7x648Q/VhZAOREsSa8qgT/4+3lIHfY19B817yfcVgFmzltIpLY/HUQyT6kU
	6JJ3LAGQz/XUwoVKKPmtVvG3yaGlC2xF3hYlwQxvoRVJHPmZtlSY+5sArqKqzR45J0jpVEO1eJO
	wwFiuyT2TRB0ctQNUWQDGBPHDZlfYlFutqV1XyLTaq7iNam279CsSJBMa+IwA46tQPRspReP6V4
	+wQ1BwaYKy5Oz5PfvdPhEd29TS0p9hU
X-Received: by 2002:a05:6402:13cd:b0:6b7:d22b:c3ed with SMTP id
 4fb4d7f45d1cf-6b7d22bc66fmr3468144a12.27.1794676029278; Sat, 14 Nov 2026
 09:07:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114111247.21995-1-edumazet@kernel.org> <aviI8PdhtmKW1cNO@v4bel>
In-Reply-To: <aviI8PdhtmKW1cNO@v4bel>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 09:06:55 -0800
X-Gm-Features: AclHuK_ky_ueWCebmMMXq6sm9ZckgBvAWdNf-vkHGwrHqMoACBDEK1zjUsPhAkU
Message-ID: <CAAVpQUA8oseT4qzDBWgA=91m37prfeDd=fve-f3MaTaAnzgdUA@mail.gmail.com>
Subject: Re: [PATCH net] tcp: purge Fast Open RST queue when listen() fails
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	Sashiko AI review <netdev-bot+sashiko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:14=E2=80=AFAM Hyunwoo Kim <imv4bel@gmail.com> wro=
te:
>
> On Sat, Nov 14, 2026 at 12:12:47PM +0100, Eric Dumazet wrote:
> > inet_csk_listen_start() moves the socket to TCP_LISTEN before calling
> > ->get_port() and ->hash(). If one of them fails, the socket goes back
> > to TCP_CLOSE without going through inet_csk_listen_stop().
> >
> > If the socket was a Fast Open listener in a previous life, and was
> > stopped with shutdown(SHUT_RD) or connect(AF_UNSPEC) while an accepted
> > Fast Open child was still in TCP_SYN_RECV state, the request_sock of
> > this child still points to the listener.
> >
> > A valid RST received for this child while the listener is transiently
> > in TCP_LISTEN state makes reqsk_fastopen_remove() queue the
> > request_sock in rskq_rst_head. When listen() fails, for instance with
> > -EADDRINUSE because another SO_REUSEADDR socket started listening on
> > the same port, nothing reclaims it:
> >
> > - __tcp_close(), tcp_disconnect() and tcp_abort() only call
> >   inet_csk_listen_stop() for sockets in TCP_LISTEN state.
> >
> > - A later successful listen() overwrites rskq_rst_head in
> >   reqsk_queue_alloc().
> >
> > The request_sock is leaked, together with the reference it holds
> > on the listener.
> >
> > Move the rskq_rst_head purge to a helper, and call it from the
> > inet_csk_listen_start() error path as well, after the socket state
> > has been set back to TCP_CLOSE: reqsk_fastopen_remove() checks
> > sk_state under fastopenq.lock, so it either queued the request before
> > the purge acquires the lock, or does not queue it at all.
> >
> > Reported-by: Sashiko AI review <netdev-bot+sashiko@kernel.org>
> > Closes: https://lore.kernel.org/netdev/179450310167.2199510.18107423940=
014989443@kernel.org/
> > Fixes: 0536fcc039a8 ("tcp: prepare fastopen code for upcoming listener =
changes")
> > Signed-off-by: Eric Dumazet <edumazet@kernel.org>
>
> Reviewed-by: Hyunwoo Kim <imv4bel@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
