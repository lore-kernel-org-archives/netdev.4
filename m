Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911405;
	b=2/ERzPz+ifdmGoBQKPmnuuDMeEPKpmq/SoftG+kw8MXv+YJCIG7FvnSGgHWCa/cluj0m
	 FA+UU+o5VXcz+tl+Q0OWFyxioyocwPtVY4BXbhf1vAO6Z0u/qimyeNeM8sEK502VTen2b
	 n9k03A3qVclGDb+ZvrVV6qwxOttvGda6c5dQMdHcg4i26KEaN1wFdOOGZ+IWNW7Oky51l
	 /UOccmkcBPdnzPcKYTM0wpnG5PFY8cjtVvMreOYtqnBmwqNti+CFhP/R4j57vxUsgCj/N
	 H0td2dSgfXwJNh0CZYPdTvgchHK6ihVRNkAoElAsjojgQ4yf7lEaA5irORB7a44deVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911405;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vn+1ZxkWe6qtwcHWpfN1l/zhfeHkj1uuXYp37YQA9VE=;
	b=hHgmS20YBHEXFPaHcb2JlUInSkrRZRztDyjSw0+et8zfGvnbHnT4U3yMsl+OLAnCxrMn
	 HN8RYRsZBG1mIQ1ADJkp5Vox+MoA+0zIz+DjQMnrhU0QQax8yz/zFNuNCTJQDV2IqA8vR
	 AAhTGwpRApiZ+CVFvLp+VjM8nfT31wpKQoTF1qfoY2dIHtJDgdMwyunkLp/eooIRV9mRR
	 wU0eTJEwLlgyik5H9QOnBrVHpLqTDIUJGZAx9htdxPgne5FU5r+Kyj1OQQWTcjYs5j5dZ
	 D/At+lCO5sDGaIvlHz2aO3EQLBoMZ5UDLHq/hiqUUWXXgSBGBAOEnchEuL8gMtBd5Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuiIUulq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65EC606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuiIUulq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8074C1F000C4;
	Tue, 17 Nov 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794911405;
	bh=vn+1ZxkWe6qtwcHWpfN1l/zhfeHkj1uuXYp37YQA9VE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IuiIUulqiqXRfS3dl9ZZ6SCNQrAuREvWNkxUGXcr9rp9fJF1iiAxzHws5E73RVM5v
	 GTLO0ix3H3t4O+QWChOVIyBo/uAtIPusTPiynpr2vNLQ6ZciC+ZrBatLQme0E8Cz0P
	 eB/+ZXF9TUtgYnUM1Ciq/XAcVdS9D7uBbKOAvR3mkpUSNoiNMs3QyhW+hzmDrU/Yop
	 wUDIwcih1kbKWwtTGXS/Hz/j3XdoEsjZAmN1V4cRbeZoGPN9lNXZk+5kNVYdmXOD3i
	 4A1KpjT9bXVLhV4XI1lpoAYGoiXpHXH3d2DH7oZPQ6LMJOoKGF+oNO3gEr+dJWH6Cf
	 ANxiu03cGczGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773413926646;
	Tue, 17 Nov 2026 10:30:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next] netlink: specs: netdev: clarify Tx queue stats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179491140403.483352.12429682226556058180.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 10:30:04 +0000
References: <20261113173802.272995-1-kuba@kernel.org>
In-Reply-To: <20261113173802.272995-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 donald.hunter@gmail.com, sdf@fomichev.me, razor@blackwall.org,
 daniel@iogearbox.net

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 13 Nov 2026 09:38:02 -0800 you wrote:
> AI has been complaining during mpnic review that we don't count
> the offload stats on completion. This is expected. We don't want
> to force drivers to fully re-interpret the skb on completion just
> to get slightly more accurate values of informational offload
> counters. It's fine to update those as we produce the send queue
> descriptors.
> 
> [...]

Here is the summary with links:
  - [net-next] netlink: specs: netdev: clarify Tx queue stats
    https://git.kernel.org/netdev/net-next/c/f23dcd805561

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


