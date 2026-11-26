Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714089;
	b=d7+ysOe4zBKPch+HsEWuwiOHFznz+/XsGVOelNM8wUymgekeZOwR9DUrPyaSYgCvpvxw
	 xd2NvKQe9H0U7i2YXNScvNhlZeFDVM8Y5FlJWXufbefEEWsZAasn/cj9mZszd5yok+vrt
	 9KE6BjGK6pfQknkaMLmkZpy5uJU0NeMfQbsdVjCMAnnkFWJjymqZHEI5vLLVnNHr2bB/p
	 gOIf2fdxdiAOItDgtXSi1vISFkN2vW0i7BXJKsIjqi6GHjLgcYHh+kRMs0GfRiunXuzUr
	 xZVm0enfibGI67AJtkBIFkujnZ26KJdHDNDbOKI58Z0xSHGTiPJUf36UiMyZqvwX+Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714089;
	h=Received:DKIM-Signature:From:To:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9zMaWGv73wpL/BZnDQz+a+dIjaKBAd/WY1X+gM2KFQw=;
	b=VMkuFb3VJLVcS9y34PGZmrM61deTqUAlQFUq5SE2rhs2+CBvFIAylzg/NyMwRnuAS3kb
	 5+umh30ABAwmik4nPFj2EVM3uyFW8Ap9zGIQE8RjG6dgOiw7468Lki1QwNR42EzAlKnPM
	 7oQBTzCifGgnKhxxyHKgX7qM7CUf/QtvHBYKTEstrYKf0bye4n/4jVbbmfqlsl+1YgCrQ
	 oPKmqqJ1eayouo9HhgrnxSe4pHp80Rc5bP8fpXH3YohHrFqRPAHpRjC7UR5Q4DFIDV2dm
	 YgfP67fogG0pRrp6eMzJ2rZ5cw2Lhf88m4KF2i0wl5fd5qLKX7Q+1uH5xOUubx9bg3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN4qMEND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9E606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN4qMEND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8501F000C4;
	Thu, 26 Nov 2026 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795714089;
	bh=9zMaWGv73wpL/BZnDQz+a+dIjaKBAd/WY1X+gM2KFQw=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=IN4qMENDNbljVN0fHa4PIOT/cDV5xIghDBE18azyrhajovMFzZMqzK+BuVy4sCjV8
	 M6lcNlwHF3QD/ej7HLzqDgwRjShX9a9iaFA1v/CjFi6Safn5M3iRlKiWKr5uXM5oAD
	 iwoGIch2kOx002LEP+HgXilMPjj7d/ppMjy4skMpXSE6agFRwEB07TdtjruQVFnz2k
	 aTOlg7qfQAM2vx22UWjTr5vxQHIVdVwy4ccO1Xrz9PNbl82PQH8/00wbzmpymisbtS
	 T/SEIMnWDb5NiIK9fK9+Jb/YYJTJUa4jfNOETip0mdOi5l+5l1IpF2zMySFeB2vl/s
	 4Cis5vI1dH4Zw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, kuba@kernel.org, asml.silence@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH] eth: bnxt: fix the agg page pool ring size on 64K-page
 kernels
In-Reply-To: <b5da37f5-78c4-4f88-afa3-ecf3710f702a@linux.dev>
References: <20261125162916.1743123-1-usama.arif@linux.dev>
 <87zeuvkgv6.fsf@all.your.base.are.belong.to.us>
 <b5da37f5-78c4-4f88-afa3-ecf3710f702a@linux.dev>
Date: Thu, 26 Nov 2026 18:28:05 +0100
Message-ID: <87v75jh596.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Usama Arif <usama.arif@linux.dev> writes:

