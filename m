Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958972;
	b=wUpjfxGdNDx+hQO/L92+9aCyeqh6y5f9XC5NDsBzrJHfRe3d8MfB6huewltzEexfM3Ui
	 2YHbPF2D6XrFzxpgXPoYsDFtaCfYTxsYlQJkpjZlsuF99NfjZV/X23+OLVF9c8QhYtzxT
	 RdSeB4OW9BadCR7B/33aVWP9L0RiqupbNvTN2V/dUrimg9ZsTaqCIZYySLqNcPOsxQvXh
	 bQtc70IuMoj6OeLyxMeeUI87aysuIwXLlyAOhqa/1MpgnqbsOz9DFdQhcsPEziscPzDmv
	 0u1gF3h33C90gIAw/TcfOxrZQ7d06YFJY50C7EleUGF5rZ4g0cWmRIOar9xTOZJ37ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=3nhCjbdUHAZ/lbE1yn1BmesdlSShcE2PicgJOJWXK2g=;
	b=HeQ6dBMYzdtAj1Y3nBOVFaYkNstDgL8ZEgMma6AQlT8iw2PZgM0iBTxBn/YN94xsYvri
	 JQcMS3FPhi1U0QRj0omNNWxtXvfOZ8CbtsIt9QghRLHv4vI+6BbGffKmr807hWn+tKT3f
	 SU/4QfkhjVy9iiIIB0Bgz2D/5O6QXKRaFN8rsc236GUz/1B+vKyfhffCO8KiktP63LGGS
	 k0vbGY99cYmEd7oBcc7TSAjBkbQRM5GUecYGg1dbe7EXjE+MtIpGuGpSnGf2lTG3ZRczl
	 4W7f+b7rMuFX40G2NjE5E2NX8QlKYw/5iXo0Cpft/mc0OsobaT6H0pgcAv3Xl0ilpjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yfe1xYQs;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA3B606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA3B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yfe1xYQs
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed00709df0so2854435ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958971; x=1795563771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3nhCjbdUHAZ/lbE1yn1BmesdlSShcE2PicgJOJWXK2g=;
        b=Yfe1xYQsbMHuSHWF0mg1w5F5Jvv1S0/ZTQM4Hvo/0mgPmVS9Rs16ciDuXWysL6vgn/
         z4nxe7Gs+9AgMJlcvuH7f5X9612kh9VE9lj8573vu9vmErkb1+M1bAxFH4US1Az83bnE
         9aorRiT81Y5UZ+npM8HUmFnl/je2VVo3HZyK2kujVu93sKPI34ag6OTIINeXU3nrn6iY
         z3ZsugaW7UdJmkimQ0N33XM7BPlmZO8+VjCqiePB+4MJ+5K7UMa0bfMRI6G5KIqNGab+
         2oZoiNCruvEZzZftQL7FXlPbv3B05IUJoYGY5LfHil6UmgjvbqvdahUApRo6VphP6ofY
         pXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958971; x=1795563771;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nhCjbdUHAZ/lbE1yn1BmesdlSShcE2PicgJOJWXK2g=;
        b=ZHDQbKTnaEurtWuOU4Y7yZnJ446tRyPUco/n0aHDCiRmHdAUQ0jMtKmje1z9x3zA+s
         orbL4wzLT8o/zIUIcGyRmlnU7g2nSgQCjf3pFDWpplVM7B4Nc0L9f8k9t4ITFu422go9
         R2yRDXsCm8fFNRHcrT+bGO5h/hSog3DXR64X7b54OwbiPWaGtqr3dUvipH304CPQTA6N
         EMA5hzFsZYr/6/BZ9QgQaAqN8Fw4pKilY+92s7BWuqeaVns4RTFYP0dmar+clEB+QoMz
         /y0V6qptOD+yj7PYZmocokhhhRscjK+a6As7XHKJbhuG/xEEd3dIimKk0l+F3BL3zTbp
         6Gyg==
X-Forwarded-Encrypted: i=1; AL+hErFMJDx4TW/aJlonGbddQBO/oGLASPOaBbVTtZiu4gyeYShnHGdwNgDmvC9qd/zrjrq45CgIkY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BrZJCdX3wyC/GnChs1eC4y0QdDWVrOu6ltmroSxSc1ruuNTl7
	V2hGe7iw3qKd5Qhl01l13Xpn+f+zNi5tMG3Sq/3amVb1Um0JegqqtfkelZPyql/LxCHvPorTiJu
	K+HcuGw==
X-Received: from plbml11.prod.google.com ([2002:a17:903:34cb:b0:2ef:e9a7:dfde])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3586:b0:2ef:d157:e128
 with SMTP id d9443c01a7336-2eff768f3a3mr7482755ad.52.1794958970629; Tue, 17
 Nov 2026 15:42:50 -0800 (PST)
Date: Tue, 17 Nov 2026 23:42:50 +0000
In-Reply-To: <CAL4WiipiADQzec6YVP6H0rQSzAXZCFdtZb2SemKTSAz0pzHs4Q@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-4-kuniyu@google.com>
 <CAL4WiipiADQzec6YVP6H0rQSzAXZCFdtZb2SemKTSAz0pzHs4Q@mail.gmail.com>
Message-ID: <avzl2v7GXVWc59wN@google.com>
Subject: Re: [PATCH v1 net 3/8] tcp: Don't bypass GTSM check for reqsk.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 09:45:57 +0100, Eric Dumazet wrote:
> Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > Since cited commits moved up TCP_NEW_SYN_RECV handling in
> > tcp_v4_err() and tcp_v6_err(), ICMP messages bypass IP_MINTTL
> > and IPV6_MINHOPCOUNT checks.
> >
> > The minimal repro is:
> >
> >   --ip_version=3Dipv6
> >    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> >   +0 setsockopt(3, SOL_IPV6, 73, [255], 4) =3D 0
> >   +0 bind(3, ..., ...) =3D 0
> >   +0 listen(3, 10) =3D 0
> >   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
> >   +0 > S. 0:0(0) ack 1 <mss 1440,nop,nop,sackOK>
> >   +0 < (ttl 1) icmp unreachable port_unreachable [0:0(0)]
> >   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
> >   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> >   +0 accept(3, ..., ...) =3D 4
> >   +0 %{assert tcpi_state =3D=3D TCP_ESTABLISHED}%
> >
> > Let's restore IP_MINTTL/IPV6_MINHOPCOUNT for reqsk.
> >
> > Fixes: 26e3736090e1 ("ipv4: tcp: handle ICMP messages on TCP_NEW_SYN_RE=
CV request sockets")
> > Fixes: 2215089b2244 ("ipv6: tcp: handle ICMP messages on TCP_NEW_SYN_RE=
CV request sockets")
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
>=20
> Note the same bypass exists in the receive path : in tcp_v4_rcv() and
> tcp_v6_rcv(), the TCP_NEW_SYN_RECV branch calls tcp_check_req() /
> tcp_child_process() and returns before reaching the min_ttl /
> min_hopcount check done after the process: label.

Yes, and we can move the block to after TIME_WAIT check only
as we don't save min_ttl/min_hopcount for now.

        if (sk->sk_state =3D=3D TCP_TIME_WAIT)
                goto do_time_wait;

I'll move the here in v2 (and if needed I can follow up on
net-next for TIME_WAIT).
