Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777453;
	b=pbNbDVVUHzMSfEXAKCeZ0pemqGkf8O9soGV83HFlQEtSeDo5gIS6MNuOZFrFUTsIi5vq
	 ztaiVYjA71MA9NrRbsesatyoU4g/EkFgTW0PukoTAD1wIVbV7eMi85Hm+XD168Rc98T/B
	 TZrR4Zea9RFC7cD7GK5VH37pOTtS+PgwdFaGqAZFz46Lndi7fBOOqSrd2DUdEHaiK2ogb
	 cFmCVVGSnhhGuhxPTpar7ogSAmwoXXEYsOm+1dS8X7Ssj7x6+Pz876PFe/ScNDLQzuvyf
	 dYnldNv/HUTOZSZQw2QjcaGdZmvKYel0h/cYH0OaIATvY5jcciPJZrNh+tzqrDOXIbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777453;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=NM47riWltiuXEys5rXW5mtqRsob8civcAay742/x4/c=;
	b=AuD5xuN0wWy51MB9ssmF6PHSNV2XfKC4njMDmDI7P80NvtdrtW3ELWLRlBNxADDyF3ry
	 QQQfio+Pxyv0aposNFUqtQGCO3HRt0tu/veib7wfmIDH0csbn013QuQFbkY6dl5euOkBi
	 txQC6Llg2pQPP5GkVKY7T5Qpb9sfjKIfQB1feeBMjXzuimhshZebMw9gPRsweMbLS2igD
	 /3jDnyEuyA/YojMfqKQaUpvfKalGwYgu2LbukgeLt2GXKDhyAIM1iZVU8nND/3/bj2rOd
	 Rmpy46mPLn7peTiCM5vkMDxqkGaf2NZkp+16SaRER8l08+NyXlxYYA50oBeY2dNsQwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=QJBfDGLA;
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85D7606A681
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85D7606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=QJBfDGLA
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jbVs21pPsz9vDD;
	Fri, 27 Nov 2026 12:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795777424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NM47riWltiuXEys5rXW5mtqRsob8civcAay742/x4/c=;
	b=QJBfDGLA+FYAX1OM6HAPoz6YixZJ2gTObaamZvBtyCNKtyMwZGUot0wCcJcOi4ffUYcA4Q
	Vql7zUKZVHKmoSj4WhhxWanj9NS6mwVIavy+xFivjiGrtNGZjC5fSIY1lMmUttKB/oRpcu
	tOvUxoqd7LvcP6+WPCTF2gKHhfB0nF4ie+kC5c4rl8QxClSud3CjqAA92yHEux3T1dmJyM
	t41045vHzBvh2S3bS3GzPp+5D8osZEX63bDwu0lo42Jgd36wwQTq77I0IjivyfUBug51K1
	ZrGczkjqbmOmpjHBGjrCuHYeNRxr/+bThRxIWOz1EeoPfINQnhf+hdc6IH5+gA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: Re: [PATCH net-next v2 06/13] ipv6: validate dsts against the netns route generation
Date: Fri, 27 Nov 2026 12:03:19 +0100
Message-ID: <20261127110319.354669-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <52846eb18319fc2841ffa6dbb32abcc898eca8df.1795642432.git.dahern@nvidia.com>
References: <cover.1795642432.git.dahern@nvidia.com> <52846eb18319fc2841ffa6dbb32abcc898eca8df.1795642432.git.dahern@nvidia.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jbVs21pPsz9vDD

On Wed, 25 Nov 2026 18:33:32 -0700, David Ahern <dsahern@kernel.org> wrote:
> @@ -1476,7 +1483,11 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
>  
>  	pcpu_rt = this_cpu_read(*res->nh->rt6i_pcpu);
>  
> -	if (pcpu_rt && READ_ONCE(pcpu_rt->sernum) && !rt6_is_valid(pcpu_rt)) {
> +	/* A dst stamped with an older genid stays stale for everyone still
> +	 * holding it, as in IPv4. Never re-stamp it; drop it and build a
> +	 * new one.
> +	 */
> +	if (pcpu_rt && !rt6_is_valid(pcpu_rt)) {
>  		struct rt6_info *prev, **p;

This now evicts the pcpu dst of every route after any generation change,
and the eviction still drops the slot's reference right away
(rt6_uncached_list_add and dst_release from 02/13). A reader that took
the dst from the slot without a reference can then see it freed, when
the only other reference is the child reference of an xfrm bundle:

1. Bundle X, whose child is the pcpu dst P of CPU0, drops its last
   reference, and dst_release queues dst_destroy_rcu.
2. After that grace period has started, a lookup with
   RT6_LOOKUP_F_DST_NOREF on CPU0 gets P from the slot inside its RCU
   section, and is preempted (PREEMPT_RCU) before dst_hold_safe.
3. A lookup on CPU0 after a generation change evicts P and drops the
   slot's reference, so X's child reference is the last one.
4. X's grace period ends without waiting for the first lookup, and
   dst_destroy(X) frees P with dst_release_immediate.

Mainline only evicts nexthop-object dsts this way, and
fib6_nh_release_dsts has the same pattern, as Sashiko pointed out on my
v5:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795537128.git.ralf%40mandelbit.com

-- 
Ralf Lici
Mandelbit Srl
