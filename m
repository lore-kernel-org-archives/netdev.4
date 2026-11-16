Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855366;
	b=R4yEpo7wbWwNwh9JWDRlORZxKCuEvEODle8YfvtvfFLx/yvbgUx7g5wAH7OrDoToVS5x
	 /meQG8rJ/Oggo2fvf3F6aDuljDyobhSTTcTNxP8lbEedu86awn2eoE0LHREwRlaV4p3Vq
	 yObmhPiy3YVA/DfmaEaVdEsShefhC2ls/g80ZPhalQmtdAqaVT51RfDg4J8ZWaxYnaJ0G
	 5qIeSQuNG4i8xPdoUh9SgeZuyf5vKFUeXJpafs6d0d+6FkB4xHbMFeTh2GX+RJyrcuJgC
	 rSp3UcJohK/YOJVdc7A9SLhHD8G4rQGhnXtM/D/Cr/Ovdys1AJOfOxZzu1WyWznVDIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
	b=rGWlEjudUbjUJPGNKe1RyLKiwnlK2qF36y8uQSJ3l3TtL3CJR2Z62LPHtvjl5zd/KtHV
	 uubOFIQIA+7xSHByxkyjG0aYt/KAUWwAw1rkCQQUt9MW35h9vOnfAv+gPoyZwXqJoPpl6
	 JpkGJBodJ1xxScvORiCM22QcJJXqGlT0hrP/dOaKf6SWUV82KHWXTvjzWGotnScrAs7PX
	 LbAPoLTLPPINmrrYpJb6AZx+adJI+pItHhagN1U8Y+9UEBoFwkWRYWs1kTYnjX3WJufTO
	 CaE+lHS1jBt0dCS7cu9lgh7L6cf6VoCnNvpjQRpJjIhZoJT0PDvZHOmQFLXPb0GDZMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=f4j2uwvJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152C606A894
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A152C606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=f4j2uwvJ
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1175891e0c.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855364; cv=none;
        d=google.com; s=arc-20260327;
        b=OY/T45AJe/UVl6OpzLC/1rFbMsZvnttzYZO1P1a4JCzhcY2IbxU0+t7kWEdG0pxbjc
         hZAtI1if11MWe+iQHaGYORG88A38irZNy63bomtB8/xf+AxY7sHtEDL24+YPdT20zwZ+
         W5lq7YpYxA+H8m/70yoROzpDXTdj3U32GyA+/MUhyVneblY1b2yXH3/ENGxPND6yTn3Q
         VZIQn4hL5NALHNvOn0r7a402O1O2OwaUzB11H8w/5YKb/tPafJGE6oUSVz6RRoUtXXSl
         39Hj9HNOEDSfqU1RS69ITGE6OmUi4dqiOgq+2pEZHrpXyx9D4ulifQjF80+NOREJaSc3
         hnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        fh=Hho7xgVIs8gA2ZonDvT8re5eUpsGYUnpSxkrDYHsRzI=;
        b=ShoGrKHkx8z7t5ZkYi1zVyfXqAj8tGk2Ug1rwWx+0D5Il66IIAP+UpCKcL+i0iCpVA
         UCvpmfo05CpuJEFd2Rqpy9hVZDWGN3wX+mKU/ec8qAX/kIWVvYKwrRxWG+VR/Tuv7wBG
         uXesLkWRPGv+yqqtCrcfsvvWfunXov6nSTqqC0yAV033/H9izA5jLA5DOwxc4j2Bsg2J
         PoqUGpd3O+bKljXIen4PtCTb7GtZXOaSO8L5A3Vpwq5aEb7zY/Vdq/R08w/gqHR1CEb2
         M1NlehaA8gsgwZmAWPxQ5G7BUhNIO9hF3ZtN5h0N8PMRHzOv/Q4eIeK7riNs6JzvQWed
         6MsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794855364; x=1795460164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        b=f4j2uwvJ+lHyrTAK7E5Dtl+M5bvamBrr6tzEfQoknmihhN2xaDOFSeiFQC7EokOwp9
         FkbrM0aMK7Smc4PSIjTgdcY8BHaxQ9mPWaS1UpPgIoSfLWYHXfhpCxX4eTSZNcmr5OTX
         o7cNGzWKceJXCB1lcrkgJs0NokQ3DC4lK2Txcbw7nVY0k8FUEDlWkVtXA0GpvFd+0xMg
         iHLiy63ly8w3NByFVDUXRalIbK4skjf70Mrr3u6qupmTZx6mxSuWIuwiyWzMyhnhQ4hh
         eaBj7LQV6a0E/pELWEaHa/PlhMPXLKUjdX34CtmYWWpn8c3dl15vksdun+k2C03nAQA4
         mi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855364; x=1795460164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        b=dWA0JAY9BWOC28brbOnZs/yecmu5YEHtE8YGuA1p4SXqYjwwoUzQlfhG+uuEESyAP7
         SJDGdZCIjEijd0J/beodV5WOm4lifEJfhHp2z8xMZjznLfzYZv6m9fjPtat3JfHjtyqo
         sTkwmESmwkxaPLoX4oUBIFr4W+p7tR1trJV4KUgBaTIS1bIz2rUdsBQolJQjZZxrCsSz
         bkWtkTAx59QBqij6wj+4vWiL75KZyHbrMcdX790wwPAQc7K7VV8zJI3pjY2THl0bCVZm
         9j3oF1AjQodIEdHxdEWjPHRzR9i0g3Um3mIXUIQJ2K6pdCOCrkzuAJVpSn3jM6pKe45j
         XopA==
