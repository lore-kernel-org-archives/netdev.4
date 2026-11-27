Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780461;
	b=jyvk1/rzsncnesLm4M0hibgtd9b9C5sQpr0R27dftoeyVkZcBd2qyF4XwNnFcZrHOjWX
	 Rxb4IifY9u0lllAcrnj/NITzmO7jXxYsQ59chHPBH1ZXigKsBfW2vsbL41Kg2iMjopAHi
	 I7wzZ6f79qJDViin3D7ucKuAtJkx2tYUVC2ebWsek4VTzcpER/dtWK3FL7PM2gRQzUXAJ
	 1sfDdnWnXGy4Lk9ZNR0xVjIeHSlqFjiOF9cSf4QGX1hPpcI3QHQ4nGp8kpOqIZ3h4rtW4
	 TobQMwNFywicT9+kDJM0nTtYLQA1AnelWSn0tXA5mdNx5MS75VXn/abYl/C0FPCXh6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=NPgplNj9APhcuna/gT9kuV7uUH+wy+QbbxgJJDCKr4Q=;
	b=xRF071VIXKhvMkbAm3mxkPr/MZzHuFGVDAddE/RMd/fqygzZ97KPIg8zC2p5lOspHt00
	 UDW3pLk1Xw0n//XmFc0sbmZlMgjkj2slJnoi7sb3HCCEoUxqAYRZM6G4nuqw7MQk//V3p
	 MqQMWWgwLamo+Eg9ziFg/M8LF1u4TLQ2Z+2A7Hs6e9gQJXgI0Ua/LSC+xLRNAJGRUuFUi
	 7tPuk62lCqYlmPzuIEpddZBwPBuFc+dviz2sRopdgx97cMKbvvawlVO2hMTmxuJd6+hhI
	 qBef1w0alb7YAWVlpHck0iJCdG7p3T/cB/vwu6ASwknj6VIOLqr5j14iwGbQ7kHqYQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9Ulw5Xf;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442F606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D442F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9Ulw5Xf
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db6d4054eso8544037d50.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780460; x=1796385260; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NPgplNj9APhcuna/gT9kuV7uUH+wy+QbbxgJJDCKr4Q=;
        b=D9Ulw5Xf/Akan+JoLGp7KULBPG4cEl0Qlr0l8NqNb0IIBAGnM8C3dOTvxifDntne9d
         +ItaobNdFuV7xZZSZdK02FHB6hV/oCpGnt8X5iEZoAN+KxK47nUxrFGqGPj9wEATzltR
         B1Rpn2p6yOdZF80QgC/bKXQIM23vh7IybD7e2aIZP6wTj8oMit1ln6kNIN5yHGzI4uE5
         tq6tZSbx8AoVQhTKkjf0uTR/Bcu6G89lH2vLrsyB7ZsGbVxLNvBKxeDajO+DFdosnlC4
         6kJa388eHluLWJYA2qUZMlnOH8FznOB4rLjhEpJTRJio1rLsG3d6dYXx0Kf1aPo9q7qt
         DJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780460; x=1796385260;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPgplNj9APhcuna/gT9kuV7uUH+wy+QbbxgJJDCKr4Q=;
        b=J76MEAFJgcusEDkmWc0+3u+YqwJFhjwXckT8MgbqkKsbtcjnMmilH6ruHiDxx4lZLK
         5zK1FAw6Cic0g+2mc2tL71c6gfnaFgKTEdaWZysQAizlsxRl2RJslF4N0a9225JVVv1F
         eqc7y6+HtQitwaCGn6+aKpJ78j4lpf6R3Fc5ZJgAgIa4Tq/Or3F9soJIGZS9hcKovR3i
         s3dy2UdBDgLC3IbPndKAR2INzplUwvrUcQTGkk79gcQy6rpLwPZXY31/Ll7afhIlY/gV
         BIyaEOhPPajAQGy0v9DRaPkP9ytVj9G5v7g+21otxwIUa0uZJ04tY4LWf5ddauDopLsw
         xOjw==
X-Forwarded-Encrypted: i=1; AL+hErHoelUP2vSBtj5E3hSUNBSqwEgXKXgOXhn3CbqoYImDQgvJwZQnbTMt1uZirkGC6SPNQElLetY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/figi/z0DKdOgdDl5ZrJk4aXpaLS/Slm1Wv478WrHd3LxOqGc6
	NNXj+6SMxvSmzsG+uPv7zySAMq72mvoh2A1sqc4zcQ8Vdj4eT68HaKBt
