Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553194;
	b=h1lIb1HcOc/Ep0fe9HbxrWVM3BjzI7Fy5U928KTUZtPdGSGBqYKknxRigA3SaDm8G8Qz
	 NmVTBS6MwVCC8Q/ub0q3qxdf3x365buko4c+Jv0UpWj0XCG/dwDRQ4OCu0HpcGdjD6GVl
	 5tqHeT07XUI8xSwYhIOZAO5DKdQbKSnk5OFtVEhd8SVLhtFXqwZsaN9hSu0u2OX3lRwYE
	 bp+HGPlyoRIH6pQWO59i1rJjdEAYQPhPYFXE6vk8mquUtR11MQPpSc9aCguR5FWCYNrfV
	 Ub0TeXQG5ofdi8o+8xTZ0cTVY92gDsngB9ywbUVsTxTspAgHVD5itLvjEvTL4hNNo6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553194;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=UiI3Y9ytEFNZ9auC1QhMx1hXzCdFx9m8tVRxBWmdnDM=;
	b=3PT5lFTyQJ2fosaCkO/FEN+nQYs42JujrY9TsAWKp+HVAgLQbXqHW+joovvzRXazQJqP
	 iE6j3kDWLM6DiwnhRH/BKIdWk9VNQiRCeN84d0RRoUA2tgecOQ24JEodeUI9tGtARBKE0
	 tbLaqjT9IleMdGm4e6P3u6hW5JJvNxFtw7YlmesYUhA5eq3KBNsWc1mpWnvQDr6UH90Cl
	 9L+V6zspwxqgemuNfObRr8aW8w7jYClnNnwgY6+roBBKOKd2U1qfIaDEOe1WE19Okptze
	 LplgG3ZzKVCkLBh2apnBCM0li/pIt2oIjyg4dkGC0UbZpEBEpQ+TfNsFQlPykyI/ycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b="nGmqpG/6";
	arc=none smtp.remote-ip=195.10.208.52
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585AA606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585AA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=nGmqpG/6
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4jYvx13yhVzLmYt;
	Tue, 24 Nov 2026 21:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795553189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UiI3Y9ytEFNZ9auC1QhMx1hXzCdFx9m8tVRxBWmdnDM=;
	b=nGmqpG/6tNDMWkYNrYANu54v2lGepgEIH2UDzSZ9c/GmxnAX50SgxOCdpaaShXfZW/2fYT
	scm+ddi6AQOyyWSB+48C5sMoXIYMGSX56O4sSehyUo7zrkReWsv0LWwbBdMaBfHd7MsHec
	oNf99RONgOPB8L3wK4AGYaSR01RshuSMTUf9bep28gsc2nLnuG3+jKL2U7X34VbSzD+5lU
	DGi8Hf64eBzv9wjSQFsWmrSn9XLLOX5vqx/kKNMhKbXinrAnYU4pThhqojl4U1frV4sCY/
	5907y9dL3LkBs7mmYJB7QCveQIegcIAVRsgh3xRokUAqoLL73T+54y330bToAA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org
Subject: Re: [RFC net-next v2 0/7] ipv6: validate dsts against the netns route generation at lookup
Date: Tue, 24 Nov 2026 21:46:21 +0100
Message-ID: <20261124204623.45969-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <72ade685-ecce-4215-a30b-25be7666e299@kernel.org>
References: <20261123212623.106153-1-dsahern@kernel.org> <20261124163553.783988-1-ralf@mandelbit.com> <72ade685-ecce-4215-a30b-25be7666e299@kernel.org>
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
X-Rspamd-Queue-Id: 4jYvx13yhVzLmYt

On Tue, 24 Nov 2026 10:15:40 -0700, David Ahern <dsahern@kernel.org> wrote:
> IPv6's finer grained invalidation of fib changes is why this whole
> cookie caching mess exists. It is a performance optimization that to me
> has gotten out of hand and as you reported is the cause of functional
> incorrectness with both xfrm and other caching.
>
> I spent the morning doing a deep dive on the claude assisted patches and
> really like the direction. Making ipv6 fib management and invalidation
> align with ipv4 should remove the need for all of the cookie stashing on
> sockets and elsewhere plus remove the cookie argument to the dst APIs
> including sockets. ie., it is a good cleanup and simplification of the
> code base with the cost of more invalidations on ipv6 fib changes.
>

Understood. My goal is to get the race fixed, so if this is the
direction you want to take, I'll drop my series. FTR, I don't think the
finer grained invalidation is the culprit here so much as reading the
cookie after the lookup instead of during it, and I still think the
per-node scope might be worth keeping (v5 shows that it can be kept with
validity in the dst), but the trade-off is yours to make.

Whichever way it goes, a few things I found while working on this apply
to your series as well, some more broadly since any FIB change in the
netns makes every pcpu dst stale:

- A found pcpu or exception dst has to match the lookup's sample,
  otherwise a lookup can return a dst rebuilt after the route it
  selected changed.
- A replaced pcpu dst released with dst_dev_put discards packets for
  holders that use it without validating it again, such as a corked UDP
  socket.
- Dropping the slot's reference with dst_release while an xfrm bundle
  holds the dst as its child can free it under a lookup that read the
  slot without taking a reference, as the bundle drops its own reference
  without waiting for a grace period. 4/4 of my v5 defers the slot's
  release with call_rcu.
- Stale exceptions need to keep their PMTU and redirect information
  instead of being treated as misses.
- The forwarding sysctl is read in ip6_pol_route before the generation
  is sampled.


-- 
Ralf Lici
Mandelbit Srl
