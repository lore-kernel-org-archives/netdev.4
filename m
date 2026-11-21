Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287710;
	b=BfvNZA+yzkYaxpzpeuLGYTWpWuU2+ktfJSkzW+4jHwMg6uzEsouT4zDUDjBh6r7R61/u
	 YvBVebMzQUwpFBFfzHkn3NIixxcHvNjzGHcTjiS7+cSJt9JiV+52kEUHdiHGKrRpZQC7q
	 Bo1K50bNUvxh9eVFAEcn9zJ0Uu18PaH3sn2gfGAU8EAOVE2hho7k/1Ztcf50napyFho2N
	 kppr5lA6esX5pBcwlf2ogaw6Sn16mJGttLdZlvFtfJVOrrbEwUHLe14fTlmrG7lR5u4bo
	 nA+lqr7wB4wZCBlu1zmPVYjx2qXytGAA0EVtauQtck48cYKCUplkZ4Q1C+u10+NY8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287710;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cXAX2m6JG5yf4JzUgA3dotq1f3OYESGFzlZjjaPicO4=;
	b=sdFHZ++GE5eCeKK7m16xFdZF+hjp1s6HavvJNgtceu8oJE8B8LNwsuMYTdvkB0qLHTFo
	 yqHbIZuYoFKWJ7pKz7d4nBo210bI33eL+MH9Oet2d90kh4D9xjgzqSlxNAWK4Fw9rG3Zi
	 972LbUAXiNM2uGIvAqeOgy0hyxg0Dv4qdkjWgKCciMiW6rnmSAyKPEWjpITR6wfKG0GJ5
	 mZrmd40oyAgFsupK/2PM7QVITymucxI6QsPBG/1UCzXEkVg7F1OYpIhltY67OXwbkkwi9
	 ogjFj0REEOzZi6E8BP7lutYR9RwgErMx2GQt3hbiiUuSe8y+DNOdSQutoIahuCuQ2kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWoNKsoy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B3606A330;
	Sat, 21 Nov 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWoNKsoy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B951F000C4;
	Sat, 21 Nov 2026 19:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795287710;
	bh=cXAX2m6JG5yf4JzUgA3dotq1f3OYESGFzlZjjaPicO4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VWoNKsoyKP4QPDhjk1xqwWiDZNQTv7TbrlqFvlWIqWNMS6OPUX2Gd9hb5JNYAmFRI
	 0foqEJOJ6Q+jqoMtm+G/IOCZPHmLB3j0SN+qzYv86LO/ry86AI78gqA9xYUqcPhFYo
	 FGt+CwzDbbO/dCiyySNw+YgYEyeHrvpbxS3PGpcHzAp0q/aTWljaUUCEg46hPWNVrM
	 lYvkKK+QVj8vBOD9IUCi8CbCNtVSUUT03kC0mmy8HlmsLKUJUPKSbH0/dE5M6aWUKW
	 kP9NIBMNkSoBu7uCp0RZMI19/nb4qUKjr1zAvitqfjGAbxhPaEFpS0QkL32IHpXO5M
	 V8TqCwcSZYUNw==
Date: Sat, 21 Nov 2026 11:01:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] netdevsim: nsim_start_peer_tx_queue() indexes the peer's
 TX queues with an RX queue index
Message-ID: <20261121110148.7ad389ae@kernel.org>
In-Reply-To: <179505710275.3511681.13434978152402269948@gmail.com>
References: <179505710275.3511681.13434978152402269948@gmail.com>
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

On Wed, 18 Nov 2026 19:05:00 -0800 (PST) Kyuwon Cho wrote:
> A patch is attached (git format-patch against v7.4-rc3; it applies to
> net and net-next):
> 
>   0001-netdevsim-bound-the-peer-TX-queue-index-in-nsim_star.patch

This is not how patches are submitted upstream.
You can put the explanation slop in the cover letter.
