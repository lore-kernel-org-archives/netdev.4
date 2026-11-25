Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795574742;
	b=1WKqnacyVq2XyMyqxVC6ono2igdGN/++NwiAksu56vfu3JgAIdVgEDZI+I6Xdh9IFqAz
	 ZCGJzjijW1iB+TQ1j/Unc0yGAfV/hoZd02b7bjPg9au6cPyCjxV5F0GQawY+S1lQJcgq8
	 R7CsvkutaeNpuh2Hq4yj5AVCAF6jZ08ASi9MQFejYDpIXUpaVZovBpO8k750L7NCdsVjz
	 XRLVGroli30LxOI7pfUVt5hdH7KRZY4fmsdQVHrY2UoYdVq3V/w/H+RCj9wRrzwdAL4Sc
	 VTtcl0y7pDfFttX+rVjeUNdei+vEYP3lbwHOJg7lyZgJI+bJaQACw23OF7jzqBNx2uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
	b=U+9ge0wbvL5b5PeyqISL4dXmcy2VQ8gHew3Mi24KUxGwxk8IV2qN8jH0FhjCnWY9pWoN
	 pHQnimfBYoWUg61VvpOHXVoWrnMIEAF9m2PUAPDEanjEwWK6lGXZByevpGbTwL1HAMgKL
	 u4uax8gpROD+GiM75g3ix3wOZwhPLbVy4HOShNlQwUyRn8LdjqglqM2qjrN9w2g3bIbz+
	 dh9i8Lpramrh5TojdX7BO6FyWoYLTYVHdCcITQCzvJUBDO76+luRwqTkpT1aN7elxYOoK
	 73PWCVhejtApWGE/ePXHU4t7esJXAp1q/FLzJ2MZLpmFfDVb4DCWgMb3TQeb9klHUNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVe9P4f7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031C606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E031C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVe9P4f7
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6798eb0d190so4398398d50.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795574741; cv=none;
        d=google.com; s=arc-20260327;
        b=dvq+2hyBSQPlaIsdx3GQbGlOF7kNPV6LaPIOQRZfMq4n9ybbLYgxEpk9zmO5MJ/WaG
         tYqdUntYGGLJpPrDyqnttCYQ1cjdkZipWW/oGo0en/Nz5uJ+0J95v7+17FQk+LkzMTGz
         j6hFfQ3D33YICtqqLbFthcdW/eAWCD+QzE8ybeBGDM8VMb5Y7kjMN2Ajc2sWqDEjq9BD
         wsSgUkf61B84gbCRyqdlK1h8w/HucjCEEB5hXB7KuacGV7dFt7MQi7OZDEwtVkdJRwLi
         YqcrlXhQJXcj9dD5f+y5PJJ9CsJ0V6U3p8Vo1aOC6f+E3PaTjeMGkovmq6KCrYplkHRt
         iYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
        fh=HO87hVAjSFJtpAq2uNwjYfUhKzZHbLqZDcS6lhAXsgo=;
        b=S26IxCCWaNVStVTFz0PNkX25lKZuI6u2XbrMcf6JIMnFDz+SMBnWYMEhyOxJsmsgme
         2Xdc1WoczRbCui9akB4Uxpf4YOFWN0LY3LMAgwXjX4W83oX29VooHRIBb9hmnFmxPEit
         iD2wuoNkZGgq32M0vOy2OLsfw1blkiij5nMz0yPmnudl5lcP7UbRRQ55DDjScVqH4jeu
         7CeSvy95jQ0WAqzBk/QBqi+8MXJpsHLz4/gLMfGFPPL1i2ngD450bvNXb5/yMzY6A/HR
         Qx0eEIHulHT99pMazVliJaUOg0R43se+DlUhSk2KeZzyc4HKSI+7v00GtBe1B/jMtgqk
         D3Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574741; x=1796179541; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
        b=ZVe9P4f7Jc57qUdig2VezMKHSIIIQOlIlt8NwDzyyr4Et08Qwgp56v3i4bejv8OGXo
         Q+UWtm+rs+O2Z88AjMwBXf28qfMUzWPclOuV8K3a9c4uhCl3IujG3c69pL2KNqJXZYdu
         BZ37ic6tUb38fnyVB3geobiMG01MprqSeviiOeI2QoP3sxH8Q5M4zwHbTs2KY37vxlST
         cAzPkchSgkueE5M04Y5mFFk7zkys7/sD9xcS1aDJWecU4fKfTUXaA/eTDYC2QyA4XqEf
         5EjfWF61V86B86a8uMI92yCrw0oCcqYkhWuNUnGThyMuuNQdwksq3UzhkIqcCxtZNcNc
         sxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574741; x=1796179541;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AQCcMnbUCSPazYuo3oxbreAE4KxuxDo2jrYeTun1EiM=;
        b=y2myipBUpjL3FZKwFPXZX1of9FIzwAWfdjNDsymdO3XMvv42KiQqIdCcdtiKKC5f22
         pZT8CoErmthy/U+ZfM1wIoGBxK5Qx155VlerTjSioajpGEqfSxCVONxo2fFn8n7yRrl+
         U2Zw4R5pyEDpEwm7N1+flwO4WW0sbcafyy8sJWWfwE8XnTw7GXRb2fNurMwXMjhTiL3s
         /lmF8ytxJRtij0MPgi/x4ORs9mJc410Oo7evbziEIm8ma1ywvFbGoFZUrv9sciZMPEf5
         2eEB7NrgzJV0CK7eXpfNJruz5gXbEU9HT2cyyaxPOjQZA90OVFphXOJihUT2MN4hans7
         nmeA==
