Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304668;
	b=TaiUmdw/drJWTSjlUvSzwNzbryYWgRuxQGJuSy/99xmDvEFbXsya+l3gY3JoPgNNxaKv
	 v254GbgtYSBIAyVjRPUMiax24BSSFZWIaK4coJe6S8k6l9ZIqb/Rmu6916YQyryEKlbbA
	 /cHH5ZrCZMRYnmkbZhtM6SRxLaCDyu+XhLnNBLmxwM7SPNLdAoY7oykABs8DJRXudKf/h
	 vqksdMplHkszEvKNLxZoE0G1d8z+I0Itb7ieYDCH8aFZE43WwCncMnz6t6JNVnzec0LM/
	 vtV39wfPGTnm/faWzEMgW6ZG9caTN4j6rr7A4JScE1sMZx363f9LcxqJhx95Ch+zzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304668;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ZJxIXFqAJYypPF+x9wsV4NgYYaa9n/Z9J2omV3TNaSA=;
	b=bBn3PctZCV0OfybeNReL86DJKF5Y/hqF08bdYcuF9KpdP1ru8q4tqRgq/QPtn57fU1RV
	 qTw2eqzt0UvN5VWOXjMdqsO0eWLx/q6fdjr0A3LDAY/HiRi7xGspwCYQz34DmPy4FgytE
	 GTA9qX9L1iRsmTLkLqRZIEzyD4JDqdqgJV2AMUPxm2wkJTLfnofTlgbej9JaqHNvFAUfk
	 Un3yhf/J4FwO9pboj6AFfv0DoUq8CfqVE7oCpyMXO8ptyx3/lKplkkqkNH0/uvxPDkTPs
	 Iez+Inu5F5PK4affhX0P7Vgjg/pvvayH/C0qAv/qLIfscAwz95C1c7pq1/GB0rv5FNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN1NlxRV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA414606A68D;
	Sat, 21 Nov 2026 23:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN1NlxRV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432A61F000D0;
	Sat, 21 Nov 2026 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795304668;
	bh=ZJxIXFqAJYypPF+x9wsV4NgYYaa9n/Z9J2omV3TNaSA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IN1NlxRVeVKbq48bXpg4wDWt4o5OxPskrP6Ggf5uKIoUE+fwP376PCPMuVPXg2fUY
	 aPNYv4Q0yxpHyX2RlvJ2a867Ss0FQy1eoAWh1A2KzBmovGeo9m8MzFDEdykhg9PcgH
	 oo9ga00PI3UZh3hLnA9u8IFPdBWdZ576Z3iCSEy9cUcKzYGGnbyvqAjUkQLlXuGBU5
	 gC2dpMQkUCpVedOFMYJSrAwgNNFySa+qw+JUgZa8YzAURChqrLHPZ9cCDM4KefoFMr
	 dytkA9WO2RRU4qsNCPa3tHUBJn0+AeSVL7eRS+CUzSuVBA0RPxJn/zWDDJ/olimXCj
	 v0nykTPbSwcRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A34B391B08F;
	Sat, 21 Nov 2026 23:44:28 +0000 (UTC)
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
Subject: Re:
 =?utf-8?q?=5BPATCH_net-next_v6_0/3=5D_dinghai=3A_firmware_handshake?=
	=?utf-8?q?=2C_MSI-X_pools_and_async_event_queues?=
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530466677.1212208.18435369009189702315.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 23:44:26 +0000
References: <20261113134743145KUhKvpwU6uqR0QzymEP96@zte.com.cn>
In-Reply-To: <20261113134743145KUhKvpwU6uqR0QzymEP96@zte.com.cn>
To: Junyang Han <han.junyang@zte.com.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ran.ming@zte.com.cn,
 han.chengfei@zte.com.cn, zhang.yanze@zte.com.cn

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 13:47:43 +0800 (CST) you wrote:
> From: Junyang Han <han.junyang@zte.com.cn>
> 
> This series continues the DingHai (ZXDH) PF driver bring-up: after PCI
> probing, it verifies the firmware version contract, waits for the
> RISC-V management core to become ready, sets up the MSI-X interrupt
> pools, and creates the async event queues through which the firmware
> will report events.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] dinghai: add firmware version check and RISC-V readiness polling
    https://git.kernel.org/netdev/net-next/c/a7e1c56d1f95
  - [net-next,v6,2/3] dinghai: add MSI-X interrupt pools
    (no matching commit)
  - [net-next,v6,3/3] dinghai: add async event queue for firmware notifications
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


