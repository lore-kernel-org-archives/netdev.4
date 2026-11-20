Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162444;
	b=5ng2d/rYLZ7iLw9TvLXqmbjRTGTWMSrhkskNzzxnY4FcA64fDzlm/e1wztcjH4esuNQ5
	 692RBr/pu0NWiDKApvNtE0a19y21cTE6hOjy/wYVsQPWWmvXBzGTjSkOAdGzYwhzPzLBS
	 vOndU+TVUNV4ajbraloEQoGhtF4jzjJ46Uusab8d1uU4AvrACmsMzwFZOkopjsz76ncEG
	 bd/BPJC6nzPGmHwpxJyOPBXtJB7RWQhNe+wofGz6mMx+Vm1Ddqub6OJbEBCr+POXZwBB8
	 KnwxFpBKOARMkpvtAdAu78iFsrAc/C+xmYe4ReYob+rmb7QyJdDPy1dYGB5QN3ZJN7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162444;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=RpMYP0Ydd5BpVNbkK9E+iOAiDlzHS1ASNDtCYygPy+A=;
	b=P/v6gyub6PQdEED//FzPCO3xa/WNivrQJQLXvxuwlzWv1ZPeDhhjs6CAhB5czstacGOs
	 ko2ZLbzSf4mlpNNm3BM4Jy+jOJptuqZlQMyOY9CTXYHKc03hHcut8+nyk+qOcoX2d4Bvl
	 aBlQRt3rDVGqLoEq6orxbdlz4KnUnSKl3ePgFFWx9TV9OggnnOLeWtjI8Q3OPpUFZiqrS
	 A6JGG32eP0LGTZARt+tqTnaNOMuOBSr4Mb7aP67foWEsaLpKQ9Wnd5mKmICs/Xugczfbo
	 nn2SboRmqUYhdISx0aGnXMagIL4vKTxIUyL3iKqzqCskv3WuheWa55F0whOeMig5wKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=iOT0uRHI;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD2606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCD2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=iOT0uRHI
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 4AA3F2069C;
	Fri, 20 Nov 2026 09:14:02 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jVaYZugiYu4; Fri, 20 Nov 2026 09:14:01 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id ACDFE207E3;
	Fri, 20 Nov 2026 09:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com ACDFE207E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795162441;
	bh=RpMYP0Ydd5BpVNbkK9E+iOAiDlzHS1ASNDtCYygPy+A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=iOT0uRHIBBhzbHfkP3M6dsrg5PaePdDXNRVUpCrP2aZY+0DzUPYpFlobkAktZLRZ8
	 Pv/Ior9Bq9Hu1ytd7BqSIA7QIhJ09YGhvAJcpeEzyGh/TDwWkwzcRe6v/Or1Ehh0rb
	 kaz9JCmHq/AFuAvVjXxF0tDXTackN6ARjPQ7jy9RCFEHUw2tAfQLlsepDCxuKyb5NA
	 EwBAem2xoAHH0k/SO/svDPAf/zGF6aLAhhc6nf7L2PLk7Hb/bqkJiEW02zBYQfmvhV
	 Du9/rsd1qhidqreVf4AiPG2mYWvHsfn2sbFJ9yX92nbqg76sV/ge2hb7Nk7dN9pzjT
	 MaPNtcSkOixOA==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 20 Nov
 2026 09:14:00 +0100
Received: (nullmailer pid 1759879 invoked by uid 1000);
	Fri, 20 Nov 2026 08:14:00 -0000
Date: Fri, 20 Nov 2026 09:14:00 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Cosmin Ratiu <cratiu@nvidia.com>
CC: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shannon Nelson
	<sln@onemain.com>, Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH ipsec] xfrm: replay: Fix late packet handling with ESN
 crypto offload
Message-ID: <awABSJrYIhEIbSZY@gauss4>
References: <20261110133821.2548903-1-cratiu@nvidia.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261110133821.2548903-1-cratiu@nvidia.com>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Tue, Nov 10, 2026 at 03:38:21PM +0200, Cosmin Ratiu wrote:
> xfrm_replay_seqhi() guesses seq_hi for a given ingress seq per RFC 4303
> section A2.2. Packets with seq < bottom are interpreted as being ahead
> and the function returns the next seq_hi. xfrm_replay_check_esn() redoes
> the same computation and defers to the ICV check.
> 
> On SW crypto, such packets then fail the ICV check and are dropped,
> unless they're actual packets ~2^32 in the future (very unlikely).
> 
> But on crypto offload, the ICV check already happened in HW and isn't
> repeated. xfrm_replay_advance_esn() then increments replay_esn->seq_hi.
> 
> The problem becomes visible when the HW state is renewed (e.g. bond
> failover or mlx5 mid-sequence ESN state update). The newly offloaded SA
> carries the wrong seq_hi and completely breaks ingress since all future
> packets fail ICV.
> 
> This was verified on b2b ConnectX NICs, with an 'iperf3 -P 2' test over
> a pair of SAs over a bond device in active-backup mode.
> After ~10s of traffic at ~10 Gbps, replay_esn->seq_hi was ~2.5M due to
> the two streams sharing the ESN state.
> Forcing a bond failover on both sides breaks traffic permanently.
> 
> Fix this by dropping packets up to 2^31 before the replay window for
> crypto offload, since the SW seq_hi guess cannot be validated. Packets
> up to 2^31 ahead are accepted as new, same as old code. A burst loss of
> more than 2^31 packets now stalls the SA (previously up to 2^32-wsize).
> 
> SW crypto is unaffected.
> 
> Fixes: 50bd870a9e5c ("xfrm: Add ESN support for IPSec HW offload")
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>

Applied, thanks a lot Cosmin!
