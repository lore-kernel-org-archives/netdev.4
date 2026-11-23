Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468387;
	b=iottuHFaxHYjMqWQNNpbY1yNQarlhNzyoiA6Lnlb5Xaf+FjjBbOyfGYwOtXd55jq5uCX
	 vo7rEM4o2BWPPWUsHGnskPmh9HM8D2Pq3ES+TKWVTB6nM+FzmwCl4zgNI/CmhsWYxBiOt
	 9hkEY749BapJl/CNc3twyLpUXn7KcXu+IJ7lyyBtgHe4gt2IA9NVjeUoS1dUqtNBI1PnF
	 2a4zfdCZSb+rH5Er9AiQ+JFqUqZFdNV8rZxgOCMOEaDXrt3u7XH3j0uQiWe56hD2mE/nc
	 pgHEIXDC3NY8UzJZz2D6JQRd32blGMu+uUq47EXWnXGVziEayXbfewt8Cc6NW74gQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468387;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tLEMHeku/2ovAkucsl9g2iIjcOFyun4GOt8TqXj+m4k=;
	b=RdHFHvx66741C8IPtWGqrjGiIvUyRoMyfWhURzOWK1MhuR8qZ9gk6hwgtZagxUOacMhz
	 gbWjhfIKcToQ9Uu59rHWkAn0GScyetdEAfT1ziAvVEVjZvJcQxGhbAfCJZGZYxmVUDyQU
	 56NX7vlhvQ6udHdUZFXitELOQsGIo4lERXwgLgL727r9T1emxXEDU3i4eQjv7dezN3sGa
	 8rKbLNlEDLhglJT7pJQi2hC3fV/Wlv5Wp8a7PVoFA+A0SSGQI+nzZwELEYAqh0QxgODvC
	 WgmL0V/C9T5ndyaPqy/wHLhhe7xaXyP1IjZSvYautoO6gDwLZeAKGTPZz9W6eZO7haA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHp83W75;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE4606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHp83W75
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2BA1F000CA;
	Mon, 23 Nov 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468387;
	bh=tLEMHeku/2ovAkucsl9g2iIjcOFyun4GOt8TqXj+m4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jHp83W75jwYMrYDbkN6VsGc89Fecz8NY6eHSwF9rH1NDSL6mQI8AQfY269jdIhxSS
	 6WwBUub76qgxBMLDhYcHfbQUgowURgXuH94Ss2dPmo7e1rNYfBq67sgfYvRakdKx2m
	 2lkILTfE9eFiubEYdvtQSW97fLxEZu2AzYGjD/FqQIUz9nUOjOhhT21RkD7iT1fRL1
	 dfrRpE6CS6CB0WUc85hoB0nnaP9g6aB63FKo4YC69wmDgveLj3uzjEFzPbj+5m5LyF
	 wn1YCpeJqi5pr9v3Cc4frfAKLxxHn7SVPeR/VTaHiIZj16wYhAch0Jl8ZZhqxdSCJA
	 BfwAQqbWCO5ng==
Date: Mon, 23 Nov 2026 13:13:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org
Subject: Re: [PATCH v5 net-next 00/13] selftests: net: adjust xskxceiver to
 drv-net
Message-ID: <20261123131306.1b76d6d1@kernel.org>
In-Reply-To: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 17:46:23 +0100 Maciej Fijalkowski wrote:
>  create mode 100755 tools/testing/selftests/drivers/net/xsk.py

Haven't had a chance to look at the patches yet, but it looks pretty
flaky in on debug kernels in CI:

https://netdev-ctrl.bots.linux.dev/contest.html?remote=virt-net-drv-dbg&executor=vmksft-net-drv-dbg&test=xsk-py
-- 
pw-bot: cr
