Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609915;
	b=R/gizlJm3JD6R0ry+XfToFb7myuwVC1+iwSCnLIG9XiRQBWGWfboaqlwK7ae/ineAHPK
	 ZrfTJqI88cNSTuBZzDwopyC5ztGOGZx7Rj9EeFWBY7b1u9FFon+yhUtWXLkz9KsGvqIMa
	 7gHpa9WgeY4v1P9HEfl1B5BdVmK1NPDyIzp4bvBupy6b+6gOoJXmuQdWDh4gbvJWRbt6i
	 KsK+si6rYMWjin0TlaefvwIYmGN5r4vM7DvO9DTSMBmenizX0/R5FCTAROvqQWPOR0QWU
	 9r8AteI0YVSrw8FJ4LbQ30f8Qilk9Z3MAlu/h2Xa7OIwbotanMxdgjwPKbU2ruyEy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609915;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3yaDcAf1oj/ySN2vpJMlDxXJGpm/IAJcorBM34baRh8=;
	b=wpgFRlqflM1sw2A1KunvpCXyspwC1eZEqeu5qhssKd6uqoUpv1HEtxbBsZDl6RjuCQiu
	 IP9teBxe6gvWg0dea4HCRBgkEQa6xoNZtaF0hrzkkWi3LvWOGOIUQd8+47qbFP1BLA6zR
	 3WSB8Y8cba2yVYgIZXefHFGwvPFOlTN7DSF5JnrfJnA46mWxVbB9NrfCBctBcp0nLYHBw
	 EvEaTr1aH2tUg0HkBJ4sqox6nCa6vsndopfaHaJ7bpdjHDALCKwWDMd6rCr4rTwpPYIzO
	 Zp2erh7B/bmtTZO3eJWEKRHIIte8E5vTcvH3YRpGUJ7SW6gdq4CxFxbxFuy/vp0THEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=iNJwuccu;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2354606A31E;
	Wed, 25 Nov 2026 12:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2354606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=iNJwuccu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795609923; x=1827145923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4UZpFuKDX/vjyd2dmzd1ze33NJp5qh9mgYFYYWHOYzM=;
  b=iNJwuccunI8vNAEQRbZx8dkb7mMssyHlKTx+y4PI+IUvfKBVa2yGXWrd
   X/RWr2YbwUesf+4fwwuIPKP+TDWxBsZIRi2Cqwcsnt+35UtES3DQmzpvU
   bUBkK0veE9Jssf/QPAB/4VfzFwjGhF8SsxsTC4+hU3RO+wGOfM0PVafz9
   hEE+8Y5JNnJQgTj6YDVNrSmE+OIokfWfjPOvLzxIBRvciQXZRcdMXD/RA
   2Gx4UF1zS+efeQXo4SUO7XCGRdbmu+XpHUsqsaGmB86zecEKVFgUwbXTA
   KPBeAulOLnpdnzR08YQ6iCxj+kI0PwsnAgDHdA+9DxQpUQ/0G+GMwhvw+
   w==;
X-CSE-ConnectionGUID: Z/VTAwobRie9TaLrsDOrXw==
X-CSE-MsgGUID: s218ldDgS0uvBxuK1GrKrA==
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="298445225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:31:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Wed, 25 Nov 2026 05:31:47 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 25 Nov 2026 05:31:45 -0700
Date: Wed, 25 Nov 2026 13:31:44 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Ian Rogers <irogers@google.com>
CC: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Paul Fertser
	<fercerpav@gmail.com>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH net] ncsi: Initialize vid in set_one_vid() to handle
 concurrent VLAN removal
Message-ID: <20261125123144.p5i5dc4ifsnqbhly@DEN-DL-M70577>
References: <20261119171009.1534335-1-irogers@google.com>
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
In-Reply-To: <20261119171009.1534335-1-irogers@google.com>

> set_one_vid() checks list_empty(&ndp->vlan_vids) before acquiring
> nc->lock and rcu_read_lock(). If ncsi_vlan_rx_kill_vid() removes the
> last VLAN entry in that window, list_for_each_entry_rcu() executes
> zero iterations and leaves vid uninitialized on the stack. The
> subsequent 'if (!vid)' check can then proceed and program stack
> garbage into ncf->vids[index] and an NCSI_PKT_CMD_SVF command packet.
> 
> Initialize vid to 0 so that an empty RCU list cleanly hits 'if (!vid)'
> and returns -1.
> 
> Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
> build. Verified by building net/ncsi/ncsi-manage.o with LLVM=1 W=1
> (-Werror) and -Wconditional-uninitialized; not runtime-tested on NCSI
> hardware.
> 
> Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  net/ncsi/ncsi-manage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 1d63958c4429..f7eca228c281 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -640,7 +640,7 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
>  	unsigned long flags;
>  	int i, index;
>  	void *bitmap;
> -	u16 vid;
> +	u16 vid = 0;

I am not entirely sure, but can the list_empty check below be dropped as a
consequence of this change? Seems like the !vid check further down catches that
case now.

>  
>  	if (list_empty(&ndp->vlan_vids))
>  		return -1;
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 

Either way:

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
