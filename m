Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226427;
	b=4OHC4t4ukJT/rJ/WXAgJqxKY9NUmNQpfVtmTInVgD0xG3pCPiBx212QyBfTW+8aEyDw/
	 WEotWK8JXu9O3pwmzBbWGqDSUgtaSKHfmvGKXzOs7eJVuEQXCcF/vVFIqqYJ7dpp7xqXP
	 kPFZRYKg6AfykkA+d2ISZTtRFyVJP0m+CC2B3NbfimZ3TxwhpGFFUdcSicXOchKh9kONI
	 RN65KoqaLGSJ8p5bowJvj0zKgPVn3jWy9UXrDAAxx5N9TFpkgbTGcalXdG1GJZ0QsVGws
	 EaZZWNIBN7I27qi7ksRBM+BLI3PTx7Kre+vgiq70sRRNjpl6s4Y7qRmOGjVDDCnvwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226427;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=J4bFw8/EuN4Zz6N55Uxb09Z0rBE4jz14b00LN2+lYo8=;
	b=M50cdZZmrSpKHiM5DDGoV+EoF13zh7anugLHck/qUFKU4dmOtK/6qOFzGGd187W+FLbJ
	 u/wFO/UnvoudRIuKbZIzsAae5axhls3HV3OmphxV+/NoeYhwyzI59Htzf8WTUHEBT6+6l
	 NrLjLcilE5qE9PbH6RgBuAdiswSXPlf97amOjwIS6kuyZUAIaMbjpmdKMN1szQMbaFAWe
	 xir4sqS0XhR/JZOInSeVvHGmQiOVMYsiG+itvLQURRNDvI2mTFBjprjpQHA9yWmu/u0zQ
	 78HekASsFqEChRXxc/3aOIpbIoC1Uxi+ShH6QNED+sRgcL7yNk1u8muC6jtxh3tuWmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YV4Ik+cd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA07606A6A0
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 02:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YV4Ik+cd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4264F1F000CA;
	Sat, 21 Nov 2026 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795226427;
	bh=J4bFw8/EuN4Zz6N55Uxb09Z0rBE4jz14b00LN2+lYo8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YV4Ik+cdGaG55oMXRFKfV2riWIjzgu0GcC49pzZs+Yk8kxVgnLAnTXTyramh4Cy2Z
	 2bf8D4kMhVxY5XfPcyJFCClF0vWTzE52c1PSGiQh1EQK1c3wDwqu9H2cZZ1mYA1y/F
	 +5p2Db2Z80N9jAuTR5XUaMT1vfuxHqFBCrmuAFkNuEnGwEoQ4jawoTctO3ertI+d4a
	 MmRrWx2wHGgZRAePGmmpXnSqMz1uMS2ckUTlZdxCMoBOLJeRfzo91FH/MCuuYFvuVK
	 NDhpaJ2m/TTWOa+kfmyy7SFZ6VjoAtzGc/B5aFLn5aC+puWhG8Raj8WUnqpuvzvbL0
	 vdhki6rWXZ8uQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A292380AA5E;
	Sat, 21 Nov 2026 02:00:27 +0000 (UTC)
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
Subject: Re: [PATCH net-next] idpf: batch RCU grace periods when deleting
 NAPIs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522642577.886068.17369813306650209581.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 02:00:25 +0000
References: <20261118213538.1485503-1-edumazet@kernel.org>
In-Reply-To: <20261118213538.1485503-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 22:35:38 +0100 you wrote:
> netif_napi_del() waits for an RCU grace period after each NAPI.
> 
> idpf_vport_intr_napi_del_all() calls it for every q_vector, so
> stopping a vport with N vectors waits for N grace periods. This
> happens on ifdown, and on each soft reset triggered by a channel,
> ring size or MTU change.
> 
> [...]

Here is the summary with links:
  - [net-next] idpf: batch RCU grace periods when deleting NAPIs
    https://git.kernel.org/netdev/net-next/c/bd5ce5c9ae25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


