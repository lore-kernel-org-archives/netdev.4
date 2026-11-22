Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378804;
	b=ivMoEHeWDznPnr9RHLl1a/82LK6YTFa46S312bTs+ETnkcs5N0yfQz17p0c76riHtkU0
	 my2qx3eoz4gO2gI6ECxkrgM2nK3YTqFJ5UPFZmnyywpPQo+bFvdjld1skxrraqwe6NcK5
	 aln2uQFVMm8lAIPNYTTkqy3uQMJh2VHYbB+6zKdYw/f4Pq4W3TkYom+iVMQgH4yhp4MJi
	 oG3u4yjuK9ESwgFJuaX8bbIRaDn1pVgj94o1lPycDiytwSAaP7bywT6fXDU1aQsKTI5dL
	 BdM+7WgiJrLaLmyWKEgiLD4m567fW6R1PJp7WIKJwM5I6potuG1fO4yVEEfLHHtUW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378804;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9FEIzTQEqkB/eIgyK+vZVtxbsx1bwiwbLuTEueuQG8w=;
	b=llKLzifpmbsHCrfL9bgeW/HFaRmZEaRA1hHndjd7nwL+tCKKBVYHj/FCVt3fdS54NFBe
	 7suXDpckQ1LholoKpqayHMzfKQjyawzAqOOM8V9pKUTORjAh66emtOLnwiGfaRrm610wL
	 cSCCZ5NOeNMP1DRzGE58nJXFUjLwQ1Wtf/w986sh3knbx6eqNekh8aoPKqqVsJFXuF8v8
	 0bAYoHNHqjLUdTla4TZxNolf9xrFqYGoKtBE5UA0D3DEgLyOPqS+QoFt1gDTW6Q3srhSJ
	 k9FUZYdDqJayoQpfJSNv05ARVjCUlPmNjkfKgq5NB80r1FTJWNJn03pn3/1my0qlQZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyJ41vBG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB223606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyJ41vBG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C2A1F000C0;
	Sun, 22 Nov 2026 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795378804;
	bh=9FEIzTQEqkB/eIgyK+vZVtxbsx1bwiwbLuTEueuQG8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NyJ41vBGeeG3X4NtEKJIhj++ci+qILm3NVR95FgyVfaoepAXuwMIbGlZnfzEzSSTs
	 h1wXsw+xJer3joGS+R6ckqf1d+QbG6tx6XcFWa/zfbmmZyQX+NAjtX6P+19cC5WUJ4
	 gLFdO3QeGDM+sLd/52xbupdiIUIrc048CxCn8R8Z9qQx+tHy13/xJS8rNHODB/R6lQ
	 tQwLtb6Wt2mamrJ8Qo2k9+ATyjPatSU/4/obIDOD+V79IVNMWHbyLAdLcYMOOgEMm1
	 o0PIUIfp9TLUzhcOLK0y7SxfE3wGSKRVfzec2nUpUP7hIHTI+K5+O0gXvbJuKfuJ9y
	 ZtwUBBhZxG3Dg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com,
 joe@dama.to, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v2 1/7] eth: bnxt_en: order event data before
 setting the sp_event bit
In-Reply-To: <20261120035214.369158-2-kuba@kernel.org>
References: <20261120035214.369158-1-kuba@kernel.org>
 <20261120035214.369158-2-kuba@kernel.org>
Date: Sun, 22 Nov 2026 21:20:01 +0100
Message-ID: <87h5h81uvi.fsf@all.your.base.are.belong.to.us>
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

> Producers of sp_events may store data for bnxt_sp_task() right before
> raising the event, e.g. the IRQ affinity notifier publishes the new
> TPH Steering Tag, the async event handler records the FW echo request
> data or the FW reset wait limits. set_bit() is not ordered, so on
> weakly ordered architectures the event bit may become visible first.
> If bnxt_sp_task() is already running it can consume the event and
> read the stale data. The queue_work() which follows only re-runs
> the task with the event bit already cleared, so the update is lost.
>
> Add a helper which issues smp_mb__before_atomic() before setting
> the bit, it pairs with the fully ordered test_and_clear_bit() in
> bnxt_sp_task(). Use it for all events, including those which carry
> no data, so that new producers don't have to think about it.
>
> Reported by an LLM reviewer while working on subsequent patches.
> Very unlikely to matter in practice.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - convert the producers which set the bit directly (Bj=C3=B6rn)

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
