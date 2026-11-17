Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886208;
	b=kJFst+KHTBJSnR8OQunQdjmCH2ToWxL0fXKAcpwuHos3vg3BKg3yq0Y69axeVbf8nEW0
	 ObkR/bEWETT4IeRL8C3nO7PEjDNPDf7VdLco8Jj8CBPaxgJFsDND+MOdak2viOX87pPaT
	 iZ9zGOQ8weRzdwtQONVxqRY8hEU+mYY5wdm+BS0gbNq5B6lb4NzpvKNg3/M1bR0a7X0Fk
	 SAvasemQ/s2GmH4ibMxkZJ9MP1EK0qeYwzXjAkUN04Nxw40F9gl+To10v6pripU51oKi0
	 OFkTVgZiXtPiq4cr7fMDjDsKbDBgAIyn+XgPFISlCeXUHwwALbCBwMk8W0MjNP6kSAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=uzR312HhxhGcrzDa3qFLv00Y0iLQQbIGumfslx46dMo=;
	b=HcQtWcn+jrAF+a39EsXWUaH/RkgI6y+cClYuGwD7SbqNkxcuhJD77ftrOzaFvIhH7k86
	 9OYU/PPE4Fp72eTdWcsGl38S8DK4Tpc5MbWh3/oyJwSdpkkZked0KAzT7UmBppqTmzhIC
	 /4266FRKr35BrWNNCnlH2mWyCDzI8tvLGD6uAnBNeJPXDgdKn1QERdZOEoy5hRD1x/+LT
	 y0ArEQITYKCEB8Prj4odfSw2pAQflD7+UgnpZmH2AnWkS6b4QW8uyHXZYymJ5E5bbDm3Z
	 cHoDv9ZBaiE4LZNC6lZGkaKKGsI77LYKpWb8dl3yqvpt7bIiwl9yX9yOlNBPPehzLoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUsw2Fuh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC4360A261F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUsw2Fuh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9AA1F000C8;
	Tue, 17 Nov 2026 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794886207;
	bh=uzR312HhxhGcrzDa3qFLv00Y0iLQQbIGumfslx46dMo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fUsw2Fuhkx7h0pfy0HN1OHBDcGg6F0RJwNPewEoBgsKktQU03tn57MSFXm+iuBlBQ
	 mBdogFa9gL1lPvN1sh8UMQ7GtWQ2c4L5tHYLKsbS+oWmaqg+oGT8CeZE76kt5a5LZk
	 tkGQfT4cYjq4J/MdhgSLnopAgV4Fqq+xE7Px2CTxV/Pdxd3VIfIwj1m/kNiTVxD62k
	 TUTrIJIJ/RPdQDgziXRe1T11N81iCaC80Jh87a+uXQUVIH7049gMpX8HzZMLqym7kV
	 s16DznwNCtFzHq6nc5KM5NZWYjOBzjvvybiqix1hYtANgJ56nH48Rg1nGwKlBVJ9Yb
	 sVaWfF5vf7Mkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4420391B0A1;
	Tue, 17 Nov 2026 03:30:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next] selftests: xsk: drop asm/barrier.h to fix the
 riscv
 build
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488620653.319349.13312639361322418521.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 03:30:06 +0000
References: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
In-Reply-To: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org, maxime.chevallier@bootlin.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 11:51:59 +0100 you wrote:
> xsk.c includes <asm/barrier.h>, a leftover from libbpf's AF_XDP code;
> nothing in it uses a barrier, the ring helpers in xsk.h use C11
> atomics. On riscv, the tools asm/barrier.h includes <asm/fence.h> from
> tools/arch/riscv/include. selftests/bpf had that directory on the
> include path but selftests/net does not, so since the move both
> xskxceiver and xdp_hw_metadata fail to build on riscv:
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: xsk: drop asm/barrier.h to fix the riscv build
    https://git.kernel.org/netdev/net-next/c/6ff4c5942a30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


