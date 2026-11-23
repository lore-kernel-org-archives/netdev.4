Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427194;
	b=ESmotgQBHE1FfQZg1GTwSx1TpSIR8TR2OMUHdpwgCvjCLZX1W/Xw0DeEau0cV54o/35M
	 Yz5V+MHqhrlmloWxiHZrZPHpfY/WgsbpFMGrqewEU+PudJelADg7QYYVjA1P/GxCoPYth
	 ZzTT63UaN+T5vRESAH8BoHyn52/h6T61Dr+CBldS5+a5xzPSd60JTCPzuMNVPdVhCUARu
	 dCTnHLdV1Z7oqc95SeZt+TTJZepw95FmmaAx9mdtPwNiPWa8wp9CS1SmMrPRkAeQn38sG
	 xgQS+rTc2Xvw9WYmSchHn58Ik8w74RmVBqejitw5brkxFSE/08s1jUctxAkMaRUMsAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eZEk4cOQr2FPxoxTzq089dU3C50eIos+X1Vfo3checo=;
	b=QN84iAq5JJjHzfTlG7zKU9xYUbSWSJHhLACo3QrhNuEQLHZbcam3Jt98q9D9C8MLntn3
	 FIIfmlTmv3LzBGrrGDTD84ncFfU6y0pvpVWmmkwQZy4XZz+I7DKS2gJpafxCO+OQc7Pnx
	 JyMYRnYwGyY3SJ+S0SdTqDInXdulhY3UUFWBNbOT2a28J8Hv+Ya1MBGKkeq80bKOpr8m7
	 WIa20QqF4YfImOVRB+Mdaz4VfciH1PkC8f0cFeic4swV5xB4Aqp0S2TpXdqbw+lpUDXjD
	 CeqvikBKubtH3ExNRzH9E7xhSSk5OFzn8OjndNoV/oSzyi7GTpoyljXZPgQR3bOfL4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b="A/ifu4BV";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E8606A33E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431E8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=A/ifu4BV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso30139655e9.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795427192; x=1796031992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZEk4cOQr2FPxoxTzq089dU3C50eIos+X1Vfo3checo=;
        b=A/ifu4BVrq3O89qvkUvzk1f9L4nihg4FyRXFGOwwPVfjEscRp2Bf7hR4kjhux28dF5
         5GwP1/mzMeOCJ/KKn4f5LfS9Dhr/kWLL1/xUCCstTyZIMQWhzUAABspTFsxVdbbfy57o
         8gA8/wtBUiaIhx82SqhhAinJ2rr3b1IMEenJXhijV02aR3kM1NJ5hiaDtVlR+WdQwhtx
         G4+LW2+Xm/YGpsQ7kjw/+MG4VbgEX+dWJquFYll4oLgeaXsI99IvQAKV/gwbgbd+o2wM
         YQh0Z1mRWhWTzIGiSz4U7rQMmyZE/D9Yjj/zyOlsN7A7vtJTm0yeB3TmZQLGhAP8oRHo
         gzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427192; x=1796031992;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZEk4cOQr2FPxoxTzq089dU3C50eIos+X1Vfo3checo=;
        b=diTCrwS8ZaPPTZAb7vOotPEjkVGx5y4ilR5SfU6VYR/iCtJo3IqbUgx9h9urTFvF+K
         FRDxUelWrGdYbNODc5fcq0iAHMgAav0ZRyePqv5nMcdgqnB2DVq1NaJwJCAg4UQuaq4S
         RIU0WxjzYyKdiOui3GhFz9WyKD2PYyP6gh5eJ08dw4T0lRTDHLIzPe5kxqsdJZzF5P7w
         MtRZmWtEMp2AYUESyLgrm0zEjvn4Z36K7xovLjcqpRVh2iOoUaAbGuGY2jUo1dCMm8ij
         U5r5NgILAbfYvq+fWBJkrvQNCUhdF5M8RNiONcjixwVU8Zw7FCOPEtATCC3L9kDCQ0ka
         joPQ==
