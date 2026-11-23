Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454584;
	b=muofs9gt8owLGkWowiKTVg3ItD4TNq5IAPaLo4AxTOqma/f+JCQlg2EfuXWAZz4/nrMB
	 KDu7p8KOUbH4wzyonnJCwODBRw7+dcL9FYlhPUn8XulZWjn8kjSbN+oS5KCG1o8NsHdyk
	 +rho/XiRrA5wc5j1R5fAC8X6BO4H+bK/VJPRQ7rSn6aIZk/ZwA4ZjKoCJObl6JtWJbzqh
	 mVtz0Vx4+AMEESDriwBgB+xOeXzLN+dQ4N7Cq3eXSz3dJPxOBlHTqoOjM2YKoLPN7tfKz
	 bZzQg1WFsDyy4O0qrBxbkvJujRpjZ6gzBQQXRpDCJ4b/7byopSQaqoIhrgtLSv1EkAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454584;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=jEsh7JCYwVyPiSSobY7SMlyCDng9hfgtWCJA1+g9iGqDY5+DGImWrRbM+aTp3FZa/2zd
	 ZhUSueYxQ2ceiLIqYuvZMZbj3n434jsnbxF1Xj6V0CmzdU6UFbudF/mB98T+aybMLCVY3
	 1n10FXQv9ia4hd5D4h7SZuAL+SLTZosKzwRgdsO2HFx3m8eULagEZX21yLbpdflPx3j+7
	 K+tmimDRhOGz3zDY9pHlUb5wCcLQ7/Qn2iXKjXDinmK809S5dL/QjZ+RyCCjhHSNbjpmJ
	 skQKm+4hS1zcNGz1ViCh2Y3+yD98HZofm7WN80YCcfUq0Gh+oxCanEe2/zIoIuqoAlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ClC/i9Lg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E5606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClC/i9Lg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AB61F00A19;
	Mon, 23 Nov 2026 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454584;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ClC/i9Lg5yQmzLC0SPuMA/B9IgOD5fPPXrxVoeYWtBHCIgVAbuTX6XxEisGeEjNdr
	 b9SjUafsFrpWz2Ulu1x9mndiY+QeyAbq5c46nogaAflUpxvzPgTsNQL4lZuPErgUqx
	 zQ9JqzFrpR8nisRGZ08REw6Xy8cXtWzRVrz1kgWdhtJvX3C0Asn5Smp0dcTGcHex/t
	 INN2VrnpIvEz8DKtpykNOPcD6DF1TgRFYl/TbgET9DL5scrt578VC4VUPfao5zffj1
	 NwNsUnH6C085C62nXHP7dvG3aIbOxp6dT1k3zDLCJhEt5ur126cD7Hzsvz8YABZxqq
	 oFpKU/p91gSlg==
From: netdev-bot+sinfo@kernel.org
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 b.a.t.m.a.n@lists.open-mesh.org, Sven Eckelmann <sven@narfation.org>
Subject: 
 Re: [PATCH net-next 01/15] batman-adv: document refcount of returned objects
Date: Mon, 23 Nov 2026 17:23:03 +0000
Message-ID: <179545458375.3294.10693460852466613013@kernel.org>
In-Reply-To: <20261123171827.3294525-2-sw@simonwunderlich.de>
References: <20261123171827.3294525-1-sw@simonwunderlich.de>
 <20261123171827.3294525-2-sw@simonwunderlich.de>
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
