Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882856;
	b=wM4pUeHulJkJ7o4A14BV64lpU0GaiAeF1Sddtj2XfnMorqOPtxJVsVIJmObSTiVwaIu3
	 t4/EZ7/7GzeUKEF1Wzi8gmjAILViPfZVg0MybLvle903pQTq/v92EGKMWa2ELagcwmzrb
	 9GNLsOnQDP9Tk0YOoZl90RKhapf5xBJKZ0N1FYc8Y93fUsPMOH45P2Um3IEM4fKao4hxN
	 LxKdUGy2Bz8dAZdRW27w2clnBcljckMLlfemM+/6fEME1JKZHCndxHbp5IbqZnkLbEVDC
	 pHrdaqiE8B+vp1QGdjARymq/Y7BCS+hdwbEfx1zKGR0wdjHSxOGjlDFAVtZiYzxXVZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882856;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ssCUv67v8eO5cwTCElfNVjR2joQa/CN4VYasEtuzapQ=;
	b=SuNdrPF5j6tMQYEJfPEz2ormFnDWUs12oqR/GLHf5HAucrHtEDFZEsImXXTOpZRADzed
	 Rlbdg4sX9XofIzs8Zkz3H9/KCnfLrVA+vfja2cBmHERGM7AEZNMzgLHNynIqPzzJVxH03
	 Et7tzu1avuXeCnq4JYrndRylFGspR8Qzd9d+Z1f1dy7PZPaSgspT2u/8tsqWiek+NzfTQ
	 rBW9L/Bj39iAAsyq5/JSAdEon0A8MoqJa2NS8Fmix8NIKLH6aQqiMF/S2NpU4/dNnXfEA
	 MOGIDPNfXLAOXVkn6gQuB3hKfTZLToz6omTzxqC4Xpk8LUQTfO+XQO7w7sqkMq/Ibfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iL6i1a3H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7074606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iL6i1a3H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3C91F000C4;
	Tue, 17 Nov 2026 02:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794882856;
	bh=ssCUv67v8eO5cwTCElfNVjR2joQa/CN4VYasEtuzapQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iL6i1a3Hyy8wTeJvBXjOdR4ULIW9gW9V9zoZdoJtgS9udP1BaRiZ1kj1f6Wil28qg
	 jWea6I8bUV7oBwFCBB62CSzjA7t5AcXz2wptOmGayQlcc7dO4uCB52m+t0rMDCToFU
	 zZtE46EOFwcQuT1uq8rUSeQAHJBfce9vyCFOOCXJ8lJkn4aY5eX2wzWiBqK0Fa//d9
	 rTAnml+ZQoi2RhRHwIRibNFbMRG36Nqwbz4uAhYDBxV0BoHRiBPrY7jHd+c3NL3KA1
	 HIEvdQuk3WS9mmz8N1m+tPG1yuw4+AwiLwBTFKSxYcpMDFvevc6G1Xz87R7M3owbZ8
	 OWs7EZLxF2Qkw==
Date: Mon, 16 Nov 2026 18:34:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Florian Westphal <fw@strlen.de>,
 Sabrina Dubroca <sd@queasysnail.net>, Antonio Quartulli
 <antonio@mandelbit.com>
Subject: Re: [PATCH net-next v2 0/3] ipv6: tie the dst cookie to the lookup
 that returned the dst
Message-ID: <20261116183415.24d604e7@kernel.org>
In-Reply-To: <cover.1794384146.git.ralf@mandelbit.com>
References: <cover.1794384146.git.ralf@mandelbit.com>
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

On Wed, 11 Nov 2026 09:22:34 +0100 Ralf Lici wrote:
> This series implements a first part of the model proposed in [1] to
> address the late cookie sampling race: a dst can be stored together with
> a cookie read after a FIB change that its lookup did not see, and then
> passes dst_check until the next change.

No longer applies to net-next, please respin
-- 
pw-bot: cr
