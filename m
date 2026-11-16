Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852011;
	b=MMsWKUyeLyyPUzhbA9ybJVDo6eCcLVVK5p5Kbo3wjvrKpsduspp5v7zWajUvhSe3ZUax
	 s1HMVWnkjwlOu1h421tdeX2PsGV9FOs9wP+f09/eIKULH41ol624Y8/Rzp4dWltmnNrR8
	 TH0hkKG3Pyuk5NGIdD3loMOb+E+1pMtpkHhgVnOrQgnL7E8H87XfkgF8hNrk7c8Y5WWkl
	 6fdPts7MVZH50uHsaH4t/KUtzWZPcCzQ5xJpafe8iAnlu7CBJsz+mrhhmJZk8Z/vCEl2Z
	 Q9U2JbWcnGD1HsGvrKODYHnH8/+yrXQTAJLy5UligS+sWtdwj0nF2obLlsG8TcNecxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852011;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=foLyGg1CKZ3aeBBdVdiXFalWgN1V0EHw89rIj+tiOVI=;
	b=FD/O+pmRqKcfSyCA46yhYEB2zyeF7DVadVdgYug2zziy3iLWLcjhCUai8WRGAhUd2mOK
	 VQmvR/oBf4oLthH7trwIN3aUnybzMxoO3rFlcHmlRA0bzkhFRnJCY/Doiwdpo15GQKDrZ
	 25yyH+8IWm3Fk00LY0Yts1FfttdkHeobYlwQghTDP9KcZg1j475THeWacoZtc8muFPQYM
	 WWCCN47UdZMyg/oenAcIcSAFRqdi1pVrcxrOcXCpu7QmRARp+GAXLm5HzVoJpl3rXzYTV
	 Yjszw8drsF/49FWevYUsFSs9fPXSCZOLsnIS1wax3LDNS6/4YUZd6lVw7DIgiwUWEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRPX+H2x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8F606A33B
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRPX+H2x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4D21F000C4;
	Mon, 16 Nov 2026 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852011;
	bh=foLyGg1CKZ3aeBBdVdiXFalWgN1V0EHw89rIj+tiOVI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bRPX+H2x7bB+EaWpKq/hzuo/mYe+dr2KIOESDyA1HBHkPJ7dwUtaZw/gPHAeiacsr
	 w/zZIFikWMYwlaQTtm61NF7Y6O3LOneVP2Wqu+wG+Gmd3SFAUQ9ZcrbAcNH1Q8BDDZ
	 lBrpTUNskZ3IEi/5hjKp1VSxKvYxTFl95NirVR94vptgBc4wUXnOzeVLUqE29xd6z6
	 pRbTG0Xk0dWNT1AFjWk3hA7HM5pkj74GqYBBhQz4J6K1+Lf2sWoC0chsVcFRGrcVCa
	 PD4d9VMEu0SfNF0yan/ngUUnSCHOPm2glgK+fDTbXbYOkQIS5DJr0WaNn5eAuaFV2D
	 wtCHLjeUs/a8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14C8391AFAF;
	Mon, 16 Nov 2026 18:00:10 +0000 (UTC)
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
Subject: Re: [PATCH iproute2 v2 0/2]
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179485200952.3802119.16560123532175308493.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 18:00:09 +0000
References: <20261116111613.25820-1-dev.kurt@vandijck-laurijssen.be>
In-Reply-To: <20261116111613.25820-1-dev.kurt@vandijck-laurijssen.be>
To: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc: netdev@vger.kernel.org

Hello:

This series was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Mon, 16 Nov 2026 12:09:37 +0100 you wrote:
> Current implementation of address protocols in iproute2 allow to add
> them, and iproute2 will show them, but you cannot use them to really filter.
> These 2 patches fix 2 shortcomings of current iproute2's 'proto' parameter
> handling:
> 1/2: allow to use labels from rt_addrprotos tables
> 2/2: treat addresses with no addrproto as PROTO_UNSPEC
> 
> [...]

Here is the summary with links:
  - [iproute2,1/2] ip address: allow labeled proto arguments
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=e7ea8f74e81a
  - [iproute2,2/2] ip address: proto filters rejects items without proto
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=75fc1c7d6d19

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


