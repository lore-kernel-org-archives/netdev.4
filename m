Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715913;
	b=xI221tWqo91A7i0JxIOnCr2sbyb75hzUD/sgp293WDU4CGVALz1VTzFrAyN7nox8C60d
	 1I1u9xpXDAmfgYl37MP6Zof48nWqR2qv7KuG4U4zGBTBjGmU1m9tdoTmvUPqNYV1f6lYe
	 3v2V4oS1Lqwn27bVyT79NNEEsfiVLJhoL0/hcg3jvfyctJT7S6jksv7GFPycBqMBMbDPd
	 GjFPkgc81g24L7Qp/+NPdurxzpTwbYs+sqT2fwLI/qhYFAddpFEIcFd2sjxfvAlsle/HQ
	 YPTvyIcCj9kTi4yZaDhGg1PXi1ATjk6X7ouFqj+lI9KOrXcIh3wqvpiGLHIw2WpfoFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715913;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=C+XhVycr2/VAW4ziX9+NDkeiK6FicXMc6GM7XWkwqu4=;
	b=xFXh+HJOiSJvWwwWdK88XWHPsdZph5pqI3x4DyytZ2ysPfT7uIrgAvvQl9/+iX5i88Jd
	 a4WAGBsxYXb4h63lH6/pVMrxHygafKH722z9wWs+IM2DX+QCj0kxDRXsl2U7mS/3nkxPu
	 7E9aL5tkNy7eUNEnJ+0kiNK2fVvk9asJIjk6k7/yyPYMI6FwGDd7kQ2m4quPbhJAqtB7a
	 tIHfztDkBOJLTDh6oLz11QFm4oz7w4TRRoLBy91VX0ignSuVNPSKYieMAwQslInWDWij+
	 BJyIpLyqlNfPXI7iXnoeyI2b/sg9fDqa4t2vRpzcXvrpGCdgj1aqcR2GvmZHVAleNQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWD7eKDr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E88606A321;
	Thu, 26 Nov 2026 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWD7eKDr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9A01F000CA;
	Thu, 26 Nov 2026 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715913;
	bh=C+XhVycr2/VAW4ziX9+NDkeiK6FicXMc6GM7XWkwqu4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PWD7eKDruvOZ3q4WAc1h1jSxrtMY1XiLka9z2rRnpdAobVgMe5Xn13wXfJINzUdeA
	 KWfckbDE/2qw4lrHwx0No3ouHcg/7hfuaZHDlCCTi6qa6TdHkmbEOFNuKfUO+DoNWY
	 uhysax1uXbRGaGKUCqsU8clv80zvV9xPkH+oeQrn19kxn7HOzfkibbPQLmq0gygPe4
	 riAn9HjNFsNQ5orKheUtgM+fWfprgrO4jzxOJ+dWZe7Aqzr/Mt28Xmxg+9ywAnBa9V
	 pKxA5dP+paof6GVKlgUU/0uve0VxshTH4YALFnSmPbbOAU1DFSOtwogZ2Pm19H8qgf
	 Za+i21idOCTFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 346DC3805D92;
	Thu, 26 Nov 2026 17:58:33 +0000 (UTC)
Subject: Re: [GIT PULL] Networking for v7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261126162057.141802-1-pabeni@redhat.com>
References: <20261126162057.141802-1-pabeni@redhat.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261126162057.141802-1-pabeni@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git tags/net-7.4-rc5
X-PR-Tracked-Commit-Id: e1055cbfd6eb578417f3ce983cf44462e8465267
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9437ee8b6cf607e883b36e44bd755968daaebd48
Message-Id: <179571591188.542934.7675496034067210513.pr-tracker-bot@kernel.org>
Date: Thu, 26 Nov 2026 17:58:31 +0000
To: Paolo Abeni <pabeni@redhat.com>
Cc: torvalds@linux-foundation.org, kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 26 Nov 2026 17:20:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git tags/net-7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9437ee8b6cf607e883b36e44bd755968daaebd48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
