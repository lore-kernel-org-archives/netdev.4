Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806224;
	b=UEnrjfbmAV3CZlBSp5q4C6p+8eW+qg8gp+DRL9DpdhmbjEeQSIJ8x0KQ2qcT/LQ9801z
	 TIrj5SlN3IHFppJdgmtI5JZZtb36B/Ral6gV0A7tTHrMY9ngJKUWbV/4t4JIyEGO5YLDB
	 eN6u1r+oJombmjKv0V2Bekpbtig9oXYrLNRHKHe6DA6V5dQE+p++YtXdXf0tw2XvHII5b
	 UhtTtcJAboGA3DbsM17DLdmgHZG4yxVVHi+LUTfg3Qu05zQFT9+RIzRW3nvsNvLcg8Kf5
	 GgjYSi2UQMvudx1w71hYqvozc0Oxfo/nMYFEUfFbBdOdR0kpVHXFuRLK3YQt+1QmZ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806224;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=J1hz33671+fJ5SeQS+zZhxuApW2iPJMyNeB7Cy214d8=;
	b=Lzf827JgdiyFS7r4UBlUlk+EDf++qPgKr8veFeuDihDhrgodcQJl/puW/zgw5erNIHiz
	 mzlzXnia7yARUhLGsr1dpjx1t0PBcL1mGZePfPXFSFlqkeANvkv7MSCLxlXQtFTpb3KXU
	 xNOsKd0F81kfXvIE4IxvUmozLxug8gPTzO3CROSsutm+DSW2f1RK7vRvX9QxQpwvT4Xq5
	 jtANefqOIcuYnT/eqhKTkfgKKN7G4nP6+c4yXFZ33MEpXiDqwPdpqL2MfjX4wdldjQdOH
	 1Rg/7owDYZmFZ6buCLi+qG6eyoPo//k0HoT78D+qsmPZgaUV2rr0mTepczYBYFEoEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnT7TbB0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3B606A327;
	Fri, 27 Nov 2026 19:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnT7TbB0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D504E1F000C1;
	Fri, 27 Nov 2026 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795806223;
	bh=J1hz33671+fJ5SeQS+zZhxuApW2iPJMyNeB7Cy214d8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GnT7TbB0NKP6hPHRqFGEicJqqs40MzUBIOILa4NCIGMCgCG7/CEIJgUmngNg2Yd3M
	 +j9mxNA1ceEUW9SoWAe/2ZVXhzAUnauwM713QnKBS4lTRerQ9YlAVJU5wQM1VsrmeX
	 eXrcpx/QJADS11BJga1wi3lgmbiQPZJNrIRwekDSaeEqENoeOW80fM2P8qsZ3INxNC
	 wxPX9BC7/3HPuG8k6LRaWjftOy6StShxticsGdz6+WNmTGF9SdS3Obn6kIYsVOSQJZ
	 wsqXezReCJjjBI8g2wQvf+9rYskNBb8/7nvO/KlTNAUP+J8jbPd3L8gwuHFT7wzeBh
	 CRza4ueL2BYaQ==
Subject: Re: [PATCH net-next V3 3/5] net/mlx5: nodnic: Add TX/RX statistics
From: netdev-bot+sashiko@kernel.org
To: tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 cjubran@nvidia.com, gal@nvidia.com, linux-kernel@vger.kernel.org,
 shshitrit@nvidia.com, horms@kernel.org
Date: Fri, 27 Nov 2026 19:03:42 +0000
Message-ID: <179580622240.3135.9305281980559404975@kernel.org>
In-Reply-To: <20261126182448.707782-4-tariqt@nvidia.com>
References: <20261126182448.707782-4-tariqt@nvidia.com>
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

- [Medium] mlx5_nodnic_handle_err_cqe() in
  drivers/net/ethernet/mellanox/mlx5/nodnic/en.c counts failed send…

--

net/mlx5: nodnic: Add TX/RX statistics

This commit adds TX and RX packet and byte counters to the nodnic
driver, plus a TX drop counter. The counters are updated from the xmit,
send completion, error completion and receive paths. They are exposed
through ndo_get_stats64.

> diff --git a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
> index 6400e100bcb10..38dd7498568e2 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
> @@ -85,10 +85,15 @@ static void mlx5_nodnic_handle_err_cqe(struct mlx5_nodnic_cq *cq,
>  
>  	if (opcode == OPCODE_CQ_SEND_ERR) {
>  		struct mlx5_nodnic_sq *sq = &priv->sq;
> -		u16 sq_pi = mlx5_nodnic_sq_get_pi(sq, wqe_counter);
> +		struct mlx5_nodnic_tx_wqe_info *wi;
> +		u16 sq_pi;
>  
> -		mlx5_nodnic_complete_send_wqe(sq, &sq->wqe_info[sq_pi],
> -					      napi_budget);
> +		sq_pi = mlx5_nodnic_sq_get_pi(sq, wqe_counter);
> +		wi = &sq->wqe_info[sq_pi];
> +
> +		mlx5_nodnic_sq_stats_inc(&priv->sq_stats, wi);

[Severity: Medium]
Should an error completion count as a successful transmit here?

The normal path in mlx5_nodnic_handle_send_cqe() uses the same helper,
mlx5_nodnic_sq_stats_inc(). It increments sq_stats.packets and adds
wi->num_bytes to sq_stats.bytes. mlx5_nodnic_get_stats64() then reports
those values as tx_packets and tx_bytes.

An OPCODE_CQ_SEND_ERR CQE means the device did not complete the WQE,
for example LOCAL_LENGTH_ERR, LOCAL_PROT_ERR or WR_FLUSH_ERR. After the
SQ enters the error state, every outstanding WQE completes with
WR_FLUSH_ERR, and each of those would be counted as transmitted.

The rtnl_link_stats64 kernel-doc in include/uapi/linux/if_link.h defines
tx_packets as packets the device "acknowledged it copied them out of
host memory". Flushed or rejected WQEs don't meet that definition.

These failures are also not reported anywhere else.
mlx5_nodnic_update_sq_stats() never sets tx_errors, and tx_dropped only
counts WQE build failures in mlx5_nodnic_xmit():

    do {
        start = u64_stats_fetch_begin(&sq->xmit_syncp);
        s->tx_dropped = u64_stats_read(&sq->dropped);
    } while (u64_stats_fetch_retry(&sq->xmit_syncp, start));

As a result, after an SQ error, ip -s link would show every flushed
packet and byte as transmitted, with zero errors.

The slot still has to be released through
mlx5_nodnic_complete_send_wqe(). Could this branch increment a separate
error counter instead, and report it as tx_errors (or tx_dropped)?

> +
> +		mlx5_nodnic_complete_send_wqe(sq, wi, napi_budget);
>  	} else {
>  		struct mlx5_nodnic_rq *rq = &priv->rq;
>  		u16 ci = wqe_counter & (rq->ring.num_entries - 1);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126182448.707782-1-tariqt%40nvidia.com
