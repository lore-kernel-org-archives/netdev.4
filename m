Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098499;
	b=nOxO3JNmrUfb23/qQIG8J62wpksvydkUAEVZf5UyQOX4ZzKFPQM8vG0GBfpncmkT5UTC
	 mI6P8FPa6hLczbkqv5LZoqag8i0sQa8lnuY3MDTn29mlWHXNL9KVYGrXlSHjHA87Etut5
	 02y6zo6ouyrvO/b1QLHm29alDyvlFQYNDqFGOdAC+x2u3j/GTUbbooWNWsrfX1jlHKSqV
	 9Im1QcK8SRdO7tMssEpSlWDIkovt6HGUDdKI9NmRQsL3sehQ3LLHWt1ePAmv9Pc/QyL17
	 86He3B0Z1waXlLyh0qUS+L3KZlGMoqNz2xVsJVvhwoweypufpTmPKNUyD/keFe8paOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098499;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=MA0rmVdoB4ZHMEu4Z9kVfDl1UvAVxAGHa27+P7hEfFU4XkC0Hs0Rc7YaOoBZUSfdWLWI
	 hjnKab3fh3sj8nIlD1aSdV+/bInbFbhOXBxSGEegfqsJVhyNvvvLgIr+LQ038ZD3+X1mL
	 ofHZwoiEosMp1p0WOhkynA9Ovcv6oCVe6Y6f/AM2b10QoYc+iWBNZiU1UYRzB3/OklhCl
	 i1GZDJC4d2xx+p2YZTS3P8T4QUMhWYmDsf3u2Qq+mReDN8WDDltANsbT1VuJ3rBojj+A6
	 gyTWzK/QVKF9jy8htGF6i66uvM7+0cqqS1l9DWxaYbC2wq8pm753aLyWpmLD2n6a4kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E1kBu/Zn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FA1606A335;
	Thu, 19 Nov 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1kBu/Zn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E291F000C8;
	Thu, 19 Nov 2026 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098498;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E1kBu/ZnOr0LnYi+6ucpsnea1B2jPnpCgLUhQXkNOlRTXuny2H0bAxqdjqznAmKQL
	 Z21eKGqJqAYdN6nOJWeoTZIeMAQ8udVFdN0PjGru90B82fXViLTlUHPJoID2YlnXyo
	 YQgRqkC+pTe7qYD+SUDPeFWUzlNBdM8Ch7OAurtwp9U4YnT/qIkBiyueimvphEJV2e
	 yCC9C6oQ3yLTRv4bS1BQ3ST1tW1P8xlRtq5tfu3EBPQp3HSNYfqUP8DP+Al5c8uIyE
	 FtFMrolMYLFq42NTjrmm0Iv+t3pafcusH0B74zZOEWVUzMXi/Qm7pQsP3c3nJRfLi/
	 bpgylq76L+uog==
From: netdev-bot+sinfo@kernel.org
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Hopps <chopps@chopps.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xfrm: iptfs: bound the reassembly copy by the buffer it
 copies into
Date: Thu, 19 Nov 2026 14:28:17 +0000
Message-ID: <179509849790.3291.5868758740577948818@kernel.org>
In-Reply-To: <20261119142308.3272570-1-piyus@iiitd.ac.in>
References: <20261119142308.3272570-1-piyus@iiitd.ac.in>
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
