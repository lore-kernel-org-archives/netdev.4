Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999166;
	b=e8M2CKFjQHVv8/dalO1dBqZ2gfC0gHljpFCFgS0aGS2JbibMjRlsfQ+boJdjf2DDNcnG
	 uM9T3Rcz9linWVgIThRe274T7wHIbT3shCYUXh81sX/G4Wh4hZMWp+zWkHwrOyijrJGtB
	 34qpFHOZRd7JjpoREKedqVmwKDoUjvYhHwPF1pafUiGr9OdylNvCpZzBT4VneOXJRHV1E
	 WjgBNuxjEwwWRMDwihtt5Mp7jPRUaB7bgTeXXAiKevPFG+GNyfA49qaJ0WJf+EhAE68NT
	 x3D/HXC9zkMpv1/HAlXpB5y5c9FPOYRDSx25z9YYZGcv1n8sV9cuP3RYtDIFVI99zpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999166;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=gR4sBpLKgi+TMrGr49SV4MD2dMzCrL3gqGi6ZhsWMrsDOjs2KVwdWb+WeZ2R2RQKYyGf
	 UNJs0Z2elIobjDuxZtdb03W7E+hpdfOEfr3lJi6knlV1OVPpyzUjLTKyZXxX/hKQYDcDP
	 9daGiPy2tHn59GDF17idJCaPnyuJFwLP3opbhaLvvBdEKLq1H75Rb0wwis/6fwAaWQkWs
	 lP0LuJa5q1O9QpscNDJPDni1sH4ZjX3Ux1ZmS+V0Uabkk5OAbCAVJne4TAiAC6o+6TOXg
	 ZpPQcgp2f+2mqc6f1fJbtttbqf45F5rpBEseN8tOTlG2Ru2QFnTNHxftk4ulrpt+Wcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwHg0saj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEBF606A33A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwHg0saj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288391F000C6;
	Wed, 18 Nov 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999165;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bwHg0sajVNRTkV6L01SF6A1M6a6o0CGB1DYuT/+04xCthJkW+dt3bzeKKUOCXeP5w
	 qjR7XfkjGwKZuApBHkSfrLWcIR3nfNZy/cDndbkrAkVn7tx45S8gBmHCOokO5ZjmPc
	 YciWQeJDw4bHeGsjDIn69aYNYi8j60zdSiYHNB2Aho8JGDWC43HYF2WYdU1yw3HQLC
	 d0IPyK8OmpEP2CEnU6H56HJRyVAUE7AAvpV4jb7J5Xh7F1PM2vnCpiaSMbSf5MZRHO
	 NfVuwksqbN4pFwWodapbvUxeNZURnrpFNyXPfALqWRroWJSj+FHj8duwXofpmCqZ9p
	 MbCQm8eWNoELA==
From: netdev-bot+sinfo@kernel.org
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net v3 0/3] tg3: Bug fixes
Date: Wed, 18 Nov 2026 10:52:44 +0000
Message-ID: <179499916470.3291.8077005013581201031@kernel.org>
In-Reply-To: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
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
