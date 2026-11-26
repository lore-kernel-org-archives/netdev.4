Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653608;
	b=Tq14d9/Gxc8shzquOpl7yWGh+YhJWMU49+qT+28RDoXUFh+EPEryT1s6uhGQ3RLjETQM
	 Kstz0xtvuFZ33aZJCycmFw3JneFI/Gxk6GVW5bliwPvO+poReHRgL4DJeV9IqvlfsaUGL
	 2lW7qJqN48o9JHHaqKuUMhz4UBtmsDcWhyVt0ywMHjd3lObN8qcQ7K5+Qjg0m38MmEc3f
	 FVt8oTgNSY7XtwAaV8I9WTavhKly4ocvr+weFD7eqWKkqvhTt+a2fUHOrZ7p1OYk9JaGZ
	 1j+TxzZ57zvPleOMd4TermBsejXrvh6cmpiSZlnbA6BjhQu5VQrYVSDjFlwBzCmW9dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653608;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vm/22rXzQM17elB9kgIgwFIHAgus38vU4r9AveaQCjs=;
	b=f7aj5WMDvage3VKhd4dCMxt5m6Tzz4scvL3Q6D/SJwyuGEw93RlBGRp6y0P8rBo09X3k
	 l1bprMND1YKmUXu6Z+DyPF0azuNTTpIJTbKeFdt+vbifM+bbBOCN4BVP5oSj7SRWNm77B
	 zXXJCixQHOyfLgeop7g0B88H2WC22j4XoafZLLQWnuaV7o3ZsaPSzJJ7ImZbmL7edJKOp
	 fPIsbBW6kVOxtEs5qc9ntnEJs0h320LZ3530c7U7fKQ3Vxvx9BhnAwmBAu27WoqDvv2qk
	 rZuHrvit8DXp9fAtckVqD6Edsy0WhL8yXjWvAnw8tANoUBJFPt6j9yVKiRygRFZoYpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYqINeJE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAC1606A31E;
	Thu, 26 Nov 2026 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYqINeJE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DD11F000C4;
	Thu, 26 Nov 2026 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653608;
	bh=vm/22rXzQM17elB9kgIgwFIHAgus38vU4r9AveaQCjs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OYqINeJE5ulIsGN5z6fy6i6zkucHpvIvITZm16JZLZtyGC9xyOKtvmA8CqyKRld56
	 IhQ2NPxOLQi3YpazTjzrEKknS/rJbE6meROanu+IYmeqVq6mmCtAMGSP1WDL/J1KiL
	 ZHeCBaMG0Jau/cqIbNwh7hw0TRkVmc/GlGwLBgcLopaXB6hC+xZrwCPOe6bYMAae9b
	 T343yPKnAa1K+bynlpBVf/a0dZSSjjfZYwXqm9LncgjhPOxTRB2KghcoFntN4eTOEX
	 RUrdB5WuX9sDIDkglq4/CWKEGS0kiizbDAbDV4z0HFMKWVq2qViAzeVFrjjrOFDwBo
	 /q6sbu7i9JZlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14DC3809A24;
	Thu, 26 Nov 2026 00:40:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3 0/9] net: sparx5/lan969x: add support for
 changing the MTU
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565360677.1416723.16277992235721163795.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 00:40:06 +0000
References: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
In-Reply-To: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.marko@sartura.hr, horatiu.vultur@microchip.com,
 jensemil.schulzostergaard@microchip.com, horms@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 12:56:57 +0100 you wrote:
> This series adds support for changing the MTU on Sparx5 and lan969x.
> 
> Currently, there is no ndo_change_mtu callback, and the MAC maximum
> frame length, the FDMA buffers, the queue watermarks and the TAS guard
> band are all fixed for a 1518 byte frame. This series makes them follow
> the MTU, and sets the maximum MTU from the 14000 byte frame limit of the
> MACs. As the FDMA is shared by all ports, new buffers are allocated
> while the FDMA keeps running, and the FDMA is only stopped briefly to
> replace them. Details are in the commits.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/9] net: sparx5/lan969x: stop the FDMA channels properly
    https://git.kernel.org/netdev/net-next/c/0198a175917a
  - [net-next,v3,2/9] net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
    https://git.kernel.org/netdev/net-next/c/74dc2d0d4706
  - [net-next,v3,3/9] net: sparx5/lan969x: add a helper for setting the MAC max frame length
    https://git.kernel.org/netdev/net-next/c/ff9afebc9cb1
  - [net-next,v3,4/9] net: sparx5/lan969x: pass the FDMA rings to the init and alloc functions
    https://git.kernel.org/netdev/net-next/c/91df1aa502b1
  - [net-next,v3,5/9] net: sparx5/lan969x: size the FDMA buffers from the port MTUs
    https://git.kernel.org/netdev/net-next/c/3a13261eaf43
  - [net-next,v3,6/9] net: sparx5/lan969x: add support for resizing the FDMA buffers
    https://git.kernel.org/netdev/net-next/c/c18f9b51d8fe
  - [net-next,v3,7/9] net: sparx5/lan969x: scale the queue watermarks with the MTU
    https://git.kernel.org/netdev/net-next/c/c634ae1440b7
  - [net-next,v3,8/9] net: sparx5/lan969x: scale the TAS guard band with the MTU
    https://git.kernel.org/netdev/net-next/c/f86caad45529
  - [net-next,v3,9/9] net: sparx5/lan969x: add support for changing the MTU
    https://git.kernel.org/netdev/net-next/c/a1334b92fb6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


