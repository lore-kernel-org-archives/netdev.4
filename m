Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533548;
	b=T/ofw5zIVxxQUDt/bKTtUGtiRztCtmVQzLmQRbzhLSnjEMGWx8R9Gvrw0XM5INteRa9b
	 Z0iucHujAekXF4MNcpvnbdvxUNsX04075J4Dt47b2KRu4V1j9tP5Wq8NW4G95rcITeVxc
	 O2BOeSRyLHZsOuUXz6qBWbf1X/+aSiuH2ges1OIBQmFoOHRsUKI1SWBN3yxrUg78QWhKR
	 b4ggZIjjkxeIVnnaIb7dVckIkWuvcYbEFvOTTLtJvQQ06c2JHqsd5vRTu4N2KxSLks/aJ
	 QJyl6KXO1u182ttXKv5GaAOqtkBDdKGDv/yZLsq3C64GgdcYHXwnuwo59RIBX1w242Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533548;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6oWnfXqgTuQPp52o8Doeg6T054YN4mh37i5AiGViOQk=;
	b=2xuv/aeF/12AAZ8iG3rAt1605wIA+ZVa56vO5OaM/oad5MwRws63y2CVNOC6Ztwic2ny
	 IUeYv55XTFFU2jTOrFKNw8ZlVkp5FcbOTP00iu0DuXSZz4f3QFp/Ovw70vEews3TgDg5q
	 Da0VYjthfybuzvWLb4beuSNjQke1UA/f/myrMtaxyNMWCDDRcMQmiGoferfVdu9xvhwyX
	 6oYKKj8m7t61qjIPNTGrJ3ACSq32DfynCFsRchnXDWkpW7WYUYi3HiLctCbUDh+7ih/7J
	 G/0SctvfyoAJGHxG9UwEl/j3n+4MHh2kXyyYbcLTauNJc84k1IA/M4rgNXfFBvzMwEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cGNoremp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="fQG/l3Vs";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA4606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cGNoremp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fQG/l3Vs
Date: Tue, 24 Nov 2026 16:19:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795533546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oWnfXqgTuQPp52o8Doeg6T054YN4mh37i5AiGViOQk=;
	b=cGNorempfMYw+M3WsE5ne4HlyNjCZot6B8JV1+Y3uHXbLvIMZTn5AETcK5z3zENcLnqSpP
	takfEEglhyU4ridmtZUJCgBUwK741z1uHILjoWkv6cl8ZXCWsFbgr8zdK/vG1kpa4hcHH9
	2cgm42O4HMfpWw5HUH8TizWrE20BooUpfvFZsICm+2PbJfYoQ5v+7fp/kusSwYn9bPxneC
	efytAu/HYtbHvaKkkxPdxSebf0w0j/aiEOpNuz7kZDX1Yc43h5/SKq1D1RV+Zk8SxJ/Wb5
	Pqhqpq7xRHWuykWpyj5OvnL5zUYN0oYQ3oUyOsR0GO4dEmAv1/1UYS2A8ykZEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795533546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oWnfXqgTuQPp52o8Doeg6T054YN4mh37i5AiGViOQk=;
	b=fQG/l3VsiwMXcD0hx/o7b3RCkLyaI04VgEJKq4aHyBP3xQOksslTHmileiVI0xc1XU3oWL
	PhxN0xFrw89E5QAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v11 5/8] hsr: Use the port and header
 information in hsr_forward_skb()
Message-ID: <20261124151904.QEfjoeC9@linutronix.de>
References: <20261120-hsr_ptp-v11-5-264c88f4f1d0@linutronix.de>
 <179551954393.3135.14245872279309105973@kernel.org>
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
In-Reply-To: <179551954393.3135.14245872279309105973@kernel.org>

On 2026-11-24 11:25:43 [+0000], netdev-bot+sashiko@kernel.org wrote:
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> - [Medium] The commit message says the new path "is only used in the pure
>   software version" and that NETIF_F_HW_* offload "need[s] to be=E2=80=A6
> - [Low] The has_hsr_header semantics added by this patch are implemented
>   for HSR only, not PRP.
>=20
=E2=80=A6
> [Severity: Medium]
>=20
> The commit message says:
>=20
>   This is only used in the pure software version. Hardware with any kind
>   of NETIF_F_HW_* offload support need to be addressed separately.
>=20
> Does anything in the code actually limit this to software?
> hsr_dev_xmit() accepts the inline header for ETH_P_1588 frames on any HSR
> device. Neither the req_tx_port filter nor the has_hsr_header shortcut
> here checks port->dev->features.
>=20
> When a slave has NETIF_F_HW_HSR_DUP (ksz9477 and xrs700x through DSA),
> software sends one clone to the requested port only. However,
> dsa_xmit_port_mask() in net/dsa/tag.h ORs every HSR member port into the
> TX mask:
>=20
>     if (IS_ENABLED(CONFIG_HSR) &&
>         unlikely(dev->features & NETIF_F_HW_HSR_DUP)) {
>         ...
>         dsa_hsr_foreach_port(other_dp, dp->ds, hsr_dev)
>             mask |=3D BIT(other_dp->index);
>     }
>=20
> icssg also switches to PRUETH_UNDIRECTED_PKT_DST_TAG in that mode.
> Wouldn't a PTP frame meant for one ring port then go out on both?

Yes, this has been mentioned earlier. Nothing limits this to be
software only. For now this is software only and the next step will be
to take hardware acceleration into account.
It wasn't working before this series so it is not a regression.

=E2=80=A6

Sebastian
