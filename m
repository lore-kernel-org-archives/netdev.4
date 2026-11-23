Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449006;
	b=OmyZK7VtfePe4ux0sqrl6XhfgdB0bBiX2/1rG+EqYVQzHAAcHX81lu3kHPbAjYH3KmE6
	 cgtZWYr65EDOttIoMeP9LglfZqMDjEo1PVPz+RVjxGNXteLeVodlNBI3EAH+dQ3pQMYEv
	 ZRK9skG2SL+cuM/GtgHVLsp7ald+Pr8Z/Y/+1bgqxa7+4YMk5zghjjLtBlub/HCkEvUdc
	 pV30NBv6mlZgtycphnOwo8/bnId0JENTUiG7ccMqxXnDInc5S5/cjfyESeyqns5kgeJms
	 uUitgEOZycdfff3tsueASxHxLDOSUMt0+8Lv420LqbY98uVoZ+PW8X30LbuL8h2GgUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=yMCQX1MK2p4OdyMcruHu0cOeT9j+FO09ksDVPfiPNmk=;
	b=hcXzo+DOIrleKWS2wJn1H/c2pv+CQQ6fWDX3OP/IDZPY9C2QBNA20/iYJs+allKw7Tyy
	 9BF2N0ZSQytJW/mO2NG4YOqjXonf40j9G56nVfor9e746ad8Ps68rMkeNn4gnjq5LThRo
	 zXaDCxV0fC6UGFN0KnvKnRfhmbF6SfFTWK1ocr5Be4XPZhYhvb1YKW2slh7aCNHsR4RNF
	 Z/KgruI371hx5+CYRlsdcEG3mazDLrWcz6ZEqBX4uFXGZy3z28zUcg2fJK7y2yjqy9bC6
	 97Wdim1cFb/JlOP7XQsWJX+pZnTYYTs7je6fRDXNqyypr0RfcUjK1vdxl7lj3XFImyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ywz5HahX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A41606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ywz5HahX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827DC1F000CA;
	Mon, 23 Nov 2026 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449005;
	bh=yMCQX1MK2p4OdyMcruHu0cOeT9j+FO09ksDVPfiPNmk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ywz5HahXA82PCLWk5wkAozGSKIrwvcQxjfT+Ogdcd++VrDC9lir/C1c8SJ2ZQCL+M
	 nUN43R0QT9lbpHHtuJF0gHUOMK86DCx0y9oGmMxrhUn48E+NewnJ02lCOrTuRHRGOi
	 6Nl03QnEeLCp/7wfNx0bZmpLzx20gi0Uv0UYOkdyKpb0yetgeNIjILbywukiJtYPyf
	 hxn201++KhOG/T511n0ck/Z3TCIE0VbTfePJYx231sGUiR0tm2/ZQvCgMN2/TVRIAK
	 FVk9eaTmGkBLaSOSpAu0BDKvgavMbdwhn8bOuEK7t8Ju8krwHDjPdbUdNQFTPLGpsg
	 wo/RbxSytW3/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773C1392EE0D;
	Mon, 23 Nov 2026 15:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179544900428.2481748.17372539873029172530.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 15:50:04 +0000
References: <20261118125443.1137177-1-edumazet@kernel.org>
In-Reply-To: <20261118125443.1137177-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org,
 bsdhenrymartin@gmail.com, willemdebruijn.kernel@gmail.com,
 jasowangio@gmail.com, andrew+netdev@lunn.ch

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 13:54:43 +0100 you wrote:
> TUNSETLINK changes dev->type and dev->addr_len, but leaves
> dev->uc and dev->mc untouched.
> 
> Entries added with the old addr_len stay in lists and rb-trees
> that are now searched and dumped with the new addr_len.
> 
> When addr_len grows (eg ARPHRD_NONE -> ARPHRD_IP6GRE), dumps like
> /proc/net/dev_mcast and RTM_GETMULTICAST expose bytes of
> netdev_hw_addr that were never initialized.
> 
> [...]

Here is the summary with links:
  - [net] tun: flush uc and mc addresses in TUNSETLINK
    https://git.kernel.org/netdev/net/c/5677cf0e039b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


