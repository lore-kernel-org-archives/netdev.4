Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426877;
	b=gHz7dZPwcRri0W196ho9Jfmj9nSGeHd612Ilq99k+nQ2qh/pk0IrDsEj4v1oKtjE3sqY
	 IeUekXtsu6jMJCXm9gX1FtCw0zuImLfaNBXLz8LEOoq9yGrKctYLhcfWEABdy6fJGtx47
	 v70dgZgx1Ud9anNzw4TpVMqZI3PlfROiQUh0ZY1zu5bdPZlNVv2FKgIcg0oqlQDm4wO8G
	 HDu0kVisp6zy8QsR1gPX9hgbeg1cV4W7Zsf+wkCughvgltaJLqpWJSeIaySIr1chI2L1W
	 1uqt2fOZBBktZU9ZPQ2Z8XgO8C2itYqJZamE0fImxOqks3m62MICUHrDYReZ9pX478Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426877;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DFFpd8oykjbv1qX8zdsesrXWdcjGBZNE+skVcHUqGbg=;
	b=ngSqVPzvxd022pqJMEJBtB55N2+GU7gQ0uzUVS4ktDnP/cXmfsNXvJK2T+D4hNZowNes
	 00rCYnIQ+k9vS14IhfkYccQjKjLWUQpTYwvcn2pYj1KPDpEAEG0L1VqV+fDClj1ePhrhD
	 gqbzI8yr3fRycEyley2pF3XqONEaTomjV4KN7jKJCOKKQGZPm2UgR/M5h5OXlbvLls9jf
	 jgmuwtwI1pqL/7xQIg2NC0E0yJBTbNnqLK3Bl2duzEAK9w9q7/MJDW8S32JL0odhOmCF9
	 JyQMZ2DtL4n79LzYpEjoTmosq0NnIHxEmWd8qm1xl6hvZMf8iplyA2QB3OXtUUcoOzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RO7mjudn;
	arc=none smtp.remote-ip=91.218.175.125
Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD498606A32E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD498606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RO7mjudn
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DFFpd8oykjbv1qX8zdsesrXWdcjGBZNE+skVcHUqGbg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795426875; v=1; x=1796031675;
 b=RO7mjudn5KV1vnAR6jJxdtGnLBnDvun2Z8w3GFlfKP8ZBMvgucBKyNIJtI6x59rIGM724YjK
 C+dseFpDsBFTJl7ynsUKKyZj1qWqLO+3miGFmatbiJrTq931q1tWRt+kKkaXpm7aXBTJwQh/SeW
 s/pM4tOWDhfVFibDAqqzcCQI=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 038b842452f0cc6a;
	Mon, 23 Nov 2026 09:41:14 +0000
X-Mizu-Trace-ID: 038b842452f0cc6a
X-Migadu-Flow: FLOW_OUT
Message-ID: <3c96d878-0326-43c2-9869-e941cae675f4@linux.dev>
Date: Mon, 23 Nov 2026 17:41:07 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf 1/2] bpf, net: validate assigned socket on receive
To: Nikolay Aleksandrov <razor@blackwall.org>, bpf@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org
References: <20261123084138.723275-1-razor@blackwall.org>
 <20261123084138.723275-2-razor@blackwall.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261123084138.723275-2-razor@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/23/26 4:41 PM, Nikolay Aleksandrov wrote:
> bpf_sk_assign accepts any hashed socket and the rx path uses it without
> checking against the packet which can also be rewritten after the
> assignment. A TCP socket can then reach UDP receive, AF_INET socket
> IPv6 receive, a v6only AF_INET6 socket IPv4 receive etc. A queued skb can
> also be delivered in another netns than the one checked at assignment, e.g.
> after an rx_handler forwards it to an upper device there.
>
> Check the socket where it is consumed: inet_steal_sock and
> inet6_steal_sock take the protocol of the caller and drop a prefetched
> socket on a mismatch. Like bpf_sk_lookup_assign, IPv4 also rejects v6only
> sockets which tcp_v6_conn_request would otherwise accept through
> tcp_v4_conn_request. A syncookie request socket left on the skb is released
> as well.


Some old discussion is here:
https://lore.kernel.org/netdev/20260403015851.148209-1-jiayuan.chen@linux.dev/
https://lore.kernel.org/netdev/20260608125846.157004-1-jiayuan.chen@linux.dev/

But the situation will change as time goes on. Hope the issue can be fixed.

