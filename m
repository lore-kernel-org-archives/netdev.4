Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665142;
	b=PxWJiLp+SIqHNftSshQLfkWZcVZPq4G2PRyxZzLXwz9yA73YQq760H10DoxjO72AvOFQ
	 oWVj1gJ7+lxwOLHmvu8ES1txzhLdAEzWGpfcDlUe1+t6hPfpJ62KmQV1vaOWp8gmtZrgC
	 US/PQ9vsom7tqi0iQLlEzwVP3l9tJVGxkEKn53NTuJ55O3SYigvFeN3lpDAdEN4LmNWIT
	 KXLnSkm4BZoOV70JleHLtt7dAKi0Q+arjLBzOO4/THIxJBEmyabk23WYT6Rw1GnGG9MJs
	 +aNBt6z0UjGKYGrEgntioJiJ4LDVgftBJzbEexKvUHtbM9XoEQqJzJrOmZsostOUrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665142;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=KNkFZ/qalhUUElLkbKVxMemvXISGdgdoYkpjbWvAUXmqVHUuarOp7OgIpMCBOJGr1cls
	 hOAe7m3zt5Q1iAHk47ODjdox16iQ5gsigmDzrQfyEdnzTcyfWFhTt2xTybPQCdnPQe8LR
	 j2D72l7XIlecwlCDqoem/QSuaDXHhBMZzcil+w851FcTcwRiHJumdN3Dcp6rFGAGyntbM
	 KMznc2JOaZj/21kAfqdRIwPsh9Xk23+zd3Y/Doj0Ctzj2rSzU3/PLv3mFohY2Jwi4rj3D
	 oQHD93iOaxi17YCuAp4gjDA3ISDvR/GXcNxBFO5xSuP9xJGVCCxwABNxFo8DyT6slXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJ3SKDZJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71BE606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJ3SKDZJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECEA1F000C4;
	Thu, 26 Nov 2026 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665142;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bJ3SKDZJ+syp1LdBB4at7ypcQBCv5MtvC02bKZ3AZv7K84IhnybFdk8DqFI6Q/UmU
	 y9jLJZ1k7uUo4hCu74bWfo3YIAaH9uvsELsk1gX/4QbR8p0XQjia+1OMy0t01cgzaa
	 DlY7phu+5iUMHxAFkA7KvtuY+HU/Q057vz8wdltiouoi7KRwfYEr9qF8GbK3ZuEdny
	 Wnd967C8iINEBPdajqhnJ7WSGDyIJ8OivJdv+XwxK5+XcJ+RoJ7tXJxz3KZn0ooyUu
	 p4emxoMaRytUNkfZ5I4kaNx+bjOYxBp4OHWgHFCgh7Z5OxfY2zQb7HCG8SKfNadLEv
	 bHCBB4RCWovZw==
From: netdev-bot+sinfo@kernel.org
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Unregister the MDIO buses
 on teardown
Date: Thu, 26 Nov 2026 03:52:21 +0000
Message-ID: <179566514108.3294.13714710222643559917@kernel.org>
In-Reply-To: <20261126034725.64709-1-mmyangfl@gmail.com>
References: <20261126034725.64709-1-mmyangfl@gmail.com>
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
