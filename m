Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820438;
	b=L+22IdHhVhjF6t9qIzggeh21d/XERY4vatppYN7bNXZNqYA2mr81xRXMM/RtlDmMxfOx
	 GWG73/Euu/4EgZOt+BhoYtLTSVLV9DIbiqB3buIJ+aOgzar4kgX4bAXYEn7Uu2uC2Iqa5
	 NuzmosBZ7yAQwaU08EEWAwnLMy+s9N7UXgSVozoNvQ7gq5aOsSKc6lOymYYdhdrqkt9yk
	 pUkTjUdVoVgoLDlwZLpDBxSWR07iB5uY21fVl+fQfhQr5go62dk7uYxYVQXKQqo0Co8+H
	 AA4umIwOxnXjLbJvHjKlCMKLDNnGB1p2/03fhWehBSs0AdIMmFLg7Rwt0AhCDWEwWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820438;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bN+/fbeyAI/qt+INssVNLO4jKFAsX3goJyuH1yeRfN8=;
	b=cXsWOiOoYW+YIMkRwXIhiX/CTTRZwnV+Ij8hlY4rf49bbuFI9+F8J4bbfIe7Azbm6Z0R
	 5VuV6kEy4vgSI6dYdWiA37QiB++2Btrr/PqM9A0D6iQ5F30337UFlAHYvhFjSitZvt0M5
	 XuufpXZqASiIPk9/Ufl2/R1aB2nGphdUyq+EqijSXoCUR4eAwrPHAQE7Gf8+N0lqT5UEm
	 sdrDEJkaykA3IUNfDi0VFoCvN3zUkVRpEgZYpbHgX+G760WF9S1NZB0wWTJ3kVO/3MHSD
	 O7+kV05lStdJ7n2UQnIvbLV1FUeCeeeKE2TGAixu1GRA3VmO5qZnszwM19FXo2cZRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=kRjNzce3;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E6A606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=kRjNzce3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794820437; x=1826356437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KwtkRdp4LteB5fvbW7fRZCalHUkYvNm68Ej8RQTGpOg=;
  b=kRjNzce3Z+wGFy4HUVrm61ifhgKqsI8/r2Fl/ESpA31CS40ZbGk2bjIS
   AZKmXTbfyjqB+yGy3IG86Mscub0De/Z6SpgZryNlsCtfuDucXNJI0xDeq
   djTmwRbSB6GKWzwHUDJzeMnwp1EPmFaBbFF47oQyAqYfc7Bz2hjYaY65a
   houK81xXEMqWf6qbdDCnYppro00whDZadZcBYlWTtTVbnEqwF0zHE5n8x
   DscLoCu3EJH9ts2+I8mKdy96+Y+spxJKP/Ssdyh5XvWeWpRETUMlvznFp
   8sD3k3jfYV/4TGeR6sEF58MtzM/HJ+b+5WwHlhiyb0xY7qwp5w2rn8QIy
   A==;
X-CSE-ConnectionGUID: p0Jnh1D0QGqP/uM712PL0g==
X-CSE-MsgGUID: rWemEOYCRsuuY7I6G2Zz0Q==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233611514"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:13:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 02:13:56 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 16 Nov 2026 02:13:55 -0700
Date: Mon, 16 Nov 2026 10:13:55 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <memoriaru@foxmail.com>
CC: <netdev@vger.kernel.org>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <kuba@kernel.org>
Subject: Re: [PATCH net v5 1/2] net: sparx5: fix RX ring stall on frames from
 inactive ports
Message-ID: <20261116091355.kqsp2azhzm5ptspr@DEN-DL-M70577>
References: <20261113234436.75276-1-memoriaru@foxmail.com>
 <tencent_2FE53706200A3120AE697CA59DF5EFADD907@qq.com>
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
In-Reply-To: <tencent_2FE53706200A3120AE697CA59DF5EFADD907@qq.com>

Hi,

> From: Zhang Hewei <memoriaru@foxmail.com>
> 
> When the FDMA RX path receives a frame whose source port does not map
> to an active netdev, sparx5_fdma_rx_get_frame() logs an error, flushes
> the extraction FIFO and returns false - without advancing the FDMA
> software cursor and without releasing the skb, which has already been
> extended with skb_put().
> 
> The DCB for this frame still carries its hardware DONE bit, so the next
> NAPI poll picks up the same DCB, takes the same inactive-port branch and
> returns false again. The software cursor never moves past this DCB, so
> RX traffic on all ports stalls until the module is reloaded.
> 
> Treat a bogus frame as consumed: free the skb, clear its slot in the
> rx->skb[][] array and return true, so the NAPI loop advances past the
> DB the same way it does for any other received frame. The slot is
> refilled by sparx5_fdma_rx_dataptr_cb() when the DCB is recycled. The
> extraction FIFO flush is dropped since the frame is already consumed
> into the DB, and the error is ratelimited.
> 
> Testing: not tested on real hardware (no sparx5 system available);
> found by code inspection while auditing the RX error path.
> 
> Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")
> Signed-off-by: Zhang Hewei <memoriaru@foxmail.com>
> ---
>  drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> index 15ec9b0..e35ef0e 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> @@ -157,9 +157,11 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
>  		       sparx5->ports[fi.src_port] :
>  		       NULL;
>  	if (!port || !port->ndev) {
> -		dev_err(sparx5->dev, "Data on inactive port %d\n", fi.src_port);
> -		sparx5_xtr_flush(sparx5, XTR_QUEUE);
> -		return false;
> +		dev_err_ratelimited(sparx5->dev, "Data on inactive port %d\n",
> +				    fi.src_port);
> +		dev_kfree_skb_any(skb);

I think kfree_skb is enough here.

> +		rx->skb[fdma->dcb_index][fdma->db_index] = NULL;

This store is not required.

> +		return true;
>  	}
>  	skb->dev = port->ndev;
>  	skb_pull(skb, IFH_LEN * sizeof(u32));
> -- 
> 2.39.5 (Apple Git-154)
> 

/Daniel
