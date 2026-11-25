Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603112;
	b=1y1VncoSV39G7kJ/8P3/xXr4Z9qIraAf4sNZZMNjrxXHnkanj5wF0+hQM/bfowhVhOWk
	 FMiSORwgJcHTiRbiO9KgZNM78fNQSXOGuyqghKGCftVI+d8U93L7J8e/aAtjDraVy/m0z
	 i4sSJy3pHv6GSAQwrMKrc1UInmnzpy0aUrJ8ImMu8pbMppL9Ni3i2s8u+5AMCz5ljwB1i
	 922Nm2QaVCZXN4SWIPcXr7HS9Qyw7kbja4xE9bC4HHpT/3XG5rQyJO58cvYqHdnIOi/uQ
	 Zm+vqZXXwiMIqc0pSQblnEvVYlcL4za9TokNxYr81SCjC2/6SbsB8/6WWtaBgRIyEbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603112;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DGmmdZ/+crnDPatnG/CIfOVgARayETg3HVMqTgIXG7A=;
	b=MfADsPgToERVywdm2YYnCCugFAFLFfrvSq3qUsJZdsM4XTsPUNfpjRZ3jjewK1BkrEKP
	 us9Cr4YJVQALEN4TqZxybauBIPAyVWDAfbFIvtxs5BgBMEHtqBg0eCAjo4lOJdjtbsmpB
	 rOjuO5qST6w7s1fgDqgBUHhSUP0Ktx+wyYnzSYjv4XmfyGjP21YfxNvl42K+hJsszYd9l
	 W+256hCjUG5wd6zw5o/szf3vHiuCTZvy0rO5NSh2oh0oa5LJHKvOZsMkh0hxycY/HXs6w
	 hwlcdsEzvOE8qCMPDPl0FVHuHwKT5qh5iGvLdpkyjMSvyyZCl2r+Mt7OHaM8fU+ytTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqpD1aOJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B7606A321;
	Wed, 25 Nov 2026 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqpD1aOJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688521F000E6;
	Wed, 25 Nov 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603112;
	bh=DGmmdZ/+crnDPatnG/CIfOVgARayETg3HVMqTgIXG7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gqpD1aOJnHWLGsEz/AD0gHJlL+gmPBIRDa1KO6ypl5/gYHxP60J0O212G77QC/Wba
	 XEsPDMargv06e2KcGDqTGnEfL/ahwxNYDVHIQE4dZZ2F4PMQetG/FojN0/SY0MTolD
	 G3spCn3alsEuJ093eHCbeu89OCowbleZ4bfRbSrBUWJNvZ1p56H8gjW/VJRfDmm9KB
	 kk23Jb0nnV9989wYIGZpz/GR7R3PFN25bpczeeEbOGSK2iI9ol9B+GG2AZ13QsH0Ox
	 cOVW1sKpuyOxvq3JVS70SV8A1qRtuemHtj3rzOSkSTJcWZuOa0G1PymTIWNyk/ULoE
	 GI3c7cBD8xI1A==
Date: Wed, 25 Nov 2026 10:38:25 +0000
From: Simon Horman <horms@kernel.org>
To: Jijie Shao <shaojijie@huawei.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
	liuyonglong@huawei.com, chenhao418@huawei.com,
	yangshuaisong@h-partners.com, ningwei15@huawei.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 2/4] net: hns3: fix page_pool leak in
 hns3_alloc_ring_memory error path
Message-ID: <20261125103825.GP31322@horms.kernel.org>
References: <20261118130330.3026625-1-shaojijie@huawei.com>
 <20261118130330.3026625-3-shaojijie@huawei.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118130330.3026625-3-shaojijie@huawei.com>

On Wed, Nov 18, 2026 at 09:03:28PM +0800, Jijie Shao wrote:
> In hns3_alloc_ring_memory(), when hns3_alloc_ring_buffers() fails for
> an RX ring, the error path jumps to out_with_desc, which frees the
> descriptor ring but does not destroy the page_pool that was just
> allocated by hns3_alloc_page_pool(). The page_pool and its pages are
> leaked.
> 
> Destroy the page_pool in that error path as well. The pool is torn down
> before the descriptor ring here, which is the opposite of the order in
> hns3_fini_ring(); that is safe because hns3_alloc_ring_buffers() has
> already detached every buffer it attached, so hns3_free_desc() walks
> descriptors whose dma is zero and never hands a page back to the pool.
> 
> Fixes: 93188e9642c3 ("net: hns3: support skb's frag page recycling based on page pool")
> Signed-off-by: Jijie Shao <shaojijie@huawei.com>
> ---
> Changes in v4:
>   - Name hns3_fini_ring() instead of the non-existent
>     hns3_free_ring_memory(), and drop "mirroring" because the destroy
>     order differs.  The pool is destroyed before the descriptor ring
>     here, which is safe because hns3_alloc_ring_buffers() has already
>     detached every buffer.
> v3: https://lore.kernel.org/all/20261030095633.377289-3-shaojijie@huawei.com/

Reviewed-by: Simon Horman <horms@kernel.org>

