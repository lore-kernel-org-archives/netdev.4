Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952685;
	b=iwLOzZOhrXN7FYJ0Ui7Y/iJ9sHoLO63pYkVIABj6Rd7hhMX8Tg+CGhzVQZee0yLHLvH5
	 TRTurjlFABTnxshKrJplqFTVLcxjGBMMFckrXZEIE8EP80bWq6x05QDcVDXMCYBYv5BEr
	 iDwXeV3Pgzi0ztePz3/3uKQHa9rSzQxHdl2qXEyMeMou4+sPEfGMcvZ53syMeCDpPWY2O
	 U/145DUYC8aNfzBtVxB1txGe8MwSkosrdPMiAsGwBedUZuKLyUyWpii6gonH4EMreXhCC
	 iYbG/foWxIEqNQAf/vGPeJeRY+moU3Z9l+HawvlbtLHvsDninRWDjV+ydlHvT4ht9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952685;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=NbJQB0XsP0J0cTEnTRuXWp3JSA0+Dcyl7DOO/y25OCajhNmIEzp7PYfV7MWjFTIrXmjv
	 RZ1h2wdkjTjJR/XXZF3D+s8N3mys4l3r0C07RKOXXwZU/UeP4HNKydIIUQIAwlmLHPN7f
	 +RFka7fYDA6OMpugsbHOvDOBSfUYd5dsLg4Tj9zK8gZtG59dQura3dcRFLsSi84lyjn/h
	 V0q6xauU0oidn660Nj9Mm6A6rNsn4PwpuX+kyuWBG5o5C1x9X7jS/IVl2VTfHaHc7RDEf
	 ras6FyEcDFxeaLooMxQ7kKOJtWjXUrBW7PUT4PgQChIIB1JkK1uQoEJFcsfkpvnERYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TOipi2Gn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1087B606A32C;
	Tue, 17 Nov 2026 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TOipi2Gn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8F21F000C4;
	Tue, 17 Nov 2026 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794952684;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TOipi2Gn9g12jJUnbbeLWgeIDKXmICwzCs1Wg7VcUIdYuZjNFzZs8G4rUW6repJNU
	 hMK3ZKRecQ5HHNuG8ZyLRRbUotGqw5flZJxrciOCOics2VkzzsKV2xLn1qui4WOIZR
	 9VtiXuJGviCSwgEnvSPLyvurh8XmzDkAeMofWlx6cfx6E/n4srYPGmD0dw28p3TDnK
	 xrq8jWsPZXcgl4BMzbhh2Er/ezVHevLzuma7Widr9ndSUegjosArLmqGvFTj1YRWk3
	 Jb7Pb8zodjTtr9HxYbFlL7XBug+Y6PH3GltpJa9YlK2ylkEnGn1LVwrxjluBYSQeoM
	 YrFMJiM8vN0Rg==
From: netdev-bot+sinfo@kernel.org
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, 0x7f454c46@gmail.com, fruggeri@arista.com,
 noureddine@arista.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/tcp-ao: fix reset key lookup for IPv4 segments on
 IPv6 listeners
Date: Tue, 17 Nov 2026 21:58:03 +0000
Message-ID: <179495268339.3291.8580287623562744537@kernel.org>
In-Reply-To: <20261117215554.68071-1-dennylin0707@gmail.com>
References: <20261117215554.68071-1-dennylin0707@gmail.com>
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
