Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008793;
	b=FtkDdPcpC5smCMf8sPHAD4/Pn1O01eE1t57AorId0xF9wkQpLWk9PlBL2IpVIB70cMbQ
	 UyLrX/SC6ZM6dHfsOXZXJvXRTqhTEF7n0vP3m0dsdd3SExCbWBq/sE1v7w+8gkO99DbIc
	 vB8cr8oPVgNQ2LTNebFFSTsR34bCJCqzwGERe7lkT/Am8f4d0sFgkEEJe+/894ENtecqr
	 +eynixhDdooaSzdFjrW80ow9oJenKwbtE64tkclXybeds0Y2Ah94+ZUqJ//LBr4+nRRoZ
	 p6KIDfi7i4DC9O65/efGf8PQND9rAzt8ibrTGXX6cKXne2WU93d3/v3Qe/0UqudvKJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CytpeUZs4e21yI0gXA+XVzgHbacfvLr71yrchjS5I0k=;
	b=nV6ZYmYYIJct0aV0jbslR7VxBshLjnQrb1WV9oDwKq0nn6dmkoJe5iRTtEBrZWD2qHTx
	 dy18AV5X0yk5ndAe4psop5O26kl5JVyIVyrDvsGiQydI11kAwbO2oag/Un57XDQWgVwHW
	 DOlQCW8NfYUnBfWBJtgAi/ZjrE74/+2A6fRqm5u7XLDJlmGfajuamIcWnPagtagRj0GJx
	 B6JKHSTMFSYW+pftZAIacOUQza0+gfRMg38DDnxIjOmFmSTFqA6SN9p+8ESRPhbGwijbj
	 NOhC78Jeqx3qmWhuF/h7NXbW+YlZHHjXh3ZObh2qP7lvBdZeFkBIaWuIgzlE1TMF3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFXCR9oN;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A2606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332A2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFXCR9oN
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso419009f8f.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008791; x=1795613591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CytpeUZs4e21yI0gXA+XVzgHbacfvLr71yrchjS5I0k=;
        b=yFXCR9oNXVv+lnnkDUmClHvyECFFTuJFCcboh8u9kWHS+AC5OmehC8Yr4WcbTepXcm
         /2pKvU1Mipv3NG6R4DMUcpkvQXBKYYktARVXDX0QDT5gg8L3X5VP8/1GBb+1Zy9ByI1d
         lgdKjoGf+PVkwLNcl2axynHOTuxFuEU3tn//7d4ALqBHtupVZ0t/uvgara1iMNCf1YWt
         3ED7jCnvXKPXxgQBDi1gZjuztSypdIBnACIgHzGdD3fmC4rX6I2zQnLvKY0JBmjV8HW9
         MSHPKonJcWBTCEorDb0QpgQzSakYZKdSn9cI6xdo0lB5xQwvPpmISlr+DKXS42C5JV8T
         bjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008791; x=1795613591;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CytpeUZs4e21yI0gXA+XVzgHbacfvLr71yrchjS5I0k=;
        b=H4jQu+mUZ9/It4EWd8v7LUyurJgGi/vHT1Uc9uHEsWqqkoQ4i00KJKXjGh736l5404
         KpWv48fh2mzZ969HSOHajdepuTfpjwRczV9p4Fz//Zb/IxRsHjPOPb2jcMvpq2SKWsD1
         nxp+IaZc3pRozrY32Wo+4KdDWO8WjLTPw9fWwbP+wfn6W6zTA78wihj1J3rB43RXV0XC
         BOgAkoe9V4MA1/vaO/Crz304NLusu/nvegby4i3q79SrtRDUY8io3ffF2+tI/ERmbkjQ
         ntNl7ZUqrRHwT9HHcouyEvYFT6B7kV96ARSRVwMj4J16ls9Rtn8HUA8zdgjeWANPkfqA
         VAcA==
X-Forwarded-Encrypted: i=1; AL+hErHSd3liH68VbSdhrMz0B9bmgBj2w3p+2PO/E3Z/QrNwZRyEhD6qsPgPM27cCQvLvjBQ69TDJW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7TKM8lbXRieSD2xAJsxP2s4H/gxWHWWZfpgdn3OE0zKdaD5+Q
	RH29CJRPH1yIdGLXYo3n0PM3PSwgyw951WrH1bGSuE1BMPTbwkWi84xS
