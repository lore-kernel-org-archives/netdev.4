Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545338;
	b=vIjeVaXlR0SIS/3+QCF1ki64/waJxYqP/ydmKyzum6tMhVH+59ft7O0Tzu1YPSsSnrjN
	 cExqJl2x/tHZwFXjZoS/8bVvsCViMd8is7D89Zx7zlY2wzWKCMc/2RnAvrYV86pDED1y/
	 cpOSSoX4mqUXm6NVY39Gvj8TmIZKk6l8MGvLuHxUgkBHe/sLVjKzp6Uy3us6KoNssQxjv
	 kvFFkqQcdbijS2cZYhdjtEVut+X0XVpIQveodgj1XP+IN0EOWlayd2va3TIocBiUtYYbH
	 /OFZJ6S0RrtsyspTFamDVz8HEMt/xlJf5Rx3+F237xRVANtOQZOAvl5/DNFDDzHwlow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545338;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:
	 References:X-Clacks-Overhead:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=fDl32fENKK5L6QSxy3ZJfcdRLbINbZoonP8NJB2nHWY=;
	b=d6kh4IEslyTB5bHJSBKRHJtzirEt9r6A5eQEs+u1cpY1FWCrVyEBCpvQDOQNcgu2MXdM
	 5K5LpvUlCTAe1dRL/yO9X/X9YiZJFGEhy+mT9khrX9FG2hqgF+NmTr2Nxs/ju/ShVoIta
	 tz8LonilC3oCnujqVD92aqfCk5xPqE6fiJzKNZeNENWtpzP/+OWjTTl9muCl4SaSF+kHn
	 5rKS7Bhsi9VNX++3kGkXRwOn/cxgeX7lDL4j61V6UpaRYou8nHfBBGyJ3dNOK2zMIwYAl
	 5sDjnCazAzKdAhmgOcsV96O+4PyDeXX9nrl9GjfNGpf4lM1Jwt7osNKirX2iCuj7d1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR23Knin;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8368F606A321;
	Tue, 24 Nov 2026 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR23Knin
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1EA1F000D2;
	Tue, 24 Nov 2026 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545338;
	bh=fDl32fENKK5L6QSxy3ZJfcdRLbINbZoonP8NJB2nHWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CR23KninORhyGf7S+TNP7Ki98gQ5VSiZ4ENMQRYU1BnXrq2lUPjr3B0HZXB1CrBiN
	 kD8tFKvZPAsTnzzrpOIrqqA2OeT1Ca/YBtTkBR+7xiFKkX/4tpXkhZ8uiYae8Olbvu
	 J4LElesDsmkOPXQ/8y29hs45/m8DDTXH5p1azOMKVExkMIDa6DqvtBhHy/zoHx0S1n
	 zfFf8g0dewhdyj/TEc1uqTlTiT6F0rkD39IBT+/egdSBJsQPFEdNLaRGixUOGIlHkh
	 eHvrZ6AfQNfDI/lh66zUzfXvnyWLr+mktkyCULrY1od2SAD/KY/tEf+L+cDIB9jNYx
	 RcUB8LXJRSm0g==
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id A0DC0B741C3; Tue, 24 Nov 2026 19:35:35 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>, Jonas =?utf-8?Q?K=C3=B6ppeler?=
 <j.koeppeler@tu-berlin.de>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri
 Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Simon
 Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>
Cc: cake@lists.bufferbloat.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/sched: sch_cake: fix unintended tin override
 with cake_mq
In-Reply-To: <34de8380-f2ea-42e2-87ff-97a52ec3200d@redhat.com>
References: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
 <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
 <34de8380-f2ea-42e2-87ff-97a52ec3200d@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 24 Nov 2026 19:35:35 +0100
Message-ID: <8733sqdqmg.fsf@toke.dk>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paolo Abeni <pabeni@redhat.com> writes:

> On 11/19/26 10:49, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Jonas K=C3=B6ppeler <j.koeppeler@tu-berlin.de> writes:
>>=20
>>> CAKE allows overriding the tin selection through skb->priority: if the
>>> major number of skb->priority matches the qdisc handle, the minor number
>>> selects the tin. With cake_mq, the per-queue CAKE instances are created
>>> through qdisc_create_dflt() and never get a handle assigned, so
>>> sch->handle is 0 for all of them.
>>>
>>> For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
>>> byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
>>> enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
>>> all with a major number of 0, which matches the handle of the cake_mq
>>> children. The minor number is then taken as a tin override and the DSCP
>>> mapping is skipped.
>>>
>>> With diffserv4 and diffserv8 this puts packets into the wrong tins. For
>>> example, AF13 (TOS byte 0x38) under diffserv4:
>>>
>>>    ip_forward():
>>>      skb->priority =3D ip_tos2prio[(0x38 & 0x1E) >> 1]
>>>                    =3D ip_tos2prio[12] =3D TC_PRIO_INTERACTIVE_BULK =3D=
 4
>>>    cake_select_tin():
>>>      TC_H_MAJ(4) =3D=3D 0 =3D=3D sch->handle
>>>      tin =3D bulk_order[4 - 1] =3D 3                     -> Voice
>>>
>>> whereas the DSCP table gives diffserv4[0x38 >> 2] =3D diffserv4[14] =3D=
 0,
>>> i.e. Best Effort. Likewise, AF21, AF31 and AF41 are demoted from Video
>>> to Best Effort. diffserv3 happens to be unaffected, because the only
>>> reachable override (priority 2) agrees with its DSCP table.
>>>
>>> Fix this by matching skb->priority against the major number of the
>>> parent cake_mq qdisc when the instance is part of cake_mq.
>>>
>>> Fixes: ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using =
cake on mq devices")
>>> Signed-off-by: Jonas K=C3=B6ppeler <j.koeppeler@tu-berlin.de>
>>=20
>> Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
>
> FYI, since this was broken since the beginning and does not look
> ultra-critical, I'm moving the patch to net-next.

Fine with me :)

-Toke
