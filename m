Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949206;
	b=k4j7o8nbthYzwr3OpzBsS0RF8/9YOVA4erZlTfEi+s+MixpAafzq+JvWuBpr9HwzmV5L
	 5QpwD6GR3Xo2Rkfokzw1rKUZd1Jq9YpV8+NDC7hnmGHqoY3Bw2v9PorxSzqtN5qWxG1WD
	 3RQ71ItDAyS6opRl5ESqwEKysdZsL4N/QKdp8D+x7PMpTuoai6pD1pgchi94F8vYtmal7
	 a8WkewQU2v9aTqEFWedrXbV4q7+01DFTmxxNe1y2AQs8UhW6o7+TqKkfuyRGdo49PNkNe
	 3fzxk68YVFVXz8kgc47l2oa5eKEmeRqTkOmgMeZFUAKDr6YsLh5BwSiUjqR+5H/7ysQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=crMvd0i2658C5njEAPP0nGCaijY/CsDSVoywij2h/Ro=;
	b=3KWcy5LUAVfCf0Cs+X1xOh0xxvXIhStW55NSMw3MSMFdk4Ia04RlHHRzDHubd4DDbTNU
	 2lGQPOZDqJlxOp03Qg/6Pt2uGcuCQO0iJ9M7ZYTdVEUKlFyY396wU8w+qg7Mb8Jmm9Qaz
	 V3bE7K4F8AEIe/aIuWiayu5Zztm/q64rW/4pavQaaWpFBifI/o1qV6mwdW2gpZENAmcVO
	 xYkuwOfHnGmyoYcXPr2ja9OaeJ1uJ6BLVTsIsANGH1tmUogRgkZk3VCLqn1Q+OSz8m6aM
	 KS2eR2Qs2Gz2bloVqdTqLUKPLHMb+C3WbyI9SH6iijlN0dk0M/JjbE3WlKhCwMc3auQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9nUp9Sn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344F606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9nUp9Sn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084141F000C4;
	Tue, 17 Nov 2026 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794949206;
	bh=crMvd0i2658C5njEAPP0nGCaijY/CsDSVoywij2h/Ro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=H9nUp9Snf31KFFJS180gDtaqrtx3hdW8XSDP6Xyo0GpVxPQyTdwRJoqLOGQ+4MrdY
	 RFVxOlowyUZzHKbVCS/m7gTwnWJa4xd40MdABpKd/DeE65thNUtBYhpo97wmj2zlec
	 qf8pZey3AAKqSDw8S8IvhPG9UiWHv6IyzCe74cpSUon7gD8kJr/m1hdhMqhsiiT1CV
	 WsSzd50/qPrBMlnReOp4C1ANM7nw2yohKiqFgcDf4yHct682sCXWlTUns9DAFJmb2p
	 jRUHERva1fAajJNm6ni+SYHX2fG5DYkSJlREJ9blVpHGhA0Mw7gL/Ud4whNd53ACKG
	 ub5ink2FhsBGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14AA392B1D5;
	Tue, 17 Nov 2026 21:00:05 +0000 (UTC)
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
Subject: Re: [PATCH iproute2] libnetlink: zero padding in addattr_l()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179494920453.816462.3255092483491396977.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 21:00:04 +0000
References: <20261109232354.3061365-1-dave.seddon.ca@gmail.com>
In-Reply-To: <20261109232354.3061365-1-dave.seddon.ca@gmail.com>
To: Dave Seddon <dave.seddon.ca@gmail.com>
Cc: netdev@vger.kernel.org, stephen@networkplumber.org, dsahern@kernel.org

Hello:

This patch was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Mon,  9 Nov 2026 15:23:54 -0800 you wrote:
> addattr_l() leaves up to three alignment bytes unchanged. Zero them in
> the helper so padding does not depend on the caller's buffer contents,
> matching addraw_l() and rta_addattr_l().
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
> 
> [...]

Here is the summary with links:
  - [iproute2] libnetlink: zero padding in addattr_l()
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=104413f986e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


