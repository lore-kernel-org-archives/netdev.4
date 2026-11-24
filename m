Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519460;
	b=Q5iHFPb1M6XIHIJl7FjlcErKGCEte2H6XopKOvw1MeK1Mz+oRHuWa/Xg65+YKIN2ltER
	 Pte3NLGwz9Fxex2i1wnXze5vOR1gvDwns2bXjxs/e2t9qhg62rYUETYNUvKpuK2rr1b9k
	 DfLjfjuSLkWYdeffTlqd4XcQruWoYF/m24cS4FqxSFwdYIiZ4zqrWd66nl9uRW+8/DACm
	 wkQnyFOapLYEOCRAqRRfvbP9EjkWzYKaIdFAHn1yBihIo15yxJnoZbjGNL5ADCt63zpY0
	 27Oxg4HlSVSqYiD4UjShPrVW53HBVOz2xqkk7ymov05wM0Sv0fePo9H51ukm7d31A+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519460;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FKub91r/RkReMDO68rIDG4TvNPrvwOOPa0wxW/nGePA=;
	b=FnyHCzvHIedoW3ie13MUooL/9juTjPOEHo3xWnOS8NRnY7VkhIedGUyGaDJgrhUmnX9w
	 I0Voj+04wlUhx+6AanhORATNum0659I2Do9A9MDDfLjB1RB4q6AY07Xgsm4kTJ5K60gEv
	 TVKeBz0e3dkYbNGdqqpFGUJzFwXYr/DVm4Gnw78lIJngmFeNfzyFom9tYJaIqejP1Ln/m
	 XavCQ8QLrMLINzPy3tHvAITQGH/Boh2B272vNx4TOJCiATYNFtDmbKqDBZB0E3wYomSLv
	 SM7cnwfJI9KyBjJZqInlHz4ZVvyo/UxB5z9k8CrEdggCmh69RJ5uY1coeV34CQI/5oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h583xEgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D25606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h583xEgu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6261F000C6;
	Tue, 24 Nov 2026 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519459;
	bh=FKub91r/RkReMDO68rIDG4TvNPrvwOOPa0wxW/nGePA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h583xEgu9aNmOvJpStbk8LsNltRvJuQkVeIJ/RvCWYgqBRjcH1b0oHxURdsf9D/ss
	 yAbZFd4WgJx3qHWsWt5oFat6/GGn6clO6f8la8AFVjjcJ8CyXHWPd4SA2xlWiEKiKy
	 SfolpHXf4R0/tOLQ8d4q1qJ03o6bLSGnN0JTb9SPqcMq436Y8f8sKoC3P2Z1fN/aDa
	 aC1rJyK2FvIBgXQf03IEX1R9r7oTdHGTBmRS7Y2J/0mFtaEmaiW/DLuYeVCRBpPX2g
	 I77NsQAM5smXlXGg1HgyArWII5zyRObzTmZyOfhz3XZvh5tCG7GZx+nCVjtnqRqbp2
	 o+o5rSIubId3w==
Date: Tue, 24 Nov 2026 11:24:14 +0000
From: Simon Horman <horms@kernel.org>
To: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
	duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hramamurthy@google.com,
	jacob.e.keller@intel.com, przemyslaw.kitszel@intel.com
Subject: Re: [PATCH net v8 2/2] net: wangxun: access queue counts consistently
Message-ID: <20261124112414.GJ31322@horms.kernel.org>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <20261118081329.39551-3-mengyuanlou@net-swift.com>
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
In-Reply-To: <20261118081329.39551-3-mengyuanlou@net-swift.com>

On Wed, Nov 18, 2026 at 04:13:29PM +0800, Mengyuan Lou wrote:
> Queue-vector teardown clears wx->num_tx_queues and
> wx->num_rx_queues while the netdev can remain registered. Lockless
> readers may use these counts as ring-array loop bounds while teardown
> is clearing the ring slots. wx_xmit_frame() also uses the Tx count to
> select a ring and must not divide by zero during teardown.
> 
> Use READ_ONCE() to take a single count snapshot in the lockless readers,
> and use WRITE_ONCE() for queue-count updates during scheme setup,
> teardown, and allocation-error handling, including the VF queue setup
> callbacks. Keep the existing NULL checks so a reader that observed an
> old non-zero count can safely skip ring slots that have since been
> cleared. wx_xmit_frame() retains its zero-count guard before
> queue-index modulo.
> 
> Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
> Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>

This patch feels more like hardening for net-next than a fix for net.
But regardless the code changes look good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

...
