Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416334;
	b=E0k78SOv2h6ysee1d0hVQJmuhR8s3Fq8iSyBPFNFOB/P2Vv6riFLCQRTMDymTfWS5ztH
	 FRYymHNa6aeGSaasjch6/Ad531S+ySi84ICY+O+6RY1C8YnpuFNrA+xlY6IDcRelb0Xlw
	 2Bo7Lu2ogdsWeUqjjc/FPgVKTTRSGcrmdb0eYBQKPb9UTfNuiEMPFz/wZrm2JR8AlWStz
	 l+dkZn+S+/Wi5R5CwOmO0FhNLuqx7J+5aDZ5K7xU3hxN4l3s6pPLClhkkB6ygP54PpNYU
	 B3a8wBXMx+nLQL9WlznppylYj+sq8t3GcrLW3HSwTUsAGzLQZpVd/OFv05JdMRBQxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416334;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ixmwBow0FK9VaNmhGL5HuCR4NwR5tANQhiSxUDqh2BA=;
	b=TQOVn3tOmZI2eqZzJHKkIkbwTeOriEDFBCpxzmMwxShtfik178GMjdvwCfOwbaCrOxph
	 ioQlEVNO2fdqzsChcjXVNzKi+hylflr5me2FbWl46dO4ZVJy42nxuKOTYAGZh4SC3+ZDk
	 nEtjPhOVXJDh0ybU2VECjlgfn+Jq5zUmeT390hx+K5lHW1jFa7qPOmqTPqIiHAX9nwXPS
	 dSKOBrU1hzXjVj5ffIvkgJHPXSX0Ir3IXKCszBfIWcFfrGniNPq5Z5w6lVsAiiRoJhuU4
	 ClPYVH4r6LQGl2kSa05CgWX4QvV/G1KTu7cY1oKCT8gwbL0swIESwRodCdB3O06mZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEr113MZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F58606A31A;
	Mon, 23 Nov 2026 06:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEr113MZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC351F000C6;
	Mon, 23 Nov 2026 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416333;
	bh=ixmwBow0FK9VaNmhGL5HuCR4NwR5tANQhiSxUDqh2BA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SEr113MZraaiSKBxuqwtfO/CuTk9qTP3MkcZCjHN7cmZMKxsgaVO/fXaMUNdlPiU4
	 AzxDd/YSviZmujlvnEUKjL5Nkuwjsown37xsV5DYqSZw25fS7bix7Gk+7L6Xv3GtpI
	 57BjgMIPdPAIWzXxvjkhAj8kpNoXIaldvF+oi6r4uPSLnVpigxQIn+IF7fU3OyFE+T
	 zbipMtRV7rk10uo5C+l2qwb5bJIviyDLiZJgX47/QzK+vT5YLa9AxvjHIcW4wq768Y
	 xf++G9Wxs55QAxYR3vOdQ368NeUWIcjCzQWFuFT/9H5Xb88LAMPlplVajvzrrncIOQ
	 TkCrywGlrfuJg==
Subject: Re: [PATCH net v2] net/sched: cbs: fix 32-bit overflow in
 transmission time estimate
From: netdev-bot+sashiko@kernel.org
To: mhm.dawod@gmail.com
Cc: netdev@vger.kernel.org, vinicius.gomes@intel.com, jhs@mojatatu.com,
 jiri@resnulli.us, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ye.zh-yuan@socionext.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 06:45:32 +0000
Message-ID: <179541633265.3135.10106837987470065643@kernel.org>
In-Reply-To: <20261122064155.2094434-1-mhm.dawod@gmail.com>
References: <20261122064155.2094434-1-mhm.dawod@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix only works on older kernels.

--

net/sched: cbs: fix 32-bit overflow in transmission time estimate

This patch casts len to s64 in cbs_dequeue_soft(). Without the cast, the
len * NSEC_PER_SEC product is computed in 32 bits on 32-bit architectures
and wraps. The commit message says this restores idleslope-limited
throughput for software CBS on 32-bit, and includes before/after numbers
measured on a BeagleBone Black.

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
On this tree, does this change alone make 32-bit throughput follow
idleslope? The same kind of 32-bit wrap still seems to happen when
cbs_change() stores the sendslope:

net/sched/sch_cbs.c:cbs_change() {
    ...
	WRITE_ONCE(q->idleslope, qopt->idleslope * BYTES_PER_KBIT);
	WRITE_ONCE(q->sendslope, qopt->sendslope * BYTES_PER_KBIT);
    ...
}

Since commit 000db9e9ad42 ("net/sched: cbs: Use units.h instead of the copy
of a definition"), BYTES_PER_KBIT comes from include/linux/units.h:

#define KILO	1000UL
...
#define BYTES_PER_KBIT		(KILO / BITS_PER_BYTE)

That makes it an unsigned long. The old local definition was (1000LL / 8).
On ILP32, the negative __s32 qopt->sendslope is converted to unsigned long.
The product wraps modulo 2^32 and is then zero-extended into the s64
q->sendslope.

With the setup from the commit message (idleslope 10000, sendslope -90000),
q->sendslope comes out as +4283717296 instead of -11250000.

In cbs_dequeue_soft(), credits_from_len(len, q->sendslope, port_rate) then
adds credits after each packet instead of taking them away.
cbs_enqueue_soft() only resets positive credits to 0, so q->credits < 0
never becomes true. The idleslope throttle and delay_from_credits() never
run either.

That leaves the q->last gate fixed here as the only limit. Wouldn't
traffic then go out at about line rate rather than at idleslope?

The "before" numbers in the commit message (11.1/25.0/42.9 Mbit/s) match
idleslope * port_rate / |sendslope|. That only works with a correctly
negative sendslope, so were they measured on a kernel without 000db9e9ad42?

Because of the Fixes: tag on 961d0e5b3294, this will go back to stable
trees. On 32-bit kernels from v6.8 on, software CBS would still do no
shaping after the backport.

cbs_dump() also hands the wrapped value back to userspace:

	opt.sendslope = div64_s64(READ_ONCE(q->sendslope), BYTES_PER_KBIT);

A configured -90000 reads back as 34269738.

cbs_set_port_rate() has the same unsigned long multiply:

	port_rate = speed * 1000 * BYTES_PER_KBIT;

On 32-bit this wraps for link speeds of 34360 Mb/s and above. For example,
40000 Mb/s gives 705032704 B/s instead of 5000000000 B/s. That port_rate is
the divisor in the expression this patch changes.

Could these be widened as well, for example (s64)qopt->sendslope *
BYTES_PER_KBIT, (s64)qopt->idleslope * BYTES_PER_KBIT and (s64)speed *
1000 * BYTES_PER_KBIT? That fix might need its own Fixes: tag for
000db9e9ad42.

If not, should the commit message stop saying that 32-bit throughput
becomes idleslope on current kernels?

>  
>  	return skb;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122064155.2094434-1-mhm.dawod%40gmail.com
