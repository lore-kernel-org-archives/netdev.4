Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076593;
	b=wtR3vIjB9noYn+YbsvYUy6gla7ID0iiuhT1o6LBbJ+TS5h/EzwSPPmS77TyRvraBnVs7
	 VRCw365RPRSP/CXr2M3UlGFjWpmw47qXCRMZ1Sgc0q+ctzvX+AbW03PRVW7XBhD0hrqcd
	 II7BxKoWckRqCHv+mbpAw0K1GgPaa/yXrl753nBSCYizG2KcCZD4QxLMQDsNfugxR6Xip
	 NKNVbm4zICw1chpkrCcKFSQox1Vj/SmnNWAg1+uDqMkQIstdYFWzOVRVbn+JTX4l/QMFD
	 QYBosrZC6hYffbxiHTrC1OhJ0BDCklRFAFLh3042o8OHiLhMiKPXh9jfHbYVNgH1osw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076593;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=1Llotjc+vxRwsDCh0tNCx8AKlI0T8ZOBMb8uDykkROU=;
	b=33lMXSXdCnWBqxvqbrJBxRo0SBanYGAmcaDfFM14WLrTnsLOx2tGL+YJDDnXLw/HV2rk
	 x7lqHFfmC5Lgp3pWRRDpHEFF2DB6pdPC02mjaPVRSTS3TRVTerCdt3eGVbPLlYQM+1o3s
	 uwzP5tPV4Rn7qY9wlHU9E0w7NUqGYkOf32zK94u5xw7oaMqGP+hNA8GGeuq5r6jCmCcek
	 NXKz7tFDxA/+UFcUdo1T8+iIFEmwwo3WnqHZfkPxiKhy8qDOBagAZydjJ2AAe2yG2rDAu
	 iXzuARWuj/GFd0qOFrUF9Bx7LWm8Qhy5ZOlonqTZWJ8IHkGejz71/eGMHk+S7tk5fTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=G8RmQO9Y;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843C606A325;
	Thu, 19 Nov 2026 08:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A843C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=G8RmQO9Y
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 3C854207A4;
	Thu, 19 Nov 2026 09:23:11 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nlwCSEHTk_N; Thu, 19 Nov 2026 09:23:10 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 8F97F20606;
	Thu, 19 Nov 2026 09:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 8F97F20606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795076590;
	bh=1Llotjc+vxRwsDCh0tNCx8AKlI0T8ZOBMb8uDykkROU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=G8RmQO9YXNMSc4wfYwNGQx3mmvAsTb5g8w+WI3CYSoSeiLt6UYJ0MEpVH7A7S1BBZ
	 6TKqtqr8PvhUhdxrUJxb40+9YwjAtT1ajSzY+bvk2r1w03XbNNL4OY6p2OyVKdskyz
	 VJQVXLZ7+Tuh9BNiN0UsZ/+/tl6KFDASTEAxQVJEl6nUY/Aa2xRgBixJYIbVrAVwlJ
	 Cdx4qVEybvCnwScrbKrfUH4ng1FA0FFAXoK9A9embeiv3KrpYU96gdnVK4Xkgw1Fst
	 HSg9032SZLRUbcISxhib9eK/Mf1e3c9d2SdyN0rT5Lkm9YfjnepFK8R3mU3kzhX1d2
	 n4uKNuNGSJCAg==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 19 Nov
 2026 09:23:09 +0100
Received: (nullmailer pid 297213 invoked by uid 1000);
	Thu, 19 Nov 2026 08:23:09 -0000
Date: Thu, 19 Nov 2026 09:23:09 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Tristan Madani <tristmd@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v2 ipsec-next] xfrm: check state validity under lock in
 xfrm_state_find()
Message-ID: <av6x7V11EyNhg00f@gauss4>
References: <20261030145229.74412-1-tristmd@gmail.com>
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
In-Reply-To: <20261030145229.74412-1-tristmd@gmail.com>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Fri, Oct 30, 2026 at 02:52:29PM +0000, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> The output-cache insertion path in xfrm_state_find() checks
> x->km.state == XFRM_STATE_VALID before acquiring xfrm_state_lock,
> then inserts the state into pol->state_cache_list under the lock.
> 
> While this insertion block is currently unreachable -- cached is set
> unconditionally at the cached: label, making the !cached guard
> always false -- the correct pattern is to perform the validity
> check under the lock, matching the fix in commit ddd3d01329203
> ("xfrm: Fix xfrm state cache insertion race") which addressed the
> same TOCTOU for the input cache path.
> 
> Move the XFRM_STATE_VALID check inside the critical section so the
> pattern is correct when the cache insertion becomes reachable.
> 
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Applied, thanks a lot!
