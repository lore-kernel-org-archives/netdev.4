Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081107;
	b=uqDOXXeAOgeMqY8zErwftd05OAhSkm55GqH+tKL7CF+nF7JZkJGQh5NKpfI3oj/PHeu/
	 cEamaAbZcsOwqHMA8hzCaYb48sXwWLQaqWxBIVsricrEEWRy8IP4rgfLYTNW5URbQh7ny
	 qx1wPu0rk/YPn6Ro6dAH40FZUnSzE8l5y+SU1VSB69a/w64momihQLk73Lgr5O4D7WEwH
	 qVDedWwGJQeGW2dgoV7nqv2TI28NcZds1q/CSnSnpuGH5iEmxoSgT9yipolGwlcRrkwIY
	 RCOG0KZXiGF7MPNrLpgAOIBe6OdRxBuRwzmMXVdEJWy5wrO/IYvquctGMb8s8ymhFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081107;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uzPlcHId7TW7FWgqbyn6Wh6K3YuV+RZW/v5XhOuWFmc=;
	b=5EgYKfUsH6BoEHXN//naR20IauaOz6P8bVjJeF7Kvz+5HSaHIuZqyNEbRjCN40hSSb94
	 +TW+AIUc6ppfEAX1IP6wNIujJ8lRMuHT0c+Th63J51AgZyc+MDtNm00FNBK/x6qUjIlME
	 AuzhLn/S4eiUpMRoK5vzQ+8pVRSOJCekiYoXOIKPyRIHDxPdjkhy67K6Tk8+bK57+PvWE
	 ZTYcIB/XCqnTXmc0C4Qb8lElILMAJyYjyCSs/y7tFuK6UjwpgXaHAeMbMXm2jgYur9xnW
	 dilTodgPBPTpWm5lFfkfWDTNphey7sCVJEaI3L7sVTkQyOE9Q1XqfApwyHKx1PoObNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmJ3A6Y8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182CC606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmJ3A6Y8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9998F1F000CC
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795081106;
	bh=uzPlcHId7TW7FWgqbyn6Wh6K3YuV+RZW/v5XhOuWFmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EmJ3A6Y8ndCXMiHCdM4vfBefqqfsNiLmz150UnFRUVpwc6rR2ECWRVqVnLoVf6Ewj
	 gwUfo/ckSHBM5/3tEsp3GuDP1djM6c7OWmF+MmgkUxX8omCx2hgIQ5d3hbEowPfCpz
	 XsfAXuXvYE39X8Dp3++9XxNLAqECiyzCdxjqWg/18Md3tvK41c5VpnFj7jbGvhTYjI
	 Adlmei6aWcauoYpmGJgDzboQpZ3ZKbBjOAnd+WRvYeCTlnoK7dtymUPrgOrHOfs/Nb
	 4/EoiagX7x2+TuOeZVIc0aeVSlGanGL24kjzfk58gWx0GeCJzWfwmz5RolD/RrvKTy
	 hP7tcXTDwWCzg==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71aed54d4c5so1329630eaf.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:38:26 -0800 (PST)
X-Gm-Message-State: APuU4Z+4kVddh5Mo7/Of6rDwjFBSWpmh4mjAyRgODKkXLsl9qcUY6i+a
	YislmRAyN1hzpTiCngkQ6Y/AgSI5HU3jbpqSm1Rp3msK672dQxNvwbWcyWBSGkDiF8k2Z8MKd8s
	PzJGRnfZooZGtUuTi3P/rdSaMFpRIGSg=
X-Received: by 2002:a05:6820:1517:b0:716:d827:9ecb with SMTP id
 006d021491bc7-71b1842dcd8mr3807739eaf.30.1795081105843; Thu, 19 Nov 2026
 01:38:25 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
 <20261118235055.1225115-5-vladimir.oltean@nxp.com> <CAL4WiipQ_=cN2+F0wFiMy8Ji-d2tfd6ZuBo3HCYiTEQ6RxF29g@mail.gmail.com>
 <av62HrrrRs8qwiHw@skbuf>
