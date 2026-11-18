Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005171;
	b=KjRdi279nsqLqjvhBTKSbBEm0BiCZJPQk0g7gzyhnbE0Dp3HcWAF81pA+nlraLXDxTiS
	 EKt0D+A/mTwQucJQmT6yZJ8MpY9cfQkXyRrXhpoTpfr2OXR1NTUrUMvDhiduLC54K2dNA
	 MGffAI+/GOHLaMlncAITT6XEuxvz0ohPujiqM+e7Me50g5ItyZ/grL00a3zJ0dPYrTeog
	 FzEliC1EcCaAGoeIMOfGVffogE66X69gLAKV8qFEKEzRVruEI2vDlfyJEPylZSIkRRAjA
	 ZIOIWBY3nxfZvZpiShr7EkSd7Lk6cAjUFKDTx3Yqpl9+an008BtqH4ttmlgCkU9LeoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005171;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ShLpZYTENcJZPipwC/hhnl5p06S5JbZ4bVx6LKeKESY=;
	b=ynatj1gn2/N/NFh8uVxkXTFs6U/AXlz5egAlS0+XqzDmyQQd7Wc8A7ztG9KS6tX6jN87
	 OoLC2U11LKBhhExWW4M7+nmVyx1KYeT8nal7Mwvv6S6qq8ds5sIlrvDph9a7cmkphwg4M
	 Gdo7hHfLH/bBqLJKcsFUMNxLP/Dmpi+O/KqFGTLBeoERvB69xmv2YPChmvA3DHMjDKoLn
	 udk9VFMIiGHI900l/tNuExs0yg0JHgdW2H3/KpFZ/Llp/Rn4B+CZzrDn8Dsbpm6biABr/
	 jWAOjh4Z/8owhEYYQfBgC+mER1TCfv1uQmsg7iYeFc9qvdKM9A9Cwsy3weea3v+Uk+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZiyZTd1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51352606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZiyZTd1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5038A1F000C7;
	Wed, 18 Nov 2026 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005170;
	bh=ShLpZYTENcJZPipwC/hhnl5p06S5JbZ4bVx6LKeKESY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cZiyZTd1KtOhRhqSV5Ke4WXZOX5LFTuMXrmobuw2nQsXa7hLn2pgm8ZCTpp1NSmxE
	 8Cc+uObjW+n9dP5EJr7ickConOwyUcKqJ9hYg/rp8mDQVCfLROMMmLB/6yfXldEWaf
	 DaEob9HtuvFLQNzkf4e4Nu6iihsb+P9N2Glnl6bBBLCX5gZgH/k8pW5Jfsb1dpsdWo
	 Rfe4CxZPE2sCS9FFIaMICSe9w1nWt4BwNfV+S5ofSAXXAy1snxGFlhY427iYl4E4ve
	 /uumTB6atatcrUTXZc04s2P09weyEaGVBA5Li0KWk+YMcxF2c7KGLgvsMRErzq2Zur
	 1PlhVSpo9e61g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com, Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 2/6] eth: bnxt_en: follow explicitly set IRQ
 affinity when placing page pool
In-Reply-To: <20261118023905.3050661-3-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-3-kuba@kernel.org>
Date: Wed, 18 Nov 2026 13:32:47 +0100
Message-ID: <87qzgi8gls.fsf@all.your.base.are.belong.to.us>
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

Jakub Kicinski <kuba@kernel.org> writes:

> The driver picks the NUMA node for each Rx ring's page pool with
> cpumask_local_spread() at open. IRQ affinity configured by the user
> is already recorded by the driver and persists across close/open
> cycles. Use it instead of cpumask_local_spread().
>
> The affinity notifier runs without any of the locks held by
> the allocation paths, and copying a multi-word cpumask is not atomic.
> Like for the TPH Steering Tag, have the notifier compute the node
> (of the first online CPU in the mask) and publish it with WRITE_ONCE().
>
> Queue restart (bnxt_queue_mem_alloc()) needs to resolve the NUMA
> node instead of copying the nid of the old page pool.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
