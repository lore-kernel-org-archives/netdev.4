Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763278;
	b=UZH0psoTZX1b2Y/1DKIkkO3UycdALfTUW642hGW/k+sPMETmALb6DE3wtrwk0RVDrGps
	 VOPgKkdoDRLuIwrl5DXZOjPQKDen9qXTTPTAWmWJ3noWHMJcNJH6/1SdUWkuBC4tezLrx
	 b73c7Zh/20+bfpdv7mhCrS6wY4Re3yRVvJTqr6qoGKj+uSoAAJ/NTjqWpILhAyWxuB0tc
	 pY4+nZTrMphCSGIWNFKLVex2wEpVka0lxQTPGhqjVkREtbl8uHEc5ZqNb+0d43daa7ahU
	 P6cV+WVXPW+8cZJ/t53haGvQnS/Spumx/dBj2bvhP/oqeWddfAi4K2J74X4AEaHKLXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763278;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=jMvU2TXRlYB4LpEcwjWrOfgBC/i5ZWDNQ4dUyDXrYsuobw+380/lnlFFzekNCT8vtHTb
	 yGJd3ox/+c6HXpw38IdupH3TsCzIFUmNDl18PfU+cp9ZI1H2uqQLGaNi4KX31zHW00YGA
	 IFQcesTFTZZcSFO2NOlJ6fj4Qral0BPFFgd14FO+Mjx/yXvWh6x+qtvCKzFmAALkpGy9L
	 icLRLPKNXogBAJTzS9rpQR3ViDWNr0by+y8KsT1mKNWjSKtN4ZbNhtQQdYHlv8NDw9pfc
	 KPW6rWzyb7j+ftrY/qApY9TBsaVarH2FyUgrYAPckMrGPZDz3TZVC7ax7FJJVxRQMbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ka7NgbsX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D5606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ka7NgbsX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B911F00893;
	Fri, 27 Nov 2026 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795763277;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ka7NgbsX0PcrU4c2zlh8Xh247MGfILsOzIz8JA3dti2x5VGti+y6utFUmyo+JkKRD
	 5Riddrrnb/8M4CjOqqpLWimjWldh/RlgB5B/EcPmI9+kXL5Y0CAT9zVRmwehxK/O3Z
	 ALO+w1xP5r19+IY5qR75leOVaUVjkbRxfwD3H0GaySB/aOFa0Ckh3g3NWf/omobYLH
	 gKAHEX0vsPbm0M0KnsglNtoMlU9WiKOy38vnRqWLuvuxxJ12VcYyxOSKbTJQOJIhyk
	 0sHZ1FiugczRBUX+9UaPws61NUHudLetTb5ybb6b5fzNAUxB2CJniGKWxJqgmHhRRe
	 bfsz8yEBlWg2w==
From: netdev-bot+sinfo@kernel.org
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Unregister the MDIO
 buses on teardown
Date: Fri, 27 Nov 2026 07:07:56 +0000
Message-ID: <179576327645.3294.112285886879692747@kernel.org>
In-Reply-To: <20261127070354.550198-1-mmyangfl@gmail.com>
References: <20261127070354.550198-1-mmyangfl@gmail.com>
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
