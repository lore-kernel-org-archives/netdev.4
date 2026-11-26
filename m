Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698130;
	b=oJNRReyGUndvs3PUpv3Gz2FrSNP1m3LAQf9ZvA8TCKauP7Fj7L5MEkzCEcTUSokKo+SV
	 iwN0Z7MuOiJF2DzetNN1TrGaDBtbD6mnzwEd6t4OLVgPM+TG1SerrIjNVX9n6O4cnGUP7
	 wkpc30X35JcZLPSBCrAzXRN6rb0CvN2OuQSYKYLEnY/FT719DUGF7yHE5MPh541F4geg0
	 QE5wIY/ZnsBP8yI0p+6rOCXAiyz41Jo8os/qm62QgkUwS0SD8MtnYt1ojHuBp8XelXRIu
	 qlKF4rYgeplExhsEGP/cchCFLV8cZW21TmO0NYEPY6btBdBiau6RlWt13hRWTzNbC7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698130;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JNZtgNBPSxn7bvj4efWeLJ9UQDdmYpN2fvka3yysKZk=;
	b=egMi18hfD7DunbpVvOkTtALdDS8ja1rU83y5Xc/L2SEvME76L/hf81WDIBM0tL/6lZr0
	 TAlZ5i7ZdMlugr+1lAgcLvbUvU21csBPJuremym60Th5jCa/BRtLN2xZxReERyYHsy84P
	 gbEyftKxoHs6rl0JodkKw3X6qO0esLa1dZFvJfGFpry4HqpbN+GDKDjkIKd8w3MlJVwtu
	 fy87wSk/+uH+uhdVji5PXn6EFhUvJlYxET8g5APsdEo/39N+HY8jdyF6lz06A5JB1ZZu1
	 EYXqz3THqvlrVffrITCGgh/InjIQl0wWfq9JDM1XlqwS4rbKRNvQ6iUQSDolPRveAkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjnZ+Jyl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1572606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjnZ+Jyl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02E81F000C0;
	Thu, 26 Nov 2026 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698129;
	bh=JNZtgNBPSxn7bvj4efWeLJ9UQDdmYpN2fvka3yysKZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GjnZ+Jyl/pFPw28aJ1N62SXh98WagAz6GlzjVpESIPTdRhJomCTQIoNHgrN2co06S
	 pZhNokVEkj0S7Zb1qf/xYTAnPAY/vnU8tdFYlCk2Km5tbv5V9CJVS64Ek7Mb2etD3w
	 MwN76Y3jCjwbecfl2LklxHFoQA532q5CJT9nO8EAWvS+TmWBAdCUq02X0jsPKHfHzp
	 svYa/Dc6GOA//f0HfOgffGb3qeTXa/cOjx6QIPq522ifrqd7/iH1iAHbEbrnW4ODUb
	 n+ZR9VtGehQqArlc2Dxf9VN5EmkKv3ywj4I/koKnGEqhuOgi5mAEBuKeJ9vL14J2fs
	 XY0UPEDs67TPA==
Date: Thu, 26 Nov 2026 15:02:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: me@amir.fyi
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, linux-mm@kvack.org,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] mm/mm_init: don't shrink large system hash tables below
 low_limit
Message-ID: <awgtymEawotNXV8f@kernel.org>
References: <20261123-mm-hash-low-limit-v1-1-8a803aa8ac70@amir.fyi>
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
In-Reply-To: <20261123-mm-hash-low-limit-v1-1-8a803aa8ac70@amir.fyi>

(added Christian)

