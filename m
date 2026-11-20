Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177652;
	b=Onub55U7khy7NMfZqeoO+72POgnbbjIzcX/qCPVDhlY3ZgUE38k4nnjhg763vfybotp0
	 HPLKNyP+o6OsYNSpFT/M+pbwYknLYrLk8I07rTFW37jacb2pRW8gslgxIeBA7cZFUxR2R
	 41oN8DnYb6V/pTbUWXb/YAnkEmD+JbU4VuGvbwH15+YRZJZZwqUOx2MjZzB5HX+GmTxCs
	 a7P9dWLn4qbtGORAddQYrayIXk68/GfQddNMGvBmbc0f8KxL01d1yyPmgzU7ysKjV/RCg
	 ffNCl37A0ealJy6j2YR37Nm8Saiuzaf2/BZcAkHGrWZC22iWtJwSWM0V49EUJyB2VqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177652;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=R3c67zhUtZtBYb5t00LZVqCof7c5Ii9+31uhHXV9hN9xiWISyzyMQJFk3lIGKBblvDEc
	 ri9kmuCAxL9/5rK5nA0XBH2hSWAb85tpT7Zq3oUf6ELemFK/eSyAic36ybhCsRqrZrCjs
	 c/vEKlQHVpavSiyCXgEAKiWwBZYzDwy/LX+abnRdk4/Rg5rQHHPgl8uB6dwyizvd902Wn
	 TliQLn+KUHPeio5MvxqmVIxXMtnEC/RkLBGMsj2i4DHPLdrIKfBpAr6V71kMoVDom5nHh
	 d2O3bMRPZWJXf6hVYw7c0Vt5FQjwzIe/y71u28gPat0bdf+6ruOo2A2DZxZp47heMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jbv/nEIg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F8C606A33D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jbv/nEIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DF31F000CA;
	Fri, 20 Nov 2026 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177652;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jbv/nEIgUcrd9ByaCTmcsqmtY5M116GY1y9LvccIwXZfww/bf5ncMHSPTfDZGGP0N
	 1cWKwOXjNA/JsVK6PlgkXPWhv09ZW4cTPSIbQjJ7unlxawWOkmJI+W8b2rxGCVhoj0
	 iyNHoLQ9cYvoxw/TJuM7kLgZdUjTynSyU+tZoduXkrurvTdWSinXEmBRM9QE3G22LF
	 1esnssJH6fsF6ve+4cXKKhmyZDFe1mKFCD5DC1Cnax5yXYlCtnYTpiqUSpuWHPuYmg
	 c5ckqIBXVxbcnKXc7xVsSDGkk3X0/N37KPpC7Aft6oxcHTrKgwPdaZH2PeMwff3sme
	 C38wd/MCyjohQ==
From: netdev-bot+sinfo@kernel.org
To: mdshahid03@gmail.com
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH] tcp: fix division by zero in tcp_cong_avoid_ai()
Date: Fri, 20 Nov 2026 12:27:31 +0000
Message-ID: <179517765144.3291.2370404794757115217@kernel.org>
In-Reply-To: <20261120122348.207708-1-mdshahid03@gmail.com>
References: <20261120122348.207708-1-mdshahid03@gmail.com>
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
