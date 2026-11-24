Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530006;
	b=iNpTu8cS8s6q0yWoRTX3DMq1rb4mNgmgY2R+SJFd4XNpHqR1mTdJr6ACYlTUgvyVbOie
	 JX0+EEjVgTJ1PH8pxVQXhRWXkye+YXvYUyz74vZxmnF8vV/ip7STxPzXU0KjQCMdCLqAq
	 dsD6Tntg5/mlilq4EB7JkqwvHJe/0NfT/KOSHaZHnlTwH8rJRR33gh+2VKintNnorEOYl
	 /qOPldzD4sw4wiFuMzmx+IlfLo+qZ7mJGJGdl8vuPrzwlRyBeYGVZoCoa9F1zIQIHeVYB
	 tvX3d58j7+YkspAbtqd0j9hzTQLxwaE+4bN3mdD28ILWbrGKA7nnwHnhSVTiOx7BpIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=7FkQCSKumptrlNqGgoDwC9rbXCda5xGvx4D/zuYPFmI=;
	b=pQGXjOJlx+ZDuOL3wyK6TruZ0CLzDEzTiBzC3WTSR6sS58fjsnuf7rqjRgrwhckQw4Ab
	 91YoV2cEUgetULCnd/4zrSaMUvhRtINS2C7kvwN0j6ooqNulTe0u3OxTDMuAL6oMtHtnQ
	 s7AXfpBPLNZ4Q6SJ1D28/sEGccT9tUvuuMl/AVAJGKLlN/+I7VnzzOkkx15P6Yuy4cb+Z
	 AYGV05AnIoWwZl7lBOGvmiWcFG6wa70qEfVxaQhlbaP0bVcAjG68E50HqxVCUBxLwTX2E
	 ppmLVbmdeCG82eT0baSHqxFuP8HwyKSR+LwYs1XX8J/GB/TlNqAX7ePv/9vH3dS2rIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L5uw/63f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA55606A327;
	Tue, 24 Nov 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5uw/63f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C118B1F000C4;
	Tue, 24 Nov 2026 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530005;
	bh=7FkQCSKumptrlNqGgoDwC9rbXCda5xGvx4D/zuYPFmI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=L5uw/63f1s8ElqMjm4f19HVCgujK1vNCmmiwfSCHckGqr+njhnY6Fq+8KrojVhSPr
	 8LJgk38GjklbCbiZ81hlYKgK/yMzb8zRIYsbwkskqv0QeHbgxxSuIVgAhNQzqLRBm/
	 9+EOaaKaz3LfkUHGVRxrNxHeHupLf9hNE7rmBoLgViymQbkc2Ax6NUJiZROiDbjbVm
	 hZDzD9D1+/qOJiItNUNCM3priH5mQL2QrJh8ohwjcO4RYxnp+rmy2KFXGpbhQtIjwy
	 3slfMd7Hya2UlfTqCC9+ok4ekw9fCpQBpGmDCegUpUgM9WaWHUHz2s3rHSVra9upYn
	 /P2RKp80uCc8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B449D3931120;
	Tue, 24 Nov 2026 14:20:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: do not use SOCK_INODE() in
 sock_init_data_uid()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179553000452.3563145.13616538269583725769.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 14:20:04 +0000
References: <20261119100414.13635-1-zihengw03@163.com>
In-Reply-To: <20261119100414.13635-1-zihengw03@163.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com, willemb@google.com,
 horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 18:04:14 +0800 you wrote:
> Since commit 5d6b58c932ec ("net: lockless sock_i_ino()"),
> sk_set_socket() reads i_uid and i_ino through SOCK_INODE(sock).
> sock_init_data_uid() calls sk_set_socket(), but its only direct users
> are tun and tap, which pass &tfile->socket and &q->sock. Those sockets
> are embedded in struct tun_file and struct tap_queue, not in a struct
> socket_alloc, so SOCK_INODE() points at whatever follows the socket in
> those structures and both reads return unrelated data.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: do not use SOCK_INODE() in sock_init_data_uid()
    https://git.kernel.org/netdev/net-next/c/ffa5035673e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


