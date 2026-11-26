Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696064;
	b=KksUMLTSS8SahTk9vBuHUrTfkOR+xrlVqCSxok1VaZCJLRJdmdiFFjbod9QnaELPq4Z6
	 oBMAbbS0gc7/osUiKHH+UYxD3rH6fpXaoOqN6yxv8Nnx/0CMcSH+7V5+dOMIFACqBcuC/
	 CYZTtE3qV6THqSxUjnhol8E625GOmX16GdFKOIUrCKbVvYwm2j+bVjg9fKu1GYVziYiw/
	 2+HbHEJZorGFkcjZcqNzMQMKsYC+3R0SNbbRWHsXGCt4wxtDzziIYcqsgCs0Sy2ZHsOgX
	 589jq1VZDQv/PbDpvQKPO7RLvjJ6JwWLPsDBd+Gl/PIC7TE/+oBkxWPqyBsSOV9rdkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696064;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
	b=4TItPJMh3pAtqfFe6XxMuf5UuZVVZVaRmlciFuwscURmsTw/cI751uEqpgZ9SxXeYGSz
	 k9elihsW2NlbR888QhyRaDEsYj4/CwSZKPFjJHSTGhi6LvG5fczfTsDDyN4FjAd1UL1we
	 72wGACHoH8xoFA8dFRBuT2zy1pO+RnX2Ds2ro37oYS8bcJd+C2+i+SRcUh97kmtxNLBH+
	 9DPPB3HBdT6XLeI8JCH/GCGwlE0E7gwerEkUNAQbMQd1g52aHH9FLQGzb9bVmUR3M704y
	 kvOiGueVqDiRr10X1V0yyVufczv1lCNCsV27tlT85lWorgrb2/28aFtOJZN5sEvPPqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BuzY04aN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=esWdhudF;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F70606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BuzY04aN;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=esWdhudF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
	b=BuzY04aNqJ8DjlZh/sunyE5JAN8qSV7rHZIYvceOiE/BgLSiQ4RapGubKH/fa9UQdCQxtM
	IBaeD8CosmolQ7olOfIfPE2VjPjX6dhhHaLiMIiLMkWb4G7UL45gcR05ENGXjySJn+mBNQ
	wEmuXbinbBgHnRS4D5Io3iUGPCHyW8w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-ek-HRr4kNjKo-HDdMEEuGw-1; Thu, 26 Nov 2026 12:27:40 +0000
X-MC-Unique: ek-HRr4kNjKo-HDdMEEuGw-1
X-Mimecast-MFC-AGG-ID: ek-HRr4kNjKo-HDdMEEuGw_1795696059
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba01393800so2136135e9.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795696059; x=1796300859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
        b=esWdhudFfQsKS+tpfNRde2CWmMRuH7fqbrNvk8aC89n+TvncvSj82pqNBmHCooAThs
         fmcq1QhNQBUaX9mciAZ6JE0oHW9tLzqmTiKC0bXz8zsmnD3at7B9w8gizJU7bV/XgYat
         mQEJGlprrFCKNJ9rWDBiARQpsL7WncTQ59cOUAuxTUgampDGDiecHLbJghdBVPImbCYT
         1XKhDmUsWwmgxcbXiZr6JkGYWJnObu3l2DPR9V4biT+WjR4vWVl5KX5MmEHlXMblucpL
         ZErjEtlJdYFk1OHpbSyONjX/ul4WKAx7jT1v0sINg/RO/7QK9/+GqxpcJH+VUVFGxwkP
         RNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696059; x=1796300859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cZzYu9JZHNy2GGOL3+wun6roAj3SViQk5bIR0UA5Sk=;
        b=GhFK/3w64+YyvA70H52aaFlaUKba+8yespuuwbwUOH4WPTty/7gsRnqm5yaDNPnJH+
         FdvhlV1XyVC6YdXDE6zXprNpzPRSvPY9ZVxLMuUtvaK2YgUgGNEQEWNHmCHGxTxoOTa7
         DYbK64RlY0IRsuGQPexPYZB3Eqa05I2jzWXnFylbip3wh8zegbtUPFuLFoomlrReDHUH
         3Wl9UYljzGu1kChlSnXzKjZ6EXnAsXTSAIAliFTCOAqq6cOm+bYGFy/9+Y/uFtHfINTx
         nkOVENVJyMT5wwz6/oqKh9gYPLGAMy3B6EuUk7b/8F2dONsFujVafuk/fAtPFzsFuJFz
         7kNQ==
X-Gm-Message-State: APuU4Z85CjV7wreJ8ps8/2ftk8/qINh/FPtiYq85TLoCwr5AU9Z6N32A
	e/hpHYPO8emAMLaYwZwwmrmKGw1XjITmmar4e65QLkGo1Sq1o5hU5438sSNoFUNFSOdnuIo6OMk
	dPO8KGK0tCzolF5CdCKf2knaxbMXHrm+IIMtNFuun9sH/AF6NorpH6yw0qg==
X-Gm-Gg: AZFdTZcTHlX79unNqzFvkjpHRjzHPRGEhndWG7gZ4KqfafrnX4vuldOyj7MWwDMkX+3
	tsmRcG+HGz8Qdbp0Ct3sIjl3k8PnPTSL6PjqXK4Do901ELtBXBokClVgOtnkBsN4TpQzar9t9Eg
	BIoe+ffTzNt4yQ1HOyUWSvO16F27QdgcWtiQFJbRgrYQTSWicKwSJu2rto44HVgIDOZ0BaOIYK7
	0rzhx/EbL06Z+/v1XoNeYFKejo10syWxc7Jv98DO5SCD6CD2mW+PWfW4/T/HbRYPFWvZJI9Qp+z
	QvAyGGO69as9JJt3CDeChAaOSnJUboq5rDLNUVqZIUC/N9UHdHG1QB6BVBWlkS9rlmluu82ysBs
	xTabkM1sIOIMSrkU1ZWLtGVnSwFr/ceUE0qoUPo8wUdkKrqtWjdM3PNsfjhYIFX10czEf88cFRy
	itHk4cR4TJP8uRF+B86OWYeoahAmq1Pk7kXldl+EoJq4M/
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr450260795e9.20.1795696059256;
        Thu, 26 Nov 2026 04:27:39 -0800 (PST)
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr450260195e9.20.1795696058841;
        Thu, 26 Nov 2026 04:27:38 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm18432143f8f.9.2026.11.26.04.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:27:38 -0800 (PST)
Message-ID: <76fb5610-8a2d-4540-ba58-dd888e37e372@redhat.com>
Date: Thu, 26 Nov 2026 13:27:37 +0100
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
Subject: Re: [PATCH net-next v4 6/6] net: mvneta: serve the TX queues in
 weighted round robin
To: netdev-bot+sashiko@kernel.org, pepe.schlehofer@gmail.com
Cc: netdev@vger.kernel.org, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 maxime.chevallier@bootlin.com, w@1wt.eu, linux-kernel@vger.kernel.org
References: <20261118093012.90121-7-pepe.schlehofer@gmail.com>
 <179530217537.3135.2864178231067849132@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179530217537.3135.2864178231067849132@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 00:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Nothing in the driver confirms that the fix works on Armada
>    370/XP.
This looks like the only possibly relevant comment (the one on patch 2/6 looks
out-of-scope, and AFAICS the one raise on 4/6 is addressed in the next patch).

I think this is better handled as a follow-up is needed.

@Josef: please note that you should have addressed sashiko comments yourself.

/P

