Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916215;
	b=sChlwLf+eAwhUtecp4VHVDAALKqwplrvYkrIoMhlg/JCSesIKEjoPeW+wfrt+BfFUI2A
	 iK9TGWCaS7D3NdfGENjqLojSj6eZO/XIS1DZGB4YmDjH3tg/aR7dzOORTmAuWpxrAKrbu
	 iPDlDUvLGkDkIBl3t+8NuTfcfrPG3PuUcAlsDWwMtEWcXB90KwH7XriSVBugrEUomPLOn
	 ofUmHzn/Ru8RMFsz/6RYAFIV41VpNBR5g5YI+YQjcA6/iQnjQHWMbuYfXgs9OubXP8YG8
	 VtzlK2UTQqp/hu8NgeWBGniiM65yYmlnT2dSTX5kWdlFNFVemPzUZG3bMY5qFLmxSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916215;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9z9luSqpxK+3G7vNMlPxAahsBNomIlzweL9Vvy7FJ9A=;
	b=OcqIrcHUk1/rMXfKZ99+RV6S7QtFTZxu5nstv6FnR9AZykNrmlqRLhpAHb0yMnFArtDs
	 Qs/n62J0N34CxtznYPs0HKRwVS0GdAKGqrd6WSMMF2HJ6TTbe08Kg8qqsTjLJhyNPLEHF
	 4DXt2vcmVX6QfD2l4Rqe6jLD+PWVti9l0zUq7GpmmiWBV0uTJOd/wSJoiEZ1babSdiDiW
	 rgO8b41/5VtwgPnNN5KBcNEnKjwufslRVKjf5HWXfa8rXRCuneQlZx8U9dYXX08wK4OPq
	 RhfxloYruqQbg6D4Jyps5et2/+fE1cyDw8lF+1DdvsF052bjDsokYsyy7RrY/8kF2Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="rYpFc/lp";
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223A606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1223A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=rYpFc/lp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794916215; x=1826452215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lG2nImVC9c8/pRfZMC9gWS5P8n/kAGAqJx+p/zwxPMM=;
  b=rYpFc/lp6+EdTE1V/vFN8qOUrTLGbNZMzKZakJeSOBRXI1A69mwsV+f2
   kwoT+PcrTtfFJ0GoS6B8Dq+ki2rpcWlEy121sJcArDbIEX41UPsRq5o7J
   OcJOKWnpUwp9udfeSv7LfjCDZTzqgN3lR6PRghAw/FdKCG8mvMXjh+dKK
   DYa6mokJYwPyOkO8+SgFiOFiCNKS55Xz3hynDuQxzZD0Qb7ncHrDmaI61
   sUeQ3qjko17aYNpI1FFu1E9vqBzn1FUVx/5FEeYCOUlEzcfg1x1t5504H
   dXMz0E90bNZibpZtKqwBF4btrNad0aBIBBDs+lemcMgZxWMixhO2g+Gx7
   A==;
X-CSE-ConnectionGUID: 4RkwkwX5SQKBAad+joVk0g==
X-CSE-MsgGUID: gbZs8cbHRS2T44dJYHdCKQ==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="66634410"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2026 04:50:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Nov 2026 04:50:07 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Nov 2026 04:50:05 -0700
Date: Tue, 17 Nov 2026 12:50:04 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Avi Weiss <thnkslprpt@gmail.com>
CC: <netdev@vger.kernel.org>, <akiyano@amazon.com>, <darinzon@amazon.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <evostrov@amazon.com>
Subject: Re: [PATCH net v2 RESEND] net: ena: avoid double-counting TX DMA
 mappings on failure
Message-ID: <20261117115004.dtjs633vcl3sgrec@DEN-DL-M70577.microsemi.net>
References: <20261115114233.2307630-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261115114233.2307630-2-thnkslprpt@gmail.com>

> ena_tx_map_skb() increments tx_info->num_of_bufs after each successful
> DMA mapping. If a later fragment mapping fails, the error path adds the
> fragment index to this count before calling ena_unmap_tx_buff(). This
> can cause DMA unmapping of buffers that were never mapped and
> out-of-bounds access to the buffer array.
> 
> Remove the extra increment so that cleanup uses only the number of
> successfully mapped buffers.
> 
> Discovered by comparing the in-tree ENA driver with Amazon's standalone
> ENA driver.
> 
> Compiled with W=1 under x86_64 defconfig and allmodconfig configurations.
> Fixes: 38005ca816a7 ("net: ena: add functions for handling Low Latency Queues in ena_netdev")
> Signed-off-by: Evgeny Ostrovsky <evostrov@amazon.com>
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Seems like v2 was resend to add the "changes" section only ..

anyway, this version does what was asked for on v1 and the fix looks good to me.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
