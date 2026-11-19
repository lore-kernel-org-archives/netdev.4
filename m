Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052406;
	b=hhHJAeMW4dCSycHhxElzdiH+hN9cIlM50sRlxK7C95QgN7656Bh6Kc8KmQh9oVb4K8mG
	 tcubf/OX4XDghF6bfjs6Ir7jft/ScfPw9C2MGCC1fLBYX6Lte8PPg+shhoPJjgZVjhi5e
	 E9GXMzt48VRNfTvl23VvgWo5IjOUha0bpXUOPEMnl6A7WuSFPG9i0slWyRpO/Bph6TDqk
	 rS62Gygz92k1OjTX6kltEEMZUw3SY+irME/g4jBtyTIUysbOShuWqTpDhP6+A9Mz0Ojn7
	 OD1koMl+ST7KD3Ldzwut9aQf+bLLrfFKRJ4ShC0nD02SiG7TjzxMYJheow0cItuPUKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=W7SHR72+LdBhjeUJUmQ+DyimP5GUte92DHKvYCVcaho=;
	b=QEV0PtvkLkX4yu8TuY0OPAMhIEj1eLMz638JHhhlcDdo3RNSsRdAaH6xAomM1wo0b3qV
	 aJ+nplmNPpqLsDbpky9ltcTwGJqBSlkeFmGts9kMl+OSjbiua8YY5JxR+8PlvCY6gjVuo
	 f8xlmwblY4i7nb6d3yT2GCfDbn5AykbdE8VhMfmFlkaIEi5tgQj1kMKqV0rhlQb3J3Kd5
	 i6upeME1ur398IX8s7vEBNOK8PIUrl7c8lY32lUVObDwWAXC6fzA61dpve6R6FUHeMCbA
	 mUEQ4W+MQvOJl2DhG09LhX3mdzeCTKkCyi8kRoiXSiQUl2Uo1ixBKxxCHYlk6mijXBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R100wCR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE133606A320;
	Thu, 19 Nov 2026 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R100wCR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFB61F000C5;
	Thu, 19 Nov 2026 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795052405;
	bh=W7SHR72+LdBhjeUJUmQ+DyimP5GUte92DHKvYCVcaho=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=R100wCR5n8JHCXvur07olBqP/QQ0m9fb3HaM7lVlSQyc+kLUySaDEyP2VvbosTF8s
	 CFauVw10qXn/eIAbUzL0eOFBdnIk3tfXoTHjlPkrqJhitjPKL18jQjjOHWVZ8muMX4
	 Ma53hAqMSKk1ciZJnWkvoWl0Q/mTtb6OowJESVe6L8tc92lFpbN5m1JyaAlbNTBHFy
	 XDLKNTeRtPp2w0gwKUt1hpr12tyTDn9HrKsMYc6YCaO94MugonBIrRorz63andOag4
	 Th9j4uL9MpZAAGTeURKc9Q2Qr+JvU60I8mqI8jH52/XNtzjJxqpZsJpDRULXDYEfpO
	 II/H1j/pdRP+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45CB3808210;
	Thu, 19 Nov 2026 01:40:05 +0000 (UTC)
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
Subject: Re: [PATCH net v5] net: ethernet: adi: adin1110: mask the RX IRQ of
 the
 port being stopped
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179505240453.2706708.1042366992857276470.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 01:40:04 +0000
References: <20261111-adin1110-net-stop-v5-1-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <20261111-adin1110-net-stop-v5-1-yuehongwu@cmss.chinamobile.com>
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, kees@kernel.org,
 nuno.sa@analog.com, hkallweit1@gmail.com, nichen@iscas.ac.cn,
 alexandru.tachici@analog.com, lennart@lfdomain.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 10:30:00 +0800 you wrote:
> adin1110_net_stop() programs the RX-ready interrupt mask of the wrong
> port: it uses ADIN2111_RX_RDY_IRQ (the second port's bit) when stopping
> port 0 and ADIN1110_RX_RDY_IRQ (the first port's bit) when stopping
> port 1, while adin1110_port_rx_ready() uses the opposite mapping, port 0
> -> ADIN1110_RX_RDY and port 1 -> ADIN2111_P2_RX_RDY.
> 
> The port being stopped therefore keeps its own RX interrupt enabled while
> the peer's is masked.  On ADIN2111 that stalls RX on the peer port; on
> ADIN1110 the RX interrupt is never masked at all.  As the interrupt is
> level triggered and adin1110_read_frames() skips the FIFO while
> netif_oper_up() is false, the stopped port also keeps re-raising its
> interrupt with nobody draining the FIFO.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: ethernet: adi: adin1110: mask the RX IRQ of the port being stopped
    https://git.kernel.org/netdev/net-next/c/8199da5970cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


