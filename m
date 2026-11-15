Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750566;
	b=VhtNDQq1DNP7CEcCtcwXA71Pi9SjWaREkgvRdiTxn052vNBaINIDFsPFPQ5UUGf/56DV
	 iu+AO6pDV952a02YGmacM8pc4XM9G/s//GPQH2TYWaj44Ja16Lx2b5X8XvHKUjK3nCh2l
	 EC2uvfy+SkGwfBw58rqn1/ygjNtZpWHSfd3UGUST4b6uaafQ0qquVcTOVynv/G7+7U41N
	 zgi+AUYm1BVDFECWo67hXtkTZ2zYYjKX36asoXewuWL8JZ0HP+TYTGEuxxlxlLcfBQc1k
	 ZKQhHVeUypP9KPyvJZS10tZ/rj8gLvrQH0xlmW7fDtxeSXWK3+JWUEsze4luT/7QSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sjZ8k8T7PvKA8j8UcuMcMJQ9cW1ScO0YNNkYRf0WN3E=;
	b=fEd4zCKvl3AMSzU0vN+4nnpdwwd3naPX84KV7+wO6dLiOJN5PbO67h+UBLPCtyUV2WFU
	 t3sTckRwOsWDssHoxAMtPKJalbjpbaXKkIzDGJ5IH0nswYZrEOLaFwh5jSNJ8CT4XA05g
	 aojKhld18/Mh9dGH3scwTxVKLVrWEcgDvVHUiDxKqulIA3eQRs5bmw/hyzpVQL599dQhN
	 6Hp3M4tU02IfrvgT+aCBbE7ZmXZSFRO/jpcDZU+huECH9oi1ghKCb69gZgUnGUWKqws9J
	 yIm8s3TQRwUMNvE289Ms/so5GbMb/k+C+sZexNrwnePeMMnh+QQW3YXFoqX27gV7AFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VinQC1TW;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F206606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F206606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VinQC1TW
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c45551fa84eso523721866b.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 05:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750564; x=1795355364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjZ8k8T7PvKA8j8UcuMcMJQ9cW1ScO0YNNkYRf0WN3E=;
        b=VinQC1TWx0LeaMKDlhsfSpWq3Deuy5SBZaKufwhNgIQ0oWLtJeMyeHHILvP1ivt8UD
         bln7itfhJ5aoO7OLEJeXYYMrUksih944swOijz3EPPm0K3lka/j+xRPC/kC23zhVDmro
         qfPZQg7YhqQI8MZqnjDOS2o+aE3XeJqVQVFIe9YIopzgV5cG5SrnxD6G4kCSY4Y2reL1
         LtoG6Yp+SVDdE69z7mwByH5ltzVhcMyJR5tGzJaCh68cLCCJhexjDpmez9xFf5vp8E43
         6Ij6eYpigZc3No3Imr2OAW8Nd+jTzi6LhkvdBAvTB1aeIvjmGs3wuLeKfuCGGqZuUV8w
         /sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750564; x=1795355364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjZ8k8T7PvKA8j8UcuMcMJQ9cW1ScO0YNNkYRf0WN3E=;
        b=Jaqm1QfxsupR+Lrb/cwbIVsm0drSN2prDkZT83b0Pms4bxOgjpsq3zR4MIaBhdvV/6
         CaxfR3yNrFM8R3yonHcf+uzUsboyPKCoDAtDMQOix1ojNaZJjjcIgEJPfxXXRA54sY9r
         E/XPFuyvw7gMkPVcBj7yLOw4osEj1shQBE0GSNs4Z6DoRPOX4JoRxgAw1uaLyoBeZZN4
         TKN/BqtGpydRGRtxwCEL3LEZnDcLyK21e8691APlBCGzOImhWNyA62JE6SOl/lzX7RUy
         50jQBQY8J/67WqStVrS2FtOhCZr3NQtRA/oDAbjYMYd2NMo8s1MT6Jq/msy51ACb4ION
         0TXw==
X-Gm-Message-State: APuU4Z88oAdmHHVJtcPHA89gYNadPuyVraRWTniLkjEFuEEnFhWvE2Dg
	kYkeIfi3LDB1gLyBQXdy0/xEyxWvjpNYNBYwB7ZaJ/kCG/d+xfEK1o5DsWO9tYzY
X-Gm-Gg: AYBFou3Y9tMZKJYu2VvJKIM7PzOBiQOqgpoNwrP2bULq2s+bUnBMLEVEAImBjRjL+VF
	OeKf7r/TcoSEcyt0nRwqJZ+OAG0dNYi5jnD4fweWs/mCPJeywUcFR+LHC+rhORZrx9eHb0KZnSV
	5533TV36hw6nNHlLdUEljIlmX9KSEAZKqa3czQ6NjIhchxkqrPmIZzJFhQ+medWLZHcZcWioUwm
	YCGOKii7Y14fu3nsR5ObRQWCVunVo0bxcHn4rXwOjebQaoT9ByVcXQYuTQpRZNA4kIDgHeBz+Gm
	rO7TReyMLR3E4IoVoSO6Qldfvj9FETMJn2hLYNpf0KXcJ382JUQXDx34YoFZO1FKkNm2CPte12C
	lYB4NqcK5GosBDbmDouosMhKmfereXyl9Im3xr/c7cPoGRXjUWdwfNmpggtFhKpkL1h1U2DmIE+
	H12aJCr78KMKUWJMs4b2A/IQ0u9P+Fpt4744VAkYMgyxVd1PdKpg9Yxf4P9PjSkTy9B2ViWutYn
	3D50VWbKTJoc3pL9pkWSZRbLRZ39wdzMAs4X5A4Tkf/0bYmc6kPwPADbaz/77PhTpNjV0Y4axRg
	ca/62DBXy/jFkjoW2Hh/0FQ83njTRN0bIybx27sO
X-Received: by 2002:a17:906:d542:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c509642ad87mr549257466b.35.1794750563634;
        Sun, 15 Nov 2026 05:49:23 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm314858866b.75.2026.11.15.05.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:49:23 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/7] net: bcm4908_enet: fix the TX ring wrap
Date: Sun, 15 Nov 2026 14:49:20 +0100
Message-ID: <20261115134920.55329-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-2-kudzo51@gmail.com>
References: <20261113235847.517308-2-kudzo51@gmail.com>
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

Sashiko's review of this patch [1] attributes one Medium point to it:
start_xmit() still stops the queue with netif_stop_queue() when the
descriptor at write_idx has OWN set, and poll_tx() no longer wakes the
queue unconditionally, so a stale OWN descriptor after ifdown/ifup could
stop the queue for good.

In the case the review describes, the ring is empty: start_xmit()
returns before anything has kicked the DMA, so no TX interrupt comes
and poll_tx() never runs. That stop could not be undone before this
patch either; patch 3's changelog describes it. With stale OWN
descriptors further in the ring and frames in flight, the old
unconditional wake could undo such a stop and the new wake does not,
until patch 3 removes the check and clears the TX descriptors when the
ring is initialised. I left that change in patch 3 so that this one
stays the ring wrap fix.

The other points in that review are older than this series. Patches 3,
6 and 7 fix three of them, and the missing TX interrupt is the question
I asked under v2.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113235847.517308-1-kudzo51%40gmail.com
