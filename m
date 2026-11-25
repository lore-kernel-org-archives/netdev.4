Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603997;
	b=5ohSKsh+QkpHjteZRIhOOZYqf7X23BbVFR3kXjweoaFt25+3aPuHqPKgeJSopMwbQrO4
	 Np7r5v9IvyLxPx264AcybHLJQkeRPoS3ym4Fk3T9bhRFKJq+zbBs+XP/R3mY6QoEqCH0v
	 q8CXln26SXvFfGdSLCr8bm6p/OEffJuI/YxF0DchUqqdK2MqGQzNMwFWvyTTVabs0x7C7
	 rDC2vEo2chHq8C3Cn1JiBir352eak33oBr5OL5q7JsdK7/hVAP187miyq0WPis5winDv6
	 Euu5xJg6HveYg8x3vMHmMpeq4/H0vDDvqHz1V7eaQslhpyT9d2xEJtHkKeH3QbLgzHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603997;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IMedBWjX3od9XnP02Tr+7kPdu9op0gEHiwtOGI7i/ss=;
	b=PtghNJd0xiNvBrffX/dBHZ1sZEiWK5nV0niw9VvupBA2/pMa/gb4kWH5OkVY2tblYMuz
	 6n3R7sPg6cj2yHebqi3wdxEwlMwG8tYck9WS20zSJ9Z7JWUK5PLRE5oXkX9YfI1Z0ceeI
	 9o5YL0FdyzPGu+WBaY1oqR5o3g9akbyPR+BYR73LZiCdCzZdZi8i+Lj4DYrcvGWiHpSYT
	 kiHcS3EirzSHF87R1FUrqZJ+OumBmSCGmpYqnuPf76WmWHbE97EqngLxsZ9xpNvd3EkYe
	 CIsEzL8l/HT9In/7SFG2sEJslxogn6b34yNjB/b6FPmQgxbT2dGo89zzqBHG+G6L6Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bQ8C3qxP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gyXbDEpP;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF10606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF10606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bQ8C3qxP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gyXbDEpP
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id F21FD1D0051C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:53:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 25 Nov 2026 05:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795603995; x=
	1795690395; bh=IMedBWjX3od9XnP02Tr+7kPdu9op0gEHiwtOGI7i/ss=; b=b
	Q8C3qxP+9d2HMPK8mgfPgGMznQxX5oCbAIvogC599Wia7S9Lbs++V83MNLgA55H5
	9Ho0iU495/ED8Svl+Cbo7wH+vRwfzFtFSewYseyiAp+1Gc3YyLQQ36L6OkWHCnT8
	eADy50dtq0THvDEuPvGrKUzzDcDjxepIhnc0yKQOtbbythfviY7phuRrqww/GgVe
	MHXpkrFdqcxneej0ovK+l+5kbNSg0btTwSg7wnLX9NXtKdUV9gQO90tjasn58E30
	EDQWZkWunB0vZOvkpPzUwJZkW0s8fzvBrwn9D5Cy86na9AMXh9hTBSf66tO0Qjg7
	G9mUlFQXOUuhrxHTtLOIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795603995; x=1795690395; bh=IMedBWjX3od9XnP02Tr+7kPdu9op0gEHiwt
	OGI7i/ss=; b=gyXbDEpPwsCpKuvySIRatM2OcD5rtgJBpaaYc5C/D6k2iWMDFdX
	bF/LMNPGUnWIQ78hHhTTGC575Oa2jtO65l1z414RK9wQ/miAm4drlkIubz58nKac
	TnkSO+hE0UIc6SXD567zje3pyZOWXT0dqik4EWb3vUaTFQom/jeGxMozmduYRMto
	ft7nvIxGnqcXjD/dLAkMZ6C7SBK/xzEsge+L3Xs2fBeUU9x/ABW/PPOFjAk+3nhO
	k6UAsXQMw1yLwxv9N051tQJclus89eUrxVeAtQDpsLC+kIxv1kcE74ppJkSfCnli
	As0iaicLLu3GPT63fmWMNnrD/+7j2M8GWvw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795603995; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:jGIw97y/95PaMCnvlCmqoscvW6Burl4jdRWjjdY0/Eg4fhw
	iixDoMwqch4HFBVOby5g4Y1Tx7okyl+LVziQnNhCJvmWQTR9n3Ucr72+MCIgKeA8
	M3nwAipTkdnTri9Uq5Fa0t8+pQ8vUyZxmWQwr6fTkTuDgMZph6Jd32lDY0HTK7ki
	Jm5pozB4WDiKr16ArvkdzHwZetgNunS75jIgANKJkhnY9uDEJuHzkLbsg/54/3Ag
	w1vZ52eKnVK2WXDV7ZPjQfyU6PizNl0Oeho3+5ocewSwG5djJ66pP8DhonTHMG+G
	a6rKP629QEJgNQ3Qb4pkzeS4pcpmiViEhVYnykg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GaYmS27SHISQh0lT//rasAORSoR+j9znckb4ncjj5FI=:RAlWs96h1djoT4wp8bSIipVCnv+/8fOAkojvTVQS1E4=;
