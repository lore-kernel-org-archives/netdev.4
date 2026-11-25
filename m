Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571780;
	b=4kO7lPE7uMSGy8Blrnx6GTFih8tBqb6j8/UVVHeZOPF8y/2T6/tqxsUPnIIHKNcw2TT3
	 05o4BTvozKd6RvvA0yzgZKPx458n8Q7m/Ivk1O/eFuwSJK0H0DAwRTpbowsTWB2bySAWT
	 Q+bgywmjiEu2ukgK7OoXj6ZDyru7DEU+V6CAVREAcGY/IGaYniGKOcwGl6WjEKgTONciZ
	 8+UvbWE+wvWy8CmMoGyCluckhT/nbry9SO61ephViG6ON08OggNbnG66TTTp8pwggkaM7
	 uI0/ICFIM5IrC9WhPGkn4KthBqVsFqOh+QhQdnxsKBuvB+0wNOe9ti+fHM/2+IxivIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5snOyxQIe6U2v1PhcT/xRSi6jccSHxfowUNJjusCE90=;
	b=qDylm6v8/3qv8JjciGxVIgE6BcbJlY1ugNYJ5d3sF3CWWCqFWkozLRCy6iZ0lazyF1Uz
	 uTQ7V6b/TblyGADWE/RCk8/c475kIVbX6Hg7xp9vwYN10cUKsQoaKSs4VSLQCdvUCeb1w
	 GS6GqADFxvWgnBaLL9SYZ+kZri0sLxEqanoRWUHaCIG4CrQ3YI5OmXDblA6MfrdQ46tgH
	 ispE617cXMgE63nFbX8COV1WH28DcRe+RN+T92Q3qOF5UaQ3s4YwSHM1tcFhyZ8pYcuxL
	 bUQCnNaxzuCVI9OkJYAE5Q4ywnWfOH7qRkBl+O3aOJU1UVeJozKb43F80INIy52cANg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="K1b0/IGo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBF606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CBF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K1b0/IGo
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1479a959aso3845989e87.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795571778; cv=none;
        d=google.com; s=arc-20260327;
        b=WSyeZ5LZpXbKQudVvGP8r4i6EqA4aaDcU1y5c8whVm/hZECEQUBwSq6fUg9LNL0CzJ
         +tmSNHtBS7TUndxEbfzsXX9XxXidaeU14d9bsEX0iJEn10GjHyWlDrh/0wWhziNW2ZJj
         O4TisI9XUjHt83aGDlXxnZ3dGf0lp50DZfzPCtL95iSEYmjEVEdwaUhYPT7QUyPRxE6L
         ofe8u8Vr6eOohDzVf5Xq/LT21vmaJD37pMdiB5Z2proTSyz/gaoeSiFRtUGtj6QTPaWA
         qIEH7RjbBsRMl4G0yq+EWxUe+iMfJqQVDqzojj7GPC65UNX7UYa+OcMxSa19u1ad1TY4
         63Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5snOyxQIe6U2v1PhcT/xRSi6jccSHxfowUNJjusCE90=;
        fh=PpRYkZE8DAbAEmXH3biTkVqUhWugIYvmWshTUcaNnd4=;
        b=gbK1wFGQ3M0zFZn0jYvxQUlsUmkI2WAYU8GY5vZMI6pkI8BabotS8MwVEKjhfrzzlD
         6ohba7f6rLZMtfVht0oIFS6wZuwDNOr5d9dIrDn7gYoX6kD7PTiUh4S2TGpovWDEorZk
         YY8R3ZCoWDQx6BS5WrZadiXGcsyHYlRa1LRD4ug1pwOvG9XOtrCGfH0HyPOaeyuJgKv/
         0YIxiy+iejQ8sFJA/Uvq7CWuqE3zTcIDrPG+dw6dOXKjdEao+Q7lYRvSKf+uU3TUsSlN
         hvdfnR83q057/2JydmWX1yOS8p0YpT/E2NY9XaOndTq+wqaaLpAEyivv8HXqMpzB1q6P
         +THw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795571778; x=1796176578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5snOyxQIe6U2v1PhcT/xRSi6jccSHxfowUNJjusCE90=;
        b=K1b0/IGoWv/tjWmUQo5LWLtz+doru0yIWgAKQ2Xx+trj5R8gsQ8fLa+NJQ06GtkdZm
         VFTI6SGyCz9bI2udYfKZKbKNWUxtdq9FKhty279itSOxwhFV1fNT3o1qRuGE4ohtaVSa
         8mgcqPQL1o7Bf4JYaW3p9Vs19+hYDrA9rQYnjMnVmosUxh31ROj/j1GpvkCnzIWxvYRu
         AbL+cvR6P+j5ITeW0yeqKbm/bhyEsIzmgOQKFG7SrWn5cwedAGCrNJ6lD3MX+fiC7+2f
         VFZPXLeTFcfqP3uXGYZLgf3X4HK8Uwcx4BZDcLm4LnrfKLuo/b0DhP0W3qaFQvgpfJPl
         S1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571778; x=1796176578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5snOyxQIe6U2v1PhcT/xRSi6jccSHxfowUNJjusCE90=;
        b=GCSI5mNK1qDJSzwJWrpAy+YIhemRndVBxzxs0sf1vAwUt4DToiepEegRN9WIHe0l4J
         KoOlYuHiLp1KpSqOHMzCbw/iTBBjFouS/3Eq9y13hdv0edZ8MYK1siwC0Tgy5D1jqwwV
         4Clq+XXG2p6s8z6SH0QaUwnK8yOrahjgeWFMBW66mbFpUe6V9xHTWYNflvAQnEb4+gLV
         qwDhrYP5AP30wB+q30VGrIkU2xkVsp4LmB0shktJZVzda7iD1p4017D6Be4HmPner+ou
         R4gBEhsBgOZ2hJG8lMazPq5FbMqLPn+l4JX/HPKGWn3AnSojAiJ37sZ3DCiQ1FMzUamb
         RCvQ==
