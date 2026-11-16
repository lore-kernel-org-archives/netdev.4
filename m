Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870757;
	b=n8EaFTSHRXMoaud4lKIFGm0aTiCw6JTijr+ZE1I6Wpi6Ryc7d2uDiIPONfIGVESQU2q9
	 cL2x6WDBUTvxUyD47q3qPfPdn3lVnw2YiyAGavWPjGx6Z17BhUJsD3An1G+sTDjmIheM7
	 i53Gc01GIls+VlAf9Ui60DpI75sgprTeebHm1BnqyVO/anOwOCrWZPXVv+50OuKBQyVl/
	 j1FC+41He8NdaJcOrX+RKjZupsCDO7MSU42Bb6g4Ew8exnXMJ3QIlbea2Hft+eRfcV5N8
	 GY9UqPUy8whn8eA1i4XuM7JkgwlctONYf2HUZInRuSwpcim/CWurbBWufSlu875BJkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9jytzoHxbIqHB9V0lsXyUYMNkWAposbSwvwOoQ9uAKw=;
	b=WAjdYK7FhlapBEisITUNPfDS5sdSMu5v4s+fAdEvg6U09/CucmquHFzHgkkIa/GTSzX6
	 GhJoBPlq+xNYwogXi5Jvk8kgTwnR+fH3m+mgJRryKQgZz//FOXj8EabSiwI31cY/8vhmp
	 duk/GT5seA/KazWSToBPUj5S3Y+OaO80fyUnEZNsNY4xEYe4cm/1kkgj5+q1rZx9OPKnW
	 sEdRp2tT6lf2LyQiVx3PnEs9yhC8/Xj6JPJaRVgKJr7nzFJnXuIiYVMB5QeOQ/IITt99R
	 miR/jRNt5xJy+HJU0tcavmcZVjtxZBz3pbJwUpJUnQyWVcjoYy3i4DQldYMIrqnOlkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o15JjNRL;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67357606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67357606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o15JjNRL
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40319bdso1322149eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870757; x=1795475557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jytzoHxbIqHB9V0lsXyUYMNkWAposbSwvwOoQ9uAKw=;
        b=o15JjNRLdSVYdnJfPhx7UWb8pObOU7262KmPYrgSrTQaGcgdOQltccR0WF/KZo+WIg
         Dx/GksFBNLSHVLiCvK80pV2awxZjdHgDh93dzMiZm6JaOcwy+QnYtZBP71IqOkdG2hH1
         qSAC8uGlRINDI4V3y1UDJPAi/1/s444xYEl/8oYN5HeSyITOXDJLWHhqnngVyi8MDGfj
         Ri5BsNKX6s2YH1bu5vrhGI//ozeQhK59lQut7RCqRYUicFnHBshpTUbfSMfbiWkdbFw1
         lU6d0DlSEtnQ5BHT3KZTB6fQDJpr8cr5cFpv/5KMpfKN83O1w97WACrlKRyjcslJ+Ys4
         WIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870757; x=1795475557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jytzoHxbIqHB9V0lsXyUYMNkWAposbSwvwOoQ9uAKw=;
        b=Cj9Bfu+0pxa1zIYlCJDCiFTj9sW+3bsKZ89kIrErHRtdogwLZnIIFbZvtLRjEzY6Xq
         Bi5TWPhsjvYscVh1rlYA0SZmumJSkTiyQCtIRd+JaEwH6MqkDYOwhPc9WEpVJm02oyj3
         nlAhrO3LqtS3oBARPZZr8ViPWZ078MrtiS7SXjhRKD4/0/PwTb0oRhvTb4P19QD5boNZ
         HjLUVVYO+zgZ8y6nTrQiwoevAwyWknG+s9iAktivDkTrl2tLCQ9U0vuhFLDyrThUr8GQ
         DC6UwEjNdpcMq3C0MANgj2LQQgToWQzuk++S3rNKoDyBopXzvlq2GR1mOo7CHxuIJUbH
         r62Q==
