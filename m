Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540542;
	b=X2PQ4WsQooIAoZe3EqZuD/F1Ws5z5TAlU6xtZ8abMztg4K3bzSOB+aYr44tWpySQYH6K
	 H4cnKxMtVlyJK+kQtLEFEQvvr80tGo0b4h3buJtYyeTOBYP4SE30DfHf+ORgX4N069qsO
	 boavRNUPof/NN6BB5g89f0GNkZoSJS57FUc11vNqJkUl9C7EOwRxp13OQrWKk9e1oj1To
	 gwKLaH2FIPY578l17pspf8KfdcZVuRcprUg9qGeWj5nXxLCC/Snb/YmRhamimgm/Fixrj
	 O6rEARNznlURX/t3UhObiGM689VgYCnvzL2AI2e+cuFWAtHxqO/CCtOmR5FEMpQMrlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540542;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pcQ+FFj+PMIVwKwKWIzHuWiAhlXYzjGZkXHDIqJ3LvE=;
	b=2KsHt4hzHtDp7kt2FGGmLC6W3LGO0iWs0t8RmllcY/+k9CIiGkuqaDfu0T32Dqmzb3tN
	 2P8+FDCuAh2M7jSCXbOj9G2XrGat1YHxTw680GeZDkDu37QJ/9FIWJsqS+7nEz7FwIypb
	 d/m3EV7R1E4tE27ky4yFeXO17mTvXwWb89q1yCxHmod5BXhlF5LPCS+uW4E7eMnCEG2mV
	 qGvlU5kpiw8GMdyQHw29uQ+pDBw1t4x0Kp17r9ImILbv6HkGYk+WOEC34LkqKy3qxgTbD
	 POtTyxhddfVLyH8QHR7mXsVFPOyZYao8gt1llfwjensP1iKeKR87HoTCp6gQMo/J0mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqfiuK5E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F9606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GqfiuK5E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D935F1F000D0;
	Tue, 24 Nov 2026 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540542;
	bh=pcQ+FFj+PMIVwKwKWIzHuWiAhlXYzjGZkXHDIqJ3LvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GqfiuK5ECT0ifdkxoTKjkSEHFD61VHvom8qeEicFWKxQgxV7ptFmlnWGoEEV2M6Xk
	 L7rNzMhfVDowMgFVA8W7D6voDMJZ8aRQXtrTMwoKb+DvRqz3xrS5597ccv6RTr5MBO
	 Z1IeD6Lqu1XHjxl7p0vgcEygykDk/0TISfk1OhyYNNMHQznFOVMrTCQvGmMwX4vx3B
	 /BvfoRONX5SE1D7tWi8ujKzJKOr2DJyFQLdnT6IQ234mBAGZzWhwsGAVX+H8ZS1rYq
	 JmcvqEM5clur79q4sEqidFwayJX3TEeGsB2GM05hn76tgDxCbJmazr77IyJcesRgn/
	 qTj7JfrOPhoCw==
Message-ID: <72ade685-ecce-4215-a30b-25be7666e299@kernel.org>
Date: Tue, 24 Nov 2026 10:15:40 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC net-next v2 0/7] ipv6: validate dsts against the netns route
 generation at lookup
Content-Language: en-US
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org
References: <20261123212623.106153-1-dsahern@kernel.org>
 <20261124163553.783988-1-ralf@mandelbit.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261124163553.783988-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 9:35 AM, Ralf Lici wrote:
> Hi David,
> 
> On Mon, 23 Nov 2026 14:26:02 -0700, David Ahern <dsahern@kernel.org> wrote:
>> Known trade-off: any FIB change in a netns now invalidates every cached
>> IPv6 dst in it, not just those under the affected node; stale dsts are
>> rebuilt lazily on their next use.
> [...]
>> Ralf: Patch 7 is alternative to your patch that adds the cookie to the
>> APIs. Instead the result struct contains the genid before the lookup is
>> done. Adding it to the fib6_result seems simpler and accomplishes the
>> end goal everywhere.
>>
> 
> Carrying the sample in fib6_result avoids growing the API, but
> validating against the netns generation also changes what a FIB change
> invalidates: every route added or removed anywhere in the netns
> invalidates every cached IPv6 dst in it. I considered this before the
> RFC and discarded it as a potential regression against the current
> model, since the IPv6 FIB was designed to limit invalidations to the
> affected nodes, as 8f34e53b60b3 ("ipv6: Use global sernum for dst
> validation with nexthop objects") puts it:
> 
>   With the per-node counter only dst_entries based on fib entries under
>   the node are invalidated when changes are made to the routes -
>   limiting the scope of invalidations.
> 
> On v1 you wrote [1]:
> 
>> That said, I have very limited time to work on a proposal. If this set
>> cannot converge on an acceptable solution in a few days, then I will
>> have to move on.
> 
> I hope v5 [2] (that I just sent) is the convergence we were both looking
> for. It follows your direction, with validity in the dst, the sample
> carried in fib6_result and every holder covered without changes, but
> stamps the dst with the fn_sernum of the route's node, sampled during
> the lookup, and keeps the netns generation only for nexthop-object dsts,
> as today.
> 
> It also avoids three problems I found in v2: a lookup can reuse a pcpu
> or exception dst that another lookup rebuilt after the route it selected
> changed, a stale exception is treated as a miss (so any FIB change in
> the netns stops learned PMTUs and redirects from being used), and
> fib6_ifup and fib6_ifdown still advance the generation before
> rt6_multipath_rebalance (which 2/4 of [2] fixes).
> 
> But moving validity into the dst also raises lifetime questions that any
> version of this approach has to answer: pcpu dsts replaced while still
> held, including as children of xfrm bundles, and exceptions, which can
> neither be re-stamped nor be kept valid as they are. v5 covers the
> validation of pcpu dsts, still releases replaced ones with dst_dev_put
> and leaves exceptions on the holder's cookie for now. I'd welcome your
> input on how to take the rest further.
> 
> [1] https://lore.kernel.org/netdev/2354d63e-1ba5-4655-8cea-2918fa0ee51f@kernel.org/
> [2] https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/
> 

IPv6's finer grained invalidation of fib changes is why this whole
cookie caching mess exists. It is a performance optimization that to me
has gotten out of hand and as you reported is the cause of functional
incorrectness with both xfrm and other caching.

I spent the morning doing a deep dive on the claude assisted patches and
really like the direction. Making ipv6 fib management and invalidation
align with ipv4 should remove the need for all of the cookie stashing on
sockets and elsewhere plus remove the cookie argument to the dst APIs
including sockets. ie., it is a good cleanup and simplification of the
code base with the cost of more invalidations on ipv6 fib changes.


