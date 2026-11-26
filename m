Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674720;
	b=X3dTuaJxuIbq91CswfzXGJGQar/zMRbzBRcacwbdQUhI0488d5FCm8pYJPtgPHnJGjld
	 z9QOCY4xnWMEf/eJqSfNLdpfBl5jsa8g6KA8yaT55Ogm796mer+xdbGsZDsmI6S7bIWj0
	 fOBVkEVV01vLNEwR/ecaPU3728eNGfiztdpH7RFIvGHFTnxUFFRDe1m77i7ZErOGEwtK0
	 vLdib8wi4ugYIIe7UEHNGC79F1gLXhX8nKxODpbY7RIyINshlPguqWxGEYskJg0DQ+mjN
	 Ru27ZUHPQApMiBszCkk1rCmkD/z4h/H+NS47Ppoiq9JCa8X8PWkmYeuyiGWbeqg+oFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674720;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=Rz3OtAkC4oLPUzZvo2Fsc4gS4L47l7wc9Xn1pL2Qe2Y=;
	b=GPujmfCgoORHsBRY7WLGUFBvdASQZk6wXOFm68sTFO8Z29bNXCcsxbcGdFp3Y0i8QicV
	 3b3BIFnbwzC68ZDISH2VUioO3UMRaPgSxUcASF/0qdkb719uiWvm7PnrCGjt0jYTNNAr9
	 Z718+ZYbeMkPgMQsICxAjiN260U0B/tC15BL6hcuhVOPshscTLyAcvF4OJapnbm+9VLnx
	 0eRVB5gDKLdNIMoceJpO8snpK+qMiUaERHKLIO4YlJ3n6YY+HsHIrWC36BooRoWpdi/P7
	 MdXxvoentetDxiAJnDVdAgxO5ZShCpjp5uk8CXexiWGpf4Si7obGwOyjZjJBiVugN4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=TMGxR2el;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608F606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7608F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=TMGxR2el
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 72E0920851;
	Thu, 26 Nov 2026 07:31:57 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3tkRXbW73jW; Thu, 26 Nov 2026 07:31:56 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 47D4A20758;
	Thu, 26 Nov 2026 07:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 47D4A20758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795674716;
	bh=Rz3OtAkC4oLPUzZvo2Fsc4gS4L47l7wc9Xn1pL2Qe2Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=TMGxR2elwX4796YutfoWb8vx9B/otCp23iYCXRHRrz6UxVo5htQtDHtQMxnmJvYat
	 9mVkQfks7vcRdcwkpBkZVzCrhiH52jBfRdNJQKoynsajtcSVffasUBtsSMvS7DRygT
	 BSQZpq03bStS6ZVvTBFy+Y0MqoGxCaXWzy0Eknj3vYqKORc6p7ZiPZubi568bcdT0j
	 s0YQRpl/hHuZdLSVwqZcVcQ4eX7NgZxIDSX09Q59Dw7f4uNVuVH0yYIUBmQpTbRYzB
	 UjtY7aIdoHIz/MIhxNqNyWSdyFIQ/QyjyCkG4UHyGNzHH1b4VTdNG8pAyFNhpZoVsZ
	 mTkzUqRiT6tpg==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 26 Nov
 2026 07:31:55 +0100
Received: (nullmailer pid 1874143 invoked by uid 1000);
	Thu, 26 Nov 2026 06:31:54 -0000
Date: Thu, 26 Nov 2026 07:31:54 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Eric Dumazet <edumazet@kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn
	<willemb@google.com>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>
Subject: Re: [PATCH net-next] xfrm: remove three registration spinlocks
Message-ID: <awfSWovE7zDwHYpk@gauss4>
References: <20261118230715.1630439-1-edumazet@kernel.org>
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
In-Reply-To: <20261118230715.1630439-1-edumazet@kernel.org>
X-ClientProxiedBy: EXCH-03.secunet.de (10.32.0.183) To EXCH-01.secunet.de
 (10.32.0.171)

On Thu, Nov 19, 2026 at 12:07:15AM +0100, Eric Dumazet wrote:
> xfrm_state_afinfo[], xfrm_translator and xfrm_mode_cbs_map[] are
> RCU protected pointers which are only written when a module or an
> address family registers or unregisters itself. All their readers
> already use rcu_read_lock() and rcu_dereference(), and the unregister
> functions already call synchronize_rcu().
> 
> Each of them has a dedicated spinlock which only serializes these
> rare writers:
> 
> - xfrm_state_afinfo_lock and xfrm_translator_lock make "install if
>   the slot is empty" and "clear if the slot is ours" atomic. Use
>   cmpxchg() instead. The return values are unchanged: -EEXIST if the
>   slot is already used at registration, -EINVAL when unregistering
>   while another object is installed, 0 otherwise.
> 
> - xfrm_mode_cbs_map_lock protects nothing: registration overwrites
>   the slot and unregistration clears it, both unconditionally. Remove
>   it, the existing behavior is kept.
> 
> Tested with the xfrm_policy.sh and xfrm_state.sh selftests. The
> translator code was only compile tested, with
> CONFIG_XFRM_USER_COMPAT=y, and the unregister paths were not
> exercised. sparse (C=2) reports no warning.
> 
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
> Cc: Steffen Klassert <steffen.klassert@secunet.com>

Applied to ipsec-next, thanks a lot Eric!