In-Reply-To: <av62HrrrRs8qwiHw@skbuf>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 10:38:14 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq29baq2c6X9YV6Vj8ymc4n6sTuvBUSHU5e=kPa2iFkKw@mail.gmail.com>
X-Gm-Features: AclHuK8vBJaJIv6TzFRAeRooYkV2ys6qCen-d_QhtxFZU_RN-wm6gOtvFUynZaU
Message-ID: <CAL4Wiiq29baq2c6X9YV6Vj8ymc4n6sTuvBUSHU5e=kPa2iFkKw@mail.gmail.com>
Subject: Re: [PATCH v2 net 4/4] net: enetc: let core segment GSO skb when
 headers exceed TSO_HEADER_SIZE
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 09:44, Vladimir Oltean
<vladimir.oltean@nxp.com> a =C3=A9crit :
>
> Hi Eric,
>
> On Thu, Nov 19, 2026 at 01:03:16AM +0100, Eric Dumazet wrote:
> > > Bizarrely, enetc is the only affected driver, because the core
> > > accidentally protects most other drivers against this bug in
> > > gso_features_check(). There, we have this logic that saves the day:
> > >
> > >         /* NETIF_F_IPV6_CSUM does not support IPv6 extension headers,
> > >          * so neither does TSO that depends on it.
> > >          */
> > >         if (features & NETIF_F_IPV6_CSUM &&
> > >             skb_has_ipv6_extension_hdr(skb))
> > >                 features &=3D ~(NETIF_F_IPV6_CSUM | NETIF_F_TSO6 | NE=
TIF_F_GSO_UDP_L4);
> > >
> > > enetc is the outlier because it only advertises the more complete
> > > NETIF_F_HW_CSUM, so for it, this fixup does not clear the NETIF_F_TSO=
6
> > > and NETIF_F_GSO_UDP_L4 bits.
> > >
> > > [ astute reviewers may ask: what if we disable NETIF_F_IPV6_CSUM at
> > >   runtime, via ethtool -k, so as to bypass this fixup, don't we make
> > >   all drivers vulnerable?
> > >   No, because netdev_fix_features() will trigger the code path which
> > >   also prints "Dropping TSO6 features since no CSUM feature.\n".
> > >   So TSO skbs will now be segmented in the stack. ]
> > >
> > > Surveying every driver that uses TSO_HEADER_SIZE:
> > >
> > >  Driver  | TSO6 | Checksum feature    | Core guard fires? | Verdict
> > >  ---------------|---------------------|-------------------|---------
> > >  enetc   | yes  | NETIF_F_HW_CSUM     | no                | vulnerabl=
e
> > >  bnxt    | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
> > >  nicvf   | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
> > >  otx2    | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
> > >  fec     | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
> > >  mvneta  | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
> > >  mvpp2   | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
> > >  mv643xx | no   | NETIF_F_IP_CSUM     | n/a               | safe
> > >  dpaa2   | no   | NETIF_F_IPV6_CSUM   | n/a               | safe (*)
> > >
> > > (*) dpaa2 also uses a fixed-size kmalloc(TSO_HEADER_SIZE) per segment=
,
> > > so the identical overflow would apply if it ever gained NETIF_F_TSO6.
> > >
> > > The above survey is what influenced the decision to make a localized
> > > patch in enetc_features_check() rather than create a huge disturbance=
 in
> > > the core, even though, IMO, TSO_HEADER_SIZE is a huge foot gun.
> >
> > I should probably rework my series :
> > https://lore.kernel.org/netdev/20260403043237.3909226-1-edumazet@google=
.com/
>
> Do you disagree with my analysis that only enetc risks corruption? I mean=
,
> for a second layer of defense, having tso_features_check() everywhere
> TSO_HEADER_SIZE is used probably makes sense, but I opted for a targeted
> fix because I couldn't justify it for the other drivers.

I agree with your analysis, I could not find another driver where
headers can exceed TSO_HEADER_SIZE today. Your targeted fix is fine
for net.

The other drivers are only safe as a side effect of the
NETIF_F_IPV6_CSUM rule in gso_features_check(), and none of them
bounds the header length in an ndo_features_check(). I might respin
the tso_features_check() series for net-next as a second layer
(calling vlan_features_check() this time), and enetc can be
converted on top.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
