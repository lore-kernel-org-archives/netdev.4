Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133829;
	b=acDedIxPY4JdV9XROmM4C+snkRpJRwCFAKdw397r5j0u6AsOoPYu301dMO120fJp0N8s
	 q5EFKI2pDtSKibWN6OevbFrt7P3bWY5+vUEFm9CYnhCkDVh0HvzEGEL1pDbq/8+SmCsQZ
	 0K7mWvYYT0mGsqEpocUCRW1f4Y2bXvdkbDTqUaPDYCInQX5H2BZVWjIMieso9FWYegWmx
	 Xayp0LfOZh5sbMoET+/YPFCb5QYnLZC2qcE12mvdujgWMlTeyiDS4KokL92GRN0FLKJz1
	 S2s9+qkktotSUL8Oqjgt3KQx5lcPyPm9NHR7AWbxTt2h+D//T81Qep+m32CELUHvZXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133829;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=OLsKfGJGXGbCFEXjWw/sv6ne1Orj0T4H+oyWO2Za6zI=;
	b=kh9H/qYkAyoF51IKk3uhcGcPesMRIkP3c4vbC+reNJnghSGE/4uvuo8mq5RPrDL26IZJ
	 l7MgiwAnVNiMU0Tr51WG2Ea1gAABQZHI3pZssCLM+924U2L7CMCcolf2tmmE+m8iHPyll
	 jQDiKH42/tEPny5XihqCiJAk0CO8zWPnnQTjl32eN/O5jWZU/ri1rlgPA9CJDFqJ2M0C3
	 HXAGhUN5gsjItjoSPD2Eavwp5wWaNMjmoAmC8KdPOUb9+Mz+uz6MEH4A01RBWsWM+6DOY
	 y1pHy53J9MkOKaahvqgFvd16atJGiKJ+c056WfiCx4sDLUL7QQy84xYiD6+uSZJkmjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cTawwDfV;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733E6606A325;
	Fri, 20 Nov 2026 00:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733E6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cTawwDfV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795133829; x=1826669829;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=yEi5eshbfr2TQL5MUtp80HFRx4STfemmDqBrkrAfDFo=;
  b=cTawwDfVty2TKcWPNW+YGMaMIWJCXpq3QL/aU2TJiy9fp2hZrSy8V2Op
   WF1TaNuzfpe5SCPC4jkZRyW1+7T/c72xVQAE2zPnQWXUIFYOiV8nI6h+d
   zeoRR3FIM4f/9weyISDdD+VBjZDlOFHeszhHO66pzfXCNL6gdDKu114Ug
   K8eP2UfGrC6d/JLddGFEMyKXPNXVlRA/9UJ4zsjxX70uU+x9bDjJ88vme
   arZpJYFuu6YF3DGHV6c2AqfCo1bM8P2iLkAp0bOt5OsaWm2gzDuJW9T89
   1qI86XoQUErTOQN2u11tR4OejaavWDbASAWXxBr7dYYnIFV76TWP83C50
   Q==;
X-CSE-ConnectionGUID: Se7oxJ/KR6CGCLP4EqIYVA==
X-CSE-MsgGUID: vObhtkkJQlucj/NwGKruyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4105498"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4105498"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 16:17:08 -0800
X-CSE-ConnectionGUID: 6P4Ifn6RQLWDsYJYpnLxHg==
X-CSE-MsgGUID: UY+0hjRkSj2bHDcTgn6ASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="11129307"
Received: from vcostago-desk.jf.intel.com (HELO vcostago-desk) ([10.241.240.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 16:17:07 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Mohamed Dawod <mhm.dawod@gmail.com>, netdev@vger.kernel.org
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ye.zh-yuan@socionext.com, linux-kernel@vger.kernel.org, Mohamed Dawod
 <mhm.dawod@gmail.com>
Subject: Re: [PATCH net] net/sched: cbs: fix 32-bit overflow in transmission
 time estimate
In-Reply-To: <20261119053357.2033707-1-mhm.dawod@gmail.com>
References: <20261119053357.2033707-1-mhm.dawod@gmail.com>
Date: Thu, 19 Nov 2026 16:17:06 -0800
Message-ID: <871p8gtkzh.fsf@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mohamed Dawod <mhm.dawod@gmail.com> writes:

> cbs_dequeue_soft() estimates when the transmission of a packet completes:
>
> 	q->last = now + div64_s64(len * NSEC_PER_SEC, port_rate);
>
> len is an int and NSEC_PER_SEC is 1000000000L. On 32-bit architectures
> long is 32 bits wide, so the product is computed in 32 bits and wraps
> before it is widened for div64_s64(). For a 1242 byte frame the product
> is 1242000000000 mod 2^32 = 754451456, which gives a transmission time
> of about 60 ns at 100 Mbit/s instead of about 99 us.
>
> As a result q->last stays almost equal to now and the packet sending
> time is ignored again, which is the problem 'commit 961d0e5b3294
> ("net: cbs: Fix software cbs to consider packet sending time")'
> set out to fix. The throughput becomes
>
> 	idleslope * port_rate / |sendslope|
>
> instead of idleslope.
>
> Measured on a BeagleBone Black (32-bit ARM, CPSW, 100 Mbit/s full
> duplex) with software CBS (offload 0), one UDP flow with a 1200 byte
> payload (1242 byte frames), sendslope = idleslope - 100000. The rate
> was read from the qdisc byte counters:
>
> 	idleslope [kbit/s]   before [Mbit/s]   after [Mbit/s]
> 	10000                11.1              10
> 	20000                25.0              20
> 	30000                42.9              30
>
> Cast len to s64 so the multiplication is done in 64 bits on all
> architectures.
>
> Fixes: 961d0e5b3294 ("net: cbs: Fix software cbs to consider packet sending time")
> Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>

It seems that you had tool issues and the diff ended up being
duplicated. With that mechanical/process issue fixed:

Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>

It seems that it would also save CPU time, less 'qdisc_watchdog' being
scheduled without being able to make any progress.


Cheers,
-- 
Vinicius
