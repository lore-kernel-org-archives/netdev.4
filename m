Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776007;
	b=cXuLBk3Cet61au7Xr4sAXg6ymsC6pBcvHJFfZalT+zJ3DE0KzlV0Tuav0BMwDm3OsdDa
	 3QIrrrH6eLDdFxi29aNuyMmuGgK7JL6iYrko+JFG85/s9RoycKL6RywOIo7Us6n2b9Q0r
	 MVr/DLnCawS+oo6FtG8cShAkWTB33IqtjyTY5MD+Y9ersi4oOkNe7H0l5430dVYVnQ2WH
	 Hmzxk6F9lUuEGe+abhv5U4pjaKpwtWIEicyX+9pwjUaPdAiH09eOxxVrnmAJ1M88IGUso
	 nY3IEbHt+lLPT+PcXTNT8EiVyyP3mmz5Qjb/T7JYN4RltfSjqUTbCnYfNbJn1c2XDsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=7dqHBm/FTiAyvk5ZYqiwe2yYETVzuAeppZiw/mS/tFw=;
	b=IDXxwgMjCmrcKur5RRqYp5x7c/8w/AFpGHYDPsfwbxip3Q+jqtP/9HhfwX1nhLmy4up9
	 Rv3JFHUGMhZh/m022as8VCD6oFq0dP6oxEkh4lnsxjM09cIea8UoodvVd+kcv8nI/s+RF
	 ZiG8xUUBt+CHnE2hWDK9+GboyYFQTy5oG6qglOapdghWaDyvl/5kcYQqfci8Vl+gi78/d
	 UU6iy0ukDt08ekyz5xFv0SQnelfzbQU+1CMuvH1+fPSmwRYUXrdIpTml3vH50mzA8b61Q
	 C1XJSJoDRhVesr0w0Kp4hqGT87/vjeqF5lecdjmCVmJaU8U/qF0o8y/7P3PpDjKNyjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2aXDSzV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C563606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2aXDSzV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015A81F00897;
	Fri, 27 Nov 2026 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776007;
	bh=7dqHBm/FTiAyvk5ZYqiwe2yYETVzuAeppZiw/mS/tFw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b2aXDSzV+z80x7l7HjkCwIkMnKryyUlBGgkj8BB58kU7/J7aOrkqk5kgPF1Zgae94
	 S6gEaUb2Jf8rG+54LkP3Pvtup/7DIyzvbomsiwIeeiP++fPcHR1yD+5qKpcT8htFSq
	 wn/zy1Vl2pNla5tFjFyzTsD0RCg99Lb+SfaomoufEacs/n1+1q7Cbu//ZTc9xXnGD0
	 j7yicXNjwSOE58gkl0EoRnsILBvJtlnbuSS+PAMDIl1wJQrwI7TcEg6ir2dFjI9AdE
	 H4fM751ZEhLPPV+0702ywQhdqhr1VuvFD6R5ekE6HJ5UXTfbsDVB2tYUntl/5L6v/E
	 kMXyULfhEWrHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB85C38003C5;
	Fri, 27 Nov 2026 10:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net] net: sparx5/lan969x: only check the DSM calendar on
 sparx5
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179577600550.905521.3058207882449579825.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 10:40:05 +0000
References: 
 <20261123-lan969x-dsm-calendar-check-v1-1-0891cf3f4259@microchip.com>
In-Reply-To: 
 <20261123-lan969x-dsm-calendar-check-v1-1-0891cf3f4259@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 23 Nov 2026 16:01:29 +0100 you wrote:
> sparx5_config_dsm_calendar() calculates the DSM calendar of each taxi
> and checks it with sparx5_dsm_calendar_check(), which compares the slot
> distances of each device against data->avg_dist[]. Only
> sparx5_dsm_calendar_calc() fills in avg_dist[].
> 
> Before this patch, the check also runs on lan969x, where avg_dist[]
> stays 0. Any device with two or more slots, e.g. a 10G port sharing a
> taxi with four 1G ports, fails the check, and the switch fails to probe.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: only check the DSM calendar on sparx5
    https://git.kernel.org/netdev/net/c/cc02d3b82669

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