X-Gm-Message-State: APuU4Z+57YF7OLKEBDUaSXdvGllUHk0AtQUaBebWC+u7lJ9toishIx4R
	ZB7Haclz2WwBQLz0kWLz+48UDryL4Vg9qkzzMTsf3iPJvMT6jQiegvqQVHb4QdD1wkWrH7LL4V2
	PTKSIAcQ9d32C3I42GkrbIRvWFjeok7KPgCTQS39U
X-Gm-Gg: AZFdTZfyVqxP9uEM2ZrQo+Y0QeaUWUyjGnkq0iUW4CNYDCxEsMh2EBDlDg9BeASfvie
	L1t5vpnl/hxwRGKcCF7XZBOyRKdPteNUodzaFb6FXvgDZ0hhMcujIYe6bUBbXKrA+hpPbc7M5PG
	Jwg4UA4TdzOc+ut3i+6Blx5j1G4SkhG/fMLiyAsdC9RP/OAFRaTgcix7/Boz4auuaMnBtMvXL6b
	uAbIpK0JpNPh1yXfW4H3dCd91VCLreCdxA8D6mDCPw8D4sf+NM0DswGUkJo0pGFg308qRuOHkZN
	ZEcrlW8k10haSJvhiiLA4LGR/NTDTFfFj8Cn7+fuVIqhYhPRut7MAP88utW4MHX16K/yjcs4e0c
	/50j0wD5RaLyqWKIpnGu17TsstFv8f7kwzIZ0B6XbjNvc7G6YsOJtXpNmQU0IFBkzADTtCglObE
	tg+C+/gx1Ief+vT2RhLpriONIE5ad4erb2oNKMN8TM6vIoESowRZqf8FqrClKy9alH9ExVt6u2C
	DidPaf3lo5E1G+v
X-Received: by 2002:a05:6512:3e04:b0:5c1:5169:7d96 with SMTP id
 2adb3069b0e04-5c1bc7bcc2fmr5416995e87.18.1795571777484; Tue, 24 Nov 2026
 17:56:17 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
