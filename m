Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426862;
	b=FJC9nvJZwyeO5bZaAxr0p14wmj8+0tQ+2+7ZpSeQ7j6a2Cf4lJ5bc+UEZI8gLS0dEvcK
	 n9zQQLieyktAElG9BHu4vujSkjb35TiOJejvH4zjC+rCCs2FLnbSm47FKUbX46vJNTbvp
	 404zEV9WAhRDsT7HtHlNQj3gn1TGJ9McJ/IUlsMPSVgnvAUmwE4B7WxNgIC/ZtOeR/0EI
	 tV1YzJmAeZrKxqMkKY2kTi6ZzK1Jydn8FZ4jdhYnSNWYwasvN9A153/f8eGBr8+xqboHH
	 IxOWTP1XsbtC+VY0N4+Ryr+UWxh4nGAO4nsI7ZRFqTG6gWOFiKvwvsZHwsHRcM3tuXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QVGOvGqgP3IqKLf2mJCZsL1j4ZVbv+zPgvIcG957g+Y=;
	b=XMxt7TYAvpI1beT8PHX5peDL5ZWrppaA5uanL201cXcesJvBHHC/ZVtQGjdJAaijNaiq
	 pYdt+VYOqAjCBYinMxCcczlSqJTFYSeICB5QEbyYW+kaTl4gKkG4qfTWe7757Z2V6zQha
	 Yd7msoXvyp4qjFhfckvtnS+m+xwMov4dhMkYT5Xq2AZCSwFnigy8eX97Ft/Y6cN++PsoV
	 ygvQ977kf84WIf0NdvBwv92Y5vsStBSRMh5XL3sFKI8RvrOTP+7xans/wlaP2ZYRPthCp
	 Cya3oZT5Gmps4lLLbo/xpMW35QVgZuAdkCQ5DDYpHnUmp5M9OIRaYQxACxNy2R+jQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=PU6niAqs;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40D606A330
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED40D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=PU6niAqs
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2316818f8f.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795426860; x=1796031660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVGOvGqgP3IqKLf2mJCZsL1j4ZVbv+zPgvIcG957g+Y=;
        b=PU6niAqsIUvfaWjY/71t6CCcBFF7/W01kwVAvtvkTQKM/0Yn80oh/fgIJav7KH/XZw
         SZUJk92uBcDFCe8mdyG8R4ZhJ/P2x6FOliPvNQYrcOx9dtX7pNE5hwJWYvslYUz80O4d
         4ACwLaEXUgT4KKXZVXpnOV2c9kRezA7kIGPdMQM+A/+UE5qyObBnCyBAENN+ZJtDIAwV
         7VkYpQU2qitiLpsU9HKFD+i352qCrr9UuuBYf3Q/HoQPRe/P+QMplGt0jkZgKP64PUva
         iXqTyd1ZMGbBtKbXB2/K+auE6jLPeTYk6oGbmtgDRB0YiGOit28UQKrQmZucgHYuPTGu
         C4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426860; x=1796031660;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVGOvGqgP3IqKLf2mJCZsL1j4ZVbv+zPgvIcG957g+Y=;
        b=cra/IG6KeE9kBX2c6jIhXPPWOtNhrj42BNc08lzJshiEzxdLh6kL9SpzcOx0XxICOc
         9or4NmzHj+yPycIYiqSOF7Xz7bBXql31xh5B+5KSCX03jh8roSVSToGTCTVe9NrK3b8i
         /NufznYiWJy8Lb4nM0mleZVJRxlrmr9ILBeEmm3rDWt8Ji7WElLbcTo/bPYk6C/1rBap
         iF4rn1YFMUO154w3fFxz7IdDV4V3ISn/jaC7PhqBQZ4A/tS57tNQQVePdX6PUm1QhBCV
         29wmPHXC5a8CzzcxWiW7xZHhi85nvlQJRb7R5+qOO7SYHdiMq3wvEe4904vCQ7NbT8Rr
         PRsQ==
X-Forwarded-Encrypted: i=1; AL+hErH6Ecq7uXOFUFDd/fOrIkEX66EzcXxfociNN84d3X4ADUhFZ9ddOEfeGGWCN9lh+Gozq9WYYcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SIuzEFdprEHIXrlBQk0v/8tDoiyVZtYHVg2CmUZMb3K8+isLs
	RCAiuDFYBOc5GwqOpPzTBKiLUj2rmje3VsyNF9oif9ILDMfkqrl70VJ6XrF4dj1hd00=
