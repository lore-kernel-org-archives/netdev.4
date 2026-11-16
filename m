Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853276;
	b=oHoxKO6kPRVE3xDUvfTN2kvqVEK+wc22PDyFHTRDkWm535U5rP9fqDiOIS/R/mxH1kQY
	 SgZXmLDYkE+2RBFudhVlFGF8KBrjye8Gdf+PM6emj4I1SFrsfLxV1bWhqGAFyEzXqQCNj
	 G0Z+6h9XJC94bVAxURKkqS9WGyJhhipzSiTG/h+Ww7TwMUdWu5b8eibWWu8rcuNd75PYW
	 ijVWMPoft/O7gk8P+08J9vH33kaewhSqImRHVwD0j0cHuVizbgsxAkES7WLAeXqxd78Fv
	 Z7a9LKhUTfYNuwQZakUZoI8aKTCr9+MBDV+38BFqTfVHj/eESM1y76fXgig43KMDb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
	b=QQGHWvGa1Mt5b94Y2VDiC94OGYZS0pOvSZIijrVj90u5ivRKugBAUc6QbwhbJH7QZGsM
	 KEnXhGH748bHBbn32Q7CVGqw9lEF93hLMtnD3Rpib6RiZyLeZqPHBXb5fvrKUo/Y3OPHT
	 05tEYYxOhha3T+swhuhNXRwP8qhhbg+ozZisCETmiT9MQlk7yQ5dvRcMZtVnT+ftlZA1p
	 vQqm2b4P+JQ+e+qgKiGL9lH+0RJt9kPM02nh4Mv6meYvz7s9bP7NHb5BDTw0LeaaM78bG
	 lEqXi+f3k/Zgk+3tUe3tM8Zy7t8Dc1MDuvuWQZWKOCxKgT19Xhl7LG2cM/dG6g4qktQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3JkZ1RQ;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA1606A88F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAA1606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3JkZ1RQ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2041572b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853275; x=1795458075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
        b=v3JkZ1RQEG58gy+eqpxPbxT4r2sOGl+3RM02Ofi2whSprgoglF1t5NJzEdx8sfFa6V
         Y/CwvO/WJHi2dcQl7L143L1IovUE6y9/goX7nZbdD6HmXrv71AVVxOLcPGHccKnPvbpw
         g9BsGkaBia1RGG1iffaOjrKO7wzfmlrR0pUWwnQiBAnk7bOtcngrh7hZW4orFLM+GXyh
         oFR7OnXSA1Kyk1Jk8SaztfuO/ien8ulpHEGVKgVjc9S1Eh3vycBMe/pE7M9U6X9TQUTI
         HJ+l5hcSm27NIv9Pf778NMmhtrIdiGGD9nqKGM3QEisGswQ2XaP2JWerPGeh5agfIAlL
         A89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853275; x=1795458075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
        b=F+hqvk1bcXsgdVdqvvIWAP5sdMFDlu4tY00O5rnVxVq0nBTz2RptuiXwMaFVyZJsau
         HmLJUpaHxSZx7sGG+rgd+0o+FDLvRUOEjClwyCngKcGKDzxCrOOJBRM3S6jWxgDfvF1p
         7fPQzWApFqhnpbPkK+FeYD/voO6hgQkEPDBW/92FLtRJ2usO9NmLqMr6EjHFgwN7BiFk
         hpbL2RWoJHKTtZSK6BOPIkHF+7DgXhj3kqcAmx/kXL1kyTRPTlUG0K/VJO6OoyILb3fq
         /bCXCicloBpoYgF6rD/BkEU1k9aMd8Su+T35UxmNd+Gyc6UqdHZISK5SNi5Ra52o9Fkc
         S6Rw==
X-Forwarded-Encrypted: i=1; AL+hErETe3FvSAZzpYAb55vIUt0Q/Uev81QzbEnzY4zWjV1qdfMBNdRhnE+XEBP1pXp/apAUZW29ZYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vQr9jwzunLcnAKVZgslvJEgwFPcHEmcZFHaXpjQ0YzyWwjhGS
	XXcN9rOceJlIpaxfiyDGRfq33aRdlx1YlQpNNk+2deH7lzQ2M/tXNJp8
X-Gm-Gg: AYBFou06BXAqZh+zcSpxpq9uqx4zk0LvltjAb7rz9hHT7Jeh3VISWrrkA7fFi8TazUw
	0Rek42HkgLZpOH9ruwBaKKoPZi815ptm2meIkfqWt2PyEzVaNaDgqG4bemdIx78irP+ULFebDfl
	9KMBCdueKe/mnVUxGZgFbV/d9wp2UmrMoSiDWohFoptU+kKnKPxQ6E0H07b2ZwRB8xGPEJDA4Yf
	D1KT5/zPXH2bAC/x8Z8EYheUg+UCvNFKkFvQRdgEyVKpJmTHp0wq6P9pplxGkGW39jVlU1lQceK
	xbDUsMWiI5/CriXRWza3eRVcNtUe9hLipGlH8nPHB7a2zPBrRAQI+vNqF4MBvZE5GDNnXJUMbKo
	VxPuBY4opAW5SoLs1Ox0LboFrQSuleG98W5iTyIx4Dap5pntrWyOzKK9gVptf/tZgDKqcY8U6AN
	PPrdsjEn5GwwYEanZMcsZzucE5xvnpCyRtJggABsRD8XNS6UCWlX5+1xJwBQMZ9pMw0D7njrrf8
	8oU1TjiBvxvf75tyWp5fP3NjYkTRCsuGabQleDidtWfwLZIGD1CwXoLoo5cBHE88jndur5xe9fr
	Opfx2QMcziCXQkiPLYeFfV5C5Q2u2O6Tmr6yAHSo7WrfVA1k3SW3QBXi2ww0ZCmG4VdcqavERg7
	OKqxcHm9tdsx6bDnWQUTYkx2F+12sE30Nq+rJ
X-Received: by 2002:a05:6a21:8cc3:b0:3e2:ad2b:8f69 with SMTP id adf61e73a8af0-3f7a7ec1f78mr9948935637.67.1794853275248;
        Mon, 16 Nov 2026 10:21:15 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde0f3f4c7bsm236378a12.22.2026.11.16.10.21.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:13 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Mon, 16 Nov 2026 10:21:10 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r4-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179456531820.2199510.7014507677375597007@kernel.org>
References: <20261111041904.48916-2-ahmadexp@gmail.com> <179456531820.2199510.7014507677375597007@kernel.org>
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

Patch 3 is the first consumer of patch 1's flag. It sets
force_32bit_access in the typed platform data for WiWi's XIIC child. Patch
1's proposed commit message now identifies that dependency. Other boards
retain their existing access mode.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com
