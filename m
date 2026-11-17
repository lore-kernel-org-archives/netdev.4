Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937046;
	b=MDekGpKvc7EhwvoBl19FLvvFXkpzXXbSLh3ozefic0iTuJblljUtZHi0FF1isQfmcEXN
	 PBbFvaBPgpr4vNij9sL+7a/ENz8x/JRRyqALFhykKOTEQpa402uTgKIG/aLe35gqvjhq0
	 FdUtefDc9ypAwxfcWNDYlUv7ft1lElvc7WrSlG6grMpLM4ocQudGgGvervo7VSWH+suwm
	 FMiU408D3TxLF3c5TDIw6DMdaNOghMK6AdPW42/nwXdfk/2pAU6j2l8ZVvDopHjQm3/uT
	 grH1YGcxVJUXPwGuVO1jaucFYZf3mhG8Ax+JCa4R5ogBmyYqbh2PMYN8YQ/JlZ7cqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937046;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eWM1j+sd2GO3WIAK+yuTHGO/7gs7dlnVrZBPsWXtV+M=;
	b=JNKWR1IsQAGTej9/fH9wxMG9pKYaQXLez8rEAKAruy9pBIfpFTFdM83tQEPGIvnXDOP+
	 NMxZJB+zVQekxPV7hR4XH64JZU3jZW6EuUMuOX/QJ6HDucg8rpWk8+tW+hWj+FMwtEw9u
	 7MF/OadXjjTaY/jZWePffIsgA786fopEJl16pEQRpA/r+uezoJQ+V3ViWOeFGADIOn55M
	 VortPRKt6Uf0ULXdCO0KVsE8kEFeYbBZVsE6dxvMp2aHDeI7LunBRdvrqsmAL9pf6Qjsv
	 nutlwKzAfEZhaM90zvQivmZulo2/4JGhCHBhrH7H/U7Hm+MJHQwtiCn5WtKSqJJEZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJOE2HPh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7944606A31C;
	Tue, 17 Nov 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJOE2HPh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B721F000C5;
	Tue, 17 Nov 2026 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937046;
	bh=eWM1j+sd2GO3WIAK+yuTHGO/7gs7dlnVrZBPsWXtV+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cJOE2HPhpSsJ4zAAhbUz4fJvGabem5kKC4T7eVRiK7y5A1Xd6YUcBs6yQaOHq0phR
	 zyah+eDzTPYVuCv16Dby/ic8hUZbO1lBaIpRV3s9zHosrK1rYXc1z2XJMfDYQuHlBW
	 TMosYrepdzQRGY+SGJCG2cSLl3V6bf30yLul0CLzLjV31rG+2tKeZgJbHn9vBjXLhe
	 d+tcIm16g7LiCLywM3iSO4uuqF6/ojxF5LodVCzm4JOEf4rYbWJIc3nYx5KoTpif2R
	 MP9Jkq+Gc3y8zULfYW7ziuHfjVFo2YfBd3L3XNHWIIGvMyvUSc772iQ/dZKXN7EwWQ
	 lAxLBTE/HeCrQ==
Message-ID: <970679ef-861e-4dbc-89d5-a77c28c47e4d@kernel.org>
Date: Tue, 17 Nov 2026 18:37:19 +0100
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
Subject: Re: [PATCH net v2 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
Content-Language: fr
To: Thaison Phan <thaisonphan@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>,
 Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
 Stan Iliev <stani@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116023709.132684-1-thaisonphan@google.com>
 <20261116023709.132684-3-thaisonphan@google.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20261116023709.132684-3-thaisonphan@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 16/11/2026 03:37, Thaison Phan wrote:
> cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
> request_sock without __GFP_ZERO, leaving saw_accecn_opt,
> accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
> accecn_ok is negotiated in cookie_{v4,v6}_check(),
> tcp_ecn_openreq_child() reads all four fields to initialize the child
> socket's AccECN state.
> 
> In addition, because the temporary request_sock used to send a cookie
> SYN-ACK is immediately freed, treq->syn_ect_snt is lost. If the listener
> marks ECT (e.g. DCTCP), failing to record syn_ect_snt causes
> tcp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer
> reflects ECT, disabling ECT for the rest of the connection.
> 
> Initialize saw_accecn_opt, accecn_fail_mode, and syn_ect_rcv in
> cookie_tcp_reqsk_init() to match tcp_openreq_init(), and set syn_ect_snt
> from the listener's TOS/tclass in cookie_{v4,v6}_check() to match
> tcp_{v4,v6}_send_synack().

I got a review from Sashiko [1] asking me to fix the same issue, and I
was going to send the same patch. So this v2 looks good to me:

Reviewed-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

[1] https://lore.kernel.org/sashiko-outbox-213944@kernel.org

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

