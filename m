Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034999;
	b=H5JnQ8cL2OxSceBAPYIbiNOL8qQKXI5hy2lbQfKQwLfSjw+C3BwDNymZFcXqyppoDF71
	 Lg71Ga9XCTkSOeQnv0JM0YLbs0b9eur3PsHYXh+kIkoP9/J+7dzVv/Da1+y/ttFWd2U6h
	 xCZ+Wy8QvypGFHf4XUstage/x+sLyprh3TQYUuidirhjGmMdc0Zlgh9QkcjXZVAK/JhQg
	 3E+mBpFlrMRy910VoMNaVDRDXI2AlJAZrAK1hYW2HWmWoWK/mO3k82cI8sqR6ZrACcNZm
	 g+z+qOgV56fXNVCE2ulkguJmeQcaa61nXaIGEL+TCEzljB+yfq3cPW7QpDIjXHSnnHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034999;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aEBHUeeGJiD1ezxSyoowuYkQNWvoUAKpBoVmt3a40f0=;
	b=3v0OQSbTchg1DlpfSE71w+UeKW2t/BKpHh2Hx3ekxqz37N91aJ3cKPEd5hz+kf9QiNNY
	 RfolxPCPnYcyZpxh5XMhvGJaeUemajbcbtOYlJcoZXCNQs5cxuF/+OBPOBFc3d2+tGuoO
	 2J4oubN+n7oEJqn6jckKsrFwoUdkK0L6G183VgvzhoNyYtH78tEJUDZjW5A2PlAxJB4xd
	 dCEATeFWYTvUpn03aY6ODtkcBY5oiZKn7c6jtnCnRTEzscl8YpM7U+yodPfuzYmqRLBUI
	 bVckPyfsJwikWvcgNLt2gS4NTP27F6nJ5QF0F/cg+Wat5HUTDUVUR0t2QeVZaj0i3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1zfhIu3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F0606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1zfhIu3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CE91F000C5;
	Wed, 18 Nov 2026 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034999;
	bh=aEBHUeeGJiD1ezxSyoowuYkQNWvoUAKpBoVmt3a40f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1zfhIu3tkROIwiqm4uZ9g2urICN4ynU3QR5r533btLJeMZtX+/JJy55oTZFogWum
	 wG65g6/SxVFvZwjvgURG987gCfA7tG25QMbCWfF8geUrXftjyDv2FeLLjLeUwCSx+t
	 0WSWqaPkGI88XLbQK7JYrHa/2LrMl/wSEeK5PY5vEYgOKcp71zE3y65XIS7XnEOZtl
	 5rcEIQlG1vnNGUCGDvNGA5DdwgyS6oTq1Z5ZcdlXhWeC1+RqJXrnRP5nb8uPhJvJDj
	 XNm8hS5gxj2QsTQSnJ5QlaiFTiNicWkoiVYgqxDklhH/Y260knZYdxebgsU3+Lf1qE
	 qU7eBUk6j+eLw==
Date: Wed, 18 Nov 2026 20:49:54 +0000
From: Simon Horman <horms@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Myeonghun Pak <mhun512@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 10/19] net: ethernet: cortina: Separate RX
 buffer capacity from free queue size
Message-ID: <20261118204954.GS860048@horms.kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
 <20261112-gemini-ethernet-fixes-3-v8-10-f55bd43e02d3@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-10-f55bd43e02d3@kernel.org>

On Thu, Nov 12, 2026 at 02:30:25PM +0100, Linus Walleij wrote:
> Containing a retained hardware read pointer can force an order-15 free
> queue even when the configured RX rings need far fewer buffers. Filling
> that descriptor ring requires nearly 64 MiB of pages on systems with
> 32 to 128 MiB of RAM. Allocation failure persists across retries because
> the stopped DMA engine cannot advance the pointer.
> 
> Keep the descriptor geometry required by the retained pointer, but size
> the RX buffer budget from the configured port rings. Bound the posted
> occupancy and refill work by that budget, including after dropping the
> free queue lock to allocate a page. Size page metadata and the NAPI refill
> threshold from the same budget.
> 
> For a retained pointer of 16384 and a requested buffer order of 10, this
> keeps the 512 KiB descriptor ring but posts 2044 KiB of RX pages instead
> of 65532 KiB. No hardware pointer-reset behaviour is assumed.
> 
> Found by review and checked with a ring-geometry model covering every
> supported retained pointer and buffer order.
> 
> Fixes: 0bf8c8c94af2 ("net: ethernet: cortina: Normalize free queue pointers on rebuild")

Hi Linus,

I don't see this commit in net-next. Perhaps it is a local commit?

> Signed-off-by: Linus Walleij <linusw@kernel.org>

...
