Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776495;
	b=gThYA+vfdCsFmdO1nedVjsXjPCl20a0kxpnOEIbkUZnhbJPUEwdbPoLXPAVrxvs8qEiw
	 VkWNLNs5gIFutxntFOTVGzUjJvcB5z5P/b0NVi3mzn/4M7atH0TBg9U6ev0kGYlR3NuKp
	 OMFtPJyrNRd+70/Jj0ht/e+f/1JvzzUoglJOYMKbPB2QdoLEq+zG3J+U4Xkas174Zy0hk
	 UD1Fe2idxLYFOJIQ36+eHGrvb0TQfBXmTTlWeHz2lFaVS3Y4elGIj4DSKudmCOFz2Kr2j
	 yGRDYf5K/UmczS5JYcScuvO667f/KGTchYlNHe4fkbsRQzBHLYrARewk+MjDCI2lX4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776495;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=di14oPf+t9fgMMX7YnmMPb+CKUkBDd6s/qyQreZeneQ=;
	b=PlzwM9ps9eK8qPfIgYEhCoDFNf3YqGFhgHSA1LD/hqnlJAaX+WAnidjZ/bWYlyacS2pG
	 8Agal0BdFS+YC/jTyctw/MQBaK8NvB/S+Hfressk4EF56+yvw8tpJ7HCg40OHurNniAnC
	 P/zAIR+S7djKlXXLAe78yw2kF+lvepGQiOh8d2m2wjKriaf5D5aGqonX2Lw4S7d2yoxU0
	 1LQHm31NrvVj1VfH0CTo+q6HJQkAHRYTNEIxt5qLC8dnUlXCbNYSb7Tn+amg5uOtULv3Y
	 ZtCgpun22gc/6EGcN8soauv1cVypS2fP8z9JgCb9abYVefwPNGe46aBXJyOjkbR84bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=G5doIFTT;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3C606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=G5doIFTT
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jbVW12W8gzNm6Y;
	Fri, 27 Nov 2026 11:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795776484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di14oPf+t9fgMMX7YnmMPb+CKUkBDd6s/qyQreZeneQ=;
	b=G5doIFTTOt0Av8CXQCX2mdTmebk6lVMJKmhiSv7phmzTKGOS/tvyoC+07DOmyXwWPAs8H2
	YcMHLoQAFm6zaR9WMxXXQfXc9XAP9Co9FHhY5oYKSKS+TZ+po+H7A6YrENimD3ugc34ZvF
	fqqqLB3pyQmpwBTjlxeaXsiIX6gGGqgL9lumXG2weSJxBrw9SBOxqZiqFhkjyznfJUAQaQ
	WOnSY9/zujgX4ngqE/vh3Itz8yHI393hcNhYZcDUfJhNgUkp45MImvW060VsvZHpcpCXrh
	m9s31yFzcpw5d5mWV4fnN5SY2gfjMbFtXOn7JNKMEc3S3gvn75LQ2jxYVI40jA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: Re: [PATCH net-next v2 00/13] ipv6: validate cached dsts against the netns route generation
Date: Fri, 27 Nov 2026 11:47:41 +0100
Message-ID: <20261127104742.333777-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795642432.git.dahern@nvidia.com>
References: <cover.1795642432.git.dahern@nvidia.com>
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
X-Rspamd-Queue-Id: 4jbVW12W8gzNm6Y

I ran my reproducers on this series (on net-next eb6d6c80d354, VM with
lockdep and PROVE_RCU). The races are widened with debug-only delays
after the lookup, between route selection and the pcpu dst lookup, and
before xfrm bundle creation:

- an xfrm policy inserted while a TCP or UDP lookup is in flight: no
  plaintext once the policy is in place
- a blackhole added while a lookup is in flight, with and without
  nexthop objects, and a pcpu dst rebuilt by another socket in that
  window: nothing sent past the blackhole
- a block policy inserted between policy selection and bundle creation:
  nothing sent
- a PMTU exception across a route change in its subtree and elsewhere:
  the learned MTU is kept
- a corked UDP datagram across a pcpu dst replacement: sent

The issues I reported on the RFC no longer reproduce. fib_tests
ipv6_nh_pcpu_stale and pmtu_ipv6_cached_del pass, no warnings in dmesg.

The reproducers don't cover one lifetime issue in 06/13, which I'll
describe there.

Tested-by: Ralf Lici <ralf@mandelbit.com>

-- 
Ralf Lici
Mandelbit Srl