X-Forwarded-Encrypted: i=1; AL+hErHWVX3N+QNRl588ceiQ+cNL1lKgePPesZDj96ksxYo+v8VXN4m5k03H5DXocqvTqq8rnWpzVrg=@vger.kernel.org
X-Gm-Message-State: APuU4Z98jIgrR3LAUxSdYsb2lb5DMMPJEF6wZBi6/OPcB/jHy9c0L04M
	iZWqKUhp+QhjzLok4IKhKB21elCO/R5TyS5hZI3AftA5MVkrc/1NAGD/
X-Gm-Gg: AYBFou3ebV6fd/TOCz47Hz10E+69HT4KEaLWbLCfBGoCZ8gQSC3ZlUnz5AdmpGu+L9a
	UsPkUsCD/mCbM0DhCOfBhMbpMlSiUgsdKqC2v1RHyBiid2HjQItUczsPh8NBUuYetO8LeKzgVet
	kBlA8I+aZ0As95I5avvAG1zNOytl+3uIbIDdq/O4Qr39p/Vn9bVbZCJg85UZjDjVmuHcMwV0DNW
	CsDbsPt2fm16qozjNpXQheR/LGUmRsZt4ZrU0UivBRlaJA1nQAF0Wwu9/YxxXXkrqZBykNXnI8k
	H/Q5BGSJCJG5rBNVNtZZt5p/Mw+LEWJ0LYX9ZQCLN3Cia1Xafct3OkwPr0cUJI9vrxs+J327Icg
	lhA8sf0cq5TINE9IKxVQZgQz9vw8BY/zDVWXYI5xp2Vk5VNTN0Rqvrpy9dgSTJ+C8h5tqD0NXxO
	qUcGgMgFL+3nT+he69Iy1giyukGASBNN6hUMlQLs/EXKDFSpTp9IsJmzUOkW2njcfZiLyjBuCEA
	reibw5UC1NcnVWAj68L/GETPi5lOuPj2T4jvsAmkDf08sbhTFT83scT/XYjjWdnz0RN4Z05FWJU
	hzcVcxb5KGYF3gb3TM7qgiu86q107XZCdNArA3W2t4dV3wGf0jRxQscuzkCH7GNOyuLBE1noojP
	xPhmQ/gEofo0=
X-Received: by 2002:a05:693c:4153:10b0:37b:e40:397e with SMTP id 5a478bee46e88-37b0e403d73mr9727389eec.14.1794870756440;
        Mon, 16 Nov 2026 15:12:36 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:3f76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm38038163eec.7.2026.11.16.15.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:12:36 -0800 (PST)
Message-ID: <64cc4724-8477-4ca2-ba51-1e561be1e417@gmail.com>
Date: Mon, 16 Nov 2026 15:12:34 -0800
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
Subject: Re: [PATCH net 4/4] selftests: drv-net: stats: query timestamping
 stats while down
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Mohsin Bashir <hmohsin@meta.com>,
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman
 <bobbyeshleman@meta.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Breno Leitao <leitao@debian.org>,
 Simon Horman <horms@kernel.org>, Mina Almasry <almasrymina@google.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Dimitri Daskalakis <daskald@meta.com>, netdev@vger.kernel.org
References: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
 <20261116202957.3601684-5-dimitri.daskalakis1@gmail.com>
 <20261116145108.23f991c8@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <20261116145108.23f991c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 2:51 PM, Jakub Kicinski wrote:
> On Mon, 16 Nov 2026 12:29:57 -0800 Dimitri Daskalakis wrote:
>> +def check_down_ts_stats(cfg) -> None:
> 
> This is skipping on netdevsim, you need to add a fake callback 
> to netdevsim as well. drivers/net tests can't skip on netdevsim

Ack, will add netdevsim support in v2.

