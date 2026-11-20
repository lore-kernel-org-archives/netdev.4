Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141816;
	b=uooqgnf0Jd/bvx5a0bK21ewDKPWsxW4mxBxhEsTIixVK5zX6rZgpAWVRQ0nzKUZTounQ
	 tmkZ8F+hMhZdEMkKNJTj00UlV07Aw2eYLw0VkHXhpaQvtqYl0H1HFsKwCwVg1gxTknW+z
	 n0s+C+b7krNmAbWHdSKVj4tQnoZFQ6IWV6qE6Kn1Ue+dkdflxwDL0Xz0K489g1X9EW9f2
	 xTG48HcSPIevR/6fxYyqLd8xmMZgBWCr3HfytnwA5vp3iPJoiAK6J8pBefZ7nVBgTs0H/
	 /OIWNFeADmu2Zsb4Jfi8GQ2LqOh+FfOhfiGpyaYoljlcV5cAfleNHm3fqEULydSH0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141816;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=icvGQ2jGqBAhP3OVrejJvDN6v+ifzvEtACB0CBcsqxg=;
	b=JrEZ/EO4X3Qyc2QZCWB8nnD8CcSMKM8HVKWJElgcDwRkOcnZjTLhVY0hvkzAlE+tPcjI
	 irwMhP7PhtTvWp+JoRISTIAGS5TAvSCRwNn8fwVnDFZqrYEMLzJ91dam+h0yZistNOhz4
	 PoXGLvkUrF2FQuUu6lAP/ya2LDQ84gfZ3evkhb0KZ8yIlf+caRXprZS4j99yU4pINNy3r
	 neLmkJnWE66wLUipx2Ks+PnQG5AvuGsyGV1SQvy8h2b50oh5SAGkTLY302TAg5A+KDoSI
	 mmLddo/+6xaHf0ILUxioFdVG7Rvs3DEzdWojR8sPYVgOL5cFK9+gHIt04Gz1A/gJinw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IqBjYRDh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D79860A2613;
	Fri, 20 Nov 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IqBjYRDh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078EE1F000C4;
	Fri, 20 Nov 2026 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795141816;
	bh=icvGQ2jGqBAhP3OVrejJvDN6v+ifzvEtACB0CBcsqxg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IqBjYRDh8Zp0Nj0KKPB/YSM4rD36D+xJeEDr1QSkHabdibskn0anXI5I24/Lvzi4I
	 x29ecgBjt02mLgXXM5llKiDcjjtVfpLj3ffwMjoF19hSXeOGAkaYj6+hvIfKQioeJV
	 zGky+hLvweQxLNxMT5ryTbm77FLV4aRs4vAKlOAFynCJMIWVwc1rcDt12A3TpXD32j
	 mkXFgfCVWbaazzQc6imvQioYdYb2zEc0hTDp7UAEyGqDfUUQrjCQlg+jJhmpi+W20C
	 sI7p26hi4f6qVwuJcUegwSN7xkssnl5fK5QdFVaO3YRWJG8ZcjwZmIlYP1hBw2flfm
	 xoTcEPJIfIBNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F154F3808209;
	Fri, 20 Nov 2026 02:30:15 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: remove CONFIG_NETDEVICES requirement for
 SO_BINDTODEVICE and SO_BINDTOIFINDEX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514181453.3985754.4590039410084067939.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:30:14 +0000
References: <20261116175504.15295-1-ethanf108@gmail.com>
In-Reply-To: <20261116175504.15295-1-ethanf108@gmail.com>
To: Ethan Ferguson <ethanf108@gmail.com>
Cc: edumazet@kernel.org, kuniyu@google.com, pabeni@redhat.com,
 willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 12:55:04 -0500 you wrote:
> The SO_BINDTODEVICE and SO_BINDTOIFINDEX sockopts return -ENOPROTOOPT
> if CONFIG_NETDEVICES is disabled, but the lo interface still exists.
> I believe that these sockopts should not fail on the lo device just
> because there are no other net devices.
> 
> Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: remove CONFIG_NETDEVICES requirement for SO_BINDTODEVICE and SO_BINDTOIFINDEX
    https://git.kernel.org/netdev/net-next/c/f69dfe594053

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


