Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765254;
	b=KygwcA90Cd5KhWys7gb+5dZ7bv6D8+Ycdr+O+PICAa9D6cWU8JBxxSA2+ACNxieDC/d1
	 CgiVF5R6rvD9LiwCmZQZE8tHALB4ckZ0QrUCbV7kyd7z206jQERBAkRfzsRKkSi98f30V
	 nVUhAHSYBRr1geaC8dJHBkuHleKv4OfqRjiDCgFiNiXLxcWMpDnqBsfT1BFIUeedQRA5l
	 g6YJRf+7fl/xWleiWwBsSnjRYeQHr6eyYPeSyBsIm5bsHs1Vb/Gw5tV8dB0jS+UKD95LB
	 xbtqkMbch2H5aQAf3xmsRWdAcw2aAiHaDKRXNaD6hCvB0e3j2ga7F9EK9jSxy8O8AZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765254;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YJURtdxXhk/lHCVcZI4FeclTTDjf9Rsj5NTK+HMt0g0=;
	b=ZL4NLVsJEwjIa1dLz7IKtnVwidRaztSeTdCLAgQ9HMwNeDSjwB9PhodRiOU/x35uB/FV
	 YHhHrMo4M0Z1uKUP/lgqpV2rK+oenv4jwu7dpC3LsKQWyZNpm+ZpkbBC9XmPIGcXUm6zv
	 gp1C/dXUERV0pCQdee4G4cEreUEtuo3+hCCdaV1WNqUC05kUqP+o6XrLQhaz0el99a2D6
	 ID6kL8zsj8aIJzur7bu3re7qmZujg4O2ZHlYJ0WCAUlXOBPhnJRaDs9JzFCEBuElfL9GK
	 czHjPBFgb8UAMHtYtN/a3r67Xy+724DMakBFR5f8m+6/H2vGitdOpP0WPsBZ8CYduuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uFAGwKh1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=d7cB27l5;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487D606A330
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8487D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uFAGwKh1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=d7cB27l5
Date: Fri, 27 Nov 2026 08:40:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795765251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJURtdxXhk/lHCVcZI4FeclTTDjf9Rsj5NTK+HMt0g0=;
	b=uFAGwKh1mYYcN/ZFaYoL/O++vUd/8BRC/Q6CKLoryXdWQnbz4i7T3nlfwJu0RrT2pR83jd
	MaB1SZbA7RxlKtXsdcIFvvKtwXZdWi6KjGiazAoJLrzfmTJpDxzkDYguXvFhkg5UnUpOWj
	BoANrsYMaFLlqw29N51lHAgdJ4RIrK6Ny3hgAyHudv99PLEYDV8+5IGmotGSpTXMDDci/A
	SzY/Hpg0DUfCFPkwVPGWQIqnpVr0XByOay64ZNLjBz1UoDnNwstrPGGbjGARQgjViEhv01
	Od6ZgAU1B42fUipbUdzifW/3yUPCo+zvejLp5p1FnF8B+R2kRf4xmgigowkh7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795765251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJURtdxXhk/lHCVcZI4FeclTTDjf9Rsj5NTK+HMt0g0=;
	b=d7cB27l51k0fyU1WX7KekOMVfSV6Leshcm+YbbDPZWfQ1ftX5UkN2KG3LxKyT3Zh7vbE34
	/cgvxw1qzZiLBkBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v12 2/8] hsr: Use skb_clone() while adding the
 HSR header
Message-ID: <20261127074049.1DL-U1BM@linutronix.de>
References: <20261125-hsr_ptp-v12-2-9ddd2a73cb90@linutronix.de>
 <179570403216.3135.10008194988280246872@kernel.org>
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
In-Reply-To: <179570403216.3135.10008194988280246872@kernel.org>

On 2026-11-26 14:40:32 [+0000], netdev-bot+sashiko@kernel.org wrote:
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
>=20
> - [Medium] In hsr_create_tagged_frame() (net/hsr/hsr_forward.c), the
>   clone made with skb_clone() keeps the original skb's timestamp request=
=E2=80=A6
> - [Low] hsr_create_tagged_frame() in net/hsr/hsr_forward.c now calls
>   skb_set_network_header(skb, HSR_HLEN + movelen) and=E2=80=A6
>=20
> --
=E2=80=A6
> [Severity: Medium]
> After skb_clone() and skb_cow_head(), the frame for each slave port has
> the original tx_flags (SKBTX_HW_TSTAMP / SKBTX_SW_TSTAMP) and tskey.
> pskb_expand_head() copies them into the clone's private shinfo. But
> __skb_clone() leaves the clone's sk NULL. Can a timestamp generated for
> this clone ever reach anyone?

The socket is attached later in the series. It is possible to forward
the timestamp properly within this series.

Sebastian
