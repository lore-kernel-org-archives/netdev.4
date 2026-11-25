Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618783;
	b=SrYYZWODky5rug8qmdA4atiBYzIpuHhRwIo1kOjnBx8r9Ys0B6l8tVvzBVs7nmHhqSsz
	 qw8n2EfLANGULV/PJ/ZY7cfeJOyVyAKXuOM5d993BIe/fh2RiBQP+/OMhJ0/RcUpDDhK9
	 iSk0ISqG8vKJ+yt/AxE3bDY2Lku73u+IZOHkQUqjC46AlwDLchVDqg/RE2Vka8/Lw1G7L
	 k0o/h0drBFIUu8tzACFVU2rcLTdw6E3VuaUfEGgYY+zzy7A6XE3EN0NQ0NZQTLnfGkwlt
	 f8CHuNryg0PgdGtlPWVQH/+UgS0MtmrI/Q4ELtBDNs5Ep3StTlrNPPFh5pfpH76/odg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618783;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=fUjmtfRl31+GiX0xfa6IKXqNrR3fBQm/6s7uKIAcYXLnnKBzk0Ff9ps3C1epA8K+DfA+
	 VpWKNPQHJE+LcHBljfwZRmechbRwVWEb2mQzcYYuhQtu1215f4F8QIQtTK1G2ljMwAtAN
	 ptlF36pT8vWEN423QP192mFJbalkBSj0epmbR/FeyTdoSc0RnLJWLNkKE223EKWQkQXo6
	 otkRnYpy9bo1astyvjY32sFhS5x26WH4/Fl45ZqMfcFGsZGT8aR8SJV/LCdk39QVIkrp/
	 ERjAgdOw8org2jDkl0TvGaExktQmQQBu2zljHOFrEJRo+o3Zy6uyc3nG5PQ090OKqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLRneaoX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9B606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLRneaoX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA34A1F000D4;
	Wed, 25 Nov 2026 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618783;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BLRneaoXa9HTVH2jRH9p+KinOIdG5e3hcXvf/7KFo/93GvI0gIW0kOqOX1PwfrBIw
	 lNRRSUFOddLW3eS6hp4/ZVcZDc4JoPl5PwUETWO4vwRsgplUbO9wmo75PIVBwJgcq4
	 7wQthICMHqaPEPzAY+wfEfxa62zjNuWEde0a8ueQHFE/Ih6pnxeWvueZ6fd/Ii8I8a
	 cYDERp0GABHZPiaG0VJ4e2AyVqs7TWyWvFV+RL3diKz/7xORRL+RgJU6SuzfZzYcfQ
	 e/2ECf3s8isXVW17pQjYaDs4WcOLMKC51/lpqldXVILGDzcgtc4Sy4eG+MzUHbPc/W
	 xwnHVyDUkVTCw==
From: netdev-bot+sinfo@kernel.org
To: Oliver Neukum <oneukum@suse.com>
Cc: petkan@nucleusys.com, netdev@vger.kernel.org
Subject: Re: [RFT 0/2] net: usb: rtl8150: cleaning up races with ceasing IO
Date: Wed, 25 Nov 2026 14:59:42 +0000
Message-ID: <179561878237.3294.5278649618498585338@kernel.org>
In-Reply-To: <20261125145313.58434-1-oneukum@suse.com>
References: <20261125145313.58434-1-oneukum@suse.com>
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
