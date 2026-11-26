Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705727;
	b=Q3VSSS3gQF0e+ktqJDFEzpgC7UJ2c1jSdhNa9AqJfCH7I6V2y72kfwoednP62gPpv/3k
	 cmKZPnbJR66Fdl1/7bTjQcmyfZWI/d9fLZsieHqKHbwsimtr/XRFZlV00UYbMnwI5mZYr
	 Ez9qz4LVHN5kkeC4fXPSAIthipRi9tDEr0U0Conhnc3Jq101tf8JK5kkZi2sV/wR/rVZy
	 nuWT9gJt0ufgSZS4MUlqnn4Im55PbBYvmjXxjtM8/w1Dn1ldhTWFx15qauyq1UJVpK/go
	 X4yZH5DA8Tlu3EiGh5SrVJkNikZSkG5V+pIxRhYJtLDiLp02cXI6Xt63q/uf1nRYEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705727;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
	b=N2y1mfRoVWA4hxFGJMkpOv92ND0x0e2y10O8j9uMwla8qZE0UrheJoCHd+PGfvS9g/UG
	 hvwJqR5uy3FUJptKzIVmRsN3WKtF7pLRcLAeboPw9yU/KwpvRt/2znGHdt3gxL8febzDs
	 ddxb+pl1wMEmiuJGnxXBYyi5A3v+nB8EG8iPx5hMpfwCVLmqWy6N6iA7w3jR91Gm7R6Fh
	 Tx5ZGJkSQBgtftQKRyINpovXOm3nlZW+PNwSoWlS76oCHIVOjSV/1871og0FMVEGAgKjo
	 LtbO/DTTUslpjfTWfx6ki02MK+fVhMXZ0W172CCUIUoutw7pdehHGf0v2zfPENrYEDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETdGhMay;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SXi6Cb+4;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2239A606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2239A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETdGhMay;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SXi6Cb+4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795705726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
	b=ETdGhMaymPA7SUHDBQI0h0dE7H4dMnT5oWXzC+RXyhoJFAkMJm8VE/QAXI/22vfq6b8RmU
	P6NfriA6h8ak89g/qF4OTjOyzIW0BfAvwZz6K15VD2q6Q7WhpC59XaN4S1lHhLLRP1euvP
	vEPAoQ/0kNH5hBEyaJpu/CsCiSz3LdQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-QB_Xy6AQOYGnXR-NmOeWpg-1; Thu, 26 Nov 2026 15:08:44 +0000
X-MC-Unique: QB_Xy6AQOYGnXR-NmOeWpg-1
X-Mimecast-MFC-AGG-ID: QB_Xy6AQOYGnXR-NmOeWpg_1795705723
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso50290455e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795705723; x=1796310523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
        b=SXi6Cb+47k2u/io62m21RXLIgSH7rvahqeIYawltcordUxlVI/B73hEonBAkA2f4wR
         YyG5cC+It/NKdyz5BIknFUdDvPSJPoPsmBRNEN76VZTVeKbxjjCVVSpCWmu/hygar7GY
         Me1rlygljjzwq3lkGyFdAAus7ylxxQrLU9Wo/FOQ2twA4vevhXzD0nw1Za7cDLGCDnfO
         G2NAUBZbLYmk7w8fm+/ynoYjVKWySkDFwHkJNXKjm6kPlmbyYguv03jJ1RFqZf80dj5D
         uBrqgWbb/xRWu7DcdC/O5bfM2Qmf1biz/kzH3YBygIvLD1L2aUHKvoF9tnJxEaHrdvSh
         Y1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705723; x=1796310523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNt3KV+/k4qN5uTRrHg3mu6ikRqMaMAV9t3LTRqvweg=;
        b=A/oFVWaXmUAJUT4wGsTqepMkc2+zbDjq/TZGgpfmda2VB3/+mAAwmSmgDHQfGmsqMe
         PiHI4H0bKYT02jgy9KitrbGZor4Chp5Yw2JAgJLdavyAtkpD/zpVMfOXyYBHqyMCvA5v
         pw1Odz7ADtbBCY2CzEvtILIrnENMESjw2X3pz1+N7BtJSfhX846splVKVik8a2Vq6JJ6
         YGSFwI/eiZ6QGYGuvvIXRZslYr1lRG0LtJwK5CMmaIEu2WR9+cqiOQI53Qx7HFRbwvVd
         AOpZyjPwBnsjgJfN07fP//MAJE4A1zM0WtHD4RAyMjrpl0HUw1B4M0LXY5Vh3m5yvnzC
         KnzA==
