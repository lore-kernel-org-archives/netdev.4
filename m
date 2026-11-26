Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660213;
	b=LM7WvqHT/UywYdjoJFI/LfSmOhREpAGr+NAi8oGtyt5facz0TTU9+PMg0aE7zllxd124
	 FJ8fTEV6oD69PSxT6rByMULN7G6sGTmkQXHdEYTYqmrLL06uRhoVaaoJinhDuaOCgS7TU
	 n+ODc85DtquKUbcpK73WSTEClZsD859DlXvoeqaor5D8BIK0Z4gRn6QUFX8pr5/IO6Xwf
	 K+cyN6lIf7qVQkqBCvkQ9SL+Ke0MZp8n8NJdvmwq1Q57aEo7Yy/9f3UO/NhTRoDjWngaC
	 +GoyK6UrJ+qjOjYTvz3jLy+F7uoqaZV5OF1ajSYjUJ1aS/dPXZNIJZvAubIWLaNiipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660213;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=OYq7KLFjurGZ6Ictz4eB8z4EKcYKV5LWxFcvK5mbXaU=;
	b=RxErAKKLvMa//HS5kHSLr3SueDuaWZcG2nkdAc+iZ5RekSohuTPjmCi1LeUJ2jwC2iHX
	 bXp+ggCK4zRTexnuHn0IoNs8kOKsTPSkGUDtMb4uvvDZiVWEizY1zG0lsLG4NOCeWGIW9
	 oxgKX66rOQWYgdMuU6CFG7y4pR4u4eMuxs2gLOm2UxlxPjXpGIsjQsiQ5QftaOjN4NID0
	 H3aN10B0brfb8rE+cDVaGKcPpAErwug6TCAkDKJjtWOs5kLeh7h41UUCPpOizajkFukSl
	 L9Q5NpjTognqtFxi61CATroW5N4krKiTmVfI2i3n/uC5e/F0b4CnYbu6N4kmMBshi4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihgJ5ejy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6744606A329;
	Thu, 26 Nov 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihgJ5ejy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4469E1F000D0;
	Thu, 26 Nov 2026 02:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660213;
	bh=OYq7KLFjurGZ6Ictz4eB8z4EKcYKV5LWxFcvK5mbXaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ihgJ5ejyOpabKF9QH0lX5uFBsNBclpdlnWHC7rn9QiTyVHzaMYVON2vgXvXa33Sq1
	 rID76+KvwwMOuOSYN0XkKp/mZ5v+kVvcueIGvA/FUWKQRDlWtND502DNxHUc45qWqA
	 8FkhwQR65fVTv9XjhA2jVBQl2Ag2mast8S9VHgynuGM9KysghVCKGSRvBtpsR+Gdr5
	 pmrn9VMmKDQTcqxig+wzMpraokqE/dyMGyNgVrt2uCPxvyTFzGCeBwtASHU4QNtMGK
	 5GjNLfiob/FVl7COMFE5yYEv9c4qiRnWkafp3IZhhpLOV6UZo4jX2uYCe3/YnFldgX
	 kEObgil127V6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2793809A24;
	Thu, 26 Nov 2026 02:30:13 +0000 (UTC)
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
Subject: Re: [PATCH net-next] rxrpc: Fix the comments saying RFC8958 to be
 RFC8985
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179566021177.1457344.1493998506106673483.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:30:11 +0000
References: <3457200.1795168445@dhowells-thinkpadp1gen8.rmtgb.csb>
In-Reply-To: <3457200.1795168445@dhowells-thinkpadp1gen8.rmtgb.csb>
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, marc.dionne@auristor.com, jaltman@auristor.com,
 edumazet@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 09:54:05 +0000 you wrote:
> Fix the comments saying RFC8958 to be RFC8985 - ie. The RACK-TLP Loss
> Detection Algorithm for TCP.
> 
> Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission stalls [RFC8985]")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Marc Dionne <marc.dionne@auristor.com>
> cc: Jeffrey Altman <jaltman@auristor.com>
> cc: Eric Dumazet <edumazet@google.com>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: Simon Horman <horms@kernel.org>
> cc: linux-afs@lists.infradead.org
> 
> [...]

Here is the summary with links:
  - [net-next] rxrpc: Fix the comments saying RFC8958 to be RFC8985
    https://git.kernel.org/netdev/net-next/c/2aa4500845f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


