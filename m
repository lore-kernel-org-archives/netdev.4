Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082521;
	b=lIAFoIydd7pNhMu6ZOLoHzk72d32T3n5qDP9Ycw2GIyTDdtS+eBfPThGQrmI+Hv9TwL2
	 v36hgnPoeI1dur5ZuuDKZhruBYmZBIeFkyECzUBf8e/nWteOjlxaJOf4IjkFRADZMxcuM
	 DH0skrlzuwbc7gfITTX1pVJHPJ5biBCy6fAjY+XLDIeqK7ZPwWf2fNhq93s8FW3WC/RWZ
	 R2VL3DIxQkssXxFCMzZsxC4TrAP6JkkS4DsSYVj3L0JjJd/L/eoXBRVDI+rw+dG2HGUy6
	 E7jZ/4ObURHcuX1NnBKJ7MMEUg89H6ez98mxrRXQfXNDb5y3JYlxYVlp7ST79MZfJfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082521;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
	b=GAriZEyZALc/FBndUQtV1ccdBGGzgqivTtJ8HI9SKx/GJXZXXLe9heCfx11sADGZm0vZ
	 nONCx5ylwRzd9i79ySYHUYaJKTcm7osCIsgjKi2N4fvo2YlsjKnnkIyT/gC9Fc3lzTM4f
	 1L4TYPiUSg6mxLUDnMgF76EgKXrvOL15GC4pRzEDTOrZkfbHGN7JTE/GUzgtsidlTLxbG
	 yWeMbeu2T1QWi9y6iYy67E53DE/FnrM6KiPiTe9MR5DbAtbvIQPXlkLWSjOR4Wi/wG3Az
	 Lz2NDNFbXqAYnOHPRY2CQxxMXEbTFtLEhO9dsnFWvOp+8HidPEP2wvDjbcCgp9elpCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XKDX9f6r;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dOFFqZ1w;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC43606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC43606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XKDX9f6r;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dOFFqZ1w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795082520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
	b=XKDX9f6ru2f/sVXDgFEuSpU5O8pf8UDXhDIxHqD3IJdJ6ICb0ecXHLCZpFu9XHMF1vRq4D
	nySjC/K0jSWKhy4nBVlEgpesHG4cUGL4Lm/RLxZNs1SG9eVgzKxm5tWWkSgyaz55XrUibJ
	iyuUtdpCvLOBGmXTHIO4pN7LfFO/wJg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-4zrrMKfIN9WznL1T_KVTsg-1; Thu, 19 Nov 2026 05:01:58 -0500
X-MC-Unique: 4zrrMKfIN9WznL1T_KVTsg-1
X-Mimecast-MFC-AGG-ID: 4zrrMKfIN9WznL1T_KVTsg_1795082518
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so13248865e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795082517; x=1795687317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
        b=dOFFqZ1w13i9zITU1kTIDe0O8h+wWvgJ+Xvhcr20xVLgH104yol+zZhXyl2MYd1Q/K
         ljmRTlwISQLlsXYJeB+mcBYnMSaWYm1XThhyL0AxF5UT66S4e9aQVCeoV53Z0MfYZoS6
         MAtl30Rvw37C90Ub3u5A9mUkxDIwWibXAR1CcZqqsRZqdJkfMlpKN8VQoZAppwWSYtUT
         ffRyDK3vYf/XODspcxhZRnXpnvuuX9rW5ALCGO0GeYlmHdZyW/IUSMpif+fW6fLaQFEP
         n/Ko4XejIznYDGS3VPBtXJR9pB1YUCeVBkrxm2RqH8z6dmcdrFu7Hm1NE0p9vckUHvLJ
         rQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082517; x=1795687317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BouZjsYOkGr2M8SflT7EXKbiktWSsg1pSaGKgnCUdX8=;
        b=YTKqnQga3Yk2Gx3fU0aBwKalLmL4VogLjgiaun1tS51zdAc5Fs0azaScGDiYESjV1b
         nbmJC9iHuU4QyV/1kqgGPedPdQ0BC2PMBIXMZ3UGuNVzsH7WquYprcZ1NyPek7S0eiF9
         qHIuGSq3vjL4si4efaT2SFHlPOL9Kdj4MyYUvvL6bN3exiRAXPoUatIL7fdlowGLLLyb
         lk6k02P3Mr95YYXvSF3/wg6QHgQMY8FGBxwQXVfbxRWM5Xa5d4+yBFY5cTJ34kAhzvJg
         ziPIKQyq3nzSQdeyXIoQ4XORpf4EpKjDySKxWYmqoolQaUWc3AAbXnC1+Wv3HAJA8B6N
         YLmQ==
