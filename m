Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405332;
	b=JdPQ2URD+V2nSSoUGWMuxrok7vdUYSH0hVowFV9cc8kuy+OJIIS0BFldzvqslMxaZquL
	 Y6/PafN97MgJwJ5z8uWnCtDm0mO9sFuJXm79PrcDmGbNgd0BbNFUexobEDPRdOWzmIXN/
	 NtdYhLWQEkQUE2J+iP6HYaUYa+4YRTIkEnSqvxycHV3SErie+xN9NP01+T6y9uoL2wHLV
	 dVZTJuACHBzoj6QhzsMrgtoaTZ/gvAAZ2DXoqRS0dDaBDi8slv7MfZwWuQcSKdhYn8Ev4
	 Ilx4krBdufSl8k61nQhNsefMCknqsj+O+og8VPzaKdNrfKETN257mo8vDnpbpZ6cS1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405332;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=J82r7e/StwMZ0ryZHVu12IQ8HJkOX5ETc1NfMu0E98o54ACoqdu/sHg8A0Q9UyjID4fW
	 RzaBrGekdrU6rtP0PDPC33Ll632dQtcut++r233SLNrCAQeUsUrROdI5xdbRx8OeI4M4x
	 z7+TMZoDrvEY/WAKHyAjXg1w/9bQHOCC4DbcdCm6EqQYbuVfa2hCBSZ3Z62azqv/Qnujd
	 v5K8HoMZmMk4tUV42bHaEpo8Ds5VYowvd+E6DlTTgUhyW7F2sPkG/XDd2SDynKpdRXY1Y
	 /iTFlRqXfiiq1MDt+xZaQ8ejo1ikpYVShRLlhdawPUaVKXeL1sCB/mWcCAPDQv6dmow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOWgWcon;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F56606A331;
	Mon, 23 Nov 2026 03:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOWgWcon
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3254E1F000E1;
	Mon, 23 Nov 2026 03:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795405331;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WOWgWcon/9A5o2G54x/McltxY6Z+1qA7UflxclySP7yK94QwOaja3Ebwf/wv9aAl1
	 BVhMG0CNmHK/AlaWfBj0xw5sXhLLgknnbTyQHEpAC9bi070kVonwNI68eHjaeBmYbU
	 F5uHR3gJLRQz2AqWfs0hqYWtN9UFWvhyT0UZ3r9bSiZxzUWj//Tfl1PyAm6IIVxYQr
	 BKgrWux17TcdrYdb4xivQCHtgs7g5DglpUyx/AbJ6SdqmyLx7t/nHkVnb1yPddb5Px
	 EcBAbatx5QChiLhrdJeOyJCQ84dRw7ScR9i1xRWbdkJ1g0xZwjExnDE4x8mkah2oTB
	 fqf5y1fObO+bA==
From: netdev-bot+sinfo@kernel.org
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, 0x7f454c46@gmail.com, fruggeri@arista.com,
 noureddine@arista.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on IPv6 listeners
Date: Mon, 23 Nov 2026 03:42:10 +0000
Message-ID: <179540533075.3294.4368058624378409639@kernel.org>
In-Reply-To: <20261123034047.56745-1-dennylin0707@gmail.com>
References: <20261123034047.56745-1-dennylin0707@gmail.com>
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
