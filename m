Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618549;
	b=Wxcnm3aF5mmum/BZhzI/bg80bN3M1mqq7HUH5FKJGDJWvAwXfcUmM6l9zdG0oiAf2pnw
	 DZLQDF/HYGPuZ9CdGrOYlFmkfBMbTefqCT999L61e3TAq+K56+IQ+kOyzNx5LcXM/CWQX
	 5GyOsAJH16G0gwJ8VjI041COA3N7OSYernACmar40c3Dak4dxOwW29BOS7x5wf3qE5eSh
	 GHaGuT6b2US2RTKVs2TJY6T594Am8h0tGlAaUJOZA6yoo7M27MWuMExXWl0riY1yEhHjL
	 wDBLXQb69nYNNVf5iv6N+awSjnRgdl0MccNilP1kAp0tvp1YdfkKavHMFnpYHwHl+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618549;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2fLjobpVz+GK57vr2dv+55zBYjvnY11Q7Zp7NaYYod0=;
	b=aiHKLjAdfrgJlI4HYQOs2JcbJ2TUEJ2oxNRMS/5v5EPuwSrR/781TTq6QxkiN4SHqWFM
	 L0Wft22HYusdGbLCwQ8bOTop5a5o2FjiAzQ/pmp1PxON2F1dwH4faVkcw3jSxLQDIUpve
	 lcvRI8mqOpxDp6sHAArgee8FL0gRqncZGUY0b2qAyWdoZ9m/Jt5pLwzEwf2BM49SfHDCa
	 1YDqdwGy+72u73gSXYYrPqXyGQx7igxuAZFzD3Dj8eH3+DEDWnxcDUkWr7cuHC1E2498C
	 34vbOvxgdGCYtj6VyP+69xVllbwYyYtIL5lidrSj5aIHv9sHJc2YxmN5+mmzdi7c+rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipwBCCLY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l1abROEm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86154606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86154606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipwBCCLY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=l1abROEm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795618547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fLjobpVz+GK57vr2dv+55zBYjvnY11Q7Zp7NaYYod0=;
	b=ipwBCCLYflFXThvBuEKSfWqxU9PzJhyNm6uZ1cxnzpANASAUn5jOoKyFDJb003mg85/TNm
	4WgzJG2keCk+pmSETXgwrAnlTKCHl0h/Gob3VKOIPpu1Omn6WfHVNND9OnkWkrispyHImT
	8Rxm9jLU94L/jMQ2ZNWC3Cxjkz+xNk8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-NVm-1PtUMPecBHallfhAyg-1; Wed, 25 Nov 2026 14:55:45 +0000
X-MC-Unique: NVm-1PtUMPecBHallfhAyg-1
X-Mimecast-MFC-AGG-ID: NVm-1PtUMPecBHallfhAyg_1795618544
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb9379a835so26070025e9.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795618544; x=1796223344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fLjobpVz+GK57vr2dv+55zBYjvnY11Q7Zp7NaYYod0=;
        b=l1abROEmKj4thcAr4UzrC5vRRP+PSys3uvSVSKqKdmZQjgRKcskUucR6qDPbAZizuo
         d8VgooEeGBPqS5vLr/EOh3ZzokftL5PkU+qQ/GzIu+dxIKewQxEkeTkTTLsud0CwlEs1
         w7UJruVbyI0ykBuwNA1SO8ulNjShpRjFkkyeoeZZqEpJrOcFM6R37OD/VRKEIyZTZ/IM
         kVVc5Li3B9ODoINx1fDupqrPrzTfxYB6MS0Pt6I4TALpQmvpUjOHoZPyQ53z4H+9rvvu
         PK5xq9X7FftpIXtJCwBUby9U+1WpqjApR4OMELslwf4M/vgz9W+S032wCWTBVlZfX74+
         krKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618544; x=1796223344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fLjobpVz+GK57vr2dv+55zBYjvnY11Q7Zp7NaYYod0=;
        b=lIHSyHIhb2fekjE459PqQ6HiBHc9GRB+yg14d+hVoi943Dxe0PcJpNagLnEzqlwWs1
         uB8VI5+U/48HBkmQ+MaqW0ueC5dp1qeEfIZ3clT10OIO6ULmRKphZiC1zMgqqW8XHCEI
         e7vf8Y/Qc55T5tX4PzMNGerpj7Gxx7muhd8FHqslz3SyzjpRNm+Bs5+jimIm0mYiqkMO
         dTdeyx+I5u14yLQSv2cHnHZu1kpcCp/QjJjx1rCkWS1qyISGd4Or1kxqm0hk7gZPpRdt
         1eepakRwHT2EP6Pgt2/wX/6lqmF2p+G7zcfpc/vDgZz7dpPCJRCtmiZOOliGPRN6pZo9
         5xfw==
