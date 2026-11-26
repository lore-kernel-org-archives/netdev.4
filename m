Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660207;
	b=icNpLkW0wcsA+TEkBrGB7LIS+8DOsVigLKnleYabuJIHu1Ab7LgdPmX9vSYozquSc4v/
	 CB2V1ryfipzi+vUJQIk01BJ89QTlQgP8tb5F4+//GLtBVej5hC2V/Bp3H5KRZQFL6nvVQ
	 SehuqD5AoSH+NjGyPdFEpPEyvLJyZby1KRLsFIEuFJkL10uYT4coVGbnkQQHjfMflbgQb
	 FQnksL+7oeaarXiaTlNN7LoyNHrRXXZP9EkurT8U3B5JumWungopNJJpOFFgnjmHtDaL1
	 CLsVhZ0W26kXMHk4xF3IhYJFFd3JcQvVyu4V4tO5oT+xhETD09hbdfU6nvMPGR6vRWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=sSkgDEwKeb73M6Ctumecjy/PEkv/0wl7wlEPouQB+So=;
	b=brLAO0vddqRgy96+Ln9rIEHI0uBkHLlLsJm0/GGrD/VDlP7DQdOEYvQdAkNZDboGQS6e
	 FkuFOANNo0AIQpkfc4gs486zTeXclbNN5gTdsMbJhiwCmoiecZO/OgNdWpN0OKEIY14qN
	 /4tlGdPe26P9PWRrS/jFbzqoNvIFLrFl5I2ursOEwqEyANWGvxKuAXI8mha6eG4kOnS2F
	 MtpQ2X8WogZJa43bySGSdaGV8B/NqGC2vPcfy0Ui88CUFb0azQEibEZwmfwodlZjaZ2+K
	 Gnm3qHvVsnDsX9WxYIa7vEIMW2A3oEtccjJ7KCNAW2dUfTT1XTRRB4p655UjDKDS6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DquuzUek;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE8606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DquuzUek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A831F000C4;
	Thu, 26 Nov 2026 02:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660207;
	bh=sSkgDEwKeb73M6Ctumecjy/PEkv/0wl7wlEPouQB+So=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DquuzUek1limL1SYqIAhzNOCMEfxHAjifRlSk3/jbu0XO9CimPTxT/6YPPrviKYP3
	 zUryDgJGmSS6sLG1n9pgjS0YJGWJr6U+UwwDjU5iG41OXqgJHBjwDU+xHMjNMNN8QR
	 5AxXJ8iSu5kM4hOWKST+CY6IsvhbzOBcmST1EZDpg4S4BDEKS0YM87JPkkGKu6ZqAs
	 6MOMfIaeH8axGqSk3NQhcqchSWZU4zXEK5n7hzH7xxREr6Z+3yblZ6l3SVJKGdwv/e
	 FT9Bh+zl+6pLvj0H0R50Klrn2n+6NLmXihoVnQ2zAQFi9AtQAOUADq7znfSE0sntyg
	 htDYy6ZdJf8Hg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2C43809A24;
	Thu, 26 Nov 2026 02:30:07 +0000 (UTC)
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
Subject: Re: [PATCH v2 net-next] net: do not over-estimate truesize in
 zerocopy_fill_skb_from_iter()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179566020603.1457344.209894326819869971.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:30:06 +0000
References: <20261123091156.58359-1-edumazet@kernel.org>
In-Reply-To: <20261123091156.58359-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, kuniyu@google.com, horms@kernel.org,
 netdev@vger.kernel.org, jiayuan.chen@linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Mon, 23 Nov 2026 10:11:56 +0100 you wrote:
> zerocopy_fill_skb_from_iter() adds PAGE_ALIGN(copied + start) to
> skb->truesize for each iov_iter_get_pages2() call.
> 
> Since commit 394fcd8a8134 ("net: zerocopy: combine pages in
> zerocopy_sg_from_iter()"), a chunk that directly follows the last frag
> in the same page is merged into this frag, and the extra page reference
> is released. The page is still accounted again in skb->truesize.
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()
    https://git.kernel.org/netdev/net-next/c/d2ddce786257

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


