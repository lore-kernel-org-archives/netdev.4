Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020781;
	b=IrTgp9q2J/0FWb9gZQWavMUIEY6P4ezGjh82cEAZr83jxgQGQsKjIqQpIxltJtlXEfmW
	 HmmZCm7NoxtEeV8YUgY4JYRIVzkop5GM8cdBmNmrbGsVLrZkie8Noh15DzGhAde4bOISf
	 j2Qx6fK7rIuohdxbiPbrkjgKQl9hA+8++g51gKTarynhr3dJVOi/l1hayQhrUW/16YLvf
	 VnS9Knc9c3yKwZSgjaWKmta+5xXeoASHVUfL30T/Dtwo1BX0VAxXCLojyCP7vilKxMBXS
	 Tn1QyNTJVIcno73o/iPsy/k9AtueqSyGBPkNKT2A2nfdDhWdb6BjwUA498+7h7r/X7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020781;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=CwQkA21iCj6RNx1UM+Qgz45AW4Lh1iDL1N7Vs30xMF4FLHGaMnemcEtVdcqiMZYcGaif
	 r5hoYFWvG3FZfUjrL2RyNUMfC0o3f4Zb54hc0Sgfqnay40b8D8ayMCQyr5t2pRkSPcRfB
	 XUjbMigGONKUV4m/SgiupjnVLKn+E/EbN+mE4H1jCIp17aQkGwyJ3nBlKnOn0CV1kLmiE
	 VDotllFm8L+1EfjgKBl4wAdJSvNyi7n6SEL7vIwMyrA0rMAl6bRc3/7YidUB4C25JOGfZ
	 RK1skYui6yVrEamkSZHbl9a1P5x12palB+l5aiVTiHUJdfXPw1xQPmVlGZHRnUiwpWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNkPeMom;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C260A5BDF
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNkPeMom
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711491F000C4;
	Wed, 18 Nov 2026 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795020780;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RNkPeMom/16tj5X4dfaMOqU0n5t6fg7YUb0H1CyLkpm8LI/7ET8jmvePg+zGeXdZg
	 yCuWvlskvsa7PZp8VCuxH7emvSmXwHdgVNqEuKmMdIqDRWZJNIvoaD3E9rd8ldURzZ
	 jfeL8fCEavZsGADf2/u7Q5RKlPR16hQINS0PXulMjJeCR4kOxNaEjEtWbIe3qSY8Ix
	 D47CGsxMcTjz13jhW6OcXLttlBe8Xy8/GYnWAQUDqiBpSlwbZH/MXnZjbHNk01X9GL
	 pS94lw2N0gTUQloCE5uPsUXaCYaCF/TiAj57UV7Ts52c4oQDmUI9ddvkOxJb95Up8r
	 XYTQ7Pm7arHDQ==
From: netdev-bot+sinfo@kernel.org
To: Lin Ma <linma@zju.edu.cn>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org
Subject: Re: [PATCH] net: rxrpc: Release challenge connection ref on abort
Date: Wed, 18 Nov 2026 16:52:59 +0000
Message-ID: <179502077993.3291.12590105980604767956@kernel.org>
In-Reply-To: <20261118164808.988724-1-linma@zju.edu.cn>
References: <20261118164808.988724-1-linma@zju.edu.cn>
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
