Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450977;
	b=JlDjkPIPDDuzbqu4EPedsNmkHLc56tnsDOoBrIE2vMf0tMpDhEVJTIRKi+fVINtweKQw
	 SOwl3YCR17iXVGsILZs7raX1BsmJyq760NABr9pBmP52mgrbrjKGuCW/nIn0h7KyMv7hR
	 Bs9KS/GtqU9lT8z5lwp1eLmB518uYFrJo89/6Hwu1Kf66vadf4Q4iLHIrvJH79vsYFJ2r
	 7ccTnLK1XZu0DL9mZgat2SN73FdFieRw15kGqTXoba/YxvXoG4Fw6e2XA6KQtUnoTvOLj
	 DnrTK7Dv4uJyPfwsADAm28YwLOgzExaYTr1NZkHM/Ad2YdxS5eJ6UhOdYy7Zt/ZJBWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450977;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=PwWNZH3NrRG9CKRpyKLTgARal6LmdMqjQ6hqlhVAGc13hw5eDUcuP5puOYnQMx9/ZMJV
	 GEve1/sXlKZjeaWiIrkYH116ZpVw7SC5QbdkUX+CxDtwUGVaxsK3ULOav6T0gY0oYHUvG
	 UdbhGUnan9Qp0XtD7EkaEfrC5V9bmPxbQp+nFojkacInAKPIed14EFj+6tXranJnB3HWi
	 iDLUBcyf2XtMPl6c0qG9AQHKSd6dIiIfS6FxtOzS2GamiOtClJXQq0IGouviarZfxuVe5
	 a/2e+XM0+lVuVUifjTryCpKAu/HB7/rp/4kaaCzMymm7Xz1OKwcymZ9YmUAdwcdkJEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/s0YSW6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D7D606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/s0YSW6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3209A1F000C6;
	Mon, 23 Nov 2026 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450977;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U/s0YSW6SA5ZsF1z6DEmAyClULgsD2NLN9c5BdEFr0UBe77Ke3jQeJg428IKIcQVV
	 U0X4YN6F5faCnFh2q2SJmNfAX5iUZ1Q2lP6FqRVmBGtsWzARPKxU1J382Gab33ImUW
	 Xv0t5+WBxtlPBcWxShn68prbRze2O+16XHjEFclq1m7fvQIGapGKDByQz/lMJPsslK
	 uSqsjSUTrwvNj4EkTFOpWUTn/y6WTY96/jDGOJcc+ug7TYZVi2yTumIxaIU+O28s8i
	 F+s/L2MiU42foDkOULrnUUwR0KFOeMUeO0R8nHkOclRyy9JJDJ61PvBOta3yqi2T+T
	 bu5GtgpmS5hww==
From: netdev-bot+sinfo@kernel.org
To: Ren Wei <weir@nebusec.ai>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, willemb@google.com, horms@kernel.org,
 gnault@redhat.com, kuniyu@google.com, michael.bommarito@gmail.com,
 alice.kernel@fastmail.im, nicoyip.dev@gmail.com, hengyul@cs.unc.edu,
 jchapman@katalix.com, vega@nebusec.ai, caoruide123@gmail.com
Subject: Re: [PATCH net v2] l2tp: bound the reorder queue
Date: Mon, 23 Nov 2026 16:22:55 +0000
Message-ID: <179545097577.3294.7064004194449781385@kernel.org>
In-Reply-To: =?utf-8?q?=3Cccbcb9ac392bc81663a7a14691058b3f03eac3c0=2E1795437?=
 =?utf-8?q?306=2Egit=2Ecaoruide123=40gmail=2Ecom=3E?=
References: =?utf-8?q?=3Cccbcb9ac392bc81663a7a14691058b3f03eac3c0=2E17954373?=
 =?utf-8?q?06=2Egit=2Ecaoruide123=40gmail=2Ecom=3E?=
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
