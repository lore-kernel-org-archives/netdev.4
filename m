Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795621940;
	b=ZsAld7wurQHmCYCXCsrjO48RjoVwbTmLarSXrc8/RR2xZxKhFydVucN9YRmNouflOjQB
	 UMvfRMB6eQKmApegXyGbubyk36+8ZlxXZkO3HLnHWJgN4DFP71S605nYLcyjsX5wGXQzv
	 pZfXKT6guBtMMUru5H7WRe4BRNecwZ6uHFdnNTO2ybFjtL73D2nSu+rCoUbvpBFW9Uahh
	 5yG2Ff7j4G332TV5DOhnYYJSEkeJ1ScOExAlDwhaqPS8H5qzJ84M1Nn2SLvvkouImzm41
	 S1ZrqtrgBea9zWGXEbtoK90lYEVPcD31PGcOEgexEIBl625vSROFAtk7puEhndw3ndw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
	b=PB66yUOUdEdBxrOVdY2Qq2cz8H+8AfE/K9tvslgS8AE2rBjhvVczG55dML6GWJlqX229
	 4vGoJg+hqjBO6jVUO4HelxG7kC00igMs4ZCA4MOWQ5nJ/bFl5a5w+BkwadXmjmppCRyIL
	 nh5qQM4t8DL5QU8xTmc7ewLBoE+nD7WEHG8uX8s+EmIP5wdJBL+lah/IyhE96eJDOhM13
	 DojjHOPGw2FHIOAqHeJsS1AMLoW3xoM+GMpf/S/EUWGzL9ItA11pnRclb4jnhg6jiEbX1
	 iGcVzyA3A3r3swc5TjOtCjtgLRJMN9ygh6jL2aFLtf1R4Z+UgKon7b9LhA1Rf3MBdmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm0fDUCQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E0606A331
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756E0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm0fDUCQ
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so3162413b3a.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795621939; cv=none;
        d=google.com; s=arc-20260327;
        b=hO/7WYraHGQmP9qM0bJtzm2WzPp1yXDI0YwoZQ1sSyPkgLOcrlwlIgTgZGeQPS+Awo
         DOo7tVM/uzQrdLIn9bHmta0xXWvrQNcDd8A7usQn4pZYGtbkzYPwfwSG/0dE8qvGftM9
         4dX1Y0fzGDncRBmFWWNVXVf8bxIUvbQQELh+uAzF+0cxp+Yp121qO7Ew8wjah+TlfvUK
         ScSNsV2q6YerdEYx5I002gf1s9Yt5hojWRcc5dRJulZvN7j6WjRpK36xI34yIbuMmA4a
         +GCnghwjqUTeXBd7QJjUmVyT1kDDNRUTeyGUPlikyJUX6PaElVXcz19DOB6JQmgDv8wv
         jkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        fh=Q44qy7rVmEssU9q4ascC//HzX7jl2aqKOhPuYMvWMzg=;
        b=AzoJL+RvSCJ3ErGWnbR8zFXFh8ZCOatv/GdfpInZklvsCwQZHPitJiTDDjZDPWyoNX
         F750Ar6lzUNw9QJkQY4barTWNvdb2evapGhtEkNH+DJPKCbSobIFOIEAJ6iNEsYPTOIb
         9wAXm/4JWDH9LApQiVEg/396iLNDlt5g+OdyN1U2SnIMYsCBKIhEShVxwCU/Kn8BV1xo
         pjN3DKbQtKDlMA1Y0Sz4OH6yWo0kYZCmshqwVpJ3deKpLm2CbjAeXTAjEkORndEzWsiT
         mYmaodKG3dmkX8/h4BQdiSaDoqwwkQ8K2jy6vhOuvNFWn2li/5EwrPscFAhPdQqoZrQU
         bW+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621939; x=1796226739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        b=pm0fDUCQ7nag0X4lU7E3i9TxndNJtKUDIoO5+NbPuYmF4IR0xA/RNxflW8a9gzz3g6
         BRNP+lsmXSQ//T5DCAB0JLHnurDrjB1Y1Rq/W45mmBq+AIep8o75lE9Bivv6zYb9X+wv
         6gFFYaRk3M6CVzOGT/z+tz4yJSiL6X+VBMydvOqsKZ/i/0sED4o9HK38N26bp0tFJTY5
         jrE2c+oHHOZNtt4EflnTieEv+mkajApgUjRzyhrw1PZDlPi0lxPZ1Re8eKVkBwk5MriD
         TdxPei8Iz5R9DIclcPCM69s655AjS+NYcYzu1bqXuOPhMDBp8Wzz5M7HIb+cr3/nevpv
         AsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621939; x=1796226739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl1gc75zEow3srAWy7eV7VFmzyOiVWcKqUcpVHuYC6w=;
        b=L0usnJi8bRH11LnYRwnu/e46ufVHmL/lCXLRXw5q0yMh50v0bYSXJHz/19JqyTMprx
         28QMbbnQGwsTzOB4Atbh6iZXHVStkpyyYtxsh6YliB8gbTtNEcQOas0An4g5WsddoXw1
         swEmyO1JttCXBGpAcQnd/sjzunofByY62le+YagoQCgpCoXAcPtdlzXQf/mRJ9uKccMQ
         LnEMARTl4iBSmyfY8A6/kmbrwdRqLdAENwKKVSvfBamWica+4pT/iAab30cZaHSvdtCq
         PxzwOGRgWWwMopyud4UPHDSUpomFcNxgNw2oHZITsBTCL3AuexA60mSKIQhnsOiGeZEJ
         Z2Iw==
