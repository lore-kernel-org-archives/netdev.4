Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467608;
	b=yL77zAlhrdZhSBaZq0QZqTwvkPu9cOsNs6UkQ4vEBnV55wW1vCIVGcgrjxBmvOSaxZuO
	 us/VGRqwniX3dgY3G2Nw/YjG7Jns+XmvUKtJCxR7NLVUVkbQIclphOqIHbx8k0mFyFuIH
	 9Nt7C1yh+4IPHeAJ2dwfFnw5FnLJCRBhrRFtSfE2tpUXnvg0Mf9n5P+E+0VcbpgbKlpNG
	 fUQKqCh46PAGt03rB5RtFfDibIYwRAB1TdEOuB1IgNwxuM1avmYJ2/UThHp35ZHnZQ9o8
	 VoV02gPmLBkedY/c3kiPjAwsw2fKBXsFoYQxRVk7HixfvmdxZhg9paDM31FcUU/Qe0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467608;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Mw5g32Ob3xBy/rSQ+ex6KicKrC2O2/T6LL4fJvwYzzw=;
	b=eRnnkhsdwJIqfHJBwNvTT2CH+FLvLI58A4F3UO2C8aL7oPRp8QhM5qlhnzefnSYOE1A6
	 +Q72P+cgyfqsVsdCvLNWmcV4+OX5HBvn3aD9OY0R/GlVmVrRFbSvB3du1iDYDfWCkx6SH
	 xoEfUuAH7cl96L0v/whwf4veuSHWFw2i5WAtTWpiNoTMSwboQg/2NBv9p2Pbz6eGqehJS
	 1HKyvA26vIRuf98HvHux61w1qVYUscb0tGlJvBiRKc6u+wYLAVfJ/UHZ4Wvy4Lo0CDs/w
	 U0PoT2Nu14tvBIs97xtQVGaCWV9m9RLI+fbZum9ljpPOoDgJFZlTOoxKZUoCgqCydJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nNhD1A0s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ADA606A339
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nNhD1A0s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AB61F000D4;
	Mon, 23 Nov 2026 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467607;
	bh=Mw5g32Ob3xBy/rSQ+ex6KicKrC2O2/T6LL4fJvwYzzw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nNhD1A0sXP6N4q23vO8pN+Vpcd1dpbgxk014CrA2N/nqlg7a5Dzb/Ryrpt+xwk4na
	 dk4WD+r9yppg2D6FEWKz4azG1AMmjI78BPfag96bbSR+2s2c9s6P4lO6AuEJCMkj9+
	 BU7IHJnCgQU25i+x+eQG8tapiK7fdlUcKVnbZfawmBQaUxseDFBwJodKVPal0KW01Y
	 FneCnP/tD4wNrGHg+yrd6BGubjpyoPJB8mittAsntYINanWdQeAM0k4e/G6n2sNDLs
	 mQKNSI4q1eSMC/PG44AhiTVY2BWM4kUbKNdLLx/EnCFdRajioIGFjrcdyETPEHWbTF
	 1XCd30VJge3vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4594392FFED;
	Mon, 23 Nov 2026 21:00:07 +0000 (UTC)
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
Subject: Re: [PATCH iproute2-next 0/7] bpf: fix mount point parsing and drop
 the
 legacy loader
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179546760629.3119950.17276540991127747033.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 21:00:06 +0000
References: <20261119190312.578885-1-stephen@networkplumber.org>
In-Reply-To: <20261119190312.578885-1-stephen@networkplumber.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org

Hello:

This series was applied to iproute2/iproute2-next.git (main)
by David Ahern <dsahern@kernel.org>:

On Thu, 19 Nov 2026 11:02:35 -0800 you wrote:
> While looking at OSS Scanner reports noticed a pattern of issues
> around the BPF loader. The first set related to parsing of
> mount points with fscanf("%s").
> 
> The next part were issues from the legacy BPF loader which
> is no longer needed. This series rips the band-aid off
> and related parts no longer needed.
> 
> [...]

Here is the summary with links:
  - [iproute2-next,v2,1/7] lib/bpf: parse /proc/mounts with getmntent and check fs magic
    https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=811d5c6fee81
  - [iproute2-next,v2,2/7] lib/fs: parse /proc/mounts with getmntent and check fs magic
    https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=a472dd902002
  - [iproute2-next,v2,3/7] tc: remove eBPF map export and exec bpf import
    https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=5ba7711088c8
  - [iproute2-next,v2,4/7] man: tc-bpf: drop references to the removed eBPF agent
    https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=6ab6b5582f3a
  - [iproute2-next,v2,5/7] lib/bpf: require libbpf 1.0 and remove legacy ELF loader
    https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=ef57368a23ba
  - [iproute2-next,v2,6/7] lib/bpf: check for missing bpf fs mount point
    (no matching commit)
  - [iproute2-next,v2,7/7] testsuite: add tc bpf test
    https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=d462249417a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


