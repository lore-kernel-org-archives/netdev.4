Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444542;
	b=SsPjfoslYSDbPrwhrc8WL/QcLWGtuCWbU/qVWtg67ytLxXr9QHC8Ns+EXVPLMK/+cOv4
	 8jt6itrkbk3Qr+Qtuz2dBjxC8UqfyZU5+DBmh8a63s6IECD3jEQY0O1rqcYI4W4MtuoUM
	 w7c9cn/Axh4rJvIjbhZvPZLzGu/dBNKdK1Xc+/wZPl7xFUpT3qvohKwAQ/hy1iV//gzbU
	 QD5Vz9xLfjn81HiCj/shbHtVdco6lFXJ26mU2G6ueNbH3O0VbEFyEViIm0sm0bGOi7kbn
	 UcmR7KkBOBHUnnclQacMBSQzzMnc9kz0Ry7Qvk38rrRYgd8ewGZWWbmAMTkNL8V/47A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444542;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mBim/Hkn0bG2Xgqqehb5DNOIciJ6suXgpAyGSHCaxzk=;
	b=r9WhplUaVla27GdDlgkH7jp6lVOlHURMEckAa1oC53+/JLoPIpeqQt2Pu9y37yG+dfoL
	 anMGXyffu9RXu5/ZnejwbyU3EbP9SKtpcSYHac97NIShdldCniwifb2BO+SsoVeSHIGAe
	 1w5O4Zo32XxxcrU01A7NvWP9W04PII3E47fxL7lfik47kZmb53PrFPQGDDGX5sD0xsAvv
	 yPAvsxV9fCq110DeXSI84rnuj4s8v5DfuhoDdhlxIO/m7BF4Vy4+hA28+YFKIEXk2OiUb
	 ZJBouXbn8X6iuLrJvKlrAAUWzvVeVVvEzszcCAozT7G/LqoovkMFzvxbUgSnxUTeu9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kz2HxZH9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE6606A31E;
	Mon, 23 Nov 2026 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kz2HxZH9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C44B1F000C4;
	Mon, 23 Nov 2026 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444542;
	bh=mBim/Hkn0bG2Xgqqehb5DNOIciJ6suXgpAyGSHCaxzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kz2HxZH9Wm9+GwaAPXZUssHWGF/nGt5FCqgEiB45Mt5BMwdY3iF/mjLOaoCeck1Al
	 hMkgxiNrFGo++1VjrLOqyNhy95tsGKjxrCsTFXWlqTZox4k+S4g3wIIo++MPysep6M
	 kC3XgX560Nd02tY2a4IphH1QqsAzT/J9uQNFQk8atFO/xcbSUydnC0AZ+htXNzydQj
	 lw9z6RqpHxsmZJg42lvp05Wxnn7yrXYWnsAFK1YHLNP/O/DfISEI7c0oSOsz9iUDtN
	 vE4PfH8AUMVhcTO7vAUjLLvjPzYaSBxcYe+QIj9igXVSSpBQn7ba1kDvqRE7GSQyoM
	 Ef7Yi0KkelMTA==
Date: Mon, 23 Nov 2026 14:35:38 +0000
From: Simon Horman <horms@kernel.org>
To: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Cc: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 5/5] net: qualcomm: rmnet: Resize endpoints with
 dev_set_mtu() and restore on failure
Message-ID: <20261123143538.GD31322@horms.kernel.org>
References: <20261117060737.2764327-1-subash.a.kasiviswanathan@oss.qualcomm.com>
 <20261117060737.2764327-6-subash.a.kasiviswanathan@oss.qualcomm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117060737.2764327-6-subash.a.kasiviswanathan@oss.qualcomm.com>