X-Gm-Message-State: APuU4Z8uCN9EAYQsSgs0JTEJVhi/2RK5of15Wnewiv3mkSVoivYcDSEm
	Yw3GtLFCwNC5BaMpYmoswW7Kg9tJbDoa32rnRPB9v3KSx+W+LUVwB1SU7QwAYBXby2c33fdhF9h
	wKc5+VyCbMkiNe6mJXgFKc6OwiEq94A==
X-Gm-Gg: AZFdTZe1LzQ9AthaYk04wwOVvvm4fFAipr/72Ev03Ol9LzSFwxZhCsd0URwrLKHioxl
	Kuf23XbH/BBIeqycWN6lkR1ZFvBXUeyEZBsLh3NCVsWQ1wW5lUG+iz5+eS90yk46tcC0+Vy7ie/
	u0lbIm7OzAwvebf3O8kCUcX6jxxTlvcdRZdDxJGvVTU0gCRi6JxNLygX0upxVeWuIJnV1cWLO+5
	k/bjljXgnIe/rVIs0ke7Wh7choMAMCVZwBaHvYP3jdLpWHMH8sR0cHCa0W2l9wjLLW+6A+1qADv
	QQbXrA6zZwzP8dL9a6gHYVwhtD01Bo/7+xpaL0ETh4BEU5qVUyiP/WG99Ub6B5f/JPRERz1dKdT
	4OX0m1jRdPcE7pIPPXj94bbpEW+UGvy7mpA==
X-Received: by 2002:a05:690e:1185:b0:67d:e36c:6beb with SMTP id
 956f58d0204a3-67e03d05eebmr5618324d50.96.1795574740832; Tue, 24 Nov 2026
 18:45:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125022643.1169045-1-montrealtango@gmail.com> <179557397423.3294.15950681362384539211@kernel.org>
In-Reply-To: <179557397423.3294.15950681362384539211@kernel.org>
From: Vlad Banea <montrealtango@gmail.com>
Date: Tue, 24 Nov 2026 21:45:29 -0500
X-Gm-Features: Aa3M54oIvkyJ3bn3ydWlOVUZC7Qr5wzVR9rO33Bvo5ENlIjcC8baBDLlk0Qyn-w
Message-ID: <CAODTFJTYhFzQyqc72-RRxbzDY_s48+6-UoEsD3i6+ioYLbyBfg@mail.gmail.com>
Subject: Re: [PATCH net] r8169: recheck the TX descriptor after a vector-map interrupt
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, javen_xu@realsil.com.cn, 
	nic_swsd@realtek.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on two RTL8125B (XID 641, firmware rtl8125b-2_0.0.2 07/13/20)
connected back to back, in an x86_64 KVM guest with VFIO passthrough.
Upstream uses the vector-map interrupt model only on the RTL8127A, which
I don't have, so the test kernel also had the RTL8125B RSS series from
the RFC to enable it on these chips. Without the fix, bursty TCP traffic
hit TX timeouts (17 and 6 in two runs of 30 bursts); with it, none, and
sustained traffic ran at 2.36 Gbit/s with no retransmits. The same fix
was also tested on a RISC-V board (SpacemiT K1) with two RTL8125B.

Javen Xu confirmed that the RTL8127A is affected as well.

Vlad
