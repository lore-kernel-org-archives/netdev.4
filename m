Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061303;
	b=NEgYf5Gki2SzTnjdDpWyp/62BGcnvt7VKYA/6qeiehfkTU530O6E+cvTxytB+lNQIShm
	 yjs9tqGWVhKj79gQzUz98UIjSPyFFTdgMMeY7y+Apq7cPgn6R67nixnNrJ5FNrwaTyjuD
	 +Ey/tXA0d0Lw7Lx2NLTtSuu2cHZhvSrF2DBeOlrjleUlfus4E4ydTQLeVq0G1WIiJ2ENy
	 cZQKaWVwEaOQsE3ypGTWkzqUiaDv0Iy+e55Jk2emAe7lYr9At+060VHjPtFq03ME+7Q0j
	 Bn/NP0kEJnWUxhUlVYDzV7HQ6omPFaNrVGa1mVWZqE7w1dwcHRhmBMfXDCMIHvt1z1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061303;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8kgTy7DxiQLMuPP8fQhGc6a4uftmy7+klXDukgBMDq0=;
	b=pPg6zox7DX9FOHLsc1Al4iXO3pKCHZN7K3knJkaguv0HsavzdezbeAlJhTbgkMcn1Pqd
	 rsbBedWhLPCSfFzqkzJ1DqyUaXynj1V8JfpHQILNqqbXFgx9GJTimfXYdasZNSw0t7CMy
	 2IJvPHMtwPFnA4eEXzUUUA9BHzsJyCGtYLds02Pd7+WIuxjSbyiKzDy5vE8dyyLaJ5xNa
	 FgF7+2asfEM/hJeLZuQiFzB/S5eOiIe/d0DV05C94ZDtY4ZNBlDOZvjpd5W1BoGN1XI7N
	 YZ0iLe3tdqBF/CFBZcdRuqDpUA4XKQV/Kkor6QvrG9UtC3CdPK2wvg6Bxxmu5UM5Ckw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jdK6uf3C;
	arc=none smtp.remote-ip=95.215.58.212
Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32068606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32068606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jdK6uf3C
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=whbgR+u9zDBcuS9v/MZNb96l3DLr6gjznO7ku7+wUbM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795061299; v=1; x=1795666099;
 b=jdK6uf3C4dP+zg4K4tuKRbWOGbAjHgF6lrYcyLazAoJ2GNnp3bMR1up6YaD4UUtVvoggIDkg
 2r2OyIKKpMy6cRIvbtdUJGjCUNTYfGk62JKXpf1ORovF/1FQyd3lRQNL8ZLGsuKde6yGvc/Xauh
 g1ScHwaJS53OHIxCRgiMBJzU=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 13b25e838765a44f;
	Thu, 19 Nov 2026 04:08:18 +0000
X-Mizu-Trace-ID: 13b25e838765a44f
X-Migadu-Flow: FLOW_OUT
Message-ID: <9013e41a-302d-4748-b9c7-058307140c3d@linux.dev>
Date: Thu, 19 Nov 2026 12:08:10 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] tls: wait for a single RCU grace period in
 tls_device_down()
To: Eric Dumazet <edumazet@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
References: <20261118224758.1617869-1-edumazet@kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261118224758.1617869-1-edumazet@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/19/26 6:47 AM, Eric Dumazet wrote:
> tls_device_down() calls synchronize_net() for each offloaded context
> bound to the device going down. As this runs from the NETDEV_DOWN
> notifier, a device with N offloaded sockets waits for N RCU grace
> periods while RTNL is held.
>
> Split the loop:
>
> - First stop the offload for all contexts: switch to the software
>   fallback, clear ctx->netdev and set TLS_RX_DEV_DEGRADED.
>
> - Then call synchronize_net() once, if there is at least one context.
>
> - Finally release the driver state and drop the reference of each
>   context, as before.
>
> The contexts are on a private list with a reference held, and the
> first step only writes to fields of each context. The only change in
> behavior is that all contexts stop being offloaded before the driver
> state of the first one is released.
>
> Compile tested only, with CONFIG_TLS_DEVICE=y.



I tested this with the netdevsim TLS offload emulation [1] (changed a little locally): N sockets with
TX and RX offloaded on one port, then "ip link set down" on it.

sockets    before    after
    100   12.7 ms   8.6 ms
   1000   39.1 ms   11.5 ms
   5000  160.8 ms   19.2 ms
  20000  577.2 ms   44.1 ms


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

[1] https://lore.kernel.org/netdev/20261117140642.4008-1-jiayuan.chen@linux.dev/


>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
> ---
>  net/tls/tls_device.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
> index 4cdfbb57ecff0a0ad5589fca4ab6599ab695c913..9c2f57312d14062f453d8b8e316404a3d1b20e0f 100644
> --- a/net/tls/tls_device.c
> +++ b/net/tls/tls_device.c
> @@ -1349,7 +1349,7 @@ static int tls_device_down(struct net_device *netdev)
>  	}
>  	spin_unlock_irqrestore(&tls_device_lock, flags);
>  
> -	list_for_each_entry_safe(ctx, tmp, &list, list)	{
> +	list_for_each_entry(ctx, &list, list) {
>  		/* Stop offloaded TX and switch to the fallback.
>  		 * tls_is_skb_tx_device_offloaded will return false.
>  		 */
> @@ -1362,13 +1362,16 @@ static int tls_device_down(struct net_device *netdev)
>  
>  		/* Start skipping the RX resync logic completely. */
>  		set_bit(TLS_RX_DEV_DEGRADED, &ctx->flags);
> +	}
>  
> -		/* Sync with inflight packets. After this point:
> -		 * TX: no non-encrypted packets will be passed to the driver.
> -		 * RX: resync requests from the driver will be ignored.
> -		 */
> +	/* Sync with inflight packets, once for all contexts. After this point:
> +	 * TX: no non-encrypted packets will be passed to the driver.
> +	 * RX: resync requests from the driver will be ignored.
> +	 */
> +	if (!list_empty(&list))
>  		synchronize_net();
>  
> +	list_for_each_entry_safe(ctx, tmp, &list, list)	{
>  		/* Release the offload context on the driver side. */
>  		if (ctx->tx_conf == TLS_HW)
>  			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
