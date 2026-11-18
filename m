Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993134;
	b=l+MQJCnPxV6WVF19c/PHYi8AcA1UY1mSveYTTxPqqoK9Yx6VaDa3sT+lb1BKe12UukTU
	 ofzvI+LTZv9HGSI8mzpnUMbl0A/J9j4C9AYo9qQLJKvzLWemrKr9RxIxYW5ovFv/qWoRF
	 k4tAZo2utKjpgs3l47gIBiV6GWz4gb6DrmNfJDXum5YHrxcdI3eEIPsGYj7QLTIFZRDgw
	 Al4SGWo4Yzu0lnP9BwZKNiZ30LN+VVFtHevTOVYNN7CeADF01bLefO6lXr89qu9/JI2a3
	 yDeaV9d95i3kYb3ghke57/iETxcCT9yLRmRo13cX2PmwJT3FqMke7OzUyGxUNFA+Clg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993134;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=j4VEP/66boLRVWLZORrD0dkbCraUxgEcYkZxlyDhLLA=;
	b=5qxGmFr8xewqGZ2JwSajrdbdWMqJ4stwXKZSWeroD/nib8JHTBUtUytkQwNihekzJQZe
	 2iV779r65lOj8BxE6JMrxsaZTS6QmBgw7LNPUvUPninMdHEeWWg67zx7lx3OuuuzUG1dg
	 Oq+vdTRpGs+i1GZXKtUVOHHyOyKrmtNbx5k/wcwcEN0TZ0c311BZ4d2BhoQ6J2OfICtJW
	 TQbtnFDhk1N+na8ZoneinNXwe2zDPqfCjq3QqKk9LimmudgAsXMGmFJwpif35j6fFPAm5
	 2y1oQe/VgIJPL8wC+2vpfYmYrBvfitnAPQmF2WExFoCllcTz3f6X5R5fs+PjGEV1yVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP+qJlwZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED45A606A8A8;
	Wed, 18 Nov 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP+qJlwZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126C71F000C5;
	Wed, 18 Nov 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993133;
	bh=j4VEP/66boLRVWLZORrD0dkbCraUxgEcYkZxlyDhLLA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fP+qJlwZnVEhyynEgSeitpCeMW7M6F45Eovjgo30VhhhRs9AA6t9w5QEBxZnYb/f+
	 0unogwzVha6dzU/YARlKowC/Ju/uno8z0TkMhun82clA6jSzY5vcuN75/1FIljT4WC
	 1SPn0eWj9F7RMkxAEA1+rrkLvgRx2XhEnefIr6YdIJhPcCA++BpNmnicDuMYCvG40L
	 48L7T9eBnC9Nf0EyyPuQeE5b3yC0VkYclaYmn/0xkV4R0Dv742h1i8Zesg9aWvTdCp
	 q1Rjb1vzmu8UTz30JBxHnmkJnBcVbMzioxVIcqkc1kBGcrnNyP26+s3zM5QlmS/80M
	 yn7lOcW92e9KA==
Subject:
 Re: [PATCH net-next 3/4] eth: mpnic: sync unicast and multicast address lists
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, dimitri.daskalakis1@gmail.com, mohsin.bashr@gmail.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 09:12:12 +0000
Message-ID: <179499313262.3136.12811016164943625265@kernel.org>
In-Reply-To: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The unicast and multicast lists are synced in the wrong order
  in __mpnic_set_rx_mode()…

--

eth: mpnic: sync unicast and multicast address lists

This commit adds the secondary unicast and multicast addresses to the
MACDA TCAM and advertises IFF_UNICAST_FLT. When either list outgrows the
table, the driver falls back to promiscuous or all-multicast mode. A
per-slot users count is kept so the same address can sit in both dev->uc
and dev->mc.

> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
> index 43547a7d6e5c7..c01e276c4a74d 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c

[ ... ]

> @@ -35,7 +53,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
>  		mac_addr->state = MPNIC_TCAM_S_ADD;
>  	}
>  
> -	if (!netdev_hw_addr_list_empty(mc))
> +	err = __hw_addr_sync_dev(uc, netdev, mpnic_addr_sync,
> +				 mpnic_addr_unsync);
> +	if (err == -ENOSPC)
> +		uc_promisc = true;
> +
> +	err = __hw_addr_sync_dev(mc, netdev, mpnic_addr_sync,
> +				 mpnic_addr_unsync);
> +	if (err == -ENOSPC)
>  		mc_promisc = true;

[Severity: Medium]
Can the device get stuck in unicast promiscuous mode here, even though a
TCAM slot is free?

The uc and mc lists share the same MACDA slots (between
MPNIC_TCAM_MACDA_BROADCAST_IDX and MPNIC_TCAM_MACDA_HOST_ADDR_IDX). The
whole uc pass, both its flush and its add phase, runs before the mc pass
flushes stale multicast entries.

Consider this sequence:

1. The table is full of multicast entries and a secondary unicast
   address U is added. mpnic_macda_sync() returns -ENOSPC, U stays at
   sync_cnt == 0, and mpnic_promisc_sync() enables unicast promisc.

2. A multicast address M is then removed. The core runs
   netif_rx_mode_run()->mpnic_set_rx_mode()->__mpnic_set_rx_mode().

3. The uc pass retries U. M's slot is still MPNIC_TCAM_S_VALID, so
   mpnic_macda_free() rejects it, mpnic_macda_sync() returns -ENOSPC
   again, and uc_promisc is set.

4. The mc flush runs only after that. It calls mpnic_macda_unsync() on M:

	if (!--mac_addr->users)
		mac_addr->state = MPNIC_TCAM_S_DELETE;

   mpnic_write_macda() then frees the slot.

The reverse case works. A unicast removal can make room for a pending
multicast address, because the uc flush runs before the mc add.

Would it make sense to flush stale entries from both lists before either
add phase runs?

[ ... ]

> @@ -53,7 +78,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
>  	struct mpnic_net *mpn = netdev_priv(netdev);
>  
>  	if (netif_running(netdev))
> -		__mpnic_set_rx_mode(mpn->mpd, mc);
> +		__mpnic_set_rx_mode(mpn->mpd, uc, mc);
>  
>  	return 0;
>  }

Because mpnic_set_rx_mode() always returns 0, netif_rx_mode_run() never
calls netif_rx_mode_schedule_retry() for the case above.

mpnic_service_task() doesn't re-run the rx mode sync either. So U stays
unsynced and the promisc entry (zero mask) stays installed until some
unrelated rx-mode event happens. The commit message says:

  Advertise IFF_UNICAST_FLT so we don't need to use promiscuous mode to
  handle extra unicast addresses.

The later patch in the series, "eth: mpnic: support changing the MAC
address", keeps the same uc-then-mc ordering.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0%40gmail.com
