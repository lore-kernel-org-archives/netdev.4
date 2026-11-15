Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770165;
	b=kHTbAqJZGoT9XRpQoEuqhQWbzWcP4KCMHH47kkNLmme4g7L1MzqnYxNyknLWxtbIvJby
	 jB3DEfZaDug3GSTFrQlmSFuykfvHNsjATpffwQs6h3nSEbndh1eoLG3onhYzGyiBIqptq
	 k6fiBvFBbuwLgrDFMM8Xr+JuNTR2H5eNDFmXnoGWMdox5UL/Vo6JS7ZP0GEDg2FEY+Pdb
	 ycU00k9gRdOR5W28OmIRosIcw3cVa8mtcQic756UNEik0MSxnvFmGvwvpFC0dvIhNLKmQ
	 LihKKxxEqX5XSwCPAWq6VXdDJxyHQvfovA2PVqS0fkkhpezZ+1oomzM5Ytxx0DxZnoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770165;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HTnTe25bU+/aPlzkjXPdZFxLBJIoyaXWfYwd9a3lY8w=;
	b=t7ZAqJusAqb68VMv68g0dO7oQc1TxI+pnfErE+1M7JaBU4RDiF2FEU7x/n8riYUSTTLa
	 u1zrpfDfvWMouSMAeYV3rwnrLxDNDH4ypi8oCACR08Vt12GDBJr5dn2zXTfASP3K69AXN
	 +adDIGmi5rfD/5DZmJh5SWxjpKFyxywqwQ7jaBbKpKceNB6Y8LmvskVytL2SL8gx4Iz20
	 e5oxj4CNxa9t45P426nz/67U/MPetzcnzQY49nzB+Y6YHTAzEq3KUGfDlRpB9f5LayyPR
	 fwKmNT7YOR/sS0yJxF4prqK58mDXKPCHismYu1sazWIvUbJZXQYuRi+0V0jAdCt9tTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z/SNzyZY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A1606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z/SNzyZY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983021F000C4
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770164;
	bh=HTnTe25bU+/aPlzkjXPdZFxLBJIoyaXWfYwd9a3lY8w=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=Z/SNzyZYyKjVvm3gp7+JO2++gGINIn4M494qLqoj8lmw7ZUoam0ImNjzv7Tv/bkVM
	 MjT8tG4ChYsbodw7gJHPVd1SNNUzrTYxP5psaGs4mcAlPqdGlTcmcxWa3f4yctsr/s
	 VAcfqhaYmH8aOk59RlBiU7ggKA1pHvWwL63KcSa+S2WUjBRi+YmiyleZMtPViVSmEP
	 LGFAkheghhpTY/QRHtouE1kcbvw/bVtsaYgpr9Zh+SITg+15fs83rILETXnps+RoR6
	 EIbjTK6LOXSluOHfn743r4PDDrvvZCSXTjNv9gPdcIk9giICKa4gaJEBjllbHi0883
	 23evlhIzdNPkg==
Date: Sun, 15 Nov 2026 11:16:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@vger.kernel.org
Subject: Re: [ANN] patchwork is not ingesting patches
Message-ID: <20261115111604.5933171b@kernel.org>
In-Reply-To: <20261115110210.4a3f0177@kernel.org>
References: <20261115110210.4a3f0177@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 11:02:10 -0800 Jakub Kicinski wrote:
> Hi!
> 
> FWIW looks like patchwork (and therefore all our CIs) stopped ingesting
> patches on Friday night. The k.org admins have not responded to the
> report, yet. Not much we can do, but do expect delays and (even more)
> pain. After an outage like this it usually takes our CI systems until
> next weekend to fully catch up.

On a closer look - the lore git archive for netdev has stopped.
So if you read this and want to make sure your patches get into
patchwork - CCing bpf@ should do the trick.