X-Forwarded-Encrypted: i=1; AL+hErEXEVq/2hdSPtXtagsyWmFCTofIJw6Yf9DGJMyY3J0Bj3dirKKbJR5JuqU16JmlZMjsMgcqmqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D2HIpi1hO2op/2VwXZU4UtPydSmy5vPTRSeMiQmxS+mGZLSjV
	df+G4+VQpQiD3/C/2XRMaAZGe41E8nG1pDUgVWSI2l8jwN7ZzUvdVVfIucve3bZPkhXtofEF8tB
	pN71PPiAaAojzWfmpVBeHLehAi+9GaNN4/eZstnxtOQrJ/hbZvz3bBqXASA==
X-Gm-Gg: AZFdTZdstnzUM7k7XZqcuEZX04rr0H7+jQwcPQ8S02cnQqjVhmZpmmvsokjn8b8bXyM
	zyd9yX61s3Eah37h0CpR9gyuhiMOQk9TFTqZqWAwrL5cpbqbohHpPLIdNVbGBQyeYD9TyUR5XLv
	fdxLS0uSM/Srd//nSxesUq9WFFS1VUP8Pl4zYvO0Qhmo3ipDyJ3EdvRkzFZVRAsIgpG/vsmIDYY
	VrJOjsa4LwcGb6A5+5sqH5EDP9e7JUS9mIYkIcPCnr2YBkOlXFslOX8yrQ9D3TAqF7pO7Tt3CcI
	i2OflLuz1IpxRtGX4g2dYx1aPTbwnzdh6yfB+oRklhmeQn/5YIfawfzeG+sbtiDiAWTiqcjY69N
	4k5y8AvmufxuhbM3kOMDKfHJASSlQGpGKxky5yjqcaEd/7WEzMWPFTKU2+uJl1E0Cryb/5iPVyB
	OnlMn5VkMc9HX53sUSKcjVorAQEJ3ssiZq0thrymv84pbM
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr544861335e9.15.1795705707139;
        Thu, 26 Nov 2026 07:08:27 -0800 (PST)
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr544860695e9.15.1795705706702;
        Thu, 26 Nov 2026 07:08:26 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm33713793f8f.35.2026.11.26.07.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:08:26 -0800 (PST)
Message-ID: <9ec9f5db-b550-4e34-a299-7c45bf00ba48@redhat.com>
Date: Thu, 26 Nov 2026 16:08:24 +0100
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
Subject: Re: [PATCH net v2 2/2] net: net_test: add tests for
 netif_tx_stop_queue() trans_start
To: Curtis McBurney <cmcburney@telcobridges.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, willemb@google.com,
 toke@redhat.com, daniel@iogearbox.net, almasrymina@google.com,
 linux-kernel@vger.kernel.org
References: <20261119141633.3118789-1-cmcburney@telcobridges.com>
 <20261119141633.3118789-3-cmcburney@telcobridges.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119141633.3118789-3-cmcburney@telcobridges.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 15:16, Curtis McBurney wrote:
> Add KUnit tests for the txq->trans_start handling of
> netif_tx_stop_queue(), which dev_watchdog() uses to detect a stuck
> queue:
> 
>    - a stop on a running queue writes trans_start
>    - a stop on a queue already stopped by the driver keeps trans_start
>    - a stop after netif_tx_start_queue() writes trans_start again
>    - a stop on a queue stopped only by BQL (__QUEUE_STATE_STACK_XOFF)
>      writes trans_start
> 
> txq_stop_keeps_stamp_stopped_queue fails without the previous patch.
> 
> The tests run on a single thread and do not cover a wake that races
> with a stop. The previous patch removes that race by construction: a
> stop that finds the bit set writes neither trans_start nor the bit.
> 
> Tested on UML with CONFIG_KUNIT, CONFIG_NET and CONFIG_NET_TEST:
> 
>    tools/testing/kunit/kunit.py run --kunitconfig=<cfg> 'net_core.txq_*'
> 
> Claude Code (Anthropic) wrote these tests and this changelog.
> 
> Signed-off-by: Curtis McBurney <cmcburney@telcobridges.com>
Does not apply cleanly. Please rebase and repost.

/P

