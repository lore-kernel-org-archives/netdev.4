Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092006;
	b=ozlbWuUkcNuSsEqQ4gl6s0i2375YNRVfhpSjJ0w0OqNLpRwbUD31Mvo/02TTB+kqFqkA
	 BV9LtZ0GwxNhvBnV25OR6CVpFtbG/swLUVgHIdDvwdbKYvI1XlBOGsh/6M8b6Uiw6up/s
	 LYJVaiofU9Y24ARYjRh1K0UWdH6iIfEcOyn66PLiPF+lXjNPqwGVSOrIG9VpV0ganiJpb
	 kO/RhM35piPVF0kTNlSngfw7EBBY3neYY+hi/5RXpd6pnaldLstZ4UluN/ienPObNmasc
	 M9bMuu5JMMNofoOTQFvc3YUW8P9VzeqqqCSvtBXmTISQrWJ2V1TZO3Te8VR4O0bZjuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=NgLPQAwPKExlxNkK+oN1L6Njj1rtcUN5iDXrlM5v0Qc=;
	b=5ZJQ15eyMffHB4Klp4Yo45axLL3jA0GhyrBQ1q/iiQe2XKrHv3d/fDutDCNnc5tj32oz
	 OGHaEM2A9MJMILPfKI0NDyxSfgc/JajWILfmjk1dv/ODHC1f772iRNy/bRBiDlTU6ocFQ
	 JcZ+azXT6PZDBbJugZ7GXYSOQHy2YoNwcuwBda2NO8Z8ituhATbPQurjWzCsdawWSLGTd
	 issyHMl8PsGyjC1JwPnhRcJkBVAUZMwUOEGD+0VnKeZYQv1GV7SJlE0MNo02eD88ThdgT
	 pP9QQ0m54ryOPWIWN3ckwOJtEIsLilZFYSLeCN41vVWSsC1ZWg5ghPok2rmM6wbp4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2ZcLPwT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7E606A320;
	Thu, 19 Nov 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2ZcLPwT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2991F000C5;
	Thu, 19 Nov 2026 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092006;
	bh=NgLPQAwPKExlxNkK+oN1L6Njj1rtcUN5iDXrlM5v0Qc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=e2ZcLPwTvXHgyKmsEQCi5rPqjPGVFWViG95EeJjtMj4k9XqaSE6EujoaNuZac02zU
	 29i0S3z14HzdoRV8Vjr5gAK73sVqX/lqTtHh3mr9jLwD2KA15T24KBG1TYKnmvbRlX
	 D7r1vepxopBg2TWC9t7TXg+HLMByXsBcrRYbaSF1uvmu7pLkigVyvSz59QLY2xrP2q
	 xyvw6L1obMMBmV1xw9ozaySXdMZs9OkFeaxtrSUk4yED8+faXkFe0mqXvzy7hPk4IE
	 cyTi/gb/20jO9iZOITZC3maEnaVyImyziEE3Z15PQ1sQHRv54sJWGoyiwZ7pxRGgVb
	 M2bDREg3uQmAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15273808210;
	Thu, 19 Nov 2026 12:40:05 +0000 (UTC)
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
Subject: Re: [PATCH net v5 0/4] ipmr: forward GSO multicast packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179509200478.3067204.6104899231005443965.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 12:40:04 +0000
References: <cover.1794151759.git.julius@bairaktaris.de>
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, willemb@google.com, steffen.klassert@secunet.com,
 jiayuan.chen@linux.dev, mfleming@cloudflare.com, almasrymina@google.com,
 bigeasy@linutronix.de, richardbgobert@gmail.com, ecree.xilinx@gmail.com,
 bsdhenrymartin@gmail.com, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 14 Nov 2026 19:26:56 +0100 you wrote:
> With fraglist GRO or UDP GRO forwarding on, a routed IPv4 multicast
> stream arrives as GSO packets. ipmr_prepare_xmit() drops every DF
> aggregate larger than the MTU, and ip_encap() sets no tunnel GSO state,
> so a GSO packet sent to a VIFF_TUNNEL vif is dropped during
> segmentation. With that state set, a fraglist aggregate reaches
> skb_segment_list() with tunnel headers, which can write before the head
> of a frag_list member; this also happens today when such a packet is
> routed into a tunnel device. Checking the segment length instead of
> skb->len relies on skb_gso_transport_seglen(), which counts the inner
> UDP header of an encapsulated UDP GSO packet 8 bytes short.
> 
> [...]

Here is the summary with links:
  - [net,v5,1/4] net: make room for the tunnel header in skb_segment_list()
    https://git.kernel.org/netdev/net/c/abccf171fa8e
  - [net,v5,2/4] net: gso: count the inner UDP header of encapsulated UDP GSO packets
    (no matching commit)
  - [net,v5,3/4] ipmr: set up GSO state for tunnel vifs
    (no matching commit)
  - [net,v5,4/4] ipmr: do not drop GSO packets that fit the MTU after segmentation
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


