Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447806;
	b=zyONMgdw+yuhm430UXYRZVb5npLIO9t03kGbU3O4xG+7KA9iW56ptOeMY/eyz21gFTPF
	 f73qgpKNj/QZGnRanmVsEtN2Ftd//rGWDtlGnXfC40y2ael1b1zrjBNugfmGIoBxx4sUP
	 D9cmxxKe8wfCCJ7DMXcNs4y/XfwbTYbECowoqBGCqTLYN1lMor/Wp4Dt3PrwJAzxdlJX2
	 hL7vQha+zutBGkR/H8EU2OZwXYTYYVVh+MJjc+o/7Gyv0uyZ2tXjwsyZTsRditbwI+JBv
	 3tjSsDZEcX9aPzGz4vQJKqzb3brjrkh7th8ZqFh17bPc6Vjeo90KE+dhacAKOfGuakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447806;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=YiV5pZFJq9F09rYXCwy6m1bnpTcZUflRPxSSTWYIZT4=;
	b=Tw1qA6gm9mI101gzpXcy3YmvHYhiFLja5brRFR4mCc7Iqw2ExYQQdtyTDuyZ6J/614We
	 L18d98vy4krGcvQvk7N+K1v2/OyIHORN3mHMhpBtnF7ADXMAw2Uldv1NHTVr6glO4FF5x
	 aMidRMYuusIgT0FHNKblovoLh0eBYTx1HwkDHFyG0cf6vF6Rhfbref+ECb1CUjlqC2HMi
	 oPMaWTHJT/xhbqD1oMpEeRU+n9ZVMQLdqv+CnNmJkC24SWAgfPLxlHrH12Qecx9zophUQ
	 tHa1xbTkcv1miLaF5vXQDSJC8Y7b6KcyR0JBZRYfI05OkGv12zXC+71nJNyyJL4FGSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gpuN0/TX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64B606A337;
	Mon, 23 Nov 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpuN0/TX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DD21F00A01;
	Mon, 23 Nov 2026 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447806;
	bh=YiV5pZFJq9F09rYXCwy6m1bnpTcZUflRPxSSTWYIZT4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gpuN0/TX+sT0/+KivmZIisJ0z8RMvEQnxfYT7l8PxvSSxbBjgY2vqiVykvGkj4h3q
	 9RslFuwM6+3l0sj+XR6p9SejAOexBozE/P36/PYgfF2gJ5X9/M71q9M0La7zjmQbBp
	 B4tLIyY58toc7a9qfPcvTAOke4BczmdZ8gWeGlJNEd6mw5omQgPyyF8b9k1Q5Ci+3F
	 kSrKWJ73VCemIpR3zbQbxFpKu49tDXxvB0mYjdD+D3Pa3A6mK4jRGLZKZpRNkX7BPj
	 xxlk2RGGhZy9D6xLFEvNMgxJdh1HOXJQr/KNphA8l2xfKVB3L70IsWoD2z3K+SRClU
	 VmyOYa20pvImQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4E7392EE03;
	Mon, 23 Nov 2026 15:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net] net: openvswitch: don't WARN on a non-IP packet that
 needs fragmenting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179544780503.2466628.10142136136321144623.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 15:30:05 +0000
References: <179502509517.2983267.1652158471891914135@gmail.com>
In-Reply-To: <179502509517.2983267.1652158471891914135@gmail.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, netdev@vger.kernel.org, dev@openvswitch.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 10:06:09 -0800 (PST) you wrote:
> ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
> with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
> userspace, any ethertype can get there, e.g. an MPLS packet executed by
> an unprivileged user in its own user and network namespace:
> 
>   Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
>   WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
>   Call Trace:
>    do_execute_actions+0x580e/0x7380
>    ovs_execute_actions+0xd3/0x3e0
>    ovs_packet_cmd_execute+0xc21/0x13c0
> 
> [...]

Here is the summary with links:
  - [net] net: openvswitch: don't WARN on a non-IP packet that needs fragmenting
    https://git.kernel.org/netdev/net-next/c/57f165ff2f30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


