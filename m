Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704880;
	b=msZ4vsP99oHdfy8GdcZkJqZbKu711xLhyTriGJHPxGv84PILCMR5mKD1c6DjQEKo6A9Q
	 vSt9ojJbyT3vL6NfVYgGE5Zplfp6Ys90ZfyNsnOjohBd7g9ODa/hi/L83G+db3539Iq4S
	 hULEmmJ11PoI1zpZnOAq6JJiurEmg8rCoMP5QMhD1W6AI+TIWQO0vweY6pJ0WrGrOpHYG
	 uXF2OgI1Gf9wUAfBUpNZ3YRW+lQIFjOKyWxgcLv+Snl7/DfhdZ8l9izYu8wpqoD4uwD+d
	 BgvRLJ6HN1SSIYqyKCXijRwmOOlHXTWM6NFCmJCoBWNEeGk3bmpEwjdU+HMLU07VLBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rlNHTb2A+Df4Ai4PVth3K4qeSMAoWDzm/JvQFvKYsXg=;
	b=Ex15YKwxUw2IhzGmyc3bexEfSMasrVG0ADjZW81mwRO2uYSkwR/gqsqTKPpAU1Vhp9hK
	 M+iCx7k+rP8QtItYNy7cIGgrpPoyCp0oSTCQBRtCqeza1lyavdhLSo2IUmi/8yI2uXqbx
	 vuaZ1ijIsHcdu+Z9DCBNh+llWM3gPOn3+1vQvAQ5xeYdqnE9sc/3MjitQgliWzdhUJBGb
	 cS6fsqMnk+65hEcd5lsAhPw/WqTGQlF5j46RCejjGMTY/9c+YNTw5MwqbmaKP02LL4DY2
	 dIJcuEoEVZWBuBuNZf1qhF4VinCzgzAX2TBdXhJyYKHPNjBEnF4RZL0Ig9x3kcUKesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b="SM7E3ag/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE66606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE66606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=SM7E3ag/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so7779445e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795704878; x=1796309678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rlNHTb2A+Df4Ai4PVth3K4qeSMAoWDzm/JvQFvKYsXg=;
        b=SM7E3ag/3x127cFqc7DpKUc9ADbIquT3KF97GfD16f8xWT1uVpjkUsyUS7EJDgQe+a
         eYv9+umM2fBqZqPdYRz3zqwTbA9LzTEyDNZkpFYI5JwvJLgjSv3lpWI2E4zKLT2SPcWQ
         4ZXN8tGIALusmbGXS3V2ZRRR5Ubt/VPtub0vbsaxDO5HOrpoZFHPakKgkL/ixM3ZAPTk
         do1OzRAXk3Ljzre0oXRu2i4dOSgXB1cl6UxZbcNu4Qb4z3ZdBJaIolXpzLfLjuhb3XKd
         d6S1svNMwqVs4w776PmvDSRRmUtlaBtJKCAMxFKWLEkTkggXRqIq5/9JOnFzs2GK9+Nm
         QmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704878; x=1796309678;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlNHTb2A+Df4Ai4PVth3K4qeSMAoWDzm/JvQFvKYsXg=;
        b=XmUUOV/RLwZB55KR+TR71VIfiFBy8rfqs6h88VYwablN9Qeaup21knC/OC4Vrsr/rL
         sGCafhqwPljSPDQNZPvLz+UBBg0HrQ044QaZXRMY7nd3AY7ydsN4cSn1GCiYQGPJXNZe
         BuKeCZRAbaJZWlOYrC7EUmt8wNlo9KG917ZspB5FxILpFDfmgx3JAt+99naDf8whIwJL
         x8O7nepWGbian92kbhrGeFE3ynr+5Ghy8cNwGFqXypWiiosdIPhjpx6mWpdEMV243k4c
         10buMU89Ac0gpjmSvYtqHKfs+wM4nc0/esmW0AnD5Sx/oA7eDp3hVgRSI+2KIPMBTUAZ
         rWiA==
X-Forwarded-Encrypted: i=1; AL+hErEOCd/4rNj4wEJTaH4ZQx5ax7UxCZ7f7mVQLmuvqkdaV2NY9Of+wyP/OakvO5m8QOHIjWdayus=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SvDaMYOMh0PG4GdR51Qxmy9RK3C5CtF+uZUzV4ikmCRhmfCm4
	IkiiWvua+d30C/DYwf9vT8+l1+Q6bBjOqy58yBB3LCRFtUZa7FTWbVpbBJXcdiYBC/o=
