Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563007;
	b=o3gJF1mfo0aMWhqIqasrf6SRwMtcFik0HeWVHsZxIMzux011oWLlN4pluClfxWzrcWg6
	 uihY9vNkExoxT7EH6n+Rdvn2dCe7XaT7wFhf+D32Cv1cBG4GG8Qk3cuMFToi+bSTHmzHp
	 7giGFIpyat1qw8U3x/p+vXdP71PNBsvQWp7Obipk8UQgKNtOE9DIVAVXQ1C9vKAc7fs7g
	 T9U4SSdYSbaDpJJ9mlcULZPZQKXWNlCbjaF7KHJIS2EYcX9Se/kPygUzckjIR/QpbUCZg
	 0N1qh59oQsCTN5+uWgguO1MsZeIo+lN/VuGWOV65kflLIQobngBil02c1eQ/vFE8PzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=H45MnTCwG6r/nWSOHwpJonaXN2KjN1TH0tq6UcyM3FE=;
	b=UhW1djjSs0nYR34LA7pGsnMgtTJcvaA3G5SrzQhd9ady83WbOuLxpUDYbW2LbJCePmYa
	 aUx6uH6vMruqnvLDS9h97pAv0dxIwOs6/iDnjO+Dag001qZTaxbCtWFcdBP4nO3BYbNqA
	 yJdXR03rx421CKsn+TrsnE2L1z35GX5AcOmastSpUWnfeHa1/loxTOXSKWF+grdX/SSoK
	 6H1gsfryFzmLgGMkVhHbBQ3aUOSVJjLUkarQKQ9IVjOmwHBFkvGBQ5XsGhYq2ZjgqEAZg
	 97hQ3KvKtwO4dGhpc7f7TpXzwEEYfpxZqJq+O0Ge/NMw9TkdP2a4Xggr4f2YRT/M01w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmXeHvuc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B9A606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmXeHvuc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430401F000D8;
	Tue, 24 Nov 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795563006;
	bh=H45MnTCwG6r/nWSOHwpJonaXN2KjN1TH0tq6UcyM3FE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gmXeHvucciz7QDjsICw51aYXWKN8vZquZWXV8Hex/jLDJuA2e/tmjNiq75J1pW9MH
	 USj6ErtjizAbqxSbpKzBJAq3+0ggUNQ+OgTfOgo5SIgQ7qJfRHz1qKeEaOzGWJ897I
	 oSXkRzyw8wQDxqjeVLo0UgDdwcYcVNPe/oE/qJIbbD+i99UwUJcvQsMcAF4czAkV3Z
	 NsIISE0CEOaxIMhBf/S+QHfw8o7VAFfh9z3+ljdv215cVZZQ5128517BnEflHE7o71
	 lQvlZZFgDQj2MFTMwBEVyb6SDOXIqAezvQZ5FH9fQZHJQqoKSS4t+48VrZwi3qT4bQ
	 Ih4mWXhebKZ4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2763808209;
	Tue, 24 Nov 2026 23:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net 1/2] eth: bnxt_en: restore Rx coalescing after
 re-allocating the completion ring
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179556300504.114898.3926498172470782592.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 23:30:05 +0000
References: <20261120034645.364630-1-kuba@kernel.org>
In-Reply-To: <20261120034645.364630-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 somnath.kotur@broadcom.com, ajit.khaparde@broadcom.com,
 michal.swiatkowski@linux.intel.com

Hello:

This series was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Thu, 19 Nov 2026 19:46:44 -0800 you wrote:
> With TPH enabled, queue restart frees and re-allocates the Rx
> completion ring in the FW, to apply the new Steering Tag. The new
> FW ring starts with default interrupt coalescing parameters. The
> driver programs coalescing only at open, from ethtool and from DIM,
> so after a restart the ring ignores the configured settings, while
> ethtool keeps reporting them.
> 
> [...]

Here is the summary with links:
  - [net,1/2] eth: bnxt_en: restore Rx coalescing after re-allocating the completion ring
    https://git.kernel.org/netdev/net/c/a6ea69915a23
  - [net,2/2] eth: bnxt_en: restore Tx coalescing after re-allocating the completion ring
    https://git.kernel.org/netdev/net/c/32756b82fde8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


