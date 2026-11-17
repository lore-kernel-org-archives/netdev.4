Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959817;
	b=pz/BS5vos752mpdDpGu0fQ0KEB78K4afx0/01e8IgunhCVWhvwWMi7i1qYjhqzJOhoDz
	 S6uQAAw/JpL9IGlkl3VAO9otfdhjAmOnw6THy2DTq54yKu27Sq5p694o5WwAIyGP1Siyr
	 uA00nQ4Y8p/7SBCvCkwiT/dCBZ5plcbdkPGiS/lXlSRc/nvB0WjqX7Moo+VQNkMLgAkWl
	 sAQmiFnTXtB+GTy1fGVJNpuMJQTAst2ozKcHsTnxp6mvtHfYiKYq+x+B8jBNxQ1MlAKsQ
	 dOg/zx0wXfmDtur5+c43xrF+RO5UkMniD2pscQUY7p/3W5deygi96la3ED9HZRmIKtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=PyrU/vDOkbrP2QTFTqfJuP9D+saem688qYIpAztr/L8=;
	b=269D36hBf6/BAItKPNqFfnKpsYav/y6Aiyd3rC041Q/zJ1/wacpIOh1HdIZDw6voPJFP
	 1+NmqF4rIeaE1MSCCXu+LDgB0M14ul+hhFyR7/h8hlE3qJtGDd2SKuFXIhAC0U6mG/Vmx
	 jfa0/XTXFOuv05MycVnArB6DB62W+UaxNJ5j1tyUN9LMX5DHmte6LkCJyyT5Z5/e9H+22
	 LcnC4gdPGtTcpK1/BAIaMXdJYxFSyjqmUYgI3Hb5jeswYy7MacyiH7asoFxSwu9XsNued
	 BaOjcJnHFEqt6CTC9DTAQB/ui93hoEH+8MzEPSVYYuwRDXLcdgUDiF4Drnl4NXrUpcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b5gJZj2d;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B4B606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B4B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b5gJZj2d
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efad644688so2870455ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794959817; x=1795564617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PyrU/vDOkbrP2QTFTqfJuP9D+saem688qYIpAztr/L8=;
        b=b5gJZj2dLZMKemSAMwGX/AMfXTzJ979HMlrYf9M09D+TvOv5MYLuvT77zXhlLAER0p
         Nhe3qr3IdVOSsMI5v5mtY8tdbGNMwbBx+s8d0tvc7/mbXqfHOLBOvthgGPruJo3nFPz2
         xE1KEkcN+E0S+yr/tnv7Qv1Lxq7MUt4fE9BFDBxa0UIjE95pnZ866p6K7NyKsj9rMO+z
         i3BpwBhCY9oqI3PkRZbtNxfets1Z4twuBpBfR2DTok0VCo9gFkN5trwHuGr7IYwgblj2
         lkWBAoRYt+LlSexCoIY5tDN69Eh18vleC9AdNevHSSYJTLfBSE/1+BxliUzQvE6qdCTr
         jTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959817; x=1795564617;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyrU/vDOkbrP2QTFTqfJuP9D+saem688qYIpAztr/L8=;
        b=die2zzWmQij4hwZ9ILkZMR1Zf55rguFhmJZoyxuJudZJ8xetLSTzyQebfHikLCMNB6
         22PyYRja2MCh03qmQXiJNtqLizAKRlhIGLv9PAdrkex+cCehGfitKRjaQyhyeDtKRSTt
         7TG3cQIIiIX0dPlkdiq5xLzTyLN0WeRznO2O0xv/22Wt8WGnNF9ftOSJvcuvY7tLtbnx
         zuq+B4TLcpH1Nme9df1eoYvjZofTfyValnJIZG+WRsxU9hdK5c+84JZpWOGVC6gDZ1dz
         pTrhN7J1CK31V9cHz41sMtpwIIH8bQUccXr6F7O/Y3JSHu8PhPrbhD3i9UPtunjyFJ47
         bGRg==
X-Forwarded-Encrypted: i=1; AL+hErHRK1BBHIddeiXe8DbQaJAeKBnTiTlSM5nDLWgcl1d2A/7lrTZyHDjcZdwczZeG5rt1VMoO5JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aEp0RSkpr1Vks2RwkIzwnyrDrlIFuij4L/J82tnrx0fYQOsPw
	/jZoDYw+vjwz3mLY+I7nHLXSMGgOrqVxaBUeT7O/msF31FkL8bgosEp+bVLfXVpHdr4c6juU2r+
	8O9iwpQ==
X-Received: from plblg4.prod.google.com ([2002:a17:902:fb84:b0:2ef:fb3c:c944])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3787:b0:2e4:a360:fcc6
 with SMTP id d9443c01a7336-2eff751fd9emr7727685ad.35.1794959816515; Tue, 17
 Nov 2026 15:56:56 -0800 (PST)
Date: Tue, 17 Nov 2026 23:56:56 +0000
In-Reply-To: <CAL4WiioNcgo6sS1ULk6TG0dWeM01Xt8yE7vMg-53YT52gXXOfA@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-9-kuniyu@google.com>
 <CAL4WiioNcgo6sS1ULk6TG0dWeM01Xt8yE7vMg-53YT52gXXOfA@mail.gmail.com>
Message-ID: <avznBvTcz5FwPwca@google.com>
Subject: Re: [PATCH v1 net 8/8] tcp: Pass inet6_iif() to __inet6_lookup_established()
 in tcp_v6_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 10:03:39 +0100, Eric Dumazet wrote:
> Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > tcp_v6_err() passes skb->dev->ifindex to __inet6_lookup_established().
> >
> > When ICMP is sent to a local address not on loopback device,
> > ip6_rt_get_dev_rcu() sets dst->dev to lo and ip6_rt_copy_init()
> > sets rt6i_idev to the actual device.
> >
> > In ip6_rcv_core(), skb->dev is still lo, but IP6CB(skb)->iif
> > is set to ip6_dst_idev(skb_dst(skb))->dev->ifindex.
> >
> > So skb->dev->ifindex is 1 while inet6_iif(skb) points to the
> > actual device.
> >
> > Since tcp_v6_err() passes the wrong ifindex, such an ICMP error
> > is not delivered.
> >
> > For example, this script creates a socket bound to tun0 and
> > generates ICMPv6 Port Unreachable to it, but the socket cannot
> > receive it and getsockopt() fails:
> >
> >   --ip_version=3Dipv6
> >    0 `ip link set lo up`
> >   +0 `ip6tables -A OUTPUT -p tcp -j REJECT`
> >   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
> >   +0 setsockopt(3, SOL_SOCKET, SO_BINDTODEVICE, "tun0", 4) =3D 0
> >   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress=
)
> >   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) =3D 0
> >
> > Let's pass inet6_iif() to __inet6_lookup_established().
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
>=20
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
>=20
> I wonder if you could send (maybe later in net-next) packetdrill tests
> for 7 and 8 ?

Sure, will add tests in net-next.

The original repro was too hacky to use vrf (with python script
embeded in packetdrill or --ip_any and TCP_REPAIR), and I finally
used netfilter.

I'll see if there is a good test or a better way, or I'll add
CONFIG_NETFILTER_XXX etc to config.

Thanks !
