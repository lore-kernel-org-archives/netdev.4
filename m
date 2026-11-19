Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069428;
	b=4AJgyAHphJBV0r0TooU+8SV/WYXytIPfukFQiuctOnDZOO6SvuyEI7S/D6qw5rfNFsQe
	 iyWOJCbZ7e/GJzvkQdG89w1GSxN0fU+fYJsv3yguxjpFfx61cE4TzFzt/UwZtkCt/mCQs
	 mQRouaI7+V494EN5dKpsDPQdIbfdxe69KmyOJZt7QZtutumDYBSv5TMGvI0N0MpO8KSlK
	 e4plRRsqZg5yY0X/4Dtzu/egOcN7w2vZzvKN3BuqRG32iYHcYFvliKKazw/Sw0b7qYaBD
	 UsAgQpPYHMMlzAjtqwsfH5Q7RdBO7IZy7BYEnnr/+JOR9RkMyLMWybUglL2xYhTyoLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069428;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=uiBAgPR3mbCilMy3wV2aTt54aq8fZXpS3BLUN2SMcjFY5I7iCMvmNC70yRztfbvN7V2V
	 wWNLC9CeVk+G8Zt0mDEvojHX7DH5iWmweyRkZIrThB3Vz3hldRwZWgMg+DXkO78bSZdIk
	 n08QgEKs6qpTeE16Fuxovr4lO4xvCQqTDk5xmWgMSJxRHdZHU+6jZYrUjQ62LyRwD2Za4
	 H5TF5J4600VJ6Od+dMb2m9B1lsStul/m6KK2T3uHSniuhpVPr9BsrjsSFmN2Lpc+zW/oR
	 3yOlAFUWZPipLDvN83ZVDYJbqCw+5WAC7EOKHDZbw/WhRPO3P4pzb7eRQdOAINOtqWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewIbnYE7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC57606A320;
	Thu, 19 Nov 2026 06:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewIbnYE7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753481F000C4;
	Thu, 19 Nov 2026 06:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795069428;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ewIbnYE72ESNFxiFE11aSoAeBONwIKEARAO3xCxcDDrH1axrlYikp6kD2ErbxQT06
	 /DgnnMu+lxB6aa5saosFuTiJ9gh2GvvffQM2mvANS6rKMwfZYhvBRwYdexAZz5OK8L
	 mM8TTxC5qIhX9FiW9nfD8xFqGwDXsNUtaghpg4O9OLqYnhuaDgRi7oZUXz8i/gQWU2
	 5yl8tbSnl1S5StVDnII0qc8OZigm279TL0u0dl+xwFNBEPWLrTo/kXmJcItu9oc5zX
	 ZcC5UaHlbfnqQt53ORkMI6MLKatogwRL9XlSDjSMFoJSc1TRxUogHWIwzAa7h9vEjq
	 B1SOkbcSvLHkw==
From: netdev-bot+sinfo@kernel.org
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, pablo@netfilter.org, fw@strlen.de,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Patrick McHardy <kaber@trash.net>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>, netdev@vger.kernel.org
Subject: 
 Re: [PATCH nf] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
Date: Thu, 19 Nov 2026 06:23:47 +0000
Message-ID: <179506942704.3291.17367853280181438146@kernel.org>
In-Reply-To: <20261119061751.222641-1-jiayuan.chen@linux.dev>
References: <20261119061751.222641-1-jiayuan.chen@linux.dev>
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
