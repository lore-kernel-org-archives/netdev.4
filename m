Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012733;
	b=MKiPLbp6aaMXaJ6IhJVTO/XXfFYRPRm2K3T/21eirdswFAYJuJhYEd0z/dtNwT2UEFKp
	 PNHCWx7QCPc0+nwjrtfGXemtSOcxFV/+qIHGamMOh5C0f2eUocaJLfmiSRAva1WlrHafX
	 Cjyl1n4XtbGF1jX8z+ThbtVqRp9iVB+6zIM/vtZPgcl/Wns+UKrh3UVEaIL+QG++IQJJP
	 Pb6YABtE7vfZSlYvjlqDf0scs4rTDmfLiojgv7xgx12Eoz6rXPkb0BxVcYEa8K/czJw2O
	 9Js1XNhOE1iSKh5U/O1MW/glDhEnnj7dPQrL9hBSdpQIU1wRo7aIp9D1rfPfK9rObHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012733;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=iVn6xxqAyJO0SmUvKzyq/DuUBgaFWKWcU9irQDjy/Tu0aJPOp/qwTzJg7wUiCL9OahyT
	 SDZItRjqC93uHxM/1zBBg3wsIzUsA1+D2XfXK96yPc6zJeR27D0TdvpT6bPrjYwTE7bNh
	 8tup0aALnpYExvCuyDKAlUWhupbyBdRVlSALMqKuusfhMFY2hWEs82MbRYuni4idSD39X
	 mrPsqvw8PygjmkykvP+bHSw7f73tjyzVt0sCq9/BfHjioh+wdGiG6wG+oIpkLDSZU1DSi
	 Jq23WhD75w8no92o5wcr0G52/s+0LHlEJPcsctc/vA/Dq3QH97gqMJG/61E2hA80pPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dkW68T/K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEF9606A31C;
	Wed, 18 Nov 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkW68T/K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742041F000C4;
	Wed, 18 Nov 2026 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012733;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dkW68T/KYLLPCHpTwz0zCVaDEQls8qT58OMxMeJvUzQU+/BQ6SeccnQ4N5rgbGd5r
	 JzbZMC74En3cQ3LYSNdS4jJbLGmHvfb4opy5xAIHLY/kxtzl5EHSAqs+DabY5DBXb0
	 aSx71551JPz5pJ+JIROru2FeTxaPiulPb14kaRJBY+emr1Q3Ka+73rfd+f+fWUdU6o
	 e03B7CFM9Dl6cGs+SRe7HygrM/8PgxL2wZAu3s5Kl3nQCc+RPW2jsT3GLL4C3zWVoz
	 qgrbE+dEyHm1IGRZZibdBUSTWFs9WursyexmdDcIZl/xPtfEs2dKYZfM11kfSCFIis
	 B2uBKIvBpE07Q==
From: netdev-bot+sinfo@kernel.org
To: Chris J Arges <carges@cloudflare.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 June Slater <june@cloudflare.com>, Dan Jones <danjones@cloudflare.com>,
 Jesse Brandeburg <jbrandeburg@cloudflare.com>,
 Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>,
 kernel-team@cloudflare.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
Subject: 
 Re: [PATCH] net: prevent receive header offset overflow during decapsulation
Date: Wed, 18 Nov 2026 14:38:51 +0000
Message-ID: <179501273191.3291.17482748528589913899@kernel.org>
In-Reply-To:
 <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
References:
 <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
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
