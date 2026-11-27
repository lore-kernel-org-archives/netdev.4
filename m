Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796738;
	b=3zzADk3aG035e6p0L2kupe63dVZ60Gz5EhyxywI0wtYh+JTHj4n7QW0NE6msSRALkln+
	 9q00B3wVwCZzageuhCIeFjUr+jFmFBowBYiH0EssvifNsPICdzQ5dvg4wpz6qR+/uyIoG
	 YypYgeUvSPv+hWfo2I32C60IeonPsmb/M4JEZbz7XcNR3iUGgGsazgumOUiNoq12bcoDK
	 wnR72j10Q6aasoMjGbrKv/BLiNENbOSf03PUPdJWZ7eWHuHDjBPo72yLIG/Llou/QHRNA
	 xCig83sCmRMZdZJ+NReR6xG0cFfizQ+RkJZofNywEtGJU2q0RKqkT2cEvIaC9HX5QzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EIXXOs0aXC7vNxcQ9zRI2FEBU0lGPwo0Ap3vjJpAfWk=;
	b=0SlqKu474kcaPWORl742YHFHaS2rP7CpW/hUeWBl3YWIJmb43DlNuQ1eHkASVjM/4KCH
	 Ul8pHyBw+845UaMJu7rjKmig1WOrxdaAaW7y9RjMQFFAXtifN1FRuXT9FEZCA3yM+D3is
	 rfhR9ltEUR9lsYL2iJCbsR8PHz0WmlIeBTcDZWICGu1HHkLo8Ee7dWF76ofPZCO+k4fMM
	 OvWPVtddNOAw0aTBCwauOtlD0Gj8L6uLCtdzT9tztEzwmT4pWACZFNldwidJOOiV8j+Q5
	 zCiMQ85YHBt6jpQts9wqed2mWKusGjAHTIISXyqvJUt9OSowYlk02M8mSGntyjq/iKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=CRsNHokk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C5606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=CRsNHokk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6756bb1cso5379705e9.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795796736; x=1796401536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EIXXOs0aXC7vNxcQ9zRI2FEBU0lGPwo0Ap3vjJpAfWk=;
        b=CRsNHokkMkackj0u/CvF0dv+hq/DvG+3pIpa8uJ/rsvwVx2cQ1xK0I8NMrdb0caq33
         hSY03/3H5ugsdd5TU5a1q4cVEe7lYh3assKC1KF7BFPp6irhkBC9JOBP4I8DiNVCCn+K
         BHp7je+vp2AS+9hCSmSZI7wJidginq51MUtg7KXbY3jL8Nl/Nl+xRApVkMUpDIHn6PHO
         C4txnQMwt2MQIALQC2flnmQ0jvA/WkloOmfKkVrIEPRsYF1Cz07rkwXRu5qS5HZmi/My
         Tjp2H7DZO0+POAWH8zeFeI2CjEk694916tE4+t+d1wqiDHh5iOyOzpUMmGA0s23zkABu
         ni9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796736; x=1796401536;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EIXXOs0aXC7vNxcQ9zRI2FEBU0lGPwo0Ap3vjJpAfWk=;
        b=DcnR8j0KGt76nue7D/ZxwCWAiQix9+X+k4F9OptJZvQtWGYpJT6CCWR4TYEYVim8iQ
         PnJjoCyL0E/kfL+O1F30dbf1pZE/8nMN61HHkPBRCPkpM9ebk12lblHYnGMHxozNqoYn
         ApEBCm6r+0KL2xXj1YP1mtCLl5rePfsMc4MyU+i/QgWVZ5zXBnLxj2mC0zX/Frd2lNPa
         ZlBwH9UKUh4DhBDTUKFfgs8spLZvVNWZq45zM3RwfKIk+JPhegu98bBXOpNo1KNUIipw
         D6qSyR2PQ846LuWLUOjE//KzfIbAT9SwLMsjGjTVQB1NBGqJKqNl49epBCuM9SGiOgEt
         eHLg==
X-Forwarded-Encrypted: i=1; AL+hErFRLYmo3cJBTPe1XIOSnrgzVZwf0Nbyb9hUKHOTI2rwNxB5qpVG35FHcWLrD4cJbnkmgoBiJ1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u/VZrOXEegJkyRKAFgA2XEufMXC5czNTsJcBiSWJPdcpFiqVO
	D4voJViOB7ks4RAFDuZQcGUOsX3YSLQ/ldNHAw+5VYfcVy0Zbisy/snSpuVLup7FnnY=
X-Gm-Gg: AZFdTZd/Aof7dfpW5oDwtmvI/AiOtFyRcvjhWWf1esW45tQT9xsbFM/mFyMP2/NQy8J
	Y7Rwss0wbE/xuBITJe3FHiT6UhuJVSTfrwcyvjaUUte0U0HLsku+w1H8wIdb/IxJf4YNrs4r93t
	PWacuqHVsgLuSs2VL6QdaOkhuUG4Ri2LYaSUmlpJ+VjYXo/3oCP7rzbHyF4gJYSIHblJcjer+7S
	7xOKsUuEU/euiC2MPK26L3TwFlYV6OkeOK06AxLATP5YGR4nc1O6TxnLpsGnzcQoEoKLk/SLPFj
	Tu+Vk3nebQRmEaIVTO5Un7112b+Ag42JMlOGoUIrqDuECJxRrzsMdLAVumUzXH7vJ1PtFTgy+rv
	OUlhqZ3sU1DbXM7Rvo9h5zf/dCIMNRgttmeuG8ENmnOlPzllXXldjDxl9YR6jc5Z9m2lcpNOOI1
	dMFh4Oq3DI1YQ6DGH2k4tn+VfztTlA6iFlU8SSSG4WV5mDIpisIBSZw2MEeKNJt/r1HNovOgFaX
	pLC3pKWqL3HnBkv1xAhzghY4bHj9f0vjcZZPP8d0JvgdfMlHeY59KrTngBjoMS4AMLIKwbIAOMq
	2eRjyIAj6tVVo4rKiKrzmzK3IppS4+m92oJPHDxiFWMwXQEWah1XEV3VYeZVmU1Vkw6fyeqp3uW
	hh1rNpPNc8YV9RyS/qRsA763+KHQ=
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb887f55c1mr455686895e9.2.1795796735914;
        Fri, 27 Nov 2026 08:25:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm719577975e9.7.2026.11.27.08.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:25:35 -0800 (PST)
Message-ID: <ad7b2465-6e15-42d5-bbb4-ea96e4f2f009@6wind.com>
Date: Fri, 27 Nov 2026 17:25:34 +0100
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
Subject: Re: [PATCH net] pppox: only wait for a grace period for lockless
 receive paths
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Chapman <jchapman@katalix.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 stable@vger.kernel.org
References: <20261127152822.2098330-1-nicolas.dichtel@6wind.com>
 <78e175b3-7f97-422a-928a-a05616f9c445@linux.dev>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <78e175b3-7f97-422a-928a-a05616f9c445@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 27/11/2026 à 17:08, Qingfang Deng a écrit :[snip]
> I'm going to remove the serializing __sk_receive_skb() from PPPoE, then this
> issue will resurface.
> 
> Please consider either using the non-blocking call_rcu(), or just dropping all
> the skbs in the receive queue.
Thanks for your quick answer.
If dropping all the skbs in the receive queue is acceptable, I will proceed this
way.

Regards,
Nicolas
