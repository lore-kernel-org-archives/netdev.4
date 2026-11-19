Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099206;
	b=xMnKZis6eq3fEFCwl9RJykwId/85ia1Q5R0anZkJQH2ewD3/8e1CMo1Fafte7JE1O3Tg
	 aul+mqe5RlSzDNTXhIVJ5ZZpmWswBFxG71kqyoRXE0DcT9YIbilhErJUYma4SZP3QSOVb
	 j+aW6xPjsPI1YB4UEzGslYmdsHnsUfdok4wRFf94RQgJ4vP0tD2SPQF5Xig6jrEovCvA4
	 KHkFuCy9O2Ju64qYB+wIds1EUAxk2rEHEjOPVgLiFV4YvhBeCD+JsMPmV0h87K9MQCQ8K
	 mTV6jVCZ+5Y+cwkwipl3NmNH0L27LqeuQZIQ1FxTxA/sEA5TPKHqsYbx4w6njO9PMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=JZZeuN46WZUONBawEx9Y/62cwogowmJ6fVZH44nD2QI=;
	b=n1tFUyHOpkcN1TCNQccj5Z8UM3WDdvge5x3DKk6tZVDoPyEtm4E8YVjxEViUBFtR0K5j
	 F5TcobCCaV1iO20h/M6U+wB0I0/ckMgtbymPz0okVboc1genZdLsWxZzpd4pQt7J9a+XW
	 4cd2B9HGl4lD5JuPt5MZmZQPxcTg0NJ+iVJlKQDxSE/YEWE2mqHvIlirXXd1OdzzN4TSm
	 h8JV8Y031Dppv8rlNUYvSmKWDyl0RNGlni4cq1VGJAclazEYkMMfC2GSlkA5/f5I7zrpY
	 LfXukdj5O9yVmLe4rUhGOcIgXGJvYegiaYBcZvZsy8MQ/lKBwRBxmjAJdPNlY87yhcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7dEcQrt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83015606A325;
	Thu, 19 Nov 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7dEcQrt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440041F000C5;
	Thu, 19 Nov 2026 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099206;
	bh=JZZeuN46WZUONBawEx9Y/62cwogowmJ6fVZH44nD2QI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F7dEcQrtxKXxZbEkyXpeH9k94XnG16joMUzoWFZFIz8CrPodGVRjmUj9MSayvxk3R
	 7xM/Fpghy/FBDlINWbBOQ2sAbloPEYBbFbF294zAmVoNa0dsmeDu70Y60SNbn8aU4E
	 s2XabGxLmreEk8SBeS3gSPSOgeUMlE/c0EYOXrNfGNYs5sKZNjls9/2n89N6sBlG+0
	 k+bJ55WllWhz9enl0UM6wo0Edb7OcgkTRYDBTjogZVR3zbxEc637j2W3o+zvhvyHX4
	 dDv5Vr11MA/LSkBA3xk+76q137ll6TE2jOJ9YrmosRxkjY3z7NKw55XUvCnNvSheKh
	 YZFvRqprBAwOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A45D3808210;
	Thu, 19 Nov 2026 14:40:06 +0000 (UTC)
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
Subject: Re: [PATCH] net: prevent receive header offset overflow during
 decapsulation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179509920504.3130597.3198388033732007048.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 14:40:05 +0000
References: 
 <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
In-Reply-To: 
 <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
To: Chris Arges <carges@cloudflare.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 june@cloudflare.com, danjones@cloudflare.com, jbrandeburg@cloudflare.com,
 josef@toxicpanda.com, mason@kernel.org, kernel-team@cloudflare.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 08:32:27 -0600 you wrote:
> Repeated decapsulation can leave skb->data far from skb->head while
> the remaining packet data is still valid. Since the skb header positions
> are 16-bit offsets, a later header update can truncate and make header
> access use unrelated bytes and eventually crash.
> 
> Limit receive headroom to 32 KiB. This is well beyond the headroom of
> normal packets while allowing the networking stack to pull enough
> headers in a single pass without overflowing 16-bit header offsets.
> 
> [...]

Here is the summary with links:
  - net: prevent receive header offset overflow during decapsulation
    https://git.kernel.org/netdev/net/c/b10c986f1769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


