Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444206;
	b=l/I6OnZzVCDRkny002h9TGbBVln2Eot+tjw2lGAzdrejvtoA8WSiXeE3Oa8tQGdiEOXL
	 3ET/qyRxPxvOHtoWsepxTQtD6mkoGlNtfseyCq7WiqK+LqlMe0YxbyxHSfoezWWExB8pJ
	 XRU8loJMnAXT/37Wl/9iwlr44GOT8uN+EqJl3qK4TBIAgasUo2L6J1H/XbXICZHkiwGFj
	 qeel9G2kDa/gZ2A8mkwb12Im0PXlTX33ctuyNDEyYdWZ82K9SzabmnLaM6eUsonUFCTTU
	 fEvIt3IbxO/EszVlademAFiPU/6+vfUEBl5Ob03tyYImk0VypbSFIyVB67Gu6r6CFoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=xNxC2SDarUSKdnqIvB6WGjlLKHjwv3qTzMvW6DWFcmM=;
	b=jEIHRw+x8vq1cal2R4wr1LqdHMMhdWWdEfKyIU0PhDo3dsmJhSaq5364eKEx6kQMuiyb
	 PjcIXrQ5YAj8kkjotvMh73KbL6itzFVW9mAhTKWfkrq/SUt1LcaodNG2OdSfmgG48uDWY
	 hHJCgcYFn+eCBV6SEeF3VRiVja46yoLbsZ1q2zdY3IzqWVIzPIiKW0i1eQDY9okhQPrs1
	 BX6uZfQDRR1MNIBxSbBgEb55Be9WFvTR9EkOl/Gb54TIzr2pABohT7ocoKTArTjmOypa7
	 A0SPkHtaiaBrrSjWg7tv7+BWrvrelm5522C55tkq1YhI9YN52vWOBRkvToexOr/XvtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+MpWo9K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05E606A32C;
	Mon, 23 Nov 2026 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+MpWo9K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC98F1F0089E;
	Mon, 23 Nov 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444205;
	bh=xNxC2SDarUSKdnqIvB6WGjlLKHjwv3qTzMvW6DWFcmM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=K+MpWo9KKDXZSbJ9RwQvBf85WdropLA4sGmBg+R24920oLKvk/hI2LGRufVGLHcvv
	 LXqf/SjGztxTqdJBfgVUm8GtdguiruWGala/FP/Hcm8KT2BvD3oNko6knVtCM3nbNv
	 hCPcrNJsOjjKDB0EwhH+xbX0eZmgrVS1D2DQ+V3+0JrXtv1F5Nyu/O4TCJQEKABVmL
	 QE+LvGCBKCyAHQdhTKpFyZEtDushmvWHWjnz66ghobsMmKWuEBQbezj4gmKoG4HjBT
	 SVSH2i20FrqPYv9EGTGYHVaLJJdKM5FG3kKplXWe2RpeoWsl2Wmq5HDjrP5435+oND
	 b+N2iU/q3Mkdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B458A392EDAF;
	Mon, 23 Nov 2026 14:30:05 +0000 (UTC)
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
Subject: Re: [PATCH net] mctp: i3c: Fix potential thread leak on registration
 failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179544420466.2426925.6893559084832792351.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 14:30:04 +0000
References: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
In-Reply-To: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: jk@codeconstruct.com.au, matt@codeconstruct.com.au, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 17 Nov 2026 22:48:45 +0800 you wrote:
> mctp_register_netdev() can fail before netdev registration begins,
> leaving the TX thread and bus list entry allocated. The error path
> assumes ndo_uninit has already cleaned them up.
> 
> Always clean up on registration failure. Make bus cleanup idempotent
> because later registration failures can already have called ndo_uninit.
> 
> [...]

Here is the summary with links:
  - [net] mctp: i3c: Fix potential thread leak on registration failure
    https://git.kernel.org/netdev/net-next/c/5a3f240e32b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


