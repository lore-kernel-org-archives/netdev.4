Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773287;
	b=WEGjf08e3u4c+PpnMQV5FjP8cg08ps0ZfFMzK+5TX/V53pR/BJ0e/sJmF/A3xc9tqVu5
	 QRgJIGqFTC+m70aliX93JauxL8cEvnt95XIbP2JyqPwqZ+Gf+ouSFIAK9AKBrQ82KFO3G
	 ecjwcSq6NRaY8TdOwHkLDTApx5vFatvZsjph6WzLAqp3pz7v8XLOjGCAoCM4ISy780fAQ
	 41ttMPu7fe4oqm/6EE9CdHwbdqzpnEK6Bezce+yOxvaV9WDiikM2xjBehmQtvQM4IRrGi
	 OHSjTxlnGL0DOIA/iuXb9fw/vjIasKFR2It2zlIl0KmiKY8p7FAfgT0DZqPenlpHZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773287;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=HnvOQuKDFnuJfaOdEmyGq37csbBE1fD8h18S2RrhTvxcE5QxoYsRwd11XG119GRVfxfY
	 e0ALq94CdC/ZlP5cpXxxaTQ4m7FDdIR4unAzNjkbMCQVppWj23BI69BFwHhgH8GdZoyMF
	 7cog5XEm4ljW2a0Y6CYYbMbf9dtv6obi1vLfYiIUvuMxfyiNIOD6d8koxbhP5JCcZJFGe
	 BcFY6U8tdAPsqp1fvaKlcNZu4imuYdsWu+JCwCfeAGRQOKXCQ22JWbQaunvBMyPset2IV
	 6Gj00nKkjw3Yu1BONYCCP4Dz/+P8K2TDOk8/gkq+MavpOkSF6tIYMhKbsYfsNnEDx2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4SNkqSb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFF606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4SNkqSb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD7E1F000C4;
	Sun, 15 Nov 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773286;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m4SNkqSbN27aRUQvbTnsWbNoqaK4a0+r00BNLrCPJQ8ehMDeOf/A69uhBMUruGmfZ
	 R6443GrizI01Q3tMqDeSdGZQIHD77wgY3xdz1AWulsFIP6nQ3/o6+eHqKKr7nMQ5dT
	 llyCZ3qOPowpFxRdIIGgvDJdUOP81G/G8sJDPHXh5RJpL11tFvzGt2MXtdE3XL9gM5
	 dSvYWLjMN4YpS6cwCkChGK6MgCPmLPmBCNQUQvhIL9OLT2pTUZqTzXheInx0RQhlF3
	 daVAFs1PDAzgjfscw40hhzaIP6YanB7VO+8HEGzvvjsZf+KeGeaKCjdvS8N9ZWVUXa
	 2uM1tuKpG1m1g==
From: netdev-bot+sinfo@kernel.org
To: Justin Iurman <justin.iurman@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 andrea.mayer@uniroma2.it
Subject: Re: [PATCH net 0/2] ipv6: drop encapsulated packets when no source
 address is available
Date: Sun, 15 Nov 2026 20:08:05 +0000
Message-ID: <179477328585.3291.12843361003997824029@kernel.org>
In-Reply-To: <20261115000047.14669-1-justin.iurman@gmail.com>
References: <20261115000047.14669-1-justin.iurman@gmail.com>
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
