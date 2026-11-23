Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412160;
	b=YPTiWx21IKAj2tnsvlE8x9pXY6+T90Bx6bhfIotKlkgGYcNQUgvlrrku7kgW9kAzlPg3
	 tuPGYgAL5piEa5rbveF7i7uIwQPgjEXxAb+hEB8ftLSDa8pOtLNQN1jF2spO2BV+5XmiX
	 ef74/6F+UajPv6sShjjf4n+M4kGgExgoyUhwy7VUadzyqpLsppaNW0w1g1uAJYQhhtu5l
	 7vUV+XnVdWRbqdTieqEET+YpZ/Keb64ZRdoksN2LDLxzHHCmEtaZUb+fCX2FpBvD9l/Mz
	 OHooEdpIazSHl0e0CaFp/cOT6iqKlI5lSI2xnRutHphPeCXUwG9FpT7dA6CTGjgcHjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412160;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VkZ23aU3uhOoGMf0oIT03MRmm+QCba6V9bOzuBzDUiw=;
	b=GemfoFxUWvp3HQNSjXPj+XHhcw8Y6XWZ4sjhsoFgGCLiOu2t0jKQTgJ+cMl8OpEwInDt
	 90aBvm7XulVv7KJxiK+guTEru0JMNoj/oXLj/ITbF+GHkS3bDYq+KLh7Obh2B4crKtw96
	 XJo0N4KCGxMcpdz3ReoBGr+TDNU93IyZlp782Bv66a60DzkHQsJjPbmszX0+g9Ej/pRkj
	 Xu6ZioNxxLbV+8gda+6golz4ehUoHvdDXnf/rbn2VjCq65CNZ76Pw04TlPx4T6F27jKhL
	 fbGPP7j5EUqNuF3WOOqNYQBXdlmwkbbQzUK/1PVSUTK2AUUaot8xx2HfDvS791vQ3bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWG4CmM3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B9606A31A;
	Mon, 23 Nov 2026 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWG4CmM3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC96B1F000E0;
	Mon, 23 Nov 2026 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795412159;
	bh=VkZ23aU3uhOoGMf0oIT03MRmm+QCba6V9bOzuBzDUiw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JWG4CmM3IY2zX7oO8i4AOhu18Y6igoML+0jBimCtm54WkIMX5TRHrqIOGrUYktIPl
	 CG6WPjIqldTPVr5cDpL8IRkomu5Srv15A15BpYF9RkaaOFjGsraasENgkgFLR/qkRQ
	 rapNWRYEDe0YMXViIxwQBJWPc+72Pz82/AYMduk76UnGPeBMmEd0F09MX2yyrLgcuU
	 MO4DiD6VC9odrhu0N9hg+sKswfQYTTIorroE6Yx3NFMXV/IwpdGXwEA9laSWI27f1V
	 rHFLUgsfkt8PaaS6Mgx53acrGG/ULYmq0yYv92QrZRSfvl+GamfJw1+f77Rx/imEMr
	 YuWHSohmQSFpQ==
Subject: Re: [PATCH net] net/sched: cbs: fix 32-bit overflow in transmission
 time estimate
From: netdev-bot+sashiko@kernel.org
To: mhm.dawod@gmail.com
Cc: netdev@vger.kernel.org, vinicius.gomes@intel.com, jhs@mojatatu.com,
 jiri@resnulli.us, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ye.zh-yuan@socionext.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 05:35:58 +0000
Message-ID: <179541215830.3135.6185662719709867689@kernel.org>
In-Reply-To: <20261119053357.2033707-1-mhm.dawod@gmail.com>
References: <20261119053357.2033707-1-mhm.dawod@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On 32-bit kernels, software CBS still does not shape after this
  patch, because the configured negative sendslope is stored as a large…
- [Medium] The divisor of the patched transmission-time estimate is
  itself computed in 32 bits on 32-bit kernels.

--

net/sched: cbs: fix 32-bit overflow in transmission time estimate

This patch casts len to s64 in cbs_dequeue_soft(). Without the cast,
len * NSEC_PER_SEC is computed in 32 bits on 32-bit architectures, wraps,
and makes the q->last estimate far too small. The commit message includes
measurements on 32-bit ARM showing throughput matching idleslope after the
fix.

> diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
> index 1c93469c56e3d..107c2b6e9da30 100644
> --- a/net/sched/sch_cbs.c
> +++ b/net/sched/sch_cbs.c
> @@ -222,7 +222,7 @@ static struct sk_buff *cbs_dequeue_soft(struct Qdisc *sch)
>  	if (unlikely(atomic64_read(&q->port_rate) == 0))
>  		q->last = now;
>  	else
> -		q->last = now + div64_s64(len * NSEC_PER_SEC,
> +		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
>  					  atomic64_read(&q->port_rate));

[Severity: High]
On 32-bit kernels, does software CBS shape at all on this tree, even with
this fix? A negative sendslope looks like it gets stored as a large
positive value.

net/sched/sch_cbs.c:cbs_change() {
    ...
	WRITE_ONCE(q->idleslope, qopt->idleslope * BYTES_PER_KBIT);
	WRITE_ONCE(q->sendslope, qopt->sendslope * BYTES_PER_KBIT);
    ...
}

Since commit 000db9e9ad42 ("net/sched: cbs: Use units.h instead of the
copy of a definition"), BYTES_PER_KBIT comes from include/linux/units.h:

#define KILO	1000UL
#define BYTES_PER_KBIT		(KILO / BITS_PER_BYTE)

That makes it 125UL, an unsigned long. The old local definition was
(1000LL / 8), which is signed.

On ILP32, the __s32 qopt->sendslope is converted to a 32-bit unsigned
long. The product wraps mod 2^32 and is then zero-extended into the s64
q->sendslope.

With the setup from the commit message, sendslope = -90000 kbit/s is
stored as 4283717296 bytes/s instead of -11250000.

Then in cbs_dequeue_soft():

	/* As sendslope is a negative number, this will decrease the
	 * amount of q->credits.
	 */
	credits = credits_from_len(len, q->sendslope,
				   atomic64_read(&q->port_rate));

With the wrapped value, each 1242-byte frame at 100 Mbit/s adds about
425000 credits instead of subtracting them. q->credits never goes
negative, and the "if (q->credits < 0)" throttling branch never runs.

Wouldn't throughput then be limited only by the q->last estimate, close to
line rate rather than idleslope?

The "before" numbers in the commit message (idleslope * port_rate /
|sendslope|) only work out with a negative sendslope. Could they have come
from a kernel older than 000db9e9ad42?

cbs_dump() also looks affected:

	opt.sendslope = div64_s64(READ_ONCE(q->sendslope), BYTES_PER_KBIT);

On 32-bit this would report 34269738 to userspace for a configured
-90000.

The same unsigned 32-bit multiplication would also wrap idleslope above
about 34.36 Gbit/s.

Should the slope conversion in cbs_change() use signed 64-bit arithmetic
too, for example (s64)qopt->sendslope * BYTES_PER_KBIT, and the same for
idleslope?

[Severity: Medium]
The commit message says:

    Cast len to s64 so the multiplication is done in 64 bits on all
    architectures.

Is the divisor in this expression also safe on 32-bit? It is computed in
cbs_set_port_rate():

net/sched/sch_cbs.c:cbs_set_port_rate() {
    ...
	port_rate = speed * 1000 * BYTES_PER_KBIT;
    ...
}

speed * 1000 is an int and BYTES_PER_KBIT is 125UL. On ILP32 the product
is computed as a 32-bit unsigned long and only widened when it is
assigned to the s64 port_rate.

It wraps for link speeds of 34360 Mbit/s or more. 40G gives 705032704
instead of 5000000000 bytes/s, and 100G gives 3910065408 instead of
12500000000.

On such links, wouldn't the q->last estimate here (about 7x too long at
40G) and the per-packet charge in credits_from_len() both still be wrong
on 32-bit?

Before 000db9e9ad42, the local (1000LL / 8) made this product 64-bit.
Would it make sense to fix this in the same respin, since it has the same
cause as the sendslope conversion?

>  
>  	return skb;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119053357.2033707-1-mhm.dawod%40gmail.com
