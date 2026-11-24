Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544994;
	b=lkbqhAZZMLoXjHdN0xixZXiYyGKCaUWZI3Uo1aawqNjQLrurdMJACnrWxM5f+dg2Ecl6
	 rQqpTlQhATYrzS37+x3e6NzyQ3v70MlNmEbLx6h/1vEusOkaxz2OeS2bbiiuP/edCyKJ+
	 lMhswaZ0AZgNcaW2ZF7mVn5tQjsBRqbjTZmqo5xhfGL7OJvNxAc5mJOPII1t3a+GNPQlJ
	 nCExNWzsWw5QmbdJBHXDqu57tPMOfr7ANch9U1vpf4b+NtQibAlJ9Duze55GjnHIXGgLl
	 h4rIPNyot8lji/x1Fg6VaHdslfes0Z0avVU2NReq4edfmf8vzzJkeEc+yvdF/30f6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544994;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vrTyhZhYEo6i2Q92C95rkSIqw8Jb0w5TP8tyi2s2cL0=;
	b=TAg0wSACvJzYeEWGka6qkpyS5K3Wh+flopVwxZ4TUYSeLDGu6e5kralSOuS2nX3/poRQ
	 oYqz88kQlm0F93zfj+7jk+2p/ToaKEOVLPyJzTVG2inOy7bJnm0C1oUr4VQkWkcNF3E8P
	 hSv5PtfKNmAVaW8V1AMLVAcmuTbRr3naEWwz8S5yIASMcFy+J7qjM2ggHBtc/PwngrgbM
	 CKdkgnmgGlkLNswFqFBEq7u9tjm6jk34kvTZTVSQoMM65jVQFF7FgtGkvmOSi0wNK8eVf
	 CSPZkltF3rTYv4C6ls1Uja2liqw3F3+PMkweAFIFePmObBCtt8DAyW6tXSOEOKyPSwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAUL68yG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B4606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAUL68yG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A551F000D0;
	Tue, 24 Nov 2026 18:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544994;
	bh=vrTyhZhYEo6i2Q92C95rkSIqw8Jb0w5TP8tyi2s2cL0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XAUL68yGaRk9iNAr/HyU7jTcsNyzo4XLIgVom/SlL9hJkpto3wnaJSndKFwMulmFr
	 8N+Io+T3zTDDshe8A0dxD98CI9GFuN7AeACsFn3HjYtHxzDZmX5eYQ8z0rgt9Tsk78
	 FeBrS/06f1SkRCgMnDhqETYPrdQxbD5dibaPFPq3xVhbL9noTic0/8ZYxnTSucOgYb
	 AlIuPmFSZAxWkM5jyGOxERJovDPNU3jvxPIdL5tykFb0sW/Hqm7ks0bMnIQTJAV0N3
	 mf7cDCz6bd3K5X5OD71iMXfcSBv5syyXYINvDuVZDQGWe6uJR5mGf6T1/Lk8FDxIdV
	 EdZ4syOhakpvw==
Subject: Re: [PATCH net-next v9 05/14] net: ethernet: cortina: Correct free
 queue DMA mappings
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:52 +0000
Message-ID: <179554499289.3135.9641556337267478791@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-5-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-5-298671d799d5@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Commit "net: ethernet: cortina: Correct free queue DMA mappings"
  fixes a user-visible RX bug but has no Fixes: tag and no Cc: stable.

--

net: ethernet: cortina: Correct free queue DMA mappings

This patch keeps each free queue page's DMA base separate from the
fragment iterator in geth_freeq_alloc_map_page(). It also removes the
replacement unmap, which hit the wrong buffer. The page lookup is
reworked to derive fragment offsets from the saved DMA base under
freeq_lock, and mappings that do not fit in the 32-bit hardware
descriptors are now rejected.

> The locked linear scan is temporary: the following "Index free queue
> fragments with XArray" patch removes it. Backport this change together
> with that patch, "Preserve in-flight free queue pages" and "Recycle
> claimed free queue pages", which complete the mapping lifetime and DMA
> synchronization fixes.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

[Severity: Low]
Should this patch carry a Fixes: tag and Cc: stable?

The commit message describes a user-visible RX regression: frames dropped
with "could not find mapping", or the wrong page attached to the skb and
the wrong page reference dropped.

Blame on the baseline puts the whole block in the original driver
submission:

  - the dma_map_single() result being advanced by the fragment loop
  - the replacement dma_unmap_single() reading back the new buf_adr
  - the "gpage->mapping = mapping" assignment

That submission is:

  4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

The backport request is only in the prose above. Stable and AUTOSEL
tooling relies on Fixes: and Cc: stable trailers to pick up patches. As
things stand, this fix and the three follow-up patches it depends on might
not get picked up at all, or only some of them might.

Would it make sense to add this?

  Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

It could also help to state the dependency on the follow-up patches in a
form stable tooling can use. Another option is to give the related
patches in the series matching tags.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org
