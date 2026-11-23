Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455069;
	b=TZSJP5bix1Bk4Xxde+eu+hrA7ECUX+vCXOfHSSO5tCtWVsBdFE34FAPzKVNGMRzOLMGC
	 CJTpWEy20+S3uPgOUXCaGYaHsRuCQuv0CYdXoQIap/JreS8nmpYTCq2/Mbf/tkRTNVzIN
	 80Drr+7lMhiThhLKPzTYUvLZ/L8DGz33qyVEblk1Wn8w/T2tYp5LPQSzJnoS6oglCku/p
	 1x2WjkTXVQJrClkyvjBBfz8juEAdMsHW1e0Rs+8UevE/7Rtsdu9qPc1pHPkogR9l0ld7k
	 382MhQ7UBvMorv92H6l+A9gQxBzGJYpmtYXwojBXMv3b5SC5cnXbNMrfl0NCbrk+E4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=X9GAI3PWwgqP3MBUWJ+MFm+Lmw2cWqs8k/3uAwuoygQ=;
	b=0PP8/ZGMv0uR965a2YNPXOgLaQDGNSgSPgioj5b2oRAAXxlrq2MMxJjH5KDvKIHYz0W7
	 gqBgyOqLXIZfRCGFzbn7aO6xg0zqsH8A9t5iswgCuPG0KVZBQl3EarzzvpvHWJTpGLZ03
	 EfPbvW08dcG+C2dZZohvV543beRj5vjx0DPYLvJ5+NVXpaWLNK0Uy9WXJJd8K+/iXMuGm
	 Wx3eHRkA9xDu0zBOO5K8QRswMWv/VZDV3OENF6zZ6a9Jm8eHRggWIB8TLb5aOb7h28RR1
	 8/U9IZjqal+KOR9MxBC/ECuZ0rbgtoX6Q7ZhP2TQaDCPf5L6CETP6+8arndhgqazuow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIGtZ15a;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12066606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12066606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIGtZ15a
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so1398059eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455068; x=1796059868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9GAI3PWwgqP3MBUWJ+MFm+Lmw2cWqs8k/3uAwuoygQ=;
        b=lIGtZ15azrt4qYlEopxp2nowRuC0dAMXc++7k940kxJYTV5IPFjkK0xsFd04w1np6L
         cm/0y0xa4Tmz4jZiTdGNo16/kHNwzhZLayj7r2sJSKs6rooMFn4Qeg6+HPmwPf7xTbx3
         Nq9uNMzHtS9koWAgfcwOWJJBKoXPH7sKfCWM0gWKycNKd8Tx4XI8uBtc1WdVHgi6BlXe
         DDDYUvfrIF0ROppAmubDZW6QqZfbIhm7k1DquaPkHC0WHurlYQ7mNaPxZCDvWbeeWxj7
         tqVV2pvqnLtPYliCCvl2WyggHM1o8MMK64UW5u2gBFQ9sGx1v6CMNsa5rAKida5RG/Dr
         tx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455068; x=1796059868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9GAI3PWwgqP3MBUWJ+MFm+Lmw2cWqs8k/3uAwuoygQ=;
        b=ylYYkh+3ks8LC4Db77cKJua4UOO3zM1BegmWeyHeqYUTUz49d/r+CKdLOpBboum+Pk
         1z6RgBUoRnu+0Qu327G5d5hflJ1yOr19PGIoSozWocNOB5lgIjIhJ8wdvWWEyhUtrrUi
         t8Ji20o5esFy4wGtn12iImywb7EU05Zl2HT/dPH+ejqTf7AGCyt4WdkO/M5NFp1aYTZW
         BOPfgBsD2UQ57RSWVaLRR7Ap0DCSXWwOWQOZ10gDGhzvUfk7BcziT4mpxj78SWHipmzX
         CeaNhjdXE5RzIa9PhcAldlN411jw/zkhNhobvNTVOWIiq3ExocYEqPMPokOg75l93sgQ
         MUHw==
X-Gm-Message-State: APuU4Z8XfovcgAdOlQ0koRJ0UaiqFU+R8vfwPix4TSjnIq2N4s+ZRvlk
	8TaAPrEBJPvr7D49d9lSUP6N6/8fLxPiXR0m3+Yjjh3zY96omD/Z/48c
X-Gm-Gg: AZFdTZeYZjppi/QR/p04Kyd/yMWQXJGxOuZzsUfqVLh/GAr1YHVpdzkdFqqKZLqzlNY
	f0jNtdrDzf0D7s4hBh2dSHBkZhh/z8hfV753Rn2fR8aBJObt6mX5a4JViRPxZ4lX8sjSbCiSG5U
	btXEf+LZWugRkEfK95VMDTumTkgRSJoc4w0w3XcQlBIBxiO7DFQN+xfbY2U/PziLn79Tqii6ZYH
	cMJ4s6LKZ3rTL2swHJ6Fqot1145lfh3E+//op3K3t0xp9zZikt0rsOKaUmzCkLy4q23fztzwK2y
	OCeuRi/ajbLUmg5Ya3wNu3cu0YvhYfcrWLCayxNnqGbCXklg1UrZw3WEJA3mJm6zTrTs5FlC2nb
	pyxv3y2ZR8/7/DdGRqZm/7yUrSnBGsWaQhVzNoIeqrAWQUYRrVfQk1uU+xx18LovQm9xzRpY7Lh
	3FM48Sov1pYpKwEZYj9B4wI/oQYAyZmsfNKzvw6mvpq12LdMb38MR93nnyzhJA4qnTWOWkU3kj8
	m15xkyDsD71QroGmtF+fUVfeZa2tYSEGdJFS9Ap8g8ZTyAOdD7ou26dx/JmfZHyEoDtvKnfbGyr
	E9kjOsGdvjuipUHAwwk8Kfs=
X-Received: by 2002:a05:7301:1703:b0:386:319b:fb0f with SMTP id 5a478bee46e88-386319bfc98mr11289084eec.38.1795455067852;
        Mon, 23 Nov 2026 09:31:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm33480358eec.8.2026.11.23.09.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:31:07 -0800 (PST)
Date: Mon, 23 Nov 2026 09:29:15 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/7] tcp: fix unreadable net_iov handling in
 tcp_clone_payload()
Message-ID: <awR3694L+GwPPxMC@devvm16445.scu0.facebook.com>
References: <20261120201408.3445445-1-almasrymina@google.com>
 <20261120201408.3445445-4-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120201408.3445445-4-almasrymina@google.com>

On 11/20, Mina Almasry wrote:
> tcp_clone_payload() clones fragments from the TCP write queue into an
> MTU probe skb, but does not propagate skb->unreadable and compares
> adjacent fragments using skb_frag_page(). On devmem TX skbs backed by
> unreadable net_iovs, skb_frag_page() returns NULL for every fragment,
> causing distinct net_iovs with contiguous offsets to compare equal as
> NULL == NULL and be merged incorrectly, while leaving to->unreadable
> clear on the resulting probe skb.
> 
> Propagate skb->unreadable to the probe skb and compare fragments via
> skb_frag_netmem().
> 
> This issue is theoretical and was found by manual code inspection and
> LLM review; it was not triggered in production. Verified with the
> net_core KUnit test suite; not tested on real hardware.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
