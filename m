Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395973;
	b=V6HoBfK9Oi1r33ggqxE4mDWw5yRdXHw5VN7rnL7UotZJBigFhvRoAfRXcb0A1emq4QGO
	 iQcIAKDvfB3S0rU7uHKSefeMMG497BJWYobvp/tmsnHyHsBwIiw2N2xkYEEJWy34Yl7TV
	 vRXweHf2GA1Ps5jjIpZTxr3kPRtmO5es7423XxiILlIJ6F9auSUzCtlPt0LGuEN4aWcds
	 wL2ZB3TIY/C1pAk6RexHo/cTxtawADGnwQVcdfzxERF2fWhYpfVQLn/PaEwOkpAC5lxmQ
	 gVLIHruueW/HLuGttbmcshzuPq9p8dUyxZVxEvOl2NeUuMJTD541VzrqmBr9MEVMdZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395973;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=c52FecD9pTkops3xpRxdHkp10wpl7jH4KiBhrJdHiV8=;
	b=TJI/Xnsq0GScp9ql3Ojw1Dg8tC3YEOxkFBhZRxAGZsHuCbvrZUZ3ZyVAeSXLTnIaNnL7
	 JDXcIVR0GIwz+GGfURmBxTTX4zIQhChxwtMgL98zT3dzcK/AjiO0aHK+qMdno43rbJ21Z
	 2chmzdvgQF+Sn0+BmFj4jr+y6TuWkYpKShemNFg+qX3U6QT7R3Ix+1f63Ke8Er+Lgp/ek
	 6IEAA4mr3jpxjOmR/dgS7ApVv3zmi/QLzD3kk+VrIFGdW/a+P3o2VJos3H98AevWU3OOy
	 WD950lNTTcnWoGHNWxCh2B3+n+tt2ca38WnAoGyF2C+5BZQTflkJPANcrBQF4pVnXeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeFkUDgo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA6606A31D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeFkUDgo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCBC1F000C0;
	Mon, 23 Nov 2026 01:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395972;
	bh=c52FecD9pTkops3xpRxdHkp10wpl7jH4KiBhrJdHiV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EeFkUDgoy5serfTBSaWlvaWB1q5o1vlkGKCIQYjY/jRtCikthOhCRk807KEGGAVUE
	 ekxpILLtzThkigPYEEaIVgFt5D9qKXY9akVLNYV0ATryUDUe/4LrSwiM55fOH9Vsp/
	 g87pFxGCVR7ek1XSV89hA5+1/UYz0sPR1JWeYjIIJdIqkESRRCSRMgd42WOImGzUVa
	 k+bzmUlVnrHvCDV8W4zZ3knkAI3E43rOiSxFoP5YJM+8KDI9ULGt/iqeYN+YM0t5WJ
	 P/wirFprIvH/ywXCXiKuLCx7niq5gFnV9UB0w89YVdIZvrpGH1Y/kG3VcIf5D67ZUZ
	 jM43kUiY+Cjww==
Subject:
 Re: [PATCH net-next 6/8] ibmveth: Add RX queue register helpers for MQ
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Mon, 23 Nov 2026 01:06:11 +0000
Message-ID: <179539597127.3135.40344499616504179@kernel.org>
In-Reply-To: <20261119000711.18093-7-mmc@linux.ibm.com>
References: <20261119000711.18093-7-mmc@linux.ibm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message presents this patch as moving existing code
  into helpers and changing the order of open().

--

ibmveth: Add RX queue register helpers for MQ

This moves logical LAN registration and teardown out of ibmveth_open() and
ibmveth_close() into the new helpers ibmveth_register_rx_queues() and
ibmveth_free_all_queues(). The H_FREE_LOGICAL_LAN busy loops now share
ibmveth_free_logical_lan(). open() also allocates the buffer pools before
registering the LAN.

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index 8f32f75f2d7fd..ab8c5f6a265b4 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c

[ ... ]

> +static long ibmveth_register_logical_lan(struct ibmveth_adapter *adapter,
> +					 union ibmveth_buf_desc rxq_desc,
> +					 u64 mac_address)
> +{
> +	long rc;
> +	int try_again = 1;
> +	unsigned long ua = adapter->vdev->unit_address;
> +	unsigned long buf_dma = adapter->buffer_list_dma[0];
> +	unsigned long filter_dma = adapter->filter_list_dma;

[ ... ]

> +static void ibmveth_free_all_queues(struct ibmveth_adapter *adapter)
> +{
> +	long lpar_rc;
> +
> +	lpar_rc = ibmveth_free_logical_lan(adapter);
> +	if (lpar_rc != H_SUCCESS)
> +		netdev_err(adapter->netdev,
> +			   "h_free_logical_lan failed: %ld\n", lpar_rc);
> +}

[ ... ]

> +	rc = ibmveth_disable_irq(adapter, 0);
> +	if (rc)
> +		netdev_dbg(netdev,
> +			   "Failed to disable IRQ for queue 0 before registration, rc=%d\n",
> +			   rc);

[Severity: Low]
This isn't a bug, but the commit message describes the patch as moving code
into helpers and reordering open(). The patch also changes some logging that
the message doesn't mention.

In ibmveth_close(), the old message was:

    "h_free_logical_lan failed with %lx, continuing\n"

ibmveth_free_all_queues() now prints it in decimal with new wording:

    "h_free_logical_lan failed: %ld\n"

Anything that greps logs for the old string will no longer match.

The open() error path after a successful registration (a failure in
ibmveth_setup_rx_interrupts() or ibmveth_alloc_tx_resources()) used to free
the LAN without logging anything. It now goes through
ibmveth_free_all_queues(), so it calls netdev_err() if H_FREE_LOGICAL_LAN
fails.

The new netdev_dbg() above also seems to repeat a message that
ibmveth_toggle_irq() already prints before it returns -EIO:

    dev_err_ratelimited(&adapter->netdev->dev,
                        "Failed to %s IRQ for queue %d, rc=0x%lx\n",
                        action, queue_index, h_rc);

The old code ignored the return value of ibmveth_disable_irq(). Is the extra
debug message needed?

Two other changes are unrelated to the move: ibmveth_register_logical_lan()
now returns long instead of int, and the adapter fields are copied into
local variables.

Could these changes either go in a separate patch or be mentioned in the
commit message?

> +
> +	lpar_rc = ibmveth_register_logical_lan(adapter, rxq_desc, mac_address);

[ ... ]

> @@ -1232,14 +1295,7 @@ static int ibmveth_close(struct net_device *netdev)
>  
>  	ibmveth_cleanup_rx_interrupts(adapter);
>  
> -	do {
> -		lpar_rc = h_free_logical_lan(adapter->vdev->unit_address);
> -	} while (H_IS_LONG_BUSY(lpar_rc) || (lpar_rc == H_BUSY));
> -	if (lpar_rc != H_SUCCESS) {
> -		netdev_err(adapter->netdev,
> -			   "h_free_logical_lan failed with %lx, continuing\n",
> -			   lpar_rc);
> -	}
> +	ibmveth_free_all_queues(adapter);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119000711.18093-1-mmc%40linux.ibm.com
