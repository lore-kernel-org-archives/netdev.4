Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214080;
	b=YvUek+Cc+PyaZt3TO9YRL5oiL2iRUGkFib7J+MJS8MMevlHGZcGmmTqyvrdCPEfALNQ4
	 5xGXXFWC3eH/bYoEbal2Fa1ImoNbGWoE7mF9ISyH2vPRlyhy2YZrXmN9xgt6xExx1si0E
	 6vcvSTF4WoqJfAoIoca4Vy9sKQXPcOMsFiZpZy0K/DJ68cN8YVUG2jTGgGpznQrJnp9fh
	 DNF7J5cVBcQWwnf2I37u5VKX/drsHDIge80A76VzV00GP2re98q42+BfXWGNXuJsufyf+
	 dZCPdLy6FduP6I6y4T1oeIzkjKMfbNiaEBvEmh1s3IDyoGmEi/0nxRFCjzYSIFdNG2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214080;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oP54wiIa/NfoN9d8MeKAdvoruT/gfwNE+wB/DJnTRZc=;
	b=xuS+JDZvF5afgN0j77WhSugTOEQCbbHAk9A4q8mLR1r8AuReDOxOqrO66vmL7ZV8jyb/
	 My+exF4zz6ysVDqP6UEQVPKRZTIcpDxjudP4zmOVoWwHXdfSRK6eQAKcQ6Zk6hr+RDKoH
	 8HfFq8iKYdVPJGFIZsA+ELULaXXUrBf9mgbKp6PwrrG6ZyhsssJbjQryc7dNw1xJhbuYE
	 Th9O7wxtP5ZmFbi5WRoagAf/ymw7kwwiBOWQP5/LgjzmoKEl3/Kqo/UvMKSM+Y2upDcY9
	 nZyz6QdZlq/YlmXLE3sRRtnq+T+waVizVzif7CyTB6pv39qiVSEZRafGa51uXASEWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYzqbmu8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B3606A6AB
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYzqbmu8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B614E1F000CA;
	Fri, 20 Nov 2026 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795214080;
	bh=oP54wiIa/NfoN9d8MeKAdvoruT/gfwNE+wB/DJnTRZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AYzqbmu8e6dJE7aZu7BJukSLJT1Rgms9jUYsEOmDjHkss322e+VtaIMlZ1fE0QJX3
	 NwCoe7PJZtK5NJOq0dB7GAloFuq9Sc1vVLqQdZArG1r50UXWvlsJ6z5Jyi8VqJ6JEe
	 JSZV/9QrTOe4BNs6KhJWPXkC/sjHLqzD7jWrSTnIb60lM/VlZKpQHbg7un6miYCRGe
	 5looAsVFmwNEr9TN33ZwKUJgj0PmMucCSoOrpYGvOhF+BVFej2xQREpolY3XKK05lN
	 G9EQp8g+GMTTPiVMWeLWOJoRo6Qm24D6GHoa9DbgPQGzXXMje2H+VFLufvGMgKVR2h
	 l5iWXKUVZc3Rw==
Date: Fri, 20 Nov 2026 14:34:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Roman Gushchin <roman@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?TWlj?=
 =?UTF-8?B?aGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Myeonghun Pak
 <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
Message-ID: <20261120143439.40f27935@kernel.org>
In-Reply-To: <87pkvzfiuz.fsf@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
	<CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
	<20261119165240.293dfbd6@kernel.org>
	<CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
	<87pkvzfiuz.fsf@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 10:39:00 -0800 Roman Gushchin wrote:
> >> Please:
> >>  - rebase
> >>  - drop all the Fixes tags here, net-next == no Fixes tags  
> >
> > NB: the Sashiko used by netdev insists on us adding these so we
> > are giving incoherent messages here. Clearly Sashiko can see
> > the prefix on each series and know whether Fixes: are applicable
> > or not. We need to fix the Sashiko
> > prompts. (I can perhaps do it if I know how, Roman?)
> >
> > Sometimes Fixes: are used for "nonurgent fixes" in other kernel
> > trees but maybe it just doesn't work with netdev.  
> 
> A clearly written text with rules in English would work, I can do the
> rest. But it's for "upstream" Sashiko, netdev-specific Sashiko is
> supported by Jakub and has quite significantly diverged.

I don't think networking maintainers fully agree between each other on
exactly what's considered a fix and what's not. So it's hard to write
up, in English or thru any other medium :S

So, sadly, humans have to still do the basic thinking and not slap
unnecessary tags on -next patches, just because some bot suggests
with a low confidence that a tag may be appropriate.
