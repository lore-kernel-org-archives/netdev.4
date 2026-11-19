Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082409;
	b=yGryBbWjogppwp+NcbY32koQKPICsLh31A0BpfBOIwtswoFGBAcQQLszVhlEjHdlRCVa
	 W9PEm+Zs+ZfW5KJ6JMUVw118P4ANoFJZoOZMBCfVgVfm/QjFdlm3dKXrtHaCAc/9F5hwf
	 P9Bof6DxHMcDt4rRpUgLKdytKIBSarepGmimuYTYXpK2/Q4u0M7fVuvZ12+JJddgxF3ty
	 Ax6o4NDrc8G4atqRmW2zyfup0OGPZdAaJBmx62ocp9VHspugpEj0MyNzHMT+vmyUz9Gxu
	 TTivhAuIVjc80O9db0h43M7kcJUN7Y5gh2b9biSAnrPd942X6rVaDX0Mu1uDqpRwnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082409;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kTzbNMB0lkPb29C5lEl2iw0lD8pHD/bk4tZXLI5J+hQ=;
	b=JA5ujkT/XhAi2CKvBrXpC5/UjJeJwKLg0rVI2FAFXLKSgu3I87ed0L0K38jNDNHj0Nry
	 NKg1JxmNAVgdPYtBm7bhTPYaKl7U+iRwWQQZn93gFIYtqCZWaU4p5RKdZ6+GJL/na1RiI
	 eUVXybJKNKjnaaPQOGCkJiMoSAwO+/DTDHlm1kkmPwEGtoVG+csI5A5YPt/XNWYplMch2
	 eA5TVPdkikfzyGh4kdnXbxkFaCtobeQ3uATdl0gPsPa75/5vdcJS2k8nHooG78n/fhdWX
	 QKTRaMIJzP3rBtZgnmWPEo5aW73WSxLPwPlkMNu2YP+DeuXg/6gzYA2ceSujvRuNg1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nokqmaiP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A68B606A320;
	Thu, 19 Nov 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nokqmaiP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077581F000C9;
	Thu, 19 Nov 2026 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082409;
	bh=kTzbNMB0lkPb29C5lEl2iw0lD8pHD/bk4tZXLI5J+hQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nokqmaiPUXWYijRU0hq1hretq6+Ayze32k8fjoLs05g4KxO3hQmNM8uOp774N6IEI
	 4R1e91BQQ2KQmONqWYyJ0JwPgtlAXjBZzvNWvPI9BWT0r1UQX95/QyXYDi+nPpt4Qb
	 KDgDe1W4JvbP5RRwrrMv4ryoIlAhfk+qNq/uMDvA6pmq4EgnqJTAEZdBuPGiMsEM/r
	 Ozx4ujCsFKlUpgp28aROP6YonJ3mJV47NK98+VIa8qbac1Rb69s3Klyl19xmVAuAZd
	 bxOPfgGvn5nqdtQaibES78ueh4lRWMhwDmZyAZClCboZEcW8O+l7Gx8Ey5UPWQa8a8
	 bOdntlrhSTXZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F157B3808210;
	Thu, 19 Nov 2026 10:00:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3 00/10] net: dsa: realtek: rtl8365mb: DCB
 ingress QoS offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508240778.2985927.13937253116183236762.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 10:00:07 +0000
References: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
In-Reply-To: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linusw@kernel.org, luizluca@gmail.com,
 alvin.sipraga@analog.com, andrew@lunn.ch, olteanv@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 16 Nov 2026 20:10:11 +0100 you wrote:
> Add ingress QoS offload for the RTL8365MB switch through the dcbnl app
> interface: a per-port default priority, PCP trust and DSCP trust. The
> mapping helpers go to net/core/ieee8021q_helpers.c so other drivers
> can share them.
> 
> Two changes are visible to users. The driver now rejects a devicetree
> port that the chip does not have. With a default priority set, an
> untagged frame that leaves a VLAN-tagged port carries that priority as
> its PCP.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/10] net: ieee8021q: print traffic type and queue count with %u
    https://git.kernel.org/netdev/net-next/c/b41ef20ab56b
  - [net-next,v3,02/10] net: ieee8021q: add pcp_to_tt()
    https://git.kernel.org/netdev/net-next/c/7338998e37fc
  - [net-next,v3,03/10] net: ieee8021q: clarify the tt_to_tc() traffic-class mapping
    https://git.kernel.org/netdev/net-next/c/a8d30866fbba
  - [net-next,v3,04/10] net: ieee8021q: add tt_to_pcp()
    https://git.kernel.org/netdev/net-next/c/37d731911fc7
  - [net-next,v3,05/10] net: dsa: realtek: rtl8365mb: describe the ports of each chip
    https://git.kernel.org/netdev/net-next/c/2517cb4b6510
  - [net-next,v3,06/10] net: dsa: realtek: rtl8365mb: store the egress queue count per chip
    https://git.kernel.org/netdev/net-next/c/7e0f10801a0d
  - [net-next,v3,07/10] net: dsa: realtek: rtl8365mb: add QoS baseline and DCB default prio
    https://git.kernel.org/netdev/net-next/c/4af6c347edc9
  - [net-next,v3,08/10] net: dsa: realtek: rtl8365mb: program the PCP of untagged frames
    https://git.kernel.org/netdev/net-next/c/78dc82293945
  - [net-next,v3,09/10] net: dsa: realtek: rtl8365mb: offload DCB apptrust
    https://git.kernel.org/netdev/net-next/c/92a1dea3ebbd
  - [net-next,v3,10/10] net: dsa: realtek: rtl8365mb: report the DCB DSCP-to-priority map
    https://git.kernel.org/netdev/net-next/c/03ceee6094c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


