Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648633;
	b=gW0rD9P957Tu2vHW+MAg/Js+ATAooxDaHIA47SliymH0y/Uq4gntdGLcxhMmhm7cKabN
	 b+59juNIbIGXqWskpm4kRRUCrUaSLRYFOgr1aowzx99U5wH7HBr2uVDaGthrTb1xHXBlM
	 AMfmyAh1IYLj17iANI0lfER/50Vl2XNggvjl8vSBCcPxevK9o+hukrQAj2jOFnHTPtR+2
	 Oca+08/Kf7y+eOvephWXJE/2KXuAlc8in+1Y4pj8/P/VQDEAvbYPOAmbAIkk5GtiL20WD
	 MJwon1SO+KAeYbYVTYsmOa3/6cY9dmbRNXZDq6rOtTaoFl9UuhZs9LA+A2rwzcltwAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fB66r+RmtclwuoJkRq22iMu7bQUDw+29XRRh1BvFsls=;
	b=obwH4d2bAPjBC3viVmVKXbErnnlLGeqbZn2V9saChTZ7qAHMbV/JbY0TC5xGijOiUHqu
	 nWYxfAR2tBOXC/ywhnrEDbELTSEIP5EKKaQ4a8xJvyrPOs0njps7Cglf9X75fwQC0fxfW
	 vqF2Vdz7ZEDRHkDKHaxx8/qNLsFwU7eUG0Sg6MlYsHo0mhRCHtTyKqEpA6oolsTkY9jkI
	 WMMD4h+Z5V/6kiq9Psksw4Wo/0v+pbsPbWOcKSm+wFJhQT+D4fPK6xo+TNF+7K21btBLR
	 NjIk76IceX1eGJKR/PWN8A5lG6dH9z9co2fvfO7GCRo5SBIWuebu+nvJmvB8lpfFZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nJ9Bbj63;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E43606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nJ9Bbj63
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso3453421a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795648632; x=1796253432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fB66r+RmtclwuoJkRq22iMu7bQUDw+29XRRh1BvFsls=;
        b=nJ9Bbj63zsgWN5c0pucRTQGaqsxYGqVFbiEu54isfe25Aa4ZhpQclXxzUQOFzVzzjn
         AV5Dt2/KxYiC2cqC5N0xPpL218CBcw419aWStzqgQjKQM5bGs39uZAnXBJZeYNepRROO
         pHzOwslBLW+sG6drs79vSbWX0cxSWu3OJybZMYILiu/PxXhgxEigLLV3Z+ctx5BWpG+X
         mDgZjw11vtGg87BO2C2Xk1bOcytQL7GgH4lI10/BKSzrsRjXWfu5wBnBt8h0ew2+mdTq
         sK7mTpHa3TroUGnuWJ5y2l1xK+BBQFXozp7EW3eliuo8eysrIGYfjihMqCjLyQxcMtFF
         8MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648632; x=1796253432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fB66r+RmtclwuoJkRq22iMu7bQUDw+29XRRh1BvFsls=;
        b=oZaasGQgGKVEN0RBmAPPe+R4IMN5Vpd7gMsaXYjm39wWtcqUPVHhKzUkkBqj4nO1oD
         26qDqcvhSnm5DEEX1SzUbffl8kQYvhX7ZeuGBs44DQY/c1cM+p2zlBsRyOF0lDI+d7r7
         E2+UrwKz3JfFLpZ77rpVv8TlDJU6QfB2qMvB1brBXFjHDX8BKH0Dmj1p1Hn9cKTUK1ko
         dMUS+DtPnxzL5+23CaSFBmn/N8gynupqskR1Gv5QSDYLSiCBPIg3sC8CkPqmyR8KMhLw
         ef71SL6vjeQ4X4rkvQkDj82L/s5TPYn3D2lrqNAqzvY6uPT6Zvxo9af3Z4vsVKZ8v8s8
         9dCw==
