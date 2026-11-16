Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820599;
	b=QEsjQD4ddz6pIE1dcoaq6IMrAwaPwR0dxOfs+LVIt5Y10wIKDe5OQkQxPQyTWo6nENp8
	 DMbbgAMB57wviKQHTu1BoQBnqqj7snz2o8np4lV+XE30Uv+FNuOSAiD1YfaaykhavV9Zd
	 D0P2cSP3P+cyIgu+n1oi05rQYITiGF+ck1fLnF1+XJE19QG8LDGXid2sKM87MoIknBY/0
	 O/w0CJmyR5ufYKZIAtwfz5xR0XsUjQjDmhdJy8dp8lMK073EAv4u1jAoDw8ORWu+od+k4
	 UOJJ5sHVfcezucnCTmdwBDxiZ+1G76coIyjq3Sa0Jo9jFokkrNzw3XniW8SeE7Hm4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VkwEOeYMTR6KM26KxQ35AtYGZ+Jygm8INKUJOfX5Xls=;
	b=G2lTbq+axJeMvQoZ6TC5H9CmDv8PUfTj5NXHZsaOSno/zqjLcUj09la4G0R3W2GPQ3hR
	 xvhcmksaqtdcrC5pHZlwrJ1iRDqElP+noA+Hm6OgPsXqG/lp8pCzP7NHR0a8K1xj4SoMD
	 SVLV6a2Pf7AxPyA2UbnDn2D3uoiti0PQ2NnYL7JroAmYm89hFsDVQpFb7DtjTGhkxumoD
	 /N/G5EFNgwQMReDqBcKic5Et6w5QjdHDkii/TyNqRmspfeLTtcdCgxvOO3IsFEDxyphG4
	 usX4gKzA/3KqYc9do+vyk6yPCVpNM7cNKvohlRX8ETDes12ZG/WFVik2CMNlhCQlfIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=SSep7omU;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF11606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=SSep7omU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794820599; x=1826356599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uT1Mrn1WlOWl2grNgxzDPbNF840bvJwhGr4XNXWBLBE=;
  b=SSep7omUUXXCywY2TFO5SC44ow2aIqvImJhmyy6NrOyWuIcZ2sqaFhcV
   kYD/PNBRWYSSg8QM49kVVQh6p6nS+g/bNSVFQ9ADeUtEj27G4A6RHf+p3
   xh0IwIyMo7UrJvcAMpQIjQHUF7d+baQVaGdMREBRnC+3/1GpSCIJ7ot1l
   U5b/Kf/bwLHlHcYsSzoFVt+1QP/rT0syMmm0OqWtOY4bGkJfaP2+tbcJP
   zBfxwhZCTRXbRYO1CmyyTk5K9jFkEBsGu+2oXgllz8n1R1mQaS+ij/jEB
   cP9apk0zcz5hS2PvBRsrqcO7b0K8/AFgb/N9zesgMmYDq9WGtSvn/MbFC
   g==;
X-CSE-ConnectionGUID: 3ow4PYTwRPSBoSGzcJvBGA==
X-CSE-MsgGUID: SMwhknxDRoiRwBs5D80R6g==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233611726"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:16:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 02:16:38 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 16 Nov 2026 02:16:36 -0700
Date: Mon, 16 Nov 2026 10:16:36 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <memoriaru@foxmail.com>
CC: <netdev@vger.kernel.org>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <kuba@kernel.org>
Subject: Re: [PATCH net v5 0/2] net: sparx5/lan969x: fix RX ring stall on
 frames from inactive ports
Message-ID: <20261116091636.mq3ewdccqupa7anw@DEN-DL-M70577>
References: <tencent_D2451CD0D7B4B812CEBADB56DC722BC33406@qq.com>
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
In-Reply-To: <tencent_D2451CD0D7B4B812CEBADB56DC722BC33406@qq.com>

Hi Zhang,

> From: Zhang Hewei <memoriaru@foxmail.com>
> 
> The FDMA RX path on both sparx5 and its lan969x sibling stalls the RX
> ring forever when the hardware delivers a frame whose source port does
> not map to an active netdev: the inactive-port error branch in both
> drivers leaves the FDMA software cursor untouched, while the DCB keeps
> its hardware DONE bit - so every following NAPI poll picks the same
> DCB again and RX traffic stalls on all ports until the module is
> reloaded.
> 
> Patch 1 treats a bogus frame on sparx5 as consumed (free the skb, clear
> the array slot, return true). Patch 2 unifies the NULL semantics on
> lan969x: NULL always means "frame dropped, page recycled" (inactive
> port or failed build_skb()), and the poll loop advances past such a DB
> like it does for any other frame.

Thanks for the series. These fixes conflict with my MTU series for
sparx5/lan969x [1], which is now blocked on them [2], and the remaining comments
on 1/2 and 2/2 would need yet another respin.  To move things along, I am going
to post my own version of the fixes, crediting you with Reported-by. I will Cc
you.

[1] https://lore.kernel.org/netdev/20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com/
[2] https://lore.kernel.org/netdev/20261113191400.2451b854@kernel.org/

/Daniel

pw-bot: reject

> 
> v5: add the testing status to the commit messages as requested for fix
> series (patch 1 not tested - no hardware available; patch 2's
> drop-and-advance form was verified on lan969x hardware by Daniel Machon
> during review). No functional change since v4.
> 
> v4 lore link:
> https://lore.kernel.org/netdev/20261113122429.26163-1-memoriaru@foxmail.com/
> 
> Found by code inspection; the stall needs the hardware to emit a frame
> with an invalid source port, which cannot be triggered without hardware.
> Review from someone with access to sparx5/lan969x systems would be
> appreciated.
> 
> 
> Zhang Hewei (2):
>   net: sparx5: fix RX ring stall on frames from inactive ports
>   net: lan969x: fix RX ring stall on frames from inactive ports
> 
>  .../microchip/sparx5/lan969x/lan969x_fdma.c        | 14 ++++++++------
>  .../net/ethernet/microchip/sparx5/sparx5_fdma.c    |  8 +++++---
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> -- 
> 2.39.5 (Apple Git-154)
> 
