Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575005;
	b=TgcmD6rTYbp0DNbc22J3BBhNvl5tl2LnKZtdqLIRz0zpcYs1q2rFriyMy7PMdTwm16bD
	 rBglNv0cdo+uu/SaI3DZakstq6E8pFLiknXQCCNi8u0qXD5bsj6qUcy/X5szIE3yow9AS
	 zf74zbx98B08bMMhwxMp9cHTSdbHxuT9CNAtbvy5njR6tJinRH9pU6vGqM4lfJiuKJZdU
	 W1KewmwighE9ty+BLqGNHRY0tIUpOCMjQ7ySJvc3EoAjQSmRXcgg+9jLPIrpIy0OSIO+x
	 eQI1qwAatgoq8NLeDGC1hO8F+h2qxxNfvC7DjozILsVPzGhy2tpnRICjajPgRHLO5+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575005;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=C0qvmleUNt8jQHMO85BPPoTf3Y8H2mpDCimQJhLAn2E=;
	b=wTVz6s/RdtJ+mNMY9TpSkUR5ZQriV3/NcIXdIf7Nib5NGk15bOZ635VnENzy4XDvCOFz
	 iRi622RvKYA81Qo18CX/WQ9MyTZF2nica1eDjGa/gdaGJhaDkTbp54XlbWyFVWl9DZ6PM
	 ocAsh5gIMk4PyTZhagwHJFKyZ7YuNTw7V+9kp/6SFNA6vrj1/3ilSuElF50wBcfLVA+iL
	 6dsX8zVls2kimlemKXcX+qT4469Jf9Vld/upNdHbItFi2ULt+UiES3OyzjaRzsx8Tokk4
	 5YeL/9e+YaNbGo5I19IcJfxpZrzxCMxyYGW64EaFRAbrQIIn2GN45/0Swojd5u7xn+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDOGv0CW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084E606A323;
	Wed, 25 Nov 2026 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDOGv0CW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B501F000C6;
	Wed, 25 Nov 2026 02:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795575005;
	bh=C0qvmleUNt8jQHMO85BPPoTf3Y8H2mpDCimQJhLAn2E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IDOGv0CWT2/8+fWOkyRgjPBtevm4lJRjkJNiLzUxhXSqzHnfCmqQlEzzJZYJu7WQ0
	 OwQ6keCOolR3LmdtlapKk5GuZKY8xAGmIhOXFvRDWsLsljqhZLdADiiZch4UJPDMZC
	 rnNa/FICbc9Wr+gJ4qM0keuRvPkNXMpJeqR5ktQAlYS5852x2o4sHzIWJNQHjiu5EW
	 27gH/M8E4kgSQQ79wcztGy3JHEyUy4nUS+qzGsTAB+r4eLq/O5WRZlHUVPa6rEPY5D
	 qSdCwyH+p9Fs08f6F1anA72TNMz001JD/2Sj9lmD4VENgqxcl+s6xjLwxagZ3heuLo
	 KPdWKNrb4fJnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2F63808209;
	Wed, 25 Nov 2026 02:50:05 +0000 (UTC)
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
Subject: Re: [PATCH net v2] ipv4: fix conntrack defrag forwarding after
 ip_frag_reinit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557500407.181897.10585936260093377703.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:50:04 +0000
References: <20261120094700.46500-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261120094700.46500-1-jiayuan.chen@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, kaber@trash.net, fw@strlen.de, hannes@stressinduktion.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 17:46:59 +0800 you wrote:
> q.max_size and max_df_size are used by ip_frag_reasm() to set
> IPCB(skb)->frag_max_size and the DF bit of the reassembled packet.
> 
> ip_frag_reinit() reuses the queue for a new datagram but does not
> reset them, so the new datagram inherits them from the old one.
> 
> On a router with conntrack defrag, if the largest fragment of the old
> datagram had DF set and was larger than the egress MTU, a new datagram
> without DF gets DF set after reassembly and is rejected with
> ICMP_FRAG_NEEDED, even though all its fragments fit.
> 
> [...]

Here is the summary with links:
  - [net,v2] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
    https://git.kernel.org/netdev/net/c/3ab5aae0eb60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


