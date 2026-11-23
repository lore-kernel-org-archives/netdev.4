Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475706;
	b=FmKMxPNnajP0oz4XHcIsCU93iRBM/wdkfbF4z+ijbN8nSv6lTI+wo2OfDROzOEpstP9q
	 zvP18KGrh/vcoCY7QE/Z0PSxKAVrcswcDJlKqve2lXFM9Fk64uLQ63mcov44iDa6Q4VlF
	 2F/T1LBVsWAjiWnZ5QQbxTRnMUQwRcetLA8QerLT6qBaoLMge9A0zSrduEk9+Q7xrSyoi
	 hxWmj8NyhjJOJHLXBCH7bJNBhXgi8ZV2NmKiCcqgU4dfcF/2xpYdo4y4eWh9hONmvsQZ0
	 oob9BKOaXAWCC6zjifZ3ItobcklJ/pLQUxuHeLdAErjLX1NdLMQRabTRiatjMbNCxeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475706;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RVYWyJ0BbdnmcUI8iJP5vn29b8A6FEyws7roKgl4Zrw=;
	b=cYTk+tMLzlPB6fYGZRpClm8oyo/udKRuJvlbgjHriCNDaj2EGze3g+XuxT3eKEQ0XFtl
	 pHUvxKfZ5zt2LcsnEWWKp9gwmysKHNtRtM6UQlAA+3d6v0AZBH+EJxNFOC77pL6/RzS97
	 H3vOkVTJcKt/FPKbGUJeIZj3JFUgEPF95Xu9o1IwG+Uw+K2ZYypRsPVa0kOnaNjXLImT5
	 0eXtuYbixbWTB2sKYUL4WXSr89NBNIGcN4svfrywJYDtb2ze+CSVH2AkD52qj/geskrvK
	 t0uaW+6uuRKiPunJY/RJuSbf9HCx5IEUl/GkYyr0fGTrMDo+cpwmnCcoa6ZK/egii2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VtT4P/63";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CE606A68C;
	Mon, 23 Nov 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtT4P/63
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359221F000C6;
	Mon, 23 Nov 2026 23:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475705;
	bh=RVYWyJ0BbdnmcUI8iJP5vn29b8A6FEyws7roKgl4Zrw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VtT4P/63Nkq/acjtwT73fxjyj1N63Gg6ufoBKvQxPnpIo0BULHhRzz6rzBSK6bevd
	 me0u7ZGCBjHRvzxQMigSPx0YpZ+O16wAV4zg9IxgvGHNFJD4THyJ0XXUrtMfpXGYAD
	 63yyheWgI/PpNOODO9ngy73aDmyJwgUTti+gUCvGoyrj8Uo5w2GDf16pwvN8dBfIan
	 ZBUFfFLgXwVBk/7T/x6ON9nWoNmU3llVF1qHGkneUkQbXpB0I3NNUUhWG1XQU+bQ+P
	 O1SWmYTFVTJ5wTQdBweyyzGb/57zSdrv87+gArSRFwvU80Tx5i2hhaoZIkKrh/i0Og
	 iKnBOjs7Vl1eg==
Subject:
 Re: [PATCH net-next v8 2/3] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 23:15:03 +0000
Message-ID: <179547570374.3135.12912377110085443536@kernel.org>
In-Reply-To: <patch-512286e3bf3d34c81957126ab22d02fe@loljews.com>
References: <patch-512286e3bf3d34c81957126ab22d02fe@loljews.com>
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

- [Low] The subject line 'net: ethernet: mtk_eth_soc: skip page_pool'
  leaves out the condition.

--

net: ethernet: mtk_eth_soc: skip page_pool

This commit adds a check in mtk_rx_alloc() so that an RX ring only gets
a page_pool when ring->buf_size fits within MTK_PP_MAX_BUF_SIZE. Rings
larger than that use the existing netdev_alloc_frag() and
mtk_max_lro_buf_alloc() path. The commit message says the check always
passes with the current MTU limits and only matters once 9K jumbo
support is added.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> net: ethernet: mtk_eth_soc: skip page_pool

[Severity: Low]
This isn't a bug, but the subject doesn't say when page_pool is skipped.
In a shortlog or a backport scan, it reads as if page_pool is being
removed from the driver.

The patch only adds a per-ring check in mtk_rx_alloc():

	if (mtk_page_pool_enabled(eth) &&
	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {

At this commit the check changes nothing on SoCs that use page_pool. The
non-HWLRO rings are sized from ETH_DATA_LEN, so buf_size stays around
2K. That is well below MTK_PP_MAX_BUF_SIZE, which is about 3520 with 4K
pages.

The HWLRO rings are larger. They only exist on NETSYS v1 SoCs
(mt2701/mt7622/mt7623/mt7629), and mtk_page_pool_enabled() is already
false there.

Could the subject say when page_pool is skipped? For example, "skip
page_pool for RX rings larger than MTK_PP_MAX_BUF_SIZE".

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-51fa5ed3bc801edb3f29b61ca7888382%40loljews.com
