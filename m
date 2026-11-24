Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532072;
	b=uw27jLyE6pqzNmWjjSDYxEbGiqtATFmIdF/0pGXxuNnutwiF2URnKRMCTHin5gk4vna9
	 u/3gJB8QZYUIsfAXOIf338N1SwAAT7q+Ve70Uat27YlTXW4Jtz76sKJYk82ECPp7pBNM/
	 B087j1ocR4GlexZXB0kLXAf+ZRM0G7QSlgH0anIaU/pSmSc6Oo/HJS60xnTIi04D0/cFo
	 R/7Dq00yyVkLSdvszJyHrC7c41jyvzyPDzsV3t1i3T4OzbutpuQFgk+wwt6LHOknLFlOk
	 y4mMibsSCaWoEB0v6x1Gr6cS9dO2p8egKYFg5kzVSfeWJr8x/PQXkVP/AEu1F3G8I9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
	b=xCUooq2qWWuXBLcHBphkpfDJ+tqUzugfToSx/vuyl386acikWIibh50nNGr14AsnLE6t
	 nBZ8B9ulV/7FN/MBxqlqpXAKIHRmZ3AepUqHjADcQGS6PE/4oONrc+CFeeuUGG6xUfb6Y
	 OdRwwDn6z3azNoXWJ1LG/tXcG/dweqx8HPZ8rYk4kPRg9pPVrfNcN+8aha0BSlCQt4B3C
	 NGRUOx2rYzb7/iPPas/yjzfmSsnpTMd5Jy0o1x87dSWOB6b9X9XW4SCBSj3LERUJHp61z
	 8IdkIrqzf/pobh9orRk9XJ1yefXFxdXOUqVSfRxTVYy2u4kgTq3NS+dAVyWLg+irwiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wB1jEgxo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A49606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wB1jEgxo
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9851592ada1so1144443241.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532070; cv=none;
        d=google.com; s=arc-20260327;
        b=dQfB+Y1LoSbBBEbLwB/IiMEcEjsfjLtVMpPYtml18qYovFjbbBwatfJDeTlZBbtUjC
         TEYtILyW91xK3bqbjGTND7NOJYaIq5YwzaZWrfrWFiTgllOXlzO4uHCkY536FnCMCErv
         AUtJ6eEpSMKcIBV2kPlz1FkpQYo5HLTt9IOy39hw6LDXkFfQ75K1Stamw8dwEYPxLO1B
         znjy+D3ZN+hDDr3ghZwCdOlRewB2gLqA/UBqo5B/vaGk5QW3hUHmAwrXQmIVggtRIbVx
         ZRiPABuS0Ry0w1SmsrvHkYyiNe4vkNLJpcCEMy6tGlGDWUaV2G56QsAGSP93w06YqFe9
         /zlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
        fh=L2LbMT+hCcL096Nf+IWDVD+75NayvlKM3In68RkZZik=;
        b=qmsYsOmjv+JuCmnNLuVRaUtkXLyklMET/XBBzjrSvQ7wmoGnodYNF+wmIkQBTUEHfL
         JUklCLBSP4pRCSxyTjAC6gc3CHe02hUs9enp9Pp1A/v6Dymvr3nou/x7DKbIBAEzDJD0
         RhFlMrHOvBDhqtif1GeqH+sZnCG69gL4NAhXCXxkZLtLMqy+HsstSlkBT8KD5XFeOKiv
         gicHyIJviq9MvA1oaSna7+wSGADEMmmTOUNXOqPybTRWkKvRR6bFlDJvXKF1pnTLaMu3
         F2eQjQbWSIcM+lGD7bw4nyEaYNfAulMdcYkZKTU8ycxGMFXNhvFLZ/YUvzIcJvLro4lN
         5eng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532070; x=1796136870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
        b=wB1jEgxo3LCEB1zMm4kQGiZA7qS05r8+teZkpkEZ4S0amfm3fFSnZ/fohoGDEw0n8L
         Actc5v1/1+UxYOGIy0WzJtxW+adaMk48aS/uuUYvR/tdF7IWMHD4Hkt0gfohMdQGv4Uz
         b8T7x1qAOH2Nt6HOugRiojVc0wu7iPfd7R+oCXU+fWnyK9qG/TE8a8SC3WVlwKD/m30o
         a/m2gWdwteae1N7+Uck4xVr86kGvEhgl0F3IqAuC8lYwW/YDk3hNui82pDRdk8ytBwoW
         J9Kce+gP93vjixTE+vY+qkRgtgfPTsbBp6WW1KVUT0m30+OLu2iDEsX+AlKkUGf46iHs
         kGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532070; x=1796136870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
        b=aSJaG0gXx3lbMoPDd2HzzNTzYjprpQpj5Vv4RZZm9KGSZDMBp3jMEl5AweWwoTomTO
         DTjuN8Ktq8fAxk77BG/pnUToSBFXJWc0vlBGVK0UCAjPXNzfFHdcvi/rBXZUbYL7CVr3
         0sIYG7RxQptwdViMrKlqzRRFcS9q2u6rJCnkzPl9HFbDCUE0xu7lWpLLDnUQ1ALmXrfy
         tPifdCl4Q0/lz8szM0qUo2A4BTJAUr/Mq5f3atiUirZvxkyUFJ7XllZ5yc1a9D0hU/u7
         WxKF3H5xKivsIWnD8lPRX87ObQHu9wgcicpVzz6g7gPVmcnENvqTQvRBAM1Kws8/cJHo
         zcXQ==
