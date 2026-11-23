Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451157;
	b=4HtPWiu5CMlXH8qEnKiifHbZGWUgz4t1nOJUG1rFKODW4Hw4p2OhxSduYSXW8SEcSNhx
	 cELeiiIyxUW1RqsHbd/8xTnpirjT/fmRTgYVVqzwKgvay3jVQlGNo7n4T+StyWSw1oo/5
	 eZojmqnt1d0OqC1cb3Qdwp2g7QZvkLfvOc+GPauc9ZZXQmBE0Oa6oqoLZHU/XlrQFnzGk
	 IxaXdKwiM4R9sSpFxCv8OF/5C4KXudPGvg2hjB7QZ1oZkidbYslyNJLYUCrLNwTN4Hhid
	 7RcZN15mJ1ifzNITrRGqlyS+2+jn2rzIJcDLzUnPSKvAMF0ZXosPLBAFW9FpFDzCVGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451157;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Syl4oAAF5bPrS0zyxFhc/MXaIKxajdc1fl2oZ4Yvqc0=;
	b=27bOimaR9Bh71pZrbGLmpjafT1biq4rnhSbiYW8pgxDPPHycFivI+xXsgdtXXc/9ED0b
	 MwS4cvAXuLrWMvTpYMGhTDUprxENERphjWyZkUn7U05unH78gwPl0mz/ZfFDR80T4ii8V
	 pYSEqofNPwJWz5EvWRTnS7kc6eGk5w7SenQg2OwK+ZplYHZR/Zmuxg678Dq7yl6dAIYvG
	 1LxvvS7rdszshZ6b3kyhMs642/AkwZE9R3lUyuAUfrIMr7jr89eShxKtyzLbPtv2UbMnU
	 ngFhMwPgAWMfLhm1/RpX3eTaN5a2O7iN8MWq0TI/XKmELUSW41LlKis6D/qEX5Zbbow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OT1/kIEv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8675606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OT1/kIEv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9421F000D0;
	Mon, 23 Nov 2026 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451156;
	bh=Syl4oAAF5bPrS0zyxFhc/MXaIKxajdc1fl2oZ4Yvqc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OT1/kIEvCOBXkA2L95JuI6fYyAf6hPC7ck/SZ3GlA2cP2Jc1m8E1EkxuH0BryOWPN
	 XEe6vlCY98+lkt+KSo+FG78lMIccjhG+GL48d9mPTSOUcR3chtm7xFeFulf6uI8RdR
	 LfOai0z2SWJx4utLePFNIkmuc+QhjbvpPVYnc4gi0D7X1nRPCPfSB704nkI0a4BAQp
	 oBm3afuHyFFxx3Zweoz6OT3qAQblgva0dhQQcCNUsXC3y2gwaySYzvmPLOYU9Ts4nT
	 Vd53s4gpRLUOk3RPM9Pb8eVglw3NLAnG6Wnw4q6kqaS7I6e9+w1Ymz8uYihJ6AwYIW
	 Sk3cBoQBRqsuQ==
Date: Mon, 23 Nov 2026 16:25:53 +0000
From: Simon Horman <horms@kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org
Subject: Re: [PATCH net v3 0/3] rtnetlink: fix truncation of dump entry
Message-ID: <20261123162553.GF31322@horms.kernel.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
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
In-Reply-To: <20261117221538.184948-1-stephen@networkplumber.org>

On Tue, Nov 17, 2026 at 02:13:41PM -0800, Stephen Hemminger wrote:
> While going through an OSS Scanner dump report for iproute2, I found a
> bug in the netlink route dump.
> 
> If the first entry of a route dump is too big for the dump skb, the dump
> ends with NLMSG_DONE and status 0. That route, and everything after it,
> is quietly dropped: "ip route show table 100" prints nothing and exits 0.
> It takes something well outside normal use to get there, such as a 500
> way multipath route.
> 
> Two separate paths get it wrong, so there are two fixes.
> 
> Patch 1 covers the generic RTNL_FLAG_DUMP_SPLIT_NLM_DONE path in
> rtnl_dumpit(), which drops -EMSGSIZE and returns skb->len. On an empty
> skb that is 0. This is the IPv4 FIB case.
> 
> Patch 2 covers inet6_dump_fib(), which doesn't use -EMSGSIZE at all; it
> suspends the walker and returns a positive value. That one goes back
> further, to when IPv6 multipath routes started being dumped as a single
> RTA_MULTIPATH message. It has to come after patch 1, since it relies on
> rtnl_dumpit() no longer swallowing the error.
> 
> Patch 3 adds a selftest: IPv4 and IPv6 multipath routes wide enough to
> miss the first dump skb of a fresh socket. The dump has to either return
> the route or fail with -EMSGSIZE.
> 
> v3 - move to net-next and resolve conflicts
>      incorporate Sashiko suggestions
> v2 - drop Assisted-by
>    - correct commit message about "ip route get"

Hi Stephen,

Unfortunately CI was unable to apply this patch to net-next using git am.
And stopped there.

Please rebase and post a v4 accumulating tags provided by others.

-- 
pw-bot: changes-requested
