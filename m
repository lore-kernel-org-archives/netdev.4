Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706202;
	b=jppwKl0aKR29Su6gdDyYB4AD5mU8CnUQz33ivFWVR0yLj072J+25bk9nE/OIsbKYY9z3
	 xEpWW49yOyXUq60VyXpbW8qYV3nSCigGf13MVdPyxdfA0AAVgFhTotx48KNCeUL9KN/1Y
	 DyQWT+910nWqGOFnWtjJfebKvyjliDvzK7gGAaxyjjWaDVyoNFyZTcVetYhuAX1Bv2qRs
	 jajsvsInk71+AmQpqQ9fq0+w0rQ3XXngpYDw41WG4E7ZM7gcc246Vn+Tmt7klEoo6FYz8
	 +opBwfsKkIidRD+h28oYBSFYuzOEYniQI5OZGXEU5Hso1ykpC4NAxTh94BM9wAtA0nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706202;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PxdozgnZohSpybsmhw9kdFGtKAGtKQuBLwN3zkZaEP8=;
	b=hcRhcWoHSJKC7UT8gpo3an4h+UVbQHYhmS+HDtoL7JFdwP3zImdSIhNYCJKALUQmxG+Z
	 hI/dY80TrkogKZyHlZxxnuaQ5AK6py2L2rC+i2MgxAA+Esck27miyqNg86Zapb/AsO4lP
	 T1lNNo6W4VC/++DdvvHvyWS4NMzPuQI45KUHAMi5bWP0fjIGFKuacNFrbmkztPJzaFvxW
	 WYzmr9TBk8rKf8CJwyXxOth7NiDWt4sF7moYhJQ0uRWzWzvrf02ViXvwou+zJRtsvKgBC
	 nyktQgA40wjQpuY8HX6XddDseBXOGjzY2J8B0crxTumKOAvxN0cMkAo5Br2iBr+boYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YQDkWrGl;
	arc=none smtp.remote-ip=91.218.175.102
Received: from mta0.migadu.com (out-102.mta0.migadu.com [91.218.175.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E3606A68C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0E3606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YQDkWrGl
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5tIbqt4iAMnVSLqVL4A67fkruVw9w17B+3jfEVeBbt4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795706199; v=1; x=1796310999;
 b=YQDkWrGl9ofQpvQu/I9lr76KqYT25KzCKiUYUweGZ3tb0Bwy3YPZQJZJKYL6uZqMonZqlOqj
 RwKTE4V3BzyFmffGTf7mNaTUeONzFE3fgMLWY68b01IMiuVTpVt6tcbakEhdz5/umZzghwBF7Cw
 YHIITRTEPg6XL21+4IvB2Png=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4346ab98f75bb39;
	Thu, 26 Nov 2026 15:16:39 +0000
X-Mizu-Trace-ID: f4346ab98f75bb39
X-Migadu-Flow: FLOW_OUT
Message-ID: <b5da37f5-78c4-4f88-afa3-ecf3710f702a@linux.dev>
Date: Thu, 26 Nov 2026 15:16:38 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] eth: bnxt: fix the agg page pool ring size on 64K-page
 kernels
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com, kuba@kernel.org,
 asml.silence@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
References: <20261125162916.1743123-1-usama.arif@linux.dev>
 <87zeuvkgv6.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <87zeuvkgv6.fsf@all.your.base.are.belong.to.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/11/2026 02:49, Björn Töpel wrote:
> Usama Arif <usama.arif@linux.dev> writes:
> 
>> Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
>> pool recycling rings") sized the recycle ring of the agg page pool in
>> pages, dividing the agg ring size by PAGE_SIZE / BNXT_RX_PAGE_SIZE.
>> Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
>> with larger buffers") replaced PAGE_SIZE in that divisor with
>> rx_page_size.
>>
>> On 64K-page kernels rx_page_size can only be 32K, so the divisor is now
>> always 1. Each 64K page still holds two agg buffers and the page pool
>> recycles whole pages, so the recycle ring can cache twice as many pages
>> as the agg ring uses. With 1024 RX descriptors, the agg ring posts 2048
>> buffers in 1024 pages while the recycle ring holds up to 2048 pages, or
>> 128 MiB per RX queue.
>>
>> Divide by the larger of PAGE_SIZE and rx_page_size to restore the
>> original size. x86 with 4K base PAGE_SIZE and arm64 with 4K and 16K
>> PAGE_SIZE are unaffected, as rx_page_size is never smaller than PAGE_SIZE
>> there.
>>
>> The ring only fills up when the stack releases agg pages faster than
>> the driver reuses them. On a 64K arm64 host with a BCM57508 (32 queues,
>> 1024 RX descriptors), a TCP receiver that drained its sockets every
>> 1.5 s left about 1.8 GiB less memory cached after the fix, 64 MiB per
>> busy queue.
>>
>> Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues with larger buffers")
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> index 52606db3f7b4a8..ecc4848499c307 100644
>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> @@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
>>  				   struct bnxt_rx_ring_info *rxr,
>>  				   int numa_node)
>>  {
>> -	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
>> +	unsigned int agg_size_fac = max(PAGE_SIZE, rxr->rx_page_size) /
>> +				    BNXT_RX_PAGE_SIZE;
> 
> Hmm, shouldn't the denominator be rxr->rx_page_size rather than
> BNXT_RX_PAGE_SIZE?
> 

Ummm, yes, you are right :) With rx_page_size as the denominator,
agg_size_fac is the number of buffers per page pool allocation, which
is what f7dbedba6312 intended. I think the proper fix is below:


