Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441139;
	b=SyU+YQP7NIc1LzcseTYOgkD7CDidREEo/qmFiEC1i3jpPLEiUPMycCmTGLKE2tvDIUbU
	 guyq7Z9/I+frfdWstiUw6lxbfBVRnfn1mNQo4u1/iKY1d7lrzu41p41P8ggg4J5QihHYE
	 CDNM0j1/LC5WmRBpfKVUP/lkeyVs460FmGMu0erUXFLZ2EkoSYhE9faRUsQYztbkJ+ULr
	 pgUbNGsSzE6wsH96T/NA2POofhizu672ckT7BC8U5giIYUk0IB8yYnGCG6gGfzvgmpPE/
	 sd4+c1U/mQAbCazwvtZ2TqxaEzzfaMmdTlfurnWois/LUJWOEIjnTTDXNGpVmWwz7AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441139;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=weOoe3UVPFg1VNg0H12bkl0NA+1BM9NA6G5A4sgT/SKod11nxPYMCutzQmM2a6QbZ4yt
	 aBKZv9J2GuU6V7wajGKAO9nVJEul3uB4pAdQWgzYP5BLiFFEFoasFy8myUK5plE6Od/Xd
	 tjI0ST2rRY8lfNPVYcEZHrXKQqdGIOFjzPsS7dqcEXuhUE0dRBrLb6ToJW+Oc1Te4a6P2
	 oeASe5IMpjh9LVuefZZbRf4HUPbEdWAkf9tqgLDt901qND/PurYxRgUnYzdi8Ywzn2HoN
	 7qxIK7KaqJOPJlBayvKaVkydAB8wMnMzf3cGzyB0tlTf7S4YgQmdS1lB9B6D6IDdUjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AK1bb5et;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1272606A688;
	Mon, 23 Nov 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AK1bb5et
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B347E1F000C0;
	Mon, 23 Nov 2026 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441139;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AK1bb5etaxVVxNDp7lmBD2PGjDXT8w60sdMGRJdPU3tgdYylKdeP9S5OjfH8mtxjb
	 E3EqrZAw35NZKbuuSoNAHU0/d4QQ0bPMdKa1/tiv0I0dVgiyewACy5xFjeY4Kukzhi
	 UD1dWj/XcU5nmUYTWOTpnxsyqlrKjdoXtrpBUe/DlfwUMWMDvXA4++nMKpIiuYz8Pp
	 La1RmGP6BPugfZiRYUP5+abDpt8BCghReWJYMq0LMBRr7dey3ORC7qjWCHRHmAdk9K
	 bn3P+w0z8YakP6bversdpTQO1/p1C6r+VEKiLcfxiphkngSqQUcr5sRHbmGyea8JlY
	 B24SJuwI7B7NA==
From: netdev-bot+sinfo@kernel.org
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net v2] net: pse-pd: tps23881: Fix reported power class
Date: Mon, 23 Nov 2026 13:38:58 +0000
Message-ID: <179544113824.3294.17718997849062582647@kernel.org>
In-Reply-To: <20261123133420.708557-1-kory.maincent@bootlin.com>
References: <20261123133420.708557-1-kory.maincent@bootlin.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
