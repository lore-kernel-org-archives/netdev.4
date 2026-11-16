Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840349;
	b=Qi9VzX5r1I0GS8cGQFSxr607rEGcRVmM3b3p/IPwCOPCy7ryxJlqIhbDrp/jLbZw37aU
	 Be/6AR84q0e6z2TMBSRf8FEVJAzx44pDdmHTY7C/TfxOjeMfRGhtZcuol/g6924Q05azI
	 HnAWK015KFT0uqmG3lUHY41hp9ZHvIHr732Cnygy6OZONx1yPsTnT/sMTJi7v60rKnbmC
	 ol6LwidawyePa5gy5bf7dGYbi9m+0nuvfiLezW1tsPfEYECH8B+bVG2/VEl5pscGLtP+1
	 ndifXlUojjoTOa49ueJfug0sPXOfttjngWpITzXI3UI15UX/gWTkIBLQzVD8X6NbjvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840349;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XV2K/KvxG1pmck68zi4jFRg100yoYdgSaWbWlAKHt4Q=;
	b=QuPpz8H5zzm2ezhg7ToZAxyO5KsEBOY/eZaUbMe1ioXgcRZNFdrSmXyEXQ/f2QRyu0wv
	 soXKAddpf98l6EGNI4czBr8BEBle4F2jWQd5c3z09tq3rnMbRq6jxDLKMi1+yu0z+nfPg
	 q8N2NDKyDRQHlw+S/m0t/3S444pdSgrj5oMQA/9s9CnJY5Q8MvTB8tEBRE2SVLwaCpvde
	 af9Kip5XooRPjEqXA6CgjSF9/BcrJfyDnagReuwGPT93hAydtGMADMteZtcl88LAfftyU
	 mAJBbiKuwQ/6G+Z2pVIteHh5AvDcO6RcS7VPgncgTijljtok/VcJIY7kJ3Lv1vc/jlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaSDVFnQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B09606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaSDVFnQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BE61F000C8;
	Mon, 16 Nov 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840349;
	bh=XV2K/KvxG1pmck68zi4jFRg100yoYdgSaWbWlAKHt4Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EaSDVFnQTdfMgId9MNdGujUKf+M8BdZah4ehwXCT1+dOvytQ4Y/rQYD2wJQUdIfns
	 GQYbwcvu9HTLZXqg8vyTQNmJy+RM0WlJgAdnEB3l3oMLEPQahcmHUnOAJfqiFVscQB
	 dbM8lXOlxoAd8ZavWNCFcGKKwxD1fXooC9zlg2ocxxutQQBRrsfJ4zh5EJBFRf1lXs
	 Rm+GLMOST2p+rT+QFV7TieS4ZH/9WgTrvqqGB4XIy9eksBEZ2HP4afsc4tVYCeyn1G
	 i3i6V0Sl8JRTuUZLV/sltL29ux5g9tJZWBbFKlbMODmxQoSpHH1e3K5fD6gRXyDt77
	 kgEbcJvMxKYrA==
Subject: Re: [PATCH net-next v8 10/19] net: ethernet: cortina: Separate RX
 buffer capacity from free queue size
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:48 +0000
Message-ID: <179484034800.3136.6036481481685475062@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-10-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-10-f55bd43e02d3@kernel.org>
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

- [Low] The commit message has `Fixes: 0bf8c8c94af2 ("net: ethernet:
  cortina: Normalize free queue pointers on rebuild")`, but that SHA…

--

net: ethernet: cortina: Separate RX buffer capacity from free queue size

This patch keeps the free queue descriptor ring large enough to contain
the retained hardware read pointer. The RX page budget is now sized
separately, from the configured port RX rings. Refill occupancy, page
metadata and the NAPI refill threshold are bounded by that new
freeq_buf_order instead of freeq_order.

> Fixes: 0bf8c8c94af2 ("net: ethernet: cortina: Normalize free queue pointers on rebuild")

[Severity: Low]
Is this Fixes tag pointing at the right commit? 0bf8c8c94af2 does not
resolve in the tree. The commit with this subject is 1e7aa52a9993,
earlier in this same series.

That commit adds the floor in geth_resize_freeq():

    new_order = max_t(unsigned int, new_order, fls(rptr));

Page allocation is still tied to the ring order at that point. So any
retained rptr >= 16384 forces an order-15 ring and about 64 MiB of RX
pages.

Its message only says "a following patch decouples the RX buffer budget
from descriptor geometry". It carries Fixes: 4d5ae32f5e1e, which makes it
a stable candidate. It does not name this patch as a required companion.

Other patches in the series do state their pairings. For example,
"Preserve in-flight free queue pages" says "Backport both changes
together with their prerequisites".

Since the tag here does not resolve, could stable or AUTOSEL tooling pick
up "Normalize free queue pointers on rebuild" without this follow-up? On
32 to 128 MiB Gemini boards, open() would then keep failing whenever the
retained rptr is >= 16384. The bisect window between the two commits in
this series has the same allocation problem.

This patch also cannot be applied directly on top of "Normalize free
queue pointers on rebuild". It changes geth_freeq_page_slots(), the
capacity-bounded loop in geth_fill_freeq() and the
freeq_recycle_pending path. Those come from "Preserve in-flight free
queue pages" and "Recycle claimed free queue pages", and the commit
message does not mention them as prerequisites.

Would it be cleaner to squash this change into "Normalize free queue
pointers on rebuild"? If not, could the Fixes tag be corrected to
1e7aa52a9993, with the backport pairing and prerequisites listed in both
commit messages?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org
