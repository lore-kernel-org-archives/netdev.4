Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165609;
	b=fhicq3h8kBe3MWEh9esBgW1lUDh+pMgl/oYfvrzL6jPudA7mxkVvK2nBeB1SGt2XlCTM
	 Lt25fU+jDz1w3Ooetcxs4uzqChtxSQNBvBFsjqvtwche848SDtVpM59oosxJIbyErm5T4
	 luS1DvN3iaicIJnFyRzgyiV9OkB3mM/m1DnPA0isBvlpSLiFzC61TcRONe4t4XeoqeWgg
	 QlQlwSq0AKE/E4jxJ7sRHPLP9mQNfDI0IQYpciLEjltIgI/zUqNFG1BXWGsKdx/emT8lR
	 0q6hfBOez3jbEOGQPT8K1nwImO10Edkz2if0mCtRTR7yubub4ylf6rm48rUi4us+jSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ozCjzkbSInbrmO6p83Z+XuWVCHjjnvkKYmiMfFEnSNw=;
	b=Z8L0iONf7d7sARUb4XoV5xikd+YnjAF298Svf41zGD3uDOa17WF/AQwATwwlBM5nccj5
	 fD3mmmd7ohCnge9kZZHj0P5VD5NrX4a6a41tu1Yxo3FlfqmEilbWayxluoCVm/LFLGOFJ
	 ILbQcmAebg3sHSvPS+iTjGp5CeoqecWM1CXWdJ4vR4BChcGBhHxFz7OQ4IwdU5b/LWwzM
	 EHiJXjEYr7QJIg136K0/LJSj5SFxpFTp5Gaf4HpYlRqLcQGgw+cwZrZbPuz5p0N6R68vx
	 +FypsldGRTcE2SLgPbcIzbUeL47gMVMUfTU0W6NhL7//800TDs861EdpX/TiPZ0Qf1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=GCD2hjdZ;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE9606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FE9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=GCD2hjdZ
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2f042a34db4so2757595ad.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795165609; x=1795770409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozCjzkbSInbrmO6p83Z+XuWVCHjjnvkKYmiMfFEnSNw=;
        b=GCD2hjdZOroT8tTzLKEL2/WPLyjNC0cJQArcXTpCrUikekFbskZpLeCMRmf6YqB7MV
         3m4i/DNiYHu8d1NJI8xg8x+RRefWXwWSzsgMvpVxLeike1/LtLJsBQ/cbSQb79oNSOnL
         s51d2U2BzIWROvxIYVQzReinWNfSTUl816fqetABWwpQc3kTLgiC6E92de0hQv7DrJy2
         vOGcU5eEst6vSJHITExY9mXP7ADsKt27BRrsAWFyUel7BX2i4hQ3zWfY/9vR94W9jRCe
         JOHwsePxxrY2wQIkEfkYHC3AxqZN0On8WrKUF9AD4jEDPUdoHvvPS6PFc2K/Ew3wK27T
         o1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165609; x=1795770409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozCjzkbSInbrmO6p83Z+XuWVCHjjnvkKYmiMfFEnSNw=;
        b=CGMdC3bQW/FPPLX7T2eRCU97iJHqUGD6tHvVE/OD8Q+skluwn3aSyFfYiRXGElSYK3
         9BkFJPPz5TgY08aH37Il6jJJmbMB0x3j2F+CezXryZ59JZRn5m+lfUAUELF5967beOm1
         XxCqbWVwudcAvOMIrb6n0R0R1nRdzwx7X2gjj8hhQA4QMWB176uK+YlmP8xrvMxEn8px
         aNEL71VF5VeWyadhIDTJ6Rdwebzxlen4/RnQ+eiQrelQIrARuloS69mTc1GXBCrrhqjo
         eOQs7AWiMSoR4c/7yYH0dPQy4AgzEiIxGBeLSu5+fNd/RFhO+uSxRs4YigXEYEAYPcIp
         WZog==
X-Forwarded-Encrypted: i=1; AL+hErHoOk2jUu/qKFJoYm3Gq8ubi3D8FJJIGpREpshbHkPF753gEjeLzDeVlEhPlDrpG7zq1AZtY8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yoIB0SQ0Qnc2I5p54e9GP7job4o4uBE88sS9H0XySpw+boOV7
	Qfhha/BxHpr3MlgdhVLVQAe7ujkSkefZPQ/hEsfAzAzQN0uu3H646P6pO8rc0OAJMb3Um/opM1u
	uPBJf4PWSARMIQgPbb2BHndmhwy2PlOptvCHi56yQR3G8ACR2BOII
X-Gm-Gg: AZFdTZfP7427UCr145TcNG3mbylieIxE16+mqsUrwEhyV+krnDmPe1UhVYPzjczH5vn
	lf0IaCubOL1P8bplDuyI1po98uxXDy/pNUp85w0RHos7jA91u8wpItobGAPGIqJPAVbWns2u4eJ
	qNJgohZ2EJ7tgnDa2qtm7QkwA5zkV1ThN2Px2GhhPtDYAKr5x0KsC0F7OouPq9eHyfBB+OioQD8
	s9e6k34e++lI8Lj3JCZ1xup+0lz/H8h6S+tkSm6oJS9Bz2uHf4SNr9EPiJ3RYHtRVavNGv8tSbr
	IuyeLWKFnDFnw4kDtXaEtc0j50Ku0oGNRSJrU2zpS82hXzPI1PT3LrJRb9NzBcHuyUPeGQ52Ev9
	xlGM5KtEjrMrsG2ZFOJyYYpswOHA=
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b41c93fac6mr1505800a91.30.1795165608742;
        Fri, 20 Nov 2026 01:06:48 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm723189a91.2.2026.11.20.01.06.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 01:06:48 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Hopps <chopps@chopps.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xfrm: iptfs: bound the reassembly copy by the buffer it copies into
Date: Fri, 20 Nov 2026 01:06:45 -0800
Message-ID: <bee0a5cf-dada-479b-8417-dc3621109a15@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119142308.3272570-1-piyus@iiitd.ac.in>
References: <20261119142308.3272570-1-piyus@iiitd.ac.in>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 19:53:08 +0530, Piyus Kedia wrote:
> Bound both copies by the tailroom actually available and abandon the
> reassembly otherwise, which is how the function already handles a stream it
> cannot complete.

The inner packet that reaches this check can be valid: its first piece
arrives in an outer packet whose data is shared as page frags, and a
later piece in one that has to be copied. After skb_linearize() the
tailroom is only the slack of that reallocation, so the check drops the
packet whenever the piece is larger than the slack.

On ipsec master with this patch, a test that sends a 1200-byte inner
packet that way, 450 bytes and then 750, and a 100-byte packet after
it, shows no panic, but only the 100-byte packet is delivered. The
other is counted in XfrmInBufferError.

I had a fix for the same overrun and have posted it now, with
Reported-by and Closes for your mail:

  https://lore.kernel.org/all/70d0cc8d-e2ff-4293-a416-eaf2705a0b9c@mid.andrii.net/

It makes room with pskb_expand_head() before linearizing, for the frag
data and for the rest of the inner packet, and abandons only when that
allocation fails. The same test gets both packets.
