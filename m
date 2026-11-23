Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407956;
	b=PjXdrSy7h0lvv35ssLoNnK+DGIs0PcVm5Uh0qd0JSivWrYaXEEIkGUWW6ik9AtUWZOnb
	 OYhHK+mStSnV22PWQo9aLkZq7PZtIkoDjCBIAK3+S/9A6/Tj4LIjZh1usR9rLJHPeGncP
	 ibf37J/TDeflBZAO/JLKhzpt1zyawOgilnPHdQGbOe92hZWYwn+q5LfIcL6QzeeYjoYkt
	 pZxDDpmVkGJP581s3Jiai1GiZ0zLWOL8CTaU+hreRx1dT4XkRm7sSD2S3IsjHzlqCQ6S9
	 xyXHJhv2hWaiQioj+msw8mVMYnu+sbxH67FHq7k6eL9zBhZkJ3pF2qBru/lYTDRUbBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407956;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yPMwhzLszo1U7FV0WMRTgvfzhUIK9NLJAj0AVKz+yEw=;
	b=bD5ofOji97wVDg0W8kJJbzRTBw/C832zTylRS7XinIxbaa3EpsqVKWZGxBPLgwoyx9au
	 Xbfa0W5YBf1bY/3NpNIiJOoHyBKyhQrQlLDoftOV72u7tlSmirW6kib+kitZS7FVe+qwH
	 Wsvp1x70j888rOxdApQaW8JfF+p9ZSrO8sjWBCBCKbM8vaJhAeSsCyJ/O+WunF7+H6u9g
	 aLvcuPUnhPvuuRKgLVksF9QRkbJKF6tC4THiD4HYYnB14TVF2+NbonEJcSnefpb7efu1X
	 ZqIbbEQr16Sp0aFWukIVIh1rALsoKVcrrofhYSvR63HijAUr270+RLVenoLW7nNmeYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8ryaE6N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63196606A33F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8ryaE6N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4041F000CF;
	Mon, 23 Nov 2026 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795407955;
	bh=yPMwhzLszo1U7FV0WMRTgvfzhUIK9NLJAj0AVKz+yEw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k8ryaE6NJz8PMcIf4X8j4o9Ozrj8Bhb8Bfcm/zOAFFNsautAvNh+RoH7iFXa7rIKX
	 8gm9jfE+9q1XaajpVlR+fiYPumNUdBkeAsqh22g8IlE7PDjaX8qzDdGrDe5WVl9L28
	 kKNz2iWep6b1XCdGsfM09hQdftlZ7qtyjXS101rPoJvKB2MkOJ+2QmM08als7JKxIp
	 BK67oCJrHCaEalBPYsgKEwyAdJbcaJJdgbNKvQtiAuUaurcKUu5sDDDCGa4B7+lAWh
	 GwSSp7m8JXjmvkrHk6bMtxOVHNCPhkCKPeWm5HwcEcZqs2v1KA4ijr4Fcoiq+mAxzM
	 ri7eYUuZHrZVw==
Subject: Re: [PATCH net-next v5 5/6] ionic: report the operational FEC mode
 from ethtool --show-fec
From: netdev-bot+sashiko@kernel.org
To: eric.joyner@amd.com
Cc: netdev@vger.kernel.org, brett.creeley@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, nikhil.rao@amd.com, edumazet@kernel.org
Date: Mon, 23 Nov 2026 04:25:54 +0000
Message-ID: <179540795477.3135.12412117957020578861@kernel.org>
In-Reply-To: <20261118-ionic-get-fec-stats-v5-5-c9c0ee63df4c@amd.com>
References: <20261118-ionic-get-fec-stats-v5-5-c9c0ee63df4c@amd.com>
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

- [Low] ionic_active_fec_type()
  (drivers/net/ethernet/pensando/ionic/ionic_ethtool.c) returns…

--

ionic: report the operational FEC mode from ethtool --show-fec

This patch changes ionic_get_fecparam() so that, on an autoneg link,
active_fec is taken from status.fec_type (the mode firmware reports as
operational) and not from config.fec_type. With autoneg disabled it
still reports config.fec_type. The commit message expects firmware older
than c4e7a75a096c to leave status.fec_type zero, so that it reads as
FEC off.

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index c55148f3ae8fa..d406d090d0eb7 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> @@ -440,6 +440,18 @@ static u32 ionic_fec_type_to_ethtool(u8 fec_type)
>  	}
>  }
>
> +/* Firmware that predates status.fec_type leaves it zero, which reads as
> + * FEC off.  With autoneg disabled the port runs the configured mode, so
> + * only trust status.fec_type on an autoneg link.
> + */
> +static u8 ionic_active_fec_type(const struct ionic_port_info *port_info)
> +{
> +	if (READ_ONCE(port_info->config.an_enable))
> +		return READ_ONCE(port_info->status.fec_type);

[Severity: Low]
Is status.fec_type always zero on firmware that predates it? That seems
to hold only right after port_info is first allocated, because
dma_alloc_coherent() returns zeroed memory.

ionic_port_init() allocates port_info only when it is NULL. After that
the same buffer is reused:

drivers/net/ethernet/pensando/ionic/ionic_main.c:ionic_port_init() {
    ...
	if (!idev->port_info) {
		idev->port_info_sz = ALIGN(sizeof(*idev->port_info), PAGE_SIZE);
		idev->port_info = dma_alloc_coherent(ionic->dev,
    ...
	stat = (__le64 *)&idev->port_info->extra_stats;
	for (i = 0; i < sizeof(idev->port_info->extra_stats) / sizeof(*stat); i++)
		WRITE_ONCE(stat[i], IONIC_STAT_INVALID);
    ...
}

The firmware reset recovery path runs port init again on that buffer:

ionic_lif_handle_fw_up()
    ionic_port_identify()
    ionic_port_init()

The extra_stats reset above guards against firmware that does not know
about newer fields. It does not clear status.fec_type, though.

Suppose firmware that fills status.fec_type (with RS, for example) is
running. A firmware reset then brings the device back on firmware older
than c4e7a75a096c, which treats that byte as reserved. Wouldn't
ethtool --show-fec on an autoneg link then report the stale RS value as
the active mode, even though the running firmware never reported it?

The later patch "ionic: Add .get_fec_stats ethtool handler" also uses
ionic_active_fec_type(). There it decides whether to report RS-FEC
stats, but it also requires IONIC_DEV_CAP_EXTRA_STATS. Nothing later in
the series clears status.fec_type.

Could ionic_port_init() zero status.fec_type before issuing PORT_INIT,
the same way extra_stats is reset?

> +
> +	return READ_ONCE(port_info->config.fec_type);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c%40amd.com
