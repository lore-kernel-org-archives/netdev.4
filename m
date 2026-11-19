Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122006;
	b=vOVv4zGf/6pVhkDIV5WeF1LdX8A0PqVIetJ6u3WuV6dmG5UIjtbdWRqz7Xn1HQuJMmUT
	 povIeVqfcENGUhmZ+5C2NrVAu9QcgOmNnVESYIJ3U1En0Az1qbbU/RWVWvsDlV1R4wYd8
	 Wn3BqQuCqVeM3BaO6Zyk165S4aipIi42GyUR9lklQHjOwJZayyxkBVpwkiO68NnGGKn9l
	 goCFMKieDlrjEuZrUsCj6j+zcamSRrFkDVQPEknd2CF1aGyRrafpziL6BWmxm7jyrp6WZ
	 m8o3tvq6fuYg8zT3mYv+VwChWFKoRVjMKnzZUHJoJ0f1Fjposrvlvngmfh6Ompx72KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=3A25cVy87QHR88s5yF+T27dGgaGRZ+rFUBw/027HN9I=;
	b=suez4K97mNNp9YFs4VeJ5X8OkJInpxkUryG41yM1K1LNAsk2K6bgN/DjQRY1vxhbzRhc
	 a54wp25Y/LgM5hvOgkdswmrU+ZWcG3sELJFDiZ/hN8JNRPeVZ5SX2aHubNFw2zv8JT/X5
	 CyPJf0I57CcNI0H43jgbbt304/Vet4i3NhbglW789IbPskIE+DWIJf1MNlmqr+/8lwsWd
	 AhVfb0aQh9FmgT39pQj2tnVIph7PgjakvbsfnBkuLam9YaP5zmAbAxIpVQ6unBxtJKoJx
	 sU0fUHRE5hy+iOLI0nsaLMhEdXRqCMUeRg4XzyC65m8zp1VyWKOREnbiL99hkKPwK2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9q6mnol;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933DB606A900;
	Thu, 19 Nov 2026 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N9q6mnol
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38A91F000CA;
	Thu, 19 Nov 2026 21:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795122005;
	bh=3A25cVy87QHR88s5yF+T27dGgaGRZ+rFUBw/027HN9I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N9q6mnolFvGCE8dk3yJ6FplOoarGrULKtVCwBnDk4npT6/N+L9BPttM6oIgdqqill
	 p3SB9dWnQwF+pIkAyn0gdaz+fgYVwcHFyHgbfsQC9v0wAOs+9re/7DyQmawTzGnIiH
	 wDuY7trnZwxftUpaaNReRqmTi/DknKw3G+yvmDGTZV3V+9TbwdO6DSN9W639n1KPC6
	 qbz5Kgp9YZiwVwk1WyMm9AI1M4NK1dSLjAwOUov1A5BBHzPCfbl1+L+x/F38O3ChRI
	 1hv/iUrDIhXn0oy/AuSn7oF5em191bwHUKTofE4vswdqFGMMEmwM5NNprX1V0cZM6J
	 TGUOljoCyd6lA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B440C3808209;
	Thu, 19 Nov 2026 21:00:05 +0000 (UTC)
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
Subject: Re: [PATCH] MAINTAINERS: update prestera switchdev e-mail address
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179512200528.3857806.587988169694867113.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 21:00:05 +0000
References: <20261118123126.326686-1-enachman@marvell.com>
In-Reply-To: <20261118123126.326686-1-enachman@marvell.com>
To: Elad Nachman <enachman@marvell.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 14:31:26 +0200 you wrote:
> Update the Prestera SwitchDev subsystem maintainer e-mail
> for Elad Nachman.
> 
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: update prestera switchdev e-mail address
    https://git.kernel.org/netdev/net/c/5e2976e52671

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


