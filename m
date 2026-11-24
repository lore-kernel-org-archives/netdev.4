Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508067;
	b=YsRt3UAGHqzJ8Ggf8o8NT9+q7bh0kLLxY9he+jv/KmUaYSdTTyLn6DZJn0gDQoyc+BJX
	 xxU5X4kbpG7R3Nr8C66AiOoOkDC+qUmNav3Ous7jjFTKED/J6B0WxPwIWpTNMRmlS2d0M
	 29HzzszQalIPln9CMfKba396+9GpII5vPbaVx6MhejOgG/ZaPqlU7w/s1hewfq3Zlnia0
	 h7pCgg2vGRwZWvCDlQ2/wx7dhUHSKT+Z6Ji6Ckr8ZeYa/IPqzmXz7QcW/bC/VorTRet8k
	 zl+emGYTytnfKovfynynrSyh7zxqv3KKzFyMwZmhGrRdxMIYd2slpZEGJYSNp5tsZnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508067;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5yQbdgg/AhDIjxhPPZR540iJjRA1kmKFEWdr7jTy2bY=;
	b=lin/06fQk25kskOg4z6PDu1XQDBeGMtUsND3dcZ72FDs769eQOAfiEE+xKUEuTx5N1RU
	 hVm8ZSwsxUDDjVOelPNJzYnec7wWIFmhzAHeUy8pNTEOFlPr0OzKYdRsyRStcn8jYxZZt
	 a1zZFCvN6QS5MjUpfipEacpp6zg3w8TWcReF2rv98covvUKWla3rKGD0RmXYIK++OjcFz
	 VPhjE20NjlxmgJJJP8xfJQm+q3OUik5QII+OUycmn+Ue35jAvZeHD9BpINh5NBO0wrcPc
	 oO9PQ98jc+9N0H8t/clgMYg9jjj18/W9ANbDsMk9PihKkMFWPqjMF0KraXBFM1Eg5MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPAlbcpc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753A606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPAlbcpc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17CF1F000C4;
	Tue, 24 Nov 2026 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508067;
	bh=5yQbdgg/AhDIjxhPPZR540iJjRA1kmKFEWdr7jTy2bY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RPAlbcpcAfCc1Zv+JMFWyMT9Jj/d2i4qsSpoJQb7WnSsnHJvBRbWFmRWxJ90tGhwg
	 kNVXhEHCxsnXFpyuS10clGIAztj0yzMdIVtyGGXzl5xZ7U4xyqu7y2BBv+iGr1I0vx
	 1v0OuUfmTArbXGulbqQ6C36JHC1NR0oZViXmCKvT3dBBKp8RomcfPzPC+BcxOA3bhI
	 1NaME2T/IFKgfOP9rtH/zb+RHwACe0ARP3owbtG0Ws4rbgZilG17P2jzLD8prl/div
	 LFIXj/NXf0XnNgQGYCJ9gqeswazlAvjh+SwFYIBVgS4twtYPBw+pvwbe55VWiGMAoe
	 4Ad5Lb03leyAQ==
Subject: Re: [PATCH net-next v6 4/7] tcp: propagate skb_zcopy() uarg in
 tcp_mtu_probe()
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sdf@fomichev.me, kaiyuanz@google.com, willemb@google.com,
 daniel@iogearbox.net, josef@toxicpanda.com, sdf.kernel@gmail.com,
 dtatulea@nvidia.com, asml.silence@gmail.com, bobbyeshleman@meta.com
Date: Tue, 24 Nov 2026 08:14:26 +0000
Message-ID: <179550806630.3135.7383663676671622660@kernel.org>
In-Reply-To: <20261120201408.3445445-5-almasrymina@google.com>
References: <20261120201408.3445445-5-almasrymina@google.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "tcp: propagate skb_zcopy() uarg in
  tcp_mtu_probe()" says "Verified with the net_core KUnit test suite".

--

tcp: propagate skb_zcopy() uarg in tcp_mtu_probe()

This commit attaches the source skb's zerocopy uarg to the MTU probe skb
in tcp_clone_payload(). It also makes tcp_can_coalesce_send_queue_head()
refuse to coalesce skbs whose skb_zcopy() uargs differ. Together these
stop the zerocopy completion from reaching userspace while the probe skb
still references the user buffers.

> This is a pre-existing issue found by manual code inspection and LLM
> review; it was not triggered in production. Verified with the net_core
> KUnit test suite; not tested on real hardware.

[Severity: Low]
Is the "Verified with the net_core KUnit test suite" statement accurate
for this change?

The net_core suite in net/core/net_test.c contains these cases:
gso_test_func, ip_tunnel_flags_test_run, netmem_ref_test_page,
netmem_ref_test_pp_page, netmem_ref_test_net_iov,
netmem_ref_test_release_data, netmem_ref_test_skb_segment,
netmem_ref_test_try_coalesce and netmem_ref_test_tcp_devmem_recv.

The only TCP case, netmem_ref_test_tcp_devmem_recv, covers the receive
side. It queues skbs on sk_receive_queue and calls kernel_recvmsg() with
MSG_SOCK_DEVMEM.

None of the cases transmit through tcp_write_xmit()->tcp_mtu_probe(). As
a result, neither of the static helpers changed here,
tcp_can_coalesce_send_queue_head() and tcp_clone_payload(), is ever
called. No case sends MSG_ZEROCOPY or other uarg-bearing skbs through TCP
either.

This is still the case at the end of the series. The two later KUnit
patches don't add a test for this path. net_test.c has no references to
tcp_mtu_probe, tcp_clone_payload, tcp_can_coalesce_send_queue_head or
MSG_ZEROCOPY. Its only skb_zcopy* use is a skb_zcopy_init() in an
unrelated skb_zerocopy() rollback test.

Could the message say the change was only compile and regression tested?
Alternatively, it could cite a MSG_ZEROCOPY test with tcp_mtu_probing
enabled that actually reaches tcp_mtu_probe().

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120201408.3445445-1-almasrymina%40google.com