X-Forwarded-Encrypted: i=1; AL+hErG383HHIpspyTBBgIfDZePZdxTTnpWqzUp49bwr9zITrFKidDlQgyd5T7xcjwHBn7L8GpJ4xGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+JxWlk50z+hHJ2TATh80bZ8ocXqHsjXllWDh6u5RAg567u+qM
	4XJ2HzovgNWs/lo3gM0JFphUjG40jsCv4UxlT94eqqghkNuu+Sq2MvyIFYyE0u0BH/OAPzbpMry
	/HcHvhoKE+DVYorLlI9CjhbwTBttFCWRQjl5L/4V3AWjwTLhWd5Jv/kMxDA==
X-Gm-Gg: AZFdTZfoVrDIDEiZo+XdPKtKHQL5uFI01aib7pfx4Ra0NQPzQ8xizDqCLE5UqiDAE1E
	cETakM2oA0r0Daur8T1RY001Up92Ytd/tXDOAYnfzy0X7j11sFlOWPyyWdHOD/ArsGoxEyLydmX
	dP164GH51VJMHST2OTnTF0NJX4MrW6dZmkuSad/v/v+BKakccV4+BOFAxtvkgsMDVtxLslYOLAu
	VkKgJZn4G8UXfII05IpPdMBqKdAkJ7nEuzbKVyusJrePtM/XtQtbpE8ps3LUkWBzdHb3lhVG6AE
	8pGmvtnpd8F1iR8APpdn9ZU887BSvzxudUYwW1pYlfMQKNpUyz2w7k9VVo7QeWIsSs1dMyWRi5b
	xSN2DUn0pxN4UsP7XLzkZD8MRughx0jI5JSvYm87TvS0kUkxlFmBg49cUWSRN7CWVKAmjTALP5j
	HWo5gz6WCsYR5W03BhezJ+ieBkmh0x9lqrDYCDq5GjUO+S
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr371234935e9.24.1795618544015;
        Wed, 25 Nov 2026 06:55:44 -0800 (PST)
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr371234655e9.24.1795618543587;
        Wed, 25 Nov 2026 06:55:43 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm293086685e9.2.2026.11.25.06.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:55:42 -0800 (PST)
Message-ID: <b1320ae3-e2eb-4138-bd1c-cdb9dbc41598@redhat.com>
Date: Wed, 25 Nov 2026 15:55:41 +0100
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
Subject: Re: [PATCH net-next v4 0/4] net: dsa: qca8k: fix the MIB autocast and
 management frame handlers
To: Stanislaw Pal <kuncy7@gmail.com>, Christian Marangi
 <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Yongzhao Chen <yongzhao.derek@gmail.com>,
 Alexey Immoreev <luixo-public@luixo.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119134110.15048-1-kuncy7@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 14:41, Stanislaw Pal wrote:
