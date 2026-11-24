Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532598;
	b=vdA83L2FSx7d/gnUbEnNZp9+c6tk3xIpNvkQTaGt0cmcubuczPu5t8M9EiPocjUA0iF0
	 54dG6iWtAL5uQtsht8WV9jLBAss6GmkLxAtv1LDOpGlELBOoVzYsVMNqep9nzW6cAOUeR
	 SkzGpmzTks5RSmcd/tTVhNvvsMXzH/pnTOcQ5ZfPHgwL7nVFrxJEKPYG6eQHs6tXXrrPB
	 ERywawrmi1AAnTd+rP5rGMJrGqktWxM/kwaWRz/KgHO/DeepGeDqq5HN8s4txqOiQ28wE
	 kpHGBY7YT8OlTYUuECBel6KGFjf7BbN6cgXxAE/JiZFJWG8yT4F3KAsfiNFPfYKRnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532598;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Hj2oIAg/Oikwn651Fyh4q9U2RC7vgdERs66OlXM3pIc=;
	b=Zt+V24XPJX4IYzA+a1SsxwHK/GStml8m4Fe86G6TrY+cK7imZ4N18Y9yQl1+cPeoBIqc
	 I5QzUfpW6CjdyIVLSvl+5iSyEogSSYgfUrXfVcWqseYN41kMFJeyqHCSnwDx+9KRmZgoN
	 ii0IG+sBa62C8Tua83exTSMCLmDUrPgN1v6rgx9mlzAaZHgVQ2YJgy7GcSUIEfKVKFOkp
	 ZFLZ+AiuXdcbhExY4qErI1+GhCWYAgYUkAXbSXnbRbWUl34tn+UQg4BfFXsAp1aZUDVmW
	 YrZbEm8L2KKmNIdznMQVaFNeTdu2Tk+0rrFQbHHAVD4emG24Pzo4NVVLXi/aUveMjVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EIhEWQjF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vPAMfW5p;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58044606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58044606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EIhEWQjF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vPAMfW5p
Date: Tue, 24 Nov 2026 16:03:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795532593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hj2oIAg/Oikwn651Fyh4q9U2RC7vgdERs66OlXM3pIc=;
	b=EIhEWQjFsGYdbRqZrGt3Qli9LWhdzUd/jQHpNXxIEvpLxcNm1bao7B7Cbjh6QD6G8IaOo1
	GJTOJLa9MGqSn2efy4URFB1tazc0up2spOEHcCHC2yTU4Z8lV2464CCQNe90lZP88ykM6Z
	rGgqV6ijh3+lCZ11CYRDMnrc1xnYh0urNP6NX5QBttF8SjatjxmB/+q9pkNPmz1ch2j0vi
	Ng5skfrVUJZZQa44S2CfCBL7Y2fTDWucZn+CXfg2c8tc5irDmZwltPLQhKyn1lKAsii9l7
	Wby42LzFL1jkptxbatYPhEtc9DD9J5VSX+uJMD0tLO2UmweVZo8JvHOMfJXNoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795532593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hj2oIAg/Oikwn651Fyh4q9U2RC7vgdERs66OlXM3pIc=;
	b=vPAMfW5pzbwAWIg9C64eBV+6J1mf9fNFRN6r4HDUTSU+D7C0doGP1SrQb1RtaFmxZsWqRM
	fOrKjtH6WF7K8kCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v11 3/8] hsr: Add a magic header for sending PTP
 packets
Message-ID: <20261124150311.YE8m6onh@linutronix.de>
References: <20261120-hsr_ptp-v11-3-264c88f4f1d0@linutronix.de>
 <179551953943.3135.5171650811556628454@kernel.org>
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
In-Reply-To: <179551953943.3135.5171650811556628454@kernel.org>

On 2026-11-24 11:25:39 [+0000], netdev-bot+sashiko@kernel.org wrote:
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
=E2=80=A6
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
=E2=80=A6
> - [Medium] In hsr_dev_xmit() (net/hsr/hsr_device.c:282-284), every skb
>   with skb->protocol =3D=3D htons(ETH_P_1588) must start with a struct=E2=
=80=A6
> - [Medium] Inline-header parsing in hsr_dev_xmit() is triggered only by
>   skb->protocol =3D=3D ETH_P_1588.
=E2=80=A6
> [Severity: Medium]
> Every skb with skb->protocol =3D=3D ETH_P_1588 now has to start with a st=
ruct
> hsr_inline_header. If it doesn't, tx_dropped is incremented and the frame=
 is
