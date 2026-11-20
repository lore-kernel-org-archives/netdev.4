Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135962;
	b=NLPYtCatFbstsVzLlR/7jBn23pECetsS+nCQxub+qJorjCEleRRzY52dNxFA0n5Ja5jx
	 27HHzZFgy/P6pqqRwjYiQ04Kq32EeclJ0ZYN0yus+CzwG2/wvZSS65nvXsVbksOAiOC53
	 QeIO/2EjWQYCTBW80Fgf5Lx0kv1sXpxjEUSy6vPUzeRJpzpgM5CU6qrbh02nPjfYjD04t
	 nVVAuSoodWvcTeg2xytA0vBPOpCpMHS9AYx4IycD4XcyTQgqJXi5wCQ0fQDYBnSq1IzHl
	 Agkvz1L02cXWQhXoFCQ4f/6R1VwPuf477iNby0rZn7185zlOs0ehM3rr607IT09TEYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135962;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GMDVfRvohUBotN6Nlv2xhf4qOjSa/RAZRGHG1EetRfI=;
	b=UdRC0G+xUTowAZTypXQMHbgoVJgQgLrogFKjRh3DuVv9ghbYLSn+69OEgOTu6gjd7WQm
	 LiI852oQWVxsrUyVRhhLadG27c/fkSsrem6XBWra3YTZlqXa6cLpc1vSfanXLvZPyE7bO
	 rQ7sA06Xlp/Rg4WzaIpv2jitb8tm3A4AcG2OJ5KZzPX4TS/5IgtCaSoLcOgjZNnose4lr
	 HtKbMvRDKGtZ7axxpMqVbXwsmQUTFIbRVGM55HZXeRJ/BVk5uOr5Pq8Ss49TACBIzAqSj
	 MToWOyxQVC8bY1Fe3agmtSh0pBSuzX5ULgVg6r/3N5YDSKwFLNcACewTilcDTiJclJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT5nTWtl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F6606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT5nTWtl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771391F000C4;
	Fri, 20 Nov 2026 00:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135961;
	bh=GMDVfRvohUBotN6Nlv2xhf4qOjSa/RAZRGHG1EetRfI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hT5nTWtlHl3h2raurjig1qWfT7QMKA9ExR+X7NgVrfhN88wJoNsUXvH9yMhV1wnQl
	 i7cC7mvKYsMxjHdEwlFCjnmsBVhtI2S8QNUGuHW6KUCGHsyOXmYl7KvQPejCWDcfs5
	 S0mF+EPhueXL5CBAz5IvQSNvukap8UNCAYLQ22gcJz9c3BNFGYalAOmsnxEmNHDWvf
	 v2mVnav0diM3XoIs3Vm63iAVEq/bFafaA7SetjBy1bf1oz7UVbnBBuho5CzMfDnALm
	 XGjRbPhZVXWG/gsEDuS+66DmM8YPzF0yGFqd9R6tOJuppE95u8OZDv5I15rivBh/XA
	 P6KuaxogNNXQQ==
Date: Thu, 19 Nov 2026 16:52:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?=
 <mirq-linux@rere.qmqm.pl>, Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet
 <edumazet@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
Message-ID: <20261119165240.293dfbd6@kernel.org>
In-Reply-To: <CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
References: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
	<CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
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

On Tue, 17 Nov 2026 09:12:02 +0100 Linus Walleij wrote:
> I think the Sashiko noise on this patch series is now down to
> unexpected hardware failure, memory exhaustion and low-prio noise.
> 
> I think it could be applied and then maybe I can follow up some
> of the comments later once this is landed and the ethernet is
> working properly.

Ugh, not only is this pile over 15 patches it also fell victim to the
mass rename of kmalloc to kmalloc_obj that landed in Linus's tree :/
So I can't apply this even if I'd rather put it behind us :/

Please:
 - rebase
 - drop all the Fixes tags here, net-next == no Fixes tags
 - chop off the stats patches (14 patches should be left for v9, reset
   after the previous stuff is applied)

Consider the 15 patch rule a hard one.