> The netdev AI review of the MIB statistics series [1] found bugs in
> the qca8k handlers of the Ethernet management and MIB autocast frames,
> and its review of v1 of this series [2] found two more. None of them
> has been seen in production, so as Andrew asked for the related MTU
> series [3], this goes to net-next rather than net. All four keep their
> Fixes tags.
> 
> 1. qca8k_bulk_read() falls back to MDIO when the management path is
>     not available, but stores register i at val_buf + i with val_buf a
>     void pointer, so every multi-register read is garbage: the FDB dump
>     and the MDB add/del write the wrong port mask back into the ATU.
> 
> 2. An ethtool MIB request over Ethernet (autocast) that times out
>     leaves the caller's buffer published; late frames write into it
>     after ethtool has freed it, and extra frames underflow the frame
>     counter. v2 also handles the frames of an earlier autocast arriving
>     during the next request.
> 
> 3. The autocast handler reads up to 164 bytes of counters without
>     checking the frame length.
> 
> 4. The management ack handler trusts the frame for both the length and
>     the layout: up to 32 bytes into a 16-byte buffer, read from
>     skb->data without checking that the frame has them.
> 
> Changes in v4:
> - 4/4: take the Ethernet header again after pskb_may_pull(), which can
>    move the head; v3 read ->seq and ->mdio_data through the pointer
>    taken before the pull [6]. 3/4 already did this for the MIB frame.
> - Rebase on current net-next; 1/4-3/4 unchanged.
> 
> Changes in v3:
> - Rebase on current net-next; the code is unchanged.
> - 1/4: the description said that the last three bytes of a
>    three-register read are never written; it is the last six (Alexey
>    Immoreev) [5].
> 
> Changes in v2:
> - Drop "let regmap serialize register access" (v1 1/3): Yongzhao Chen
>    carries it, unchanged, as 1/2 of his net-next v8 "preserve port state
>    across MTU changes" [4]; this series does not depend on it.
> - New 1/4: the MDIO fallback of qca8k_bulk_read() (review of v1 1/3).
> - 2/4: poll MIB_BUSY before the next autocast, as qca8k_mib_init()
>    does after a flush, and track the ports seen as a bitmap instead of
>    a countdown (review of v1 2/3). The description now says that a
>    frame of the previous autocast still queued on the host can serve the
>    next request, with counters one autocast old, instead of claiming
>    that every late frame is dropped.
> - 3/4 unchanged (v1 3/3).
> - New 4/4: bound the data of a management ack frame (review of v1
>    3/3).
> - Target net-next; describe the LLM assistance here and in the commit
>    messages instead of an Assisted-by tag.
> 
> Testing: the affected objects build with W=1 on arm64 on this base.
> The hardware test is the one of v2, from before the three lines v4
> adds to 4/4, which are only built: on a QCA8337 behind an IPQ5018
> (GL.iNet GL-B3000), kernel 6.18.60 with these four patches, under
> tag_qca with the management conduit on port 0, counted on the conduit:
> one ethtool -S costs 3 management frames up and 10 down (the MIB_BUSY
> poll, the cast, the 7 autocast frames and acks); with the request
> timeout forced to 0 by a test-only module parameter it costs 50 up and
> 57 down, i.e. the register fallback over management frames plus the 7
> late autocast frames, which the handler drops. The counters stayed
> monotonic over 2000 such reads and over 5x200 reads under iperf3 in
> both directions while toggling the timeout, with no memory growth and
> no splat. Under a tagger without management frames (qca-8021q,
> OpenWrt) the MDIO fallback of 1/4 was checked by the FDB dump.
> 
> LLM assistance: Claude Code (Claude Opus 5.5 for v1, Claude Fable 5.1
> for v2, Claude Fable 5.2 for the v3 rebase, Claude Opus 5.5 for the v4
> fix) drafted the code and the descriptions from my analysis and the
> review findings, and helped work out the race in 2/4. I reviewed every
> line, built the series and ran the tests above. The review findings
> themselves came from Sashiko, the netdev AI review bot, and for v4
> from the OpenWrt AI review of the same patch in OpenWrt.
> 
> [1] https://lore.kernel.org/netdev/20261019191137.307514-1-kuncy7@gmail.com/
> [2] https://lore.kernel.org/netdev/179304303832.3134.328719975361344250@kernel.org/
> [3] https://lore.kernel.org/netdev/47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch/
> [4] https://lore.kernel.org/netdev/20261104120130.48455-1-yongzhao.derek@gmail.com/
> [5] https://lore.kernel.org/netdev/20261107031005.2525-1-luixo-public@luixo.me/
> [6] https://lore.kernel.org/netdev/20261119133908.12428-1-kuncy7@gmail.com/
> 
> v3: https://lore.kernel.org/netdev/20261118104104.26684-1-kuncy7@gmail.com/
> v2: https://lore.kernel.org/netdev/20261104210757.467964-1-kuncy7@gmail.com/
> v1: https://lore.kernel.org/netdev/20261022192933.384898-1-kuncy7@gmail.com/
Applied, thanks!

Paolo

