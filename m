Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575012;
	b=2gE5rC9qpYkkS1oAx43Va0SePHf+lwwqBl16FJMEBlcckkEQcbmV2J6T//Q4t1rckIfD
	 FXY8m86ref5SAPnqCbExQAmJQP9o8LE4YUN+CnJKEnzYBXvzP3zpyl94l352o25RYi2Zh
	 JLC2m/6WOakoZlzIbysHGrQjt9CSAjWkPqOUwT4c/f81QMxFVJhjhCCGgzncRa3QOyMlt
	 yNMz/a6a1srGg2H0q3KAo6OTNzP6hF4j3IBXylaR8a7Xj9MmRyHDg3J23zcO3L8STxecy
	 UWScp1Q/C+QS2CJzusq8jejzeWFRtJp2KX/S7GJDhL+2gClQMGDZahKX3GGNngHhCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575012;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=X1E81uYg5nHnNSWyhY78aSMQ3LbIorxod6mBXPUr0Tw=;
	b=tOBSS3RgKw6yyHfCxbWk7ZXRoc4QxbcpuLlZdOQyPW+3JKhqbwmKrDiz8JGXMUABSqwv
	 aOf4e8wKmpRW71o/U2ZQLVBP9N9g5kqQB90OnD1XdrEWEodviizYWJ3NA+yXSb6fUSh/6
	 hm7W89e4E4sVtVHhCFyTaxWaWO+FIZat1Ko5/5FEXypy7TFhtdwr8mkzK5QHO7dIBd/IT
	 0R7ui6A+PLxoWFEpqoeqx3bFw1V0YvOVJlQjtAhTaqIDp+r2X/XVBeW7TE8P/oUwF/D/a
	 TMaKeTHja7fjz5hQuMYsmex775wWDwEiR9BbrVjtw/TTocS7kdAQvjmG9Fc6lfzk0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaD2l84M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829C606A329;
	Wed, 25 Nov 2026 02:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaD2l84M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC5C1F000C0;
	Wed, 25 Nov 2026 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795575011;
	bh=X1E81uYg5nHnNSWyhY78aSMQ3LbIorxod6mBXPUr0Tw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GaD2l84MA5gwHGX1FRhHdzDIa0t4X2oLsvcOudnbBzo7lPGlfNSGIJxnDjiyaeFTS
	 6+BFTSA49X2u/eoOn0PHTSf9X5VNckAPoEj/MkIF6BncSc7Xv7NHz2v8HxV36kkP7i
	 Z5NInthvjJ1TX6jSJbbVAHaNlhRku0VTBOsgLIoXgF5Av1uOEpsvrYdkZr7MGRLhr6
	 9NbW7kHjO+LKIXzT6WjQUDLz1HiJiTevkdj3DGUJhHrJ//Rh2cV+CxGEbXH9Z7reo8
	 wXzH5OCbJVjjU5Y+wxn6arbvtHo5k5h047hcF24JD3GV4pkDt0nUXAcYp3sEJi4PML
	 +4/juJhcmXo5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774233808209;
	Wed, 25 Nov 2026 02:50:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: sunplus: also fix the byte order of
 1c:50:1e
 MAC addresses
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557501002.181897.12035952105478160358.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:50:10 +0000
References: <20261120073901.21656-1-ag@ffroot.co.za>
In-Reply-To: <20261120073901.21656-1-ag@ffroot.co.za>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, daniel.machon@microchip.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 09:39:01 +0200 you wrote:
> The driver reverses a MAC address from the OTP when it finds the
> Sunplus OUI fc:4b:bc at the wrong end. Newer SP7021 chips have
> a different Sunplus OUI (1c:50:1e), possibly stored in the same
> reversed order, which the driver does not recognise. If the reversed
> address has the multicast bit set, the driver rejects it and uses a
> random address; otherwise it uses the reversed address as it is.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: sunplus: also fix the byte order of 1c:50:1e MAC addresses
    https://git.kernel.org/netdev/net-next/c/612848d37e68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


