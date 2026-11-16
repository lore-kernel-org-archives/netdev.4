Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866010;
	b=VjOb31kWtTendU1mUMcB5bkgje5xmjyrbXB/CDdyfsTyxOAJ6rrjpIej11MBYtjPirRO
	 Ry4k2fnHka7m8JOGlBMjGHQnelRfsL2+1d2oVe+P+E4pd6HNmnUzD/KS5lstp1Lc4peZO
	 7X9LJaQlaiWkAySKLqHATs1pI76zibFvIdlKgXFXbtm1bnzLjTHWlPwjQ795uPW4ZoTrw
	 wVRXLrEgrXccZ5L5lqEIvorCQygw7iIZCLylYMK1CruKhI70xlEA9XK/LsfgAN1kbRN1a
	 yfdI8+WV/yeVzolGF6XZuaHlsc29we/TZTZGt1jzcfGTrbKnpQ6llVMqpMx+Pp8UELg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZxM9DBn9x54akqpkzn9sBtaRSKG943eg3cl8Nel3kzo=;
	b=u99oTYCDaoJk214Ni/i6caKox2gvCNpUpRnVJFGGpqsFGEvsTgY2YJaPzgnISP5rFwlE
	 XedK4GAHhkgLHp71coF2pEShfJNEBBx5zBIruPVLshoDcttCAF+Fm3GQEDcReA/nVb6pe
	 5zvM976RGdQeUzZTwgLy8fondwLBs3RlR6sUhnquST/s6ohmqVDM8gC5ZoPZfV6TRQZkV
	 w47tU+abN1/9gSOcqOdIrkS0i/jM/mFo7rdkBkoacBp9EgQo/rEpzHUAXtzJncnEbRXXL
	 ukl8HgayeoZZHOPtE9cr0nuZ1o3ypirHGipLYj2YlzKHwaW5a2n7MiuKn0t5sC2vL+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEKEqv;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35555606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35555606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEKEqv
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so31286105e9.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866009; x=1795470809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxM9DBn9x54akqpkzn9sBtaRSKG943eg3cl8Nel3kzo=;
        b=EGFEKEqv8Wun1nH9x3q6NPhZLAuJ35WMTdBXnIGHyzw2sFb+CDsdn2o1BH1Aa9kU9y
         uxoft//SzoGgO8OppW6Q+yuFjOr9ovW7HM9svUFJHBpR6roS+bXL7zhKj7DOzfdYjYzz
         M8QMv+k2U6H/hbAv0qGIpiO0PE8sqWKFT9ALnrfwq5MOQwbKjOmgPd8zMRqAbBMpeq5i
         beE1Lw+ORPcVdR8xLarxv1PDsC1yPPvjA31dLDzXHtkPBXegT0EfVhxvdyklK9HiKhsy
         ZsZUCGs1WNa8vehACjDvUeTFkhxyolzxs8fYLRYohY9baiJHgmihyzgDbEo6MwBhsz12
         rEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866009; x=1795470809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxM9DBn9x54akqpkzn9sBtaRSKG943eg3cl8Nel3kzo=;
        b=Lf3o3tsX4y26yAWgL45+971WgzD10+4Sc9Ge5LXj9FY2FEy2H0LTEeAuE80NjDkmnY
         1q6DmiBY5xsTXfzy4Xo3DUdL8zk/HmNUAJeIb6IsBsRIgqLhoyPlVsKHOqhAX6LUuA49
         CHLdeD5AvyPk3rphZoz5EpJrEt/vYpXbWODpo1BhoABr9/hlpMrofs1bl1hMW9fQSJ3Q
         MNLyD+q4JKA8gzYCoczx6s4SdZ0LvAqBvEVCasS6uWQSvP7ZDkBzWuNNRhG6QlgoYEF2
         yk6W7YiE9ZxPDdgXOaiaJku2/04MFasATcXeDOtOmk7HA2vmxPRxX2/PLy50b4VgPTeB
         lADg==
