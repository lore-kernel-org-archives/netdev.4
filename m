Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666396;
	b=xWrxFJJIromsMW1M2S0k3RfYOFw2aCCqIcchhBF+gotCgI4ZvWwpqS03gKqr6dL+BSoe
	 Uv8h0J+QV3xQLykI4Frjsf0ZomJjDFfjlJq3zDvXLThi56mAydIisvdkoKDRPAnEvi6Pk
	 ex3RMmgevNBzBKS4D6t6no/kDebLf28bx/laIDaSBHGGjFBAyi5oXF6zO2gQMxopYba0j
	 FjVd6e/G6vWy1sroVsc3XYrKHiktQmY8HOp22PraoO6xfeoWSNA7rByJYlAvL5631M1NO
	 ST9y02Z4DSS9bowqPhgQv4yAWQhn7PiF96T/Z4X1UVFOu/yO2YquO0KFyapywcsHiFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VKfbvGk8Y/jU9HbOgEOEZOjAkLHcru43E0pVFPAYJBM=;
	b=wUY1SOQqcOfHHc/H/peoYlIwWGaPYfredzome9ePyrrLc/xhEEUzY9Tc2YppLc1fZ1pc
	 qCLmBV0m2cbhaNrYRE+QzAOKHsR/ZkLnHYEwx8PIpBPyc+lse4Qb3kMTUqcGPgv/6ht8D
	 3l4jMHvxi6ztG9B3Hw9zA/UmpiGIdaYEm7NFsZbmnEJlUzMXbrkiCGqR0UeaUm5W9cRuZ
	 gnJ4MY/vWpUa5xWxFMLcrpU0bcrTcJ1i+3I6NeAxS8stGPMLeeMGQLLcK9zazpLtb3W4p
	 niajLeXBvd8KpRp7MPauw0ZU2G2/gFkI3jObXG1gL0oUCn8l0LQ3A0ioCQBFy635fIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAZna+tX;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36989606A895
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36989606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAZna+tX
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so15746705e9.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666393; x=1795271193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKfbvGk8Y/jU9HbOgEOEZOjAkLHcru43E0pVFPAYJBM=;
        b=eAZna+tXxLHQBQjgU3iwpvOZANU9R4AEtsIrkYmiARdvgN06PGElj+I1cI38pK8He4
         +gwSV9xNkqVNYOv5l3NRSgV9qxM3v8mbn48QbiN68s8bQ1mHCF7bXSg0FTs3mcRObQxN
         LFJEbliDECAqwz9Dy9A8MVrSXEFKpebB5vV+QxV2ewwivm6NymgE3izByhdTzkDc8Lwn
         l0Vfq3KeUkNSxoG/corxVbWNL58cxqymMBFKhgB800FDrVuBkLm5axGsFktOsRL51oXw
         Cvl3y7j37cIDhM7PHrL+x5jXIaoxivkRAlvWR5qMYUc29vMifKo+fCjN1MLbgS1EZowj
         ZTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666393; x=1795271193;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKfbvGk8Y/jU9HbOgEOEZOjAkLHcru43E0pVFPAYJBM=;
        b=XiTlxE0ox8Y8Ho/CqgdAIx9HHEJiuy0qZhs4JkulGGoKM6arIkbEMBFSdpt7E3ugfD
         NvAtR+/D9gJoLrE7jVQSEJa57Nk7SfCPhSRW5fpBQTwBf9cdA3JJTDpgVl0M93A3paso
         LjddMtcxxcoQ17wZ8AXHIujM9k7Cm5pKPoAzSp5znRrynDvh73aRinVr6DAmW4OUGrM5
         dlLCpv+WQiEpNETYUWwfQJgFN3LOytzKqNjyYX7NsVXvxyFAkfJ4r7IZJkUPXDDDkfZk
         xFGYpZukQro5j3CCfuw7xZE0fxMWLdaKSxdMcVeAFeE06xCdmLJPjJu+5+fDBuNeMLKs
         i/pg==
X-Forwarded-Encrypted: i=1; AL+hErGeBFw1gVb09TlHhWoyrupfzZ7MH9IKb9fJ/ELFsNUd/13Dch2ZEEeV/goMuGA/evB7sZ80Aro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+/w2Pz1fRjcsHPgoeAuzYvyfpKjz0Je0vS+YO2wsUNZ4cF2N
	tQKDEByoxjWTUwlQY9nzEJsBkTwJ24KgOC2n87k94bj8G+zBYJToMicd
