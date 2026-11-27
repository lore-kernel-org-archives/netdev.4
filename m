Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795807;
	b=u0LVzwv3syaUhkBRNhXB1J7htqdjW04W4zjsEsJBF0qoUtHRxwxEpuJVSZ7eLMJv2YGv
	 bUarlWP0+S7C+M7IsmlDfTWKp8Vlcf7oWDBO+ONj2hAmsCM0j8s2uZcRR5KGfYNNTE05g
	 omlol0J+ta0Yo9KXLVSPw8ACw0GSPv+wbnSBYdD0clyl8T9I34bpvjzH/vubO+NpR1grJ
	 AzUxjA1aMgrdLl07p7xI+N/2jt3qx9z6rKZQzHHKbcUkE9sxZ21aTXgG+KpviYM7QyU9d
	 JpyuRZg1BPeghfpdCKrzViz/eZEjYnB82JTCC0bkH56CYJBgKwKWBONRqDgT0JwoX8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Fk/4Khpva334n/p1X/Ph6nibyRPueypomTdwioliMus=;
	b=www3kN1UmyrObb0RfaRJ9B3FUUQ20VSxqfuI0FiRU4jX6FV9JIfEqZsu43IUszZR7OiS
	 fSK2QrP1wE9pRcOlH2mgzHPkFlHxm/kDEWYsaTYTA0g+QmEN2uf9DESX5ujYY2YKaHioa
	 TCqwMeqFcTR54y8i578aoZrIjWUPjk6edmH3d1tyJI3Q/wCY7G0oiQI7xhPD5uMHPQ0sR
	 yOVMPeLJa2d6Ld9dn3+eqODZpYW5vqrxArIziIxNK6CJx002lbta8rwYpYk1lqQaztCxR
	 UNejl4LflIpvIHWmyNF4Yan2CwMgR4pEI0X+BbgQC8/qNRtM1+n8UbjNXXC+i5y/wdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZ2Vrunj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DEF606A682
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZ2Vrunj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789901F00A1A;
	Fri, 27 Nov 2026 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795806;
	bh=Fk/4Khpva334n/p1X/Ph6nibyRPueypomTdwioliMus=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oZ2VrunjYnMIQspdYB4ms2SwUFshbAqFUAsn7V4vDMhON6DEpcSwfdg9pZDN0HikV
	 FpWR8A/olXmf56gn7YNHaKhKxxqPZODSV0yViWFEaBdNuaPDlwTnUbt0DIr8yJhxxp
	 l7u7nyPbF00SCGnjys8UXIxpF7DqviZr+H6SwM2TjAFgN4Pik4vQ/cY6Qir9WPM1q0
	 QyC6DTKiqkCrKqFOUn7k3FQg8AootrxaVjipfOBjMbR0qrIiOTPPCFLrDju8hZMCdD
	 sQ1RHZORZgcWdDGiqd68oxTJ/QJBYSdrTc7BMHfcRATlZdafih2oWadyNhQPOzXPBb
	 qdc8a8v5+53ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 717683927043;
	Fri, 27 Nov 2026 16:10:06 +0000 (UTC)
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
Subject: Re: [PATCH iproute2] rt_names: do not write past the end of the name
 tables
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179579580525.1564141.16710307697821839588.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 16:10:05 +0000
References: <20261124055549.3390238-1-dave.seddon.ca@gmail.com>
In-Reply-To: <20261124055549.3390238-1-dave.seddon.ca@gmail.com>
To: dave seddon <dave.seddon.ca@gmail.com>
Cc: netdev@vger.kernel.org, stephen@networkplumber.org, dsahern@kernel.org

Hello:

This patch was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Mon, 23 Nov 2026 21:55:49 -0800 you wrote:
> rtnl_tab_initialize() accepts id == size, so an id of 256 in rt_protos,
> rt_scopes, rt_realms, rt_dsfield or rt_addrprotos writes one entry past
> the 256-entry table. Use >=.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
> 
> [...]

Here is the summary with links:
  - [iproute2] rt_names: do not write past the end of the name tables
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=22f67c8b7332

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


