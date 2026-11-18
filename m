Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005577;
	b=vlT4U1CZWzNu6W4qG8e2bbjrBFZ6kUzm4uNjeDrNfJCZc0q1y3XXejJwjouu3dJ4UBRm
	 9J/0QvI+vS8YFuG26oLyAeZlREW0lJHpNPNLiq6v/IhKdYkTm5+blTOXMzB3JRt6SQA+t
	 LkW8Bct8iviwjYS+3nVNBBG4Q4jyF6vwvoe/ResbJl0wMHDqlzVEayU3leyqSzSFpEz70
	 al5JVayCRFaInhubd41g3oglE5uPVguaAJw8vrzpB2NPcZyBy+t2218+X3nTELUyoX7Yq
	 CfKL1NejOgpFIJLGlia7GujwwtsOJp1Z5qv//+Qa7TG/q6Hwd4T1KdXUHPaT3cRB4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005577;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5tNw7x/gC+LifFujyfN8HXFWsAwMZ1bVvoHJM9rey/c=;
	b=Hq5MeFpzS2JDIzOpNC5nAtJ/UnkjUMl+hJbuh6e4ZiEk+5omlQ7t1v7a7dq71YsHoFyJ
	 DoV5DrfiI9onGTFGlEi8c7Jlf8LBz5S8dT/UBMD9gUZvlmjL0EjvQ+lrVL3tNvYTvEwIi
	 sAm/j+ywEsgqIjt/KnBsEz7ngu1cILOlnZb1UaC3sWjwJicEnU9ZZtrRdonr+tDT+Grhx
	 ojr86yGj6djfMaZWPo6FsWknwe9evrugsN584wibw1ZGEuchy0FuPHtg3dw7P6RnferH4
	 o9+N6N5/y46O3iRmwQ51my8hiLOcUycT+NQIPNXXRal/bXUxc4Xq/VdPlogWUm4/Tyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AKzXHev/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E97606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKzXHev/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9431F000C4;
	Wed, 18 Nov 2026 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005577;
	bh=5tNw7x/gC+LifFujyfN8HXFWsAwMZ1bVvoHJM9rey/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AKzXHev/L3H3pJRiAQLkhwJpZVCii62U8+TZDgrNXq26o9x8mtfYqAZXp+qMuLmhA
	 RylI5IByUwBtc8iXHUeRB4AouKnxgsyMB3dcexOWDd3d/tPd5oLhFdjx1VIrpwhQPa
	 Y03tVdCevFzdKP7AWUgUxSJFEu+9xQtsm0nadx2zyBC8WEb87nsj+5lMJPu+5aMfBr
	 t3DE1fWNgTe3aj5srjDteaNxxHSrKlKqPmY3oSGiNWlFCWAoO6H/37YqVA41yxk+IS
	 v9XsDuWJcGl7qBEi1KWkf22jI1UPVd6JzM1d+tfekRVV4X8CkdVU3QNwmBvxiqZHvr
	 tpgdkbRheEvzg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com, Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 5/6] eth: bnxt_en: allocate fast path DMA rings
 on the queue's NUMA node
In-Reply-To: <20261118023905.3050661-6-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-6-kuba@kernel.org>
Date: Wed, 18 Nov 2026 13:39:34 +0100
Message-ID: <87ecci8gah.fsf@all.your.base.are.belong.to.us>
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

> Descriptor rings, completion rings, NQs and the TX push buffer are
> accessed by the host in the fast path, and so is the SW state around
> them, which we already allocate on the node of the CPU expected to
> service the queue. The DMA memory itself comes from the device's node,
> though, as that's what dma_alloc_coherent() always uses.
>
> Use dma_alloc_coherent_node() for the ring pages and the TX push buffer.
> Pass the queue's node for completion rings and NQs as well, they used
> NUMA_NO_NODE so far since @nid only affected the SW rings.
>
> Ring page tables are only read by the device, keep them on the device's
> node.
>
> Note that queue restart only reallocates the Rx descriptor rings.
> Completion rings, NQs and Tx rings will follow IRQ affinity changes
> only on the next full reconfiguration.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