X-Forwarded-Encrypted: i=1; AL+hErHN7/NC4UH7kLpVNSrvqyr+kGVSoPenpVVywuojHyfv9f/d+kYXA67gyxoP8jgwEiJZzBEVqwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rU1TyjDPKHQST9UAqMYuXOr62gPuJ7hD5pqLEbvXvoaiFwtdF
	3pEmla5vItHJoQxJRmmotfIpLuLOAD5aJTed+/N87W6gHLa9XnU7C6rHy0gxmzf6KhqMMtVC0jE
	bs923qyKGr+H7BOsSDiqr2gcrctSfC2U5h2wobHE=
X-Gm-Gg: AZFdTZcvkvYnpoBhXv1EUt8+vjcbz3CSFdXM9q6C24I7EztIF4vCbcnXCFQBy+pSQyA
	+fsYuyaqOK9VKAbpGngOQZQASxqEkHtz/SyI3AkVTc/RfmfP4eZNJexhW/HFhE88/x5lyONJ12C
	/fwt3t1Zi7ysIHbWgK265mqKyZKDC6KV4UisZ3DSMO0N0XyPPmtno9n1vNfEZqoELPIjmpzEI5R
	3EUJPDeDy4pJHfsW9Scjk8DDGcaFnCDtuBXCY2qXI6G2gqQl5kmQdUCJBfUqFDfeOCZxihIdLyt
	b01KtStYJ6QvWbvv2fIWSe89xvSojMFG541DplAiuBIZsllJshxEiVPmKIJKi9qvzajfZ1NR1ec
	aujF6dwhwR1yX7/5E08yRNm8IDvyS1yeglzNPTju3zApPanE1SNl232KNPxsCF2ss401AwCUIqD
	v3pQqVShYZSsGWeXhG3On0S+4iO4PfKBT8VoQf6Fycwhvhg5M3xO0AyHUPa8g=
X-Received: by 2002:a05:6102:5494:b0:7cc:2cd0:e74f with SMTP id
 ada2fe7eead31-7d7398031b4mr5994320137.30.1795532070049; Tue, 24 Nov 2026
 06:54:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120035521.2098757-1-pkfxxxing@gmail.com>
In-Reply-To: <20261120035521.2098757-1-pkfxxxing@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:54:17 -0500
X-Gm-Features: Aa3M54raP4uMsSk2aQXqFMpGIN55EvV3pDaZPRhl-7iMNA5lcjzDRXxQYcX7lvI
Message-ID: <CADvbK_e_qUTwQmhDquPnQNn3ghHmnHDA+3sdQ8p3-DNV6sQiXQ@mail.gmail.com>
Subject: Re: [PATCH net v4] sctp: fix use-after-free after association migration
To: Yong Liu <pkfxxxing@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:56=E2=80=AFPM Yong Liu <pkfxxxing@gmail.com> wro=
te:
>
> SCTP timers and ICMP error handling can cache asoc->base.sk before
> locking it. If accept or peeloff migrates the association in between,
> processing under the old socket lock can race with an abort on the new
> socket that frees the association's queues. Transport and association
> references do not keep those queues alive. With mdelay() instrumentation
> widening the race, KASAN reported a slab-use-after-free in
> sctp_chunk_abandoned() from the T3 retransmit path.
>
> Recheck the association's socket after taking its BH lock and defer
> mismatched timer callbacks through the existing retry path. Pass the
> locked socket to the IPv4 and IPv6 ICMP handlers instead of rereading it,
> and treat a mismatch like a busy socket before processing ICMP errors.
> Skip socket error reporting after migration and check PMTU only under
> the owning socket's lock.
>
> Use READ_ONCE() for socket pointer reads in these paths and receive/backl=
og
> processing, including transport lookup, paired with WRITE_ONCE() in
> sctp_assoc_migrate(). Take the new socket reference before publishing it.
> The cached socket is protected by BH context and the endpoint's
> RCU-deferred sock_put().
>
> This issue was discovered by an LLM.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yong Liu <pkfxxxing@gmail.com>

Acked-by: Xin Long <lucien.xin@gmail.com>
