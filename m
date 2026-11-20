Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216661;
	b=hG+kUooUh4wcBjuO19Gc/uFPW6cyh+HbycJbtGk22XWprAQrdWTrNAJhsntHfnSnRwW/
	 hhoftnUthYUMGVpXmOS2Hs1Dd2a7hAkoiNSBoNSkruv34HJdxe0vVv6NhJusti1fMd3Kr
	 jVEdpghY0nrNJV0K6eNAnsydtzzXfZe2VzRpEBZnWR5/0uJ76CgYq3YRw/k3rgsDJ5hpR
	 ic5QFK3H0M0LH63H748sJ3kUBLwPSZmntb1MVMb3y1zQUWJHipz3fhLIe2YaF1ODT8YtI
	 KjAjbh1+TC5jevSZDvvxDOesJnZRET//D8NqHxUxMKVeZN2ZoVDmVoCJXLilwOTrWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=726kVL6F6TcMsPO3zHhLa7Egh+S7OR+DlorMBz5s0zc=;
	b=tzd2Fscdmj1vz38O57O2DzCAA+ZXbcWXa3lwpT8gNqC8PVFMVD9wNrWvWkxWqHZ+naPD
	 acH0LysvIRRvKSGYLmrSbF0nEu9o3/8vlXkw5ZvNHdqkrwWdBBJflho/7xmmZQg6c89Df
	 m3G8cF3Llr2HYqekYfndXRI3zyxannyYNPJRelxLSvJ06NJoMXNwIhjMk0PyZxJSn7KuJ
	 ULLW0ybBH5uADd2J0PsQxLcmYGm5s5MDQkmijzXrK5mVLIHsJQvPuolv3cNXsabtRrR3q
	 AyXJmCQW+KjXJEZ3AjU7LEAU3W9+ZSCuC2j/zldXVV3KjuuQ4O/wQhp3X3mDYG0ryUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD80inq1;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070E606A332
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7070E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD80inq1
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso16148415e9.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216660; x=1795821460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=726kVL6F6TcMsPO3zHhLa7Egh+S7OR+DlorMBz5s0zc=;
        b=oD80inq1OCi7sES2mZDguKm7iyjfIQpmNo57rsodReJicMZiMJ6FTJg1dEvz8vLIze
         Iy7ugQ9nzgZFaYlcarFHnSoY6M1asQ05+hnWEjOVVAWuLGcA72nzo2Om76rkqGpmFxZ8
         7jU8oVXrWNa9gUvrdtwjG9aDYv7MEv1agucz/fVVZnyDF7DyyZeweEg9XEacOHHch7hu
         NYKudRf1jwDyP8HHjL824XRBWRJXj4iTPzSmVcj5WCQElNJXKXzHOvWhzU4wfIjn8xCi
         XwSu9OhPflwp2fqeB/NNKfXrDUD5VheszfxMeFQQYrBPKaAoV0EnZDIZM0LAGfqSL7Oq
         PxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216660; x=1795821460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=726kVL6F6TcMsPO3zHhLa7Egh+S7OR+DlorMBz5s0zc=;
        b=jbm3xKPxJ3QcWxasvuXm60SNGX3jKpxRLKPR67pUDF4SpMd5uOAGl1rkwgilNLJPb9
         mvSutl5S9b6p2XqFaOgWWBAwwkNzUwm1TMpQyzWAxMC18pJ/3F/WyqJ01Zzt0MUGd8IF
         fS9kn1m6eIa4gRCLeKh+TFvRzR9D2J6WVTzWyB0ZqLVJpAWA7XreD4BHehD/9YDAgeCX
         EqCD/Z0UYMqFZc7EWKIpWEpHrUvxfDD0IcYJlumnvgBulgipOC64nwgyD+iHoF7ACHru
         gs5wxBKiLr49DaLd0+QtZD7XkxMjv51Yh4+fys9uZcQuZ5Nme2TsGix+ze96tqYG416s
         F7/A==
