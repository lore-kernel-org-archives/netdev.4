Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933565;
	b=4k/FXukWuzJzQs3z+LHJIJDAwebmQTEnUMSy8rMUlBS9WfyofDYGbF9ZSmLFBQMvaXZC
	 naf6KFtOWnSlZ4HbqE4T0qnFLVL2ZMB/mmKyu9/tp4FlvobEV3oGiq+QbmMd7K0+ucW/x
	 ENS1J3huqUIeR5jNRoQ8IKQKxbH76t7M/OueAsA765/P0ihUZcnhbhaZ8Xbtv30BCLtF7
	 t8DskWta0nOEzSChsYzbv8o6bFwnrSazpxedrGcxXGwqIThDLdPNWrI0uHVXcWvGdn/Lu
	 L39U37mg7u11Ox30I855Uxd2LHj7JXMWe+iHfwJ4a3HeBUOOJN+7g9VwP+dCVCSuNHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1yMLSDxkDlgkYE94GCll9k9idUAgyt2V1MICT6ujyig=;
	b=46bnBrip5Lw6wJMMSpj8/voB+A7SJeDKlgvpmnsT9775zn1RQMP6Vv+8WWZSB68fiLnj
	 9vcn/k+IrvVpv6X1k0Gg037QRIsl0vxqRltSWI/V/KU0yESWW/xBLHmJL/OoxXS0Rr7kt
	 LyhV6Noup1z9PUD3d0sFbji2PRVvCUTM4nid6ny0hzLw16RpJq8SgsWujWXSR4EIC5zk1
	 48F9+y0Kuiiif6e8U0NgomZZwsbqOWJr3ZuhiDqr57wqwkr64MZdWCE69H7/FlR+qbopb
	 KH4kMzxrjVZzCMOzbGRX6DunZsplipGEuraJ4n7QXKeyFJESWFhhEO+z0yz1Z+W8vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fTE72B86;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869B606A898
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B869B606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fTE72B86
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so386131f8f.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794933562; x=1795538362; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1yMLSDxkDlgkYE94GCll9k9idUAgyt2V1MICT6ujyig=;
        b=fTE72B86Z5rEBpDKAc4NHne/GnXGff3y7H6Jsc0ARGDiGlXWQffN+vDa57pln4ARyL
         +1G26BfEIl+HbVOj8TA3zSW1iNP9Exo768h3A9fSHxf1A+G4JzKjyZmNEbRVK3OkKcg2
         ZEYnzKWCZf2SHWcITYJs9lOAqrrzZPxMt6krNLkAMsJlTuduP0x2y7nYx9OSgn5tmOQc
         3GQldmEymfObWSixuhNM6I5Mvd8VHZwvi+nOGLSVWlk5ZzEm+E3HJN1gWAo3zwQFeuvx
         9iNDKhUwBHSxIZWVigOWMhavG6aeEqqoqaTE87khyMl0FdFXi08urXs13qAdOls/ZlVA
         Zdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933562; x=1795538362;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yMLSDxkDlgkYE94GCll9k9idUAgyt2V1MICT6ujyig=;
        b=qegQL+QWpwkC+ZTdVM4a6U19aLpryuw4GJhBzZcFy/JCHR95sBFNFGHMHk8D2S5/98
         1qmSB6riDVOKXfk1RiRBX6y0klgBsCrGDZqvNef9BbjyCZ/lVGgvcwXMM1Z6DAAYPjDU
         J3OFpJCMijkNfxPsS/HkhCuXDnNWTbPl/z0on+bYoaJSgizlt3PG+QRfa8Pn7gd+fujE
         gqbTXk0Jtb/JO41su6cGNcCWbqWFLP8u3zQt/cjGxFzubcZfjIZWvZr+2ZoTQn97hlRo
         hCVcByEta9URgFJistNPTLjuXB0qPox8ykrQA5GqczeaWXlZxRCgdoO7hoUPC6xwvJf6
         hF7Q==
X-Forwarded-Encrypted: i=1; AL+hErHje8C6j+n9E0K+Z7eYCqc1DVDWTd5EeFlnwwug2lqEXQswSaskMr2ZlKo83RQSjPTzlHLNWuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HnvDjD8DnbMRwK5rLtENzFXZxCZJpizi2BrezQ5enJNrTjlxs
	KrHqGKBy9efBLNhw0R9pqodGCUAJ84W08AGLYNQ6XeZZFcOvOWlTnTFkzzdASkyvlfgBNdcl/6S
	BG1eURLox
