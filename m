Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444903;
	b=ja5VZvQtkkk8k35poedb02MO/GpEszPGj944k/eLzUfUSv23yraO7qqOmHgMal+Rak6o
	 HTuHlpYI+WCcMMVYTsRyt0uXEmavQk4FO0T9wSkhHPvoOrLLIfcvsfTBLXcSIwNa90mgv
	 Ny+LfkvV4dQsFYeyjVEUfrLDKuvzfga5BcrLKq0jismktJjxvVBMVl0H3bPRvG5j0MrNv
	 9tXicLocNYRej7DrV6lrZ0+3VGsPE5BcBaQ/0kBwJQE9+BA/9oPcQYIG3MPLb9rBJxsxk
	 hYZEh8ScAH1Ev5W4DzylqeLzHgGxWlT+2UkNncUArq78cwsEKu7LFIdngBRiqmCzllQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444903;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iSBki08s6Y37g2ektwoZx+CNumkLlun7bvIhU3NlRbU=;
	b=SmmgOJ+6pB9EKUOCvVxxLjRwpebZPSLbgyw7vmVxIuxQrBNj3s8jXRuG+J9LIdl4NbHX
	 GgihRQVicYW9haqLpeE4dRUTOuW8wrhTZbvAhimo/Xbu7gaYSY+te9ElBuCq3r/wdeS3z
	 A7Qq4IF6cKtnNwXO0Lge32e9BkxsB/T3thD8hCXpef1FQHVa3V1KWOgzwT/B0hSxOhlf+
	 EnMItONfC3UJ+olAKUaEjRcYpvDqLrmHyBPgoxTN0KecTWndJVbrAxgOmSGQmiqvGdSwv
	 zO1JtCn364RlhJIEJhwm83HbSP3M3PMWjqgAPF495PEAO1nf2MkpKPxsYzRzHTQpiMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHuGOoU2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E3606A31A;
	Mon, 23 Nov 2026 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHuGOoU2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7809E1F000C4;
	Mon, 23 Nov 2026 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444903;
	bh=iSBki08s6Y37g2ektwoZx+CNumkLlun7bvIhU3NlRbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHuGOoU2Kf4sRbb4VJLaKTj0cVtrWzSgcO4CmmdLPtaz0HOTZkmEy2Z5xHxtCbl4p
	 yN27U5Ajrq/4uyqMmqEuP2wK6QzgGkKpQFWwDctHcpvz3UnVX5IDcaFEjFZ/3XWwp8
	 xsT5CJGd4sWHcvmdoxRcVyPFEBT3CoGktwCjZYRDsQetjnYGE6eqPbskRMR3EYWolS
	 8kCLMW3wmtkuf8XPvltYBPF+pCu5wp0klYnKDGCL9+7/OHtxxiJaBIaQ1x/19DKeYp
	 N0nBqONBCJL0sMAoG/c3u+IcjwK/dvZYIfsimg/n5uMomnTIG/uK96QaGkCI9PBh0J
	 twoVwLbxQf0ng==
Date: Mon, 23 Nov 2026 14:41:39 +0000
From: Simon Horman <horms@kernel.org>
To: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
Cc: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 3/5] net: qualcomm: rmnet: Fix MTU underflow and
 clamp to the maximum packet size
Message-ID: <20261123144139.GE31322@horms.kernel.org>
References: <20261117060737.2764327-1-subash.a.kasiviswanathan@oss.qualcomm.com>
 <20261117060737.2764327-4-subash.a.kasiviswanathan@oss.qualcomm.com>
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
In-Reply-To: <20261117060737.2764327-4-subash.a.kasiviswanathan@oss.qualcomm.com>

On Mon, Nov 16, 2026 at 10:07:36PM -0800, Subash Abhinov Kasiviswanathan wrote:
> The MTU helpers subtract the egress headroom from the real device MTU
> using unsigned arithmetic. A real device MTU smaller than the headroom
> underflows and results in a huge target MTU instead of an error.
> 
> Additionally, a real device with a jumbo MTU makes the creation of the
> first rmnet device fail since the unclamped value exceeds
> RMNET_MAX_PACKET_SIZE, while resizing an existing device clamps it.
> 
> Add a helper which computes the largest MTU usable on top of the real
> device for a data format, rejects real device MTUs below the headroom
> before doing any arithmetic and clamps the result to
> RMNET_MAX_PACKET_SIZE. Use it for both new and existing devices and add
> the same underflow check to the other helpers.
> 
> Fixes: b7f5eb6ba21b ("net: qualcomm: rmnet: Update rmnet device MTU based on real device")
> Co-developed-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
> Signed-off-by: Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
> Signed-off-by: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
> ---
>  .../net/ethernet/qualcomm/rmnet/rmnet_vnd.c   | 58 +++++++++++++------
>  1 file changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> index 984c66bee863..2f3fefe58bce 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> @@ -80,6 +80,20 @@ static int rmnet_vnd_headroom(u32 data_format)
>  	return headroom;
>  }
>  
> +/* Largest MTU an rmnet device can use on top of real_dev for the given data
> + * format, or -EINVAL if real_dev cannot even fit the headers.
> + */
> +static int rmnet_vnd_target_mtu(struct net_device *real_dev, u32 data_format)
> +{
> +	u32 headroom;
> +
> +	headroom = rmnet_vnd_headroom(data_format);
> +	if (real_dev->mtu < headroom)
> +		return -EINVAL;
> +
> +	return min_t(int, real_dev->mtu - headroom, RMNET_MAX_PACKET_SIZE);
> +}

real_dev->mtu - headroom is guaranteed to be non-negative.
And RMNET_MAX_PACKET_SIZE is also non-negative.

I believe min() is sufficient here. And if so, it is preferred.

...
