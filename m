Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043633;
	b=bFuGsPZyeEwoWmls6zzHZFNMjJelGZb0whPnc1h/LRFd+Z38OM/SfMg+fmFSV7ACMwWg
	 hbolBXpAUUcg3nUx5eyyyGtJVPoD62p5MKd2dnZfX0hVhWQvJqx8Oys7w2tuNWDIs975a
	 CLHn/nByyZ+D3hoOPNNmKZF+L7kfjavU/nWo5ytbeXDIvKAEHlQNLN1UVVmwqSpUdndde
	 DtKeVZcKFv31Y/ZeilqJ56YrWaP+AELG0N8XGaaya8WyrXC63IhxAxmJDtSKcJ/UGuwWa
	 3hHkVddhYGiDv29gMsaYt1I7Q/ozWM/tIPT82+IzKrnc0feptztI4VPS1CqxJrZ5pCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U2sLAuN9XmB+8Qa4Z+TqAPFS0kw+btbeuIVWSXx3mKQ=;
	b=RbknOmpHjBdNDiBre+bUhTfBqZKB+aHYDtfcH+jz94y9/uKZ7VS6vg1521vU3orIHyZn
	 gLLczbjFcVYul9gEGaFfrWODrEtRyR3DnO3o7gQGfdgghxU3VAO5cda5KjBikqiuPHX7I
	 ln0mYlQXUslm86Lg7YitfB+P48J6NMEe6XCiynl06pBr+lIQq30+36roleHiqVJB0OU+b
	 kpYt0klbRmBR1JQDwbpnSndDeX+zSCKNOXfRiYvH/2k8QuCITWEQ/M2rxSW68E/N4tlqp
	 mfhQf2ippmgR4348Mg6g3vqX72Grmy93vGafZU+mDeD7Zh6H2gmcnmCmU1Ql8ymZbLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSLSNfcN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC760A2634
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSLSNfcN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67611F000CE
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795043632;
	bh=U2sLAuN9XmB+8Qa4Z+TqAPFS0kw+btbeuIVWSXx3mKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eSLSNfcNODBJWE+smdCpOQvgxJ3yCTsRV1ti30sCEnkO3vNdMdOkA/x7U53t7qXV3
	 By773AaFnvn0RoQGwDzS4etnUHqi4d+q+5OJO75RgPnRmYIsRqjyyi2k3AszecNcSC
	 +YRgzM6KApU8tIs+P3pJruiZu1zk8F2SUzR/1DHobGD2AfXhk6AOSZDBc7lXduqVAc
	 Qb2UKu9U8QdwlxsdcEP3ksLNa16GGGJWySlJsPwYyeOG3qwL5dFdQwQkiyG8fg676U
	 7TXOMVnrN0aktYPTMRTofxxQ7qeXKHDQvFvlVO5dTVVWKddCuhzyqWNfZLznJZz/lQ
	 NU6mi/L0c7L/w==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-86103aaac12so228150a34.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:13:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFNwGlHQXnRBuG4ofg8Wo3QffpuoGes5UbisVzPzpPGr0GvVjOzd8WQYT8zE4Ddxz4ucbgH0e8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q1zdib67zSbZVLtiop+KFAu0wHP5SP3Njh6x6ZfTebrQnluWy
	eNAewOmLm7SCObaR4lginYs+CYEk350177AiSZqxCYT85DrV0S22hx0JhTrczPJZ+Fuml4+11PT
	QOcYUt4ZZJfDlLR3pa1THDsA0YzwCfpE=
X-Received: by 2002:a05:6820:3505:20b0:71a:fb85:d056 with SMTP id
 006d021491bc7-71b2e1830d0mr153233eaf.6.1795043632256; Wed, 18 Nov 2026
 15:13:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
 <377f9f22-4ef6-4b55-9276-ffa4893eda1e@broadcom.com>
In-Reply-To: <377f9f22-4ef6-4b55-9276-ffa4893eda1e@broadcom.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 00:13:40 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqM4uAi-YZyWKc8nJv3TL67tU1VnKrAEXTpLV6Pgn0BrA@mail.gmail.com>
X-Gm-Features: AclHuK8eBwJrfhyin3SZg4bGLsa4kZahp_0pSqnbPmibibSVGeBRbc-WcUQOYsk
Message-ID: <CAL4WiiqM4uAi-YZyWKc8nJv3TL67tU1VnKrAEXTpLV6Pgn0BrA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a frame is dropped
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Justin Chen <justin.chen@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 22:01, Florian Fainelli
<florian.fainelli@broadcom.com> a =C3=A9crit :
>
> On 11/18/26 12:40, Nicolai Buchwitz wrote:
> > With xmit_more, queued frames reach the hardware only when a later fram=
e
> > writes TDMA_PROD_INDEX. If that frame is dropped, the write is skipped
> > and the queued frames wait for the next transmit on that ring, which ma=
y
> > never come.
> >
> > Write the producer index on the drop paths too.
> >
> > Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

I think this is a net candidate, even if you could not reproduce the bug.

Fixes: ddd0ca5d60b3 ("net: bcmgenet: add support for xmit_more")

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