X-Gm-Message-State: APuU4Z8fRM5Xx9cYKvKJmi8zyWQuKRfa9Wkvb3uBirHpoGmYij1VLoAQ
	EthpFJE+VnRIBK1uMF+bk+bPVUCcRTx43lhP5UJHehw5cb3/y88Ye9xZJezL4HjRSmekNHNyR8+
	1Ls5icnlWx5m/GBKX1tUj1cDBT3kv8/9m3S4xyaMlHw==
X-Gm-Gg: AZFdTZcvweG4rBDiwnDdKFsp2u5BgSeE0b0aUZvwxkbqtcWp+dLUOlRsuLvU3Ds6uwR
	+qbJ95ilOYA8hqQJgUX2c2MUmrgki/U5zdGjQ18L0yxpY7jwlGBHCKl8cnv/lDkFz/1iLPIp+6S
	ensHFmiO16MIKhy3S4CsagsSQxPdP8K2vaqsOmK8CWxlHOJ8j5tOEmmUjEcao8BN+c28lCJBOTl
	LpVThYG7D6znrNefQfUhJgMwQvDtB+i1e2JfPB4bZfuV/QqNtYSipMsQKljJNgyo3+bkGLa6nTX
	/BpdU0M+K+rWZ2Sxy8t/+0HYzA2KWxtIcRI33xa+8RIIauqyWw0Ge1v9PG0WuNLLXSd+MQ0NWT0
	9ILMoGBKGOjEKyFB//ybNCuaPPQWkTOBiBZ23M9MocUYNFxuSaNdRLywNCU7RlAMG/6mE0sm87A
	hh4KNcp7BXsXvpdJ4Q266XG1MsHDvZ5mZQJH1FyT1gXcJfNlYzzNSYQ0Lt4X0q0iVKaxaZ
X-Received: by 2002:a05:6a00:1c84:b0:89d:a947:9d58 with SMTP id
 d2e1a72fcca58-8c87bfa78d6mr15873197b3a.25.1795621938615; Wed, 25 Nov 2026
 07:52:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5c305e22057f748d5c4d4cbc94a1e14271dbc485.1795393691.git.lucien.xin@gmail.com>
 <179548328755.3135.13551034983466058259@kernel.org>
