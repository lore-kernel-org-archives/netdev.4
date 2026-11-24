Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538172;
	b=qIsKEyFsV5p+hY7VyFPPMWA8FDB/IB0aTx78Io5/sEO67b0Z9s/HJSxOiefCQ1nGrOKm
	 JACsEyNSoRRZ8ox2sdJT7hIiMbvudBKxLBmrzgf47WwFdbPL8eu6gxOTZDfMOA493NQ8g
	 PVxmuKTq9xEOdPLTm9l2zesMEyc8byB/Iqam4plRAYsefnrnSUTsmNPaL1GBrKeCL8im1
	 SmSMolao2anq4ahxO/3WRAxx8WmR6ClEBHG8vIo5+e17/t273SNVY8yg5rJU1D1IZo0rC
	 NO5mSo7JNavfU5i6aUsYu27ijCtgRCApfCihTTtjHorgf9cHLcU+ThvJ3CBvqRgrr/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538172;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=Ig/g6f6JH6crL2tbYKcTPvMky50h4POrHgH/dxBOz2Y=;
	b=owPQOsqTBKxeUSrIePvN72uINpkVbmv14Q3w67ddFD4klBEtbkk2jW18/Vrm9SPelQ6R
	 VtTRU9emiI5gNpiTzyycyM3AZ49R5KrfNfE0dl2Xox1CsKmRv+poA6Ud+cBEWGGAcTCWB
	 EL1/+STNgm/kGlzhhwtKZnw3IpSe7H7KppQSELMrbbB7NoYDH2rGNE653BDRE8af2M0TA
	 vNa+lC60sOcu8AfDEYrLeGy0F/PM81a/CUG80YgFvGSKMg1+PGrzTY4vNjHCDWXnBNjx6
	 amXdeLKMJXg8Eu8DU6lkpQ+H9UWWyLaqh5+PH6+sMPIUpVZofyPOim5v4Oxi5BKuS6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=OUyiurIh;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6F606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=OUyiurIh
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jYpN25GDwzny;
	Tue, 24 Nov 2026 17:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795538162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ig/g6f6JH6crL2tbYKcTPvMky50h4POrHgH/dxBOz2Y=;
	b=OUyiurIhWn0ff3mwoVGXayDjhdYClS9bw/2p7AdLH6ZK2n1LfVDpBBF2cqHwmdJBf+osWe
	bLeT+v9QKF7TMzQig7tgSv08lUVOJo2wuHMM90R/F2LXygd42QXBb/wGWOJNC5eo/D8CGB
	ca3ApcpJwuE7Fd9FBc8tfG6+qGV87S0OvRSOjQsN+RFFUkUfi+wZIFdz0dCp/Ci0AOJwAN
	siRnnf5Wip/73tDEvjjq303gLuQjoPcPtWM1PIt6rDT4VK2F/VdKrceb2D2lXTGNKkMEPH
	iR01uwLMgdZimppLG7gl+egZZeVoOMsMpCvT7WcbRU/BsaIdraLCHcpIKBgBLQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	David Ahern <dahern@nvidia.com>
Subject: Re: [RFC net-next v2 0/7] ipv6: validate dsts against the netns route generation at lookup
Date: Tue, 24 Nov 2026 17:35:52 +0100
Message-ID: <20261124163553.783988-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123212623.106153-1-dsahern@kernel.org>
References: <20261123212623.106153-1-dsahern@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jYpN25GDwzny

Hi David,

On Mon, 23 Nov 2026 14:26:02 -0700, David Ahern <dsahern@kernel.org> wrote:
> Known trade-off: any FIB change in a netns now invalidates every cached
> IPv6 dst in it, not just those under the affected node; stale dsts are
> rebuilt lazily on their next use.
[...]
> Ralf: Patch 7 is alternative to your patch that adds the cookie to the
> APIs. Instead the result struct contains the genid before the lookup is
> done. Adding it to the fib6_result seems simpler and accomplishes the
> end goal everywhere.
>

Carrying the sample in fib6_result avoids growing the API, but
validating against the netns generation also changes what a FIB change
invalidates: every route added or removed anywhere in the netns
invalidates every cached IPv6 dst in it. I considered this before the
RFC and discarded it as a potential regression against the current
model, since the IPv6 FIB was designed to limit invalidations to the
affected nodes, as 8f34e53b60b3 ("ipv6: Use global sernum for dst
validation with nexthop objects") puts it:

  With the per-node counter only dst_entries based on fib entries under
  the node are invalidated when changes are made to the routes -
  limiting the scope of invalidations.

On v1 you wrote [1]:

> That said, I have very limited time to work on a proposal. If this set
> cannot converge on an acceptable solution in a few days, then I will
> have to move on.

I hope v5 [2] (that I just sent) is the convergence we were both looking
for. It follows your direction, with validity in the dst, the sample
carried in fib6_result and every holder covered without changes, but
stamps the dst with the fn_sernum of the route's node, sampled during
the lookup, and keeps the netns generation only for nexthop-object dsts,
as today.

It also avoids three problems I found in v2: a lookup can reuse a pcpu
or exception dst that another lookup rebuilt after the route it selected
changed, a stale exception is treated as a miss (so any FIB change in
the netns stops learned PMTUs and redirects from being used), and
fib6_ifup and fib6_ifdown still advance the generation before
rt6_multipath_rebalance (which 2/4 of [2] fixes).

But moving validity into the dst also raises lifetime questions that any
version of this approach has to answer: pcpu dsts replaced while still
held, including as children of xfrm bundles, and exceptions, which can
neither be re-stamped nor be kept valid as they are. v5 covers the
validation of pcpu dsts, still releases replaced ones with dst_dev_put
and leaves exceptions on the holder's cookie for now. I'd welcome your
input on how to take the rest further.

[1] https://lore.kernel.org/netdev/2354d63e-1ba5-4655-8cea-2918fa0ee51f@kernel.org/
[2] https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/

Thanks.

-- 
Ralf Lici
Mandelbit Srl
