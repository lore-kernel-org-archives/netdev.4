Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047059;
	b=erM54yL2KhJnDdzMX8yLoLTA0BoK+SaBvYZaElK0KMtWlje3wgSmPpIF6UwgIpnjfGgO
	 cHVPkI0dP0mKbZPBqu29MOCywQYBWX8jq7tReI0hAXqtd5bdoFo6iV38A0MoVyxJ64UTa
	 vuIUrFTKmnKiGQ8GusDSocfQNMSgJ+SFElnZpDFppChPzrNWengb4GJHJLorVPScnuB5P
	 iZypgN+Q+NcEuNOKtUyoLJJxXl/lMX3Sxiqxv/K7q//CG2FXEIoOxCcFjmi1z6WmkmhQ/
	 k8GLukkL48T1jIM4qSSow0wJHt4rU7r42moPmtq4pgVIJJCsl8ZI/++EimykiJs+gFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047059;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6FXaXVEIjhexajkazxtFE2bCTqbX2JClmym34bll8ss=;
	b=H0GEL/WWoPjgfqdfQIMH4362+G5hRvuwf8+gr8zW9Inx/N4dFtKSMuUxT8XKNtlMBIpo
	 kbgl4YXZILl1HCMAYV8x9KD1rHS77o9BP4K7OVxd6aswsL7qmze10rf2OETwBQk/ndFaF
	 7VgkNUjPv/cj8/OvsZLxH0t6w59bhYTjMRPw1TEC1DywbEz8dYEDCf0Z5NVj3QCP9MW3a
	 5wBQH12j/mIvF8YnikpsKGqWJtFFNshbIRaAGIfzhcZdsrqfmo+gA1wMtaBuKsgm8A1fU
	 CjZnbJLXCbm3znhLreQsKapiksP5pws0fMMDRdnY22FzxxCJzPvpNathw4C0KTymMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kYbsgzZv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4060A261E;
	Thu, 19 Nov 2026 00:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kYbsgzZv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DD01F000C4;
	Thu, 19 Nov 2026 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047059;
	bh=6FXaXVEIjhexajkazxtFE2bCTqbX2JClmym34bll8ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kYbsgzZvnCg5oq5EHecxMRtUQOPKm3b5Pw4dTaldf7bxGMj39z9lFhQqTesg+QTnl
	 Ce6XdSMRMIr4hhMz9RNLL0gbeNb2n6J3XCNMX8i9ATNT+jvHSQB/d6jxj4QoR0muil
	 J6WVtp/+qMMyTLPEBf9ziB/BZYXgwLICsvNwytitKGbiUTjGIxa6+09l9mK1oj29ib
	 P4nd9AzXQIFHP+b9rzPesjjTCyvr1Lzhp3IYfD9MmLSDEznyStweEdNnvk+wR8JNDV
	 dpi0CCYQXLSqgqQcfBNFcf59TKEBNSL0AjPM91JblYF518BBGXx00IzMUOzomjz7DN
	 xfo9MCCyyh+dg==
Date: Wed, 18 Nov 2026 16:10:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, Neal
 Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, Josef Bacik
 <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, Willem de
 Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov
 <asml.silence@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v5 0/3] net: prevent mixing incompatible memory
 providers in skbs
Message-ID: <20261118161058.01d79ec6@kernel.org>
In-Reply-To: <20261115004003.3695475-1-almasrymina@google.com>
References: <20261115004003.3695475-1-almasrymina@google.com>
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

On Sun, 15 Nov 2026 00:40:00 +0000 Mina Almasry wrote:
> Enforce that all fragments in a nonlinear skb come from compatible
> memory providers (and for devmem, the exact same binding).

This conflicts from some fixes from net, please rebase & repost after
the net -> net-next merge.