X-Gm-Message-State: APuU4Z8K/fuLxS/3udL0fxOOw52qovxTrPcTiOpVlOmZMtWlxgCY9si/
	CRNdagOu+E1JQArJlXBNgntsLGGJwYwHcA2lL/7aiP6Li9MOWU8j83f2
X-Gm-Gg: AYBFou3L+UNRW4iQqtD+rt0H2EI7tG6sRYXZ4KuyDGVopLOmR3yg/HrZ/vTJCkjPtOM
	+tJjuBvzKWIl8InXpyvtJgd9+B/7lNywE/mDUdenz8wHEZFi44UKfaIIB47kpiYwSTAXzc4IGyS
	8xetBAfdW8LWxC613HE5QKPYrEmCr/V1p4zGv8dBRUMWYqMuF65h9bEscPIsQZTVQTE6mMC/iFz
	AfJPC60WnKNPgB+XaQ7S/o9i0AI+9HYIy3Pp7byngyf6U7f8792to49GS+U0JAlh1UOEc2xBlHi
	Yl550N5hQGPjGBdH2Tt9YPTzqj4oX+bMOp4y/YCrDoHzauDGC+27+LgcCE0Q1gdKDJEFbITeO4K
	r8IZvYy9ezwDdH/vBp2pYcsdR5QNr4vEPBVi85zDPCujJKE8P0mo9wOAGdu+Lafl7FThw+kj2V9
	qkfD9UoTOIiMJ2tsJt427F2et6+QDyUqaLmGQGlB2hXv3tJDBLvIH5IAWIMhJq+Dd6zcBsQ0Wg/
	PxHVkoP/AyHSM4FuBnf7fiJV35BhxsNj9siORwEzUt1ISQCSk4CtYF4QINw5yruAnB5L0dADQR7
	U21b6g//Z6766FxJiRuUZuGqcSEn2JmFo+3boo4a2TdvuIdHauwZjAF+aWReaauxNUcg4tck5Ur
	vwr/9OJujfjYPqL2N+Dyeoj+gMUqyz5rmBN04L9A2bu567PRh/jpl9QLM
X-Received: by 2002:a05:600c:a313:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4bb55a50c90mr194484255e9.12.1794866008541;
        Mon, 16 Nov 2026 13:53:28 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm104287115e9.4.2026.11.16.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:53:28 -0800 (PST)
Date: Mon, 16 Nov 2026 23:53:26 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>

On 15 Nov 16:50, Andrew Lunn wrote:
>On Sun, Nov 15, 2026 at 12:27:44AM +0200, Janis Edvarts Lacis wrote:
>> Sunplus drivers currently do napi_complete() after each rx/tx poll is
>> done without checking whether budget was exhausted or not. Interrupts
>> are also unmasked before the call to napi_complete().
>>
>> Replace napi_complete() with napi_complete_done() and add a check for
>> budget_left. Call napi_complete_done() only when the budget has been
>> not exhausted fully, e.g. budget_left > 0 and unmask interrupts only when
>> napi_complete_done() returns true.
>>
>> I do not have the hardware necessary, this patch is not tested on real
>> hardware.
>>
>> Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
>> Signed-off-by: Janis Edvarts Lacis <janislacis06@gmail.com>
>
>Does this bother anybody? If not, net-next. No Fixes: tag.

Will do in the v2.

>
>Given that you have not tested this, how confident are you it is
>correct?

I am fairly confident the change is correct, as the documentation
supports it. When netpoll calls the poll function with budget = 0, 
napi_complete() returns false, but the driver ignores the return 
value and unmasks interrupts anyway.

During normal NAPI polling, budget is set to default (64), but the
driver has less descriptors and it looks at each one at most once.
Therefore, on this path, the only benefit of this patch is that
interrupts are unmasked after napi_complete_done() instead of before, as
in the old version.

Of course, actual testing on a device would be great though.

Best regards,
Janis
