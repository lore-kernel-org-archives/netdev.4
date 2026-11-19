Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126361;
	b=oxlmBvOvCcxoJ4mb6MoIwys0Wsyel7myuU+xQ9bakx/Sa+zkjIT3W7w/r28Rds2x96/P
	 ynwhRyyLatvVCfbbqBwW+jvykjS7xE472dzQWzBHVB+ggyz0GdLrtoEzniwIFC/QPdRuF
	 btpp76vFH0MoF2x1r4Ctt+/b3286BY0HoRxCa2FlQa18/OOp9pYJNo2sejSXmH4F08F1e
	 UCo8POBD4NSsCLGmETu6ENPe5Wf66S804MC1NjbLykZI2ZZpGKZTSR35XBFegVwQPAltE
	 q3g8HUwsTcuzo0fmeLUkxwJbRWjW0vZFXKLdA+oMhQ5ZRG2xjSIo+WzU9V3wmpNRl2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126361;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=OQL37J+rKSGqzy+Lk6CaHVJSuLnvvSdUTE6JoGml4aT2NvPZrFifnEGnacvURXhaGpu3
	 buDDY6qmrKgFMB1khyWbfltSTKT12WuYsHahtQN/tkfd2hljPDwtEimunCCEoE/1TacVW
	 +IzQswQTaQlnK8E+CTOdhrTdDOiiElf2aRHEU+mgi9FaB3Nh+Cq1kfRZeoKzf5VRn3D5u
	 fF7cqq0UjYDDjCFU/Y+/sgpSUE6tOmVEz6Wshr7BtvFJTgGaGhA2WGFH3HznfKqyyXmts
	 E42kQ2EZKahfFNP3V3ogutx11aoiIuFfkOPY9cS2CsEQiAkgmyHoMu4knKf0HD6h4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQNXnqtj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5731606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQNXnqtj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9281F000C0;
	Thu, 19 Nov 2026 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126361;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LQNXnqtjXSIlYNu9PyE906Q6SP61aBQoQ8JLoW5Rd7H1g5rMlXxlr/CLhGFFAXnpm
	 KhT++yWqq0uaGlT6Y0lIIpM/dhQuF+b+f9tjEMDpVlvng+EEPV2Q/kUMwGoaLCtSUo
	 gbAEQYmFOS1OX11DRu2asbmrXJnlQVIK63d+bwDeOQ7oSy3Zy0LObfp5v+EZHes+HN
	 s3wCtwuZIzxHa3xoQ3/LBGjU0RzH1waeAs42XQHDjvX/2nKTq5Z/wZiwVV+kjKHIdO
	 RyS7I5wHNyVjv3oSj4PaTkkzyEZVFN+t8qHGEiymxvi34F43KqEmo8aU2sAFb3wOCZ
	 C9OeAslmQXwEQ==
From: netdev-bot+sinfo@kernel.org
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: 
 Re: [PATCH net] net: dsa: motorcomm: Read the port PVID instead of bridge's
Date: Thu, 19 Nov 2026 22:12:40 +0000
Message-ID: <179512636063.3291.8215181491669422818@kernel.org>
In-Reply-To: <20261119220949.1123168-1-mmyangfl@gmail.com>
References: <20261119220949.1123168-1-mmyangfl@gmail.com>
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
