Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852009;
	b=wpbkGrgg1SHJ85kFGl3pR0FmTCwWgmK1YKwdsYWMVg1Qx5e813LNZgpoMFLE46i7uaCN
	 VU7Gq+JCCz2KWPCJINArXXRQhCWq11ix404Ag0rTb1sOYZFKLlF/GWFYHbYdsm9DCpEBT
	 P/CC3KU8efbU7pqQVBHNJkV2o6uHBiRDa6LHCtL7xjNvdAeqnXL/LOgkN7Xsve7Q+HzMU
	 QHYtNESNDD2Q9V0PyHUKQHfS/yFWPqLAPmEOZq9daptu+cbXN5ycjF/fX1BhxymZ/QyDA
	 hjrHm3qsaj+FRiMt+0OVHnJV5oE+J5cSijTgF6qm3OQzQ4UZ5qF7L0ZmJdr85lXPbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852009;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gF72g56Ci+TSvjesQiIFDb3VITnJk5NSTSpsaORhzFY=;
	b=ptiD2ObZ9aC33jAk0ywFN5P2EHp3PhwQ2Z5iui4PbKDUO80CmRJz1CK1CSVCgHIHBIEK
	 9VXHAtuyk+QPbyh5c5CAGFeez5iaPIv7MVSTB8mRm2uegN+RBuwsE+kMOUyA/dYUMVOTh
	 XjdvnMVi3Tb9o5I5p7GqQFF/n55tO/4iTEEntV/addm89PzLBQKgm1uHtXj2u8DMWJBdd
	 IcpJhT3Y4E6EsgjWRU4dm2uOkGXQ1N3eRsPM5UM9MRVaWgMXF8YBao76ec12yiIly+lSg
	 x/rJsaVZfAXkWn87RasDpIrEQlCttOU59DvkvVqyY7gEkUXc4IQmtbygfgB9STYPYsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpcITrfv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF1606A33D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpcITrfv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1C01F000C4;
	Mon, 16 Nov 2026 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852009;
	bh=gF72g56Ci+TSvjesQiIFDb3VITnJk5NSTSpsaORhzFY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YpcITrfvBb6tIUFJRR8rpWdMBJKr7nJaRHzRU+HXWswh0gFi4LHE0LMUJ6TKOxTOu
	 pZv5noBsTXkCrVnzk6QBG91xBa6dPNOTLX3VM6K5aAMP8izFzjZa0tSFyxDDhXyZuJ
	 m2TU4QIvxbbCDFyZTccIF9dfTbUVhGozIzl+YqEgqIvncZcMZmtb+TXF8GEaWQMXrr
	 OIaQmPivt+laeVjLJIBe3wCwizhNswXZjAz+j3PO4a1dGd3chfo6CfSRF7NXVU24Ys
	 cBNGtiab1zRjvIyF0nORM3tLIZwJ4uUs7tmVW/e3GlHXKgzXYeAJp83aWjYcHlrb3l
	 HBfx2AixjlatQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77455391AFAF;
	Mon, 16 Nov 2026 18:00:09 +0000 (UTC)
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
Subject: Re: [PATCH iproute2 00/11] ss fixes from an OSS scan
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179485200828.3802119.8793835146079718751.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 18:00:08 +0000
References: <20261112200046.2164391-1-stephen@networkplumber.org>
In-Reply-To: <20261112200046.2164391-1-stephen@networkplumber.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org

Hello:

This series was applied to iproute2/iproute2.git (main)
by Stephen Hemminger <stephen@networkplumber.org>:

On Thu, 12 Nov 2026 11:59:13 -0800 you wrote:
> Fixes for the ss findings of scan iproute2-20261015-004, plus bugs
> found while confirming them.
> 
> The biggest change is removing the fallback /proc parsing.
> It was buggy and fixing it is not worth bothering.
> Every family ss lists that way has had sock_diag support since well before
> the oldest supported LTS kernel, and the parsers were untested and
> trusted file contents that an unprivileged user can partly control.
> A kernel built without netlink socket diagnostics now gets an error
> instead of a silent fallback.
> 
> [...]

Here is the summary with links:
  - [iproute2,01/11] ss: fix double close on sock_diag send failure
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=b37982780989
  - [iproute2,02/11] ss: drop /proc fallback for socket listing
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=9eefceca4e5b
  - [iproute2,03/11] ss: escape names chosen by the socket owner
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=1f6307cb3b37
  - [iproute2,04/11] ss: size the TCPDIAG_FILE buffer to the record
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f007c85036d3
  - [iproute2,05/11] ss: replay all dumps in TCPDIAG_FILE
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=3b96ffd85efc
  - [iproute2,06/11] ss: bound state and type name lookups
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=762a5601e91d
  - [iproute2,07/11] ss: fix rpcbind service cache
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f8db772d8160
  - [iproute2,08/11] ss: read socket SELinux context only for -z
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=d8a4d9d2a774
  - [iproute2,09/11] ss: check owner before naming a netlink socket
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=b4027e7eb849
  - [iproute2,10/11] ss: keep following events after ENOBUFS
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=a71a7aea8356
  - [iproute2,11/11] ss: report a failed SCTP or MPTCP dump
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=c9295679ad53

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


