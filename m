Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345624;
	b=boIA3aJ5kLiyJnRDO+YqXeVLw2DhJdQqodC9jjhXWHmj/+bySzcFukdYZ2gHUqzCBw58
	 GN1PgDL4CW9lbAuU6ivVVP9ExMikT1iQej5xrX1BU92dsqNAupCEmjChfbJ3zdN3dy2iM
	 PAwVIXr0qu/MlhC0kwZN2wou5FxBVXH+LNIF5vAtv0egIUfY/6wtDbxed9FbWD8FfRBWr
	 KPcU/gQX8P6spmuhQXEgQ/eJLo8xfFhw3r5ga2QW4AxqeXtsMdklnsf3BIxP19Ww5/k6f
	 w3p8kT4FqEN7ppBcD0Sq5Zmesy05FLA1FClISy7ZP44dD/Nj3PKGCbO/1E3HUJEoysg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345624;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bd1L8F8/koxTYcaOh49inrpszN9fldx8EIO0WyauHFM=;
	b=JNOsi3MYZoK0cOp8y6fDgERf9yYu7d5tVXfGMRqE8GopykcMztzzj5IjGs1kKu4hlRvj
	 iTMAMLgrtUSU4HLT9IubtEtMdsj2vhRPVbQ3e1hR41CCLjzmbU7cC6ZGEXMWHldTKuzrT
	 5o70V26lHgRev+WzNt8OJ1vwxrQ3yfJ4GNC+82++ihb+dffKhcF7G0jJXMxd/3RhD2ldV
	 VsUAd59fGt5YYmBf/uPZYkP4SdBjVoRS5Gz1ZjwlU0JKft4d0OfYIlXKxHVpQy1O25EFw
	 hSqp5Wl4vgTsLZCjTHmBlMBgh9wJ80zmBasfExrKiLYrdJcRU8Zb1GtWHMdSZSP9cxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gs88IWcU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB8606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gs88IWcU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A611F000C4;
	Sun, 22 Nov 2026 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345623;
	bh=bd1L8F8/koxTYcaOh49inrpszN9fldx8EIO0WyauHFM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gs88IWcUxgAtBmDHyMHFicietLYdNHw1JkhPSwjgmKwZ0e3LOwJIw+oKzyDTTaYt7
	 E4ksanB2Zmu183lOP/dJu8g8wgIrYYcoRUBz40fYK6CHALShlUOlCHyX5hmdm5ShmV
	 QPK1n/LjgOWnOgx2+jKSokmrGJoNIMrrzHisioXzRKglrAts1GyGcluwMxytc/74z5
	 HbnNsta1ykpU8Yi/u2By6ZFgHOy7mtqyhwk9lKKSfwhslW/VOU9wuvf8UgDNEqzZlD
	 7RKsdb93CQ/r1nnl+H8iZicBG7l7Cii7pwFZ3DrKEx8pkvLYWHTW0CDC4PA2BpyQbf
	 8k5D3CDeaD22A==
Subject: Re: [PATCH net v3 1/3] tg3: Don't fail probe if 31-bit coherent DMA
 mask is unsupported
From: netdev-bot+sashiko@kernel.org
To: pavan.chebbi@broadcom.com
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com
Date: Sun, 22 Nov 2026 11:07:02 +0000
Message-ID: <179534562215.3135.11736501194773169729@kernel.org>
In-Reply-To: <20261118105408.1076095-2-pavan.chebbi@broadcom.com>
References: <20261118105408.1076095-2-pavan.chebbi@broadcom.com>
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

- [Low] On BCM57766, tg3_alloc_consistent()
  (drivers/net/ethernet/broadcom/tg3.c, around line 8870) can find that…

--

tg3: Don't fail probe if 31-bit coherent DMA mask is unsupported

This patch makes the 31-bit coherent DMA mask for BCM57766 best effort.
If the platform refuses that mask, the driver falls back to the coherent
mask used before 614f4d166eee, so probe no longer fails. It also adds a
warning when a status block is allocated at a DMA address that matches
the erratum pattern described in 614f4d166eee.

Link: https://lore.kernel.org/netdev/CALjTZvYKHWrD5m+RXimjxODvpFPw7Cq_EOEuzRi1PZT9_JxF+g@mail.gmail.com/

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 95827df4cf6a1..2cf9d2ea069b5 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -8867,6 +8867,13 @@ static int tg3_alloc_consistent(struct tg3 *tp)
>  		if (!tnapi->hw_status)
>  			goto err_out;
>  
> +		if (tg3_asic_rev(tp) == ASIC_REV_57766 &&
> +		    (lower_32_bits(tnapi->status_mapping) & 0xffff0000) ==
> +		    0xffff0000)
> +			dev_warn(&tp->pdev->dev,
> +				 "Status block at DMA address %pad may cause TX timeouts on this device\n",
> +				 &tnapi->status_mapping);
> +

[Severity: Low]
When the status block lands at an address that matches the erratum
pattern, the driver keeps the buffer. tg3_rings_reset() later writes
that address into the chip:

	tw32(HOSTCC_STATUS_BLK_HOST_ADDR + TG3_64BIT_REG_HIGH,
	     ((u64) tnapi->status_mapping >> 32));
	tw32(HOSTCC_STATUS_BLK_HOST_ADDR + TG3_64BIT_REG_LOW,
	     ((u64) tnapi->status_mapping & 0xffffffff));

tg3_alloc_consistent() is only called from tg3_start(). A recovery reset
therefore writes the same address again. That covers both the
tg3_process_error() "DMA Status error.  Resetting chip." path and a TX
timeout reset. Only closing and reopening the interface gets a new
allocation.

Could the driver hold on to the matching buffer and allocate a
replacement instead? That would keep the workaround in effect on
platforms that refuse the 31-bit mask.

The warning also gives TX timeouts as the symptom. 614f4d166eee says the
hardware sets the overflow bit in the DMA status register, and
tg3_process_error() would report that as a DMA status error.

Are TX timeouts the expected symptom here, or should the message also
mention the DMA status error?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118105408.1076095-1-pavan.chebbi%40broadcom.com