X-Gm-Gg: AZFdTZd7lmfVYs9lMOrGA4Wo1UVaVvFl20rBKWN1vae1bLbBKY/nJr1JuW4eG9Q0ZKa
	n5M9oWktLtL9cPIkC40E9L1CrQfZcZcGNM70QnabI3fD+s1Wcm3H/e7SYi9zVUD5aXvm/j5yABj
	mE9gn+gSY/WJt5mzGOrFBKK5OXEMWY+IGei76DGvZDcYROaPKyCQSWjBBR8y66hBbSHSxD6ZBPI
	maQ63v4aQe0DKGKqiCyRjid843EmSJlQ3PRy+mr2ibtauvibFZ9RgQKwgsw+lLjv1P89CxpTIZT
	vS3n1xRBDTESbcefjgwALLlM+dvHgu8u9d9IkLWAKRrY+Ro9Ky0iXCsBa98MRS7iPeJqgf4bU7p
	ucYFW+cROJchyTHgkpiAJny1Ry4Igffdj05JvxiDineLQiS9/Stt9VjMhX70TAv1GOFrz0SdqLJ
	01Q01GIbTtiHsjVsLtAhMiTTY1v04pPGjSaT/sACY7xwErA4UDXHs/kBggI4XokPDEwylh3NJbA
	oR26rzYfhsRiyFq/1YivMyEheFDx/vYxLqtgWpQVkgvC1w1yJ2cNN27ogHZAhl2eWUmZ5RqhwNU
	POxgEdQvUnEt1MB/0/9Js/9RlW98gzn7T4BLumkjhCdCTNdRVO71OBooLH+HjsLW8RF0AH/s7eu
	2cqzTqg==
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr398806885e9.0.1795704877858;
        Thu, 26 Nov 2026 06:54:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356519055e9.1.2026.11.26.06.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:54:37 -0800 (PST)
Message-ID: <f707be46-5332-4196-a9e0-5e6fb5ae8353@6wind.com>
Date: Thu, 26 Nov 2026 15:54:36 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH ipsec] xfrm: advance the route generation when policies
 are removed
To: Ralf Lici <ralf@mandelbit.com>, netdev-bot+sinfo@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261126111516.317545-1-ralf@mandelbit.com>
 <179569192472.3294.16207945676550617931@kernel.org>
 <20261126113216.337964-1-ralf@mandelbit.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261126113216.337964-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 26/11/2026 à 12:32, Ralf Lici a écrit :> On Thu, 26 Nov 2026 11:18:44 +0000,
netdev-bot+sinfo@kernel.org wrote:
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>  - Whether the issue was actually triggered, or is only theoretical
>>    (e.g. found by LLM and not proven at runtime). If it was triggered
>>    please include the symptoms, like the stack trace or kernel messages.
>>
> 
> Yes, the policy removal cases were triggered at runtime, in a VM test
> setup (not observed in production AFAIK).
> 
> There is no kernel message, the symptom is plaintext on the wire. A
> connected UDP socket keeps sending unencrypted datagrams after the allow
> policy that exempted its flow is removed, although the ESP policy below
> it now matches.
> 
> This is roughly the setup, in a netns with a veth pair (IPv4 is the
> same):
> 
>   ip xfrm state add src fd00::1 dst fd01::2 proto esp spi 0x1001 \
>   	reqid 1 mode transport aead 'rfc4106(gcm(aes))' <key> 128
>   ip xfrm policy add src fd00::1 dst fd01::2 dir out priority 100 \
> 	tmpl src fd00::1 dst fd01::2 proto esp reqid 1 mode transport
>   ip xfrm policy add src fd00::1 dst fd01::2 proto udp dport 5002 \
> 	dir out priority 10 action allow
> 
> A UDP socket connected to [fd01::2]:5002 sends one datagram, the allow
> policy is removed, then the socket sends 10 more, captured on the veth:
> 
>   removal               net-next             ipsec + this patch
>   delete by selector    10 plain, 0 ESP      0 plain, 10 ESP
>   delete by index       10 plain, 0 ESP      0 plain, 10 ESP
>   hard time expiry      10 plain, 0 ESP      0 plain, 10 ESP
>   flush                 10 plain             nothing sent
> 
> The flush case replaces the ESP policy with "ip xfrm policy setdefault
> out block", so that nothing may be sent once the policies are flushed.
> 
> The xfrm_policy_insert ordering is a race between the insert and a
> concurrent lookup, found by code reading. That I did not reproduce at
> runtime.
> 
> I can share the reproducer script if useful.
Maybe adding a selftest would be useful.

Regards,
Nicolas