X-Gm-Gg: AYBFou3v0h2c/QGNGRvIrss770Qgu/EQR9g8LHZrdv5FzAHnVBblJsBWDa5odCsUqvi
	+vwa7MuXGYXSYm43B6tZASdNB6VR5Gm5uV8dEsTh142UUC3MNR8FIygTnU61cIB+l6zNKsj3B+O
	t3pk88A/G37YFsTPhdR0s5JoEm5Nl0wsc29e1Cnf4iUxXbaTDp3eBFdmTbfjnbx/UGxEuPFOPNX
	y8yx1qGIALkVySojReSc0vCAmr3tHfKsU36+s4XYqumFWYrIM5GostCCNHL9dbHNk+2NGfjvJn9
	WnijfhnYvi1Ele0bqvtOR/Sk1rm618/2miqHkolq6filiyemHZSCny9uxAJQze7dAPWNCq2iPZH
	44MOzXArjMzj+DWxsPf5OwK0qJ0HZTNRSKMrr8UrnECSHfRWaWEUxQmbFc2TjHTE2C2cKjVJJPU
	p6SIz3A/TS1JIXLU38BRsDWyZ8JmiJ5DIaMggbVAmG4l9YtYSS+ash/WBH53wppU6IX/+3xIpjA
	FcJhhsX07PtnAkiStGNZ0E9dpEQGnnaUR1Y4Cr0X39s8Wp7gWtbSXzGsUaih1oEo55kjH5vS1rH
	Ab+DIYCtsTEOSytguBVKZ6qlnsHWEaAL/RQ4NMsKBS1I/d27ShDzQKz1kWl1WxJk2w==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr81819625e9.10.1794666393381;
        Sat, 14 Nov 2026 06:26:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm245199735e9.4.2026.11.14.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:26:33 -0800 (PST)
Date: Sat, 14 Nov 2026 14:26:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jakub Kicinski
 <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Saeed Bishara
 <saeed.bishara.os@gmail.com>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Andrew
 Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, David
 Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: csum: Add fused copy and Internet
 checksum
Message-ID: <20261114142631.7352b895@pumpkin>
In-Reply-To: <20261114040943.219870-2-demyansh@gmail.com>
References: <20261114040943.219870-1-demyansh@gmail.com>
	<20261114040943.219870-2-demyansh@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 03:57:00 +0000
Demian Shulhan <demyansh@gmail.com> wrote:

> arm64 currently falls back to the generic csum_partial_copy_nocheck() in
> lib/checksum.c, which performs memcpy() followed by a second pass in
> csum_partial(). This double pass is hit on software GSO paths
> (skb_segment() without SG or TX checksum offload, e.g. TCP over
> WireGuard) and UDP/ICMP replies.
> 
> Implement a single-pass csum_partial_copy_nocheck() in
> arch/arm64/lib/csum.c using four independent __uint128_t accumulators
> over a 32-byte stride, followed by 16/8/4/2/1-byte tail handling. Each
> word is read once into a GPR before storing and summing, emitting paired
> ldp/stp and adds/cinc carry propagation with no stack frame.

Is that right?
I thought ldp/stp required aligned addresses.
The code below is using get_unaligned().
I think the timings below are for ldp/stp?

> 
> Throughput on ARM Neoverse-V2 (Google Axion, 3.0 GHz, GCC 15.2 -O2,
> warm L1 cache):
> 
>    len   memcpy + do_csum   csum_partial_copy_nocheck   speedup
>   ----   ----------------   -------------------------   -------
>     64         10245 MB/s                  15902 MB/s    +55.2%
>    256         18851 MB/s                  26026 MB/s    +38.1%
>    512         22465 MB/s                  28421 MB/s    +26.5%
>   1024         24330 MB/s                  29900 MB/s    +22.9%
>   1368         24192 MB/s                  30221 MB/s    +24.9%
>   1448         24188 MB/s                  30279 MB/s    +25.2%
>   1500         24165 MB/s                  30096 MB/s    +24.5%
>   4096         25299 MB/s                  29946 MB/s    +18.4%

