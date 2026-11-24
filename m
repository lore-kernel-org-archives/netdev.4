Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482905;
	b=jJTwx5TC2FOdJyc2s9rBHgnp+HYlpxtTzSeauDT2IIRWrn3nXRGM+jbxT+JlXlYxpKOO
	 4CnWcwN3XPb/Z8ZmQHRun/hVHhF6RF6+ZZ/vmURn8jASApLCyzyNKlCPTZBkt76GKXpj0
	 yGxd73QSyMz2SXMQj8BfvwfCBEfslMsXgRf/V3JGArDvqnMCwOFWQ0+h1NiBSA9TSF0C3
	 HqykxDJo9yz0n9dQf8hZJyJCY53OdtGyOGhmoUoA6vQKbPz6M0UBuztp9L6lpffuvDiYf
	 XHx/g0A5KESMKyAe40TXixOoV23zFtVd+3pgLwRN9EpC/PBvTGOBZvEj2Kykv5XvOUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482905;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DL5/4dV3c4Xqh4JoUvd9AsGGrfrZDBGDNNadr9mT8aE=;
	b=bdyouD3fYhD0ZV9ra5Q9wEdJDZ6JpD10c6pnGxqvhiST7gkHkFRnOLPcQ2Mlvt54RanP
	 jVanBKwTTxW8TaxdiFDezggq+zF/kfVQd5oNIAalFQgZD8oFzRjEiBY3dTeOqjsr/Nar4
	 Ivyi8rVZ5gdxojVNGp5m0dZYS/SBA8Katc5r5/fsVXvoQmASaNwcHNCWK+KvQ+mjN8Yke
	 1bI1p+GHMXxqDbHGUo84PPEUaAm5E84wNZvXyxtKD5BcVzxayM6U+/mnx6Q9V0lIq2Qux
	 eH0Q3x3r38PZEsCtkVgtvUW/g5DNtJUe3Q4M1+DMt+6ydUM4PWgQcEHuXk6l+93trfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mArZW/0W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323B606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mArZW/0W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F96E1F000C4;
	Tue, 24 Nov 2026 01:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795482904;
	bh=DL5/4dV3c4Xqh4JoUvd9AsGGrfrZDBGDNNadr9mT8aE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mArZW/0W048+8qJCHUo48OgUN9SWnUCWgQdDfCdnww6rTmJ57pmjHuCqvg2UORcTY
	 QzFKKtf4ouc5VqRj4wmhLO7QE3ZblEtxbZNhKAbSpDwhFzyLZadtUGw7JSaT6Um/s8
	 KU2FkCL+vWwzQ2GaBN1XUDdETHhcnsxva/5rfXCuP1x51ZUn/GH/g6hm61OYyWMGGL
	 svye0vByWwSNMNKdSu5NKjQSfKehBWgSzAr/XnuML8nLLMOrOH8/e0Fsx3kgsWMkds
	 ev9wUnqc9bGbstDy5slJuWi5oqvcdLfKN3Bg3dGnd8y1EKH5MAhbmSXr+x1BxCzUo8
	 mtrM8VT8COV7w==
Date: Mon, 23 Nov 2026 17:15:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org
Subject: Re: [PATCH v5 net-next 12/13] selftests: drv-net: run the AF_XDP
 tests over veth or a NIC
Message-ID: <20261123171503.151dbf7f@kernel.org>
In-Reply-To: <20261119164636.1071385-13-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
	<20261119164636.1071385-13-maciej.fijalkowski@intel.com>
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

On Thu, 19 Nov 2026 17:46:35 +0100 Maciej Fijalkowski wrote:
> -    def __init__(self, src_path, nsim_test=None, queue_count=None):
> +    def __init__(self, src_path, nsim_test=None, queue_count=None,
> +                 veth_test=False):

I think this leads to a slightly awkward API:
 - nsim_only - three state, False means HW-only
 - veth_only - bool, False means run SW over nsim

Can we queue a separate patch (even outside this series) to rename
nsim_test to sw_test (or test_sw). Same semantics as current nsim_test.
(rename both the argument and the object member)

Then here add sw_drv="netdevsim" (default) which test can override
with sw_drv="veth" ?
