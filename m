Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820490;
	b=hyGj2iG5pYVTuZHKX48KJBwIWMPOYywR9eElqktDGihFxE31OY5ydgodYB4Ge1mJLBbX
	 GN18bwrMWugVlvX9obtTk7pdlB6+7BBRvacM3JYsv9VtNr3pCayWsfF6/FWIlsx/YCvrb
	 /DMaIKZCLtym+OgB1jazuROoLz6RZ8HlsYocaLvO/h2z0ertNViO1Ka7WVS1jULwms6ie
	 A2aOmA/gOMJVXYe2EvneSZwXyWhCW30htkqFz4xKt/lOKoyaPOgzp2YQ8ttXQvPjXhbvJ
	 ZwNupIp0h4zRvfGGUtMdsjm+lAoeqTP2uaFMvMHuFUZLcU6H/ByqOIwWE2e806GbRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820490;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GlabMxGaGHUBUsOuj6cfu0uHz3tNpp8lusvyHqA1AhU=;
	b=J0UEi+YkMBO/IbbCUhBYAEUBLWftam9Ogh2i8qfFPQy3AnXvr4GUC8O94MDv4CP81Ip7
	 x2KkKd5fNMRQPKhR3gUDhAI0MKiIQT5spKRck10PDiiZ1FyfLGJkSg6No+uhVZlsGkJYx
	 NBdQNhIPEM30932SROsGSS+h7vBd/6LcCPKHnDS6MKoRRlpH9T1NdCI2S73Nv3IlEjUd1
	 tCaKUfxRjTfbJi8ayTrZ2cJn1jPYmfre5xiY96P93oqW8Lwz3FD99BZL8kLCVeSNhBlqn
	 XAwzeyl948DJ8l83TrzZFCW5kG7V+k9snOth9kzEDJZf1IaRfH48qe7++io+VRqZy2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=KcOVKW8x;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE074606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE074606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=KcOVKW8x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794820489; x=1826356489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+LW81viAAn/pBkl42i4PBJMZKxnZBokt604pS/JnUs0=;
  b=KcOVKW8x88KyUepUvZ7++cCpoF5bSN9aUsI5d109KwyyFwzhymzUt4Og
   wmUQVxPc74fgam/bH35hjPwKUg8mEOmRw6JzgPb0k8pPX4BM/9zKST942
   yhw6YuOj9Z9hwu7UUq/yHkhudgNR/e9IAO4dgHIquTfjbt8hMlPxQIEhA
   Yk2Zvm7ErtJWbSg1mN8poD7ecsdLb3qqYl5d2dvv0qhdWDcUnw7Cmpn6H
   5cgoezN1bQU2QTfO8RLIWlAyE7K3RVMA/IH0NTI+4dDNDNBk2TTa/mzjp
   SX1otVjJJLW9vZtC5JFqpQvNb4ZoqJC9Pg77Jhecp0VL/FMIlHMEfnNcA
   A==;
X-CSE-ConnectionGUID: 3zYf2BHwSWeBW1NtYZOpGA==
X-CSE-MsgGUID: foLmtA8dRoyckrJXc9pIWg==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233611538"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Nov 2026 02:14:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 16 Nov 2026 02:14:48 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 16 Nov 2026 02:14:47 -0700
Date: Mon, 16 Nov 2026 10:14:46 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <memoriaru@foxmail.com>
CC: <netdev@vger.kernel.org>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <kuba@kernel.org>
Subject: Re: [PATCH net v5 2/2] net: lan969x: fix RX ring stall on frames
 from inactive ports
Message-ID: <20261116091446.qwbfelzvaeovnbny@DEN-DL-M70577>
References: <20261113234436.75276-1-memoriaru@foxmail.com>
 <tencent_364C372B15AE436C192DFB31905364000D0A@qq.com>
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
In-Reply-To: <tencent_364C372B15AE436C192DFB31905364000D0A@qq.com>

Hi,

> From: Zhang Hewei <memoriaru@foxmail.com>
> 
> When a received frame's source port does not map to an active netdev,
> lan969x_fdma_rx_get_frame() recycles the page via the page pool and
> returns NULL, which makes lan969x_fdma_napi_poll() break out of the RX
> loop without advancing the FDMA software cursor.
> 
> As on sparx5, the DCB still carries its hardware DONE bit, so every
> following NAPI poll picks the same DCB, hits the same inactive-port
> branch and breaks again: RX traffic stalls on all ports until the
> module is reloaded.
> 
> Unify the NULL semantics: NULL always means "frame dropped, page
> recycled", covering both the inactive-port case and a failed
> build_skb(). The poll loop then advances past such a DB like it does
> for any other frame, dropping only the bogus frame and keeping RX
> alive. The WARN_ON() backtrace is also gone, which previously slowed
> RX to a crawl on every bad frame.
> 
> Testing: not tested on real hardware by the author (no lan969x system
> available). The drop-and-advance form was verified on lan969x hardware
> by Daniel Machon during review of v3.
> 
> Fixes: d84ad2c0d80c ("net: lan969x: add FDMA implementation")
> Signed-off-by: Zhang Hewei <memoriaru@foxmail.com>
> ---
>  .../microchip/sparx5/lan969x/lan969x_fdma.c        | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> index 053d125..4181a9d 100644
> --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> @@ -113,8 +113,12 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
>  	sparx5_ifh_parse(sparx5, page_address(page), &fi);
>  	port = fi.src_port < consts->n_ports ? sparx5->ports[fi.src_port] :
>  					       NULL;
> -	if (WARN_ON(!port))
> -		goto free_page;
> +	if (!port) {
> +		dev_err_ratelimited(sparx5->dev, "Data on inactive port %d\n",
> +				    fi.src_port);
> +		page_pool_recycle_direct(rx->page_pool, page);
> +		return NULL;

As mentioned on v3, with the drop-and-advance in the poll loop the
page_pool_recycle_direct() change is obsolete. The free_page label
already does exactly this.

> +	}
>  
>  	skb = build_skb(page_address(page), fdma->db_size);
>  	if (unlikely(!skb))
> @@ -258,10 +262,8 @@ int lan969x_fdma_napi_poll(struct napi_struct *napi, int weight)
>  			break;
>  
>  		skb = lan969x_fdma_rx_get_frame(sparx5, rx);
> -		if (!skb)
> -			break;
> -
> -		napi_gro_receive(&rx->napi, skb);
> +		if (skb)
> +			napi_gro_receive(&rx->napi, skb);
>  
>  		fdma_db_advance(fdma);
>  		counter++;
> -- 
> 2.39.5 (Apple Git-154)
> 

/Daniel