X-Gm-Gg: AZFdTZdoX12Ng2jnUbBrvf/Zk1PBp1HflcFoF1AhHyXH6Vt1sKvHcksCnCkdDAH5wTd
	2CquEJONG7KMJb6dU3IOsEFRzh/wV9tYg7d7F3oz9ibkJc/kDQoUQCDuyIGY1h4cgOfuF85b/Oh
	eL6Lrv1eblM1cLZ5svjgkDUT7j55Fxr6pAguCkZm6T8m+UfZ6aNrZL6hAnhJYxk9aWJZqrTSH0I
	ydw7yZj5v4qyf+HeMNH5jsaJG86RoS2c36Qp8Gw1s+zGdFHYbrUJdCuypwjBt00mfVl7c61RlcZ
	M5u0bS2XTJK/hyaw2bcawGNpwqgzNfZr7OjUNa1yZ1kCmM+JcryCrEEMIwUkleSIfllDqlPTZq/
	uyKety54Q8fVylkA4PaTsaShZrJZK3oim92fALb9x1nM8N4hOjIarlSTJxWoIiYp0fuUb2DX4JM
	6QHT/Di/LwJ6sZyg8DiZc2rHJt1yNdCIWJvkX7LDn4NVHcIJF3HmrJ2g9v6ukfS+JZ4hZWrQlBl
	Prjg6Bzvderp7G7J2bRqq6Jp343n7sMqROPchbeS1fPhR6DKZ5sQGGnoTwBSHl1wSQT8bgHWCnx
	vzC/F2MkW9OQmCTsnBLe/kXJUHap2qr3PfiQAOhGUM1TiISxEIeUq2jv2c4e
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id ffacd0b85a97d-4abb2dda518mr20901962f8f.29.1795426860310;
        Mon, 23 Nov 2026 01:41:00 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm21919575f8f.39.2026.11.23.01.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:40:59 -0800 (PST)
Message-ID: <e3ca53b3-2b57-4927-b93a-91c8458f7ccb@blackwall.org>
Date: Mon, 23 Nov 2026 11:40:58 +0200
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
Subject: Re: [PATCH bpf 0/2] bpf, net: fix assigned socket mismatches
Content-Language: en-US, bg
To: bpf@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org
References: <20261123084138.723275-1-razor@blackwall.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261123084138.723275-1-razor@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 10:41, Nikolay Aleksandrov wrote:
> Hi,
> Patch 01 fixes various mismatches (protocol, netns etc) that can happen
> with assigned sockets which can lead to different corruptions. Patch 02
> exercises such mismatches for IPv4 and IPv6. For more information please
> check the commit messages. The problem was found during LLM review of
> the sk assign egress patch-set.
> 
> Cheers,
>   Nik
> 
> CC: David S. Miller <davem@davemloft.net>
> CC: Eric Dumazet <edumazet@kernel.org>
> CC: Jakub Kicinski <kuba@kernel.org>
> CC: Paolo Abeni <pabeni@redhat.com>
> CC: Simon Horman <horms@kernel.org>
> CC: Kuniyuki Iwashima <kuniyu@google.com>
> CC: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> CC: Martin KaFai Lau <kafai@fb.com>
> CC: Alexei Starovoitov <ast@kernel.org>
> CC: Daniel Borkmann <daniel@iogearbox.net>
> CC: John Fastabend <john.fastabend@gmail.com>
> CC: netdev@vger.kernel.org
> 
> Nikolay Aleksandrov (2):
>    bpf, net: validate assigned socket on receive
>    selftests/bpf: Test assigning a TCP listener to a UDP datagram
> 
>   include/net/inet6_hashtables.h                | 33 ++++++++++++-----
>   include/net/inet_hashtables.h                 | 34 +++++++++++++-----
>   include/net/inet_sock.h                       |  2 ++
>   net/ipv4/inet_hashtables.c                    | 13 +++++++
>   net/ipv4/udp.c                                |  2 +-
>   net/ipv6/udp.c                                |  2 +-
>   .../selftests/bpf/prog_tests/sk_assign.c      | 36 +++++++++++++++++++
>   .../selftests/bpf/progs/test_sk_assign.c      |  2 +-
>   8 files changed, 105 insertions(+), 19 deletions(-)
> 

Sashiko found a few more mismatch cases that can happen, I will address them
in v2.

Thanks,
  Nik

---
pw-bot: cr
