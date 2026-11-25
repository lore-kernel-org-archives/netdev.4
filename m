Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603086;
	b=eynqiCq0wnpksR/GCJwNJkr1Yk55L/Z456CzsOwkOHQ+uaPKJyAEtff+Iq8DivWz8MQS
	 xaJoPsh1m5lPyMa8omsXfkXW8Zb4DNUztvF219jAS01yEfNwJzPKM03c/5pEJsiq8Vis6
	 r/yAvrMm2W4zY8c2XYaKxbIOOHd12IWOrIxdCWKJkgm5KZxpiVxJM2rqpxX+wR+NCXCw3
	 yS69+z/jZ10N0f05MzcHXU6Um9zgE+My5HaA6xUDnRZ5g0O0hQTzERyZwkPU8obNLASIv
	 Atkng4kUgaUg/yCtwRm4vLJ4RVuSJr/+n0H0aULJuc5XjQfB18WZRw1+WXP9wtHgzCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603086;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=z6Y8hGXpK2167EEv1R/cOpEUI364Uzw32YJ/Pk/lWFs=;
	b=aL6yB81r4ZGXoWP4xMsbjrEd5n3yDxZCwZMy6pG5xwk3N3bj+/DX8ZaE4esBDfYl+K7y
	 zcd4YHoT1IVG9gf8KFmhZqomaBdFtCWQgAZwwCqBY4s0Z7ouvaZd+7URzNeQCIU+c74gR
	 UcveN0ad6Aw1cCfFxkwkwLyw/kNvFhSxJpgU90R9kg0H0VMkqRRP8XyFnQFTtLfZKtbGB
	 CagRUrPJHPOB4d6obFfTuKtMtrdevxqNVa82WlWhXL0nyFCg8W16Uu85I8ayPkEXX/0MU
	 /fsqUroEp0mx4l8LoGwNBNLqePnFWt5fX+0cUeFeOWZPFjpq5QJoc6af8y16/saB7Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W9YlvU/w";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E6606A321;
	Wed, 25 Nov 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9YlvU/w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6D21F000CA;
	Wed, 25 Nov 2026 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603086;
	bh=z6Y8hGXpK2167EEv1R/cOpEUI364Uzw32YJ/Pk/lWFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9YlvU/wac1e5ormS+DMBqVIxilrKn2qn2fjIyAYAxoewV6LFiRtx27mGR+o8+6qg
	 4N+oeGI/sBpi5Te+AGimvCEd0w6GHbLWDy6njVrSOWMdY7DXg4sRA2fiV8/+KRv2Ce
	 pEoTcTgDYFfYGv0WKB2CHHrPyn3cd5tJcx//0tFovqcWHYKs//+EcH2/GszPahzrUX
	 n20DmjrG9dkWk3PIQoKsTYw2cx9Pib3aUEq/V3EHHrmZ4RksYWyRxaWoVvyqr4m0ej
	 SW2msaaA+ILtLVT08efB8IpJUF/RuBNwYw2x01Q/dMkHNZyWfBW5wu3660lp2+gU6R
	 qveb7DM0k6XAg==
Date: Wed, 25 Nov 2026 10:38:01 +0000
From: Simon Horman <horms@kernel.org>
To: Jijie Shao <shaojijie@huawei.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
	liuyonglong@huawei.com, chenhao418@huawei.com,
	yangshuaisong@h-partners.com, ningwei15@huawei.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 1/4] net: hns3: fix vector resource leak in
 hns3_nic_alloc_vector_data
Message-ID: <20261125103801.GO31322@horms.kernel.org>
References: <20261118130330.3026625-1-shaojijie@huawei.com>
 <20261118130330.3026625-2-shaojijie@huawei.com>
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
In-Reply-To: <20261118130330.3026625-2-shaojijie@huawei.com>

On Wed, Nov 18, 2026 at 09:03:27PM +0800, Jijie Shao wrote:
> When devm_kcalloc() fails for priv->tqp_vector after get_vector() has
> already acquired MSI-X vectors, the error path returns without calling
> put_vector() to release them, leaving the hclge/hclgevf bookkeeping
> (num_msi_used, num_msi_left, vector_status[]) inconsistent.
> 
> Call put_vector() for every acquired vector before returning the error,
> and reset priv->vector_num to 0 so the count never describes vectors
> that were already handed back.
> 
> Fixes: dd38c72604dc ("net: hns3: fix for coalesce configuration lost during reset")
> Signed-off-by: Jijie Shao <shaojijie@huawei.com>
> ---
> Changes in v4:
>   - Correct the reason for resetting priv->vector_num.  Sashiko pointed
>     out that hns3_nic_dealloc_vector_data() is not reachable after
>     hns3_nic_alloc_vector_data() fails, so the reset is not protecting
>     that path; it keeps the count from describing vectors that were
>     already handed back.
> v3: https://lore.kernel.org/all/20261030095633.377289-2-shaojijie@huawei.com/
> Changes in v3:
>   - Simplify commit message: drop the accumulated-leak consequence
>     paragraph and clarify that the vector_num reset avoids a NULL
>     deref in hns3_nic_dealloc_vector_data().
> v2: https://lore.kernel.org/all/20261021121426.3096838-2-shaojijie@huawei.com/

Reviewed-by: Simon Horman <horms@kernel.org>