On Mon, Nov 16, 2026 at 10:07:38PM -0800, Subash Abhinov Kasiviswanathan wrote:
> When the real device MTU or the data format requires a smaller MTU,
> existing endpoints are shrunk by writing dev->mtu directly. No MTU
> notifiers run and userspace gets no link notification.
> 
> Resize the endpoints with dev_set_mtu() so that the normal notifiers
> and link notifications are delivered. If resizing an endpoint fails,
> restore the endpoints which were already resized, ignoring any errors
> from the restore, so that a failed request does not leave some of them
> shrunk. The data format is not yet published while the endpoints are
> resized, so the restore is validated against the format the endpoints
> were sized for. The error from the failing dev_set_mtu() call is
> returned to the caller.
> 
> Fixes: b7f5eb6ba21b ("net: qualcomm: rmnet: Update rmnet device MTU based on real device")
> Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
> Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
> Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
> ---
>  .../ethernet/qualcomm/rmnet/rmnet_config.h    |  1 +
>  .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 30 +++++++++++++++----
>  2 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> index 5adda0323dda..47b8db3206b9 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.h
> @@ -19,6 +19,7 @@ struct rmnet_endpoint {
>  	struct net_device *egress_dev;
>  	struct hlist_node hlnode;
>  	struct rcu_head rcu;
> +	int saved_mtu;
>  };
>  
>  struct rmnet_egress_agg_params {
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> index 8bf87c5ecb43..dce436e4c630 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> @@ -433,24 +433,42 @@ int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
>  int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
>  			     struct net_device *real_dev, u32 data_format)
>  {
> +	struct rmnet_endpoint *fail_ep = NULL;
>  	struct hlist_node *tmp_ep;
>  	struct rmnet_endpoint *ep;
>  	unsigned long bkt_ep;
>  	int new_mtu;
> -	int err;
> +	int err = 0;
>  
>  	new_mtu = rmnet_vnd_target_mtu(real_dev, data_format);
>  	if (new_mtu < 0)
>  		return new_mtu;
>  
>  	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
> -		if (ep->egress_dev->mtu <= new_mtu)
> +		ep->saved_mtu = ep->egress_dev->mtu;
> +		if (ep->saved_mtu <= new_mtu)
>  			continue;
>  
> -		err = rmnet_vnd_change_mtu(ep->egress_dev, new_mtu);
> -		if (err)
> -			return err;
> +		err = dev_set_mtu(ep->egress_dev, new_mtu);
> +		if (err) {
> +			fail_ep = ep;
> +			break;
> +		}
>  	}
>  
> -	return 0;
> +	if (!err)
> +		return 0;
> +
> +	/* Restore the endpoints which were already resized. Failures here
> +	 * are ignored since the original error is the one to report.
> +	 */
> +	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
> +		if (ep == fail_ep)
> +			break;
> +
> +		if (ep->egress_dev->mtu != ep->saved_mtu)
> +			dev_set_mtu(ep->egress_dev, ep->saved_mtu);
> +	}
> +
> +	return err;
>  }

The preferred idiom in Networking code is to:
1. Keep the happy path in the main unconditional path of execution.
2. Use goto for unwind on error

I think that can be achieved here with this incremental change
(compile tested only!).

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
index dce436e4c630..6b147ef5211e 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
@@ -433,12 +433,12 @@ int rmnet_vnd_validate_real_dev_mtu(struct net_device *real_dev)
 int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
 			     struct net_device *real_dev, u32 data_format)
 {
-	struct rmnet_endpoint *fail_ep = NULL;
+	struct rmnet_endpoint *fail_ep;
 	struct hlist_node *tmp_ep;
 	struct rmnet_endpoint *ep;
 	unsigned long bkt_ep;
 	int new_mtu;
-	int err = 0;
+	int err;
 
 	new_mtu = rmnet_vnd_target_mtu(real_dev, data_format);
 	if (new_mtu < 0)
@@ -452,13 +452,13 @@ int rmnet_vnd_update_dev_mtu(struct rmnet_port *port,
 		err = dev_set_mtu(ep->egress_dev, new_mtu);
 		if (err) {
 			fail_ep = ep;
-			break;
+			goto restore_mtu;
 		}
 	}
 
-	if (!err)
-		return 0;
+	return 0;
 
+restore_mtu:
 	/* Restore the endpoints which were already resized. Failures here
 	 * are ignored since the original error is the one to report.
 	 */

-- 
pw-bot: changes-requested