X-Gm-Gg: AZFdTZeI2D7CHfN/oD98Wude/1S287EPwQy6aFsVARP6doP5N+8tF/9d2YQClE+mB8h
	X+o/K0feK0Pn7vnqsydUVpwJ6RUZ4nfFrYTdpyLBPpKZaBkD3Jc3b33qw8AFuf1/Ji2TlURLI1N
	grCHr2iUC+jsz7CciWeR5l0H/bCbWQO/B4L6Jz8Lew+XAzURWy/h47fm/Ab639zl5DtNWEfLsJg
	3DRjSv/QJ4lqc6kWzQI90wBsJj6dfwTRu3ur5J5lK3UBsr2URpFj+l9rs0J+dRb1VO5fukAHTuC
	iSz16L765Sbf/2WWinclqblutOtv9p/b5sQDJqXGaWaQzZ3Un1HGKS1R9cPMxtistAOGxXVeyDi
	UGPgRbxK07Rtmc5sUMjqZgQSRDqErSIyqaCzkFHJmq5AoKghSGzeUEQei/m3wTv6LhYmD3VIoJr
	+ZfbyhU0fU35YLw3euY39mDdZ8w4Nv42INfDH1ynardJ/WqXnGqq54N3eyzHHQrOs8odFEUywxC
	M8Lo9I/9/zz/AIcUFgAoDbdVuwhA0ZwTBYDmsAUpYkAiM47h5EGLm/8bfWVmrlnAkeU3Kh4jabU
	IVqjrQ78Fl3DbdMTTE4vTCvHqiHWkMI/mNT2OWEMyf6COzRKZ5XtEXL8rInR5k9K1u+ep/y60Mg
	yFPq3k86F5ed3SO6TXkaKEeTC4TQL7obsj3nxkPUXWJ7rOJiZHaU6jazI
X-Received: by 2002:a05:6000:15d7:b0:48e:e98:8b6a with SMTP id ffacd0b85a97d-4a6332bcccfmr19985f8f.4.1794933562080;
        Tue, 17 Nov 2026 08:39:22 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:dd2a:c8cf:5d96:bf5b? (p200300cf572c2800dd2ac8cf5d96bf5b.dip0.t-ipconnect.de. [2003:cf:572c:2800:dd2a:c8cf:5d96:bf5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a43d41ec38sm4564311f8f.19.2026.11.17.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:21 -0800 (PST)
Message-ID: <a0f9a7e10bee8b5d328de14e1bbdbf74f5712d43.camel@amutable.com>
Subject: Re: [PATCH net 1/2] net: don't leak pidfds through a short
 SO_PEERPIDFD optlen
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, "David S. Miller"
	 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,  Sashiko
 <sashiko-bot@kernel.org>
Date: Tue, 17 Nov 2026 17:39:20 +0100
In-Reply-To: <20261117-work-net-peerpidfd_short_optlen-v1-1-a93f56288501@kernel.org>
References: 
	<20261117-work-net-peerpidfd_short_optlen-v1-0-a93f56288501@kernel.org>
	 <20261117-work-net-peerpidfd_short_optlen-v1-1-a93f56288501@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-17 at 16:25 +0100, Christian Brauner wrote:
> sk_getsockopt_peerpidfd() caps the caller's optlen at sizeof(int) but
> never checks that it is at least that large. sk_getsockopt() only
> rejects a negative optlen. So with an optlen of 0 to 3 we still
> allocate a pidfd via pidfd_prepare(), copy zero to three bytes of the
> fd number to userspace, write the short optlen back and then
> fd_install() the pidfd anyway.
>=20
> getsockopt() reports success but the caller only got part of the fd
> number or none of it at all. It has no sane way to find out which fd
> it
> has to close and the pidfd stays in its file descriptor table until
> the
> process exits. Calling it in a loop fills up the table.
>=20
> scm_pidfd_recv() deals with the same problem for SCM_PIDFD. Since
> put_cmsg() doesn't fail on truncation it checks the size of the
> control
> buffer itself and sets MSG_CTRUNC before it allocates a pidfd.
>=20
> There's no point in handing out part of a file descriptor number. So
> fail with EINVAL if optlen is smaller than sizeof(int) before we
> prepare a pidfd. Since commit e10899b2a098 ("net: add
> SO_PEERPIDFD_THREAD to get a thread-specific pidfd") SO_PEERPIDFD and
> SO_PEERPIDFD_THREAD share the helper and the latter inherited the
> bug,
> so this fixes both.
>=20
> Fixes: 7b26952a91cf ("net: core: add getsockopt SO_PEERPIDFD")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-205984@kernel.org

Ugh, I wonder how I didn't notice this before... :(

Thanks, Christian!

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0net/core/sock.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/net/core/sock.c b/net/core/sock.c
> index ad414878dc5ba..74a00a5e2d116 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1746,8 +1746,10 @@ static int sk_getsockopt_peerpidfd(struct sock
> *sk, enum pid_type type,
> =C2=A0	struct pid *peer_pid;
> =C2=A0	int pidfd;
> =C2=A0
> -	if (len > sizeof(pidfd))
> -		len =3D sizeof(pidfd);
> +	/* Userspace can't close a pidfd whose number it didn't get.
> */
> +	if (len < sizeof(pidfd))
> +		return -EINVAL;
> +	len =3D sizeof(pidfd);
> =C2=A0
> =C2=A0	spin_lock(&sk->sk_peer_lock);
> =C2=A0	peer_pid =3D get_pid(sk->sk_peer_pid[type]);
