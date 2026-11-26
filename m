Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684207;
	b=ayaHXQsIT90ZLhuw9XxS0vkCfPNDupml+NXK58ZkJBjxWIhHY4ng6FT7YQnE2MJyIa3N
	 VpgXBJv37Fk5EFuBRt3cMYiX880NKoId9o8mZnzWsvrn9j9cs0uGaXo8QQm5bYoAxd9as
	 hLmewChDiIZny2SN3UBWzYoKJzoI/nhtRWTemfaAH0KkJfMkeJZW7Nu5CMfbkUeGFq5CB
	 8yIx4tBl+0R090HqmWi0KBwrO34AJwmDHxBbtWHJCrLTGR+09Sev7aD6Uf+fyauTteYMg
	 +HTsuW2t1gVjQlkaamsrFZYdMULJnaRQ3Riim0kx2jAi+FOCvvAB1iXxE+JYsuCdt6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=SgxZyf1epHH9cP9STALqD56F5wkEmjfhtSbnMxWIYeU=;
	b=E015X8oLuJthqvL8kdXBpp2t4r6F6aSme8Tvdz2QnITmBI3v4zTbpQfQhzTqse98hQpU
	 leUgSK4uc2lpIWZK+1Cwl3TJKECOy3hRsaj51D2d3v4wFzm6uxdnK8wFK5Y3NfVrmioFr
	 zZGPHtovzsYh7EhIz7sW0qqubJlYmal2jijC3doXu0wGu2IcPMkJNlsTuNayGRfTy4mjh
	 OmRSWa1rKCztIjyADFw7BWy12icri5eKUgpgDEFmFCp6zljALfV9nCgW0EbtRxyT+v69l
	 T+uSoH4889m9T5G4DE7C3qs97khGvF3pM39883l4sM9Unc+X/fVec86TgjeBY/WbqZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXP33sn5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE3606A31C;
	Thu, 26 Nov 2026 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXP33sn5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085831F000D0;
	Thu, 26 Nov 2026 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684207;
	bh=SgxZyf1epHH9cP9STALqD56F5wkEmjfhtSbnMxWIYeU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OXP33sn5GBPjB5k3YXDRTb7NZqr0hJWWx2XeuPz6szlbUrIuGPw+XMuaPsQsaQosl
	 msIx2T9aKd7HgUreb/F4Srikej9vF8ghNdGfuskx1HpsRNpcUa0PUhHtRI8fuMbxnP
	 sIRoJ7hnPs11Rv1S4PM7XhPYWNFrRgsZ43uXJ9H6/6bqzw6IjtqPgFX56ontLx7zEx
	 9/g0gXVvRwTLL6voY3tfOQf/tGnJ5a/UkNwt34AHeoUCqEUcmJzkaUHVfVPYeGA5Bq
	 XUueMWz4L1o0AvL0dZo4R07fGFk4bHoM6/tH0ijBadKxvp+xTfG12gR4edziwIt21h
	 AGqynvfDghRBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F147F3809A8F;
	Thu, 26 Nov 2026 09:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net v5 0/4] net: hns3: fix multiple bugs in reset/error
 paths
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179568420577.1689524.4604379702805648536.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 09:10:05 +0000
References: <20261118130330.3026625-1-shaojijie@huawei.com>
In-Reply-To: <20261118130330.3026625-1-shaojijie@huawei.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
 liuyonglong@huawei.com, chenhao418@huawei.com, yangshuaisong@h-partners.com,
 ningwei15@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 21:03:26 +0800 you wrote:
> This series contains four bug fixes for the HNS3 driver, all related
> to resource lifecycle management on reset, driver unload, or error
> paths.
> 
> Patch 1 fixes a vector resource leak in the error path of
> hns3_nic_alloc_vector_data, where a devm_kcalloc failure after
> successful get_vector() leaves allocated vectors unreleased.
> 
> [...]

Here is the summary with links:
  - [v5,net,1/4] net: hns3: fix vector resource leak in hns3_nic_alloc_vector_data
    https://git.kernel.org/netdev/net-next/c/23d8fa6b29eb
  - [v5,net,2/4] net: hns3: fix page_pool leak in hns3_alloc_ring_memory error path
    https://git.kernel.org/netdev/net-next/c/6f22fbbb9c55
  - [v5,net,3/4] net: hns3: fix interface stuck after OOM with full hardware rx queue
    https://git.kernel.org/netdev/net-next/c/72c054a2d6c5
  - [v5,net,4/4] net: hns3: fix use-after-free in debugfs read during reset/unload
    https://git.kernel.org/netdev/net-next/c/c699cd194801

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


