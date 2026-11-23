Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461130;
	b=UN2NlmDoPCD1ppiCg5dL8QrMWbJxhqS1XB4jDhD8h2n4QmDax+s9gmYVCU1sFI2y1Z2R
	 8aSErqCBSkRwCpYDnL0wCT5jPOczeXxdfpMHJyw3wgYSCeJEQPtS+HecEM1hf5J8Xw3j3
	 v78+wlpKNXog9bTzdFt4T+r7gP1RyXC3X7EYZPDv+NzNYDAHuQ6fU1VbQZQ/FG/TOba2Q
	 bOj+WhsyG1rO7EQ8LwXLyz/z/PGgGfPYrqRF/Qb5K0VpI3mPgB+tgk+RIpuwzd0AtWqUN
	 jWFo/nlSVfECAzqFKPbU9GHJrPiQZm0xIYKUq6TWWJP7Y4qfc6QCzNjAJbTMWFEX/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461130;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=669cLwprKalZDSaW7X4qn1vPbEGUYgE2wL6e+ZzxvrQ=;
	b=y/7In817nZVbHUZXzDckmgqR+FzkcOOE9y1tZ8Xgzj8rgg3sZh52fxCaFGvm7OPmO0hU
	 iauvW4QuMLjVCi29+gmeyzhD+0PO5imMfOouN93d+tIS2kbnn6oDSnVe4RZIF/0V7aRAS
	 q5LEqqTq6a1026dwbj9pTw7YuuHch8HTFdRHzZUZ4PGORVDIDIVeN6n/h3QsADxtp0cmn
	 DJYuKbOWkDyGIE4GIeVLId46tRiIU3nq4cpexnQpzQv5/TK5f2RlSCJu7aJ78Yp3IKf/3
	 8fs597yHmoaqwPi2PhnOglQhUM7QTeu3Ez79WSsXvvnha6KLt6Zk2LgcajeSU69868g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e0f/DZkH";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D6606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0f/DZkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130C51F000CA;
	Mon, 23 Nov 2026 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461129;
	bh=669cLwprKalZDSaW7X4qn1vPbEGUYgE2wL6e+ZzxvrQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=e0f/DZkHLzllD7hOPZdQff2ObT5yonlnpopG1JZ2jgVp+VWS2kebgLaC3XpBrbRwI
	 uYez0Hii9VnBM7LJZa5mFf5W8xrzlwmwkPHDQBX7QgOEo9dcoeVczYdOUWFKZw+c+R
	 Ix1G29vstzkAXnB9Git7Ird6ExZjkyIKKckVlN1O9+rca85AOwrhRJeZzRYzTJQnUL
	 C5aLQVaDOsV/GvpuLmrB5YIRxM6e+Q4A1/DCCIv3RaFJJag/ePBzqs3ohvZBIapZhB
	 w8ZtV45gJvlUezrR7phVoKb8ae4xi3mTjtAobBN3ww43wskW8INB8CzqHOHC5p/wbI
	 +9J33wL2ImCaQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH v5 net-next 10/13] selftests: xsk: list the endpoint
 roles of the test cases
In-Reply-To: <20261119164636.1071385-11-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261119164636.1071385-11-maciej.fijalkowski@intel.com>
Date: Mon, 23 Nov 2026 20:12:06 +0100
Message-ID: <87pkvvpdkp.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:

> On a NIC, drivers/net/xsk.py, added later in this series, runs each
> case with its zero-copy endpoint as RX, as TX or as both. A list of the
> cases by ID in that runner would repeat the test table and silently go
> stale when a case is added or moved.
>
> Split tests[] into the tests that check both endpoint roles, those that
> check the RX endpoint, those that check the TX endpoint, and the
> generic ones, which a hardware run does not do: BIDIRECTIONAL swaps the
> directions, and STAT_RX_DROPPED and TX_QUEUE_CONSUMER skip in zero-copy
> mode. The test IDs follow the order of these arrays, so they change,
> and xsk.py takes them from xskxceiver. The notes that came with
> ci_skip_tests[] go.
>
> -l now follows each test with the roles that it tests on hardware, e.g.
> "0: SEND_RECEIVE rx tx" or "9: POLL_RX rx", and a generic test with
> none, so that one list serves both a veth and a hardware run.
>
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
