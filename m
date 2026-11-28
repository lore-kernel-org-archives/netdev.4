Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855406;
	b=WT5sIcFfwzlXAYu4BaA4dPm/8gyk8ZkPwz+v/3YqS7/Hg3s4Wou9HOBacSwVLzRiG/V/
	 BSRz5SDXBh6mgTcjj4kGnxXAziBc/P+NqGmjWo8dc/6ZgZZt7aly8tP/EYZjLrtw1JlKO
	 zxbdeZJSa9TE0YRZS2AGk8orBsFHK4BWm2xDFgWKbBSpMlV66MPMsPE8j9gTmDjLAVvr8
	 qC7arwsHKyGUuuirSu2GmMNRAVhCmECPJ6O1McDgH/Hi32B6tmW5rvF3kXkL4EhQJ4iJM
	 PfYi1hauLEOlj4C3dOr2AvBJjt7/e/+RNTt0wWPiMjHE1OHvQTtYyooKfTSoojx7HxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855406;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=I/krxcear+WlAS4f4RcnFN0MOG1WKCaLc44EUYfXrOcM2sv8oDB29YMfl8d13m+0AWBC
	 6QBYdwR7XxdQE1Hyk90kxOqBNifKpsbH8czd+rsbLw4krcI4r9qtkjIXfWHcBacBPzzX+
	 dqt5pM343/ZYiGcGkhv6km89t3XpcK3T6sAmylHZFueokn854v+FRJkvVH3MgkaLKA5FG
	 z1QqUkcOFH8H0i5rohamFR5YGBJz1FdQAt3MOIc6c4Tp59CxxsSaAvFMMHegr1gMgdGbP
	 iVnpXHIJ0Z/UgN59uN3EV2f7uL/hxIeNCX3ql8Iy+fs/vAmKLi35+CVPgEoekxL5nVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NahH9Fv8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87517606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NahH9Fv8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB6D1F00897;
	Sat, 28 Nov 2026 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795855406;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NahH9Fv8pKbEyKjcf0wCOgNYgMgCuKp2ezUHooJXc3xKsNRS4PFAEjMRNITIyf0Vf
	 Pr5krzw1Mij5+6k66r9eJ6Fie3PEmMxqcMr8T4QB9n4ad/uak6sn72rl/mOR1DkSJe
	 NM6rhYiWlf09Dg62ckxaGfWPirDLifvcKTshGo8GZZfgzW79fAcqpiDO5ldplzHJty
	 I0dH/9Q310cYUb6V/fpTgS9sSvbn7eVqdETE2OBfSKzC09pBQS6DIP+tVjoex6DMef
	 bWeoKhQJMVbx0W+AaUNmpQ9j1utzzU51mhdxcXSvWyHui6+VutVzMm5usFLOROeBCw
	 QFHpaPd1pgKrg==
From: netdev-bot+sinfo@kernel.org
To: Anant Garg <anantxgarg@gmail.com>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>
Subject: 
 Re: [PATCH net] net/tls: publish offload state inside device_offload_lock
Date: Sat, 28 Nov 2026 08:43:25 +0000
Message-ID: <179585540508.3294.6988362720637393202@kernel.org>
In-Reply-To: <20261128084137.94590-1-anantxgarg@gmail.com>
References: <20261128084137.94590-1-anantxgarg@gmail.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
