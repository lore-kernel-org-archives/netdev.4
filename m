Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715852;
	b=s9iSk8bBUFRPpapaadLofsNUw6BzH4n3tLNE91uPnYRjCNsVdMbGY4JQOGMKJHckcDur
	 WvYHraF+pYNv4eXitpGtmWlExvc0MpFNdzFXMOA/kEpc9m5XoNYq7FkQFNV/vfo36PavK
	 3ZP9X6vTCBSe1N2wK5PF0unZDlkMR7zRlJMfIIVTcjyDUZROrvdCdajme4QfL0/agbNMQ
	 J2csA0I56rDFyx/FmO33YplYdj0ZC7WFmFC/NnxHOYeaFTNdQtxJ3OG17VvquD/SN//6L
	 zHnCq0GM20ahkIowxYECgz6eUhXCRvCMaomQmUr1XzzIU+vC8RWflzY/YG/hK3AP4pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715852;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=U/hbHlod/r8hdzYS9HIa6oyqSeN/dIcMx6Puc22TzW8=;
	b=B1TwwPzoKlPJOsVg7moZE+sgaHQ0qtamYF58nWp86R0RdubwQgc8lO5w+ui+SRKO+wnT
	 aTJ0v2YSu7joWfx97uPiVdy+poKPSffSKXlSaoTELHftoj4ulJg01CXdEgY3fK6AbVKja
	 zIbtibCZn5Gp6pVqYlHy2+bO/ZZtFpBEc6jdjlbmbLelNecGem+6rnmj/nDfwIQncAaS1
	 VytO9rx7hWuNYC6qRgNjCUpkf4nXiC4YSI/opG9Oa19dfF9EuBJvrEgSCYQ8p1SfzQ25m
	 D/fYUZDOVsJ5ciDM9WNwuJqVG+MhwewC0has94Wr3hiRmAGOYPyXYQ6eOLhj9M8w5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPzRw8c8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD6A606A334
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPzRw8c8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F0E1F000C4;
	Sun, 15 Nov 2026 04:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794715852;
	bh=U/hbHlod/r8hdzYS9HIa6oyqSeN/dIcMx6Puc22TzW8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SPzRw8c8aTYDTIjW11cPk8Y1ej6jiQ56DZEvY+DRkJ6ZqBbnEzsWOMlbfUAG9v5f/
	 7VGpbaMMxkaGthkw4YzB4cZDSK0lRMky7/oUGRbdl8z32kppEqIhHet1SdAlTRkSJD
	 /MfXFU1fd0S6JNwpRBi/seYsO5r+pEWkb4Y/dUW/TEzpItyNWqJ+WGKoqyAVOVBhA1
	 aKcqocbWBpw6zbgTCt7rtmFgDEy6JXg3+Bl29hXKSPeWnXEjCoW6YvGmdWP1anr3La
	 8r+ffZr1aFcqY0Os+0y/gGtO6la9pMJRqS10cguAEm/QFUnsby+m9nxYEuQPrceWh9
	 cF9XXd+rG/8kg==
Subject: Re: [PATCH v1 net-next 3/8] tcp: Stop collapsing if not bloated.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Sun, 15 Nov 2026 04:10:51 +0000
Message-ID: <179471585136.2199510.5242413969655893867@kernel.org>
In-Reply-To: <20261114040101.1043546-4-kuniyu@google.com>
References: <20261114040101.1043546-4-kuniyu@google.com>
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

- [Low] The header comment on tcp_collapse() in net/ipv4/tcp_input.c
  (line 5841-5842) was edited by this patch to read "Collapse contiguous…

--

tcp: Stop collapsing if not bloated.

This commit changes tcp_collapse() so it only collapses ranges of bloated
skbs. It no longer starts collapsing because the next skb overlaps, and it
no longer runs on until the tail. The end parameter is dropped. A local
sub_end is computed for each bloated range, and the function restarts the
search after each range.

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e07f433474093..5bd42a74c6f58 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5839,7 +5839,7 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
>  }
>  
>  /* Collapse contiguous sequence of skbs head..tail with
> - * sequence numbers start..end.
> + * sequence numbers start..sub_end.

[Severity: Low]
This isn't a bug, but should this header comment for tcp_collapse() be
reworded rather than just renamed?

sub_end is a local variable, not a parameter. The second loop recomputes
it for each bloated sub-range, and it changes after every goto restart.
Someone reading the function's contract won't know what sub_end refers to.

The comment also still says head..tail is collapsed as one contiguous run.
With this patch, non-bloated skbs are skipped, each sub-range stops at the
first non-bloated, non-overlapping skb, and only the bloated sub-ranges
inside head..tail are collapsed.

The comment above the caller, tcp_collapse_ofo_queue(), has the same
mismatch:

/* Collapse ofo queue. Algorithm: select contiguous sequence of skbs
 * and tcp_collapse() them until all the queue is collapsed.
 */

The last patch in the series still leaves the header comment as
start..sub_end.

>   *
>   * If tail is NULL, this means until the end of the queue.
>   *
> @@ -5848,15 +5848,18 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
>   */
>  static void
>  tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
> -	     struct sk_buff *head, struct sk_buff *tail, u32 start, u32 end)
> +	     struct sk_buff *head, struct sk_buff *tail, u32 start)
>  {
>  	struct sk_buff *skb = head, *n;
>  	struct sk_buff_head tmp;
>  	u8 scaling_ratio;
> +	u32 sub_end;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114040101.1043546-1-kuniyu%40google.com
