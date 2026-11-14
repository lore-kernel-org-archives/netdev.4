Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636892;
	b=RTYF4UoqfWzryOkSN8R1P69UNt0QSItJHrHGynp0cBSFgSbZOjVN850YGIgYXhlrbVN5
	 x98I9HAG/orAsmvuOnDecNyPa5fDjx8E0ilYK2Sp3qQ21TOb0bSaSuWspcGnrk0QqvzXy
	 k0yw6Uk/+fvPblufh2kPR1Yszi3ogkwJUHomU3vX5F6HeNWYNWDC0HNfDiZcb7lzaZpTI
	 xe8pw+4Nlw9/Mpa5sQI3gBVOnAXiyQezOo8e5P5sS4GEU7Yuo7Z4qcNHcRavsDoeXcxOz
	 3oZ3NcWUgVz8fwtnxm0+wHn3PbmIbR/bUab8sX48JM/OBCepojtYCAhMkSQ9poxEEyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
	b=ICR9Lr/3rg8cWpZWH1YQsWIa3IST8XCD8rQ6UAbVokt1WNA+3XVXH3i7FreK+b1jRxWr
	 p/GJBxVVdREb0MFYQGssIVLsh1V/+HHOZ1ZjwSqFHhGADJJJ1XyH4TQQwpKk2rJuq1gXd
	 bmaKTezlcDkoTuz72vb1J/IKF75KV7jmTh4kSsdypphvO1RmKc4JQL96Lf3VB1KF9cjDV
	 CzryEckzX2yhHsLCm+RMmjsGv9gVtQ47uQmhEiYBL9kASz7mNZH+uDCMZU12+/6Wlq76P
	 HqeYn8T+fSiCIF9vOL3fqgWKr2v2WoytIEJEbsIhnB6R+nLlBVlnbMje89Qt2+Rq1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAXItUB6;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEAB606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEAB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAXItUB6
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so2384921b3a.3
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 22:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794636891; x=1795241691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
        b=AAXItUB6nLo8Ld8relHkMakJMmcuRNIsknoR4+BEM4pSV8B6NMLHbLLbDWU9hi9tNb
         jgdzHxKTj5/DbNttUCWS/1H0D+IQKlezeFugNBvN4aDY/BrH5cd7Frj3L9D7yB0ULnfJ
         OR9HjF4GH6UYfG8ZUTCfjJwfE0Cql/Wisd9i4Ndx1F/bQqjp5kwVkKvYFV6WZ++sB7LR
         NTbv6uW33BsKh6oOwCVC9D2uSV3X851/fTC7Q0G0wly/pQF/ZlmUp+qZy9Q0qh/OpQ7C
         28IB8ztcs5lZfX3WXcO/lhJIl1bE3fnuMYrEiVXQDSWtzek+YrI2BeCzD44YzcKvERsG
         ++nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636891; x=1795241691;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
        b=ejW+M+nckeSR8fEBxh+X0Qz7CCrwdjBczKmgIdX6Xpl/93OzXKk+aVi3p29KqAPsIT
         4S6J4KuwSNHR9Wo0YjQXzD/TgHjAB3NjPTBpopmGK50zIYmRwwwPuwTc9x7bXGltz4Fe
         RATvZaqYF25JBLKljso8vae/YFmT60pIYlCgD6MhYHecrRBbu919eTbban8KcGt5QV/D
         uzCSGRmNFHpCQPb9DJWRgeVd3sAL5vorh0+P936amgi5fBUOgszOaGFmdip6/94LKLEF
         V9LgafvXbKrwlbKyhjZxYkXBmEeSNKM+nh4bXfTNNY64tRN8QtTsgXleSpalqSNSZRHC
         QfTA==
X-Forwarded-Encrypted: i=1; AL+hErErWe4ZqqNldvFk2Pm1dC+t3fgppafeihca0dGeVInh8hgQIKc6b4xaO3FTENqx9ancMCuXzDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i0dJImslz6IBRDKBkH5e/Wzva5hxtyaXsxT1nh/NaRVgme9i/
	PY9BG9nOHJDvW4EWMUAPuYe/MKT/++uUO1S1WHIXQkuCYcQ67rCS8k4x6ROdBpUT76tVcV8orXG
	XwJnAtQ==
X-Received: from pgij8.prod.google.com ([2002:a05:6a02:8408:b0:cd3:da0f:7741])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:888e:b0:3e2:7bc3:9bde
 with SMTP id adf61e73a8af0-3f7a83b8ec2mr4021901637.59.1794636890522; Fri, 13
 Nov 2026 22:14:50 -0800 (PST)
Date: Sat, 14 Nov 2026 06:14:50 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
Message-ID: <avf70FWg6nSW1zhX@google.com>
Subject: Re: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:56 +0800, Yongjian Wang wrote:
> Check that a passive connection starts at tcp_base_mss with
> net.ipv4.tcp_mtu_probing=2, as an active connection does.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Somehow this series didn't reach my gmail inbox.
