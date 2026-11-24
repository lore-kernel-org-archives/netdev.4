Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533014;
	b=lsD79FF0qa+4yo/tw+QG+n6xmg5rOMeVJNUC5wkgGUV27vgUIVz56SaqlBLTooydRW/2
	 E8kVaXUnAjbmRIGczoVGtmG01cD8uKTvwqQNYnxBaq+jsV5Xr1aRVac9z4GPNRZxveDxz
	 e7LANWz7Er1ehU/MbMDtBBMUKlwZrUAIRlhYt81kaJcantQWcrKSM3+bD9IrG6LP0ieGK
	 NHYGkGHD6bg3/C87xZc3cDwiREP6M1NRMiLXdVoH9pzDO0G3GuDnA3GEbNuqfqf+Enwp3
	 aApsw8K2TtY+NBD1jE8XfRK2dzSuNT2qIPdpGQWlLPKP3TAGOWxpD3r0Czp2f0Ffopg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533014;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=LUYshsaIeLQ3CbznfBj09T9GwFdN2mRZXw2njbxpUUk=;
	b=Co0bmufYdMmGwNpGwfBNVyoEO4DW7x0Ouue76cq3vhTGX0s55OOVGfzYi5pjzxPZbhV1
	 HBzh6wn5+SkkFAKz2enfdIuflQwQhpX0aRdAzVmLhlWG2aZEso7lz78egCZDR9ySzT0P5
	 ivOV4EUelwrkqmxLGXijFdCIEj7DFOoCyGQvMD46lbEyECSNUmUGqaiaEJmie8HlSd9ob
	 QFjVREZBRLK9vY2Yso6ScfqHCr/4PTqKFsF7w4HZyz4bAl/OyHF94YQcKbJ15HcXSXadt
	 YwgwOISz+uRIjgzgEh+Y/uqi3icVAVs7JSU87fNBivwgCYKBAigc9MrEHwpmVQ/DjjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JqKkLzT3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xG8IPDAi;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE978606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE978606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JqKkLzT3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xG8IPDAi
Date: Tue, 24 Nov 2026 16:10:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795533010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUYshsaIeLQ3CbznfBj09T9GwFdN2mRZXw2njbxpUUk=;
	b=JqKkLzT30zIlcCk8WL0pwUc4ZIu5eBNZARQwtsEFD4JHN6CGRkQl2p8NwTPpUI3tNAUGTN
	gi4Bzo0CuRC63a6IXsv18XgaVt9ShWW08DOgrY03WahWh3Qnu93WcdRVH/nFiHzrh6PJU5
	liyrXxzJ1mQ2d88lwJfoOmFDEznun/nBMKkOfO6UVhdfQAPvcGzFKOPdAhThJm4rHvFLjs
	AjA9stwO+UM9mOUNj0JiRaCqZ7v/kn/1g3ggfbmGl3COtRgevWv51TBMI1trYi9D4a3yCI
	t6rRBGocEEq9SN6209mlo9A/KoFmMaeRI7WtH+JsLvORDChy267vHfumjFSSUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795533010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUYshsaIeLQ3CbznfBj09T9GwFdN2mRZXw2njbxpUUk=;
	b=xG8IPDAii66pPF2m0xO3euGz/XzJLrHHkIOiLIYgQH8pmW3AFDNLkqmiz2iXIkt8OL78Qy
	4LB2a1GcPbkfa/CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v11 4/8] hsr: Drop received PTP packets
Message-ID: <20261124151008.L8_t_dzd@linutronix.de>
References: <20261120-hsr_ptp-v11-4-264c88f4f1d0@linutronix.de>
 <179551954166.3135.8484737548969907135@kernel.org>
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
In-Reply-To: <179551954166.3135.8484737548969907135@kernel.org>

On 2026-11-24 11:25:41 [+0000], netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
=E2=80=A6
> [Severity: Low]
> This check does not look at port->type, so it also covers
> HSR_PT_INTERLINK. It also runs before both hsr_forward_skb() calls below.
>=20
> Is it intended that a RedBox stops bridging PTP between its interlink/SAN
> side and the ring? A node that forwards in software also stops relaying
> PTP around the ring, and PTP no longer reaches hsr0. There is no way to
> opt out of this.
>=20
> If this is intended, could the commit message mention the interlink and
> RedBox case explicitly?

I haven't look at Redbox handling in this case but it needs to receive
the PTP packet on the original interface with the timestamp and do the
usual magic while forwarding them on the HSR port. Should PTP packets
appear on redbox' network then they should be dropped instead of getting
passed on to the ring.
So nothing changes.

> The commit message also says:
>=20
>   For the PRP configuration it is the ether type, for HSR configuration it
>   is the encapsulated protocol, that is checked.
>=20
> In HSR mode, frames from the interlink port and from ports with
> NETIF_F_HW_HSR_TAG_RM are untagged. They take the else branch and are
> matched on the plain ethertype. The code handles them correctly, but the
> description is slightly imprecise.

Sebastian
