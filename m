Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482563;
	b=TjC1xYhyf/z3vZQ34jzypiVNBeQXDjLuNhiDK2izZ0Y1DznyF9yPoxSDfO16nzRQeqjn
	 6FzeIaKeb/rDqT10i9Y5cATxErjQ54rKmIjfVkM4Cc72hLsCaLhDnIkEbXEaYVkSSPukO
	 xqqtmKccVrREXmVoq/F03/n+3/Rj+WzcDzi+fmQJEqeRE6YCLtemYSHiqRTJYQP10brsc
	 G+P51BkjYFxwxz+aPkfCpwBiY3CMtUssmdgMqZsHEGu7fL3FMkc6FRWdqi5bgaoGNiF9Z
	 n1NQnCg5q8hOAM7KHOGhud20jd+fmLutEmtKHzD7XAS1G/9Hq5tNpJdfPtp6LunnhNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482563;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=52KrsWFEwMgAodmGIGFkYgOrHJIIIi3qOKcFT+fVSwg=;
	b=zzm7Cielj9ciKi09yQD0+G1S50A5mXFvR2H1bRQj6JyEOHuBUX5P0pMyEwgfPVLJMD2q
	 W9zW4x2SqZGstTUqUxuSOFmKPYXtnPfKFVo5W1XKLpFR0/y+mGm66mA1S9D3coFd0Qg68
	 Qi01kApVGPz3PSlumWbqpVnvzPcCBYRMFSzVSUFNNBP7wBIkHD/cEgFQerpBBApdEXmqG
	 6Jn/J+LZb20fVtMQQQFOVaONdydPJR6AWDF7QVzNDawU/yNdsCccZDWDt4C+7x5ALs6y3
	 3DwUzuRQAts7oQXBw4NXNgvQS7uYmIysknRHNUQir6PW4Wq+BjSaMbBCquTZaiAAAJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4V91KbL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD339606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4V91KbL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72B61F000D0;
	Tue, 24 Nov 2026 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795482563;
	bh=52KrsWFEwMgAodmGIGFkYgOrHJIIIi3qOKcFT+fVSwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V4V91KbLlcFLW99t/z/JsniV6Yfc2OXIalaECSffBt3rI8byTkuR7IMdJnDXu1/MZ
	 htdfuXLV9Fve3GkfaEWqVDNIw2jLBoRbbhUByDeawLkVcpTEcGcDGaIVi4ZjRKzryr
	 T+QA09uAenx43QZU5hmIAcgOB8KrLC7OM/wjEfFUSxU8gWs+iWkOfbK9dyH3cfS49G
	 uGW3ynXIJ8Lrau12sTuVK5VGSlx4LGm5PJMIzdpB3VhZB3FwOVmA1nhTNX9tMwfCRs
	 VPKOiLq7jrr/IbLsc1CnePxet/8fbdmJZJBTzEHA3eoZ8XHS2BljXWKqlMlqXUKztI
	 InEOFiaMhZhnA==
Date: Mon, 23 Nov 2026 17:09:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org
Subject: Re: [PATCH v5 net-next 11/13] selftests: drv-net: decouple local
 link setup from netdevsim
Message-ID: <20261123170921.40e0e516@kernel.org>
In-Reply-To: <20261119164636.1071385-12-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
	<20261119164636.1071385-12-maciej.fijalkowski@intel.com>
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

On Thu, 19 Nov 2026 17:46:34 +0100 Maciej Fijalkowski wrote:
> Without NETIF, NetDrvEpEnv addresses its pair of netdevsim devices from
> nsim_v4_pfx and nsim_v6_pfx and brings them up in create_local(). A
> following patch lets the env create a veth pair instead, which needs the
> same addresses and setup.
> 
> Rename the prefixes to sw_v4_pfx and sw_v6_pfx, as they serve any
> software interface pair, and update tso.py, which builds its tunnel
> addresses from them. Move the address and link setup out of
> create_local() into _setup_sw_ifaces(), which takes the names of the
> local interface and its peer.
> 
> No functional change.
> 
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
