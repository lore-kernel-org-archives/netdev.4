Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773589;
	b=WjXBXXJW3nOHkZo552fLt77ozNuWCQT8YHFwKGF+kwQPmsj5DgWrh+5EMlVg0TPvtJiJ
	 XTiw1oEt6xZaXB+zDAj/3wdgOP9IIg47/y4FDeI3APm4GK5ArpBgQUo4AmB4oCAUp7dTQ
	 j05yEJsB4GRAYBdEIGKhVOupHwp8hEB9P9/lqOPrY5qtx9kRBCaIPKpewpMnwYbTleJwX
	 /GUuOxMCnuS8gowPt8XwfBL0uNwJuR6isF6tHC7Ox2TWmMa6FHpnn0YiYl3oFjtU6g1vd
	 VWZmP+ouM9MiIyLShsKh2aj1RIvLl0+AfPa7L7ByFrzzxkVEcPyKY8zPnoJWs+mTTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
	b=f3sVPiQ50DY8D3kqP7slJ1T7YC97ZdxVslm0IqKcPS52iLw5aZ1UXmopX9VDHyAl/aRa
	 Vzv0bUXv/vL1To5DAT/649Fs+XCU2c09+r+W8IdBjD9ygvhr9M0FQnig77d2qTJlXVR5C
	 vlElSxvEdetuoG5kQFcv0fwyPOaMt2jlcCHtYOq/JbbhDp0B/co96yvdSqzmVzs8zMBz9
	 b3OKH61iXx/1gs+snkUwk6W4lwMyCcjZTIHfXNOczyX+MrqWL2MCphxH3EVGH/I+NG5Ho
	 F5JamZFnkzDnzdLYpVPDsCrsD3cZ6GHzPxFyN9PJ8qMr9/+0nxqD2Qx8G5O75jjL9lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1yox5AY;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED448606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED448606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1yox5AY
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5188e4980fso408775866b.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773587; x=1796378387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
        b=p1yox5AYNN2uipZQJnbpRMDXSaCRlxjVfqocWix9bJXh6U29ZRSWOk6AxAz2mejS5g
         Ev0B5+rw6V4ykP9QG+hqKg9XzXbvKqUQ5G51RFNj6bDS8STlvTtBldjL7ehBF7MbuhIY
         a9GqdncJIKydAShBiTz8UMqpgoo6gEsHwRL1OqblF/JTxQ7E6luqB4lwmU6tmLaotuHd
         ltuefe8RBlTO+xrsLjGDFpLYkvQ3/BAFdPYZMlYFKQToKxM0q8x+KzDNEODB4sePc4ag
         bu4bDv9TIAmAloS4bcxC7WUGLrxQGOAZBL8Hs1cBRPFatTW6X0YrKjSbcGLNTcFAYNQ9
         uPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773587; x=1796378387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nK6oALc+naSloQwr+O6Q/o/NLhG5dNIKnSetmOiKA0=;
        b=1p7IqifEGjVdmseuJrWreVY0V1gx3KLgBx44e/aCpvmf/jwRfbDXVJ+/xSEZBLVe04
         veimWzrouciqI4BhcI4qY9eV3gwpryxO56JUAs0wwRa+dxrb1rkOi5oxPMgFexBHFkRn
         etXWHStiNuE+nqRAjrpcw3F9L86Miew9gWAJGJnJ/e2OyIGHw73ox4ZFrHOtpmcQjKcp
         YnnpFNs2SaoMyy6Kcsv0myTOrTCjjnPuFCxslVk/e5oL9WC6YoK6Ql5yF2afIGofuNex
         50v29nORKifjx1AR7rbgl/TbsLCbERKNhKPBpo1VsvfHbFpgC84T5gqAMczmP+Ty8yvQ
         ypyg==
X-Forwarded-Encrypted: i=1; AL+hErH3hFBysyIQBUKIXUIZMoCSWhPVdx8+Pvf7ha/tGFeUOoLmYR1bEJaL3EIJZiMXZohm86s4Xjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jrE2NwIE6s2Hw3qHAVZAwoZ9Pd8gTUbrE0MoDYaUYU9DSKoYn
	40/P614vV92j4/VqrTz/YrMjWgKP8xMnmRg/BEwJoG4X4x3hTXVeiezh
X-Gm-Gg: AZFdTZdDc+PCEPlQABHyPrMmii80UsDf5QuNOgCYox0R/glN9wArocbvXnHIVR4PSLT
	ao/6DLvvCFP6zBkIV+RzasWG7rT1RBLsQQQaaejr+576zP49hublomm3Vn+AmzYa4kVFRTvV30X
	qfxppBdNybAMxA7UqrjogqOHGB5uELOBtS7rseRCY2jMjsrNbOhcp+uddysxlFKk87yl8YmHLkD
	nqU9MyO4csbveLPGlI60jW4EGqtPhccTsjFvzke2OD4jccuy4Wd8weTFgkRgNHWf3oDhCMCqiK9
	5YUtNn+JPbUUqmUgSVCQ5TGjCbiMHjb0c0UDIiD9UU5CsxENPUYr0EwIc0ClANerdFSm9XlNe07
	wLUomcIZBsnBctb8NVsi9PSA/UsLi5Nov9Qac4xB4p8IQhGW5Z8MolSRL7O9vaxxUkcnBIeQ1aF
	7ZIbC4c+lG6GlhArWuJeNrNEVFTH32x1fCX7sMVsCvFGIjjYiRLQD8swhLefqoWPnKSS4qAnVXQ
	if71pEW64vo47s1Bd69+J9xoPfHO3mNd68J/2AjfZj9YUow4zO01INgG/wbgDaTuI9BoGcV496b
	yBMYKmQW48bcRgu3xQRl3525/J/XVVPa44iRQFy8Wi5DLu+B
X-Received: by 2002:a17:906:7944:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c513a41edc0mr2010416766b.5.1795773587030;
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm841249266b.37.2026.11.27.01.59.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 01:59:46 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] wireguard: peer: free packets left on the per-peer queues on removal
Date: Fri, 27 Nov 2026 11:59:43 +0200
Message-ID: <20261127095944.17844-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179577288773.3135.10772290029017294104@kernel.org>
References: <20261126094722.73025-2-apasichnik9@gmail.com> <179577288773.3135.10772290029017294104@kernel.org>
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

Sashiko AI review wrote:
> [Severity: High]
> Can this purge of peer->tx_queue run while peer->transmit_packet_work is
> still pending or running on packet_crypt_wq?

Yes, it can. An encrypt worker that the second flush waits for can queue
transmit_packet_work after that flush has started, and then nothing
waits for it. Before this patch that was harmless, because the entries
on tx_queue keep the peer alive until the worker has consumed them. The
purge breaks that.

> Would a flush_work() or cancel_work_sync() on &peer->transmit_packet_work
> before purging tx_queue close this window?

It would, but the tx_queue purge is not needed at all. The leak I
reproduced is on rx_queue only: the transmit worker has no budget and
drains everything that is ready. So v3 will drop the tx_queue purge and
free only what the disabled NAPI left on rx_queue.

As far as I can see rx_queue does not have the same window: a decrypt
worker queues no further work when it is done, it only schedules the
NAPI, and napi_disable() waits for the poll.

> [Severity: Low]
> That makes the new comment the accurate one. Should the old comment be
> updated to match?

Yes. v3 updates it and says why tx_queue is left alone.

Thanks,
Andrii

pw-bot: cr
