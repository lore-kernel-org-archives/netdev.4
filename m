Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674203;
	b=4rh3l5nANdXx04IdkaKlH4y2MBWrnC+Hg987kgETLryDuocTGgMBsby9W02LjeKNi/1K
	 VtgkkHoZTOAFN3SOahg1xg1tf/i6M380PvvmRfHo7j9/1MgoubRLjzMYH+7E6L1Vgujs3
	 eW0p9scTyhMHQbS+RuaDaVTFgkNByYPHZiOf52TZWWfI3vSgFxVax7GYsyqTho1aH1N4y
	 6cOSaZUXa7eeUwF7fmPwAIbORibCyNs+rTbdaduFAhDI0NbOtySv9L4RlapNDHCeXbcVw
	 O3A6NRZ6HPPUm4Ss97t+TcCFn/wrtXCyLrdQa3mp8T3Z9pIU2XnbaNGoFJ7ntZK4O7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XsKYZWBUqofSTIDrca0vD2lKcD6oiyN71s71SKHOBNA=;
	b=pUmFJayab5OJ+dl1E10XLQnhJzkqW0qM8y/LQ9C0gojPlr62T5RSxfKtuMs0Gdgg516v
	 bk9talsJaVCqF0+Nny9tEYkEzRhbS8U8avbE36TbZ4SQgEJJw81Q2egOsU5dYFvAxEx6H
	 TLdVzCNIut//BlQq4EgZwQ6tyC57RqEYcwGU8Ja+a3xtdjgoE/nTggEvPx5ybqiwLZg1M
	 HRmlxj0m1cKEsG1oJqTE+EsZPyUyFktrhiekRDyXppM/rPwhJhNH2CZbw5dFcbJlKoZhQ
	 xyuzaTOHUjGceLlmmPbVEAnK7lPvKEHUT/5aNzyBN8+GHEKhWDr8UKbblsVtWblhOjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j5AbVDcB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7B606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A7B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j5AbVDcB
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so2567519c88.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:36:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674202; cv=none;
        d=google.com; s=arc-20260327;
        b=c4gMrOrq/91aT8jsOazurfX26oY6YN3M7C4AassC8rivN6RIkCce4HQT3MPi0acnIh
         xDAvApDxsVKOXwybfJJ5a4kglsArfji0Dx8G6mcYDK4+TGW/srDJBEm4FvWN0ka+yieU
         Q4m/y6gVsGXaOWnUuDQD/jCC3KsWK/aTglSw26+Z8DUy3ZWN2bVYjzk8+s5X7JTrX40v
         mnE0w1aUdZRpmSWVeBxnTQKvTDIUCLxUvQv4uPTVLmXKNZ9+VWI0Wd5wSTVK2pGbS6sU
         Nnvmwz4zGlzKgjKmtWV9N2a0IPC3BXIAtofqVfHroga0hvYgMiDfEV3JEzp0/pD7mU6k
         8jRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XsKYZWBUqofSTIDrca0vD2lKcD6oiyN71s71SKHOBNA=;
        fh=KANUJGIe1LlmDbARbU822iNmiI98ai0O0u1TRCuah5Q=;
        b=SnfuKqmId9nRlMrn0iJc94IXDwFZXyTaXdySiu+DbBRlCIuWqLhKxZjusQhAmMTcem
         nhXZ+WEx3qVZ18xVPwBf+FhrJlFiO/1kblU96gjLFV2Zd6VTusQee/l88wQ9w7+vtb4s
         X7/w1JaWaIltZ/mBX5OGCv4AX7ygYtmfEdFXz5Ja9foPlRX1QMDfPt4pLg4W73PujWBX
         dcpEjEF/gYr32J3mcNSkLlYcv9h5EO7rEo50dKHHkbYU+FQ6c4XjvemrccIBHtLsbezo
         7tznVkDs4q2bDkSF2A81WSTmRUnmhrXgpBCe5pljXnXkVIq8WBSZLr5JhAPRhYyTvB8V
         tYUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674202; x=1795279002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsKYZWBUqofSTIDrca0vD2lKcD6oiyN71s71SKHOBNA=;
        b=j5AbVDcBXL04pxTFq860/vLOpp79nLbKBZBAHGWfzwR8+kRpXAIdaIJ5EvKUABdDM7
         m3y5HlOpqpROzOvA/AvoQJ4xCiMjd5L9X+Ewu5k2OpEm/VUf5hqFYrovq6GU0UdxpUQB
         smFT64oCrByf3x75JJBErvEeskCjZ7Uzdm/y5ExFqkf7MZhzIMzhUhKaqNyJzvv84wme
         y1dBNDP2SKvOd5Va90Elr1cOVQo9txbueRDYKeNkDZMeXu2R/tZHBgayeUQN7Mio1EoB
         lEsXD7pNchO/Z5eJlEG+Mw9rxnYwcEWLlPejmMZMPYbOpTS89Ex8ewWO/ZuyYqM5OYr4
         n39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674202; x=1795279002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsKYZWBUqofSTIDrca0vD2lKcD6oiyN71s71SKHOBNA=;
        b=VihQjDwNwc8yyzVD4CCl04+7CvHxLM7j4i7Otm3Fvbej4gqYucpPLWXzLig7DuwzbD
         xFNEFJbpxDJebXoeA9og1RZXJUCvuRwac6bSpP6pqdb5pPvoel4uZ2hUlWZO/QykY2lG
         15X7GJ/L9q7mk1M/fzNAXTXfjnfRXzjavvuMu/QjpLo81QobBXD5gEPG1ZgX3mEvNiNJ
         u0P7rkelhzNMcN/lS9nl0onRMb73cNQWKKNWW75NkUzWFHLxuMQw0X2LrgzSwgqjS8PU
         G3oKfOiFkwCjC6nz6nH4RiobvtvrL6RAhcA8SRJ1SxeDj6GMGusIGdBfLIrq24t/bKAE
         BkwQ==
