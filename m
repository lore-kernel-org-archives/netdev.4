Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143013;
	b=P2erbzEJBaqRaa0rwbMUkJdnwQlheQIM+ESZMhQiVDvhR/Emv1xieCMFgt4j8gLmlLSR
	 dZEC4ZpIaa/fE+Klbe086lesLtCQ/dUF+cTwyyJYsA8T0ZvMFzoRKUJNWrtDN2+AtHqpF
	 4wZd81Jd7k6OvKZZsyXT8We3qpswCuSvVwEn4e2V7jOwIaVUvUR4bmyvAQO02DwUjuPTu
	 tqHXn6uCd55FerPM3uCTQ9smwQXOY9OWWdcOieCo5VuNtAvg8xMIFIhjK+m16klv7j89z
	 b52/yf15juU68/afYmiET/xZoRZgfUCgxCAplugLP5eNsbLgV42qa+LGlFnlMBCDmlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=HEvoiHJLgjOKNE7UKzLefC+jchL+IpgC5O4X9JUdA8c=;
	b=vW1DLiNpKTmDBGdWVWHHUm/WmdOaybkpZt5xnHi6px3EGBN8+ygXEOX+OZS7EaE7LQ1Q
	 UQTc9CreW2IbX9t3Dkex3CVihVES0IypZDKkWiC8oQZwIpm1E7yJgexLPepiDLsioUGiL
	 jCn0tZYozTjO0OWWHdRSeXcjAhW2S4D1aPPlj3JKD0SwBhcGO8M1PZja8NoGgwMC9EyJc
	 8Cwtm8yf+daWCZYXngkmiFX9Z6rzOloxXYPgY/AlLnahx/qH5Ypw/+T5X7zUxURnakNLe
	 fdQk5YGuxnUMdPfO2T8QCYWHk4N3Werb19xfyu2v3gBOOXEwAtO0qP38xadbAFpK/Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDomxy9T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29665606A335;
	Fri, 20 Nov 2026 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDomxy9T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE93F1F000D0;
	Fri, 20 Nov 2026 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795143012;
	bh=HEvoiHJLgjOKNE7UKzLefC+jchL+IpgC5O4X9JUdA8c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EDomxy9T6TEyy2QmVmrTyU7eJZgRkZ3nasYKHC+GgPGQnNSpDgjod48YVkxYjEGtG
	 9L0mp5ntuw58J0bc226BTqFhs0cGfD/6Ru8WXi9Alwa/58MdIeppDzR7XYXlhG8p42
	 lEh2o8BqkiCP03ARv7ZtSN5o6XQ7RYwySF3iVVWqTkXGSZ0F6bTUQXkuWT+0x+P0ZF
	 wby1g2l8+DRDRZ1u+tdh0LLk/oAq5zOP2SxlN5tRxq4JTk72ZiZzinh/3949K2AcLf
	 BfqkJ6sfnnz/tRwvmQ+eIvXGaclWAjyoIhikufR/7MF7bxPObo2RCsl43KodU10QUj
	 hQsNN9y01dEmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B450B3808209;
	Fri, 20 Nov 2026 02:50:12 +0000 (UTC)
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
Subject: Re: [PATCH net] MAINTAINERS: Update AMD XGBE driver maintainers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514301127.3992568.16003960745670956201.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:50:11 +0000
References: <20261118143910.3573840-1-prashanthkumar.k.r@amd.com>
In-Reply-To: <20261118143910.3573840-1-prashanthkumar.k.r@amd.com>
To: Prashanth Kumar KR <PrashanthKumar.K.R@amd.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-kernel@vger.kernel.org, prashanthkumar.k.r@amd.com,
 SarathBabuNaidu.Gaddam@amd.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 20:09:10 +0530 you wrote:
> Remove Raju Rangoju, who will no longer be maintaining the AMD XGBE
> driver, and add Sarath Babu Naidu Gaddam as a maintainer to help with
> its ongoing development and maintenance.
> 
> Cc: Sarath Babu Naidu Gaddam <SarathBabuNaidu.Gaddam@amd.com>
> Signed-off-by: Prashanth Kumar KR <prashanthkumar.k.r@amd.com>
> 
> [...]

Here is the summary with links:
  - [net] MAINTAINERS: Update AMD XGBE driver maintainers
    https://git.kernel.org/netdev/net-next/c/bc84a86664ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


