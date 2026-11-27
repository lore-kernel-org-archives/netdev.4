Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765992;
	b=bGFHRaU5CrkotjWeHMiCTN/vqGcPwD7CXZr51cbU0MzbK/LpPo9/IUKDu5GViQZB7wNi
	 jKFJslsSoNYEzj4KWCWtjgBP9oUvgba+hJab90wxw9CttKIvT/So7Td1cWQW3GViU9170
	 rq+iS0zFOshNfafG+E7cj35+739nibdfSS/Wtj2VBPOIKdP5Q13fLY2z3M+jMdms2Ga4V
	 +HDpnKO0cagFeXHjQd2XHwgZifNLxZ3foWRhEQe/Aynu0X3tOsu9+B6SGBSiA4EbtiZf6
	 JvRvJbYNUBY+2FldiZFEPCjOxRpxAeg04CqTH+8k5+3KFtWHAYy9iqsz6ZInCvPqBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765992;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1ErWuIz5Ps9Bhgy8ex54TuZBuBIIo5rS7tE2DPIQPTs=;
	b=gSsKN5mQKhMyDkbMYWKDubGEYkK46Y4CSlw4iK2zFRXWi4n2M6JW6wPr+aC5glenkc5o
	 zpaBUvC8G/0Kt50QfxvbtZgoJfOul4NoFBjl1b3t9SL2uozTbrImc0NSubuIc9rrtPFlH
	 9OOPzFsIKbXxXedfuzYFDk8EdPnQaSttpYB5hg6EW5IxaLFnuMTwyeI6nPXoo79LpjKaP
	 C47sr8Fp94vpBRp0kuqmSHDriG+3DWnOLxaPzBorN9NUb6i1itRznSIUupNU43KRRZgDF
	 5r3HA6KRH6a8K6JUcqDQb5o49XoaOHQiE8tiCbbojXfZfp1FPq+WqJyNwF07EAHJaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JTNa22ef;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r8fETzeH;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE16606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JTNa22ef;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r8fETzeH
Date: Fri, 27 Nov 2026 08:53:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795765989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ErWuIz5Ps9Bhgy8ex54TuZBuBIIo5rS7tE2DPIQPTs=;
	b=JTNa22efiUWJH8mdckRoJcHBmddzf8bnARfV5ahYaqFWSk+/7gZJITJVB4X73vRckUPfxc
	RYHM7LfKPPzrHLwnox2HlyNG3JHNXbFE/Qf5mQ0zO8o+EcaxeLrl0WVflvXLWBb37R0tgh
	F8KEN7MGJzH9kkZKLeYoKeA96Nyn0fGmXqHo1FW3uxOM99t8QWGhP0H+YAnh9Hl63edv2h
	RIOlPSgsWihWfClfUkXO7zUFSOYeA5QlK4IPo6aY/qcGcP3r/PrM0QlBiKnM0fkPuxbOUy
	x2hpPoFZwjmyOC3wQzSvLEVD+yj6GtHcjZpCSU8e3FGzb77xt7bFseD4EJD2Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795765989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ErWuIz5Ps9Bhgy8ex54TuZBuBIIo5rS7tE2DPIQPTs=;
	b=r8fETzeHnyd+PpkTZgEyNEKdbQiGMIE4hDXgGOePSH7cMtaqF2pyFGY2H4XQpYHileXEBe
	M3n6uneoEz7LsuCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v12 4/8] hsr: Drop received PTP packets
Message-ID: <20261127075307.azfSRvLz@linutronix.de>
References: <20261125-hsr_ptp-v12-4-9ddd2a73cb90@linutronix.de>
 <179570403670.3135.12162215727895219598@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <179570403670.3135.12162215727895219598@kernel.org>

On 2026-11-26 14:40:36 [+0000], netdev-bot+sashiko@kernel.org wrote:
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
=E2=80=A6
>=20
> - [Medium] The new PTP filter in hsr_handle_frame() (net/hsr/hsr_slave.c,
>   lines 79-87) drops every received PTP frame before hsr_forward_skb()=E2=
=80=A6
> - [Low] The new deliberate PTP discard in hsr_handle_frame()
>   (net/hsr/hsr_slave.c, lines 83/86) jumps to finish_free_consume.
>=20
=E2=80=A6
> [Severity: Medium]
> This check runs before hsr_forward_skb() and applies to every port type,
> including HSR_PT_INTERLINK. Doesn't that do more than stop PTP delivery
> to hsr0? It looks like it also stops the kernel from relaying PTP frames
> on to the other ring port and across the RedBox interlink.

Yes. Yes the redbox must take extra steps to account for the delay in
forwarding. Dropping here is fine.

=E2=80=A6
> Take a ring M - X - Y - Z - M where X, Y and Z are plain software HSR
> nodes with no ptp4l running. X and Z would now both discard M's
> Sync/Follow_Up/Delay messages, so Y never sees PTP at all. Before this
> change, Y received PTP through the kernel relay, with uncompensated
> forwarding delay.

Yes and that is not going to work.

> SANs behind a RedBox would also lose PTP to and from the ring. The
> "two copies" argument in the changelog doesn't seem to apply to the
> interlink, which only ever has one copy. Any existing ptp4l bound to hsr0
> would also stop receiving PTP.
>=20
> The drop is unconditional, and there's no sysctl or netlink option to
> turn it off. Is it intended that every software HSR node in a PTP ring
> must now run a userspace transparent or boundary clock on its slave
> interfaces?
>=20
> If so, could the commit message say that this removes ring relaying and
> RedBox interlink bridging of PTP, and not only delivery to the hsr
> device?

This setup mentioned (or HSR in general) was never working because of
not accounted forwarding delay. It avoids forwarding for all L2-PTP
messages within HSR context.

Sebastian