> freed, while hsr_dev_xmit() still returns NETDEV_TX_OK. Before this patch
> these frames were forwarded into the ring.

This is intended, packets without the header should not be injected into
the ring.

> Can this drop PTP frames from senders that have no way to add the inline
> header? A few cases:
>=20
>   - AF_PACKET SOCK_DGRAM senders. The device's own header_ops build a pla=
in
>     ethhdr, where bytes 6-9 are h_source, so the magic check can never pa=
ss:
>=20
>     static const struct header_ops hsr_header_ops =3D {
>     	.create	 =3D eth_header,
>     	.parse	 =3D eth_header_parse,
>     	.parse_protocol =3D eth_header_parse_protocol,
>     };
>=20
>   - Unmodified SOCK_RAW senders bound to ETH_P_ALL, such as linuxptp.
>     packet_parse_headers() sets skb->protocol to ETH_P_1588 from bytes
>     12-13.
>=20
>   - VLAN devices stacked on hsr0. hsr_dev_setup() advertises
>     NETIF_F_HW_VLAN_CTAG_TX, so the tag stays in hwaccel and skb->protocol
>     is still ETH_P_1588 in front of a plain ethhdr.
>=20
>   - PTP frames forwarded into hsr0 by a bridge, tc mirred or OVS.
>=20
> The commit message does say the header is "expected and mandatory if the
> ether type is ETH_P_1588". The reason it gives for dropping is "the
> requested PTP timestamp is not routed to the sender", which only covers
> local senders that want a TX timestamp. Forwarded and stacked-device fram=
es
> never ask for one.
>=20
> Is it intended to drop those as well? No later patch in the series touches
> hsr_device.c, so this is still the behaviour at the end of the series.

Yes. The header was optional but then during the review it was asked why
not make it mandatory. Since there was no reason why sending a PTP
packet without a timestamp would make sense, it has been made mandatory.

> [Severity: Medium]
> Can a remote host reach this parser? The only trigger is skb->protocol.
> Nothing checks where the skb came from, for example skb->sk, a socket
> option or a cmsg.
>=20
> For a frame redirected into hsr0 from another interface, eth_type_trans()
> set skb->protocol from bytes 12-13. Those are exactly the inline header's
> eth_type bytes.
>=20
> Suppose tc mirred, OVS or nft fwd/dup forwards untrusted traffic into hsr=
0.
> A remote sender could transmit a frame laid out as:
>=20
>   byte 0       1 or 2 (req_tx_port)
>   byte 1       has_hsr_header
>   bytes 2-5    0
>   bytes 6-9    af:48:53:52
>   bytes 10-11  0
>   bytes 12-13  0x88f7
>=20
> hsr_ptp_parse_header() would accept this, strip the outer 14 bytes, and
> forward the inner frame with the req_tx_port and has_hsr_header the sender
> chose.
>=20
> Later in the series, has_hsr_header =3D 1 makes hsr_fill_frame_info() and
> hsr_forward_do() send the inner frame unchanged on the chosen slave.
> hsr_xmit() also skips the h_source substitution:
>=20
> hsr_xmit()
>     if (frame->port_rcv->type =3D=3D HSR_PT_MASTER && !frame->has_hsr_hea=
der) {
>=20
> Wouldn't that let a remote sender inject HSR-tagged frames into the ring
> with a forged source MAC and sequence number, and pick the egress port?
>=20
> The Linux bridge path doesn't appear to be affected. br_handle_frame() dr=
ops
> frames with a multicast h_source, and 0xaf has the multicast bit set. tc
> mirred and OVS don't do that check.

I don't think forwarding untrusted traffic (from outside) into a hsr
network is a good idea. Also if this comes from a non-HSR network then
it misses a HSR header. That means the admin would expect to add
system's HSR header while sending it to the ring. There is a "redbox"
for this (sending an receiving packets to/from a HSR network).
It looks like an odd setup, not something one would consider.
Also, worst thing is that a received forget packet would be sent
further.

Sebastian
