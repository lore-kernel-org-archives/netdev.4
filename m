Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308606;
	b=HNUo8wuVlBM2JoLHTPhzjr2Cn5C4hf9YF2HcaCin7e4KZyVj9uBrWRtGQ++QXSNMZAlC
	 y7loJPVZSPLj7dlaKEzAlzZjwNrY+RI3Nu7Bf98YazzfPmGWRugYz1f0cm9KlBoDv2OX6
	 o9aKVa9b5cctvlEY4QyN6C9+1ImgIl51i3s8v4w+NxQS8vU0GZv0ssYFAmo/etTTwPB0F
	 O0MBGaO8C1cDW3J3iHpnquUXFvh6UvqCSEtV0r9Bq6IYbXSPjm+Shydm2r7K82hzWN5JJ
	 cdsOqDdbMakZYMg3WGOsNDHnS+RcgYnmfsJDVuwJ/477lvYi+nZfW9+e/DYVXiegMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=JmLfpKYr2QCIbwg+HkVUhA3vaxVAurC/ZibOYjAXnR0=;
	b=GcqP+ngxN8YsrHYpWWxqIJBKzqjjEXOaMzOBEQXzQHdZ4NX+RBRnoThIfbPqI0aBLtQ/
	 AFO2UkPDsvxFmGHTfYJLhxIloXLZ07cJipr1olR5gzafuQ4LwyAG7B6HElBv9f7q+LwCb
	 kSnJCdtW0zPE+Di6hPXX5WDUOhWpPTZPYNPWUIHkvw8aPPibgDftU0LODxZTYoTswgUMt
	 Aee7mmnffceJCqp/19nlMxyiPwFsok/zO2AIcGlhNNA7nEfRzu8t09iuxj3OAo9da7yRc
	 0MVRxoF5xfqn7MdOiV8g3e255YdqUzKRZvE4EElAfng0ndHKCMhWLYievWi6efgvh/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UErU4YAw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD19606A320;
	Sun, 22 Nov 2026 00:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UErU4YAw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEAB1F000C0;
	Sun, 22 Nov 2026 00:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795308605;
	bh=JmLfpKYr2QCIbwg+HkVUhA3vaxVAurC/ZibOYjAXnR0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UErU4YAwq1c2yX546pdoSE1n/BoQPiz+FkthF3M2npssjYnbK5pjnNf4X1culC7Vm
	 wd6IvYHLO1Zz527yN1AcJNCh5mDz1qVjBrvIxccpwAqVWoOHlgPQgvOETVHdSLKr97
	 r80KxyxvgNEGZg7os3gfEGifmJC6ZgVkJKCuWKvpffLzKYS5CdtFf7fy1kBFdO39LQ
	 hT8fU5KXeGLUEVPpHnZfVgcR/5q751kg+zKlJRnDWiR294QbNNNSh3oMJW/pB5WXhG
	 hlj55+9NRmVpY4uRJJ81NSFIVaVxHyFTzXMAoiqCfuixZKd6BFpauDKjsIkPONM2yO
	 b+P/28bnIsIRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4622391B098;
	Sun, 22 Nov 2026 00:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH net] net: af_key: fix use-after-free in dump_sp() on
 policy
 migrate
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530860453.1236726.16228084026958621779.git-patchwork-notify@kernel.org>
Date: Sun, 22 Nov 2026 00:50:04 +0000
References: <20261114223529.1791-1-danjwade95@gmail.com>
In-Reply-To: <20261114223529.1791-1-danjwade95@gmail.com>
To: Daniel Wade <danjwade95@gmail.com>
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 09:05:29 +1030 you wrote:
> pfkey_xfrm_policy2msg_size() derives an exported policy's message length
> from xfrm_vec[].encap_family. dump_sp() derives it twice: once through
> pfkey_xfrm_policy2msg_prep(), which allocates the skb, and again in
> pfkey_xfrm_policy2msg(), which fills it in.
> 
> dump_sp() holds net->xfrm.xfrm_policy_lock rather than pol->lock, so
> xfrm_policy_migrate() can rewrite encap_family between the two
> derivations. The second length is then up to 24 bytes per template
> larger than the first, and pfkey_xfrm_policy2msg() opens with
> memset(hdr, 0, size), clearing the difference into the skb's shared
> info. Four BEET templates put 80 bytes there, which reaches dataref:
> alloc_skb() had set it to 1, the memset makes it 0, and the skb_clone()
> in pfkey_broadcast_one() leaves two skbs sharing one head with a dataref
> of 1. Freeing the original releases a head the queued clone still points
> at, so recvmsg() copies freed memory to user space and consume_skb()
> frees it a second time. The CAP_NET_ADMIN that pfkey_create() and the
> xfrm netlink receive path check is namespace-relative, so an
> unprivileged user can reach this. SLUB's double-free check fires within
> a second of starting the reproducer; the oops kills a task, or panics
> the machine when the corruption lands in softirq context.
> 
> [...]

Here is the summary with links:
  - [net] net: af_key: fix use-after-free in dump_sp() on policy migrate
    https://git.kernel.org/netdev/net/c/af6737b90668

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


