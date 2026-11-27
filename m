Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744704;
	b=i/P0C/o2BpPClagDQOBV5cBjSq9QCIYKI/7dMht4DGOiYLrIODBom32ezH2kyNwlcF27
	 xtY9lpi0TAfG9dnNOA2LoO+EAajvUibRkfsoMgqdlIS/7R6/DFSj0F3RnFkpozPHF6lCj
	 oXfyZeGSXsu975zlWR8vMjD97u69mEf0VKeAylO1WOB/RT78d/GLO6OYgTFJ0sm0/FPTW
	 6PHLfOewb/l65mggGTnwgHyvOoVGdzuG3Se7uFBJsWzxfwoxi9PVRG0FkUBMsp9SHKVaB
	 p6vPvQ6szfsMgJvzDQ+a7glo24yhZDk/QXxssq0xJL/ZLH7jdBb+ZSc9Ce38UUkvCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744704;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=obbyL0zw6mklk/YkTTdAAz/LHAlhh9d3bNFL7FQ9SkE=;
	b=drYCGsZN04MK7J4cS3Mtd/F+Wr9Rlu0FzXExY6BQ+lY8Xp4TgcNt5Ksxvm8LXz1/1A/g
	 PZN8lQ7i6kbLxyIZIGrZOtrJmGE3Svhwr3+rnhTqJRI+HEJDconmHV7UEhzI7miwSAGWv
	 GAhXGdfK6HoBC1h/tLtoWr0hz+IQwD8yYVRb70TRWU2Twkj0T2c/6rgaOysJqwOPmTO8K
	 9xN44eTfK9UvLPjrj63zVGN2BVmUaMCo1UV2J1RGa/YEuyNgTKnELOywrBVeXz47rdIQn
	 TDOjCxE8zMiVNi1fAqqBwBwRqNiwkRxNqNBejlpqTnw+AkXh3wGi5sMnbkQ9QHMSaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g7GF19eI;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E25606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E25606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g7GF19eI
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QjfUiP89GkKSdXn8+nDhgldc3LmrFASytM3T5E1sg0U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795744701; v=1; x=1796349501;
 b=g7GF19eI/ckIh11/s1z3KQFk2JTVwf0ZgXKG9jTuh+XAcADTrqjwMC+YywkoTw2qw+ZU3tgd
 S9b99OVli5eMX62flPHpknLvCELLLjFsO7OGwsQ/DkkXlLyHwmzMM0RAFsnm0zvulHncOXlXlgL
 MzEJJT1c8/71zYu1GSz04yB8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 48d9a373175d1383;
	Fri, 27 Nov 2026 01:58:21 +0000
X-Mizu-Trace-ID: 48d9a373175d1383
X-Migadu-Flow: FLOW_OUT
Message-ID: <95498d18-5267-4153-bc06-7b918f9f469c@linux.dev>
Date: Fri, 27 Nov 2026 09:58:16 +0800
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
Subject: Re: [PATCH net v2] tcp: fix division by zero in tcp_cong_avoid_ai()
To: mdshahid03@gmail.com, netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, willemb@google.com
References: <20261126164150.8838-1-mdshahid03@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261126164150.8838-1-mdshahid03@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/27/26 12:41 AM, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
>
> The tcp_cong_avoid_ai() function divides tp->snd_cwnd_cnt by
> the argument w without checking whether w is zero.
>
> Since w is an unsigned value, the condition tp->snd_cwnd_cnt
>> = w does not prevent division by zero when w is zero.
> The function is also exposed as BPF kfunc through the bpf-tcp-cc
> allowlist. The BPF verifier does not enforce a nonzero value for
> this argument.
>
> Return early when w is zero to prevent division by zero.
>
> Fixes: e78aea8b2170 ("bpf: tcp: Put some tcp cong functions in allowlist for bpf-tcp-cc")
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>

Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
>  net/ipv4/tcp_cong.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
> index 8e83ef81fc18..f70f49b4b1e7 100644
> --- a/net/ipv4/tcp_cong.c
> +++ b/net/ipv4/tcp_cong.c
> @@ -469,6 +469,9 @@ EXPORT_SYMBOL_GPL(tcp_slow_start);
>   */
>  __bpf_kfunc void tcp_cong_avoid_ai(struct tcp_sock *tp, u32 w, u32 acked)
>  {
> +	if (unlikely(!w))
> +		return;
> +
>  	/* If credits accumulated at a higher w, apply them gently now. */
>  	if (tp->snd_cwnd_cnt >= w) {
>  		tp->snd_cwnd_cnt = 0;

