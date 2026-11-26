Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690146;
	b=cplrmAwUjlx7fGE9cmxbWQA4RNBaIXFexngyC044dbgTZshID5XZP+d+tOJoRyppV37w
	 wVqy01yBsRIDBoUIanUX0fGIoXCQuqr+M5xG1UTkdsnJUU/PKBnJlRjp9OBcd4iXbWp+f
	 41tLA0fo1nfHCw5tEULM/WhqHnT3VjXdO93pJAQbn3FfRtY1RXuFyADFynjhORvZ/d4Ia
	 TtCDDStisE27g0uDzx6TSjwq04BEjsN7wvwDqQ82Azr5rL7cO1Ewur3+unUdgrCbj4AMq
	 pt9aVK7oHBKVYqaTG3LxEGQDOEagdvG+c541Ntp9wnC1xpc2L6eftnuCMX0jh8yy8Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690146;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=noqA/XccKQukWr7dOkX6fkvjd/D/kbwIuY05hOVW29I=;
	b=AudwQXZ+78JpLGcuN+dlK3OUzn3K7LUYPgfia1xE+Hk4JNndtXZ7ciCsHdeAYCKTvICF
	 p0VgxVJ2Z5YOmkadeJYeWCsPn0iQTyc5dRyKGgMur8C766AwuQoV6y6qnLDVRMBMAE6K6
	 3v1lc2+Wz737n1PKyuGo7D7nnMCIz/DxDB82WBuzvEkR0kEkOw15CVLJ2X5YMk7FGuuLc
	 6pj8+uOYiPmr0s1vCTlAYGLaF+iCrhjHLafCxZczr6JQ8BCHYV/uhttGT+rhifb/bFabF
	 1M6EKuXK8qrJLTjODZz82/5IttfTS8AEnZ3Y1OeCsTvvd/juxAvM+GH5W+0/fn1W15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GT4Oqynm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A8606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GT4Oqynm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1944B1F000C4;
	Thu, 26 Nov 2026 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795690145;
	bh=noqA/XccKQukWr7dOkX6fkvjd/D/kbwIuY05hOVW29I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GT4OqynmPIL2Cj1rEpqL3nbDmOqh7i+AkjMa1Q4uhNpHOmtKarraVPnfYQXiN5EKj
	 2mnVdXUGnMiEUbmfMXk9AeWjDag6EN4pASMx/Ay7IcMBj34ii2BfOkdOioa8UMOsjf
	 geVKs2DDapxBYtCHD8JM25VreNNhmn1pfGRiPMeHCkvPfYlEeBoMhCsWD5dbXuPEyk
	 n1cUkUNzl9xBEHRJ394hocMJoHBrjWf9WMXcWskTq8cFnXTqZxiPyCpHW89UZLlY/f
	 dErHn3lMGi9f5Nm3Lwhk6qcHOBDybrW/PbOkRxZwm0AKqQRXPivhaEBZ+xOi5vmdSa
	 4JgxKe+pVvJpw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, kuba@kernel.org, asml.silence@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org
Cc: Usama Arif <usama.arif@linux.dev>
Subject: Re: [PATCH] eth: bnxt: fix the agg page pool ring size on 64K-page
 kernels
In-Reply-To: <20261125162916.1743123-1-usama.arif@linux.dev>
References: <20261125162916.1743123-1-usama.arif@linux.dev>
Date: Thu, 26 Nov 2026 11:49:01 +0100
Message-ID: <87zeuvkgv6.fsf@all.your.base.are.belong.to.us>
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

> Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
> pool recycling rings") sized the recycle ring of the agg page pool in
> pages, dividing the agg ring size by PAGE_SIZE / BNXT_RX_PAGE_SIZE.
> Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
> with larger buffers") replaced PAGE_SIZE in that divisor with
> rx_page_size.
>
> On 64K-page kernels rx_page_size can only be 32K, so the divisor is now
> always 1. Each 64K page still holds two agg buffers and the page pool
> recycles whole pages, so the recycle ring can cache twice as many pages
> as the agg ring uses. With 1024 RX descriptors, the agg ring posts 2048
> buffers in 1024 pages while the recycle ring holds up to 2048 pages, or
> 128 MiB per RX queue.
>
> Divide by the larger of PAGE_SIZE and rx_page_size to restore the
> original size. x86 with 4K base PAGE_SIZE and arm64 with 4K and 16K
> PAGE_SIZE are unaffected, as rx_page_size is never smaller than PAGE_SIZE
> there.
>
> The ring only fills up when the stack releases agg pages faster than
> the driver reuses them. On a 64K arm64 host with a BCM57508 (32 queues,
> 1024 RX descriptors), a TCP receiver that drained its sockets every
> 1.5 s left about 1.8 GiB less memory cached after the fix, 64 MiB per
> busy queue.
>
> Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues with=
 larger buffers")
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethe=
rnet/broadcom/bnxt/bnxt.c
> index 52606db3f7b4a8..ecc4848499c307 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
>  				   struct bnxt_rx_ring_info *rxr,
>  				   int numa_node)
>  {
> -	unsigned int agg_size_fac =3D rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
> +	unsigned int agg_size_fac =3D max(PAGE_SIZE, rxr->rx_page_size) /
> +				    BNXT_RX_PAGE_SIZE;

Hmm, shouldn't the denominator be rxr->rx_page_size rather than
BNXT_RX_PAGE_SIZE?

bnxt_rx_agg_ring_fill_level() already accounts for larger RX buffers, so
using the default buffer size here seems to account for the override
twice.

IIUC, the purpose of agg_size_fac is to convert the number of posted RX
buffers into the number of recyclable backing allocations.

E.g. an iouring 16K override would result in a smaller (too small?)
pool.

This patch had me thinking; The default agg pool buffer size is 32K on
64K systems. That's quite a step up from the default 4K on 4K systems.
8x more RX buffer memory as an effect of using a system with larger
pages... maybe there's a need for a system knob? That's pretty wasteful,
unless the workload is really HWGRO friendly.


Bj=C3=B6rn
