Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772671;
	b=ZsFIeIOft4aHhNrq32ZYkcUOu4wrRRt5Zsjr9GV61Yr213so2DWkfRFmCXSmQuwj3NbA
	 FugLCPLbsiKOqH86onulZfmMnWmD6dApDr043hkw/NXLPAUK4UZvE6xdqdLh/TnKlDWdN
	 dUuvlM/XaT1oeFfQ+dGTfDxKF+EBSFe+aZ9ioDpybqb0mfDSlntBLjIY1m+cYVsPaoRfr
	 tp7v1l2Jx6xPKLkvC/M/ptrvvPufmK0jQ/gzBpf2JcvRiKnf++aJjjtMjN0ih+S9Wqn4M
	 QfVm5lGWEDBjmylGcCCoNvvIbibk25SZv5jj7X31qibgydVb4pqSZpmis3z7lBbK/WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBc/0navA/XNmaOJk7fHTE3AuIw2bivnerbrsG3pp/o=;
	b=lrNpg2cnSy4SdsSMXzKCSoA9ZfCr8hHMA+HuzMIlOfLlzidbB+UCgK9aTHF0BpBJLw1A
	 LDOEEHZ1XuYHg6RaCyUtWk8sYigAQky5WYx1WpPlkP0GfAx66dy1qT7WmFEk79hbvrBm9
	 XJwBuQlCxWzmcc0+q3DDp+yData7AhDL3vH9H98yt0dYvviVlycnrQt0hly/jqsntYrEB
	 H8mZBH4uUm4uvG2HXScbby1IQSve3rDRnAHbUNvgR1VP8sMei+Zp3+Gk/uA3C2TAclL+Q
	 Pm0qHOtzlFsnyyR6q/qSHknPBoSGSXn0qg8MbLo+18xtebK0we2ocO3kkWToO+byyoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=x2RNRq6w;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A2606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=x2RNRq6w
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so10780235eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772670; x=1796377470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBc/0navA/XNmaOJk7fHTE3AuIw2bivnerbrsG3pp/o=;
        b=x2RNRq6wfsYCVD/oRhw3e74SQjyylIOlX0URS4iq2QaS74LPXRwYeHSL0frpEKKlU0
         4XR5DSblgtCknocR/o/+4E/bR5Apz98CtOZKJ81OEe6i2Rf758K0jFhACyqHfaUAukDN
         +7hE01G08ZnZX19AKm/WmRRKg/w+M1IWRxW5gUbp6DYdMUEqxELMBMZxnwGrBkJD6Fo6
         aOIGz+2uo5Kknc6Vcg6TuD5wKdUQScG/cX9dsl4i9b/IgxHAivOsHMuAsmBX7PBZktpm
         B9yKvH2RWuC/Jmk7Y/8PWMZ32DJqvk+sUY6n9abuVUVwE7W9xyzFoqj13jdEdYrLYfIy
         bq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772670; x=1796377470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBc/0navA/XNmaOJk7fHTE3AuIw2bivnerbrsG3pp/o=;
        b=EujICtIVDre1+WPpQjJ56V0tHVDHjkLaYkxKjG9JRPFCQTvcreHGIbV5qbN9sGXP5k
         5buk385NajKy/KPSyDpng/0kaiHauRHWMxy5NZvIFvTpEKZYQM4Hl8+pwlzW+mz0nR0g
         D8UzWBmS/vvHWUzIGYXR0TvkQmUSEWEre6BvzyDYjbSIbPGOaiVTOJ/E4FMPwG7AIovZ
         eLepRKNvwqEHkVqjQa3d25r4+fJVu15HrdDDWcGrh0lHFw6HijYTJKpn1grCRhAI/6MA
         maxO73aRQUDjUMHTvXf/EbIlW0Iw8jm/WzMm5QkGZmywtzazj4rjdHKxhYa1zJUWZvA4
         SYyA==