In-Reply-To: <179548328755.3135.13551034983466058259@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 10:52:07 -0500
X-Gm-Features: Aa3M54pb6nKYJidOZT5TgP5nXd3wLNCTpX3AZEaTxx4hR_vcQqSA7EC-JYn_mcw
Message-ID: <CADvbK_e4PXuzSrvuErCMQ2wPSFrvOW7-JwruzUBbLeENkKOg9w@mail.gmail.com>
Subject: Re: [PATCH net-next v19 15/15] quic: add packet parser base
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
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
> - [Medium] When ALPN demux is enabled, a valid ClientHello with an ALPN
>   extension longer than 128 bytes is silently dropped, so that client=E2=
=80=A6
>
> --
>
> quic: add packet parser base
>
> This patch adds RX packet parsing for QUIC. Sockets are looked up by
> connection ID and address, and Initial packets are decrypted to pull ALPN
> out of the TLS ClientHello so the right listener can be selected. It also
> adds ICMP PMTU handling, deferred packet processing, and the request sock
> and backlog infrastructure for incoming connections.
>
> > diff --git a/net/quic/packet.c b/net/quic/packet.c
> > index b6f76681b6902..919745d954403 100644
> > --- a/net/quic/packet.c
> > +++ b/net/quic/packet.c
>
> [ ... ]
>
> > +     /* Read TLS extensions length (2 bytes). */
> > +     if (!quic_get_int(&p, &len, &length, 2))
> > +             return err;
> > +     if (len > (u32)length) /* Limit len to extensions length if large=
r. */
> > +             len =3D length;
> > +     while (len >=3D 4) { /* Scan extensions for ALPN (TLS_EXT_alpn). =
*/
> > +             if (exts++ >=3D TLS_MAX_EXTENSIONS)
> > +                     return err;
> > +             if (!quic_get_int(&p, &len, &type, 2))
> > +                     break;
> > +             if (!quic_get_int(&p, &len, &length, 2))
> > +                     break;
> > +             /* Incomplete TLS extensions: skip ALPN demux. */
> > +             if (len < (u32)length)
> > +                     return 0;
> > +             if (type =3D=3D TLS_EXT_alpn) { /* Found ALPN extension. =
*/
> > +                     if (length > QUIC_ALPN_MAX_LEN)
> > +                             return err;
>
> [Severity: Medium]
>
> Is returning err the right choice in quic_packet_get_alpn() when the ALPN
> extension is longer than QUIC_ALPN_MAX_LEN (128)?
>
> RFC 7301 defines ProtocolNameList<2..2^16-1>, so a ClientHello that offer=
s
> more than 128 bytes of protocol names is still well formed.
>
> Other cases this parser cannot demux return 0 and keep the current
> listener. Those cases are a missing CRYPTO frame, a non-zero CRYPTO offse=
t
> and incomplete extensions.
>
> The caller, quic_packet_listen_process(), frees the skb on any error:
>
>         err =3D quic_packet_get_alpn(skb, &alpns);
>         if (err) {
>                 kfree_skb(skb);
>                 return err;
>         }
>
> With quic_alpn_demux_key enabled, would this drop the client's first
> Initial packet with no response? No request sock is created and nothing i=
s
> sent back. Each retransmit of the same ClientHello would be dropped the
> same way, so the handshake would time out.
>
> This path also does not increment any MIB drop counter. The decrypt
> failure path above it counts QUIC_MIB_PKT_DECDROP.
>
> Would it be more consistent to return 0 here and skip demux, as the
> function already does for the other cases it cannot demux?
>
False.

We expect to handle it by either discard it or route it to the socket with
right ALPN if there's ALPN find, instead of routing it to the incorrect
socket, besides, ALPN > QUIC_ALPN_MAX_LEN (128) is very uncommon in QUIC.

> > +                     len =3D length;
> > +                     found =3D 1;
> > +                     break;
> > +             }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
