Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216445;
	b=Bh9z2nOnnLh+U+z2nCbBU8pwpkgERwIegPtC+p0/rbayQvzILoj/PiR3pexFtbwKbEAR
	 +NVGKdCXv6cDJOnmO7Qlmq2wQKL0wxvXZYd9mThSrncJPEZ3cQSAddsYpN0eo/Tlrmqmy
	 rSbbXLbcme4daChobEDoYxr/PY8sVdh/0BXvjv+ZI2ilmtrVWCfFUKxORu19DUyaMDM3b
	 CUnbP2lSPb3w3ATCInD20E1WlJ1jlU3caUT2Sry6F08ptxadUIjOj7Ok+foAbTlYboIqf
	 nokpAo1e2uyK0nvxHaZjPBraVF++pgAwwZ5g4wUN8Rm+y/v6yz15E3aTq5Hd+RyoYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216445;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pbzULJXRQ2wCr9lbRVnvc7ssE8ui2PghOhpvECt+S+Q=;
	b=sNqHSmrP3mi+tL9xNJHc1f56xm2LqEXBNusd8kzLkkgDMXP8XI3VyNKxIXWHKilTeV+N
	 DyWZKghbCkSbt6a53u5ShZXiCyaaE2C3ZwG2P15byXCxCTlmxQo9Pk0YD/160KoWu2Rjk
	 LrCN/2+ONw4d8h20eJPGePAoHMlJyVhJkDWlGfSpT0gToB73FWYFhvwDCTisGZq3+MU5B
	 3HMKop04j/GQreG+W4rNXuG6t+6jBvZZW5BqBeisKdfPgQV48VSAm0GKUFrHdRxdm2erv
	 OEcPsN5VMgquXAwUAbXWNRx7SPRlpHpGlCdWsLSq0g3R5LazaZqyml9PZWnMP1Z2IJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d3DcsOsC;
	arc=none smtp.remote-ip=91.218.175.41
Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F999606A687
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F999606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d3DcsOsC
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pbzULJXRQ2wCr9lbRVnvc7ssE8ui2PghOhpvECt+S+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795216442; v=1; x=1795821242;
 b=d3DcsOsCTUNgEzkQJDeozoJsEypOyZErLY2SAyZkW//ipSFsc/+IKBqwjoQ57NZLaxCBRzoK
 2qeeM0XIx90k628u8yiLjsT8DwXfzxwR0WkIgExg78sP0MXAgN1pC8hMOzVscNrlnj3x8BEWEQw
 6H6eHumAVMKS1ZQUaHn8fWvA=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 625310cc214a2384;
	Fri, 20 Nov 2026 23:14:02 +0000
X-Mizu-Trace-ID: 625310cc214a2384
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Ralf Lici <ralf@mandelbit.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	idosch@nvidia.com,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	razor@blackwall.org
Subject: Re: [PATCH net-next v4 2/4] ipv6: take fib6_sernum from a sequence shared by all netns
Date: Fri, 20 Nov 2026 18:13:53 -0500
Message-ID: <20261120231353.4189980-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120175241.289834-1-ralf@mandelbit.com>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev> <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev> <20261120175241.289834-1-ralf@mandelbit.com>
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

Hi Ralf,

On Fri, Nov 20, 2026 at 06:52:41PM +0100, Ralf Lici wrote:
> What the atomic_set
> changes is the ordering. It comes after the full barrier of the cmpxchg,
> so nothing orders it before the node stamp in fib6_update_sernum: a
> reader can sample the new fn_sernum while still reading the old
> generation (this one is allowed on arm64).
[...]
> The late store also loses the guarantee that a reader seeing a value
> sees the routing changes published before it.
[...]
> Drawing from the shared sequence but publishing with a cmpxchg on the
> per-netns counter keeps both, at the cost of a wasted draw on
> contention:

Thanks for the careful review. I wrote both cases as litmus tests and
herd7 agrees: the stale generation and the late store of a smaller
value are both reachable with atomic_set() and forbidden once the
value is published with atomic_try_cmpxchg() on the per-netns counter.

> 1/4 has the same pattern for rt_genid, and IPv4 bumps can run
> concurrently too, since xfrm policy insertion does not hold RTNL.

Right. I'll publish with a cmpxchg in both 1/4 and 2/4 in v5, as you
suggested, and Cc you on it.

Thanks,
Qiliang
