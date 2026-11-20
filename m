Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218606;
	b=KDZn0eHVhksMhKYI/mLd9NejXxP31UK6bL5o8/AsVRLaNIgay2aOUu01Uwc7DsVxNc/d
	 RpXN+ZSZUI1AJXxwbsn0F5NLtpVASEDBg2PvPPQMViRN13wegiGRvoizcLb5wv5BduglU
	 /EYrulQLz+cgg6haf6W+JKlZOhgUyqyJB40WttRq3tPgU+RR/PBV4U5ruhCdgKc0qiVjw
	 VVyvBOODbm0KBhGNiAGQ891x0kkiyEa+L0g5n6S9XOVB60MqHB/63OX0RZ19cQm6kJ1HO
	 jd3IyYadpw1bczqOQlY471gRrEBpeVtWLIStcvebg2HkKb0TKB7Mw9i0CYTd+f/4nKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=tnHYFtgCITrDmSsRECNy2BGdzhmEJLjovQrJ20eJngI=;
	b=Gja/s6glXkeDqHeDPhMEqm57mDkO0YdoSS1kjOKbdhNBZBURFeKrWK1Uc+UjXutkw8Hd
	 IAdekAL9/6fWYJkZGURCad7RD1i5zFte52zN0/rZ4JsssmoaLj2RTBuBc2nT57cgLkCK8
	 3oqkdLkwOzXpEkFqQw2z4uZi8zMry5PK1m+rGTdG3nYQZA2DtvNRLvvgpTvSmm5l5pzJi
	 hAzXOWSjuOawp2g7kpWbbVRrlAxe0vEMGKOVKTEEGjaZY5wxVO5uvH0zX21G4ePP6P6Xn
	 4oMpavOpMcAIfF9F/QKcCuTAsvmadxeo9qEJdne25QjBwkL9hhrPs4wuI9L7khmOJFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BufQ/3AM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF39606A6B7;
	Fri, 20 Nov 2026 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BufQ/3AM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E481F000C6;
	Fri, 20 Nov 2026 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218606;
	bh=tnHYFtgCITrDmSsRECNy2BGdzhmEJLjovQrJ20eJngI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BufQ/3AMKOnEj1L3y8S5vJyuerHc4GqWgDS5zGeSHsu3rHFNX2leaRXVsfzSl2UFI
	 J8z9WTzPQ5kQwSWV/Oyd8iC4NE1RRhyxVk4VEoyaCl1KhHTMisR+JUTbqMQtjGXA18
	 mdMrXm8suT5I4qiKpG02O7Xuq4AywKnbWK3ZxBMY5+pKVW8KtI58rA2STAxbk0nXC0
	 55sHNC+a9fFo1XavY6hta7GJ3oXCRP/UDHfTw/559Mjb8ds5ySATSYmem9bvIWned8
	 pgWGZ7u72h+6KOXTgayaV9GdGYVmz1nuHI5qrd5Y4XVhweEO+5M90Q2D6r+tvt46de
	 Q8FGaKgXbZWFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A32B380AA4D;
	Fri, 20 Nov 2026 23:50:06 +0000 (UTC)
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
Subject: Re: [PATCH net] octeontx2-pf: Fix potential use-after-free in
 representor
 teardown
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179521860503.842584.8663066740540883936.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 23:50:05 +0000
References: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
In-Reply-To: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: sgoutham@marvell.com, gakula@marvell.com, rkannoth@marvell.com,
 sbhatta@marvell.com, bbhushan2@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 22:12:10 +0800 you wrote:
> The representor private data resides in its netdev allocation.
> rvu_rep_destroy() frees that allocation before reading rep->flow_cfg to
> release the flow configuration.
> 
> Release the configuration while the representor is still alive.
> 
> This issue was found by our static analysis tool under development.
> 
> [...]

Here is the summary with links:
  - [net] octeontx2-pf: Fix potential use-after-free in representor teardown
    https://git.kernel.org/netdev/net-next/c/a98c9978f59e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


