Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104766;
	b=txUQY6RH9WmwdP/Ctmnrth/TnPzXuhO2hpP0asIkrzXQmxmfkbS/utzJtErqk+cwx8gv
	 LXoEeRGvcgD275IpJ7MfriXt4LYU2WKODnVKfvVlM/qbGA91TEZelLvq3qBjIoheVnBFs
	 4EmunLujrL/KFEZiPd2pyJPR8QMYBu5/QefTdTbGD23RIGMXLdKr0x6skRy7Awu7BEq4O
	 itFwOg8IeHmvz1rZCKAvl0uxJmIULCorS30pc5R/k5X0WFv7yXZQeI8qvEes4tSO9jqcp
	 YQX9jBiiv5MfHpoBFbORUVRpT5PvCP8l9xKdn2fW/sfQfB1yjjutEIVd7Kq0wxQtkMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104766;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cznu7/FJf5X6yA8PX2MK/dNb3k5+oDDvUDyT6bScaDk=;
	b=wRks5/TffaoYq3APtA8M/6HbKS5m5CKGn0tNPVRYKDk+fkK7TmoIr8ko1bJ+SEkmWXbB
	 M/l0Arl5MOQDLoiHuYuM3Q3oJtzY+UuT2kM9xb4dFGYIKSp4CeBG69e5/YR/LwjUQPsP7
	 6IVYyk3QjDyNJ/MbT00k4KZRPSo8IooCn8hwRIdPJ97xJ1WksJvGrOSuM0NH6RYepky+E
	 iH1TNrALl7R4MsVKyoLzFRtp/i2QVEHVIt7bTNCPj3oOYJZCwAKpaCb1Vx5LDI4EzL+2Z
	 seOI4uRSgqQ8IhYnthuHsnjAlMe0UOUbiqcv5H3OlOoqhyquHBJ/n8L2xNhxgeV95pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkOC4kD0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CEF606A320;
	Thu, 19 Nov 2026 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkOC4kD0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FBF1F000C7;
	Thu, 19 Nov 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104765;
	bh=cznu7/FJf5X6yA8PX2MK/dNb3k5+oDDvUDyT6bScaDk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bkOC4kD0LhiZeN4Uli/ZwTrewOsKke9SpIvQAfaLu9fZNjL/k/vMYywG/5gMQxf3Z
	 bVZYzJ5If6KyWfAaAoFiuhqjdeKonkvnUYbFSdXXKhucO+66OMpPJxvgyMLCuTwfRc
	 Snp3k0PrWCQSx8hFGA4QlefSO4jwPhuRoRLXsj1//0JnQvi20LWa5H6Qa0+i/f2fDX
	 GuOj9Fv6PdwEdWqcSScEj51oq589gPTB+ASR6MougyL7ehVONdi3aGQy9qGgv6EMtE
	 /LXG68E1SVdAqFjs7Iq0uXq/3CXoFaT0NwHYGgUvCeNwL4mpiSuLDPhtFXZso2wUFm
	 UHxgiXj9rA7nQ==
Subject:
 Re: [PATCH net v2] tcp_metrics: hash the destination address with SipHash
From: netdev-bot+sashiko@kernel.org
To: juanagusnicco@gmail.com
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 16:12:44 +0000
Message-ID: <179510476492.3136.15185317023274420078@kernel.org>
In-Reply-To: <20261117041029.80543-1-juanagusnicco@gmail.com>
References: <20261117041029.80543-1-juanagusnicco@gmail.com>
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

- [Medium] In net/ipv4/tcp_metrics.c, tcpm_addr_hash() hashes only the
  peer address, with one global key (tcpm_hash_key) shared by every…

--

tcp_metrics: hash the destination address with SipHash

This commit changes how a tcp_metrics bucket is picked. It used the
ipv4_addr_hash()/ipv6_addr_hash() fold of the peer address and now uses
SipHash of the address with a random key. The goal is to stop attackers
from computing colliding addresses and recovering net_hash_mix(), which
is still XORed in afterwards to separate namespaces.

> diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
> index ae551546422fe..1d6c88bc35cc8 100644
> --- a/net/ipv4/tcp_metrics.c
> +++ b/net/ipv4/tcp_metrics.c

[ ... ]

> @@ -95,6 +96,22 @@ static unsigned int		tcp_metrics_hash_log __read_mostly;
>  static DEFINE_SPINLOCK(tcp_metrics_lock);
>  static DEFINE_SEQLOCK(fastopen_seqlock);
>  
> +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> +
> +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> +{
> +	net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> +
> +	if (a->family == AF_INET)
> +		return siphash_1u32((__force u32)a->a4.addr, &tcpm_hash_key);
> +
> +	return siphash_4u32((__force u32)a->a6.s6_addr32[0],
> +			    (__force u32)a->a6.s6_addr32[1],
> +			    (__force u32)a->a6.s6_addr32[2],
> +			    (__force u32)a->a6.s6_addr32[3],
> +			    &tcpm_hash_key);
> +}
> +

[ ... ]

> @@ -329,6 +342,7 @@ static struct tcp_metrics_block *tcp_get_metrics(struct sock *sk,
>  		return NULL;
>  
>  	net = sock_net(sk);
> +	hash = tcpm_addr_hash(&daddr);
>  	hash ^= net_hash_mix(net);
>  	hash = hash_32(hash, tcp_metrics_hash_log);

[Severity: Medium]

Is net_hash_mix() still enough to keep the namespaces apart here?

tcpm_addr_hash() takes no netns input and uses one global tcpm_hash_key.
So S(addr) = siphash(addr, tcpm_hash_key) is the same in every netns. The
namespace only comes in after that, in tcp_get_metrics(),
__tcp_get_metrics_req() and the netlink paths through __parse_nl_addr().

For two namespaces A and B, the bucket maps then differ only by the
constant mix_A ^ mix_B. That constant is applied before the invertible
multiply in hash_32(). This is the XOR-then-multiply structure the
changelog calls not a PRF.

tcp_metrics_hash is global. A local user who owns a netns (a container,
or unshare -Urn where unprivileged user namespaces are allowed) seems to
have both oracles the attack needs:

  - tcpm_new() reclaim reuses the oldest entry in the bucket no matter
    which netns owns it. So another netns, such as init_net, can evict
    the user's own entries.

  - TCP_METRICS_CMD_GET has no GENL_ADMIN_PERM and the family is
    netnsok. tcp_metrics_nl_dump() returns the caller's own entries in
    bucket order.

Because S(X) is shared, take an address X that the attacker controls.
If X collides with a victim address V in the attacker's own namespaces,
it also collides in the victim's netns.

Another route is to solve for mix_A ^ mix_B from cross-netns evictions.
Either way, the attacker could watch V's bucket in the victim netns and
tell whether V connected.

It isn't clear how cheap this is in practice. The S-collision route needs
on the order of 2^32 own-netns tests. The other route needs more than the
few hundred answers described for the remote attack.

Still, the changelog says:

  net_hash_mix() and hash_32() are kept, to separate
  namespaces and to reduce the result to the table size.

With this construction the namespaces don't get independent bucket maps.

Could the namespace be part of the keyed hash input instead? For IPv4
that could be siphash_2u32(addr, net_hash_mix(net), &tcpm_hash_key), and
IPv6 could add the mix to its input the same way. inet_ehashfn() does
something similar: it feeds net_hash_mix(net) into the hash seed instead
of XORing it into the output.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117041029.80543-1-juanagusnicco%40gmail.com
