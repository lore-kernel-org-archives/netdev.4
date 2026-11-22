Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329830;
	b=4Z1EZy6ytuf1AhUxybewAHmI+v7OM0X0o1hEJ17aWlqaVvcaQM9355ByduEo/yOuMb6u
	 cRqpVt5IFxheAoqqJWA0l/S84ZaxUXcnnWYhxAVvZD98XvJKWG352onkefXffSko/+Xs0
	 G7mQNbw/y/+rHIvoUBqXfZwJrkwTqy9/ZLDDVy02TQ0Z30VzDr2QP8iNqk46+HGTAKwXt
	 hSOXl2V3S2WH+7U60Rq5IohZ3COzfukxZo0FwwTpsmJOq7+tJHqCQgEgzO764Xl5ujTtR
	 PESQMnss6GhUVFXrLYSTg7tuL1p/lao+M9iaK4peKRM2xpnaVi/QQj+lcFklfluJCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329830;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vbrLxU5mgE7XQIaB9a0KAg9+006vceFhqLf9QqNknrw=;
	b=TdpJXvqLGJEjrLHyY+KP4lmr4nW0TU2mYWHcrpJiPGxM3PsmZqHAPp1McKWPIMtsQr83
	 EYpadIPYrE2LKntSqSdfxhXbxoIAgy01eSfZfM1nOdpoM4/Qpq1gtrGC2E1U821R1N1/7
	 T8gv8dnjNTShGtCkF8SanpM5ZTNOTBYbYNM8ZqJ0V8vYSiFxN4Ku1v2zcUlhx53BCMu/Q
	 DPKmzRR0/5F60WwXRpUG97ug7Innn4Ijmu/TGzAGm9sxPxYA3kXb/ol8+kDvJ7BcKYmrg
	 2huiJmgHXKXMzKJ6Esbw1fho2/sAT102UrGeAOKGd2i6my/OhSqxPApFTOS7yEzjWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXsm5kuV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDDD606A320;
	Sun, 22 Nov 2026 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXsm5kuV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3031F000C0;
	Sun, 22 Nov 2026 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795329829;
	bh=vbrLxU5mgE7XQIaB9a0KAg9+006vceFhqLf9QqNknrw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SXsm5kuV7kI7wmBaZOqso+l0MyJ91Py1I9/ks2zs4GQSItymYCVto70amvRl5wtIM
	 +yfQqcx7FI+GlJCpYwNifTYezOTGcnNiO8NkHQZhb+Oixp9rFl+0TOWcYokOvHFjxD
	 gp/MI4ogsNzESoeOwv4EpziPPiIM1+wHKohlWN9ioc/uIodm7jylFYR29b5FrsTmhq
	 bpQ0NNbMjpKReOoVm054LgiU151Ds9oDanmhMD5JTQ479rNnErWY+LFcjvuSfJe5wn
	 RQUcl3yX49Zin6RWm1SFntG2W/kWC6I2XeWshGpPo4u2IUQpuGJLZk6a9H78bL+CQL
	 VJeAteMmhlV1g==
Subject: Re: [PATCH net-next v2] net: avoid hashing the namespace pointer for
 device names
From: netdev-bot+sashiko@kernel.org
To: zcliangcn@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 06:43:48 +0000
Message-ID: <179532982886.3135.5724232196629661925@kernel.org>
In-Reply-To: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
References: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
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

- [Medium] The patch fixes only dev_name_hash().

--

net: avoid hashing the namespace pointer for device names

This commit changes dev_name_hash() to call full_name_hash() with no salt,
where it used to salt with the struct net pointer. The goal is to stop
unprivileged users from recovering init_net and the kernel text base by
timing name lookups that collide in the hash table.

> diff --git a/net/core/dev.c b/net/core/dev.c
> index d88af07aea290..12100fbf9022a 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -195,7 +195,7 @@ static inline void dev_base_seq_inc(struct net *net)
>  
>  static inline struct hlist_head *dev_name_hash(struct net *net, const char *name)
>  {
> -	unsigned int hash = full_name_hash(net, name, strnlen(name, IFNAMSIZ));
> +	unsigned int hash = full_name_hash(NULL, name, strnlen(name, IFNAMSIZ));
>  
>  	return &net->dev_name_head[hash_32(hash, NETDEV_HASHBITS)];
>  }

[Severity: Medium]
This fixes dev_name_hash(). Is there still a similar name hash in Open
vSwitch that uses the struct net pointer as its seed?

net/openvswitch/vport.c:hash_bucket() {
	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
}

jhash() takes a u32 initval, so the seed is the low 32 bits of the net
pointer. On x86-64 those low bits contain the KASLR slide of init_net.

ovs_vport_locate() then walks the bucket with strcmp() and net_eq(). The
lookup time therefore depends on whether a probe name shares a bucket with
a resident vport:

net/openvswitch/vport.c:ovs_vport_locate() {
	struct hlist_head *bucket = hash_bucket(net, name);
	...
	hlist_for_each_entry_rcu(vport, bucket, hash_node,
				 lockdep_ovsl_is_held())
		if (!strcmp(name, ovs_vport_name(vport)) &&
		    net_eq(ovs_dp_get_net(vport->dp), net))
			return vport;
	...
}

Unprivileged users can reach this lookup with a name they choose, since
both commands use .flags = 0:

  OVS_VPORT_CMD_GET -> lookup_vport() -> ovs_vport_locate()
  OVS_DP_CMD_GET -> lookup_datapath() -> ovs_vport_locate()

Take a host with OVS vports in init_net, such as ovs-system or br-int.
Could the collision-timing method in the commit message still recover
init_net through this path? It has not been shown that one extra strcmp()
can be measured through genetlink, which adds more timing noise.

A grep of net/ suggests this is the only hash left that uses the net
pointer as its seed. The commit message doesn't mention it.

dev_table is one global table of VPORT_HASH_BUCKETS buckets, shared by
every namespace. Would it need a random seed instead of NULL? Options
include get_random_u32() in ovs_vport_init() or net_hash_mix(). This
could be done as a separate follow-up.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn%40gmail.com
