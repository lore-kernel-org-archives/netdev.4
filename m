Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197174;
	b=oEyASlJKoaZGaX9pbXDPJOT3jD31zIfccN7ry287jLtd4YWx1KAcmDX8xb47Qn6lG7Rd
	 1bHUbmtsGeI3lzzUZloA5b/ZpTxIKHg/fJCBTj7B0aw+ZrP4K5DxEBlsM+GxzGu8T4gdb
	 vAxlizIeWC+h3GQEmsQdUVLtUmbHGhoA145xhHe25UFh8ZhPYdWOgjqOmPJnj7LiSDEJy
	 dhFDxNFYncR6xDFvbe5ABS2XfRXlXJ10G2S1rUha7SV4CnpsyYnD3kMdO1bKGpBRjE3QF
	 m/X+5Kk6H+tZc4wR61ND61XA2LMILxiqZ5NvXnP8DP4Jdz65Y7fFZswFU0QZdMQvGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197174;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=lS4PH3pwJigP6vQkCo1ANPeGs5eVG6653IQY7i2B+EU=;
	b=TDcnfFK7paopEFCFfiAVmwuXHqnsaMEBbRUSBwiLmOrkGvt3azca0CW/xMzYAcWR5/5U
	 v2ViSOBLWZAdFK9jwD8wqy8pdKXIT2wxrESIY71xJETxZ8iPMECSEvx2q9wvK1RbIHMUB
	 gDnyNWhdKwIIC6WSL6vaNubbMTCOp3hWplqBBzPj5mNDXeFDtmfJNDt7RR1G7gn94EI87
	 weQ3LZN22qQIJXPJ+Z5ZCx9lqV7yB8PIJCwYgXEckc4YhS1frQFcVeAvbIsBajaggOjwk
	 6vQzJQX77+TR1wOMmls525M2mu3xLyHXI1SyLPSUB7RaSwgWNUfbzuclaDU335XV5OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=X1ZwIyo7;
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038E606A320;
	Fri, 20 Nov 2026 17:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9038E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=X1ZwIyo7
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jWNGS6gMfzNkP3;
	Fri, 20 Nov 2026 18:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795197169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lS4PH3pwJigP6vQkCo1ANPeGs5eVG6653IQY7i2B+EU=;
	b=X1ZwIyo7TbdvlBKh4Aw8Cd9ZbMZOjfoajtescUoc8lhq25AcqmP8tUQOQxBhP5PT/hgWEJ
	DJsQoBD1F7MVRyk7ABf1Je9B/GfWKJAeOq/+qvpUftZKLEyG7CMPzyg0ZZD17X52oMz5mN
	Ud17JICwoZrUcFna+zp+4e4hQL0fF4TGkjV2TNSXsbFNWx/KWhp9NeK7XI5s7+tIl0MC24
	3dbcJzpQUTJe3S/3J/NCLI2ahza2YiCaHj+o8LuZUNswsFzuKSlaevkxiFdpfEmyLX0/4X
	1Eb2lhHtfRb3Z7fLdDHOTOAW+FJ1DIDOdiW87hMKZOgAzhJxSZH8rR09UOkjJg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net,
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
Date: Fri, 20 Nov 2026 18:52:41 +0100
Message-ID: <20261120175241.289834-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev> <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4jWNGS6gMfzNkP3

Hi Qiliang,=0D
=0D
I stumbled upon this series while looking for what caused a conflict=0D
patchwork reported on one of my series [1], which touches the same code.=0D
=0D
On Tue, 17 Nov 2026 21:28:31 -0500, Qiliang Yuan wrote:=0D
> 2^31 bumps. fib6_new_sernum() callers only hold their own table's=0D
> tb6_lock, so two tables of one netns can store their values in either=0D
> order, and fib6_sernum is no longer monotonic per netns. It is only=0D
> compared for equality, so this costs at most an extra invalidation.=0D
=0D
Eric raised this on v1 [2], and for the equality checks I agree: values=0D
are not reused, so a stale value cannot match. What the atomic_set=0D
changes is the ordering. It comes after the full barrier of the cmpxchg,=0D
so nothing orders it before the node stamp in fib6_update_sernum: a=0D
reader can sample the new fn_sernum while still reading the old=0D
generation (this one is allowed on arm64). Nothing in the tree compares=0D
the two today, but my series relies on that order, since it brackets the=0D
lookup and cookie sampling with two reads of the generation.=0D
=0D
The late store also loses the guarantee that a reader seeing a value=0D
sees the routing changes published before it. With the per-netns=0D
cmpxchg, each update reads from the previous one. Here, CPU0 can draw 2=0D
and stall while CPU1 links a route, draws 3 and publishes it, and then=0D
CPU0 stores 2. LKMM allows a reader that reads 2 to miss CPU1's route=0D
(x86 and arm64 forbid it in practice), and a per-cpu dst of a nexthop=0D
object allocated from that lookup records 2 and passes rt6_is_valid=0D
until the next bump.=0D
=0D
Drawing from the shared sequence but publishing with a cmpxchg on the=0D
per-netns counter keeps both, at the cost of a wasted draw on=0D
contention:=0D
=0D
static int fib6_new_sernum(struct net *net)=0D
{=0D
	int old =3D atomic_read(&net->ipv6.fib6_sernum);=0D
	int new;=0D
=0D
	do {=0D
		new =3D fib6_sernum_draw();=0D
	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));=0D
=0D
	return new;=0D
}=0D
=0D
where fib6_sernum_draw is your current loop on fib6_sernum_seq. I=0D
checked both cases with LKMM litmus tests: they are reachable with=0D
atomic_set and forbidden with the cmpxchg publish.=0D
=0D
1/4 has the same pattern for rt_genid, and IPv4 bumps can run=0D
concurrently too, since xfrm policy insertion does not hold RTNL.=0D
=0D
[1] https://lore.kernel.org/netdev/cover.1795166508.git.ralf@mandelbit.com/=
=0D
[2] https://lore.kernel.org/netdev/CAL4WiioL+wiv3jgqeT1qiZ2mGWQ+HV+mEQP2K0a=
FMCpjDvwYDg@mail.gmail.com/=0D
=0D
-- =0D
Ralf Lici=0D
Mandelbit Srl=0D
