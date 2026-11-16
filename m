Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846646;
	b=T476qkpMEQ1HWNKJ507s8lVH3aaLudBAn88LC2b7CCvim55vATDs8ptMG7VKcTDP+yWw
	 DJuE6pXex1zduXQ62YP0xS0aPL9o9E9NEaBnx/jb6HbhVNQKNH0rimbV00Hkc5JUp2x+n
	 uOEB1DiTxw7Cc4umoiL53drVcrj+Lj2+0qk4JakQ1dxlbO/E6S7/+FTiZhDMiSbfnlepb
	 2t6DIdnF/7/HqWTjy4Ax++9rcTAt1FRNTAzzL8BjR0aANsMDyVYH/L4W0jFChnZuf/r8h
	 iy3DGQgw6oGnspc8Ovbo3pXUeA3DSS8NpDoS82sGjyESsGo1l1cUe7an+JDGRGSF6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846646;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aBJUZBsgY0tpCs31/CUCUF7SxsRkduokKecmM9gBkGw=;
	b=MYUtf2Mwxn9XornNvpwJgKMuyKlOs2DsYt9I+NryP10afATVhhaBXl+dMuNd9kCBu6cy
	 tCvloyffPZ4E9PMnkmRMelkPvbc3VGeJAtv6GPUMkiq0qEPaezYCPJu4n1OOWhd5ANaHi
	 ptpy0+t7hlHfrkwvN4Dn4w1ZZS9puGVgTbBvLylTLsSijPe1ASKDWx8ddB1a8QJsjnUJ4
	 cFxvR+FP+bOcsoXG4G5DwMAV+68wxVioItIXfYS+s5vOcQF2jj0zR4LgFTPyJs7xgD91Q
	 Bw9puRun8U+puctKbBWFHOT3KShPvFJN6Tr5Omk+EXVVUhe5oWVdvdjVuF9I4RS/dvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqjPLwKE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F755606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqjPLwKE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A911F000C9;
	Mon, 16 Nov 2026 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846645;
	bh=aBJUZBsgY0tpCs31/CUCUF7SxsRkduokKecmM9gBkGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lqjPLwKEAzfGGwEhOIShqGWYff/4HFnKv5BorYZDU3jGr2ZpHGYA14U2EFvOMeSBU
	 BAVJybTCH33JldZsgRnEtEzse2AGTN/qLzU8BRbuOUbCa3w1llv1QHCiJYfpNEab7t
	 jElXi0eJf6Llbg6YJKXW9Fm9I6G6WQHatld6jlivOuLpJFXUVi7ewvm8GVPap6/ZGI
	 tV7yapIeI6KwrtpmxWahIiRvu4sOmHeS3w1Y1VhvRpnPYFiS1Qp8m2o3yDtoAELH/x
	 JmTkGLMFwLfQ3UF/Hwr6lK2ObW3Qq0Ks5L3K6yAmC+KIR7ce7W3pXoxsvITBN843ts
	 sOO9VNY3LLvVQ==
Message-ID: <c3963b23-5724-470a-8733-14ffed441c0d@kernel.org>
Date: Mon, 16 Nov 2026 17:30:40 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net] tcp: purge Fast Open RST queue when listen() fails
Content-Language: fr
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 kuniyu@google.com, ncardwell@google.com, horms@kernel.org,
 netdev@vger.kernel.org, imv4bel@gmail.com, netdev-bot+sashiko@kernel.org
References: <20261114111247.21995-1-edumazet@kernel.org>
 <179477744662.3136.16061867603109307859@kernel.org>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <179477744662.3136.16061867603109307859@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Eric,

On 15/11/2026 22:17, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.

(...)

> Could the error path run the full inet_csk_listen_stop() cleanup after
> setting TCP_CLOSE? Alternatively, could TCP_LISTEN be set only after
> get_port() and hash() succeed?


FYI, this is what Chris' patch "tcp: drain the queues of a listen() that
fails" does [1], in a series of fixes sent to the MPTCP ML: it calls
inet_csk_listen_stop() after setting TCP_CLOSE, except for MPTCP
subflows, drained by the next patch. This TCP patch conflicts with yours
here, and also covers the RST queue I think.

(Note that I still need to send a v2 for Chris' series, but with Sashiko
/ Clashiko adding more and more pre-existing issues, I'm now at 50
patches :-/ )

[1]
https://lore.kernel.org/r/20261113-mptcp-cmason-fixes-v1-1-9205b77e9a2f@kernel.org

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

