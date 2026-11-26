Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715344;
	b=l9UfTPv+qPhN6N+pyhMdTbKL2VS8N23xO5GGIE0UFRfxT2pwND9NyIPH0EDYdTZAd9Qz
	 /BAqOgQacPsDMKF2rEZ56s2fp+1oozx/X+6B+9P0LHuhCnY1r1owD1Uv3btF2OOQbHnnD
	 x4bZnj7+yLIb9+48h1iEIsGM8iT8bQo4WMpeZ1NuPiPCz4WkloGpkrWssr+MJPbVhbmIJ
	 +rgbzKkHNRt8apqdFlqmqtZ5U1EBPM5LVhofRNsc+pMXcjbE3qVw2UYHyJCQEkcPXF1pk
	 Xgc0GHT0GG0iCvyNSkKrABJlhTu22yAYr9KuyrrApDq6FWBp1EPEgpWR2FF7t1lEKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YEDmnoOkABVFmUrXKC5D0dZK9YfLqXQXG7+f7cYoNH8=;
	b=fn7MWXEf97PafuhshbK7b0o7jdJ8pK2B0xWhb++bIa+p1W6k0GjNw+r+3c0AQJTvo/yy
	 Avp8i9zsTT/W/dxIj3Boza5wzNOxzNP0WgQvF36ztIFASMF372X8I7ria+lkXUUe8a9Bd
	 0uO5880Kd/99nynVYP/2qB/h9IXf1XqnoYhYunsM35tr4+VvMCiq/7/XiUb7mZijlAudo
	 eZYXn0ulm2Rogd9TtRuHhbaF0cuGsC3eZunNyxgu020OhPygaVuR3oqYZvxLwDPyJOZow
	 zIsX7cs+1emm0VPpf6wRS8fbQt4wtFi6pZXL6Xk8VsJ84OO9rBX/NGbn/bhiMYVH3uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EjYMRz55;
	arc=none smtp.remote-ip=209.85.219.70
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A612606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A612606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EjYMRz55
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211d51dcefso132240306d6.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795715343; x=1796320143; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEDmnoOkABVFmUrXKC5D0dZK9YfLqXQXG7+f7cYoNH8=;
        b=EjYMRz558xib6LfPlzEqIOS2/Egx8csyMmkrJrtpq2s914Ay2pyV9CCrS99A4TyVO0
         5pvZvfq7Z+LZjk87/HA7Td4wmFENkKWnk9GFjiLbW5D5ldt/+ntRcbvki3jlKRHWMfjv
         Bd60RlpIWThBRKkcXJphfA7EoKia9iYNA+cZ7Aw/Qb7Q5DQWcmiCGhHepN+XDu6FBZwf
         ZIMo2b+F89Vm7gi5kuFGc9Rx4/mpYXEnCE0AZ1IXISyE/lN4GaxghKwPqeIUr9bQG2Cp
         JVHp7ESK4xMhQP0azDVYRUBJ/BEOibZYl1GYDdrv61vUN0ipLZv6sMPyRyO1tou8pytw
         YJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715343; x=1796320143;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEDmnoOkABVFmUrXKC5D0dZK9YfLqXQXG7+f7cYoNH8=;
        b=QTl/kEOCtmWS5E05yrfIc9ZHgl+8m7VnO1iPkx8D+FWy6YYsYHeveJDxCcozd5nQrz
         YNj2EnJKU6mgCmiJf9k1q0ptdN5M5rKVamrNpGNmaE5lDa5jMdvO5aVjUOvggu60Qo5J
         OLT3yuP379sAWcmWHtcHccrf1WDAGY9eY/KLEHB5hBx8LS5wQpmBNfquBrzktENtPDfH
         BpLO9//1j/e7eDWNHoo+m9KaL5/lO0L75eAoERNT3vd+q7LJvvcZV0iPDRa0zrcWT1BP
         yDdLEr1Kxl8zw0TvMb9jW3q0b5ueGDjhxAVLSNhc+dBqsZ1AILcTuC5vvF1O+FJF8+Nj
         Hn4A==
X-Forwarded-Encrypted: i=1; AL+hErHFr+8xXtDFtG4+MZ4hDtR1Z+eHPL3COPwfOeWYOx7VmUN54tuQ4iq6fqnJI3V5D5PiSFHBuek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+97Uj9cObPRYEF5q7S4brj1hb8QqGY4KXT5Yw+fB5LjW4AVafb
	JoB/wGLGPx2/0GJdSkQsDR5FoTVpUgEF4D9JJF9DNtNauvHqElB1KELvizSTdFYJKGG3gwEE61k
	2S0bH4N4fjA==
X-Received: from qvbcv7.prod.google.com ([2002:ad4:4d87:0:b0:921:7b48:4c5e])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:4383:b0:91c:73c6:2d68
 with SMTP id 6a1803df08f44-92134966d44mr400722496d6.5.1795715342484; Thu, 26
 Nov 2026 09:49:02 -0800 (PST)
Date: Thu, 26 Nov 2026 12:49:01 -0500
In-Reply-To: <91234e5b-6684-4acb-91b3-be8ab11ac032@ieee.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
 <20261124170551.1874487-2-willemdebruijn.kernel@gmail.com> <91234e5b-6684-4acb-91b3-be8ab11ac032@ieee.org>
Message-ID: <willemb.3268949a56d77@google.com>
Subject: Re: [PATCH net-next 1/6] net: ipa: remove ethernet-specific artifacts
 from modem netdev setup
From: willemb@google.com
To: Alex Elder <elder@ieee.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, elder@kernel.org, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Alex Elder wrote:
> On 11/24/26 11:05 AM, Willem de Bruijn wrote:
> > From: Willem de Bruijn <willemb@google.com>
> >
> > Commit 75944b040bbc ("net: ipa: open-code ether_setup()") open-coded
> > ether_setup(), including fields that do not apply to this headerless
> > ARPHRD_RAWIP device:
> >
> > - min_header_len = ETH_HLEN, while hard_header_len is 0
> > - an Ethernet broadcast address, while addr_len is 0
> > - clearing IFF_BROADCAST | IFF_MULTICAST, which are never set
> >
> > Remove these and the now unused etherdevice.h include.
> >
> > With min_header_len left at 0, the device behaves like other headerless
> > devices (such as tun and rmnet) in af_packet's vlan_get_tci(), where
> > min_header_len == hard_header_len instead of returning early on the
> > mismatch. Normal IPA traffic uses ETH_P_MAP rather than a VLAN
> > ethertype, so it is unaffected.
> >
> > Cc: Alex Elder <elder@kernel.org>
> > Signed-off-by: Willem de Bruijn <willemb@google.com>

> This looks pretty reasonable to me.  The "don't open-code"
> change was meant to avoid duplicate code.  All the assignments
> were preserved, but I didn't fully understand how these fields
> were used.

> For now I'll just ack this.  If I manage to get my system up
> to test this, I'll do that and provide a Reviewed-by, but I'm
> not sure I'll get to that soon.

> Acked-by: Alex Elder <elder@riscstar.com>

Thanks Alex!
