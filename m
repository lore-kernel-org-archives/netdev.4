Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939375;
	b=pvOee/gHUP9pqJnZj7LdmWMDGY7sO8obX9qkEZHAGN8YMjUvP5KJUk4Yq0RvHObiIQPb
	 1Splso3E/RZgtPpRQC9qBkDTafquRwuI6BjYEasw0chKxmaPAe4jWJG/vbkMZGyEL3tAI
	 B2ugtcR0RJsHxEfQTNKQju3KWeAB1T/1a/rc3s53mJgHwRnW76IRGotODEomJv1mLGgS2
	 XUp0Kq2FxO3ioUrjNrGjEaVKA7IJvhh3XwBfxhrK13g7zXqwhQqMloeJS65zBh6SMthVU
	 HTOlCxNJAQOUTsuzhvb+BuLX4g4x3HeMT2ooXImefYu2FLDuqR+IofgSx3EMYc0gfQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TUIrBrOTgzgmyk6kl26pUhy9DQuBuGR438tBzebx9QA=;
	b=a/oKW45Ao9N+df2YnmAZSllPzSWdLRACeXbWmkm1HaCNTPpJnj99yEXBwO4UOfoDXl5k
	 Vv8TTucleBRhBAcaCW/rnJntVJMlfxb21BwLV9u8sc7s4LfbBHtLzHg0RvuOVBPOv71gp
	 pEpR6YivWblYZ64c2P4Q+55zxm3Kq568KzCDvWplbzIhGQsb0yDyU2+LPdx/e8Bl3J2j4
	 N5C4zdCW3OYjK4PATskPsdX4BBL96OPoaKpTvGEwX+Uyi7EruVpDQAib/wB3W5BmM3HW6
	 rNRNtvPpuPIWhuBo5pBBmuY7lWEeMxXxSKsaa86kBpNbF/mMgrIBp5I8/83k8zxjA0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ct39gTeO;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8F606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D8F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ct39gTeO
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50e26763a4so382596366b.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794939373; x=1795544173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUIrBrOTgzgmyk6kl26pUhy9DQuBuGR438tBzebx9QA=;
        b=ct39gTeOPqqzNOu1cYN8qIqrSWum8W/cRJTuXbyaGIoTF7sPfa/apC2s4M8rE0OAK8
         A+23IFq5nG4K9NSQb+30CqQxrUoa6Z/gfx9ESzldcPZDqSA9ACPlIEaqUp2dtlH3KIZg
         C1yLdyIoxSXcdnIpaUMXjxm1kfIf9Lrxbmg11g09hy6tOAfzDFwZvEDvslQjQxNMX7a+
         Y5LUiAzzR8UvT29CU0qIIOzqW9P8dxRPw1c/l0+nBikA+21HeCEZ9xk5B0ji2WgdaoIb
         GTgVsCLIYsdzFGUIeJP1n+LmEt80jqvkrdTxId/AvCFMTWOSZLQshm8XlP8QhptUDtzI
         23CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939373; x=1795544173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUIrBrOTgzgmyk6kl26pUhy9DQuBuGR438tBzebx9QA=;
        b=RPdNjPSLKW3gO2kOduJ0cK06dOYrftMgCN2KMjSdiZA4wVjBdZ2D6dOxO6yfzJUj66
         tumhA2dykhNT/Z6DUjHw5kZ0kAGfsBit2cvWaimz0EHLtOogTNhsisrP4tZIDPY3AvxI
         VouHv0dAO7vq534aJXkj0j4Vtf0aDnbau5cy8jnmgHsTUP7SkaC2e8fySxhIpHk5BAGd
         nZX5MYuwWKYWDOLZy8DOP6iBv8Ol+UvXKFycojHz/+K1Zs9TPrombrDsMdG8ONf6TAk+
         4e/TfF7EqSp/fSIpxQjAmYcvZ6KXJ3sVG086/+k+b+RxUsxdW9J8ki9ZynJVdHR3LTym
         Q9GQ==
X-Forwarded-Encrypted: i=1; AL+hErGUpt0A8h8yAyDCGrZioQeQyYcyBlQ+rz315aDUkxNLZoKAhfUOtPhNaME+E5ZSMwuX0wJ7nRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F6MHe/N2P5/1NDLUYuaTVwuzTD8E0YzQRSrjKhxv6Sva9Bt6i
	ZDk5j9/OHIAms8X804arQIlyjf7nHTbRMJBW9yQ3FOdVykV3EDk2G02aug9Z1V6HV/k=
X-Gm-Gg: AYBFou30jqfWyq6FkLfs09ty1zJSWZ9M589F/nkb5BqIeHHTafNy+xmf1a/h2BjPG+D
	W4zHXNHO2QpV0jOTi1is2f92fThM0zWNtL69zSFQcbP25H/oqPzcj8eweVDdXT6vlcAR5PC07/+
	m6T3JASIVYHB04gwB1jN7f2UNqXSRwUvdAUORJ2/ySpD66tM0Xk0ynJbnmfH56dL38crC7G/+pn
	bI1fZvm2xqqvfov2x76NQTWkkgBwwx8iYUqTBWlXRN4E3TC5mjH5X2Jd7RQvBBML5vvIiL7QsAQ
	kTwRgcFaSG188p4jizjn4S0lF07V+uazWvwY00QUFLnoNjErKGdHcdvDig0oNbFKG7/DMAJq484
	l4djRfOH8JEBkaQkAWVwi6W3sv8bZNqPSEJGFmgmin0SsCn1zYrG1FBWxkzJ0e1AvofEFmBP31/
	zy0Rm+dz/ECquul8TArNOlqC+6WzGbL/4+2DFH8RH9YHMUsTLomnb644FfVSDtL851rGrFph4X+
	+4G4U8B/iktzmNOhgx5SoVNZRuLB71CMiMXn6BwBoBHfPVRNwKm3xpzYfffgAuh6ajgm7ngl0i/
	CGhAe9FfiH/DXqWLdXqEXAdkp8PcwU+TAi6fcyQSDx0XL5M=
X-Received: by 2002:a17:907:d7c9:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c510e58731cmr7270066b.48.1794939373210;
        Tue, 17 Nov 2026 10:16:13 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a7d7b2sm93434a12.6.2026.11.17.10.16.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 10:16:11 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	=?UTF-8?q?Jonas=20K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net 1/2] veth: wake a stopped peer txq beyond real_num_tx_queues
Date: Tue, 17 Nov 2026 18:16:05 +0000
Message-ID: <20261117181607.30219-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113104648.225983-2-simon.schippers@tu-dortmund.de>
References: <20261113104648.225983-1-simon.schippers@tu-dortmund.de> <20261113104648.225983-2-simon.schippers@tu-dortmund.de>
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

Hi Simon,

On Fri, Nov 13, 2026 at 11:46:47AM +0100, Simon Schippers wrote:
> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")

I agree with Sashiko on the Fixes tag.

I have reproduced the stall with your script (stuck after 2 cycles) and
confirmed this patch fixes it (all 30 cycles pass).
It is tested with veth from net at 5e9b2ad9b838, as a module on an arm64
VM with 8 vCPUs.

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
