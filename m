Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005429;
	b=0VCB5aUwZduB0EKhAPeoH8MnGV6Hu21A9CjE+AZUi6poPk8I8m97//m2S5xQ1I94HN0o
	 Xg9/3doTIb0d+tyo2JoXK+nN/D5a8cGUpgva3GK8TtiEo/rZKxVVcgTr4NRMsv807qUTA
	 Oimdcx3yIMMJCZczkmGyef1YMonEkTyJnVSHOMFpCyWiEp6M2bRLP1iQdSXNxWzyBxo+X
	 yulRwuUE5kJ7y4B2r1/CmB3OAbkGIqV5bk2WiNYNXytB4yYP9gGD37PX5WX4ehabZxDxT
	 m3hI+wdQCn5NQfgGfl5PJpxg7MWn0RR8LsJPRp4uieZ+sNKxOq57iHOkj74+L0LZg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005429;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OF9/frAdC8WtYESFe22XDxZ3yylElWmyHgEr8j/S8Rw=;
	b=GcUq4Ap+zyZNZB5gZenPRTFHHczXz8Il3p4l9BedwVjAWDDrtGhkOPtti2izYsuvwkLR
	 uU8Ztc8i+mTaTJX/n3t/Lp7F+i9puRLylohQGOTmuZWBpvqGQysvVjjpCtalClhZvTkvL
	 qpLrFnUjVvYLxHlUYq6qF0VUOeQjyGd0v0rALNDgYHGubSRdfBYKpofAtDUhkBbTOWyG+
	 EOVVF8RuVqA3M7voAv0XMjIkMaGkDpk0vEZtwR14XCV/3ehJL+0IqI4db8ZjQavQA9s/5
	 6nwWoQg1aOAyr9tLtIHZrnpfdE3Hv4bazWKFtJGAgTdpDHLalL/Suqjgjz8YWm5xmHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwfieIls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E889B606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwfieIls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0526A1F000C7;
	Wed, 18 Nov 2026 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005428;
	bh=OF9/frAdC8WtYESFe22XDxZ3yylElWmyHgEr8j/S8Rw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lwfieIls4KbRgqKThUAvsS3yJ3fensyeBLiX6Wz6qgpJJROkBpScPygeIQXz1oyW6
	 dZ1HI2SB6XnwiieIq/0Q8W8tSMXl++UPGSaEb1eipztd4VCmmZb5WDE8bYLBVsNJap
	 gD6bXWK24nJ8+uoQSFcLgHI8Zs+039MkcMWi340x6RTVbwbru/z4hvxj3gdLowF8zF
	 vFmLyx2scAaz24xUCkWwGh3nJj4n92kaT1uiK6gT9PF3Wv2JA5+O3onDBznTSiZdMQ
	 mr1gLORBwOKEu3tofGGbtOQTQ6zeWn7TF8xG0T9H8SHMMt1JmwI5bgoSS4VQrTya5B
	 pG7TlSfmTn13g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com, Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 3/6] eth: bnxt_en: allocate per-queue SW state
 on the queue's NUMA node
In-Reply-To: <20261118023905.3050661-4-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-4-kuba@kernel.org>
Date: Wed, 18 Nov 2026 13:37:05 +0100
Message-ID: <87mrr68gem.fsf@all.your.base.are.belong.to.us>
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

> Allocate the SW rings, agg bitmap, TPA state, completion ring
> page arrays, completion sub-ring structs, SW stats and the SW USO
> header buffer on the NUMA node of the CPU which will service the queue.
> This lowers the cost of cache misses for NAPI fast path (and xmit, for Tx=
).
>
> Previous change already allocated the page pools on the right node.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