X-ME-Sender: <xms:Gr4GaxuOQ-HRFy2F-ns_PZ0_4t7aSBNYPvpOIabcf10UDF0Mq-G5yA>
    <xme:Gr4GayrUxcjnhW2cLd4rQXoYFIts89F4lFz3Y6udMa9Ov_ZG3XAqXhEmXIsKwjIWr
    fTdY8KOsS0_HuZOIFZM0GXJyv8ryFhb6noEjldU3_ZR5wTWp0yGnrg>
X-ME-Received: <xmr:Gr4GawXUC8VxCCtnjXk5GhfbL0wlDPHiEuEdfgT82hrX02lR-DljXzcMBcE>
X-ME-Proxy-Cause: dmFkZTFL/iCFQ0PAibj91uAXUdDjtMpu/z4F9HtlVgjv9YoagyQvMuaPr/PMKZ6cT/Ogmw
    FX/1GzlQ5XIm5eAUY6sqED9iYpsKMCkjEFQ2dp8ARYw0SbnTFtzajNMBepCuvtDPWQEH7B
    7sVGAZU8S5Epr4pisGez9MEW3KYmnc0MPnB7vNYOWekwmPmiMEnIo83fti/cb14Mzd8Uuh
    MQRTm6diJ44l/mjevm2Y2Vo5rQIM41U5beUnSUnKbW0WMJclbas/BHGYlVU5nBIQydIeGp
    u3POhF5jqTBRAsnbnC0tbaq0faIuZJ8pFwiEYiSHrnrBqF76pL2BcQfoAzg91pkcjBpaeT
    jgdvgvh+dvr9O+GxVWJNpnEhknPu08gTp/JkqNr7yaugcdHWnuxxxiy6IVwNaJiiFzkIZh
    J1j4qHNz+9gXJ6js7PMqrZZ2Kv786EV/vJ/SWRZOn69uLcR21Abf13DYptqph0wt3Chq0c
    8vt+jm0NWak6btcvJaK75l7yjUsLtZaDYDy8uh0rOycOiW4F7RZMe+2pFh3I3lNI5kNCKz
    MDdrBwzOrOb+R+YpBwTNOKGJAC6L1RAQ7mJL+5KZNbo7Nm81E0Jv+b+8pDs9tK5Q6NOf5M
    aCxJ7wjHoG4TN6BS87vRyK6gNG+vJjDUa0eYduxvl0VwFwFGRUEy6sjzfWzA
X-ME-Proxy: <xmx:Gr4Gay1KmrP2WHM6O-a_HPY3VExfySEPV7SpiPkSWdoeNyW0H_0ZqA>
    <xmx:Gr4Ga9tGIHZj0SA36yup24Kllvsh6ddjEIVOC8tDVOlvewxzoLH4_A>
    <xmx:Gr4GayXAL37-QNKXzkeUfd23YEWJi8g5UzcAygDedwQCr8jOIZOpFw>
    <xmx:Gr4Ga9wo3ajUsxgkIpQJGfsKWdd_u3mY256zuH8HprCVhqlrhNNweA>
    <xmx:G74Gay7RUnoYmVZLxUa7kN_3YB5IRHwUDyiFEgpOafGp2XnQjko1zJdP>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 05:53:13 -0500 (EST)
Date: Wed, 25 Nov 2026 11:53:11 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev,
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, vega@nebusec.ai
Subject: Re: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path
 confusion
Message-ID: <awa-F8TtQllwfELK@krikkit>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
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
Content-Disposition: inline
In-Reply-To: <20261116155229.318582-1-zihanx@nebusec.ai>

Hello,

2026-11-16, 15:52:28 +0000, Zihan Xi wrote:
> Historical QEMU run output:

I'm not sure what "historical" means here. Your reproducer will output
the same thing before/after the patch.

>     accepted socket domain=10
>     peer=::ffff:127.0.0.1 port=41512
>     recv=0 errno=0
> 
> The historical tracing additionally showed:
> 
>     xfrm6_rcv_encap <-espintcp_rcv
> 
> and XfrmInNoStates increased by one (before=1004 after=1005 delta=1). The run

Which is expected either way since you haven't configured any xfrm states.

> followed the no-state/error path without a KASAN report, oops, or crash-log,
> so no crash-log is attached.

So this is just a "regular" bug where things don't work as expected,
right? No other issue after we pass the packet up? (still worth
fixing of course, the patch looks ok)

Earlier you say "the vulnerable path", and call the reproducer a PoC,
I want to be clear on the problem ("vulnerable" and "PoC" sound like a
security issue).

> We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.

-- 
Sabrina
