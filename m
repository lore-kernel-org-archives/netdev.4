Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425813;
	b=SSVnY6W2H6pGIMRS++D53MfoMIze4ZEeBLq6NTxe7df84vtCzOh9tqGWM91ATsbHnJPM
	 0SXKk3CMnYmm2uTFqUvwhXuQiAb1TcLGKG43mBk7X2klzNZyZBAb+5nyRszXpkxeGxF4J
	 qcz/JsxaIOGkeACWMAlIB3GJXfNU2HgboLkHQNE081H4BWheLX4Pa511AF3f+DJRhadov
	 fyDJdmZm/nF0btk7k2eMv+7WVuRKbf9O/MbvqK45P6ctzl42g297VSbklOFP3RChwI82U
	 fL4sOT91Xo6QvHQEbk2DPj/mvrJMi1Ogxy9UdQQ16IWBsTKhR7xlUYwRewViHnc/OhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425813;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DCCWNT2UZnY2HAu6a7Bi9Tv7MO6Gz0H6Q0FmsketR2s=;
	b=er/D6DdvxQsFi9n89pQl7TGAQk3BxuDcv8tSK+2KefqRpzXJ927+9uiEDs8YvYu2jGH+
	 HwoXta22CW++aU30q1m/Frpq7BLhssFS1hhi/tFWpYr9XCBg4TSt7v26tDzGLBu8mmFRT
	 a7LHhO8VaAu7Kjhu1npdjcpvsO89U9OOGg9YYNvG/ZVGYKZcrKl/rZLtA69Ju8NLWj786
	 1DmvpWbRHP74aZLct1ZsG0XJcVZ+L4zhG/Zo2AQkrAd7T3djaSAeBawkQnDi+S/LoM1qC
	 uCi44wEylp39fwJOlSBfYTCksvPloVIohEUmcs8qtveGwjP9OfgKw0nlJxmmJldx6Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h/w5HXnz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E65606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/w5HXnz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5911F000D1
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425812;
	bh=DCCWNT2UZnY2HAu6a7Bi9Tv7MO6Gz0H6Q0FmsketR2s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h/w5HXnz/L6KL2RuFzRWf47Z+bKXDqoIiOpQkAdLwoEZCRqQP01VaDx5P0+Bo8OeI
	 s5KkC1t+dg3BPAObJyuseCBsozgp1/cX+BL95WxcAgi3mc37ts2FhL1+KQmNFuR1nY
	 8mMO0xc8Pavq3kqk6slr3P+cwnkXhtxI9aRsk+S5r/IDZX365dwwFaWJGxY6ziMkn/
	 tU9+cxFkD8mBc+MlSNHIzDnK2conIJ3OuDwuPN2M6Po4YXCLePePU2NCPIiL6INM3p
	 HyQ+YJG3fY7DfC192/3AriXkiZ+EXNbIkrKSu930TzN17t4aLHclpDbNC0OVfOP1lS
	 pmweXl3/Hg9eA==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71ac9e15640so1945770eaf.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3b4TLnV0KFwIcKUzz1qvsxL/RbX8vDdMDaA02GPNEmGgxroxsDg2ciuSrDHxG32uUUovB1cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FLEAVDiNuxDhWs3yLqLwyVYOoOTRRi9G1AuY72nngcKyTuGhD
	t/IK7rm23qoGcCk8bA1fcF+CfHHD4aSQgJyD07itLFZ+TpxRUX0RjbKEH5t71iSyK7qpmOGpr9I
	2BLo7b3YjZzkZUKB8L6w46KjlFxHtHEw=
X-Received: by 2002:a05:6820:c305:b0:71b:2e57:16ee with SMTP id
 006d021491bc7-71b3953591fmr6771040eaf.64.1795425811745; Mon, 23 Nov 2026
 01:23:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118224758.1617869-1-edumazet@kernel.org> <20261120175424.0c0403d5@kernel.org>
In-Reply-To: <20261120175424.0c0403d5@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:23:20 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqYqOmApJo13sKEZY4E8-OyjsLh_CS3JRpzPKS7-eNUAg@mail.gmail.com>
X-Gm-Features: Aa3M54pNLxYlcZ-nMKdQNjURrW487nA3quqsTOpxNMtpbtE4Bv6FbP7tFMV_4E8
Message-ID: <CAL4WiiqYqOmApJo13sKEZY4E8-OyjsLh_CS3JRpzPKS7-eNUAg@mail.gmail.com>
Subject: Re: [PATCH net-next] tls: wait for a single RCU grace period in tls_device_down()
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 21 nov. 2026 =C3=A0 02:54, Jakub Kicinski <kuba@kernel.org> a =C3=
=A9crit :
>
> On Wed, 18 Nov 2026 23:47:58 +0100 Eric Dumazet wrote:
> > tls_device_down() calls synchronize_net() for each offloaded context
> > bound to the device going down. As this runs from the NETDEV_DOWN
> > notifier, a device with N offloaded sockets waits for N RCU grace
> > periods while RTNL is held.
>
> Looks like this needs a respin, conflicts with a fix that came in via
> net.

Sure, I am adding Jiayuan Chen tests in v2.

pw-bot: cr