X-Forwarded-Encrypted: i=1; AL+hErFaPHKSguRFnkfmQLZQSMDhxPp1jMOS1W3Klkrsi2CoX4a9KppWd6JWR7QIGjFADr/R77UCvVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I/dbPEVSjrFg/iKU5RrtcyaNYno3s7l8FaGmVez5qbHkOv/tX
	tYlXDmcuVy7ZodBRUcjKH2zaTO9xXk+W6io9MWky85YI7J1neVJm2Egz
X-Gm-Gg: AYBFou0wQ3K5B1SWc5wqKjvYPFym+/AH62W1LIw9Q5frlyU0ostYMUEwXwe28L+FpKO
	gwilxgalGdAccifkCjpvTlcfAIe6XtJkWJm12xBEVGeOKo/UMojq1ZbFxxnl85UUG22zex+JqyF
	XgpB+aXb6rJvRkyPclsFAbvKPdXb8QRYe+Xb7bjTSe9QwPjIWblNX7Kdq7D2q0KJZ5zzEEqssJo
	yfDd1PpLiDaYPtil73lGhPUAvsG5EvJwUWN/ojSXuL7mg2IhQ97ECHp6zWjFq1uzKi/XDLtukZH
	He8NbKOjKjPs+xhQHfLSSzfXXAz4AyqCI0x+ieR65LpulY0sfDeBGx66C8ElwFXDNA/SfkI63Zg
	CfXJN/jTw/DdYi8tjngf0uPUbIvVbh/5CYLA9R/NCpMYwRAuniHfReQpDI8L7P9N8kbTbYDOKyg
	th+beJLOffRFfU6c5CrnTQr16sKwuZcf4DA7FkxLAusR8deMytaM/4ehdFZGnmgM68E3lKgWWVb
	QHOFoN/gaCNIX8Qm95MSQ0cMlPEgufOCyaT8G0tQv6REZJUnIHAhq0CkU54QdJ61D5Hd+Nn/ppq
	DPNOg1pcBaurPU/s5Cz9ggmx3SQaXzCFyfD1xMHjTgFMpybLvu1C4KgpoD2HB19ANKSzBiHT+Lm
	nLhnKJRxW9/h1mH5pz6SIZHSWitNz9dKZcw8=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr101689825e9.2.1795216659651;
        Fri, 20 Nov 2026 15:17:39 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm151650265e9.15.2026.11.20.15.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:17:37 -0800 (PST)
Date: Sat, 21 Nov 2026 01:17:35 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v4 1/4] igb: don't touch rings that don't exist when
 disabling an XSK pool
Message-ID: <xupy6jbpnziq2qji54zjbvm7neggrwkxg3sfrhlolmrd6ysifl@zptk6ynkbu5f>
References: <20261120210134.133238-1-antonio@mandelbit.com>
 <20261120210134.133238-2-antonio@mandelbit.com>
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
In-Reply-To: <20261120210134.133238-2-antonio@mandelbit.com>

On 20 Nov 22:01, Antonio Quartulli wrote:
>xsk_get_pool_from_qid() checks the queue id against the stack's real
>queue counts, which can be higher than the number of rings the device
>has: on 82576, enabling VFs leaves a single Tx queue while keeping two
>Rx queues, and igb can fall back from MSI-X to MSI with a single queue
>on resume. Disabling the pool of such a queue, e.g. one bound to queue 1
>before enabling VFs, then passes a NULL Tx ring to
>igb_txrx_ring_disable().
>
>Only disable and re-enable the rings the device has: skip the queue if
>it has no Rx ring, and only the Tx part if it has no Tx ring, so that
>an Rx ring using the pool still stops using it.
>

What happens if a pool is bound to, say, queue 1 and the socket stays 
open across a runtime resume that falls back from MSI-X to MSI 
(queue 1 becomes invalid)?

If the socket is closed after igb_rtnl_resume_task() has reduced both
real queue counts to one, xsk_get_pool_from_qid() will return NULL for
queue 1. As I read it, igb_xsk_pool_disable() then returns -EINVAL
before doing the cleanup and resources get leaked.

I may be mistaken here, if so, please let me know :)

Best regards,
Janis
