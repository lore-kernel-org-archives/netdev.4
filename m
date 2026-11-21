Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303206;
	b=PESb4FXTBHQFbsQ42n7s5KMWVsviLpH/fk6viISim4Pbzv9Fxls1wj10M3ZqZofGGue2
	 c+P7Dbyq2Zwoex9nTavCi+WGceCX0+2ajRv8kzWkdxd98fEtxIh98PWpoNl+4nQW+D2bL
	 lRDw9FrXwtT/0KDQ2G96d58ZTGjgQ6JQGqmtQ1d/pGyUP5GmCIxR7Qa7+G+xXhc4z4b4V
	 L7agf60aChJBB7KgVZmVLjGGvAzgiHuYy76zZLoq6SR1vHmLRyznoZozDVDpcNkeiOgiN
	 R6k3skdb8qlKHPcwfY33ijWVyYVKI/TDeOHdneOmIRIC7ELwGIqjJlTtREphJDawJUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5bpPZSS3ZMu47avbQ81WuzRGsTf3/lSZ7WxZA7qg4r4=;
	b=s3faqQw7zeZstqw4cIkTaYz/VXxys+NciTc422vfrPr/yOt/f8sKu00claX/hG7KZg89
	 i6De5S8aoZ/iLZaviH5YmRQynfDmqrSeQq1CsYxAc9rw8xLcbutoread6JMYttX3S1IWr
	 mvXYcYZ1YNs5C3TwcLoWdnJuO/rw4nsGRBk6s6wQ3Id/DTOud6ONn9YjWmTdax/8J46O1
	 GyjeVygaPM3IEM44N1a0RVnnPLGsJOEul0Xr4BzQCGOsXB+lK5PdnXRkLB1lETryjB6Qk
	 CZW+MVJQh0h20ZpqCZqLIbmG3BVJdtiA2BdDvbTa2EfcEe1H/blStqF4Db6TImKmonw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LW7Tvjc4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A13606A320;
	Sat, 21 Nov 2026 23:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LW7Tvjc4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8325D1F000C6;
	Sat, 21 Nov 2026 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303205;
	bh=5bpPZSS3ZMu47avbQ81WuzRGsTf3/lSZ7WxZA7qg4r4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LW7Tvjc4Ytxb5go4oQUfReO184jzIjMIPG54Ux2GTgnCaiEAp1v3V/pHQ4Znh/Fll
	 r1/GOSm4gOYEn5eABQaDVG3pbACVl7VWvlNJem4ObxnEg2qidKfguv+R1TQdx6OxOi
	 V1p2HeW+mZUbo3duR4/qg7CZI2IiQbtxLCdT35fzbMtJ1nZJzSmkpEf5u5tiSVAF0V
	 oo2wp/C5r0Sm+PU0OLSAFCJnJEyjMmeEAGPzwQ2uPTuaADMaIapZILZcpz5W9GigJw
	 43/7Jm1OR2RQSrSUhTYkr/cpayHxOLdIca5/gRLiqtOsg8G42lS79ma3MK0ZWeXSxs
	 CdfFp8blY615g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 775D6391B08F;
	Sat, 21 Nov 2026 23:20:05 +0000 (UTC)
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
Subject: Re: [PATCH net] vlan: require real device netns admin to change GVRP
 and MVRP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530320429.1205792.9375307755554832179.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 23:20:04 +0000
References: <20261117-vlan-gvrp-v1-1-53a6b0775953@gmail.com>
In-Reply-To: <20261117-vlan-gvrp-v1-1-53a6b0775953@gmail.com>
To: Suyuan Wang <shyckless@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-kernel@vger.kernel.org, elb12345@hotmail.co.uk,
 horms@kernel.org, pabeni@redhat.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 13:04:41 +0000 you wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> A VLAN device can be moved to another network namespace while its real
> device stays behind. CAP_NET_ADMIN in the VLAN's namespace is then
> enough to change its flags, through IFLA_VLAN_FLAGS or the
> SET_VLAN_FLAG_CMD ioctl. Two of those flags act on the real device
> rather than on the VLAN:
> 
> [...]

Here is the summary with links:
  - [net] vlan: require real device netns admin to change GVRP and MVRP
    https://git.kernel.org/netdev/net-next/c/e678e4283983

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


