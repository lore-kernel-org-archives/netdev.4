Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163152;
	b=L+w6ylUwx6XWDDUok+LlWl8Jxz1n+fPOVB6QUN90wE8AYIVJffES3GayPFBENDDK9CYt
	 A4wXN0Fh0ua751IMbWLp7N3X+U84FK9nPeFx0CbDcbTqBXDlDXvYtHdwis7YnUJF+bOon
	 dLimN3UcwX41M/UtBNfJD6rGdG5Aif5EeuMuEiFNjzr4panchxvckZLOCfekas6OTFS82
	 S+L2KJGUwtV6E/OJ/CfH8nBl+w3nDm0D5wCM0V5hlDDdfuGKSqMg8JuByW3bWRtrx4BnN
	 1yVZ86k2bm4OcjYhK3sj6YCM+i23N7POBRU3ykQwi6tmQsyGESPPfKT4sb+MtcVLbRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163152;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=IC9XMH+T2hnZHNkyr7/NV6aB8tE9x3aA982mVIUmLFI=;
	b=NbCzzO0M3xtQKJB8Wp0XfaUFz2zeagqFmBcBugz5ufHSqSsqUmzMv7cXkKIoowQAlM/b
	 v9vrFr9bbe1Y9Wac4iqUQOGsXFaHIxz91T4Kf0JZ36HoB9/3Nvax6v5pEKjGmuykhbs3K
	 CjknYmHt7NPlERu8spjp2uktMOXQamqo2k6iYrjzpRUb3KWjnp66c8wJmsYP5UANj/iFL
	 zuhkS5ZvC0XNKbjMvhUJ8mMaBKBRpP7lz8QutWxBeIkXWu9myaBXy95h9NZxBcu6Q0Fey
	 ynfN9WuCfilojyicTXDqZi3QDZaYIQuJTcZp+BPmTzZ/z6UD/NSRTEbCbeQdjzStFHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+KX3P+q;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176F606A325;
	Fri, 20 Nov 2026 08:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D176F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+KX3P+q
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F0894E41684;
	Fri, 20 Nov 2026 08:25:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CE5D6017D;
	Fri, 20 Nov 2026 08:25:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5631211BC10CA;
	Fri, 20 Nov 2026 09:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795163149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IC9XMH+T2hnZHNkyr7/NV6aB8tE9x3aA982mVIUmLFI=;
	b=C+KX3P+qdxZTebUJj5kTuArH0nr5DdVrMljfMShhv4ZQkkvQmh8XFoOYYT5Gt3LPhZiM9o
	vfkuLqmx66pngGFQQ4mPDgEn/YZ0KIlBd3apXmSY9sUpob/KXXqw9iff4uyhA27B/GD1Px
	IRrJ1lorLU+nwb22GKCylXJqvlqrFjNp23cXFT7QZW2umiHhcZTyVVjbUMsuCRq9zStyZU
	EpydEMxuNuKXRXskHkHeRLlEPNx9S30Zej/SHsg+4rnTV16LodVJa/J2j2D2u/B6ghCUgp
	JqIojmp7TyudUYI7SBRJ9eBAd2qKZtximNx6LHx5zcYka9Xxlk9m3CCxIY7gHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrey Misiurov <amisiurov@cloudlinux.com>
Cc: Alexander Aring <alex.aring@gmail.com>,  Stefan Schmidt
 <stefan@datenfreihafen.org>,  linux-wpan@vger.kernel.org,
  netdev@vger.kernel.org,  "David S . Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] ieee802154: keep the original error after a
 netns rollback
In-Reply-To: <20261120065750.3274661-1-amisiurov@cloudlinux.com> (Andrey
	Misiurov's message of "Fri, 20 Nov 2026 07:57:49 +0100")
References: <20261120065750.3274661-1-amisiurov@cloudlinux.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 09:25:45 +0100
Message-ID: <87tslbc3jq.fsf@bootlin.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 20/11/2026 at 07:57:49 +01, Andrey Misiurov <amisiurov@cloudlinux.com> wrote:

> cfg802154_switch_netns() moves all of a phy's netdevs into a new netns. If
> one move fails, it jumps to the errout label and moves the already-moved
> netdevs back to the old netns.
>
> That rollback loop overwrites the same 'err' variable with the result of
> each move-back. The move-backs succeed, so 'err' ends up 0 and the function
> returns 0 -- success -- even though nothing moved and the phy stayed in the
> old netns. nl802154_wpan_phy_netns() then tells userspace the move worked.
>
> Give the rollback loop its own 'err' so the original error survives and is
> returned.
>
> Fixes: 66e5c2672cd1 ("ieee802154: add netns support")
> Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
