Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087684;
	b=dcWcQ5eTcPgt8PWBxXYGsmUH31hb343S2qWa+ipr3gUh+4kBOQdpZQtA2Dv8j4k7eB+X
	 3IYl95A6v0oqU5fs5bButlZZskj2OMQFZ8MzSMNiwdYIw8ZqMb7WPHywudwa2m7OLedyw
	 lHhH653NUsSBCkImsAppFrGzzVStwWb7hUaOEA9RI1EZ2L2iKv2z9rQBGeWaOcHNHKqHw
	 XsNcPj6AAnt9pBKzfWF8Lhle35UwzkuHe1vx8EBT9e9RCqVmmSmBUkxp8lnI89bTtPXzy
	 OUV2O5sKAsgfw0UxwTewVDkGE1TcXhqEPd1HKXi5b0uuxPMBFenLeiwmFCndeM9dUqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087684;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=KbfpyG5mKOuVI1c+yte9ZiTw2/A6Mxs95kwcULKFlU4MJg/dcjPN67LqrFz90Lb+eR4S
	 KyJkwEpuaDNMh/ByvrLybfwOFJ7l+QiCTMJae7tf2pwpcKASqPjfEu3eRyOahY0HZ86nE
	 DNRJra0flfYEoz7wfLrmw7lDYbr/C98h+f1AZ0+5LyiEkq6gMe2t6UhMaNC8ZnXFo84KG
	 xCQ5FVy8MRskzfInJPvqJ/7JQ9c2qxQKWI1q1A013/I+6qMCkfeLhegc++9ZYoLjWucJV
	 sa+iGYhbBZylHi5uvzRGZOZVS2sOuM7gkv5bjSVLjHrbQJAmrhkoWb9bShEcIpjNtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a+3f/m/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB3606A326;
	Thu, 19 Nov 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a+3f/m/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CF21F000C6;
	Thu, 19 Nov 2026 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087684;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a+3f/m/3+ER8D5OWmKkea0MTjb5BKmUzrS9Sg3HmuKwmBIaB1oCDVoHuOGwyKzmO1
	 rPxCPYU+JHz7KvyuEqrn2zbjZQyQe38TUsSkLuhbJwWXCyQnxpzo8BUtYAqOpwhlJu
	 /WFzWEem1byOpz7KBIYEeq1qLRCXztiie716035rXoaIsKiDyMkRUiL9zFaOMrZB0n
	 82ygmHPJT07COovqPkr6IIUKvzBVtVJ6sKBNnMbycQyfsEj5C1BqJa2Hs0J7LevFYJ
	 it0c8Zqh2CyZeFhYTVy3T6ricUiTpnpkGhJK3z1F2yBhtq32vaLaP73lH9RF9Ts/qp
	 x5pFuqQ0MuUOQ==
From: netdev-bot+sinfo@kernel.org
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net] net: pse-pd: tps23881: Fix reported power class
Date: Thu, 19 Nov 2026 11:28:03 +0000
Message-ID: <179508768348.3291.15607777507397640958@kernel.org>
In-Reply-To: <20261119112511.239208-1-kory.maincent@bootlin.com>
References: <20261119112511.239208-1-kory.maincent@bootlin.com>
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
