Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712278;
	b=ZB12Lqb6gcLnF3SeLCbaJfIzHF9Iqg2rO9bxh54OpIEVD0RRBJf+mI/M0yzYdv9pl/k3
	 CzCdqd2DKRFEgCvcHeCxyp+oy7VOZHmXUaEQigOXPNnltDwasAfofuu1QSDlSgjF/9q7U
	 M1baW9jfrMl5RKZ+MQE1l4D0tj1fs7UHkkz5EceQIJmWlp2pUTuuRMAv0Kvx8kN76KNQO
	 m5vSbqsoXzJVcXyzL+5/izoQ4jwgCxa1/p0db2b8qNe2Xhzhz+tOopb6CtMTTRvjRRMhk
	 m6h06ul83vksFhOkovdkN1CYtUeICL3fAvI7lzz6II2zsFburQdW40Y/LmxNx2wboNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712278;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BO5SI2YJbjEm4cwoC9ETxD503D3V+vse3XeeO3oZnZg=;
	b=JJyCgzmmXRycRRCN1RVHUgn/ZUyBqkNgh5yNWqCf8eBkBhzzHDpWSAlDYRl3hV7sTDZX
	 y5eOWM34A2+w7iVUt9/eQivkc/pFTKDTbGlREZSclV90xgyIa3VggjhtkSKwgBwBAbI/F
	 0JeeYIuQB8b326m7dA9v539wiEfCQkiRX7xAroPaGdKyIsI8GCBH57KaZZIfzZ3hWpjvs
	 e1odEU9ouCNq4mAseFTUB5EhKiG6qkXy/JPHMonmjx++079BaJDFSTw9VkdL/lizt6MDa
	 tWQUPPLJsebsLx+5YJoX6xFO8a5FJ5ZBbTN4EGX99g6/OEIXNtF0WkbBOQiuRibHGtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LZz1ZsXS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441DA606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LZz1ZsXS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43AE1F000C0;
	Thu, 26 Nov 2026 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712277;
	bh=BO5SI2YJbjEm4cwoC9ETxD503D3V+vse3XeeO3oZnZg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LZz1ZsXSVffl7lmnL+ROFVwodEl3XqQSAiXFAMedX1AVWoQhN362OiDT889TX1RmM
	 HSzsiKjvayN9z0s0FdXszBfFm/Wmqtwtnov+y5MRBsZ/KtGACid68+H2Q1RXRUnx2s
	 +7ojmVxbhSRrnNTGQaXZl8JDgasbQNhDqokQMTt4av5xQSXIw7XbJU5OfvUSPf4T62
	 fbuotO+sn8JMfdUiTe4BnyJ5nM8hmxSSd4ZJA9kQFH6bobbINvgEZHDq5ICH72WbS5
	 aIVYpaHsGpJJmjuuIkCoWODtHG9SpQDbFrOUDgywrVWCAHVsB0T90/z5Ukew2A0Ufk
	 cj0WBiZNYFbnw==
Subject:
 Re: [PATCH] eth: bnxt: fix the agg page pool ring size on 64K-page kernels
From: netdev-bot+sashiko@kernel.org
To: usama.arif@linux.dev
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com, kuba@kernel.org,
 asml.silence@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
Date: Thu, 26 Nov 2026 16:57:56 +0000
Message-ID: <179571227642.3135.2867727383240259452@kernel.org>
In-Reply-To: <20261125162916.1743123-1-usama.arif@linux.dev>
References: <20261125162916.1743123-1-usama.arif@linux.dev>
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

- [Medium] In `bnxt_alloc_rx_page_pool()`
  (drivers/net/ethernet/broadcom/bnxt/bnxt.c), the new `agg_size_fac =…

--

eth: bnxt: fix the agg page pool ring size on 64K-page kernels

This commit changes how bnxt_alloc_rx_page_pool() sizes the recycle ring
of the agg page pool. The ring size is now divided by
max(PAGE_SIZE, rx_page_size) / BNXT_RX_PAGE_SIZE. On 64K-page kernels
rx_page_size is always 32K, and with this change the ring again matches
the number of pages the agg ring uses.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 52606db3f7b4a..ecc4848499c30 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
>  				   struct bnxt_rx_ring_info *rxr,
>  				   int numa_node)
>  {
> -	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
> +	unsigned int agg_size_fac = max(PAGE_SIZE, rxr->rx_page_size) /
> +				    BNXT_RX_PAGE_SIZE;

[Severity: Medium]

Should the divisor here be rxr->rx_page_size instead of BNXT_RX_PAGE_SIZE?

The two values are equal only when rx_page_size == BNXT_RX_PAGE_SIZE.
That is always true on 64K kernels, which is why the 64K case is fixed.

On 4K and 16K kernels with rx_page_size > PAGE_SIZE, the fill level is
already divided by this factor in bnxt_rx_agg_ring_fill_level():

	if (rxr->rx_page_size > BNXT_RX_PAGE_SIZE)
		fill_level /= rxr->rx_page_size / BNXT_RX_PAGE_SIZE;

When rx_page_size >= PAGE_SIZE, __bnxt_alloc_rx_netmem() also uses one
whole pool unit per agg buffer:

	} else {
		netmem = page_pool_alloc_netmems(rxr->page_pool, gfp);

So doesn't this line:

	pp.pool_size = bnxt_rx_agg_ring_fill_level(bp, rxr) / agg_size_fac;

apply the rx_page_size / BNXT_RX_PAGE_SIZE factor twice?

Two examples with 32K buffers:

  4K kernel: the agg ring posts rx_agg_ring_size / 8 pool units, but
  pool_size is rx_agg_ring_size / 64, which is 8x too small.

  16K kernel: the agg ring posts rx_agg_ring_size / 2 pool units, but
  pool_size is rx_agg_ring_size / 4, which is 2x too small.

This setup can be reached when a memory provider sets rx_page_size, either
through devmem NETDEV_A_DMABUF_RX_PAGE_SIZE or through io_uring zcrx
rx_buf_len. __netdev_queue_config() copies that value into the queue
config, and bnxt_validate_qcfg() accepts values up to
BNXT_MAX_RX_PAGE_SIZE on P5+ chips. Recycled net_iovs that don't fit in
the ptr_ring then go back to the provider through mp_ops->release_netmem()
and are not cached.

Would max(PAGE_SIZE, rxr->rx_page_size) / rxr->rx_page_size fix both the
64K oversizing and this undersizing?

On the same point, the commit message says:

> x86 with 4K base PAGE_SIZE and arm64 with 4K and 16K
> PAGE_SIZE are unaffected, as rx_page_size is never smaller than PAGE_SIZE
> there.

This patch does leave those configurations unchanged. However, the divisor
from c55bf90a2112, the commit in the Fixes tag, is still wrong there when
rx_page_size > PAGE_SIZE. Could the commit message say so?

>  	const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
>  	struct page_pool_params pp = { 0 };
>  	struct page_pool *pool;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125162916.1743123-1-usama.arif%40linux.dev
