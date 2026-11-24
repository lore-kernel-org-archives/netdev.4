Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520624;
	b=s24JD4YnhyiQO9xYoa5f6pe0lEfVL2s8JgcCxO56o53Te91kymc688ElePGBVdS+XEwI
	 IgxL6BjDJ3xbpWuGODxYeLjv6aSVrejKyN5peOos5G9F9P40baoLiJBOAi+X+SS8lSBhZ
	 uAgcSTCIKegjLfgihn01JahC9aGgUv/bMcsD+yInEBsiuArLX54kP24uYjZBdhWgmhNlm
	 rk+gbbhe200R3Z/piKZoeaCNt5NMFFLyndMEKjb8xsp8zbjMxrXxy5QcXE++ZTEUX5sQO
	 Q9JoRSp6e0yDRi8Lm0xGG8/U5XTHIQadLVJf8gQwOj8VB0YewQp9gZSqQJMAbW4jYFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520624;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6qu+7Lmy3A39iDT57VU11u0Vh7SIl/5fOSeCu4xBzcw=;
	b=22nqsgiCW5X8UIkk8mY7ee6qxjLaRKWEM8Zd8neXVTB1otKN+HgJ6jzaD3FvKoFXtm/w
	 u5AEet5vLCKzkX89fXlsNzdo6TKsojcoq6GlAp6CDn4sdC5qrItLOAS8gV+UlFvnVgque
	 +hE0YC3K31yk2df9FcBX4xmrgg0lG5e4gw0tL9qO/h357YB9Byzk73FROxeIUG167yjpz
	 GKJ7dIhlrxtDsyFMGk668GwJfeYSrF9UB2v36Vg4FTv636vNfkth+XLcdy2PpSXlOvmNO
	 ibP1v8rskbUZX07g0Z1bkyBaB+1nQxoGH2WBwTBdm2Z/dJ97RAHMWD1Z+HlA1C+Z+Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwzg+NUO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381A606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwzg+NUO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD141F000C0;
	Tue, 24 Nov 2026 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520623;
	bh=6qu+7Lmy3A39iDT57VU11u0Vh7SIl/5fOSeCu4xBzcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gwzg+NUO7SgLCjrwJ6NpI8racz8Wzlgb82u6xrOXHGKvj9roTswRt4c4eHbJHfoXm
	 6VfXTtBDGtgzSslTc0FslGupQNukg7dYt69yM2V6rxEJ2F3wArZQFHBjHSiAgintBR
	 EryVVugMWdZmFwGdbW3yDE991gIYio81IuB6uTsrTQxxaDO/0/Fw+cW2+r5p7HXuFQ
	 GrbM3TdHQlS4ps8Vv0lxg9GD0ftC5bz0BSxCPRXCZ4npPIG0zZSF4j814HFhaj8mlh
	 rsk1ElBNSR4q8ofKxIXsZPCYFxOvXPYiYtugXinhYeZyEO9ttjD+OmtOPOalsky7EX
	 bScRzL7s/t8zw==
Date: Tue, 24 Nov 2026 11:43:38 +0000
From: Simon Horman <horms@kernel.org>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	Rui Salvaterra <rsalvaterra@gmail.com>
Subject: Re: [PATCH net v3 1/3] tg3: Don't fail probe if 31-bit coherent DMA
 mask is unsupported
Message-ID: <20261124114338.GK31322@horms.kernel.org>
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
 <20261118105408.1076095-2-pavan.chebbi@broadcom.com>
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
In-Reply-To: <20261118105408.1076095-2-pavan.chebbi@broadcom.com>

On Wed, Nov 18, 2026 at 04:24:06PM +0530, Pavan Chebbi wrote:
> Commit 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for
> BCM57766 chipsets") lowered the coherent DMA mask to 31 bits as a
> workaround for a spurious address overflow error in the hardware.
> The result of dma_set_coherent_mask() is fatal to probe, so on
> platforms that cannot satisfy such a mask the device fails to probe:
> 
>   tg3 0000:01:00.0: Unable to obtain 64 bit DMA for consistent allocations
>   tg3 0000:01:00.0: probe with driver tg3 failed with error -5
> 
> This was reported on a Mac mini (Macmini6,2, BCM57766) running a
> kernel built without CONFIG_ZONE_DMA and with IOMMU passthrough as
> the default. Without CONFIG_ZONE_DMA, dma_direct_supported() only
> accepts a mask narrower than 32 bits if it covers the highest
> physical memory address, so with direct mapping a 31-bit coherent
> mask is rejected whenever memory extends above 2GB.
> 
> Treat the 31-bit mask as best effort.  If it is refused, warn and fall
> back to the mask used before 614f4d166eee, so that the device still
> probes.  Platforms that accept the mask are unaffected.  Where it is
> refused, 614f4d166eee never protected the device, it only stopped it
> from probing, so this restores the behaviour of kernels before that
> commit.  Warn when a status block lands at an address matching the
> pattern described in 614f4d166eee, so that a resulting TX timeout can
> be identified.

Hi Pavan,

I am not following how a BCM57766 device can be used on a system that
rejects a 31-bit mask. Is the idea that TX timeouts are infrequent
and can be lived with in such an environment?

> 
> Fixes: 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for BCM57766 chipsets")
> Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> Link: https://lore.kernel.org/netdev/CALjTZvYKHWrD5m+RXimjxODvpFPw7Cq_EOEuzRi1PZT9_JxF+g@mail.gmail.com/
> Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

...