X-Forwarded-Encrypted: i=1; AL+hErHJF4nGdfg7jWpFM5/0qZbZY94f6KvRfF3QjwPb+Ngh/44AEFtIas790lgnTnjm5tw9rFydIGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bL5WOHaTXFwmkhDGncR/W/wex2vedma0DNE/1flozaZAPD+7w
	E5PxENiySN/CQUQuAOe87zqzzTKb6JbOcJvZSZj58NewMqnC0TfLEPr0pbiECqF1tOArsT7tNmg
	wbai+P1lPR2DMRucAkAXmh9AdTm/dmATg4qJUFIyW
X-Gm-Gg: AYBFou2/vh/GhwfxSzMGCa6Cw3RErlg8ZK8OuIlcT0Lk9x2XtTWQ5qSa3MBpFGMc5fW
	9bugTgVZ+ThjsX3H8hNDLRDghgunR+LaeIdvqlVPV2yE19y7+MTSOnIft2QL3NpTwPdhG4RNJbM
	bb7MpqQwDsKe2xA6mt/JDtVscAQhUZfEMZ7llxzHG4+bydqLopOhx8UuS042iIwym9Ozhat1lPn
	Cc1e9zkz+xO7jEfPaM5YgURB+vmYGNDp2WbU5IJNQsKXEFHOICqzeAELNDR/a0JbcmSbdfQIKAp
	6gvlKz7vn34w8HrkB2hgo0p27f1xg5ANkRiewg0VaCnjpuKY+du8Gp20N9KsySc0jT1eIIYTyES
	i3bzf8lasAa/xVcSxgNh0jFhlUXYCEVeCNGUd7MOGrq0sj8qRxz2IP3ZslPbyrosHIz5Yp7i0Qt
	37YeBKyrxIAHTOsDIi8gYF8gtxTkV9FRQgctP91Qq90CIO8q2+vTF0dYoEcj6ngaF/fRCqMCKGq
	EgjhOWBvw==
X-Received: by 2002:a05:701b:20de:20b0:1a7:d426:6dd2 with SMTP id
 a92af1059eb24-1b50311a2efmr5468210c88.26.1794674201792; Sat, 14 Nov 2026
 08:36:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114155150.235743-1-edumazet@kernel.org> <20261114155150.235743-4-edumazet@kernel.org>
In-Reply-To: <20261114155150.235743-4-edumazet@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:36:30 -0800
X-Gm-Features: AclHuK-IBRqhlhb8YYd5d3mTWZycNhJuPJU-YUUGaHpi4Cwc-Kse2oJ1wyabbsA
Message-ID: <CAAVpQUADwEi485qb4_84V=OExk6DbkwhyFtyf0XoHuXSf0GXMA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/5] tcp: use SKB_DROP_REASON_SOCKET_RCVBUFF when
 over sk_rcvbuf
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:52=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> tcp_data_queue() and tcp_data_queue_ofo() use SKB_DROP_REASON_PROTO_MEM
> for all packets that can not be queued, whether the socket is over its
> receive buffer, or the protocol memory limits (tcp_mem) are reached.
>
> Make tcp_try_rmem_schedule() return a drop reason:
>
> - SKB_DROP_REASON_SOCKET_RCVBUFF when the socket is over sk_rcvbuf,
>   as already used by UDP and sock_queue_rcv_skb().
>
> - SKB_DROP_REASON_PROTO_MEM when sk_rmem_schedule() fails.
>
> This helps to identify peers repeatedly sending segments that can not
> be queued, with tools like drop monitor or perf.
>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
