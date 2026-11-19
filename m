Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047360;
	b=yxOoioSKqkr9GPoarJntPdSboiHUjXIMf0f/89O3A2tm4vdbw0J9L4c7HPriByiLfFfg
	 D8d01LDq5kAXi/gcj/1tmL5CLAW8GrWlGIlBUCYPz4adiHvOSUyzHY/1J2qs/Usw/Dsay
	 ojV9kLOkXxQHAjxsG6eHCjvQS78NJeFOS/IGZSQKqZP/u+RlJULE070jsgoDz1iR7VmDI
	 oZL5i6y8CtevIt9I4R7hTjPKPcCV3xZDCsnqGSY1b7V7lSIevi1a+Z+VOJWZQa6FEE2ff
	 WpkfeHAwR2Vf4VB1nblX2GEjPyiL+UrS48k1uhQaRdb6+l1msw8sLB6Qb20J51HbQoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047360;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pL4E9ZeUxxe0siI5O0GOO+Ni20/5dMjIvvKbqRBh8dM=;
	b=SQQ+aCyWTUAoa0rNrHavFhMImXTtQN05iXyT1Fyy1IAa/6Pv0lwswzZgTkzawTXMsDB8
	 AlDw5AmW0tDcrULQlRN+vqPKmYcOwJ00Kcabw13nbaPqnSRPORIfmN2WdCteKkv+pUQ5r
	 5v1zA3VO5vRsW0mwR7fUed26MgjuKUauN3EaW6sQF+lFgXn8Z3pvzdSJcsrSPg3shSZ5D
	 Rw+jZk+2mE22H0pMKKD7YgpOlL83pPcW3XQMBtngVHcL0+13B1zgvXx7R2DM3s6ykD7Xv
	 xnTYYSNGcfEEUhXa4nlIRZl24XTVIAlgCVdcRs5jz0QBtON3G3C1+JQS6j6IuZLyVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n50LOWiE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4C606A32A;
	Thu, 19 Nov 2026 00:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n50LOWiE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D471F000C4;
	Thu, 19 Nov 2026 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047360;
	bh=pL4E9ZeUxxe0siI5O0GOO+Ni20/5dMjIvvKbqRBh8dM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n50LOWiElJ3KsBuc0hn5EH68ru5pYN0pswzhzkkonGjwqG1yr+sef7HbQcXflExNu
	 HTNrbvZuEKTgUbIOCYN5QYyGoUnWM1MSdZb9oF+6YEeaMNh9YELL06/DJxr6/n66ly
	 K4OvbKRVoxoaf71ZmCc2cSerxgo3pJwAFoZx31IPSJsuRJnT6GR+JIaI1v5K33tDGA
	 rtvyqEjVbjRMZpyeYecNXdpjHs6GTYpVbOg32eLHnCLwMwJ/2ypr4sJJyNHdPux79Y
	 FNb9jf4ed2SHzeEKwbZzhPKfSaXZBM+5/b8RaJ7D7sZcueCn87Hd7BGxY6T0aPJwFK
	 sQbgrMXabc8IA==
Date: Wed, 18 Nov 2026 16:15:59 -0800
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
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from
 different memory providers or bindings
Message-ID: <20261118161559.0c2b62f4@kernel.org>
In-Reply-To: <20261115004003.3695475-3-almasrymina@google.com>
References: <20261115004003.3695475-1-almasrymina@google.com>
	<20261115004003.3695475-3-almasrymina@google.com>
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

On Sun, 15 Nov 2026 00:40:02 +0000 Mina Almasry wrote:
> Subject: [PATCH net-next v5 2/3] net: prevent mixing frags from different memory providers or bindings

This patch needs to be split up. There seems to be pure refactoring
here (validate_xmit_unreadable_skb()) and the test code also should
be in a separate patch. The rest needs a close look from perf
perspective :S Lots of checks on the fast path to fix a hallucination..

