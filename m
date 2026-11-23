Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394761;
	b=c2WcUs7jFLYzibBapCnvLxaxnAMPEpSZQwkOt1u3f7Pag26W1BXkYf1IPtHl58mli7Dx
	 2ICJSIVzGF9t9QZbodqKFfWJbCSzeNFIolwh+TqjUBUdKWHCF7XPxY76/G7Vlp87Ip4gc
	 jk3ri3RWIPCZnf8Re2PPqz0Q+vm6qeE9zg3W1GeD2U3A3CR39zNiKChYAUXJ2ZdaAuHNJ
	 1hLwZmJkneZbdv1vVAgbW0jt4jpl5ra9wGYGXoyXXmiwSBQ6lKpTlIvzet2w/zA/ZBkij
	 lpEz0M0bJrux9/yODbzQymEyFaXlERdA4fWsHLUgL2TVrsX1FJFiijGPMwsDzzDWtxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
	b=fVOPXDAilUJc3eCOyujl3zmScXNF/kFLUhBUJZ5jr7nFWjN4Na86/IBtAqubUN7cabHq
	 dFP/9KQu/Jh+su13sY0q4Xnway3McH9KePGH7kwaYhccRVvp/ckyENo0AnFWsW3K13T18
	 a0Ne7WHh33PRrvfEHgBspJoLzufLPnLB6PTzMDrqFUCONrFzRBOMjDWOtzq+PwsUhGQPQ
	 4KTDB2I14IrQIGehzI17ErAC+NWgRVgxEDtIaiRfv+lvS0w+Anh+Utzn7j1wAz0cx8KKY
	 jS419xSqGFbGJfIhFXY/y15Omm/7O9ovWT7uKIW2bLmq85ENHgvMD1RWUrFJtj/Q8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjQNwyU6;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53746606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53746606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjQNwyU6
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f03920c4a0so16556275ad.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394761; x=1795999561; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
        b=xjQNwyU6MYR+Sv9DqBxkCsB1ojg0HIKyMipAx4s6KRT5IYdJvl+GnVSxTRanDwlO4b
         OjsHRhZlksxkgGyYo9uQR4xnsH9smwEzvZB0U0xWIc7WLxA20JEVyHvBNfOB3Q6RKyJl
         W3Omp6JWwiCVAkQ9a9ECTstSvDMsiW2opPGebxfCTT5SlPd+dIB1fYQxZJhDwkFAzhym
         zUVWh9jYqyhJ1lPaR/5BHmGuhw1iLZ2Ep7uY5F2lH9rP296aefHI8qNbvrd9S8rKbf0P
         oiX4dY0ljie0g+etEjHvsK3G0VGKqx3XN4ZOcK3unI0mprBibWrDrY0Vx0uR0JHB3rXt
         eoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394761; x=1795999561;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlGQ+s1w0re2RtxBjjhAHjiKtshlusVceD/sHg+v24E=;
        b=mOvsgMDOAS1F7kMxMZQOlJTYoSQ2ewlR5kH5T+GFMb2JlWzODDyAYJW1WNtfFCChex
         ZOUTcRq4dUQUDkXeXWS7bW9FxbPJhvpVv8Apa2MyhuDp3ewQR2J9xZZ0uYZW0gmn2QO4
         RDeGIS32bR/Px0AZHu2+TAfoFTZWxbqhIr8JWZvI8rMFMCtoGovf8AGO1wOdgkGo6Xs4
         sU/whKjT4ntH+/2VMTXCiKkniY+sPGNaLkg8mKvQMSV8Vm2AF6b5iCJvCP/EkCwqGyWu
         i/cs/1+3K+YH0/Y5bgr/vmZgWfzO/Z+ovCWKhkKGoMSdUn6CDJpMWl4CoCOb2b6kW+n7
         NrEw==
X-Forwarded-Encrypted: i=1; AL+hErFHPboJoeOq+PbTVGymmbpjgDw6qwBIGeP3YdEePtAQSPfr79UYBqTpazBYX+rO5AXnL1nDVCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gzmuUIfvU7vkJuFV/PqyJlpUcIp8TmDXBHEsP9ZsfVWX2d/Sl
	mm56FRwaB13IpJrauiRF2ALgKX0xyVW1dJIV8NdM5Q2k+Av5LrXn87q0
X-Gm-Gg: AZFdTZfCAQU5qFHjSu/UH7X951XEArEanC0XSTDlONBqsjLXVBINxXXEWF0C1uEEm92
	dqj/LyDbSonN3WoUtAJ2klAeYTLMUbAoAUJ2ZXY5C8VE25NHT6eUBEExaH5vYMM/Ml5URvZIYd2
	u9Jr5ZS0Diz8iRxbLp1Dib5FV8QQbLkizTJcTjD5Sv5k92IM9qmIOraoYj7zB/ChWB0U5P5cRZG
	jxGVRgmBLrIVInFm1cW/KZPiu6YfRNk3Fk/Z7j3XY5s2kT6Hqhg/IOnd+ZWEBFa4llBRRKNn9hg
	jFeFJPdemFklkNM//tTR+7eQzwafrdeYAYRFbW/L0RAQMwumTSz7QQweBvYeG1swhN6dHk4JWEJ
	lNNEBLj3DL9zsP338xmpd9jX2YigWLMzjALXcJ3TU6/EcT4Qt2V8HvQX4yW+aIEt61KwnkTiW6R
	jQbGGCZrq/B/NlpoxTQsgPyjw+atYbgfX7eKxaBkixQ60Ag3wktbIusb0kAxpNRrARBsoZ4zBjE
	3htxoAUYodvGKT6UApcb/Ie95GTMtD3i+Ap4nxvrSJQM6VpEaqL2tMRPrJxJHIEabsoJgHnDO8q
	YF90rVtNPP4PoXSM4mW9S12GDZUaUULUgMGJCfWhGfALIRVSa2kRVYxCOvOKaLYcASaPKto7YHV
	JPTTUMja0ii9Y6gDPsI6gavtIXgfvEQjRvHI=
X-Received: by 2002:a17:90b:1802:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b41c955a0bmr8991155a91.43.1795394760621;
        Sun, 22 Nov 2026 16:46:00 -0800 (PST)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm15174661a91.9.2026.11.22.16.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 16:46:00 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 00:45:59 +0000
Message-Id: <DN26BQ6CGT3J.2WZ83RCCF7HDD@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Kuniyuki
 Iwashima" <kuniyu@google.com>, "Willem de Bruijn" <willemb@google.com>,
 "Neal Cardwell" <ncardwell@google.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sechang Lim" <rhkrqnwk98@gmail.com>, "Mattia Meleleo"
 <mattia.meleleo@coralogix.com>, "Michal Luczaj" <mhal@rbox.co>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 00/11] fix misc sockmap issues
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 21, 2026 at 02:30 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> This series fixes misc issues in sockmap. Most of them are old.

Jiayuan,
thanks for the follow up,
but the fixes are way too heavy. bots are correct.
The patches introduce more bugs than the fix.
Pls ask your bot to think of absolultely minimal fixes that do not
introduce new states.

pw-bot: cr
