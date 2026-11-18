Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026182;
	b=W3iMo6nG7Ldy+GA+gplCembfDCVvJSrT1nRy4OHiOmW173+ZOWa5WosniLeaOwJQSlnH
	 DGjB7EqwJ59K4e/IQfPBHh0TUDk09JcrN/dcnKxMtUiCffD0eC1ENVGnhWTDmgSSM3KOF
	 udCUPfhFZf2QIVhBHo/0qwmfNUKDLHoClHmbvmU2VGXavvuf9FfFtHZQx33BQ+vleFWcx
	 dj0W63EgGI2jhGfJSieAHnsEHctuie1+L+busUGYwO8CEMRQzg+Ev+f0YUS6zQJcjHklg
	 YFPv4jZDPW/zsqSGAzl5IkQjUqd8cjorMFddVYSC5fyRoZ6vbxuDr49B9qzv8jy4z9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026182;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ENFg+sThSDKHfPDKu0R8k/GbgkEojaxI5fvOA2IZTmc=;
	b=1ATwlZxpAgbGipJa+F1sM6oTjBmsxadrFZ7TqhV+4J4pWd1iAC5ValFVYrBLBKWak2ci
	 BZUNTMZm8hL6svDpApGQ5x4luRM5IMA+EGSGkjSX7h3zsT4qRlbj6oj8EqnfSMwe8SN21
	 2rLjFrQ+Rhmoo4xKjYvCu3rOR532QWyNKsE8A3H5kX05sZsqntAeg6vvam3SisEEh25Pb
	 aurX9AjG/eOr6DlmJc7fNfm8SwFgO3vymd18CuE0aS27hWugnDAum9j7sYpXx35SHAB53
	 DCc0wQbgkoxU65AyMid6uAUQ3qspMMTLPYWwzF68k0D3zWX6Kd/D8AdaJsXbS3cwdpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7SwwG5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1E60A2601
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7SwwG5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968AA1F00927;
	Wed, 18 Nov 2026 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026182;
	bh=ENFg+sThSDKHfPDKu0R8k/GbgkEojaxI5fvOA2IZTmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q7SwwG5FmZH6mZeYlT0WKPWKzZ2tiw2LpBYOniGBZBQTIxcSRJSwIloVYpepn1isS
	 L17i+bxrfCp0Ah+2AOsBJ+mN4zkYv++QSIVsrVw5g8paKjf5drkNIcUS9h7McDN/oF
	 r1OXDPc7JatA4hvqW59+LOR8cBSrlmp+YAQkD1clXLJ905aj7KleYd5wq1i0VK1dUK
	 9yCZ3NQfqZtgBkeafFflDT+V13UA2nzRr7X+5mcTan5ioZagNX8/75G6qSYEZitKON
	 Yy+ZzOuhqbZIAPzxJiL+Hd4M2WFWmt/+/XKcZVPVt6PJORPpq4TXa3H04sQIGSmWp3
	 4uuJDkIjlJ2gQ==
Subject: Re: [PATCH net v2 1/5] tcp: don't let __tcp_set_rto() return 0
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 18:23:01 +0000
Message-ID: <179502618115.3136.7194709885956735724@kernel.org>
In-Reply-To: <20261118155144.18393-2-mason@kernel.org>
References: <20261118155144.18393-2-mason@kernel.org>
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

- [Low] The commit message of "tcp: don't let __tcp_set_rto() return 0"
  gets the thin-stream caller wrong.

--

tcp: don't let __tcp_set_rto() return 0

This commit makes __tcp_set_rto() return at least 1 jiffy. Without that
floor, a route with a locked RTAX_RTO_MIN of 0 and an RTT sum under one
jiffy leaves icsk_rto at 0, and the exponential backoff in
tcp_retransmit_timer() can never get it above 0. Because the floor is in
__tcp_set_rto(), both tcp_set_rto() and tcp_ld_RTO_revert() get it.

> Do it in __tcp_set_rto() and not in tcp_set_rto(), since
> tcp_ld_RTO_revert() uses the same sum. The third caller, the linear
> timeouts of thin streams in tcp_retransmit_timer(), already clamps the
> result to tcp_rto_min().

[Severity: Low]
Does this describe the thin stream caller correctly for the configuration
this patch targets?

The trigger here is tcp_rto_min() returning 0 for a route with a locked
RTAX_RTO_MIN of 0. At this commit, tcp_rto_min() passes the route metric
through with no lower bound:

include/net/tcp.h:tcp_rto_min() {
    ...
	if (dst && dst_metric_locked(dst, RTAX_RTO_MIN))
		rto_min = dst_metric_rtt(dst, RTAX_RTO_MIN);
	return rto_min;
}

Before this patch, the thin stream branch in tcp_retransmit_timer() was:

net/ipv4/tcp_timer.c:tcp_retransmit_timer() {
    ...
		icsk->icsk_rto = clamp(__tcp_set_rto(tp),
				       tcp_rto_min(sk),
				       tcp_rto_max(sk));
    ...
}

This gives clamp(0, 0, rto_max) == 0 whenever (srtt_us >> 3) + rttvar_us
is below one jiffy. icsk_rto then stays at 0 for up to
TCP_THIN_LINEAR_RETRIES retransmissions. After that, the exponential
branch (icsk_rto << 1) keeps it at 0.

The code change fixes this path as well, because the floor is in
__tcp_set_rto(). Only the rationale looks wrong.

Could the commit message say that the thin stream path is also affected
and fixed by this change, instead of saying it is already protected?

The later commit "tcp: bound the rto_min of a route in tcp_rto_min()"
clamps tcp_rto_min() to at least 1. That makes the statement true once
the whole series is applied. However, this patch has its own Fixes: tag
and may be backported on its own.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118155144.18393-1-mason%40kernel.org