X-Forwarded-Encrypted: i=1; AL+hErGfH6MVMmwgMS2uvgK6NHMUq4JGT3nDdMOaTKTSgkat2FhDkmE7czXbs/OzujKlTBDWZXLJui0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86hkMLaKtG2TXLP89HnfP1GXbJ9RxqH4HfVDnZQJh0ig1/TIzQ
	i7JW4wh/2xenhKyhEE2ZK/MYrYeUygd37pEv30WjM7blLjMKvSK0HxCWzOlYzRT6xG8=
X-Gm-Gg: AZFdTZcO5w9Q+pYtlhVgJKBcElQiCW/R89DLW1pFoaTV+BJv/OLJglcRzbOorCjB3H+
	16uI5P6QuSf8/05RexaSbnNscftSxYkrfIIDsiSzoTDqyVLn0WbbT3VhSoA+LDnaOVkwqXzVLuQ
	25jNvdYqoK/we2fFNnTLpXmsHdoTPQqNtobUsy606A4n5391mHIDqyHEFD+l45z3UyvTDuUm6YW
	3FpDNRQR0nlZERjPrwcBIs698Q+MPxOEAmOr4EDe/Pmcm1vH8rk24X0jQLvl9ZOb9biNqd28VdS
	+9hKUrPPF2doe1wxHQyYdQBsTx0NgDb1rphJjFc0dYNzbmbSxGrPjmZx2A3bIlDpiHaQ5sYNeR3
	7vqMf93Vqw13IgOyFW/seI4XebyI/xU/QnTOmApxcbPbIzb3f2MMj2BZLnp6guI+pOTu+dPZsAs
	5+A6QFr6INI8UU17iQBMhyVh/VrOo9wQJbttrsygoOfDhedT3D3mo0uGUk7QKNfqg+vADI2/Tgb
	lWbayYHjDnTCZcj6e1+0Pool/YmrpKJ4ASVnobSY2N7cHgrCzRlrD/yRqPNpENJLi8Fe1Ri5qNm
	rrKFLd6+/db3XRkxa+I7XlVtHsoz1eITj0xRlWC41OLI8x6G/QDMMx07KNOW13SRTE8GRDXIOJb
	yfyujsjShwCFr9TKAlkRIczgUtIzmgIDTWxSkX4Un92p6Tg0X
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr27832938eec.4.1795772669710;
        Fri, 27 Nov 2026 01:44:29 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm73935236eec.6.2026.11.27.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:28 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 3/12] amt: key relay tunnels on a union amt_addr endpoint
Date: Fri, 27 Nov 2026 09:44:26 +0000
Message-ID: <20261127094427.2962443-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572061610.3135.16297939691113808529@kernel.org>
References: <20261125191450.2497936-4-omar@blockcast.net> <179572061610.3135.16297939691113808529@kernel.org>
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

On Thu, 26 Nov 2026 19:16:56 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does an exact 16-byte compare still make the per-source cap work on an
> IPv6 relay?

No. Counting per /128 lets one host that owns a /64 open the cap's worth
of tunnels from each of its addresses, and the MAC check only shows that
the sender can receive at the address it used. Eight addresses and the
default 16 per source fill a table of 128.

v3 counts the tunnels of one source with amt_same_source(), which
compares the first 64 bits of an IPv6 address and the whole of an IPv4
one. Both the early check in amt_request_handler() and the one in
amt_tunnel_get_or_create() use it. A tunnel is still found by its full
endpoint, so gateways in one /64 each keep their own tunnel and share
the cap. Patch 11 now has a case for it: with max_tunnels 16, which
allows two per source, two gateways fill their /64 and a third one in
it, with an address of its own, gets no Membership Query and no
multicast, while a gateway in another /64 gets both.

The /64 is fixed, not configurable: the cap is a bound on one host, and
a host that is given less than a /64 is simply counted with its
neighbours.

> The commit message only says that the per-source count "compares the
> same way".

It says what the count does now.

I will send v3.

pw-bot: cr

-- 
Omar
