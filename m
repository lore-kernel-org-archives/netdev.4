Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575013;
	b=Fy8uzr3/MdM7weeIMJ/9INin9sWRx8LXsZ2KX0jfClBuIB4gnSbSBwZPLU/fJ2JRRTEf
	 3wXPb1XXlwX6zovWnF++QuNXIY/QSvJl4Ypj611nBRRhz5DKRN8XWqGgIzDELYclzDDa6
	 aDNo+vd/ALtxm1NZs8qkaqBheJeUdZMQ66KOuLgPmJggJPx9o5NMNFPBbjzmdNi6vkXjU
	 KVkE2fls/rOTcHOW+uzEm1JDGYj2mKThja4DZRxnMZsZb0+UqjZl3ebu53i+azL0RrBx0
	 C54oksJnf9ENaPsfYTZBhKbIgyAqQHvbh5vDIFKLNdA1/QqmwRIVYmRgLbwBRqVJ3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=7EmYe7itcXuHbnHRF6gF+7EHhOVRy6Mbg6lsBvEmXIo=;
	b=W2hw1Bi0gYhYzU7trnQHXlHUvfdAz0HWg84t+o27EF31UkoEgZt8r62X1zHjFghtVOmS
	 6+avoSFWRHZ+M6d8dJMgmWHnrgP20kqQ1OBvC/eiU5qBq3vVipnznZCYd63C/DxKeTrt0
	 aCkFsnfZ40kDPNlb/Ns8wpxZNU1M8n3al9/rgu0pEffCGOBTB0PekjC34nSUVslR0whrJ
	 NHTvomIcnqN9SSWq4rnvhrIXq67o9NBXNLFYKi0uFTPA5EdLvnLNC0Fzf3l7XvUWu6BK8
	 l9Goix/p2xUvYxxF3QcMaz6DoB/Q+a7akk8AifU50SajpiPmiKjj6Fh27ci9i9ftNeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFFbek6U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2C606A331;
	Wed, 25 Nov 2026 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFFbek6U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090571F000C6;
	Wed, 25 Nov 2026 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795575013;
	bh=7EmYe7itcXuHbnHRF6gF+7EHhOVRy6Mbg6lsBvEmXIo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CFFbek6UjgL8oXtrWBtKZOFDj+N92i8L3SaKRqKxMD/ketH/4k/GwPezdU14KLOK1
	 inQe+Vg3N2OscDlBq/SO8SIXbAz7xrRJhCKjqQ5Unf1Ae5dBzrtMZGAyNs8jJ+7D+x
	 rr2+ANjs+mOrkwa2JWteYcWHLdU/x9qlgnq68ICgE2QY9P+LkYCY0p9+kJ9NKwdcUK
	 baNCC667+5iCG7IXGfxkGc5EE3QPccPHtYRj98viU3lFpvZe+WVbIXfN1q6O7Rcrp8
	 sclegc3bbMrXUgYSkvcHYYtvBdE0rbxp0a/tUqMsYR5OPIL0SybukQX6X4Tv5oVruX
	 MvioPQoASzkRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15B73808209;
	Wed, 25 Nov 2026 02:50:12 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: openvswitch: avoid hashing the network
 namespace pointer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557501152.181897.12261473438495687799.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:50:11 +0000
References: 
 <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
In-Reply-To: 
 <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
To: Zhengchuan Liang <zcliangcn@gmail.com>
Cc: aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, pshelar@nicira.com, jesse@nicira.com,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Thu, 19 Nov 2026 13:20:46 -0800 you wrote:
> The Open vSwitch vport name table uses the network namespace pointer as
> the Jenkins hash seed. When an Open vSwitch vport already exists in the
> attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
> look up attacker-chosen missing names and time whether those lookups
> traverse an occupied bucket. Ranking the resulting collision pattern
> across possible KASLR slides recovers the init_net pointer and thus the
> kernel text base.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: openvswitch: avoid hashing the network namespace pointer
    https://git.kernel.org/netdev/net-next/c/2239275bf3cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