In-Reply-To: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 24 Nov 2026 20:55:40 -0500
X-Gm-Features: Aa3M54oSF-t1M3f49cooUZQcavpGyBX3zvGkP46knWfBVX75TdaxeJCJdNd2TYc
Message-ID: <CA+FuTSd5Wjp=kCEtgD=KvR3njFXm4zuMXAkp9T0GxdVfHoAsqg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 0/8] hsr: Allow to send packets on specific
 port and pass the timestamp
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, "(JC), Jayachandran" <j-rameshbabu@ti.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Danish Anwar <danishanwar@ti.com>, Daolin Qiu <d-qiu@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Felix Maurer <fmaurer@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Neelima Muralidharan <neelima@ti.com>, Paolo Abeni <pabeni@redhat.com>, 
	Praneeth Bajjuri <praneeth@ti.com>, Pratheesh Gangadhar TK <pratheesh@ti.com>, 
	Richard Cochran <richardcochran@gmail.com>, Simon Horman <horms@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Daniel Machon <daniel.machon@microchip.com>, Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:17=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> I am trying to extend linuxptp to support PTP over a HSR network.
>
> This is the kernel side of the changes. In short PTP over HSR sends its
> packets to a multicast address and every node needs to forward the PTP
> packet (SYNC and FOLLOW-UP for instance) within the HSR ring.
> In order to achieve this, the HSR stack must not duplicate and forward
> the PTP packets as it would do with other packets. The delay caused by
> the duplication and forwarding adds overhead which in turn makes the
> timing information within the PTP packet inaccurate.
> The PTP stack needs to forward the packets so it is aware of the delay
> and can update the PTP packet (the FOLLOW-UP) accordingly to the delay.
>
> My current approach is to open the slave devices (eth0/ eth1) from
> userland in order to receive the PTP packets. Sending happens from the
> hsr0 device. The actual packet has an inline header prepended of type
> struct hsr_inline_header. The size of the header is equivalent to
> ethhdr. The header has a type (h_proto) at the same position as ethhdr
> and expects it to be ETH_P_1588 as this extra meta information is only
> relevant for PTP packets. It makes no sense to send PTP packets via the
> HSR interface because it gets duplicated and the timestamp information
> is lost so this should not break anything. As an additional safe guard
> there is a magic value at h_source position. The value has '0xaf' at the
> most significant byte which makes the address a locally administered
> multicast address.
>
> The header passes two information from userland: On which slave port
> the packet has to be sent and does the HSR stack need to prepend a
> header or not.
> hsr_inline_header::{has_hsr_header =3D 1, req_tx_port =3D HSR_INLINE_HDR_=
PORT_A]
> will send the packet on port PORT_A and it carries already a HSR tag.
> hsr_inline_header::{has_hsr_header =3D 0, req_tx_port =3D HSR_INLINE_HDR_=
PORT_B]
> will send the packet on port PORT_B and add system's HSR tag.
> The header is skipped so that the remaining stack sees the actual data
> and can send it as requested.
>
> The PRP packets are sent directly via the SLAVE interface. The standard
> mandates not add a PRP trailer (PRP, redundancy control trailer) to PTP
> packets. There is not really a reason to use hsr interface.
>
> HSR hardware offloading is optional. The driver needs to know if the
> operating mode is HSR or PRP. In PRP mode it needs to check the ether
> type and for ETH_P_1588 it must not perform any offloading.
> In HSR mode, for ether-type ETH_P_1588 there must be no offloading. If
> the ether-type is ETH_P_HSR there must be no offloading if the
> encapsulated protocol is ETH_P_1588.
> Driver with offloading support enabled need to be updated to handle
> these cases correctly. Also their firmware may need to be updated if
> cut-through forwarding is supported. This is not part of the series.
>
> This has been tested in a pure software environment and in an HW-assisted
> environment where the HW is able to duplicate and deduplicate packets
> but does not do it for PTP packets.
> It has not been tested within an environment where the HW is able to
> forward the PTP packet and correctly update the timing information.

Please add tools/include/uapi/linux/hsr_ptp.h to the HSR entry in
MAINTAINERS and silence/fix the SC2154 shellcheck warnings in
tools/testing/selftests/net/hsr/hsr_ptp.sh before posting v12.

--
pw-bot: cr
