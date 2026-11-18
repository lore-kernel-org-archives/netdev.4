Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038606;
	b=4VFi6VoPvglO9qdLwfade48VSXKnUTf/9iZh95UUcu7aXEmmOaQBQeuFifwoezPBj4Mn
	 w2qhNnKpOfwppXwGslyDEfr4uieGOgmyeYBiIN3a1PkMOgXfSg+g+f5pNgw1fPUP2tCMq
	 ONZSBAGdZoYdI2LsnCtFQ2Oqp8z05r6T8wVOtU667HhpRLEV9bjAP9sFxugl4igJ0e6BN
	 K+ppw1Ei3UO8nbVbaXbfYaMnKCyQjTCw3M2/qRZ5dPjzwzdqGKRBjggOLQlSPZGy10ZYn
	 aTu9cKt60ZE4sIv+N5mxKJ/i2M7yeJ9iBig6+Ju2OhTrNwbbouxsOpvfjgJfijmAahA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=bh5BlVpMr1WoK+OfO4sscFfPCfvLDUYAGc+AdhSHcf8=;
	b=HKiAU/abtFf4fnXRpP9PRzhZPLmA6+yAhB78trcepHVpkTgFLHbeg1qyOc6ye/mGmK57
	 MkmajnWpjB2YybGn4jcIYBCcHku89xDeelFrPMKPKj4IxJt/qXg2zQmqxBNXjPpVqVDFR
	 p0k2GpvylSHGOCWUc1HszvPH6FvSkOTIMj30OdCxduhsrsdg8XEee0FIr8n7IJyZKXD2f
	 NxTFkUWKAicwBC5Cj/4nu7iNB6N/DBWAjsXTp/GnTazAOTjoP37QR721HSE1SsfnO9Mpf
	 NswxY0oLss56YYv4V6giB1hBSBT7w7xqq2TnVCXmkHctE+7LAZ5TO7mAyotEznA0pXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGbEaaZD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42342606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGbEaaZD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ED41F000C4;
	Wed, 18 Nov 2026 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795038606;
	bh=bh5BlVpMr1WoK+OfO4sscFfPCfvLDUYAGc+AdhSHcf8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dGbEaaZDbGCt5tRYtJZVNxpDt1BCzUhnbRCbOYB6H31hkmlkCK41Y6sku0CIqbnYB
	 286J19rb1x1oiWTRm9aDmi9zihdlhl0J5iMfHI35sSqx8wU5XOzPmVEsOg7BPH52kA
	 OMN0dgp9tsmBo64AWvShIAAg9qoVqQwAaGhypUQRkYkmd2kFO8ZIPx3lQGnSeDvABb
	 Hf46+jOy1ceccXMppOYVSFEl24pubLYbrDNW67s0N9NXHEmomZJFcoxZdBKl4DcL/r
	 obhWo9ZSF73g4NEEH7D46qatY35ZSb+forclsWY8OLERtMjgBUdevP2P+FYyWh1eF7
	 JjrLz7+IVLViA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F17223808210;
	Wed, 18 Nov 2026 21:50:05 +0000 (UTC)
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
Subject: Re: [PATCH iproute2] ip address: don't emit empty JSON objects for
 filtered addresses
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179503860453.2559040.8564716318073254608.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 21:50:04 +0000
References: <20261116181711.292634-1-stephen@networkplumber.org>
In-Reply-To: <20261116181711.292634-1-stephen@networkplumber.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org

Hello:

This patch was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Mon, 16 Nov 2026 10:17:11 -0800 you wrote:
> print_selected_addrinfo() opens a JSON object before print_addrinfo()
> decides whether the address passes the filter, so every rejected
> address leaves an empty object in the addr_info array:
> 
>     # ip -j address show proto kernel_lo
>     [{...,"addr_info":[{},{"family":"inet6","local":"::1",...}]}]
> 
> [...]

Here is the summary with links:
  - [iproute2] ip address: don't emit empty JSON objects for filtered addresses
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=87cb3f419850

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


