Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222402;
	b=AFW792/Q57LF9AXv6t1JT8yypj/2tQFPTBgezeGSNw0UzWMEAHo3iTWgJAjqZsQdzjoz
	 kMU11IiyfqfHHnu/kTzTysWMgIEjQqVYrFLeySh3APSjECzY9Hcijp0b2NjflzUPhVpiq
	 uUv2GjNtQgHDbBlufxyig4npAb/4Q4ZUgQRLgfhxgURgXe/vcHgtZDeyTdHxFDLe8eB2e
	 ENX8TTt1Fjp3Rc7msyKA22Sv7OeDslVsXgVRi6pFO9FqhoOqkaZuP502Yv+CiuKrfPigB
	 6yqE2Emp9KBOcVHUA3jenQW//QaU40YEe9IZXaugqMLiYSmLLORhnyAIamWndti1vcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222402;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=EZtkxHUyfJ7tCTtWtdliXvnAkPXiLfmixG5GXNLZH5NGkOOEQFsEt9bDbJ/Z4OGqffXy
	 NLbGtIjmXEs3bF04IiQBanoWqB5RqvmvZMcbwUr2errSieIW3xxhlh7HC+2XwXVQ/GY0P
	 XcH/dcszIKvrfvCFG0SIL//0HqQ2ix2d94liIVH1D32yxpyj3X+uBbJYjajuQL0Bjefn1
	 i4YGzPF86tOn9QeaKf8L8O3IRdyT4THCHgvcIg0q1IOlNuZB9uXTHTm/aZGSq2nuKB/yc
	 LyfJ0+95PhYKjQKQgujZCzPucpLA3fLqBeIRSyx+5FdLigSoedy4NTEdjtRKLN8s+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ad9ULdme;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9605606A33D;
	Sat, 21 Nov 2026 00:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ad9ULdme
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397071F000C0;
	Sat, 21 Nov 2026 00:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222402;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ad9ULdmeALPxz7vO7ttwvsldK+XwwMewWSVOWQEVOnmH/h5gvQ8VEqi6zL/2jwI68
	 TCvEy3MOioxRnhlEuePtV+IT0wT+YySQYlk0ihFWyjcK5f7QJrivdiMaZxTKho6Qzk
	 Kvq+9pPTS3PvYUjE+xOF3ScZOIUk12TaWs8QmLNEZIH/3XuqSu9XDyfPxUY7DPQlcj
	 pKXVkSU0jSv6wXgj4yzdikIN1oTVnw61JMNw7Ou8OGhurZ4zRkUaAnU83wDh6DzbEC
	 qzETv0CrUndznL6Tsm3lXGCeZ21vOFURCOSCRnpBM7KmmSucW1ZSIVR7AjoDRqCD2D
	 dkL7BVk00l2bQ==
From: netdev-bot+sinfo@kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jijie Shao <shaojijie@huawei.com>, Simon Horman <horms@kernel.org>,
 Runyu Xiao <runyu.xiao@seu.edu.cn>, David Yang <mmyangfl@gmail.com>,
 Herbert Valerio Riedel <hvr@gnu.org>, Danny Kukawka <danny.kukawka@bisect.de>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>
Subject: Re: [PATCH net v4 00/10] net: au1000: Bug fixes
Date: Sat, 21 Nov 2026 00:53:20 +0000
Message-ID: <179522240067.3294.10288163066827919663@kernel.org>
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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
