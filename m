Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475707;
	b=3wzUBR/5e+wecoOn6zYdfqXHXNHAArzfIsGowL22rQJf4M7cLoFCQz1JhqUvJyL8zXAP
	 +faKsl7ALZuXbwZyTmuVVQn86ST9h4RAL+BMlTJOIV950KZCzxtSHOl8/jX46pYJmPpCa
	 UNmcvuPpBtO+1WrDfsOgn6zZCfof7G1SrvzLxMT1IZiWBY7dgJ7RqzwC3X+QpFeEJmdtu
	 h9dZL1aG5/Hth1vaRHcCFqmEvh1cxK3b4w9C87Isv1X/DAezz5tEEMpQ+7NXNoUBcLf+F
	 H61HwBOmJF8/FzMIfnRWGows6KB0eQroMajuFb3atLkiqWL7iX+McnSu5enhjQCl5mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475707;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hKLSWJdH/cW/Tz03CBh7+GtUNubuHi+KzzGqMktxs8M=;
	b=EXuf+6gUO/q/z1N+V5nJ0V4p+fUnyhXQM7aLh8/tVUMs5E4RHEQ5rI4AralsvrVBux/D
	 U3TsnkEUWo6diRQW8/kJ+1s3eVmZT5Vo/fbxKXCgday3cnZKCLbUCN5oPLlHrEJQ5o2by
	 pjinIuaF4z7DuIRaKbCI/pIh6CHHrprMRjW4p7F5xbUORNEBebE2J9Xy/2B/UwDXQpWAQ
	 DPtJUbFB+xR/oPz7FH8dGqF2h1EV4MxA/0xWMKrsMejlX/mmeRnm/X0Yz975kmnPQpbL8
	 mhMVROU2dQKp1UI9PzEm+Toy0xSB17YcoKqcq+jEcmTvB+JcxfBPqjs2wfKYHNmFedg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVlt9Hv1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71814606A685;
	Mon, 23 Nov 2026 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVlt9Hv1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A87A1F000D0;
	Mon, 23 Nov 2026 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475707;
	bh=hKLSWJdH/cW/Tz03CBh7+GtUNubuHi+KzzGqMktxs8M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kVlt9Hv1p9OYTI9HUT/B6bbWk9du33RzDunq243H7OkOeuQmYLJA7DdiDVw7mi1ms
	 KRpo1BtqOvGDUx17syAhEV0GQrd4wFO3MVnC4lXZKuNsOxstDQYzjZkjDhzawG6bwu
	 V77kOl8FPXJ/fNXPAnHbKv0OIRmuZczumgo1veCxcIbgoJ2m4jISrGmSXYMaNVJMYA
	 tfJfan2dC+IO3CRjvaigPSfTd+rjuI+ikGVHDjm2NepJ6XMw3cTrVbaRRJxi2HSwGs
	 Kc9LXCsi1kcvaGPJRugTPcFADZAck5aZPMek/MVqsQxCKvqtP2bhNKTqRF6JFrhIwn
	 2xD/zyWSz/MAw==
Subject:
 Re: [PATCH net-next v8 1/3] net: ethernet: mtk_eth_soc: reset dma_addr
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 23:15:05 +0000
Message-ID: <179547570565.3135.18239991807635277619@kernel.org>
In-Reply-To: <patch-154d2fe52d9ef9bfc85e603784552187@loljews.com>
References: <patch-154d2fe52d9ef9bfc85e603784552187@loljews.com>
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

- [Low] The commit message of "net: ethernet: mtk_eth_soc: reset
  dma_addr" describes the mechanism correctly but undersells the impact.

--

net: ethernet: mtk_eth_soc: reset dma_addr

This patch resets dma_addr to DMA_MAPPING_ERROR at the start of every
iteration of the mtk_poll_rx() loop. A descriptor that goes to
release_desc without a new mapping then keeps its own high address
bits in rxd2, instead of picking up the previous descriptor's bits.

> With
> MTK_36BIT_DMA and DRAM above 4 GiB the hardware then DMAs the next
> frame to an address that is neither buffer, and the driver passes the
> stale contents of the untouched buffer up the stack.

[Severity: Low]
The code change looks correct. Could the commit message say more plainly
what this means in practice?

Before this patch, once one descriptor had been refilled, a later
descriptor that jumped to release_desc kept its own low bits in rxd1.
Its rxd2 was then rebuilt from the previous descriptor's mapping:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_poll_rx() {
    ...
release_desc:
	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
		if (unlikely(dma_addr == DMA_MAPPING_ERROR))
			addr64 = FIELD_GET(RX_DMA_ADDR64_MASK,
					   rxd->rxd2);
		else
			addr64 = RX_DMA_PREP_ADDR64(dma_addr);
	}
    ...
		rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size) | addr64;
    ...
}

The release paths are: no netdev for the source port, MTK_RESETTING
set, or mtk_page_pool_get_buff()/napi_alloc_frag() failing under
GFP_ATOMIC.

In that case the NIC writes the next received frame, up to
ring->buf_size bytes, to (prev_hi << 32) | cur_lo. The driver does not
own that memory. So ordinary inbound traffic can cause the device to
silently corrupt arbitrary kernel memory.

The current wording ("an address that is neither buffer") describes
the mechanism, but it never calls this memory corruption. Would it
help stable and security triage to state that directly?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-51fa5ed3bc801edb3f29b61ca7888382%40loljews.com
