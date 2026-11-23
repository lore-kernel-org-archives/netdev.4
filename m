Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437500;
	b=Uways8U410EOr973EOHgl0tdjjqZ3qm2hueYkx3hCKoLAErk+fxVgK40rXb1V8u/jn0j
	 qcUpFqg26MPwG5vUWZJhfuIdDm4sPRH/243p46oy56SaiEHXGXTlMZlXVJtdDaXKltx1k
	 rwfa5BiHI3pv33p66wYG1tVjCs3kj7RvCt3uxCbiaNWdBye8SUlSQJ53bxHuAcC8CFlrz
	 NEZGXEIl1dDjC1YUpZohT/DOE96oqdxOMRTAGEEMgoQTJMWvd48RwT5OYriwOkQWcFYzs
	 AKDHFkqg8SnWwlzf9c8zHlqqQvj4hUfluJ84Rum03cRb+viOdT2+GnsjiEhqXEb/ang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437500;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=REKbIvFGC6re2WX+seFEEamWBbgbgGh5+w72ku9/ahA=;
	b=LJ47/9QdIGkn/t9rMOJfMfAHXi/xuKe4fIFNkFgZqOrpUo3otvSz5RjZ6/+YeUQqX+U7
	 vmdZTCUKFnZENvJAKgbiLA4NCFgRb601QzPvg9yf/qIzUzfQwnZr7URqQFOcas9xmQ4dl
	 64xxZY6DrTGAUgmsFN+nZMpQFhMSYNW5I2GbgKKCjDrUeZaCh42Lldbn4x6/Cplj8Yc+f
	 3+Aj6z1Ngk9zwxe/jzYcZ1h7IDpXq71WXxx5xL9ewySHd03KCJtAro8Z/QNM4R55YX/pS
	 hU12Ccp6EYDWVcLHzuq4LsyLPX1imIUsjmrEaj2JCIEkDzg6yO6SiNI4SP1B3rd1+Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=xV938aXW;
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9C606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=xV938aXW
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jY58221lZzNlGl;
	Mon, 23 Nov 2026 13:38:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795437490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=REKbIvFGC6re2WX+seFEEamWBbgbgGh5+w72ku9/ahA=;
	b=xV938aXW5unha+YVDrl/J4RjtZmjzpEexAwcER3hLLNE1eYRxhFIqWBi8Awe7m5tYm+WGZ
	eTMmpNJLrBzKysPcG3vjNq+Q9eUitLZ4rK6mahmaovYKNAwveOiBQ3iRMCGrhZfOVIy93R
	agSMZ7xcRmkC5ukp1AtlL6STuF2uSPBr9tLCkqwGQKGxSS+JZUd4p5DzefLaM6e3qWBTwF
	tti3uOLnIbkRM2W3jXenitGvxRgMVMlG1wj1EBAZT5/s2exsqSNpYyCDpEr4ZHmVVZ8e7t
	AYBfPYD+TZjnw9xRRByvghx6hCKKmQcyqinvE66UfFIb1YvVT3gLQBFYksYaIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	David Ahern <dahern@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [RFC net-next 0/6] ipv6: validate dsts against the netns route generation
Date: Mon, 23 Nov 2026 13:38:00 +0100
Message-ID: <20261123123800.406950-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <a31eccac-79fb-4fcd-81ea-243592f20c58@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org> <20261122222717.126333-2-dsahern@kernel.org> <a31eccac-79fb-4fcd-81ea-243592f20c58@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jY58221lZzNlGl

On Sun, 22 Nov 2026 15:30:29 -0700, David Ahern <dsahern@kernel.org> wrote:
> Ralf: This aligns with the direction I meant in my reply on October 13.
>

I see, but the concerns from my October 20 reply [1] still hold. There I
noted that a stamp stored in the dst would have to stay immutable, and
that reusable per-CPU and exception dsts would have to be replaced when
the generation changes, rather than updated. That is the problem I
describe in my reply to the cover letter.

For anyone following this, the analysis of the race and the series
addressing it, now at v4, are in [2] and [3]. I would have welcomed an
answer to my October 20 question before a second series for the same
problem, but now that both are on the list, how would you like to
proceed?

[1] https://lore.kernel.org/netdev/20261020132817.468329-1-ralf@mandelbit.com/
[2] https://lore.kernel.org/netdev/20260901122501.482920-1-ralf@mandelbit.com/
[3] https://lore.kernel.org/netdev/cover.1795166508.git.ralf@mandelbit.com/

-- 
Ralf Lici
Mandelbit Srl
