Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222807;
	b=HUr5kpfhhsVh0fP/hEVhsoGGU9Isxo0ct8iI6rkZUbpf2gd9O8K/BLwH/lk7Jb8cAea/
	 B7CbtgvxOL+CXr3scoO1wc03NG3sOwu21Yj1WpOis8ZhFvOLYZh2QE70XRm7m5+07OiSw
	 F6SBdk5ErB6+11TqaclzMI1nI425H/ko/MSAFVE2L7SKMuTjJUMl85A/DKpcUmkqvPIyH
	 uksx6qHYVh9SFKsIgPoO4znhgA8dPKXM3AfYn5RPNqFjdsPrqasRWBw6DuX4GaNLfF09r
	 2ImhyLi4PVfOeUhazoMhltS1g9kH737rj0G1mogTR8MBXr0w5ZqDGUfxUuZ3OCqAotg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=9sc/ZiXKugNMlJtsbGapa+VZXdiMcf9kEct8mIXnE9A=;
	b=4sqGfq6SDj+rPGJi4RiSGuHX/LrT7sbUXkCe8Hbt+7CKI36TG9xcFRyK3fZQtVDOd/lT
	 27atyE7jFR8css9wy37m1HWMTzTCoVizppioDFaRMj6aZlENDe9KrwQfIsLbi4DxDjAtg
	 R0DYUd/hJXYoK+9Mn6QhDgpIU3Ddi0AzfHk2c/pByj0vgcu9q0pKN2RyvEmB47CG+hLUK
	 NVdzhMm+YWdCjGGjiMqk8otrTybdxs+3LB2EqJ370Y1vfCd8l5Pd/QpfZTyvyT+c1/U0/
	 9VITAYYxuyloOIzHEtzdAbzrLvWmnprdt+xudfPSRBpe95q8WYuj95RU59Pll8Uj1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C99OK1l/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A1606A6A5;
	Sat, 21 Nov 2026 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C99OK1l/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822E81F000CA;
	Sat, 21 Nov 2026 01:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222806;
	bh=9sc/ZiXKugNMlJtsbGapa+VZXdiMcf9kEct8mIXnE9A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=C99OK1l/LRWxp8NcCro5PmYx1WfFT1gd/6JhLIfTYJgAQ/OEyHNUZxUR0z2XUeDX9
	 kWMkuiXFiyENK+w9EXCgvQ1qthVMfQjapMeOOZVcWydt0ugKXKHSEw4BROgbeqyk7Y
	 73ScRMwdRrK6pPaYAWd0uq51dFqobI09hbdZa0cP9veTAY6kNbF1HrHRXv5DaZPIUl
	 0m8oo/8QTnJ94faVJI+BhaiBH+ZAureXNfAbWcViqOWuWEubbhQU4kU5pEnNGfSuyx
	 adugjSygD/dTM/xObJnvr/Wp9YDO88K8CmUN7gkndTY5BYD5yxPgRioZH1c/9YL6qd
	 W8YQRrR1nAqCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773C3380AA4D;
	Sat, 21 Nov 2026 01:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a
 frame is dropped
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522280503.865874.8539377074564413694.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:00:05 +0000
References: 
 <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
In-Reply-To: 
 <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 justin.chen@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 21:40:39 +0100 you wrote:
> With xmit_more, queued frames reach the hardware only when a later frame
> writes TDMA_PROD_INDEX. If that frame is dropped, the write is skipped
> and the queued frames wait for the next transmit on that ring, which may
> never come.
> 
> Write the producer index on the drop paths too.
> 
> [...]

Here is the summary with links:
  - [net-next] net: bcmgenet: write the Tx producer index when a frame is dropped
    https://git.kernel.org/netdev/net-next/c/16cc4936fb8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


