Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871806;
	b=12gwxz99m3YPkQnYj1XasYKNYiQiiAjPY7HYRKGE319hCLb7I00Wsi8sdWYW62OgrCAN
	 vGIaYqvl8sTJsXE6LewWMKJoULt5P52f+Q4lOL6zuw4vUpZoAOAz3ZywGFtHauTyyIc7a
	 fLYXc4KLR8BjQefSSv9O8z+FT26yCyv5dnqUt0rAyiWZRfb+tyg1fw8SN0RzZExFR0iTq
	 4OCx7DLedQSRiKA7xlWCbXmibQcK4yczrR52F/64WOZlB1IdzTU1IT/Bwtb9cUkzdIY0n
	 S0YCQ2HSXeqfW/XzWuPiV6ONuf7ai/k8LCf7yWx6prwiIzERXlPHiJgwumEiu3NNloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871806;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2d1/C/muKygY+FB1LWBPJCvJTWV1hknbYasTXckto7A=;
	b=BrNDHUrRr2Qt/B4yeCxQQ6dymGes3RcBTFts+Cf1hY6FwJKq+EORDOu9ckY3iLGHHXgT
	 zxt5cnWkUiwW6elNUayUAoHArC5Ve78DvQpI9Ar7PZc0a9oJ+xSH/8FEJNqgH0q3crkpd
	 lPOfENJlQosOwyKIOT0T8VBY8uoi0adu9bbD7a4hBl/FTsNyMYe7N5Es7Q2wsw6u3mws9
	 1EhC6toLIXDuQdj7akhnnvVQKWPY4XfgZbm2QWQwB+z5OOMN8SU+MeEbgF9IC5eWsANyP
	 uNxLkhALDq6ZHguGE5d7hFxdUE4aMwn2ZTBjAcg1jf91mJ2gK63e2KIMJ4vqVT1N92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knE7eJe9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B301C606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knE7eJe9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DEB1F000C4;
	Mon, 16 Nov 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871806;
	bh=2d1/C/muKygY+FB1LWBPJCvJTWV1hknbYasTXckto7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=knE7eJe9I0iOVOUhqHP/z70JwloTPbFPr+PeZsASX/9e8algTjzVmBFMd+grjW9De
	 IFeGDrj9vjHKzagyDi3YNIsKsPWGXIFSjib7Z5UHWLJLevcTYpExDYRL08dBafZEK4
	 U3/oApXPIQaUtNPk1amyJ5jUyoI1Ns53DkOOWhmqmni2jwCP5dKwXn7cOeoRVj1qRj
	 tZgnL8KpgTQmT2ocU8qZpOpXFh/4R1ZxEU5DAW2QwbpnFUie+0z5mF40lZy8ZlJ1jx
	 ZacE9AXRvaDowfRwJA/Yfp1fq+K7hwwpnHyZ313WE4wbJX1QvAS8Wapr5hI6CvP/VU
	 1sHWjAmrSAJCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77434391B059;
	Mon, 16 Nov 2026 23:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487180503.238365.3162953495840081408.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:30:05 +0000
References: 
 <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
In-Reply-To: 
 <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 10:54:27 +0100 you wrote:
> stmmac_set_time() initializes the PTP clock through
> stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
> takes est_lock nor disables and re-bases EST around the step, unlike
> stmmac_adjust_time(), which performs TSUPDT through
> stmmac_adjust_systime() under est_lock.
> 
> Both operations change the PHC system time, so both invalidate the
> absolute EST base time.  With settime64, a concurrent
> tc_taprio_configure() can read the pre-step clock through gettimex64()
> and program EST with a base time that is already stale once TSINIT
> lands.  Separately, a taprio offload installed before the clock_settime()
> is never re-based and keeps running with its old base time until taprio
> is reconfigured.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: re-base EST after PTP settime64
    https://git.kernel.org/netdev/net/c/4cad287cb13c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