From f52ae7fc048695de1fdf5cb3282a90036e4eca5e Mon Sep 17 00:00:00 2001
From: Usama Arif <usama.arif@linux.dev>
Date: Mon, 23 Nov 2026 17:24:04 -0800
Subject: [PATCH] eth: bnxt: fix the agg page pool recycle ring size
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
pool recycling rings") sized the recycle ring of the agg page pool in
pages, dividing the agg ring size by the number of agg buffers per page.
Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
with larger buffers") changed the divisor to rx_page_size /
BNXT_RX_PAGE_SIZE, which is wrong in two cases:

- On 64K-page kernels rx_page_size can only be 32K, so the divisor is
  1, although each 64K page holds two agg buffers. With 1024 RX
  descriptors the agg ring posts 2048 buffers in 1024 pages, while the
  recycle ring can cache 2048 pages, or 128 MiB per RX queue.

- When a memory provider sets rx_page_size above PAGE_SIZE, each buffer
  is its own allocation and the fill level is already divided by
  rx_page_size / BNXT_RX_PAGE_SIZE. Dividing again gives a 4K kernel
  with 16K buffers a 256-entry ring for 1024 posted buffers.

Divide the fill level by the number of buffers per allocation,
max(PAGE_SIZE, rx_page_size) / rx_page_size. Nothing changes for
kernels with pages of 32K or less that use the default buffer size.

On a 64K arm64 host with a BCM57508 (32 queues, 1024 RX descriptors), a
TCP receiver that drained its sockets every 1.5 s left about 1.8 GiB
less memory in the agg page pools after the fix, 64 MiB per busy queue.

Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues with larger buffers")
Suggested-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 52606db3f7b4a8..85ce4b2e297ecb 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
 				   struct bnxt_rx_ring_info *rxr,
 				   int numa_node)
 {
-	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
+	unsigned int agg_size_fac = max(PAGE_SIZE, rxr->rx_page_size) /
+				    rxr->rx_page_size;
 	const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
 	struct page_pool_params pp = { 0 };
 	struct page_pool *pool;
-- 
2.53.1-Meta




> bnxt_rx_agg_ring_fill_level() already accounts for larger RX buffers, so
> using the default buffer size here seems to account for the override
> twice.
> 

Ack

> IIUC, the purpose of agg_size_fac is to convert the number of posted RX
> buffers into the number of recyclable backing allocations.
> 
> E.g. an iouring 16K override would result in a smaller (too small?)
> pool.
> 
> This patch had me thinking; The default agg pool buffer size is 32K on
> 64K systems. That's quite a step up from the default 4K on 4K systems.
> 8x more RX buffer memory as an effect of using a system with larger
> pages... maybe there's a need for a system knob? That's pretty wasteful,
> unless the workload is really HWGRO friendly.
> 

Letting rx-buf-len go below 32K on 64K kernels would be one way to do
it maybe? Although I guess that is something for net-next and not a fix.

Thanks for the review!
Usama

> 
> Björn