X-Forwarded-Encrypted: i=1; AL+hErFOqY/nuhIVxeUgpfJJ0NsGWXh12ewhEG8uSIlZdD+zZR+zWN5AtgV7Akzvt4h/9FYl1GXOHlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eCQgKbB2UBy5zoa+aMbUeOb1BpXSHYkIh4ixFC/Hmp2l8LcXH
	aSXP+UK84PX7LgHrxnBe1Wd0FlhknFM4i8X0spnxrmjxuYqAVvooNxb3wYGBWqBne8ngIytIXqZ
	UUhs7bAshJ+tp4zq7i8LY2VnXtfPqylorubPMmLWR567s06p8NbSuZZMHYQ==
X-Gm-Gg: AYBFou3FcwwE74wt10sY2hTkRpKSCWX+8Mks7N+D3a4JRC/sw+p6A/blTQxPei4QH7x
	zOtjf5+28OSVPPZ15fkOC7itd2g9aPONbE4FhfvJnuWiFfzfK7wZ+EMr1Iq67Koyel/cIkitrYX
	PLDjYB0ci+q56mBKwZtbvKr6zfyrW2MYXvLsbeQrWhTJ5xsu+1hqLyD8O7JBsJqFTL233qIs8zb
	Y3G/N8Y8tk8JXQGI5QRVniwC15ZZT06emoiE1z5Q2TSSKlfcWXCBgsLsDOyCCc6uHX5avF5/KHh
	iSLso/QORhsUShJT1wHv6fZXe1DHJbYfxLP5rCXUu1Iq8LDZJCeq4BTO9dXTOjvfFuUnP/aN8Uy
	UKttDQnyHXcVn1U3a2Toqtk9v70Aui9OzhedVJQGRREZLrFWKR3oXvpUd6dojzNZbBcvMv2Ju/D
	4/tbLQEKDEDHjNzWi+wF0ZONrNh3ei89FGKDRoO+UmGD69
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr123452355e9.32.1795082516740;
        Thu, 19 Nov 2026 02:01:56 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr123451735e9.32.1795082516256;
        Thu, 19 Nov 2026 02:01:56 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm25507345e9.14.2026.11.19.02.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:01:55 -0800 (PST)
Message-ID: <0e0ce63f-58d5-47f8-ac4a-eba0420e6383@redhat.com>
Date: Thu, 19 Nov 2026 11:01:53 +0100
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
Subject: Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet
 and URB
To: Oliver Neukum <oneukum@suse.com>, petkan@nucleusys.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112104548.693456-1-oneukum@suse.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261112104548.693456-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 11:45, Oliver Neukum wrote:
> The tasklet can resubmit the URB, which in turn can
> resubmit the tasklet. The cycle needs to be broken.
> The simplest way to do so is to prevent the resubmission
> of the URBs by poisoning them.
> 
> Fixes: eff674a514bd3 ("USB: rtl8150_disconnect() needs tasklet_kill()")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
Sashiko feedback looks relevant. Also please include the
info about issue provenience and the impact into the next
revision changelog.

Thanks,

Paolo

