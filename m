Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606255;
	b=zYcXm/zTuBLBV9IQo5jZtwgqUqo467Yg2gx4WXwmBcqTghGypLWTu/2j026qL/mEtMRN
	 IOizTTVLBbC0J8iRKpXcQeWaXI7F7d6MrJuPeuDpTEGYO1dGR8CE0TEe5lRnWuKDzEwN9
	 wtV9NlTVEaswD4Cq6GWt2PcDPO6MgDhUuTWE5k2hWQukZR9RB8vzNNV+s20VBYtGWMH0+
	 mxr9FW39BKybnezPcwXXXyJsbRHF3Y8sTCSALtP5NxvWJif2D1gXzwboGoGgdL4bPVnff
	 SknVlMGyPKT5ah6W+1Y3esS4GLVTZv7RCOUlXdxoom2NlMOMHDEZht1jDmto4+lViPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606255;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZD2E+lKFMmXf4Beo6gPq5BSgGW1LqR9dsVooOtj5qig=;
	b=A3rCviEsJvajPS1+pvf/ZOabvPESrCs5/WLUTsQ2v6o2mN9s/f30YrqrF4uhmua9GKWe
	 HuaucsRwliLCnn3nyYXq0Jrm480tVC5BcDyMYOI12/Hq8OeixBDGTHLweDw5bLa7jeUkn
	 CRpzyNP0keESQj7964tE5nDfFudbCxbaxfHIE/zZgBAd9miTzt6cHTH07F+Chf0xomDP4
	 tMXO1ikTG5M2lK+RZPyGSjxTuQGOi4AEMi2xQjQw6TcSfzg5vYw9zPcHgkw3ea21W7tld
	 E0Rgu72kX11ZGJzHGJ3FOOxM168CI0MHrMEcF92qH60EtAMrmYny5l9I0+sE9uND7TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CslDEfQ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E4606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CslDEfQ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3B11F000C4;
	Wed, 25 Nov 2026 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795606254;
	bh=ZD2E+lKFMmXf4Beo6gPq5BSgGW1LqR9dsVooOtj5qig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CslDEfQ89vw76YLwuCGM8/PuujKqerK1vXjRPnnuw7GHrV7lWrGG3JPpv6xXNlnFJ
	 2wlyId6tnFnLWF/o12CNYLQAoPY/Sxk14BSRFTN4Aj0k6La8rwbIbbwQug45OVATN2
	 v3NF/5+6HL2vT9YrslfhFxRUUyvXcb7gFJLdh5Bz58RdkjdJHyR07I25XfCKKV1v0g
	 hq/w+wM8kBmPY6laBb83uP/Ja4A1Mnlq8L6roKohcuJlZ47MiR++1HqUoBnqjSOK8I
	 qLTl/6x27LBLl1p1kAiRJr9AyOhBuTDDNRcQ5CXxCT5hRz3WrvzrdIvn6A/gMNhj4q
	 qjw5GqtlQebaA==
Date: Wed, 25 Nov 2026 11:30:50 +0000
From: Simon Horman <horms@kernel.org>
To: "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
	duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hramamurthy@google.com,
	jacob.e.keller@intel.com, przemyslaw.kitszel@intel.com
Subject: Re: [PATCH net v8 2/2] net: wangxun: access queue counts consistently
Message-ID: <20261125113050.GS31322@horms.kernel.org>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <20261118081329.39551-3-mengyuanlou@net-swift.com>
 <20261124112414.GJ31322@horms.kernel.org>
 <15430CE6-8AD6-43CF-AACF-1434B5EB666F@net-swift.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15430CE6-8AD6-43CF-AACF-1434B5EB666F@net-swift.com>

On Wed, Nov 25, 2026 at 09:36:46AM +0800, mengyuanlou@net-swift.com wrote:
> 
> 
> > 2026年11月24日 19:24，Simon Horman <horms@kernel.org> 写道：
> > 
> > On Wed, Nov 18, 2026 at 04:13:29PM +0800, Mengyuan Lou wrote:
> >> Queue-vector teardown clears wx->num_tx_queues and
> >> wx->num_rx_queues while the netdev can remain registered. Lockless
> >> readers may use these counts as ring-array loop bounds while teardown
> >> is clearing the ring slots. wx_xmit_frame() also uses the Tx count to
> >> select a ring and must not divide by zero during teardown.
> >> 
> >> Use READ_ONCE() to take a single count snapshot in the lockless readers,
> >> and use WRITE_ONCE() for queue-count updates during scheme setup,
> >> teardown, and allocation-error handling, including the VF queue setup
> >> callbacks. Keep the existing NULL checks so a reader that observed an
> >> old non-zero count can safely skip ring slots that have since been
> >> cleared. wx_xmit_frame() retains its zero-count guard before
> >> queue-index modulo.
> >> 
> >> Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
> >> Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>
> > 
> > This patch feels more like hardening for net-next than a fix for net.
> > But regardless the code changes look good to me.
> 
> I think so.
> Should I resend this patch?

Thanks,

IMHO, it would be best to split the series in two: one patch for net and
one for net-next. And resend both.
