Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305008;
	b=1j453wC0wDc3mJ3F911BXq8JPetTrGqwENTdzGjlD90q453sXkZ4d/GfzB2TNiSaSq9/
	 F0dA8bBsa/d/043tpMAkNrHqgHLMTdp/X211moZflB/FggmKtwinpRqv/BnuB3Z+extrq
	 vbq9m00AN9wWvhqv9JrSyQQdAR5xpT0RoTijW2Jp/N4t2KGG28Y3QDvuBG77t8H5V9O0x
	 k1/Z6zsc4C4E+QzjPxaCpsgcJNGGLepKEn5pfwYUrfAHPksSDIs1Cpyv6/xOt7627QyfU
	 U+9Hc5N/gpTdK2dsF1RJbBZCMtpoDlIqPhJXHS8fnMcmRjQRA6cKryXy2SMyNzXP7Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305008;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=D8B33Q5+AnddwMjEk+JgQXKI1oQU3vTeifKn6ErInpM=;
	b=bMDucA+nuJktiLCZbFgYtSC8BQzD+d5WC9TgUsDF38jeKmM8aVZhGimSnx4RZz/MtJ3G
	 /pEumr8UBgBIO22jagsqJtjGYxajWjAMzjAv+GxOjAV4sIsMNkElVOaUzxI+mHSL+aJ3a
	 B9hf+abBXwVmJkdZIR/x1iznWrnKXtzr4KuutMcPhBB4b3oJoCLSBl48g1pFOqgrWRWTF
	 8/lKwSTS8L1UBKEScxrDKvMJg97LP9LXWwccHxHmCBqhN8AuOoxIj9ihkBbj1brN++k6/
	 DKzxb8RvA+9xVW6loh6XRZx0EyGwcEnPCIeLUiI2Xy4pGsHjZl4DKNmJu7GEBw01Bgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4G6lmzv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40037606A320;
	Sat, 21 Nov 2026 23:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4G6lmzv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF601F000C4;
	Sat, 21 Nov 2026 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305007;
	bh=D8B33Q5+AnddwMjEk+JgQXKI1oQU3vTeifKn6ErInpM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=C4G6lmzv+HujkJNi7OqhBOhAL396SudvOiSqvvs7+xrU6wRfnxVIO/OT4x9b3+nEd
	 iEB7TfRMU5OE7m+wdEzKXGPZPlHlSorghKNVlgv2LSkFB//m78mYYRK+OX2bqszfVx
	 /6win+RcYhNW39bZqbiYUjT7tFPvXihLNh4BP1rT9BWbGmj1p7jSdYHo2heWDd5La1
	 Xs/Ug1DGIjC0Rg+B06wkFZQ9VZ5zk6MWg5JIfOuUUUsw/wL6G2JMHMDoLoIgkbBOfq
	 JGf1ecf4NxoADy00/w24AN/lRx1jJhzeDVUKE8lRmAT3xig3sWO6tZUHeeco89ELaO
	 QP2FmzsL3c7VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4518391B08F;
	Sat, 21 Nov 2026 23:50:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v9 0/3] netlink: specs: fill in the missing ovs
 operations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530500653.1221130.3267976128355385798.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 23:50:06 +0000
References: <20261119172118.3416958-1-houminxi@gmail.com>
In-Reply-To: <20261119172118.3416958-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, dev@openvswitch.org, aconole@redhat.com,
 davem@davemloft.net, donald.hunter@gmail.com, echaudro@redhat.com,
 edumazet@kernel.org, i.maximets@ovn.org, kuba@kernel.org,
 linux-kernel@vger.kernel.org, pabeni@redhat.com, horms@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Nov 2026 12:21:15 -0500 you wrote:
> The ovs specs describe get and new but not every command the kernel
> has registered: all three families lacked set, and ovs_flow also lacked
> del. This series adds them, names the attributes each handler reads,
> and corrects what the existing specs say about the kernel. No kernel
> code changes.
> 
> v9:
> https://lore.kernel.org/netdev/20261115072638.3163018-1-houminxi@gmail.com/
>   - Rebased onto current net-next.
>   - The note on the vport name is a complete sentence again. The v8
>     wording stopped after "dp_ifindex from", so the sentence that says
>     what the lookup falls back to was missing.
> v8:
> https://lore.kernel.org/netdev/20261110174751.973464-1@gmail.com/
>   - The datapath spec no longer puts a maximum on masks-cache-size. The
>     generator does not turn a check into a policy for these families, and
>     the kernel bound is an expression, so the declaration promised
>     something the spec cannot express.
>   - The docs no longer say what a dump does with a key, a ufid or another
>     request attribute. A dump now has its own request list for each family,
>     which states what it takes, so the sentences that repeated it are gone.
>     The ufid docs record the minimum length the policy sets, and the key,
>     actions, stats, used and tcp-flags docs say the attributes appear in
>     replies as well as in notifications.
>   - The series gains a third patch for gaps that predate it. The vport
>     netnsid is signed in the kernel. The two dumps stop sharing a request
>     list with their get operation, and four lists named attributes their
>     handler never reads or sends. The vport get request can be answered by
>     port number, and the vport new doc says an ifindex needs an internal
>     vport. The vport spec declared family version 2 where the kernel
>     registers 1.
>   - That patch also declares what the kernel registers: all four ovs specs
>     document the header struct and none of them a member of it, the vport
>     name note names the header member the lookup uses, the options note
>     says what a set returns, the packet execute operation gains the
>     validate flags and the admin permission, and the ynl selftest stops
>     printing a field the datapath reply does not carry.
>   - Deleting one flow sends that flow to the family's multicast group, a
>     flush sends nothing, and the set operations do the same for the object
>     they change, which those op docs now say.
> 
> [...]

Here is the summary with links:
  - [net-next,v9,1/3] netlink: specs: add ovs_flow del and set operations
    https://git.kernel.org/netdev/net-next/c/a07bb1cee2af
  - [net-next,v9,2/3] netlink: specs: add ovs datapath and vport set operations
    https://git.kernel.org/netdev/net-next/c/fa2ea983e25d
  - [net-next,v9,3/3] netlink: specs: correct the ovs specs where they do not match the kernel
    https://git.kernel.org/netdev/net-next/c/f53c4f7ecfcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


