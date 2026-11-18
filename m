Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027708;
	b=VukqwJC4kAIoR5Gj6VmIWlae7YTdXdF3FKiql6uHGUlp910mm/QVJWlwuJ/CeyUZ/zkj
	 XLfG4pINf1MGtZpeTaWvQfH4wx/t+X7torOBak4SGk/YWC6DOOBG0SjjyOqH/iBNArspV
	 +LooLi4RsGEBUo9ju9TARkYpYI6pIoqUi+Mk/fcBoOPgjyyoov+j4hEVYJlWbrtjZPPWq
	 0Jz6joUEWfURwFNbqBBudnR9Crn5cOEgjEfMgSn+hthoeIc4pfLcRWCHi7KUkqRFnkwyR
	 dMsGrtDb6ak1vuTPGLZPzoGX8KlxQ4z+1VVXqA0GafH4BM606vnN11qM51+thHTKyrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027708;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:X-ThreadId:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=kmVHzEKlJfSD2s5xwTlOX6Me/gLnw4aWJN5jsCl2uHE=;
	b=ijs9qiR+iQu6Xg76eaVY6NgZLP/OLuY+3C9F14tAifVP3yOZQKm4ow44mXhpQg2zosNr
	 bEFTFDnDCloqTPyEkhsFSjperZQ+gFgs9oe1NFVgOLXTwJ0/CGyhfLyzDIjAV4lGDD1Yt
	 9CQaN6/xkyXfTJJvluSSuINSc4Fvjay4j/GTgMARUOUqEyoKgT8kcKy7tgcq1d9SPIsJh
	 bcCKN3PD+G2wcE3RWsx8ctlRAKvyrExsyIm3FdV+UEoH/4z7/z0JYhirN85s2pvYmhb5P
	 aYuagtOzPwXLQKs64rebSxEPSIq6rLH8xBgMhmqPQoNW5LR1TwdLggaQTrRHwUZifPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6hT4+9b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1114606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6hT4+9b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5B31F000C6;
	Wed, 18 Nov 2026 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795027708;
	bh=kmVHzEKlJfSD2s5xwTlOX6Me/gLnw4aWJN5jsCl2uHE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=I6hT4+9bDd5KJp1pvHcrD6d+uu5J2sLTh6pcrQMyHKqeYkD1qhsxDF3RvVUFYJLCz
	 /6stBVajqo/fqE5RIuiiUfaRXffsrDVVH7+/D7dalVEzlA8JsY8+cif1KVGlMRc3p4
	 sTtz45dwNpJZ8HghXq6V4k1Zo+owFj+NDB0o76V5EZJ4Zyohs/dfdy4kEvlwVpS+EL
	 /yRJtwJdIMrPMaMBIsLLgFGFuHF7MWPHP8jTT/1tRixua/KGt61s/or/HmOrtpL4vm
	 /p1IsCWECs7zJEYU+cZ4xK6ISkZRx4AKpciDIukQDAF0g+OQEK4XvWN+CAs9jC8hFj
	 kT6p7wTkMofLw==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id A65D4780043;
	Wed, 18 Nov 2026 13:48:27 -0500 (EST)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 13:48:27 -0500
X-ME-Sender: <xms:-_L9aslQyg49Grhn5Iz0wefE3dvCrllqthgZbpkKF3abEDpvtxdCpg>
    <xme:-_L9amrPk7N-ZQI30n1ZtCSCFpznGouT_GXo557TGHVmWlPH4ptrcuhZXAdbaDQFw
    RlOeUtQs6ApWWeJZQmFsJMFmgEpnCW92u5y20bYJH1TGsylipMmcj5q>
X-ME-Proxy-Cause: dmFkZTFdelxg8lQPAANZ9ZXlzxz3fHDAD/CWf78VCBL81nob1lDimXPht4lcJ0ChwQTWMF
    IzzXE/glTNL2aO+Z3JsC0mt5PBOAM3heBjdku7GY3S1M7mSpoljduXPZHEAfQBcxRAEAVk
    bxK+zkbM/YmuCdk8Or6tR1eucvHqTqFSslEFDZCqGJ7TFxSR2SRhDWp5CzPT1kxHo1h7r4
    ZKqadqiFmmoVdXUjkcYmuBCZwPrA1R5GbwD5ww8PNKQ6n/9Z1YxZ9JNU96Pvsw9srMjdyN
    uH7knNiOtf7hCr9NdF06G1Li/2HYNdiXag3CLmAJ2Uzp0HTFFcSaEQ++WUY8v/Nh2se9J5
    0TuMXveie1UUlayolRDR29PF9jPYIV9GMp9HdixcvabdfvU4WWiaLJk2AUUvoh+pNVKI7f
    bDpSkAaCuC+0btJaGZybYtyR+NAo1UjOuuDmOoRSMA6/F8L04+OFxJJSysDECxLwYt5UiC
    gSd2099+gaGvYU10M3Y7tIiB2wTsLEuBiuNFob9GN4fb8SJBZuPF18Wc9riAO6pEpULCtx
    ZcbjgxnnOOpRaT8/YdfvFwOvykx2M9pmYwEyMrO+AW5zQ9VK54YmHX1rn9WgMT0faZePqj
    NKfGyssK85u523655YjEsB7tSR25Qf2IUi0EMZLpO4Et3ipkga+lNUTlE5UQ
X-ME-Proxy: <xmx:-_L9atQpYDjTuMpuaQTM_SyxXTjlmPXi42W36jimoWzOolRaCnfy5Q>
    <xmx:-_L9alDNbjCd4K_0Wwv8fHY73rZM4BwcukGFU4KRa6OFKTRe-NL7Jg>
    <xmx:-_L9asKOscgSHxVhMjjEXo6yHUmN4zNzrGJr5uKunzJ9y0BBz9PhLg>
    <xmx:-_L9aoDnmMcKA4ytIOi_WyyXVGIsd3RCPSs_reg9blwVkajX0Lh2dg>
    <xmx:-_L9apus4pW1z0izXZpkW6U5eMrPAIebSLTPdyLmVbqowsTZvokTqdOn>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 56CCFF60084; Wed, 18 Nov 2026 13:48:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 13:48:06 -0500
From: "Chris Mason" <mason@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Message-Id: <37e80ec6-d2f6-4683-9d6f-4e9c959564c5@slotsi13m47>
X-ThreadId: ACB5QwprTRMB
In-Reply-To: <179502618349.3136.1063676165373741119@kernel.org>
References: <20261118155144.18393-5-mason@kernel.org>
 <179502618349.3136.1063676165373741119@kernel.org>
Subject: Re: [PATCH net v2 4/5] tcp: clamp the samples in tcp_rcv_rtt_update()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 18:23:03 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Can a long window-fill time still wrap before it gets to this clamp?

tcp_stamp_us_delta() narrows the delta to u32 first, so from 4295 s
on the clamp sees what is left of it. Your 4300 s example is right.

It takes a flow that needs more than 71 minutes to fill one receive
window, so I don't think it's as bad as High, but the changelog says the
patch covers both callers and for this one that isn't true yet.

> Would it be better to clamp the 64-bit delta in tcp_rcv_rtt_measure()
> before it is narrowed to u32?

Yes, so I can spin a v3 with this change, or make a follow up, I'll defer to
netdev maintainers:

-	delta_us = tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
+	/* Clamp the delta before it is narrowed to u32. */
+	delta_us = min_t(u64, tp->tcp_mstamp - tp->rcv_rtt_est.time,
+			 TCP_RTT_MAX_US);

-chris
