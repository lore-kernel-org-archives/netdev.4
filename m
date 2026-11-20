Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148224;
	b=NXTYbU3+Hh+49XaAzfB7s1pWNTnfWki/KTAIZQFXkImp2P/Uim+JN1je69oxAiLimK3b
	 3PYKbr4Z32O2g94S2rjGkojfA3zhPqsuU0UdHuhH+A5z3ld8pvZy+dacXBnSmmv4pkUdy
	 xR+0+7p+Y6rAdy5kciOhFidDj1EQiVHyOegMWSdMFDAkydUwgTuBHSkZfv/7iOQaT8lKH
	 ulsvxaKcHXFeJBDyVCEHwfl+zUenT5wsT/mMrFo//7jfDfiZcs7LLJetwAu0zUjFAM1tj
	 lhTnQFtHGsrQ/enjugDXD+7UKWMe1XSyVQWPrU4ZdMCXBlQpebmZw9IJBOvExIXBZnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148224;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=T6CpEBsfVYAJPnksYNuaEhFsHiLS+4HCxzUsJDT7Bn/oC4PExGIXhPtZGF5nPr6+JrsH
	 V7cXP9Iipwfy6V0UCwEdtaqJQujNiIQ+c9bcUiGa+6KFymava6RDLCMyxiYAHK+Sg4kuA
	 PODdl9ZAIiqjeuSZzGpSHjNS+ZRXuC0L+qU1DxYLdBEJ7vEireArmCb43FG5omWTwpz/m
	 gc4WBAuL8vmqPNwHGhkMhyHsIkoeUqldK2MaQAxr2CuNh8xQSbrRVC29werf8bIctYXr4
	 xfz4Ji482El7BHAzgXxqOykhazMa+ghThLMZ0sgdOryXkhN0XDGhLrqeQjXID/3GLVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Htz25/Tn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9A606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Htz25/Tn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B4F1F000C4;
	Fri, 20 Nov 2026 04:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795148223;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Htz25/TnCZOuLrTqj8BzNHC0naQKBiNKEwpf3D9ZmGdAuGsisoBEwdeqBPgxVbp2B
	 xw9MfmOh4nRea7x64LLPbjpmXU87WCugpTQjuwf8YOtUb0OdPalIgCgiS+kYFk5ZN1
	 YMCgzHbBpelEpVf4FoB4mrypGe0VATA8aIvWynbRzD+TCWH8OJcYUdfMtzvx6UbL98
	 wTlpeCjkQMPVEOg/MQNh1uHK/3cgTGRVZQ21rhkqpxBJQYr2+cq2sbMuAGK7KNGzcI
	 gWUNdgISJInHELxbUN17FCRnMbIl14GVPC18fQGd1Lgr4F1EskFIksCMZO25fXcR3h
	 6Q8vyXsUr7cnQ==
From: netdev-bot+sinfo@kernel.org
To: Wentao Guan <guanwentao@uniontech.com>
Cc: edumazet@google.com, ncardwell@google.com, kuba@kernel.org,
 kuniyu@google.com, netdev@vger.kernel.org, melotti@google.com
Subject: 
 Re: [PATCH net-next v2] tcp: cancel cloned request timers without waiting
Date: Fri, 20 Nov 2026 04:17:02 +0000
Message-ID: <179514822289.3291.6604418008166643798@kernel.org>
In-Reply-To:
 <72918C6B4A6E0CC7+20261120040954.57832-2-guanwentao@uniontech.com>
References: <72918C6B4A6E0CC7+20261120040954.57832-2-guanwentao@uniontech.com>
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
