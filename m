Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531814;
	b=Apw8w22azqFisLl1UW0BmNwjQoonWybeTXsMxNzv071m8nf8/mV9es7A5wif2hEcsxTl
	 3qGfJruACJDK7IqVgDTONuKGvBHT3rpTttV2QwurcoDiXY9wsTD2h6ufjokjg8clssoV4
	 SDV/JEBukAXKLTA5xn9cREetsekzOI+4ONMMszZRS77QACaaTepzvMXCkvZjHrWVAWoyT
	 03BbbzhqiEcq1oOZYx3CQyA/6oHcmf8G+oskSIXiW8AC6x9PIBV1uXe61/BBJjq1Far4y
	 NVrldo6TvxajEpgNXwoL7Bq0gFZ23Gj4uSXnX1IUGwVzdlv83IKRJui2NEfbSx5rDJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531814;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=CBF9MDffKvNzKglDnlFd0w6kDsh+RJKKQzGFCmzCtfk=;
	b=B2HBXY1jBpApTe+NQr+5HPGiFuxD0He0UMyGFOKJcHiHs+bFORBMCS0xcTNanBS+z+9l
	 x//M/gmafY2YwGTx/Nje7crVM4jerHdV06fkmTC50fZO83pdjwS/Y6myhLm4YF0Bw/wP2
	 i9Eh6noO7sXBpQzz6iekFDjciqMGvQBWffNqhoFt8vQ3fF01f4l9wUlIz2iRsJ+kk/WBs
	 gbtkmA7eeOfHWbiuDneB0yyxru39eFdm5q8+EM4MCqEQY2whPiECuDnkdTXvPgGLJ0PlI
	 hppNc7dQuEtrL0IWUBLGXgnzP7K/mmCKYm2sEnrdWMu1jR80uzjlQuigRiCm+rHCSkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="db+8xm/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071D606A33E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=db+8xm/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07ED91F000E6;
	Tue, 24 Nov 2026 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531814;
	bh=CBF9MDffKvNzKglDnlFd0w6kDsh+RJKKQzGFCmzCtfk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=db+8xm/ToiERsAHZeJ/UQpOAEw+wzxC0Hbd/Ww+MWcjE7WIVwGZT/1uZmBfrki2MW
	 VI3AJRUUFFiIvZdUET2Oo5yJaVSdqmDIAXBfTRS9CSSuo0bViKSGaSJt4qmVO4WU9o
	 X4DUk8DzqdHMAGjuD0o9H7TjB+nnBhNDVGVxGIXYJ8DXga4JQ7SxvZsefGzWRg5M3T
	 /EH1tlvkBnm8kU1Ojd1GTpuhh/ni3oi9b1AytIisV4fgH09cegCu5aUwcbSy5bLtkM
	 wjlB3Cl07YDAhaf6mux1r3RG+0I4zA7VO43BwM+mXyjA0SB4Y54sZaFcTPDzVh6OMX
	 R0e3PEjeujzhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F154C3931128;
	Tue, 24 Nov 2026 14:50:13 +0000 (UTC)
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
Subject: Re: [PATCH iproute2-next v2] ip-link: document BOND type options in
 man
 page
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179553181252.3581158.17747932828609513156.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 14:50:12 +0000
References: <20261123052939.24023-1-pranavtathe30@gmail.com>
In-Reply-To: <20261123052939.24023-1-pranavtathe30@gmail.com>
To: Pranav Tathe <pranavtathe30@gmail.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, stephen@networkplumber.org

Hello:

This patch was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Mon, 23 Nov 2026 10:59:39 +0530 you wrote:
> The ip-link(8) man page documents master-side creation options for many
> link types but has no "BOND Type Support" section, leaving the bond master
> options (mode, miimon, arp_*, xmit_hash_policy, lacp_*, ad_*,
> coupled_control, broadcast_neighbor, lacp_strict, arp_missed_max, ...)
> undocumented, even though a "Bonding Slave Support" section already exists.
> 
> Add a "BOND Type Support" section modelled on "BRIDGE Type Support",
> describing every bond master option accepted by iplink_bond.c. Option
> descriptions are sourced from the kernel bonding documentation
> (Documentation/networking/bonding.rst).
> 
> [...]

Here is the summary with links:
  - [iproute2-next,v2] ip-link: document BOND type options in man page
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6bee11c22323

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


