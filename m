Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292522;
	b=QnJnOUc9SOKv6yVRc0AGQA37dEdKAeDqEfhUEgrv1CEJVmfhkDCVc5vsJ4HbHqFmcu4+
	 uukqXIQbs249u4oWL/QKf9ZkI1Hxslm/iMD3LPXqp7vP0KbAL/neGuH5BIlbmolS2uH6Q
	 Q+trEfKevbRR3KhYalac4s4UdBp/T2N96HszgMRLyU6KlL5Ub55ER0aQJD35Iph1JcH24
	 jDkLdWspYtfijNssZENTBC0r8pQ5Pf6TVWOHSY1UdkSGa5vW+twGaF0zp4VkBL2FPPHng
	 dtRpvpxSuNTF+Xkh+D9z7+8FFSDOz+rI/6D00JoOQUVvLMtogiJ4ORaLa9LKrmcs75A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292522;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9YX7pTGaC1zV8yzyJOH/LMlC9n2f+DZig6xlLRVKyi4=;
	b=NgnbUptRvmFmrm5W+i2D6/9P1iM8sk1KsGKvIAER7FGwFM6kRNDEVnZAuHTO3nPArOSD
	 /alnbFQ4ayaTnH1A3PcPwjnCllyS6YTNWuv7Q5LnOcm+1MjbVexO6q80hVvEQ19U2BAQg
	 Zy5qnxU6WfJJ08iLPu/LxlsQuoN/tQqo/m9SocS5qMdmHtibfauaI2FvwAV5Y6AVsGteG
	 UxABK/J15Kfl6A+jfMTLEYi57yfRxCQyCxCs1HmIs17REz/hSzL7tXJSxTzTOsGBTMhP0
	 SUtP2BCzbiIYmgoos7be+WNH090LChfij9Estsg8ZJTj5Zduaav1XzXWpFmueIhjFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flsBhDyS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F2B606A338;
	Sat, 21 Nov 2026 20:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flsBhDyS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F561F000C0;
	Sat, 21 Nov 2026 20:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795292521;
	bh=9YX7pTGaC1zV8yzyJOH/LMlC9n2f+DZig6xlLRVKyi4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=flsBhDySGPpD4+8BCO7aQee/pjQO56ZTKoWngMKOCsaxlqA3X0wklqVM2aE4xCeH7
	 /8/y2nhZVjf+81/um9VqkeE9LcyVV1l3hm8yQaA/ECRUDG50te8avO26hl4ZSvj+h4
	 tSl77nj3o9kaPUhVjFfkJDZLhNU8nYfgqqiVffidFyOowVykaIwULM9rtTP9FkQfn8
	 iaDD0xMGF96rtzbX3BfF1PcbN7pEVPnS9rTkk7HQ9hJBPbIHytj1pnNb7lCC46sq6s
	 QthW4z3lnv0ilZyCLnckRc3BZ/uNBE0yRcvAzcMt8pmirM9NEjDkN/8qgr7KyQmfli
	 xYHfuithJ+DhA==
Subject:
 Re: [PATCH net-next v7 2/3] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 20:22:00 +0000
Message-ID: <179529252030.3135.14253171645574966538@kernel.org>
In-Reply-To: <patch-7f000e4c3d9e69480484b3283b01c6dc@loljews.com>
References: <patch-7f000e4c3d9e69480484b3283b01c6dc@loljews.com>
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

- [Low] The subject "net: ethernet: mtk_eth_soc: skip page_pool" leaves
  out when the page_pool is skipped.

--

net: ethernet: mtk_eth_soc: skip page_pool

This commit adds a condition in mtk_rx_alloc() so that a page_pool is
only created for an RX ring whose ring->buf_size fits in
MTK_PP_MAX_BUF_SIZE. Larger rings fall back to the existing
netdev_alloc_frag()/mtk_max_lro_buf_alloc() path. With the current MTU
limits this condition always passes. It only takes effect once the
9K jumbo support that follows is applied.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> net: ethernet: mtk_eth_soc: skip page_pool

[Severity: Low]
This isn't a bug, but could the subject say when the page_pool is
skipped?

Read on its own in the shortlog, or during stable/backport triage,
"skip page_pool" reads as if page_pool is being removed from the driver
entirely. The change in mtk_rx_alloc() is actually a per-ring check:

	if (mtk_page_pool_enabled(eth) &&
	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {

Something like "skip page_pool for RX rings larger than
MTK_PP_MAX_BUF_SIZE" would describe the change.

The earlier patch in the series, "net: ethernet: mtk_eth_soc: fix the
RX", also seems to have a subject that was cut short.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-7d2c457e68de6b53b7348d1bdbeadcec%40loljews.com
