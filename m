Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612436;
	b=t3BeMSZnLFBdFSiAGbCwqWpxM7TF3Q1xVyMmZRI0nNFYJg2HDE6K0YJwwAF2/lXqkOHA
	 ugtg3s2mXmisKKT6Oh0Y51veiF45bI9DUA2LTKFN9ulOMg1TdxhWkIX00uMgBFNvtDFh8
	 SWqHmIcE+D2h2K1HEJfemxQhgWxJzNfsNqxhlEFAS5cZSCFTgwWTgZMYnjziEbRxXVQFO
	 l2gnJdQLFAQvh0igUrB5F6DtHh7KyXHDnPJPBmqzGjigEwHpEr3D8MQr4uoHA95Nq9/pn
	 AqL+1VAaBHThvxaTZ29dI/DDsry3Knsvt8zxxA5FZgp509YyarIm5gVw9HICqFgjgjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lLppeGy1XzHj80bZaYu9ud4jXSqvMG1N0izZuQqUo64=;
	b=ChWKkErkwLIqsz15ikJU0SkCJWSwXrAG9onGfFCxBVf4dzrojWdjf+OILi7fF4x12QbM
	 AFeYKBCuuqaa3n09H4zrXymvjlG87DRFgrnQ7yk6Fyw1IqoJY7umuLlhLYw9tRyDjwnxF
	 IMv6IAm/Nx6CHN64XYlHNR5i8PFmfgK96GhDaTDMvS2vG0X5392PfyoAi0xGNqKCzOmI9
	 wAO1XIZhUiII54bVTlmulHzWrb5ABAtPkhlzm3lY96T7K+0LOjJuQ53IxCOdhxgGNG/6t
	 q750LzsjOcmBrhtPr49F1i4GdMKtWPASCa+Bbc7AbYTOCgAiC4IK7NmMuMlwRByqezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnfkDB5m;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853C5606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnfkDB5m
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so5783995a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612435; x=1796217235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLppeGy1XzHj80bZaYu9ud4jXSqvMG1N0izZuQqUo64=;
        b=qnfkDB5m873iUDYkw6ioFpHj9RndIDgteuJVkHJF/8div4yRLdm8jlUfpE9DMrdJX1
         k51M9Y3F/gPOMfeigvQh+PqOb/DyaamYL0s+so9E6bUl+eLPvMo6Qc8wvyhaU+da08D2
         X5Bmip03gZNzf3MqA8QoqxLxZXvFj08v+WDdq0j5zIaV4i+OHkD29nL06q4+4f3HHzFH
         xJRmcTkfT9nId/6T5avf/c4ZzuUG2KObMd8eGgDekUnEPWZ5tf6gZd8gVpUMp06fTr6j
         Bdr10ysjSDc9bLl3rtyYN/qdmW6hSSEnSpFQCnFgweTMzYHvBm7NjCLhcoV5tm6pDMPV
         5ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612435; x=1796217235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLppeGy1XzHj80bZaYu9ud4jXSqvMG1N0izZuQqUo64=;
        b=zioScIa10W44WGNMfp5y36hjYrzPXeUNwDXQJr7cM4YD9KL66X5vs3AqVimHvtEUJb
         zhp5+au6cUK8eAiClNHYs+NXoIRd+FUiqXsOz46Nq2tQWKLYfpgMBEYIzmu2qNcpOPQz
         F4MfsQKw2Iyd1r2RnZ83kH6gb67ZE/sjKSRSoHhfCKtrrGbsAyh264F9bE0i0gAN42Xo
         U8zUrgBMys+/M+nIn+vi+iWXUxZAQ0ojSE+uicOAUrWnZH8PV1rURc6vKysdUKrzCQkP
         xxX+Uy6FphjlUNL5DH6aMZuzzZvmsmMCa5f1Obyc4glHf9yIZrAz2VPRz4WtuMRkAG83
         e20A==
X-Gm-Message-State: APuU4Z8ZuUXbK/E1+Lv/R5lwTY246UZEkegNzTwaS+oW6e5sAwALB8ei
	kY1BgmJvb757f2826OOncGnRFW7Ri7/3If8NQ7Fx+DisMKEUV13yA6SB
