Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089015;
	b=OB3VeWU4pz58Kh9XhMluzpWvavvAHfQb5bWo3OgTbTVVCyIFEUHyImRJXLLeaCtqWYkh
	 CjcNjcOgHDxJBqyVNmIrnvKQvBiXStbugPFl6wGI7QIJIpQZLnzrVhumRq1Sd9mqP50ay
	 4HNlLxp9gkUKWp4BH6M3B2NB6I+7MNw+DSM0K8cHTAzhed0+MkcKk5sOYROYkfj1qhxKx
	 zJ1Ld6Kg3ngSaBgxktoPKC5JfwBx6GYHFAxWgA1ql76Rti33a5ZiyLEx4AiLL3VLuXqBu
	 zANoIL+uHsLBIeGZ7JXWgEWgI2zuZ6OhU/3Ygnc9/XlKXcz/Vh6nZwD+Q/nLpeU8U/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089015;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=9WRSEDQbdKk12O8pZAJGYRSeZCImNFY/GnaKyPI/mT8=;
	b=wF3Y/9mwTB5CWjmbhaumqvIQnA8lAJSpB+NVk/w+cMPnHovE9Gi5s8FxRH60XG1vRcgB
	 +DGMywICNME+1p6Ce7lYlZIXjNMp1Vj9MNzibiw+J3uh8S1fa3OD9IzSuav31an8EzxGL
	 Gjje58xDQfep/E46HVvp63aEEmpwxeyf0rnZRVnaNWcJYBJwcm8EmM0COVr4ENZaS43vi
	 sMCYxOB/vjZXfIeMzmERIshaqStCEXANsKVwsGJ38dob9nsXuuMYOhEHgvNCTbRtb2LUL
	 WgF8x+2a75GRFI8FmZIQFU4Tn7oZh2nCdT6E5Q3eFjZdfdyNYcNdg7LXxj0ZowbNHgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZU6LtQj6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF2606A337
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZU6LtQj6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421131F000C6;
	Thu, 19 Nov 2026 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089015;
	bh=9WRSEDQbdKk12O8pZAJGYRSeZCImNFY/GnaKyPI/mT8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZU6LtQj69TB0EJb00H5fjpgDBjuqRY61+OSJBaZvGEhx9hZoyJyFoL+u64NkiYXVD
	 KHd7E8zeSkTT5Uxfkl/S3XO/RJaSLTBNk+OCEHam3NoiJAZfT/VWRJD34Q8Z963Vj2
	 6JUg+19b63MXsYmx4eYMLaPZjEm8eC1I/tyBgk3dxOzVYZYsU6V5wr6RAJ4HW1Lagc
	 eEXXyHOEN8dY8dJpD3X2903+GQTz8R7DWO5Zh6Y9HPb7G6yZPxEvuTbjoABR2vWkkA
	 oeIpHIinYZlfgg3GTO9RilcLp2A7gDOxOLdsE7zjBT+YeYkUfTPo5BZkSFSH5J1iGa
	 DeNwhs3cvWH5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3EA3808210;
	Thu, 19 Nov 2026 11:50:15 +0000 (UTC)
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
Subject: Re: [PATCH net v3 0/3] net: stmmac: deliver frames with Rx checksum
 errors to the stack
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508901403.3043733.12061878293715104134.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 11:50:14 +0000
References: <20261114133640.3285413-1-opensource@grische.xyz>
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
To: Christian Schmidbauer <opensource@grische.xyz>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 14 Nov 2026 14:36:36 +0100 you wrote:
> On dwmac1000 the MAC drops every frame that fails Rx checksum validation
> before the driver sees it. The enhanced descriptor parser would discard
> such a frame even if the MAC delivered it. As a result, a VXLAN tunnel
> over IPv6 with zero UDP checksums receives nothing while Rx checksum
> offload is on, and neither rx_dropped nor rx_errors shows the loss.
> Patches 2 and 3 deliver these frames with CHECKSUM_NONE instead, as
> commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from dropping
> checksum-error packets") did for dwmac4.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
    https://git.kernel.org/netdev/net/c/fcfc52fcf89a
  - [net,v3,2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
    https://git.kernel.org/netdev/net/c/596c9408682f
  - [net,v3,3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
    https://git.kernel.org/netdev/net/c/2dd48c4615a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