X-Gm-Gg: AZFdTZfX3ZraF2uuNCNGpHsMTVSvdWD347zLv7STbZIWFNdm7dMawYIU+7mbivXN4E2
	SL6kKigY18f57N3B7YXWDPwhiCVFC0semcNiUgJxGNMa17FmNdwflVgBXuhEtrScrgaGpdG1wT4
	vVPNbUCgqHGXoI5hXQFhgvTRWjrssdQ0AKxFP/DGMFkdKcZm1PkAw8febqxv0zppPXcsrtoi0Xx
	ePckAZTx4HdoE7u7C8SULiUl0m9UitQ1VrODi/wAo+FH8fb10U0zr7DQW/wcSPXgFxDGTZg72on
	2OC1pHOQkZIt/6opXEu0MYfMKE1apSZsgJyVvtmQqRrS1LzTiZlaz43IbTMr8EvTMxwJQGWCzWw
	Phz39sgeIOTwVGmeMPw/IiJPqIqGwixDM9NQHZqur30y5C0q59NX6A6UX06v4upae7k0CYRt/5A
	NXItbYOS7NWpUN3HJG5HfW6Lm8AJdi6RCMUGOgeaunjlXfgJwkMs/DWRiXfnoxT95WRDgOE0mPw
	gz19sC6GEPfO3HOJqhPRb0CMuwWSQdRRpNUKLH0Ig/CkGyUEmXRHol3R/35dcR+uXNI97evQSc6
	lr6YhpD/xKEcbcwsDymp8ZwU++WgnvvTgGvLa1v7kNGAtOTg8AsOuhQ=
X-Received: by 2002:a05:690e:13ca:b0:67d:e97e:3283 with SMTP id 956f58d0204a3-67df43ce140mr10731749d50.24.1795780459895;
        Fri, 27 Nov 2026 03:54:19 -0800 (PST)
Received: from localhost ([2600:1700:4a51:221f:cd57:192:f9db:90dc])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df335b3aesm11118579d50.12.2026.11.27.03.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:54:19 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 06:54:18 -0500
Message-Id: <DN5Z1LNNUIXI.33NZ6QHK9ZS99@gmail.com>
Cc: "Aleksandr Loktionov" <aleksandr.loktionov@intel.com>, "Boris Pismenny"
 <borisp@nvidia.com>, "Cosmin Ratiu" <cratiu@nvidia.com>, "Daniel Zahka"
 <daniel.zahka@gmail.com>, "Dragos Tatulea" <dtatulea@nvidia.com>, "Gal
 Pressman" <gal@nvidia.com>, "Leon Romanovsky" <leon@kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Raed
 Salem" <raeds@nvidia.com>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>,
 "Saeed Mahameed" <saeedm@nvidia.com>
Subject: Re: [PATCH net] net/mlx5e: psp: Fix stack info leak in PSP device
 stats
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de
 Bruijn" <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261126211115.767481-1-tariqt@nvidia.com>
In-Reply-To: <20261126211115.767481-1-tariqt@nvidia.com>

On Thu Nov 26, 2026 at 4:11 PM EST, Tariq Toukan wrote:
> mlx5e_psp_get_stats() reads the PSP flow counters into an uninitialized
> on-stack struct. mlx5e_accel_psp_fs_get_stats_fill() ignores the
> mlx5_fc_query() return value, and a failed query, e.g. -ENOLINK when the
> device is in internal error state, leaves the counter fields unset. The
> uninitialized stack values are then reported to user space through the
> PSP get-stats netlink command.
>
> Zero-initialize the struct, so the counters of a failed query read 0.
>
> Fixes: b1346219e535 ("net/mlx5e: Add PSP stats support for Rx/Tx flows")
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> Reviewed-by: Cosmin Ratiu <cratiu@nvidia.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c b/dri=
vers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c
> index 73b232379263..4aacb4173b1b 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c
> @@ -995,7 +995,7 @@ static void
>  mlx5e_psp_get_stats(struct psp_dev *psd, struct psp_dev_stats *stats)
>  {
>  	struct mlx5e_priv *priv =3D netdev_priv(psd->main_netdev);
> -	struct mlx5e_psp_stats nstats;
> +	struct mlx5e_psp_stats nstats =3D {};
> =20
>  	mlx5e_accel_psp_fs_get_stats_fill(priv, &nstats);
>  	stats->rx_packets =3D nstats.psp_rx_pkts;
>
> base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
