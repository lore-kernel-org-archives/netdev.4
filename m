Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179484;
	b=4lp2IhcM9MVof1opgWRICBtS9/+8BZuhm/9cs16QZ7AEHdjEaXBm3TvQwfKvVTSBFeWR
	 lD4w6guiH6lPyoeBP1bjo/q1PlnB1xD6K1rEs1rjXaPZOf9TFgVwbuzmwr5Qyq1j/w8ql
	 TtteD1iMQaOQUVD+xrBmzZYAZv/J/GM99IZMdPIiy97Jp/t1TBSYOpEvvr54PkzzWsFo7
	 t2vrd8cdU0ED3nU8aHbsFmdL+uFWXS2V3h5q7/l2Uwb/aqd6qbRIV5NXTZJb1z5sXfUg+
	 YSAaa3LhGLz0Se3/XUA3kx5I0Q3D2XqzAHeUNXA2VV3NtX+3HxDIfjDz5ZDQqFSLQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179484;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HICAxW9hKPp3hogqbvuyRbR5w9KjoyjC7PdKcrx5lo0=;
	b=oTwCbmyj12SrTQByJrTaMwnIlTO5DYm3ES+gcDOSeRac1ORKV3jFhEoaOkGY1Cl/FYvT
	 l/SmDkZ64a4HvzNiNbW8fwkN/PD7iu1QGSAEzB2aoInc4yaT7EEHigtuKBhO4TT9A/unr
	 weOeq72xVxvC0DHc/bpxI51qMvauPV5jAw53sdiLB7aZoD5LYpyGfXY7uhM6dXIg2tMVa
	 LxnulyWlAQkpfbS75Nng0tXe/M5Djg4zx4y1z8zuRr+VCo+iTnLXmOVb2I+gJ/UX9OX7E
	 658CYAbsBX3EbS/GjIipaN8mA8khIpvpLCQmKFqFbUVZp/F4GGKZWt0luMmMmpGgCcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Gayfnonm;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E8606A335
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Gayfnonm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795179484; x=1826715484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E0RV1W13PBTHO5g5DLm+FLalTSWvIOTJObnsFQ5dIl4=;
  b=GayfnonmKGAgZ39LKMFmXKHZeI/6T3v3+2gbhJrcBkjAAq6cS0AgULoS
   IEknckVioMchHpZhor8hJFzDtH3U2A6xW08hHM/68SHlYrZ128ejJg1WD
   R/FRUrn0EvDFQiB8rr7HpoJ/e7g+5dbqvWdfWnSBpXiHpv+S0HbkonKgw
   uU3mpBhNa4FPQ8f6+/zCOJUbUupzaQidFWaVmkYUpjh0DA30TFLJWo6bo
   IzUOI594oXH9/ymIOFYnRoT4A+OQGWW/X2DRxBJdYgQHC7wEEootOf3XF
   MDUsaL9C7PioA2QzI7grHqSrzI3ZqJT7uFm05MUcv88HktwiJvtFWSAmh
   A==;
X-CSE-ConnectionGUID: xiVjyP7VSKiA0E6pHn8A9Q==
X-CSE-MsgGUID: TeTuOJsmQkug9KY802+MLg==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="65844448"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2026 05:58:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 20 Nov 2026 05:58:03 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 20 Nov 2026 05:57:59 -0700
Date: Fri, 20 Nov 2026 13:57:59 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <netdev@vger.kernel.org>, "(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>, "David S. Miller" <davem@davemloft.net>, Felix
 Maurer <fmaurer@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Neelima
 Muralidharan <neelima@ti.com>, Paolo Abeni <pabeni@redhat.com>, Praneeth
 Bajjuri <praneeth@ti.com>, Pratheesh Gangadhar TK <pratheesh@ti.com>, Richard
 Cochran <richardcochran@gmail.com>, Simon Horman <horms@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Willem de Bruijn
	<willemdebruijn.kernel@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v11 5/8] hsr: Use the port and header
 information in hsr_forward_skb()
Message-ID: <20261120125759.sr3r2dmcjeb5uo2b@DEN-DL-M70577>
References: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
 <20261120-hsr_ptp-v11-5-264c88f4f1d0@linutronix.de>
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
In-Reply-To: <20261120-hsr_ptp-v11-5-264c88f4f1d0@linutronix.de>

> The upper layer can submit a port on which the skb should be sent and
> whether or not a HSR header should be added. Use this information while
> forwarding the packet:
> - If the port set, deliver it only on the requested port.
> - If a header is already present then skip parts of the stack:
>   - The packet originates from the master port and we don't want to
>     assign a sequence number to it, it needs to preserve the original
>     one.
>   - The existing h_source must be used (and not replaced).
>   - The node should already exist in the node_db if "other" packets are
>     exchanged. If the node information is not yet existing then
>     creating it makes no sense because it is used for deduplication of
>     incoming packets and this is not used in the PTP case. If no other
>     packets are exchanged then the node_db will age and then removed.
> 
> This is only used in the pure software version. Hardware with any kind
> of NETIF_F_HW_* offload support need to be addressed separately.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
