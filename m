Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140008;
	b=URUvl6gzsnrptttELTEjBNxdwgpVi2TZqd5GuFXF9Mno55EB4SB1t5p2AClN1sVlXFhB
	 lPF0alHKAxP6IS3ryEltZ76FVLgNyE7iqdF0nA59r6uYBTNiyVjqXutiy1E27KqBnVChn
	 pzBaJeCstXY+/zEmnVSzQs4j/bKWvHemur39v/iZOwdIHQvt5uYUNrrB6ojh5Eqtk487T
	 NGcSpcCMRt4H1PsvOPloQz/SvEbgCcGJ7POD2znILXLwGuePvR9jcErEP/ESYvwc8S8ia
	 NGDJs763zOLy09243sINC2JrYStuFvPugCsJ+waj/g2Y06I1z7/fbE3O4y8Z9jkThvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140008;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=+1N0HRY7e4qg3hsUey9t5xr0GAHQl5sEuJ1qjlEcbpc=;
	b=GA2v+QgfHhdbeeprSUCcurRiJQW2+0qSTgAWwOPhcoFVTjQhoKDrAzmP72C8tlvMoSmI
	 w7Ce0m2Lc9HbiWbShc/U0eetAO2D6vj1SOS/EtJF5U+WIbS+FQpK6SVfbyf3KLothf2sG
	 G035ppbQDDAGvYowrEKyBRycGLhlQmeeTDcRRtvl6KnbPqgiJkkyZfb7j/ePe/LonluHP
	 +eCOixR/alyI5ZTqmdj/WKNTHQrzg0gUfvP1lKMuLVhtrvX8CvTE/ksBgLhEdL4DLdJnZ
	 CaVBGd+IBs3pr/oWzu44yMlGjCFC7Wpq+Zw5tRIyuYmuQG2c9RBFEdvwYwC2fXUQQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfZW8I1d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC55606A325;
	Fri, 20 Nov 2026 02:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfZW8I1d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098BE1F000C6;
	Fri, 20 Nov 2026 02:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795140008;
	bh=+1N0HRY7e4qg3hsUey9t5xr0GAHQl5sEuJ1qjlEcbpc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UfZW8I1dAgFqk989xLTrU6wd05EufM1Kv5g9R4bm9JLETmHe2I6dNvfgfuL3XKfz8
	 f6rI7SFJUChX4tWtt2HmT539/3g9V8LvLT7pBT2d1sKafZ6w4mlT9FAOuxo3xzOzQ4
	 LoVNN6O+SeIDc2xU945z0j9FC4nIlUdygLzp1DKg3aZCRgDjvmlgVJqeoavZyteBta
	 2ZwMqWkEDBYJ1vmFle7Y95HQNHbRhh11qkPGSuuyQ9IrxwBF8EPN8swUSbefkFW8TZ
	 zlHiIPXZqMtF5Jnpr5/TKn3zWzVvPtnDVUePiAHAbCYjjXuOMXWH618EtB3BhpeE6t
	 aMAJG0xb+6RbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16E93808209;
	Fri, 20 Nov 2026 02:00:07 +0000 (UTC)
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
Subject: Re: [PATCH net v3 0/7] net: bcm4908_enet: TX ring and DMA fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514000678.3977048.3079257794014702506.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:00:06 +0000
References: <20261113235847.517308-1-kudzo51@gmail.com>
In-Reply-To: <20261113235847.517308-1-kudzo51@gmail.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: netdev@vger.kernel.org, f.fainelli@gmail.com,
 florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 00:58:40 +0100 you wrote:
> These fix the BCM4908 Ethernet driver. Patch 1 fixes a TX stall seen
> on a TP-Link Archer AX6000 under sustained load. Patches 2 to 7 come
> from reading the code and from review, and have no reproducer.
> 
> Tested on an Archer AX6000 with OpenWrt and Linux 6.18.55, whose driver
> differs from net only in one tree-wide change, with the LAN going
> through this driver: TX and RX at line rate (941 Mbit/s TCP), and four
> ifdown/ifup cycles of the conduit while it was sending. I ran the same
> again, plus a UDP stream at 1 Gbit/s (944 Mbit/s received), with the TX
> ring shrunk to 16 descriptors for the test, so that the queue was
> stopped and woken over and over (about a million qdisc requeues in a
> minute, with the ring full or nearly full in a third of the one-second
> samples). No stall, no errors in the counters, no DMA timeout warnings.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/7] net: bcm4908_enet: fix the TX ring wrap
    https://git.kernel.org/netdev/net/c/4f8b1a7cf754
  - [net,v3,2/7] net: bcm4908_enet: drop a TX frame whose DMA mapping failed
    https://git.kernel.org/netdev/net/c/e1d4683fb4cb
  - [net,v3,3/7] net: bcm4908_enet: release the TX ring on stop
    https://git.kernel.org/netdev/net/c/e2785f0ff0a2
  - [net,v3,4/7] net: bcm4908_enet: unmap the buffer of a dropped RX frame
    https://git.kernel.org/netdev/net/c/1b48d619448c
  - [net,v3,5/7] net: bcm4908_enet: unmap RX buffers on stop with their mapped size
    https://git.kernel.org/netdev/net/c/1da02595e8d2
  - [net,v3,6/7] net: bcm4908_enet: publish the buffer address before OWN
    https://git.kernel.org/netdev/net/c/4d47e6c2f3ce
  - [net,v3,7/7] net: bcm4908_enet: order the TX ring index accesses
    https://git.kernel.org/netdev/net/c/ebe31472ad0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


