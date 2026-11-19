Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076283;
	b=R/t/lfJEAaB6uNkC0Zp3cCu4/4mu2gK4i75UWMDYN7buVGztpRLbxUwLYidIdwC5FMLN
	 QzjR+PDc/IpxuHDVW1y0m0FHmA6T/ldnVdNRKmsOGsuWwAfoJnj1NTwHeeWwezofzXXrY
	 558TMsg9qKiv4hcesgMY14sSc1+jOR0VfR6ZSau8E3hRpXBPpyq9YCMt+nZ8ee3XC9Pjq
	 E6jp/xEIp+HQky2nblQIZgth3dt5PrecgIQ9eDBmjMtNHEB25PdDmYG5vQJT7Nh4Cgx5I
	 AETy2XwzFY/LCt4tNOcq1yE+WmkPRlzYECw5eCd/Hy3GBKmEy2DsFzCYndCgGT7NL0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076283;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=n9n+kegAQN0TsGEc9H2pFuaIt0KGumaxYdN0d1Uf2LvSMxb3TFZK9IUA0aWdYyUAc308
	 YeB7sL5m4HAHnm1sZHHtmQ/L4n4LJSQeYyf1rAnmhkFvHEssq17Y+CFrGO35tGq/xtM6M
	 zJ/uyxOw4rRf1VgiBG3K/Cf8x3QSNPmAK48603kbU3/M6Y0BgauIJMiUuVFwu2wqrMMSF
	 A5hatB7EHNnCxH/rSoH07OJvymv9lEGp8J1jD/o9f5yDR2OffbJ9AEPu1dlYCUdvQ+gKd
	 TSJC7K87V0Z0cJmFV/FCiYlRPfEp4v3DWUTQxA1zSW6hI7qgGQCUcPHZv7L2thRc8Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACN45uGg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1E606A339;
	Thu, 19 Nov 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACN45uGg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D761F000C4;
	Thu, 19 Nov 2026 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076283;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ACN45uGgY28eXflINpGqrvL63giDLJqr5hIG69CEhEvjnEo+3E+KWI44bPyWXVedz
	 Q5/sMq+Pj2eY1+8+r91vptKprdEdNjBkKtZhTfQ+lTPG/sMrou/C/vkC2Bg6dRcgxH
	 EMfBwYlNHaUo/tnFwI/1i9lz6rcusmnWF5MRygJt/nfmwUcB3ihRidIl0+CkQOrPxc
	 882kE/3dhFz/yBq2Kr6eTtb1oxDS4HiZIUUxILqOCPjiBgCWQMJwi1rA1/brPcQjqr
	 +hnTM7BrqbzK93zF2ll82mKIxfR+fvzJPl6sNVFvx5BSid7HM7e4Nh2jibeb/zcODU
	 uJ0b/qyHrF30g==
From: netdev-bot+sinfo@kernel.org
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: bcmasp: avoid refcount drain on probe
Date: Thu, 19 Nov 2026 08:18:02 +0000
Message-ID: <179507628214.3291.12572685451727032013@kernel.org>
In-Reply-To: <1795076102979-9-385853cc@mail.zgclab.edu.cn>
References: <1795076102979-9-385853cc@mail.zgclab.edu.cn>
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
