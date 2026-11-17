Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879297;
	b=inKlfbY/8yYiuUfha4oKaCywAZRm6dVojp/dL3eX01kJu1qCND9PAs1zsf5u4oI5l6Ip
	 L7rptpyokW3NKjZsOob5PG3t+1256McCn69ecLh1Oqg5RcAv8N+OHPZd8lDU505MMkyb0
	 bYJ3FD8RnQRKivHP8S8uo5ZRavyAKl3HvKXmI8gN/K750uP/aC0R/xLj/uow+9oVOlijZ
	 QCQNTvXH+eGCH8Wm0KvJwcP83lFCYVXal+x11XK8B5y7WwEjsYPA2+q5rKHyKgJtIJIdr
	 YN6abaYc5H5K7omZMYzDW2SIIXYRo9v/gVS/DDEjGPy3wMp60naRaJegFm2iMxGar6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879297;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ysjEDt5HoKgDoYFx5rznlp/gWKwa0VyiQqK5FFOHBY8=;
	b=g62/l9NBbHzk3SY3ZuZYowk5C3Cy1WmazbqmkEsfrMtlZxGAP2FT03tNbkKl7SsSDlvv
	 +/6Y5TahGeeUN7PkZEttYbMqOPnDzdEXk7ap9lRWJFBa8jfXukmDbqAXyHBayAbQHI/MA
	 6nmvbN4AXhd9RF6LzM6fx9tQO19MCre9OtbnYX1ZjXbZE//nCAG22xzb7YyDSG1dsOy34
	 UgRPr8tnLJg2oG0hUnAtBSwRBtq5XZlHdj8uN3Digd7rwD/7MxBJ2P0u3UVScNa8EDlTb
	 JE/FIarpVIoDONhrR2S3XdKnyEWdH3LhLR3hMYbiDJN/8bv/zyXMqUgwv+HmmKdpXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMkUCbEK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD8606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMkUCbEK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088BC1F000C4;
	Tue, 17 Nov 2026 01:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879296;
	bh=ysjEDt5HoKgDoYFx5rznlp/gWKwa0VyiQqK5FFOHBY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AMkUCbEKbOS9C0CDs/i9YlEmKU7EQE547L++MYdxH8RUAV6M+fANTIHWzaJW7AFB3
	 QmJKoYZtR2AImcl5mfJW3ZCDkdz6eM3DKLDrp242r7r2QCX9DlXLtXMYX3GR31j0h0
	 G4g4sy2vF5CSh50DXDASpXv1yo5S1F17qnLmbWQSMyFbU8P2DJO3F/XVK00bzpmK+w
	 MSJHgR5mvlCjKnCPqMXbyC5mWUicYe7kxyYPKwllGC/mH+y9NtL8f02v52zMlRwPiD
	 1vhFqejEvTVyj1ZunKOj1NbKUpwSMm2ZU7X51vCI+6ThIhjdjVvZUXusubsXtFAtae
	 PdVQ53gu2jAAw==
Date: Mon, 16 Nov 2026 17:34:55 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, haren@linux.ibm.com,
 ricklind@linux.ibm.com, davemarq@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Subject: Re: [PATCH net-next v8 07/15] ibmveth: Add RX queue register
 helpers for MQ
Message-ID: <20261116173455.325fbf0b@kernel.org>
In-Reply-To: <20261109235556.60604-8-mmc@linux.ibm.com>
References: <20261109235556.60604-1-mmc@linux.ibm.com>
	<20261109235556.60604-8-mmc@linux.ibm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 15:55:48 -0800 Mingming Cao wrote:
> +	rc = ibmveth_alloc_buffer_pools(adapter);
> +	if (rc) {
> +		unsigned long ua = adapter->vdev->unit_address;
> +		unsigned long lpar_rc;
>  
> -	if (lpar_rc != H_SUCCESS) {
> -		netdev_err(netdev, "h_register_logical_lan failed with %ld\n",
> -			   lpar_rc);
> -		netdev_err(netdev, "buffer TCE:0x%llx filter TCE:0x%llx rxq "
> -			   "desc:0x%llx MAC:0x%llx\n",
> -				     adapter->buffer_list_dma[0],
> -				     adapter->filter_list_dma,
> -				     rxq_desc.desc,
> -				     mac_address);
> -		rc = -ENONET;
> +		/* A kexec can leave the LAN registered by the old kernel
> +		 * (see ibmveth_register_logical_lan()); do not leave its
> +		 * buffers live in PHYP. H_PARAMETER if none is registered.
> +		 */
> +		do {
> +			lpar_rc = h_free_logical_lan(ua);
> +		} while (H_IS_LONG_BUSY(lpar_rc) || (lpar_rc == H_BUSY));

This loop is repeated in a number of places, you should probably factor
it out.

>  		goto out_free_queue_mem;
