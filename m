Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168406;
	b=Xyx0MtjIK1O0q1r9sfUFp/suAKbIpiwkg3ojspQvt9cVDQ5T/JJ+Ifk83PNKQjx2ZX/I
	 HiRSpoVwTSFG9LAO8/EywUBOEbWvDmMcUcMI+/zDkn+/PYZpBZXZru+GdcHhLWfgi00Rk
	 4szlL/J3bXfUAtx27dd+mmSoVWyq+Lta6aZue1reH2Ww14YGFdYt24/Eexbh2OLO/ppJp
	 ObwHQw8sWRK8x4W+DzZdnZaHoJBERxroZnrnQCC9VceKfURpOTQKhglm165kef7M/oayr
	 nNy9GHKvCw+gKDYDdiOqkbZO8MeEdqxE0e96RzjCOwRKcdB7TZclRolSosg9Uv1a2LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168406;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=lb2RFk/NPWgX4J0CsOxcCQbUGvMEOheqS1bpUpgritrFZFvE7HOrI8DtQgwJe2UlADsf
	 ted9UBA7+kWEhRgr6tWnY0fyAwNyHJiDzQH5PNbMqPzxdVDlf8v1D/kn8fkCHsCCQXtRH
	 0c+vAZ8FVQafiloXKcup4ozJnGRN7/ae2KiAwjJ8SYGL4Hzg74edVXAc5Qhwt1prGgjTr
	 8AUOMW5KJjYchdevhNHruUkQkNSszeG7gYsYbweIfo5WJ7neHdxTrU4pYw0eqagqjcYTT
	 +8JTuYSHpJTFnuVB40gxI30vtDhoUiweGvhrQb8Y1qMONNCp7ZAHs6+b6/YD8LZUb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T9WFkA+S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEF606A325;
	Fri, 20 Nov 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T9WFkA+S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7B11F000D3;
	Fri, 20 Nov 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168406;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T9WFkA+SD6lil9ruTWDxGrfc1ztACVA91hFrU7q2DT1t0Sq38VpLfKAhibFdzb79r
	 ji4t0Bp7sUeE7MVMS51hbQ+v74EdCN+MjQ2/Mbu81m/lDp8Kb6v+aUaU37SPTxaSb9
	 I7YMcDluBxpZWghSvMwkPrcfVcH8S4myhcmg8SJyAhU+iHGg9xJKaaVvk+UiXK3ASP
	 Y3XBBR/mifg9caP2lcOAWuCG13WaJuLQFlNMHG6f2boAi01GusYwqE7kEaHVfSK+nA
	 twwEIO3jQeSEg67/Md/aUtf21/IZbJyy8SyUpRikAXGGGwBb10am6nkclLQ5MeQbuq
	 asqOU4lylVYhw==
From: netdev-bot+sinfo@kernel.org
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Patrick McHardy <kaber@trash.net>, Florian Westphal <fw@strlen.de>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] ipv4: fix conntrack defrag forwarding after
 ip_frag_reinit()
Date: Fri, 20 Nov 2026 09:53:25 +0000
Message-ID: <179516840511.3291.9188818650072138365@kernel.org>
In-Reply-To: <20261120094700.46500-1-jiayuan.chen@linux.dev>
References: <20261120094700.46500-1-jiayuan.chen@linux.dev>
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