X-Gm-Gg: AZFdTZdhkDx0uZV0azBKBNXAsbF2kd1x3+t+mI+PuAFEG8lIDeGArNaWXZ0pKOPuIFU
	B2dnvOFJFSq/VAQrxMwmuIimZWZdH0J7CLk3wofg8OjRYxoTkbNuu1jBuX8iLA3nplxf6B6v5+z
	mFct7MVxcjtM0hr8/NCtJL94wCJZbtjGht/RpIr055+AemRcJcEJ6w5fCxwNR2kb3Vk+R+PnvMN
	sTe7lMboS9IS2MXcQrpOyxWR8wxMQLzwDT03+6tLsDiQMxU289/eEx2mQkWBWp207E45u7ZO+HW
	Olg6vFmgrCmAUbdD8+AiYmumx4oR0hgbQoNhpwxgNEFpGevswXmMPOR2hCIu1wbMy0hfp3AMhyw
	S+tvmgMS9Hxd6yhyMWQfedqE7nV8LHh0HqH1VI5tUMYOsDRiB7XH1caqJ0FlKLx5tTmPPGA0o0L
	py8k0yYE6SQPgnLQsqk0G1aV4am39fbctoR8yELQ2RclijogMeKs2n57JufJ2Tm0zl6jC+36N3e
	ftU75ybJOCxdAUEpsrIISpqVkRhuvDOvYlifDdZ17HImDlpxWGAm5sTOgTi/zYqlWpWHQtyHqeF
	dDhfqRYeNc6QFsg9WdiJJ1ivUbkD750ZjQJzwpSs0Av9vMalhnpyneV5O+LC4GltaA==
X-Received: by 2002:a05:6000:40c6:b0:493:4426:96c7 with SMTP id ffacd0b85a97d-4a63ecb5478mr5254932f8f.57.1795008791326;
        Wed, 18 Nov 2026 05:33:11 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm3870877f8f.15.2026.11.18.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:33:11 -0800 (PST)
Date: Wed, 18 Nov 2026 13:33:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Chris Mason <mason@kernel.org>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/3] tcp: don't let __tcp_set_rto() return 0
Message-ID: <20261118133310.6a2c48da@pumpkin>
In-Reply-To: <20261118005048.53393-2-mason@kernel.org>
References: <20261118005048.53393-1-mason@kernel.org>
	<20261118005048.53393-2-mason@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Tue, 17 Nov 2026 19:50:49 -0500
Chris Mason <mason@kernel.org> wrote:

> __tcp_set_rto() computes the RTO as (srtt_us >> 3) + rttvar_us, in u32
> arithmetic and with no lower bound. A comment in tcp_set_rto() says that
> the algorithm guarantees an RTO above TCP_RTO_MIN. But tcp_rto_min() is
> only applied to rttvar_us, so that guarantee is lost if the sum wraps.
> 
> tcp_retransmit_timer() backs off by doubling icsk_rto, so the backoff
> only works if icsk_rto is nonzero.
> 
> Of the three callers, only the thin-stream branch of
> tcp_retransmit_timer() clamps the result. tcp_set_rto() and
> tcp_ld_RTO_revert() store it in icsk_rto with an upper bound only.
> 
> The fix used here is to keep the result of __tcp_set_rto() from 0, for
> all of its callers, so that the backoff recovers from any state of the
> RTT estimator.
> 
> Found by LLM code inspection, and confirmed with LLM generated
> reproducers on an unmodified kernel. Fixed by LLM, and tested with
> the reproducers and existing kernel selftests.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---
>  include/net/tcp.h    | 4 +++-
>  net/ipv4/tcp_input.c | 5 +++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 5c9203aae834..6a714189bcc7 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -910,7 +910,9 @@ static inline void tcp_bound_rto(struct sock *sk)
>  
>  static inline u32 __tcp_set_rto(const struct tcp_sock *tp)
>  {
> -	return usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
> +	u32 rto = usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
> +
> +	return max(rto, 1U);

	return rto ?: 1;
is possibly more readable?

David

>  }
>  
>  static inline unsigned long tcp_reqsk_timeout(struct request_sock *req)
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index a2074a1af422..f65697bc96c9 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -1221,8 +1221,9 @@ void tcp_set_rto(struct sock *sk)
>  	 *    with correct one. It is exactly, which we pretend to do.
>  	 */
>  
> -	/* NOTE: clamping at TCP_RTO_MIN is not required, current algo
> -	 * guarantees that rto is higher.
> +	/* NOTE: clamping at tcp_rto_min() is not required, tcp_rtt_estimator()
> +	 * applies it to rttvar_us. But rto must never be 0, which exponential
> +	 * backoff could not leave: __tcp_set_rto() takes care of that.
>  	 */
>  	tcp_bound_rto(sk);
>  }

