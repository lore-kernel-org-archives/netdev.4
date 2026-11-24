Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508070;
	b=udK2v+hc9kDpIfXe6t9GqZMeWN2B5BcntgkQOAPC0lPEXNtkD2ByveiwmwIOu/TI7h+C
	 6fT+FKoIqQbqZxDbCmjUch3KadFfo/BIPYlLpa583iV9mwvZ/Cj7CGkfea9pwnTzeN3nw
	 1LFI1vV9H3YU2KvpEXtke9pD97o6diDMBMx1Wp4ha/oRAY+Kd0zqDWDiSXmI6JIlr6aU4
	 fbr/hPeBDqJySojqBWF3h891NgT7CCeZ2Ngaa0BqmcR+FF6CS9wUoQHGPCkQ2bUl0+Y3r
	 Nng6IusYSWKaaOFtCMv0bqHZJQ8+LKQFVnx9We1L2QDhNDCOWCDf9fWIeK78EOU6bWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508070;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qVgSrWAccIYah7AwQUb0a/8/o/lC3k/iBGY+fMbRdNs=;
	b=DukUyEDen4RqAHMre5L0a2gL94BLYfdzsi4fCNSJl0+tPIWXEpvPo6olelde28KkeMvi
	 7PzkvejP+tX3adzl5ERbgY2miM1lb5iiutJ3m3GKpx+ODNVWokJE1hVgDWd2lL6zy7DzR
	 IIodzpVDYXK2302OFuuuEQDdf21EVTA+nvpQRBoPgjQzJ54P7iSWZKchp42qaGYqN6qwE
	 4cVqYVmZnuhlpQYP6r8J+1r92iIow4a5gBZhMZIn1wYTW4SYVg0vPuxAuElm7j7ctXFb5
	 Iui0SvPKqE3N/AwMPYGnDJLf8UxDb2YD4GRyjhoFURy2RgE7bj9AscvLEz5Lcgo57RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fWeS/sVK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46235606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWeS/sVK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8391F000EB;
	Tue, 24 Nov 2026 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508069;
	bh=qVgSrWAccIYah7AwQUb0a/8/o/lC3k/iBGY+fMbRdNs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fWeS/sVKycGt5Xp/XKaSsebtQgjMELGBWxvhxQek4tt3+PcZCj9SzwZvbV1NEfQZO
	 HLdRtZhUjQEp8BEEWtKni71eBBd7BVnEwdiBFFId4QZfbtBuUxooHVALI22K/kDGeA
	 J8KLx2xprb0dvKRXUSUIcqiSSpg8W+TwZXxMAmGBfnrWoJBvUFIA2WI9ELyQeFKFo5
	 r04aq9Jk55JAjatCxIZ34PH9Kb7I7DkLICeZue0xe9xO43WMIX2bI+MqOEF1YJP4ll
	 HedKRjsTYK3aTU/j5sn4R1DTGkcBl+glyB07zyNDNdiBDAYV3Lc7YKxuNWscX7z2Um
	 Yd3OXkjD8aZLQ==
Subject: Re: [PATCH net-next v6 5/7] net: kunit: attach net_iov frags to
 target skbs in unreadable tests
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sdf@fomichev.me, kaiyuanz@google.com, willemb@google.com,
 daniel@iogearbox.net, josef@toxicpanda.com, sdf.kernel@gmail.com,
 dtatulea@nvidia.com, asml.silence@gmail.com, bobbyeshleman@meta.com
Date: Tue, 24 Nov 2026 08:14:28 +0000
Message-ID: <179550806827.3135.15602698633826190265@kernel.org>
In-Reply-To: <20261120201408.3445445-6-almasrymina@google.com>
References: <20261120201408.3445445-6-almasrymina@google.com>
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

- [Low] In net/core/net_test.c, netmem_ref_test_try_coalesce() subtest 3,
  the patch adds `KUNIT_EXPECT_TRUE(test, to->unreadable)` after…

--

net: kunit: attach net_iov frags to target skbs in unreadable tests

This commit changes two netmem KUnit tests so that the target skb gets an
initial net_iov fragment from the same binding before the operation runs.
In netmem_ref_test_net_iov(), that operation is skb_shift(). In
netmem_ref_test_try_coalesce(), it is skb_try_coalesce(). The goal is to
keep both tests valid once memory provider compatibility is enforced in
those functions.

> diff --git a/net/core/net_test.c b/net/core/net_test.c
> index 19f422300d9c8..1cfa947c11f2c 100644
> --- a/net/core/net_test.c
> +++ b/net/core/net_test.c

[ ... ]

> @@ -1730,18 +1733,19 @@ static void netmem_ref_test_try_coalesce(struct kunit *test)
>  	from = alloc_skb(0, GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, to);
>  	KUNIT_ASSERT_NOT_NULL(test, from);
> -	skb_put(to, skb_tailroom(to));
>  	to->pp_recycle = 1;
> -	to->unreadable = 1;
>  	from->pp_recycle = 1;
> -	skb_add_rx_frag_netmem(from, 0, niov_nm, 0, 64, PAGE_SIZE);
> +	skb_add_rx_frag_netmem(to, 0, niov_nm, 0, 32, PAGE_SIZE);
> +	napi_pp_get_page(niov_nm);
> +	skb_add_rx_frag_netmem(from, 0, niov_nm, 32, 64, PAGE_SIZE);
>  	napi_pp_get_page(niov_nm);
>  
>  	clone = skb_clone(from, GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, clone);
>  	KUNIT_EXPECT_TRUE(test, skb_try_coalesce(to, from, &fragstolen,
>  						 &delta));
> -	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 4L);
> +	KUNIT_EXPECT_TRUE(test, to->unreadable);

[Severity: Low]
Can this new assertion ever fail?

The new skb_add_rx_frag_netmem(to, ...) call above already sets
to->unreadable before skb_try_coalesce() runs. The call chain is
skb_add_rx_frag_netmem()->skb_fill_netmem_desc()->__skb_fill_netmem_desc():

include/linux/skbuff.h:__skb_fill_netmem_desc() {
    ...
	if (netmem_is_net_iov(netmem)) {
		skb->unreadable = true;
		return;
	}
    ...
}

skb_try_coalesce() never writes to->unreadable. At this commit it only
compares skb_frags_readable(from) with skb_frags_readable(to). Later in the
series that comparison is replaced by skb_mem_provider_compat(to, from).
The rest of the function copies frags, takes frag references and updates
len/data_len/truesize. The one frag fill inside it is skb_fill_page_desc()
for a page-backed head, and that does not touch unreadable.

So the check reads back a flag the test itself set. It would still pass if
skb_try_coalesce() mishandled the unreadable state of the merged frags.

The assertion is also unchanged at the end of the series. The later commit
"net: kunit: test incompatible memory provider rejection" adds rejection
subtests for different bindings and providers, but leaves this check as it
is.

Should the assertion be dropped, or changed to check something that
skb_try_coalesce() actually changes, such as nr_frags on the target skb?

> +	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 5L);
>  	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
>  			base_iov_ref);
>  	consume_skb(from);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120201408.3445445-1-almasrymina%40google.com
