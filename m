Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508066;
	b=vGIbFuoC8aTxGRpF6nAGov9AmrohXAbVP1uOq0BR6lbplPMUi01LhuGSW/MtglQOitv9
	 Sp681O/F+3fzO1AcuqtnJwiYUt8fr0zeSi3VYzbauw7QJq2bXPcnR7lOJgV3ty2HpA0P0
	 80UlsuEdw+fw2DmX2l88+n2YgrDP0imB5YBbwznft+/Lc4Bg/Iia9SUdg4nuamOBb8otH
	 k+140pTdLFrFfuDrUU+s44HPdawUPo5W3UfjjTM1n5LGN4jY0MP6yBlHYOzKTUMazGD+o
	 qmTJKU9Nm4rWPcj9qN3RmpwJMkVJwPSyMrwHx2kEnORnTrC2EE+MvrwDqMAg6dJB4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508066;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kfltlB9NCcy9vKbBCxbWs8QRvF7YM4v7UlkDXRS0nns=;
	b=AkQeerkapBqoU0Yr+GEq9KV9bzQQA5dmOOdy7hhTkV8vnJecPgfqXNg8KC+nExaeYvP4
	 jlx1SuyO3V4qgeFUhdZshgzuXJ/mmVjGk8ZbIjmv8lDo5heWxJakRy9MxS6eL/PFgdOpg
	 FcfGu8y9lRjzGkQJoE0GRJHYqW4Ia6PnggXTumcO9efxEPFD6VtHwi/gxroAIvCVlzGGD
	 STYXZldp2sMeczOxAGyBEmg9oB35SSOLyJpfenT1XckdvwcWDvcmG/LDmtKVcCgS03vy9
	 1no5I/c949H7qUJo1sQMvs/Yn7r4KCGarxAmO8qrX6Z42ec0p+/ydjwnHSTiTzTNfvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4IN5ZYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88180606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4IN5ZYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20751F000D4;
	Tue, 24 Nov 2026 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508065;
	bh=kfltlB9NCcy9vKbBCxbWs8QRvF7YM4v7UlkDXRS0nns=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B4IN5ZYLIsc1M6tFHxtBPQgflqWxFMC01nt0DfEhA8BNyGxF2VuwTB5XlPUjDOp+E
	 RdK6KLZFZZiOg+LXfVx+8Qmu+8WmXDhJ7oLOTBcSTAmS0dHZV+3AGbdwbWVP0zmqIm
	 pnbDCczjxHtq288gytnClbN43MHCh9Jn844GES3fXdsTUEM7RVjNLkD831C8DZ/utp
	 1GA4Xv9m1OdYJpjxmeFRoUS5Xy/h6hU1XY50gu+Giq7izzHzE2/VBodUFm0dePxywW
	 fGpc2LEFrphw/5JA31LizURuPSC9NxwrKZ8ANFd0dF6wgLJSfA3U0D3bk/ytrwuTXX
	 Xhgxikq/ciH6Q==
Subject: Re: [PATCH net-next v6 3/7] tcp: fix unreadable net_iov handling in
 tcp_clone_payload()
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sdf@fomichev.me, kaiyuanz@google.com, willemb@google.com,
 daniel@iogearbox.net, josef@toxicpanda.com, sdf.kernel@gmail.com,
 dtatulea@nvidia.com, asml.silence@gmail.com, bobbyeshleman@meta.com
Date: Tue, 24 Nov 2026 08:14:24 +0000
Message-ID: <179550806424.3135.7651051023866457294@kernel.org>
In-Reply-To: <20261120201408.3445445-4-almasrymina@google.com>
References: <20261120201408.3445445-4-almasrymina@google.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message explains how the bug works but not what it
  does to users, and it calls the bug "theoretical".
- [Low] The commit message says the fix was "Verified with the net_core
  KUnit test suite".

--

tcp: fix unreadable net_iov handling in tcp_clone_payload()

This patch makes tcp_clone_payload() copy skb->unreadable from the write
queue skbs into the MTU probe skb. It also changes the frag merge check
from skb_frag_page() to skb_frag_netmem(), so that two different
unreadable net_iovs no longer compare equal as NULL == NULL.

> This issue is theoretical and was found by manual code inspection and
> LLM review; it was not triggered in production. Verified with the
> net_core KUnit test suite; not tested on real hardware.

[Severity: Low]
The message explains how the bug happens and calls it theoretical, but it
does not say what users would see. Could it describe the impact, so that
stable maintainers can judge how urgent the fix is?

Before this patch, the probe skb built by tcp_clone_payload() could hold
devmem net_iov frags while to->unreadable stayed 0. In
validate_xmit_unreadable_skb() in net/core/dev.c:

	if (likely(skb_frags_readable(skb) ||
		   dev->netmem_tx == NETMEM_TX_NO_DMA))
		goto out;

So the probe would skip the NETMEM_TX_NONE drop and the binding device
check. Other software paths that use skb_frags_readable() as their gate
would also treat the net_iov frags as pages, and skb_frag_page() returns
NULL for those.

The NULL == NULL check could also merge two different net_iovs into one
frag. This happens when one frag ends at offset X in niov A and the next
frag starts at offset X in niov B. zerocopy_fill_skb_from_devmem() takes
these offsets from the user's dmabuf iov addresses. A user can therefore
set this up, even with two iovs in a single sendmsg().

In that case, wouldn't the probe send the bytes that follow in niov A
instead of niov B's bytes? That would corrupt the TCP payload and send
dmabuf bytes the user never asked to send.

[Severity: Low]
Can the net_core KUnit suite actually run this change? tcp_clone_payload()
is static in net/ipv4/tcp_output.c. Its only call path is:

tcp_write_xmit()->tcp_mtu_probe()->tcp_clone_payload()

The only TCP test in net/core/net_test.c looks like
netmem_ref_test_tcp_devmem_recv(). It covers devmem receive and never
calls tcp_mtu_probe().

Would it be more accurate to say that the changed path was not run? The
other option would be to add a test that drives tcp_mtu_probe() with
devmem skbs.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120201408.3445445-1-almasrymina%40google.com
