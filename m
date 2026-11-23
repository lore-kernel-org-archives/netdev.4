Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441241;
	b=nSp7IGII0htP6oJiRWMSPNAQvXWHfBk6sc7mVLEQtmm5S6nZvk2Lx7b+DA3j1ZPM/fAK
	 zkCA2pDzPxr7YYjwoQi5D2in6xyhAxBn8uG7rqlCYRuzye/bLj7sR0D/CL3ezd3jcwDM1
	 jslvmjwDnMbaOKA8feNk7nCD9xLr/ig618FmNWA/ZVTnwEeuB1+a8GqBHhqY6itArOvHR
	 1HqgyTtipGFuPssavrc3iqDzacKRC7pxRSd9G80g4DIoYFEAe2J9Yz8C5nXzdoch2E/Wi
	 UDoqDs2vtbxhwN9Uj1NGEPcCRkQk7503EBhhOncd7zTaDJHbFrGWClCBKg1NZMjHFWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441241;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=nziyEOPopQDeZnuCi9xjHTCH+7zInZPDNY/uB2Wtw88=;
	b=G7u+COdWmQEsDP27dCmgxg5jg5NoC15wDsszV9Ym/RVQu/vFriJSBa79iZE30l/TTdKr
	 D/R8doiW2qiWRd1aG9xs41Mji17APjBtAIXxoHMIkIiajMGrlYh1qVfAHCFInsDfvXQ7i
	 CyBt6ldBPtzwt41GnYEBIb0FClYxpqIYkBF/fWtyqhx8syym66IhdZso3tD2dSBP9XiUM
	 ww8fRDJQcU0klS0Ta+qZZ+yYdDMXcjN3HYznMjacmhNN8+S+yETKNAoutLcj71VJXlnu/
	 g29yEouKhvazzJbZ8ZM58oEu9peGepEv96Rw6FJV86HkP4uTJ+Td0aJrPb8MteAofow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KqitsxUZ;
	arc=none smtp.remote-ip=91.218.175.19
Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671C606A33E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E671C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KqitsxUZ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/U/+GZkDiddmQc6MitDabS39SqSg7IIt9wb0rLSnNdA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795441236; v=1; x=1796046036;
 b=KqitsxUZ2Y9iYZ5B/TR3lHck/lrUy4HmSxsIPaQvS+sOs77N6IY6tIYBsKs7AzWHUpmAUgVU
 Bq9jc05621DkYZC4sNu7Jch326K0T5kUmur6xOiUGjGoVzqy6jXqcs/HbV7MEdZafvldZfxjrvz
 j2lPcNgoBlxwOByWQanzpzLQ=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee8e84438da3ae18;
	Mon, 23 Nov 2026 13:40:29 +0000
X-Mizu-Trace-ID: ee8e84438da3ae18
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 13:40:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: hangbin.liu@linux.dev
Message-ID: <4717cab46b8eec796eb97799240cd6ab92d8c1ed@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
To: "Andrea Mayer" <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Hangbin Liu" <liuhangbin@kylinos.cn>,
 "Stefano Salsano" <stefano.salsano@uniroma2.it>, "Justin Iurman"
 <justin.iurman@gmail.com>, "Andrea Mayer" <andrea@common-net.org>,
 "Andrea  Mayer" <andrea.mayer@uniroma2.it>
In-Reply-To: <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
 <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
 <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>

November 23, 2026 at 12:09 PM, "Andrea Mayer" <andrea.mayer@uniroma2.it> =
wrote:
>=20
>=20On Thu, 19 Nov 2026 21:55:21 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
>=20
>=20>=20
>=20> [snip]
> >  @@ -1031,6 +1187,25 @@ setup_end_flv_psp()
> >  SETUP_ERR=3D0
> >  }
> >=20=20
>=20>  +setup_endx_flv_psp()
> >  +{
> >  + SETUP_ERR=3D1
> >  +
> >  + setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
> >  + setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
> >  +
> >  + # The same SRv6 policies with setup_end_flv_psp except using End.X
> >  + setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:En=
d.X"
> >  + setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
> >  +
> >  + setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
> >  + "3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
> >  + setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
> >  + "4>3,3>1,1>h:next-csid,psp:End.X"
> >  +
> >  + SETUP_ERR=3D0
> >  +}
> >=20
>=20On v3, Sashiko asked whether the End.X tests would pass with End.X
> working as End. In this topology, the nh6 of each End.X is also the
> next hop that a lookup of the new DA gives, and the tests pass in both
> cases. An unreachable route in table 90 for the next SID, on rt-4 for
> (i.a) and on rt-3 for (i.c), would make End fail and leave End.X
> working. This is close to what Sashiko suggested on v3. What do you
> think about adding these two routes to the End.X scenario, each with
> its defer?
>=20

Oh,=20for i.a), do you mean add an unreach rt-2 SID on rt-4?
e.g. fcfcff:2::/32 unreachable? If yes, based on

#   (i.a) hs-1 -> hs-2: on the packets with DA=3Dfcff:3::400a, rt-1 inser=
ts the=20=20=20
#=20        extra SRH with SID List=3Dfcff:4::e,fcff:3::400a, and rt-4 co=
nsumes
#         it.=20
#=20        Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-=
2=20=20=20=20=20=20=20=20
#=20  (i.c) hs-1 -> hs-2: on the packets with DA=3Dfcbb:0:34a9::, rt-1 in=
serts the=20=20
#=20        extra SRH with SID List=3Dfcff:4::e,fcbb:0:34a9::, and rt-4 c=
onsumes
#         it.
#         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2

I think we should add the unreach rt-4 SID on rt-3, e.g. fcff:4::/32 and =
fcbb:4::/32,
because we need to use the neighbour route on rt-4 to redirect packet to =
rt-3 after
End action. What do you think?

Thanks
Hangbin