> On 26/11/2026 02:49, Bj=C3=B6rn T=C3=B6pel wrote:
>> Usama Arif <usama.arif@linux.dev> writes:
>>=20
>>> Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
>>> pool recycling rings") sized the recycle ring of the agg page pool in
>>> pages, dividing the agg ring size by PAGE_SIZE / BNXT_RX_PAGE_SIZE.
>>> Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
>>> with larger buffers") replaced PAGE_SIZE in that divisor with
>>> rx_page_size.
>>>
>>> On 64K-page kernels rx_page_size can only be 32K, so the divisor is now
>>> always 1. Each 64K page still holds two agg buffers and the page pool
>>> recycles whole pages, so the recycle ring can cache twice as many pages
>>> as the agg ring uses. With 1024 RX descriptors, the agg ring posts 2048
>>> buffers in 1024 pages while the recycle ring holds up to 2048 pages, or
>>> 128 MiB per RX queue.
>>>
>>> Divide by the larger of PAGE_SIZE and rx_page_size to restore the
>>> original size. x86 with 4K base PAGE_SIZE and arm64 with 4K and 16K
>>> PAGE_SIZE are unaffected, as rx_page_size is never smaller than PAGE_SI=
ZE
>>> there.
>>>
>>> The ring only fills up when the stack releases agg pages faster than
>>> the driver reuses them. On a 64K arm64 host with a BCM57508 (32 queues,
>>> 1024 RX descriptors), a TCP receiver that drained its sockets every
>>> 1.5 s left about 1.8 GiB less memory cached after the fix, 64 MiB per
>>> busy queue.
>>>
>>> Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues wi=
th larger buffers")
>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>>> ---
>>>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/et=
hernet/broadcom/bnxt/bnxt.c
>>> index 52606db3f7b4a8..ecc4848499c307 100644
>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>> @@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *b=
p,
>>>  				   struct bnxt_rx_ring_info *rxr,
>>>  				   int numa_node)
>>>  {
>>> -	unsigned int agg_size_fac =3D rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
>>> +	unsigned int agg_size_fac =3D max(PAGE_SIZE, rxr->rx_page_size) /
>>> +				    BNXT_RX_PAGE_SIZE;
>>=20
>> Hmm, shouldn't the denominator be rxr->rx_page_size rather than
>> BNXT_RX_PAGE_SIZE?
>>=20
>
> Ummm, yes, you are right :) With rx_page_size as the denominator,
> agg_size_fac is the number of buffers per page pool allocation, which
> is what f7dbedba6312 intended. I think the proper fix is below:
>
>
> From f52ae7fc048695de1fdf5cb3282a90036e4eca5e Mon Sep 17 00:00:00 2001
> From: Usama Arif <usama.arif@linux.dev>
> Date: Mon, 23 Nov 2026 17:24:04 -0800
> Subject: [PATCH] eth: bnxt: fix the agg page pool recycle ring size
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
> pool recycling rings") sized the recycle ring of the agg page pool in
> pages, dividing the agg ring size by the number of agg buffers per page.
> Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
> with larger buffers") changed the divisor to rx_page_size /
> BNXT_RX_PAGE_SIZE, which is wrong in two cases:
>
> - On 64K-page kernels rx_page_size can only be 32K, so the divisor is
>   1, although each 64K page holds two agg buffers. With 1024 RX
>   descriptors the agg ring posts 2048 buffers in 1024 pages, while the
>   recycle ring can cache 2048 pages, or 128 MiB per RX queue.
>
> - When a memory provider sets rx_page_size above PAGE_SIZE, each buffer
>   is its own allocation and the fill level is already divided by
>   rx_page_size / BNXT_RX_PAGE_SIZE. Dividing again gives a 4K kernel
>   with 16K buffers a 256-entry ring for 1024 posted buffers.
>
> Divide the fill level by the number of buffers per allocation,
> max(PAGE_SIZE, rx_page_size) / rx_page_size. Nothing changes for
> kernels with pages of 32K or less that use the default buffer size.
>
> On a 64K arm64 host with a BCM57508 (32 queues, 1024 RX descriptors), a
> TCP receiver that drained its sockets every 1.5 s left about 1.8 GiB
> less memory in the agg page pools after the fix, 64 MiB per busy queue.
>
> Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues with=
 larger buffers")
> Suggested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethe=
rnet/broadcom/bnxt/bnxt.c
> index 52606db3f7b4a8..85ce4b2e297ecb 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
>  				   struct bnxt_rx_ring_info *rxr,
>  				   int numa_node)
>  {
> -	unsigned int agg_size_fac =3D rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
> +	unsigned int agg_size_fac =3D max(PAGE_SIZE, rxr->rx_page_size) /
> +				    rxr->rx_page_size;
>  	const unsigned int rx_size_fac =3D PAGE_SIZE / SZ_4K;
>  	struct page_pool_params pp =3D { 0 };
>  	struct page_pool *pool;
> --=20
> 2.53.1-Meta
>
>
>
>
>> bnxt_rx_agg_ring_fill_level() already accounts for larger RX buffers, so
>> using the default buffer size here seems to account for the override
>> twice.
>>=20
>
> Ack
>
>> IIUC, the purpose of agg_size_fac is to convert the number of posted RX
>> buffers into the number of recyclable backing allocations.
>>=20
>> E.g. an iouring 16K override would result in a smaller (too small?)
>> pool.
>>=20
>> This patch had me thinking; The default agg pool buffer size is 32K on
>> 64K systems. That's quite a step up from the default 4K on 4K systems.
>> 8x more RX buffer memory as an effect of using a system with larger
>> pages... maybe there's a need for a system knob? That's pretty wasteful,
>> unless the workload is really HWGRO friendly.
>>=20
>
> Letting rx-buf-len go below 32K on 64K kernels would be one way to do
> it maybe? Although I guess that is something for net-next and not a fix.

Yeah, this was mostly me thinking out loud! :-)

Thanks for doing the change! The patch above looks good, feel free to
add:

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>


Cheers,
Bj=C3=B6rn
