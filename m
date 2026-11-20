Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182576;
	b=SqFzma0rwLODtrwE8YxOcSxUOkMQo3gCHASfgQfoikpqcwuUMmzH7tBUyFU+aXL3kUsd
	 etNEuedsxW8V3/kFGhhCWLG5eyn14Ty4TU2SYTLRVfv6FsRRbGDPToyyUdsLxi9on7sJa
	 YIxDOklGeT1fVzmnwHCrRT5xE4jIWlly93kDl8dqd3MDCItXk1zwBZfaw26ehKo2mLOQn
	 ktLvNEF/IACdBrA2oTLsy2IOyZku3XVyMdGFqYpiITG2WKylNlgzQhyPB/O3CK0jjXPem
	 aUuwDQdu37nc8Bz2W+aoCoz6FkkMnKs4j0ddw+X5iA2H3zbOT8qeUzFJwGJLjXhBhGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182576;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=eHjmk/z8Jdt2IsImeZwOgMNJKLupv390gnEU6+SCCOlkQQ9h6eq3b1BJj/aMI3r+z12m
	 Ex118yJ7V8NLw1RXlwwbfWCE9/jldReeT997riOmOW2qk4tB+7FfShRkqlizClbccPzn4
	 C9SviBQCMRk5EwzsfCCTLSbEZ4ZW4rtMkl64iaKFFV9FOGHDygFp8/dTlHpnRE/h9v6pz
	 6pAcaUJe6Fd79FVyiLx+jsaqp0HfZS57+AeOb+4r+9DpxgEI3oFbb5lsWDHykeymzTFg7
	 qXS5cALXbfAm11TYwjn0FYxWJoyojAEGRh2Kri4t0Hn9CbUhvOgSthGXVOyFg/conNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QN9BTj8N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0A60A260A;
	Fri, 20 Nov 2026 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QN9BTj8N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FD91F000C6;
	Fri, 20 Nov 2026 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795182575;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QN9BTj8NdXJjCmckYL5lmbjNpfr2kJoT2AvvWtsiI89R5JzJM+zyM05EOsiHQ8Xdc
	 4Qe2i1xxUjdQIr1jyNQaNjSgOnceAD40jyuMbXYr54CZzIeI8kGQxLQgmJePvS2+sk
	 2+OYPnnLQCPNdQn1oD9ZolX+WXdbuSixOOPcumEuWSjsjTGJw8DxGF79Qft4tZGc6d
	 N4D+bVNtAsiWb7iy2SRdftc2V6yeQfwDiqoq+lM11lyGW29JtYe7lxh14Hk5KeczaU
	 n4Mme3EgVy26V65sYVdeN/ghdkx1kj+Muo9U9jjqvxhGe/tAbt45DcMPR1j6nap0+S
	 KdLoGL9XLcW+w==
From: netdev-bot+sinfo@kernel.org
To: mdshahid03@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH] rtnetlink: fix NULL pointer dereference in rtnl_get_link()
Date: Fri, 20 Nov 2026 13:49:35 +0000
Message-ID: <179518257506.3291.15373002688577259730@kernel.org>
In-Reply-To: <20261120134548.214126-1-mdshahid03@gmail.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
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
