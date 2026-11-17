Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932186;
	b=TfUJ76+umJV6HnDmE/Sr7AevAKZCHHKwUcOl2PkHwtmAMJulXBODHNOMoTpqZBNvjgAl
	 UsJMKTvM7sKXbX2+7LIVw72fi9SvkEDgVkeVRDZAIFt+H51DVRDCc71+q9jJP9LcP0Xbd
	 nU7WNDwlr8T1WyBVxgctb0KE1A6nC1lZOADvRoB/Xzp8eYgV1RMVefoD41iXsrR8VpSdr
	 InMRYlmsEFR/L1/5PL8t0qmOZGZdWrNXSQV/go2Q6viX9zU45H/sxxzt2lr2MH51cdr0P
	 rhy3/5YthRT1MY3qSG+9pyc6QBkQ+bfoScbzmLwj4myyfht4gxqKegquMIjwtuqO9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3epTVbKPJVG8iTt/z4MHuDPL8RwQKn3lHAOFYRFX2uc=;
	b=Yy6hQpsplI07DmOGArLMpMpLMU4LRSslQVNr9NVYr8SclB3ZmofgiRq/S9GWsbcfckZv
	 sih8wmdcX4rAFc4Ig6xOC6f5Okzirz28Oklu78OCXWAtE57jH5ZygSq3zXSH4toZWaQW8
	 mOHHYQZp05iouTqDkSj0u0FSlNDAGA5fBb1p63bTVUUapcssvBKaU/on7xnFM7oyMu6tK
	 9Etpb5GI4oSyK8eX519PbsSVgsS7I9avNKrfbjcb++1VviuEjnWZouWNQPqoJe5vrTtWY
	 U1G2eacQX3cu00DtRtw7ppNYPHNEfc6YsJlYMLHj8IG/H5YNzlg+O0zf6lk/Ov5Uyrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UpSR2Myj;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90750606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90750606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UpSR2Myj
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so5940433a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794932185; x=1795536985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3epTVbKPJVG8iTt/z4MHuDPL8RwQKn3lHAOFYRFX2uc=;
        b=UpSR2MyjHvrEaRxBPQUaVNwY5hXBUuG7pyxygzHG8O1OlkFcTtvImstuQRqRpLBA4r
         d8ujp2NOgvsfRkCgBHT99e6DvBL3yjoZG+IRzwPN1ecpq8Zu1gziqA/LJJbKmUU32L96
         +j5J/XDhamhmyebOPpBG6lvLVHypiH9s5zxH4yI6N81cQPeunv+Y+9WbmyCs01sxiCoX
         E93SVwIf7wxbx0XWpPk+aocZMK9ejnb/JEglkxAcxqwse1Z8hwdGohRj63Nd4/PwWHJk
         /kSuhuk8KNpLagBGeAGXgI3LSl3mMI3oB4+FQfhFlZpxkA8lCcHoxW090cLST8CcTcKZ
         OhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932185; x=1795536985;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3epTVbKPJVG8iTt/z4MHuDPL8RwQKn3lHAOFYRFX2uc=;
        b=SWb1AoqiXq0d+TFzKdYVNi18seRS6qblUVehG+RBTaZ3JhqV/n/gk2TOY7zJknGpAI
         wbQQiGXF5MlsqEz2DdFbw3KnncFwd4q/85p9vK1XYQGO+Xu61OaER/nUvGqbN8e2kjoB
         7ZHgfC3cAYAebP6Jv5hn61KwqOsqKYHnmSpC7U0xe7R29WLsZEyLhH8xTsUENmLKcKqL
         GgYMG63l8LkGcrf5lDWCbuiN/NjKfMZZw3SFkGGtpCa9JkMz4Tdq4saJK1ErRE0C9Wzd
         RtaOyUbNL+GzKVwB6O7b541DhkMOr4zyLQNaWVVEP+07WUXKkEpO7a7QBgT3dl7kZefE
         0PEA==
X-Forwarded-Encrypted: i=1; AL+hErGV7iCQzYz2KKjrAVAlmgGO0XoY104a3yHStdTI3W6TUgUGQVbjka9ntuvsoQnO3g/4JLFSdz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ldk/IogXvFnEKFDqLdgABLxMW/8prEPXPzpTiTnFBmyQrcvl1
	ZC1QrZhd8soYFm9NvwExnNitBpLEiOoe2ga2KOKzjAub32MlRv5F2OSnpbiBFRrbl5U=
X-Gm-Gg: AYBFou0bJS7dIp923qCgE0yOXaNX1hzfGyCIIqK4rGGaalnhWczINMonNnMTrEZofze
	kq/FR6ZO2ehu4zIzCNiIYusjKa3r9q0Dg6XNJLF5IA8KDYKfeFnjbg5xFGwhmqWbg20KeDxXpK+
	t+uVUU56+JoEyginvTSLjqq53fi/60QUtMxyHezlcM6GqTbZfMY8U4fd6vXzyRHtK90ck7uLTcz
	iC9+nT2mnWDjpOWbJ58OJMPf2rucSC3FMVlUkwWrz/xYIuyIfllsarhYzjHXj1Z328qDzanq6dz
	5Ehdv2wiy3PC4UQVPFk63gz4gMw4rWa6qo6xtUQnBYIoA1uH4Mu0UY8gtg/TV1BsDbJ3bJGy9m3
	TzkVIqH0oR6CcD9YOQ5GhG85k8xmB4C/ybO2GbdEugIqB5wrOCmAh62ilgBXVRLIPYMa7UNe5tM
	JR/fVUO/vorW7BLnXMzVWwUX5pTmCaD72oYEQWDpopQZ9p4Ygtnf4Z2D2f5ePWmxcRDts26Y2uP
	+5IHFPKEsRUxXx5Hu/18uLJAnIfM5QT3q5rKnRC/QW20+vK6Yaa91pvyZbD+O3sYNa6/rSl/mFZ
	J4brVk5N6vtnzjlwREUPR1hpX1VvCpuRUhu20nalqM+uw5o=
X-Received: by 2002:a17:907:dab:b0:c49:df8f:3c79 with SMTP id a640c23a62f3a-c50963b88f3mr1191532666b.34.1794932184976;
        Tue, 17 Nov 2026 08:16:24 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab33aasm857666b.52.2026.11.17.08.16.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 08:16:24 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Slawomir Stepien <sst@poczta.fm>
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	magnus.karlsson@intel.com,
	aleksander.lobakin@intel.com,
	ilias.apalodimas@linaro.org,
	toke@redhat.com,
	lorenzo@kernel.org,
	ihor.solodrai@linux.dev,
	tavip@google.com,
	maciej.fijalkowski@intel.com,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH v6 bpf 2/3] veth: use the frame mem type when running XDP on an xdp_frame
Date: Tue, 17 Nov 2026 16:16:20 +0000
Message-ID: <20261117161620.62739-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104121316.1155680-3-sst@poczta.fm>
References: <20261104121316.1155680-1-sst@poczta.fm> <20261104121316.1155680-3-sst@poczta.fm>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