X-Gm-Message-State: APuU4Z/qKSotqjAJGfp40IGR0eHyau/jli7T9CQ4u72F00YHXeSZ6d26
	Q8DxX0MThMUoR3zeNyxwXFHTI+p1e4PDCpPw2HpDKeFIpLxlNdZqXAb4d/AKAZX7cXSgVh+gjum
	0EhnjXGllRrJqpRPNfcL5jyqkMtcBOwzQYGP99ssn/w==
X-Gm-Gg: AZFdTZeCMZlEXqtzxlMWJ4LT6Cssa+LRSPmbUNYCW37i46puH/Jt7H1M8FM0rxc05Wu
	lz+g6AGVIWUUOUxxlgeg/GiNHqlJZ2j6eOekX9/ZJZf2rqE+E+QYfyr+nvEjZ0rz7ZwVHFy0mRJ
	O2hY3cIY8vXklC0QQOlqg3U93i7YW6uZIBRcfAlQyNf1BybabO2wdivF2VXK3pAZlAEPrYq/aiV
	w/6FoORYI4FQUa/YPrAw8Ae6uFZhfLM8UocLwuM422lRe/LVWXrG2eFywmU1fHuimgLOzFdBN9k
	DleD+/U2py+8ksR+8yhjwC/t9s9L7ybh6FqkeFOrdLSe+Sw3SK9QRsZtn9bLMpxpS+ve00gwCoT
	WM8z3GS/ajhIPCYNgyq2c/+HE1BQpfj9cZmA2FYt/HLPqKFQdZta4TJXezNhl9dwlbyyHmZ9xir
	GGqrT+S9umQC5d0uS7XWdNSY+VbyrgzuYbIOh4DWfahOHS4DYb7KSHbj7V9RP+vsObNheLr/jCI
	BquWDfqbWaTeaPpSn8ULWPY0g==
X-Received: by 2002:a05:6122:4215:b0:5ec:3e18:a912 with SMTP id
 71dfb90a1353d-5ee34a968e1mr3829197e0c.14.1794855364480; Mon, 16 Nov 2026
 10:56:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112232444.2865382-1-rjethwani@purestorage.com> <179461232334.2199510.12258955725199996955@kernel.org>