That is topping out at 10 bytes/clock.
Each loop iteration copies 32 bytes - so must take 3 clocks.
Which means it must be doing 16 byte read/write in a single clock.
So rather begs the question of why it is limited by the loop control
and checksum instructions rather than the memory accesses.
The checksum code needs 4 ALU instructions (for 16 bytes), if the CPU
can execute more than that then there is half a chance of getting the
loop down to 2 clocks.
Just moving one (or both) the pointer updates into the middle may help.
Otherwise you try using negative offsets from the end of the buffer
and 'reg + reg' addressing (will need more pointers since I don't think
arm has 'reg + reg + offset' addressing.

> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Demian Shulhan <demyansh@gmail.com>
> ---
>  arch/arm64/include/asm/checksum.h |   3 +
>  arch/arm64/lib/csum.c             | 100 ++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/checksum.h b/arch/arm64/include/asm/checksum.h
> index dc52b733675d..9f766db01152 100644
> --- a/arch/arm64/include/asm/checksum.h
> +++ b/arch/arm64/include/asm/checksum.h
> @@ -44,6 +44,9 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  extern unsigned int do_csum(const unsigned char *buff, int len);
>  #define do_csum do_csum
>  
> +#define _HAVE_ARCH_CSUM_AND_COPY
> +__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len);
> +
>  #include <asm-generic/checksum.h>
>  
>  #endif	/* __ASM_CHECKSUM_H */
> diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
> index 75db718e5b6a..a9617cde28c1 100644
> --- a/arch/arm64/lib/csum.c
> +++ b/arch/arm64/lib/csum.c
> @@ -2,8 +2,10 @@
>  // Copyright (C) 2019-2020 Arm Ltd.
>  
>  #include <linux/compiler.h>
> +#include <linux/export.h>
>  #include <linux/kasan-checks.h>
>  #include <linux/kernel.h>
> +#include <linux/unaligned.h>
>  
>  #include <net/checksum.h>
>  
> @@ -116,6 +118,104 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
>  	return sum >> 16;
>  }
>  
> +static __always_inline __wsum csum_fold128(__uint128_t sum)
> +{
> +	u64 s;
> +
> +	sum += (sum >> 64) | (sum << 64);
> +	s = sum >> 64;
> +	s += (s >> 32) | (s << 32);
> +	return (__force __wsum)(u32)(s >> 32);
> +}
> +
> +/*
> + * Single-pass copy and ones' complement sum. Each word is read once into a
> + * GPR before storing and summing, so the returned sum always matches @dst
> + * even if @src is concurrently modified.
> + */
> +__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len)
> +{
> +	const u8 *s = src;
> +	u8 *d = dst;
> +	__uint128_t sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
> +	unsigned int n;
> +
> +	if (unlikely(len <= 0))
> +		return 0;

Hmmm...
Does zero actually happen often enough for that to be a gain?
Even with the unlikely() it is likely to slow down the normal path.
And that assumes that the branch isn't mispredicted and that gcc
doesn't ignore the unlikely(). 

> +
> +	n = (unsigned int)len >> 5;
> +	if (n) {
> +		do {
> +			u64 v0, v1;
> +
> +			v0 = get_unaligned((const u64 *)s);
> +			v1 = get_unaligned((const u64 *)(s + 8));
> +			put_unaligned(v0, (u64 *)d);
> +			put_unaligned(v1, (u64 *)(d + 8));
> +			sum0 += v0;
> +			sum1 += v1;
> +
> +			v0 = get_unaligned((const u64 *)(s + 16));
> +			v1 = get_unaligned((const u64 *)(s + 24));
> +			put_unaligned(v0, (u64 *)(d + 16));
> +			put_unaligned(v1, (u64 *)(d + 24));
> +			sum2 += v0;
> +			sum3 += v1;

Is using sum0/1 here actually slower?
My 'gut feel' is that it won't be - and saves the adds below.

It is also worth checking that gcc doesn't zero extend v0 into a
register and then do a full 128bit add.
I'm sure I looked at the code using only 64bit variables for:
			sum0 += v0;
			carry0 += sum0 < v0;
both gcc and clang used 'add 0 with carry' for the second line.

> +
> +			s += 32;
> +			d += 32;
> +		} while (--n);

It is a shame to have to update 3 variables here.
They may be taking the 3rd clock.

David


> +
> +		sum0 += sum2;
> +		sum1 += sum3;
> +	}
> +
> +	if (len & 16) {
> +		u64 v0 = get_unaligned((const u64 *)s);
> +		u64 v1 = get_unaligned((const u64 *)(s + 8));
> +
> +		put_unaligned(v0, (u64 *)d);
> +		put_unaligned(v1, (u64 *)(d + 8));
> +		sum0 += v0;
> +		sum1 += v1;
> +		s += 16;
> +		d += 16;
> +	}
> +	if (len & 8) {
> +		u64 v = get_unaligned((const u64 *)s);
> +
> +		put_unaligned(v, (u64 *)d);
> +		sum0 += v;
> +		s += 8;
> +		d += 8;
> +	}
> +	if (len & 4) {
> +		u32 v = get_unaligned((const u32 *)s);
> +
> +		put_unaligned(v, (u32 *)d);
> +		sum1 += v;
> +		s += 4;
> +		d += 4;
> +	}
> +	if (len & 2) {
> +		u16 v = get_unaligned((const u16 *)s);
> +
> +		put_unaligned(v, (u16 *)d);
> +		sum0 += v;
> +		s += 2;
> +		d += 2;
> +	}
> +	if (len & 1) {
> +		u8 v = *s;
> +
> +		*d = v;
> +		sum1 += v;
> +	}
> +
> +	return csum_fold128(sum0 + sum1);
> +}
> +EXPORT_SYMBOL(csum_partial_copy_nocheck);
> +
>  __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
>  			const struct in6_addr *daddr,
>  			__u32 len, __u8 proto, __wsum csum)