On Mon, Nov 23, 2026 at 08:15:49PM +0000, Amir Hosseini via B4 Relay wrote:
> From: Amir Hosseini <me@amir.fyi>
> 
> When an allocation fails, alloc_large_system_hash() halves the table and
> retries until it is down to a single page.  It does not stop at
> low_limit, although commit 31fe62b95866 ("mm: add a low limit to
> alloc_large_system_hash") added low_limit precisely so that callers need
> not check the size they get back.
> 
> The TCP source port perturbation table depends on that.  It passes
> low_limit == high_limit == INET_TABLE_PERTURB_SIZE and neither
> _hash_shift nor _hash_mask, so it cannot learn the real size, and
> __inet_hash_connect() fills and indexes INET_TABLE_PERTURB_SIZE entries.
> On a single node system hashdist is off and the table needs one order-6
> GFP_ATOMIC allocation.  If that fails, e.g. because most memory was
> reserved for HugeTLB at boot, the situation commit e67b72b90b7e ("tcp:
> use alloc_large_system_hash() to allocate table_perturb") was meant to
> handle, the table is silently halved and the first connect() writes up
> to 240 KiB of random bytes past its end, typically into the TCP
> established hash table:

This is hard to read :/
 
>   Table-perturb hash table entries: 32768 (order: 5, 131072 bytes, linear)
>   ...
>   Oops: general protection fault, probably for non-canonical address 0xe480dbf6b420b3d9: 0000 [#1] SMP KASAN
>   RIP: 0010:__inet_lookup_established+0x168/0x5d0
>   Call Trace:
>    <IRQ>
>    tcp_v4_rcv
>    ip_protocol_deliver_rcu
>    ip_local_deliver
> 
> Stop halving at low_limit.  If the linear allocation still fails, retry
> the same size with vmalloc_huge(), which this function already uses for
> tables that are too large for the page allocator or when hashdist is
> set, and which does not need physically contiguous memory.  If that
> fails too, panic as before.

So, AFAIU the gist is here is that page allocator fails, let's fallback to
vmalloc_huge().

The large hashes are normally allocated at boot time when memory is not yet
fragmented, so it's very unlikely that page allocator would fail.

But there is another question: do we really need physically contiguous
memory for the hashes we get from alloc_large_system_hash()?

AFAIU, we can just drop the alloc_pages_exact() case and keep memblock for
HASH_EARLY and vmalloc_huge() for the rest.

Eric, Christian, what do you think?
 
> Reproduced on v7.4-rc4 in an x86_64 QEMU guest (virtme-ng, 1 node,
> KASAN) by failing just that allocation with CONFIG_FAIL_PAGE_ALLOC and
> fail_page_alloc=1,100,<space>,1, where <space> was measured with the
> kmem:mm_page_alloc tracepoint so that the one injected failure hits the
> Table-perturb allocation.  Without this patch the table is halved and
> the kernel crashes as above on the first connect(); with it the table
> keeps 65536 entries (vmalloc) and the system works normally.
> 
> The reproducer and fix were developed with the help of Claude Code.
> 
> Fixes: 31fe62b95866 ("mm: add a low limit to alloc_large_system_hash")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amir Hosseini <me@amir.fyi>
> ---
>  mm/mm_init.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index d99af80ec752..418068bad006 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2359,6 +2359,7 @@ void __init page_alloc_init_late(void)
>   * - it is assumed that the hash table must contain an exact power-of-2
>   *   quantity of entries
>   * - limit is the number of hash buckets, not the total allocation size
> + * - the table has at least low_limit entries, callers may rely on that
>   */
>  void *__init alloc_large_system_hash(const char *tablename,
>  				     unsigned long bucketsize,
> @@ -2371,7 +2372,7 @@ void *__init alloc_large_system_hash(const char *tablename,
>  				     unsigned long high_limit)
>  {
>  	unsigned long long max = high_limit;
> -	unsigned long log2qty, size;
> +	unsigned long log2qty, min_log2qty, size;
>  	void *table;
>  	gfp_t gfp_flags;
>  	bool virt;
> @@ -2420,6 +2421,7 @@ void *__init alloc_large_system_hash(const char *tablename,
>  		numentries = max;
>  
>  	log2qty = ilog2(numentries);
> +	min_log2qty = max(order_base_2(low_limit), 1);
>  
>  	gfp_flags = (flags & HASH_ZERO) ? GFP_ATOMIC | __GFP_ZERO : GFP_ATOMIC;
>  	do {
> @@ -2445,7 +2447,19 @@ void *__init alloc_large_system_hash(const char *tablename,
>  			table = alloc_pages_exact(size, gfp_flags);
>  			kmemleak_alloc(table, size, 1, gfp_flags);
>  		}
> -	} while (!table && size > PAGE_SIZE && --log2qty);
> +	} while (!table && size > PAGE_SIZE && log2qty > min_log2qty &&
> +		 --log2qty);
> +
> +	/*
> +	 * Shrinking below low_limit would break callers that size other data
> +	 * from it, so fall back to vmalloc, which needs no contiguous memory.
> +	 */
> +	if (!table && !virt && !(flags & HASH_EARLY)) {
> +		table = vmalloc_huge(size, gfp_flags);
> +		virt = true;
> +		if (table)
> +			huge = is_vm_area_hugepages(table);
> +	}
>  
>  	if (!table)
>  		panic("Failed to allocate %s hash table\n", tablename);
> 
> ---
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
> change-id: 20261123-mm-hash-low-limit-37a3a47c7cd1
> 
> Best regards,
> --  
> Amir Hosseini <me@amir.fyi>
> 
> 

-- 
Sincerely yours,
Mike.