In-Reply-To: <179461232334.2199510.12258955725199996955@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 10:55:53 -0800
X-Gm-Features: AclHuK9aI72Wzc15wwlEEJSue0Lw3dqJipNrakxflrQi_c6kzLHMREGXD0OoOA4
Message-ID: <CAKaoeS2yeZ3WciKNtdp8ee+n+v+xc4+QAcwZU3-fzG6J28-5dw@mail.gmail.com>
Subject: Re: [PATCH net v7] kcm: reject TLS on attached TCP sockets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, sagi@grimberg.me, hare@suse.de, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The Fixes: tag covers only one of the two defects the commit
>   message says it fixes.
>
> --
>
> kcm: reject TLS on attached TCP sockets
>
> This patch makes kcm_attach() reject TCP sockets that already have a ULP
> installed. It also makes tls_init() reject sockets attached to KCM, using
> a new kcm_attached flag in tcp_sock. The kcm_attach() type check now uses
> sk_is_tcp(), so raw sockets created with IPPROTO_TCP are rejected.
>
> Link: https://lore.kernel.org/netdev/3108e934-ec00-458b-8720-450554b35b55=
@linux.dev/
>
> > KCM calls read_sock() from its receive callback in atomic context. With
> > kTLS RX, this reaches tls_sw_read_sock(), which can sleep. KCM and TLS
> > also replace socket callbacks, so detaching KCM can discard TLS handler=
s.
>
> [ ... ]
>
> > Fixes: 662fbcec32f4 ("net/tls: implement ->read_sock()")
> > Cc: <stable@vger.kernel.org> # see backport requirement above
>
> [Severity: Medium]
>
> Does the Fixes: tag cover both of the problems described above?
>
> 662fbcec32f4 added tls_sw_read_sock() as the read_sock op, which explains
> the sleep in atomic context. The callback replacement problem looks older=
.
> In the parent of 662fbcec32f4, neither kcm_attach() nor tls_init() checke=
d
> for the other, so the two could already be stacked.
>
> If KCM is attached first and TLS_RX is enabled afterwards,
> tls_sw_strparser_arm() saves psock_data_ready and installs tls_data_ready=
:
>
> net/tls/tls_sw.c:tls_sw_strparser_arm() {
>     ...
>         rx_ctx->saved_data_ready =3D sk->sk_data_ready;
>         sk->sk_data_ready =3D tls_data_ready;
>     ...
> }
>
> On SIOCKCMUNATTACH, kcm_unattach() then writes the pre-KCM callback back
> over tls_data_ready:
>
> net/kcm/kcmsock.c:kcm_unattach() {
>     ...
>         WRITE_ONCE(csk->sk_data_ready, psock->save_data_ready);
>     ...
> }
>
> After that, TLS RX is no longer notified.
>
> Before 662fbcec32f4 the TLS_SW proto_ops also inherited read_sock from
> inet_stream_ops. So in either order, strp_read_sock() would call
> tcp_read_sock(). KCM's strparser would then take raw TLS ciphertext from
> the same receive queue that TLS parses.
>
> This seems to go back to c46234ebb4d1 ("tls: RX path for ktls"). Stable
> selection uses the Fixes: commit. Would LTS trees without 662fbcec32f4
> (6.1, and 5.15/5.10 while they are still maintained) skip this patch? On
> those trees an unprivileged user could still stack KCM and kTLS RX.
>
> Could the Fixes: tag point at c46234ebb4d1, or could the Cc: stable note
> say whether pre-6.6 trees are affected? Right now the note only mentions
> the 8cc3aef0cb198 dependency.

Agreed, both problems predate 662fbcec32f4. Before that commit,
kcm_attach() only
checked sk_user_data, tls_init() only checked the socket state, and the TLS=
_SW
proto_ops inherited tcp_read_sock() from inet_stream_ops. v2 changes the ta=
g to
Fixes: c46234ebb4d1 ("tls: RX path for ktls") so pre-6.6 LTS trees
pick it up, and
the commit message now describes the callback clobbering and the shared-que=
ue
reads. The stable note still flags the 8cc3aef0cb198 requirement for
older trees.

pw-bot: cr

> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112232444.2865382-1-rjethwani%40purestorage.com
