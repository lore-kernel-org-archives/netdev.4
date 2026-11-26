Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655410;
	b=wU/oRRtXgVMS/G16oNAQy+R4kq1pG1fypr6ea8iigK452bwOlxoglX8+qlYuDUw46pXs
	 2oHa1UbQe7oQFg2cGiKGlRqXSfdN1GfFR+RXOwsb+EAFotc96oFWMeIg4RCuPAUEkpI9x
	 Daf/XqHs1emGFCfZtTlndHg7nlPM7D78+ws4ds/CEcEKhmPXXkY+Z3wqLEtdu3cpW07Db
	 lKnX0W15X1zPcUpxRp+9veXCtfAlguI9DHZRLPVrk3N1z/Ef9F4ZKC00yd1z6rlEWs4i2
	 WREzXsofIGQkT/Q3d35+XXSrnfLpY8NSU2KDxvMVjgONNNRqyY1PI654JPBV2XHEMCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655410;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=sL7ADAMTMIoYwpkki9SjijgXTPROSoYnqRrVA20SES0=;
	b=C3fYzGrwydFqXzNk8pOgNNoSyTqUcSp2ZpsFbBAmkJ8WrL9PD9FBbsToUCvHtnG6a5bk
	 4tD4jX4T3g1bDZUi32BXb3O/9txJjS4lOkMJBonflGYQnTr5+oCxYweYFz1xPJdWLs+A8
	 IpZIMNH9KYgxGNlUBXp+T1WAG5kYaZDf2eo3sn6ztuMk2+WmrNaHOqsuB03QNqAyuU6KC
	 ULThqn4ZR7F+SgA4Lp98eM7oQnxhtBgNBy5No/1b9cvPCf/f9eBgV61ygMlsmiDw7sLuO
	 D39cxvRI+2Gd1wiFrLwvYiYMdMOM8ovlVz+qCYR5YSMRWZtPCmD08CLZNdFgxoLjWRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGRWUVMp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C230606A68D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGRWUVMp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE33A1F0156E;
	Thu, 26 Nov 2026 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795655409;
	bh=sL7ADAMTMIoYwpkki9SjijgXTPROSoYnqRrVA20SES0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZGRWUVMptNjr6QxFaGQl30gRSfNTqtASAH+SZaln+ZUO6tXBXOhmpD8YD2Gq3w7U+
	 LFkgklrzHebFCsUmGcHbNH+SKxbRP0QC7/dQnD6hHF/k4o6nTbj5cFHXlF1hZnicdo
	 /wiq1whaPYB98KhAmUAa4suo/ZYr5PBDg7EXxFX6RXYDGUPDRQVai5JSg7xpyn2n62
	 nUvfXLDAFvFKzt+HCBLzV4+iU9b/ST9ZaOC93dsiXo7gmSJS6vf3Ek0l5fUEUff00+
	 taAGlclSS59p/ebkYvXALmJzQgLUyN2FAZ7fLZy8lcCxMDluWFq5JwkJ1qnyotbvrZ
	 BtZxo/2M0IVVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44333809A24;
	Thu, 26 Nov 2026 01:10:09 +0000 (UTC)
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
Subject: Re: [PATCH v1 net] tcp: Don't clear saddr before ->put_port().
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565540826.1427026.15998481991306045915.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 01:10:08 +0000
References: <20261121203537.341320-1-kuniyu@google.com>
In-Reply-To: <20261121203537.341320-1-kuniyu@google.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, willemb@google.com, horms@kernel.org,
 joannelkoong@gmail.com, kuni1840@gmail.com, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Sat, 21 Nov 2026 20:35:27 +0000 you wrote:
> When CGROUP_INET4_POST_BIND or CGROUP_INET6_POST_BIND prog fails,
> __inet_bind() / __inet6_bind() calls sk->sk_prot->put_port().
> 
> For TCP, __inet_put_port() calls inet_bhashfn_portaddr() to get
> the corresponding bhash2 bucket.
> 
> inet_bhashfn_portaddr() requires saddr, but it is cleared before
> __inet_put_port(), leading to bhash2 lock mismatch.
> 
> [...]

Here is the summary with links:
  - [v1,net] tcp: Don't clear saddr before ->put_port().
    https://git.kernel.org/netdev/net/c/1ab3fb564f20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


