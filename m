Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516210;
	b=R93FieabDgjVk3wjK/j5d4SLEVHCGAqjOqlwtBVgp2xVa5upbx38PhgwmIwYMdZh6CET
	 PYJSZoKgLAWu+4ywXqSkonMUi9AbeN/xjR/fl0zcMgQQ7yZu4TK3Ab1A79VGf6KOJHjiP
	 0CNtVXnIMF8Uz+x/619xIdFNoYr/A0t2UiEKSvu5YL3z1OoLRalYoAR6JCXIUeEnWl+NZ
	 U9k5LvKl+40yD4crSfKiPR+uO5oYcLNA97oc4yjo4xtajEU3lZ9mWMzKcCxOK6hAbVlIc
	 8OL5taeVxQTdN7tlrceoDPt5iQmTGlWk68mBHPskTeKC2ezyW0Ode6uw+XkxQYC2fag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=VQTlPzzf+vuBB48kOwGvqH44CO51punidl6CKmisCgQ=;
	b=twU/wlFvmXRhT/gZmTkOuqWSDlIsYhImJG4y2NI1zMohrLTK5XSOq0LpXFCxak9mbvFb
	 7t1i1SMwu0tnjDT+YkvAC9DQVXoyrGVR3kdL5Npn4J1KEEa9cP0f3hkCWVZF6DxT+Jk5j
	 3Ka7UprjAESTF+UlI3VobvQr+AokT65Sp8//gOSmtLC3GvJjZZ6pak0JDpqLH32e7gAfr
	 gVNmk2ODT6LKJcKLl9Y4qtDwmbC5Gb4BJOhK4P0TfhTcXcAFMaAZq7wBKdsu0lh3J8i2E
	 UXFQdhtClQYjozTed0447mtHTg1w+X7QzNfHDBg/Zx8CwyL4fO7RLRbo7MFhzHA8ltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAtjIY5B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB16606A334;
	Tue, 24 Nov 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAtjIY5B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7A41F000C6;
	Tue, 24 Nov 2026 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516209;
	bh=VQTlPzzf+vuBB48kOwGvqH44CO51punidl6CKmisCgQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eAtjIY5BhKzVg640W8NSY40JQaIScDeZ4XlyaIIVB0gb3XrUCB14cKp0XMPXpWYQY
	 gj8BwXdMLH4DN70NANL9bjEQoTZn1/yzc6/MtulEbn8VJxB1UN0ieYQhRpAAmSktd4
	 Acn8r4h+8yqaz5icHpBmplM3IuvJPnWi31JtLJMHyNGsPYML6MeGREWbCpQ/UlaclU
	 4qyefIQLNqobVSltAP3glqQn87vlvuqFhIZRWlblgoXsPNwr5GiF/z0fiNg0wsNR6J
	 tRsv0F1n566outhx6goadC4YL8ZqjKsmSyqK6PIzp+368kXHumxkSabo1mqKuQnXRq
	 4roM/QDRpNFdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44253931025;
	Tue, 24 Nov 2026 10:30:09 +0000 (UTC)
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
Subject: Re: [PATCH net v2] gve: mark the flow rule cache out of sync when a
 rule
 update fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179551620827.3433632.1408590470930616066.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 10:30:08 +0000
References: <20261119044537.57936-1-enderaoelyther@gmail.com>
In-Reply-To: <20261119044537.57936-1-enderaoelyther@gmail.com>
To: Zhao Li <enderaoelyther@gmail.com>
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, jordanrhee@google.com, nktgrg@google.com,
 ziweixiao@google.com, jeroendb@google.com, pkaligineedi@google.com,
 thostet@google.com, przemyslaw.kitszel@intel.com, maolson@google.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 12:45:37 +0800 you wrote:
> gve_adminq_configure_flow_rule() marks the flow rule cache out of sync
> only when the device accepts the command, although a failed add,
> delete or reset can leave the device state unknown.
> 
> gve_reset() sends the flow rule reset command from
> gve_teardown_control_plane_resources() and then frees and reallocates
> the cache buffers. If that command fails, the cache keeps its nonzero
> rule count and stays marked in sync, but its entries are now zeroed.
> gve_get_flow_rule_entry() then finds location 0 inside the cached range,
> since every zeroed entry has location 0, and reports an all-zero
> TCP/IPv4 rule that steers to queue 0, whatever the device holds at that
> location. Queries for other locations fall outside the cached range and
> read the rules from the device again.
> 
> [...]

Here is the summary with links:
  - [net,v2] gve: mark the flow rule cache out of sync when a rule update fails
    https://git.kernel.org/netdev/net-next/c/4a791c987417

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