X-Forwarded-Encrypted: i=1; AL+hErGFDkno5ZUGEjuYJtRiDehV8sshF17S/Uk7K0+J3N9k9Y7VJXT7selI69wbr25AliKsQ4YWqHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7DD0lmGW+LdPM0am7mDT/trlrKMTJ5SIxAk4Gxz7YXz4b3wYU
	vP4CiswTKcjMnpEjsUGlM8fSsjoIa0LP/rAnvctDVM2J3pMk9rcsGH+s8PB3Eglj5Pw=
X-Gm-Gg: AZFdTZfzDIBWk+hkWUpLn10ObW2ww2N2ndTPCNCjtIqRgBclaBJf4zlbdfkUyVdDIiq
	ltNveVDkEd8LXDtOeXDjJzNyo9g/ydydr4ejStxWxqkhasHrjJHq0V0rpm9DGy5z+gQLSsHr+Qn
	tf0ShCDDRubCDsBNLEKvzc8UJ1xEYpdG10p5WiA2O/GP2EKSPiFKD8JyEi+j92mj/dzN/nqvr8C
	pVY6lY1RlKuBJ9X/vGTFlLMRiLShk30CQfDsl3fQyNM6ASWQe8qqjm9mdGOYWXdnmiKvYSWLlbq
	PK/l7u18ahMqbbVczxcDVybLR2ItbNwlMVQcZt/hd43aGsqQC6oV3wOBbjq70nJ5cgW4k+7jSUi
	IuxNp6BbQwLp7jr4ArvJanHdWsAyNt0tbgH4/5hDcDeAGM1jPbjI11puvbVEj6ChFHAi8FeaPNB
	KJSVGX0VujCtfnquW9Vmy+MquoaN9KbKzCfNWOw04O7BSjess4KWlZJd51mG0FSubmK8LwIVTPk
	dFf2RZ/QYxkRc5MThAKmqmrwlIDdMEn9hKysARyFu+pHRxUJDsKgpqZvWmnsf5enC2dv3XFnLnG
	XNXzYazDwmd4bT20dbphiez7iVd95UhPmXy4SqbtxkdXBJtOiy94Z69b46U=
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr254981035e9.31.1795427192587;
        Mon, 23 Nov 2026 01:46:32 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm19669233f8f.18.2026.11.23.01.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:46:32 -0800 (PST)
Message-ID: <114c2bff-6d09-4b0b-8f7a-df0f45832f6f@blackwall.org>
Date: Mon, 23 Nov 2026 11:46:31 +0200
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
Content-Language: en-US, bg
To: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
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
 <3c96d878-0326-43c2-9869-e941cae675f4@linux.dev>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <3c96d878-0326-43c2-9869-e941cae675f4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 11:41, Jiayuan Chen wrote:
> 
> 
> On 11/23/26 4:41 PM, Nikolay Aleksandrov wrote:
>> bpf_sk_assign accepts any hashed socket and the rx path uses it without
>> checking against the packet which can also be rewritten after the
>> assignment. A TCP socket can then reach UDP receive, AF_INET socket
>> IPv6 receive, a v6only AF_INET6 socket IPv4 receive etc. A queued skb can
>> also be delivered in another netns than the one checked at assignment, e.g.
>> after an rx_handler forwards it to an upper device there.
>>
>> Check the socket where it is consumed: inet_steal_sock and
>> inet6_steal_sock take the protocol of the caller and drop a prefetched
>> socket on a mismatch. Like bpf_sk_lookup_assign, IPv4 also rejects v6only
>> sockets which tcp_v6_conn_request would otherwise accept through
>> tcp_v4_conn_request. A syncookie request socket left on the skb is released
>> as well.
> 
> 
> Some old discussion is here:
> https://lore.kernel.org/netdev/20260403015851.148209-1-jiayuan.chen@linux.dev/
> https://lore.kernel.org/netdev/20260608125846.157004-1-jiayuan.chen@linux.dev/
> 
> But the situation will change as time goes on. Hope the issue can be fixed.
> 

Ah! Thanks a lot for the pointers, I see. I can just document this as a pre-existing
problem in my patch-set and leave it for the time being, I don't see how it can be
hit by accident, someone has to be malicious to do it and I think Alexei has a good
point that there will always be a way to crash the kernel.

Sorry for the noise.

Thanks,
  Nik

