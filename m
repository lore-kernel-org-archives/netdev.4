Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419506;
	b=ZQjojCZw+Hw6lUZ31VXuzbNXvAqncFvoAfZhdEE5bnIwVKMJj9LT8tNWy6jPqCcEu1yK
	 hDO1UdP4ahv6vMOlSN7+wvHUME8Qlqu2h0jQUSMfZUCiE5aAndypZyXKXtPr6oNup2KmJ
	 of3GMHB7OaOWbyTYR9S9ElZTL7HOkNA6HHxu9NiSrREzF3RysQzI+RUVBA6G3am4D/ONl
	 ZlCzjXAkSxKHUtlK9/GF9zi8j/qeJfb429L9L7uijyuarUvZk8nMEjthIID3zNGOE0Sys
	 bflUBteFhA/VeoWhexgTj+quv3k44xQq9AbX6JHsg/Zwf4eJ+zjf8jPOnqHbGHVZHTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419506;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=4laaKLfX4uJEPj6sLMh6dLUw+QSNFTgGaTatAnmhhIJUhzDcHo/QhhUMkJkgcd48Bmfp
	 WUa8+PqCp70PFDCAnF8VJOj6ppWj7qBZI81W1yGAKsXfURhrZe+tRaVIfZ3g7jT8cuZ7C
	 Mv/KmwxNoPSJAumyj6JfU/lfhcoDQlLC7fDhLEBjuubwKXm6BDco+FeZkZr6ShLS3eY4r
	 UlxAYaHnFTlapC3bSXdaIjrqiJROuceOJLYDmMDe1I8O1AXjZs/jt/BUbauT2c89l2tCd
	 zf+ww1WdZbwefV42I3IdBxmCbAAVO4fd7HkXlr0+HUi4dd0icA+UbfuSMB4elMsUPWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AojOcVHh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29517606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AojOcVHh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2111F000C4;
	Mon, 23 Nov 2026 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795419505;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AojOcVHhLVq52qjBDNphKVC0lbkIDZGNMfKn302wfTTD/Sg9+yCmQDN9czbaZ2IEE
	 o9mz04Ztl1xdGtiKopcILRM+x+AaqM/C6tLlns/NrbK1NrIkQFzHECtBwJO3IRL8WG
	 OHAZSjk+BGhRoWbzHgwbxzgn1K5vPNoS6BEvF4iBSy0b/p9NIEVGPiLkAMtsyPrWcM
	 Bpux6u1FkJ+i6JaKGpZM+w/C0+IpPDKYxiWU6hS/0paJCpgrE9Zu4h57du/075AJ19
	 /VaZOPL03AqPJwWohBnM7b2u8tY8NIbcQhwAz3tNnTHhaPn/nsMiro+J8zp9H2GhhH
	 aofEZ+0q8nIow==
From: netdev-bot+sinfo@kernel.org
To: b.lane130@outlook.com
Cc: andreas@gaisler.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 kristoffer@gaisler.com, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: aeroflex: fix memory leak in greth
 probe and remove
Date: Mon, 23 Nov 2026 07:38:24 +0000
Message-ID: <179541950430.3294.4046271264324761830@kernel.org>
In-Reply-To: =?utf-8?q?=3CBN8PR06MB6177818FBD04A32DAEDFC589A4452=40BN8PR06MB?=
 =?utf-8?q?6177=2Enamprd06=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CBN8PR06MB6177818FBD04A32DAEDFC589A4452=40BN8PR06MB6?=
 =?utf-8?q?177=2Enamprd06=2Eprod=2Eoutlook=2Ecom=3E?=
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

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
