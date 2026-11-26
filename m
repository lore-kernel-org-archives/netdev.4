Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681116;
	b=OYPo1P3fVVUN/duh0pDnekFn1746lZu5xmkGaZigBD79FDUApNPqZ1OSSh02Q/skXrNS
	 /R7+VAxA8hy1c/2q22cdsz5CblnFhjobiA4qpCyU1NGQyYc9nKxlHzEurwrJNh6ekAhPN
	 thM/H4IdbwWOzXHcw/tkKH5tLffKrRItvXMfgWMJ02m0afUukUBagYyt4yQ3A2W8mFvFk
	 jo5DyOV3fR5+dLS00N8rw4QXsQV3e2UousmvdtFOcOEpPiQu71p7njLes3fA5h2PTixPs
	 p+ORafK9kPYdcOzFBfZVb/zvCkYoALcBNggcDQEkl8DMgxapYcIETarKQ/9z9LomkEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681116;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=UpLc/rN/vWzVaPtAQzduu37NyxP5DYnIraAI3WjNvchofjdtyOPhLMCn8iwshKbMEHDv
	 2ptCdD9dm9K9G0PMdtfA4Ol37TyG3hpucjD3bqSn0Lz+OJRLR2qtzE+rfQe8gdAUR0RkE
	 aY3vHMW1CbZz1LPV/e4vkNv0heK5PTAjMptrjWqsBD3HP6Z5oDw0QXKpk1AJ0Z8vwxpIW
	 8lzgB7aKLVSGfx/bTeqxQcIC7W42i/Ct9r/bMcgxLtYK4dJEBQy3oosPD9gho38bQ8mWC
	 ggI4lcVEaFybI8yfNXwpV6aRyL2VbkOFkA09wW57lmRIT1h4HA7nBaAYLtWg3tDgKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Sk/Xl0e5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A99606A31C;
	Thu, 26 Nov 2026 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sk/Xl0e5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE911F000C4;
	Thu, 26 Nov 2026 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681116;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Sk/Xl0e559YMB5cUarA4ASsvDIq9xLwofyNzneuUzIOqp/h9vXMkCeRYCDkcJlC8v
	 1AWDIDJ44Hjr0D+5VK9cduLQm7wiQnRtwj4+TmbOzRDOafNM1/zh1mqmnm2qhyDRJg
	 vcsNpFWCcXi+oZw/3AVzCn9a7zDCOC8kJOHvZglxbE8nHTWg8hFONXHL5fB5HprJ2v
	 M7lHTo/ozZyEsYanqNho9UZ4xY9Zqo1gk5LoCzeKK1fhS3wvTwbJ81PJqtE/+sMeXi
	 3aaung9RQVMejVarM905b7ytFyeWuXGH5XBJQnUYchGMfJkHY51GCZdz8JVmnIGE4L
	 V+JDPmPEwylow==
From: netdev-bot+sinfo@kernel.org
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Sagarika Sharma <sharmasagarika@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Xia Yan <yanxia@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipv6: advance the serial after rebalancing in
 fib6_ifup and fib6_ifdown
Date: Thu, 26 Nov 2026 08:18:35 +0000
Message-ID: <179568111516.3294.6279071790998998021@kernel.org>
In-Reply-To: <20261126081353.55240-1-ralf@mandelbit.com>
References: <20261126081353.55240-1-ralf@mandelbit.com>
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