X-Gm-Gg: AZFdTZcGnv9QFaQlbgVayS3JZmEd0P1PbIUjwbH3/zS1a19usaZvekK8z8WMyq8IRFi
	jEpvpJcZL1k7nFG6TznJGveCqiNPxtXAI32lHpml9dKyWePQJHa5Kh/FDEinA74bg6+zlgeAnF3
	ZMmeEUEpdCLcmUjc08Jydpwq6vLDldK3ztTOUi5P1qj++SB01EnGB6NZ482fB7gDJoqf6qtdch4
	khoqeXLmzyocsyoK4Gt1vNJABrySou5BWfhpRrQE7lsh4BwcZ1cgZUCoRPZPV0Qp8eulLLS0dWP
	GqQbHe1SqFh1Txxld9aUDB3txBM+FQQY/kFO1gLp9kVYknYsroR7us6Eks6eXlIvJLzo2/M2pn9
	sziE4HJGRcPBar+L6L0jvc4f8h4TLCpHwtdf/X0LQxZ617+fiRUOQEVFdbV6UXBWHFf5NcTl0CH
	MUySNJC+TU3WqrF/GxR+z5KD04LAsBRqDsIJEG52duvDGWjbVrbsM5aaVSXfecQc07UzT42P7HY
	fHkFY+JZ3fWibXlfHBdy3e3nHZY6WcZ0Rkr7B84z0kMWx4r7hYHTISo83g1cz24f8TtNw/zUnX2
	3r1aQwcsdzupm4ts3wZbllgW17uL+W2Oydt//Zn3r5soZNfWXbhTTVoeM2WlhE7dRMmgl56YS2q
	UipwqVBLMCKai+IFhG3FydHbsz6e+cFgEMWFANW0TwXPGoyKaH3fje+vwonWr+d9N4nAyeb59Qr
	h9NoOLsk0hnW9Mu/Lg/OEX/Q==
X-Received: by 2002:a05:6402:1f13:b0:6bb:1300:89fe with SMTP id 4fb4d7f45d1cf-6bb13009288mr2705854a12.11.1795612434766;
        Wed, 25 Nov 2026 05:13:54 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm8024647a12.33.2026.11.25.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:13:54 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: netdev@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: dsa: realtek: rtl8365mb: fix FDB lookups in VLAN-unaware bridges
Date: Wed, 25 Nov 2026 14:13:39 +0100
Message-ID: <20261125131339.908183-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <c963f0ad-65fd-4d2e-823e-5c63251e2fe5@yahoo.com>
References: <c963f0ad-65fd-4d2e-823e-5c63251e2fe5@yahoo.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 15:04:47 +0100 Mieczyslaw Nalewaj wrote:
> Since you have family D hardware and work on FDB lookups in VLAN-unaware
> bridges, could you please take a look at two patches of it, and test them
> if you have time:
>
> - 7/14, which makes IVL_EN of the 4K VLAN entries follow the VLAN
>   filtering state on family D;
> - 12/14, which handles the L2/LUT differences on family D: no EFID, so
>   an offloaded VLAN-unaware bridge is put in FID 1 with the port-based FID
>   registers while standalone ports stay in FID 0, plus the lookup-hit
>   isolation fallback (0x0A10 bit 0).

Hi Mieczyslaw,

I tested v14, where these two are 7/15 and 12/15, on the RTL8367S-VB
of a TP-Link Deco X50-PoE (IPQ5018, CPU port on HSGMII), on OpenWrt's
6.18 with the rtl8365mb backports and the six DCB/QoS commits from
net-next that v14 builds on.

The chip on this board reports version 0x0050, which v14 does not
know, so I added an entry for it. Its port 7 also drives an RTL8221B
over the second SerDes (SDS1); I carry that as a separate patch and
can send it on top of your series once it is in.

 - Boot: the CPU port came up and passed traffic on 6 of 6 boots,
   without the re-latch work from your v8.

 - A station that moves from behind a user port to behind the CPU
   port, 10 pings each, the learned entry replaced by the static CPU
   one each time:
     untagged, VLAN filtering off: 10/10
     untagged, VLAN filtering on:  10/10
     tagged in VLAN 20, filtering off: 10/10

 - With the bridge VLAN-unaware, 12/15 set PBFIDEN and FID 1 on both
   user ports and left the CPU port out; with filtering back on, both
   were cleared again. A host behind the RTL8221B port answered 10/10
   through the other user port while unaware, so the hardware forwards
   between the two in FID 1.

 - A second bridge falls back to software bridging, as max_num_bridges
   is 1 on family D; a host behind it answered 5/5 and was no longer
   reachable from the first bridge. A standalone port with the same
   MAC address as the bridge worked next to it, 15/15 on both at once.

I did not try to trigger the lookup-hit isolation fallback on purpose.

My v3 for the RTL8367S, not posted yet, touches the same things on
family C:

 - 12/15 and my 2/3 both use the port-based FID registers
   0x07AC/0x07AD and write the VID 0 entries in SVL with the FID of the
   port. You use the fixed FID 1 for the one offloaded bridge, as
   family D has no EFID; I keep the FID of a port equal to its EFID, so
   each bridge has its own FID. You leave port-based FID off on the
   CPU port, I enable it on all ports, with FID 0 on standalone ports
   and the CPU port.

 - 7/15 and my 3/3 both switch IVL_EN of the VLANs in use with the
   filtering state and keep a bitmap of those VLANs. 7/15 does it for
   the whole switch, IVL in all VLANs as soon as one user port filters;
   my 3/3 does it per VLAN, IVL while one of the member ports of that
   VLAN filters. Family C has the EFID, so per VLAN works there; I
   have not tried it on family D.

As both write the same registers and both keep a bitmap of the VLANs
in use, I will base v3 on your series once it is in net-next: use your
vlan_4k_used bitmap, and add the family C paths next to your family D
ones in port_set_efid() and for IVL_EN, rather than a second copy.

Stijn