X-Forwarded-Encrypted: i=1; AL+hErFFmxcMfGWk48J1AeqrQcGOyyEXoIMninJ5zy9dtZ4+5RKSx6EUdtZU4ZFcSTMJ0p/QFFA2uHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tiH9G06hSDphLotUUc6Qo21ByKaqK4TL/sdk+/Xml1lXamfbR
	JMWhSveMp0E0xrkBfkNsxnajGFXdngVmMBjYcXQUeIfX/5lBiDTudod+5bPBMqSYKo3viLSXC/7
	sjJ1m
X-Gm-Gg: AZFdTZfAy/urYcpARnqrBRYPgP++sYU7hU2Y6GnIMAfu7kSPfaieo5THCXGknz5saRR
	0q5wIgZTaNyj1LpHGG+9ZIzlcmFV7PlHn2BrqL6/nhLHn09zu0zrbqHyuKqTivHlKZzVVyCO6G4
	CKT1TG5TuqDTQ/Dva8KDn9BiLH4kqX5oy7fub8drqLwxsonj/a6q/QJ4Um89eMhd06tC4L2OnDv
	7znrqw2rc1A+9EXGmRCOVW/rCk+azwTLat5uBGyq96rRrrTnbP9rdj69oIb/q7qpPKD8JdX+jLj
	WLJmUjDet51hbCV6gmcVbgbZhjZD5sKiAoB1OymK6Afq3eSbUWVRJjp+kxmXRVhsvh/P98O1aAX
	26BOjYJiZ6C4IKv80STort5G/0AIm4RA61ulQ0No/PO1D048yQQrWYv7d8QEBAezQdNMnPzy3jy
	9DuYAd3S4nP0iDrT+xUmjkdvVVrYjgzxaD8KpzlRZNwxjzoAjb4umi05+QfPKkoJ1BnARySJIbx
	zqt1zRXoSCsf2WbsqUdgAVJDbQExuMKrTDqCFK9Zp2abMmgYkJJ0KQ1D72jI7umLrpJyr1Q34YZ
	Vx0SDjW4oFVeQxwrq1JDT/Ew6PfiOXiGgRDeQKp+NOE=
X-Received: by 2002:a17:90b:4d11:b0:3b4:d00b:d0b3 with SMTP id 98e67ed59e1d1-3b4d00bd2cemr7778086a91.51.1795648632220;
        Wed, 25 Nov 2026 15:17:12 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8c2fcesm10811396a91.4.2026.11.25.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:17:11 -0800 (PST)
Date: Wed, 25 Nov 2026 15:17:09 -0800
From: Joe Damato <joe@dama.to>
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: page_pool: Drop fast and slow from the params
 kernel-doc
Message-ID: <awdsddjX8STuJ4WR@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
References: <20261125184640.2407270-1-takano32@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125184640.2407270-1-takano32@gmail.com>

On Wed, Nov 25, 2026 at 06:46:40PM +0000, TAKANO Mitsuhiro wrote:
> struct page_pool_params groups its members with struct_group_tagged(),
> so fast and slow are group names, not members.  kernel-doc does not
> expand the group, and reports both as excess:
> 
>   Warning: include/net/page_pool/types.h:105 Excess struct member 'fast'
>   description in 'page_pool_params' (did you mean one of: 'flags',
>   'offset')
>   Warning: include/net/page_pool/types.h:105 Excess struct member 'slow'
>   description in 'page_pool_params'
> 
> Each one is reported twice.  Drop the two @-lines and say in the
> description which members are read on the hotpath, where a reader of
> the rendered page looks for it.
> 
> Verification: kernel-doc -none include/net/page_pool/types.h prints the
> four warnings before the change and nothing after it.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>  include/net/page_pool/types.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Not sure I fully understand all the docs tooling. Would this [1] solve the
problem? If so, it seems like it might be better to wait for that to land ?

[1]: https://lore.kernel.org/all/20260916214357.22573-1-emmaonana18@gmail.com/
