Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795052846;
	b=pJwps7UDW6yxxRR7ZrdoOlymXIHtEgxKbdXGbnxnasqh1q6/aH+Qy1LxKqybQO1w3mI4
	 0um8/qgpxYeyIkstZcTsZMiW242ScaiGrtvuYWnVE+mhKYosW7TSqSEss55Ma6ZVT+dAs
	 RrRiUXbbcMT2AeSsjBEKbDfAicMYL/ZS0Ri1oM83tPYHuaMcjPFMm6LPSpd7Xh1VN/ofH
	 /74cdOLXsE8MIdAyMA2AnN8VUTs85LS8FOxtcibMHg4FHiObqOtiTT3cjawJKSDgNow3R
	 S6Kdc4hJtbOipem3CnQFbC5KKgq4k4mkV3jgvO6d9LB8jq2bPjAx5/LClUXFKs4FMPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DXW+qyLTcL+DwIkRTBwUOGlcRoVnXW/OeVYeM74136Q=;
	b=SupkWFphGCfdH8wHB6dW2N+X6Yf9GtrDFX93MwWqktjnrjJlU/IKAdKEHGqtzMxie1Vg
	 SMfCOsXgeHvN0BpC/ylU7qPvNTE9fO4R4y3OVl281+F2t/Bm5teEOBzrCJwscS89zkNbv
	 szDVBtSDgqfSNjAkxtyRwqAu3IUy0cqNAeJCFqVbsA5tk0cXkyLozel+qqEpCO9Gj/XS1
	 NLsIX+2uy79uefRQZkUtU1kqdB8WSd+6H2NNHqMVuwZhr1Q1JYbVC9RxLg8pqBKTODLoP
	 qiDq0vf1Vwne/eXlltKcjAg/4YHgeWS1xb+mVa2JrtKnkZwGfNyX2/ML1f1WMWCwVyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwX4WoG4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1BB606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C1BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwX4WoG4
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db23d8892so2014376d50.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795052845; cv=none;
        d=google.com; s=arc-20260327;
        b=VfGdyBgUSxFtfa/uaWdP2h2GDg3Or5NmA+7D7Jib52byMwtwT5DtJJU9qRHPgy55S1
         Bx6tsSgo4Rql0bNfz4o7rDiL42MGTm/35vupCyIVTFjlChJhRyJah4UGZp4Fa6lSdryN
         rkT4WHoS65zXeRLyPfW3KWuUsGSfngrZxslph9fMdDIrU09tNJ/LbDa6jENYvOIbx2eb
         J3PjJILF+CP9KNtJs3c4WWBcyacwnbboa4LLL935gdhrY+FHAzcWs70rKUf3+qQNCaId
         XVw1leGPLI6bnzHSqDK89rivPeHYzGGJ7UWd9zexmbVI0/rwMXkY5UI4nnBCoipBgDHx
         I1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DXW+qyLTcL+DwIkRTBwUOGlcRoVnXW/OeVYeM74136Q=;
        fh=qixx6BlvXxLCxnwqRIxUGXImbe38WWfyhy1kzXq6NYo=;
        b=HTpILCEiFnhsKQQiLUus12aIL9SxcDjtOKxtARqIob4v7/MxehHnemieyO1MBBkT1D
         cwMFiEN/OvYmXMLJmlPvjo8en1WnJekzjVDBMbHd3TDe8OTr9865qKDFmQXL8WCrAR6F
         qGlMcNUPFXmZfWZ3vOtToxYkw9w7Rd25nn/eycde+ynDAdjeTih+o8kk7qDeP2jqbY7U
         Q6GlasH7qXiU24LGCbQ7zpbfCNcbA8Eegh+fAGPtvlBEDRtt7aFfCF0bvQuiaHFphYEf
         W0Pe3J1ImcA49PTJVxv9Zamfj+NCgGE4zTXyh7qNTrJKw5FjRCCjJnU3YDTwsF8rx/Yr
         Xh6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052845; x=1795657645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXW+qyLTcL+DwIkRTBwUOGlcRoVnXW/OeVYeM74136Q=;
        b=lwX4WoG4FmDRwodFR85L4utpA4uUOjmORiKi0VDA6qgMR21XAO05tcoEoupJrjIWqi
         wQCSzBwYgYYDvg7N3FInQ7FuwB7MJC9F1P0YqvF98npKHzcfqptfoJAs/eBc9v1T7gc3
         JezDQmus5h2stVQPr5NIH0P4lyO+AEsHZoyc3WXKOLROwrUcn9LKTsbBwN2pw7G9B5/m
         S99gYj1K9STgd96flRU2yns6rdP4DQC7OephRwog3+DY9Z73JketeN4p6aG6xR+ewgjJ
         /jjJ5xUln2DXF833BxjR9TSN6z4zGnmxsTb06l1Tt6pKCOEZdLlP3bCnEgCJJ/vKqx9i
         2pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052845; x=1795657645;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DXW+qyLTcL+DwIkRTBwUOGlcRoVnXW/OeVYeM74136Q=;
        b=V1kTAVvu26p3T42rX9GPKxA/8vH8WFaOw7qmLK35mstj1kqu64lFNv5zjnQDMJ66B6
         LkmQ0v+TQ/BC7mKtloGuhDzm14BCpTqHkFh/Tvz3jGw2aeNpZJfy2u1bPz1s9eUu4XIu
         /SsfgpuaaTXIocv2uLMr2muELccnSnRlLdCoCVjq553gcKPpj4p1P5RwD/33Sf7zzJYx
         6bp9+/D/Y08aptZ6zxLrd+lMhxEJGg6HYDXbMYNlxrToP1T905/FVY16A0w2omsyCSFK
         jSNfTvt8n+U6nb4mJ7pNPUbdRdTH2WA+19omlg6l3molk1/0D5ktMbKlYfMJVkGAItQ0
         WADQ==
X-Forwarded-Encrypted: i=1; AL+hErHREPiJQIAO2lwup1GB1taQGjobX+CMl4ajhR8LKEgyG6A8JCW7GNgWMlKi9W/jnYUPmqOXVtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z8BrIHGNmXipnN/k3FN5mTrx7lkYe3ZMUCuUKP6qmNXmiIFnb
	AlW1vii58tXNyDMD848Ap2pnrT2YR9GSoDjdEiL4MqSk+kPYlyh+rXOI7Huo8rKSRNY6hWQvlqK
	IFFb0lFA5UThBLLywLJM6UscrUfhGAdE=
X-Gm-Gg: AZFdTZfXU1pX4CUQfpkAfQM+XX0A7nAjXS//bMZTmshsY01F9fwstuKnV5shmNObzeC
	lNJU4xizsOarO9FCcOIf9h3/eGSlQYSfIY2Bei4dl7NLrhzx9letpG0sU+DiRokITtxrHQN+ri2
	MD+SnjMRr3v4xGEnMc2FEG0BOAObCFZW2P3TWzxSElxZ81ubvIVCXeh8XCG+dDI5E/OUiXCTzlw
	hElZZVoJQkm0GvrkJ9hOOHkLSEXwC0Fqpk7Q7VaQ4vgEGNDx24oyyZTgT9YBbJ5qzIGe86xsEnm
	oaiPUDVchEWXTlHAAM9Ds/k7Yp87zjxriLp/3lAFs/LdgshOrq391OE6BvRywO/e6QgCy+b6lMX
	3KF+/PCh6G7p1B02iMt01DfmlKNogE5mNMk5u8ClwhObVRlByeOKiizR4tvTLhvuR8tO22wwA8I
	75WrqqZkES859+mxKGYIM=
X-Received: by 2002:a05:690e:4883:20b0:67d:bedd:4939 with SMTP id
 956f58d0204a3-67dd3cfd585mr1637996d50.5.1795052845089; Wed, 18 Nov 2026
 17:47:25 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
 <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com> <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
 <CAK+kzgwVSG4CBv8NQvQaqyr__BZbd860EDfEMoZU5JdFCYhtTw@mail.gmail.com> <6e61078d-45a5-4ebf-9dc3-a74b80a637f3@yahoo.com>
In-Reply-To: <6e61078d-45a5-4ebf-9dc3-a74b80a637f3@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Wed, 18 Nov 2026 22:47:13 -0300
X-Gm-Features: AclHuK-gJyO5I8HC7n-_402u2lEGVmb0A99Jc6pgOXBywU_dep5WU8hSWLO2pjQ
Message-ID: <CAK+kzgx6cAtBEy=62ztHmcQeKQML8Wf7RAWLToy4wi=J7FL9xA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: Linus Walleij <linusw@kernel.org>, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

On Wed, Nov 18, 2026 at 08:59 Mieczyslaw Nalewaj wrote:
> 1. With IVL_EN=0 (VLAN-unaware bridge), if the FID field of the bridge
> VLAN's 4K entry is set to 1 [...] does the chip learn the bridge hosts
> with FID 1?
> 2. Which VLAN4K entry do the standalone ports classify into with PVID 0?
> 3. If 1 and 2 work out, do static entries written with key.fid = 1
> replace the learned ones?

I measured this with your v12-pre2 from the OpenWrt PR
(https://github.com/openwrt/openwrt/pull/19644, head 7690a1c6db), as
that is the version that writes FID 1 into the bridge VLANs' 4K
entries: EX511 (RTL8367S), 6.18.44, the thirteen patches as they are.
Same setup as before: two bridge ports, two hosts on standalone ports
of the same switch, loopback cables in between. I can't read the FID
out of the chip with this build, so I inferred it from how the address
table behaves.

1 and 3: yes. In a VLAN-unaware bridge whose two ports have a PVID
("bridge vlan add ... pvid untagged" with VID 2, vlan_filtering still 0,
so that 4K entry has IVL_EN=0 and FID 1), the hosts are learned without
a VID. A static entry for h2 without a VID on the other bridge port (the
driver's SVL key with FID 1) took the place of the learned row: the row
on h2's port went away, h1 -> h2 stopped (0/6), and after the delete h2
was learned on its own port again. So the chip learns with the FID of
the 4K entry, and static entries with FID 1 replace the learned ones.

One detail there: br_fdb_add() without a VID on a port that has VLANs
also adds the entry for each of them, so the driver gets a second call
with VID 2 and writes it as an IVL row. That row is not looked up while
IVL_EN is 0 and becomes the live one once vlan_filtering goes on, which
I take to be intended.

2: with the bridge on PVID 2, the standalone ports (PVID 0) are not in
FID 1: with learning on, h1 -> h2 gives 20/20 (0/20 on v11's plain
bridge), and with a static entry without a VID on the far bridge port
the host behind it receives the frames (100/100; 0 with v11). Frames
tagged with a VID the bridge does not have (VID 5, no 4K entry) do not
get there: with learning on, tagged h1 -> h2 gave 0/20. I can't tell
from here whether they land in FID 0 or are dropped.

The plain br-lan is where it breaks. OpenWrt's default br-lan has no
VLAN at all: its ports keep PVID 0 like the standalone ports, and the
driver writes no 4K entry for VID 0, so the bridge is looked up in FID 0
while its entries are now written with FID 1:

- a static entry without a VID no longer steers or drops: with the
  entry on the egress port the frames still flood to the uplink (104
  out of wan for 100 sent; 7 with v11), and with it on the ingress port
  they still go out of the other port (100; 0 with v11);
- the bridge's own host entries (br-lan's address, and what is learned
  behind the CPU) take the same key, so I expect frames to the router
  in a plain br-lan to flood to every bridge port. I did not measure
  this one;
- with fdb_isolation, which v12-pre2 sets, DSA installs the standalone
  ports' addresses as static host entries in FID 0. In the lab the
  hosts are standalone ports of the same switch, so the plain bridge's
  frames to them hit those entries and go to the CPU with
  offload_fwd_mark set, and the software bridge does not forward them
  on: h1 -> h2 fails with learning off (0/50; 50/50 with v11), 0/5000
  in the load test, and the hosts are not learned on the bridge ports
  at all. In the field a standalone port's address is usually the
  router's own, so this one matters less, but it is the same shared
  FID.

A way out could be to give the ports of a VLAN-unaware bridge a private
PVID whose 4K entry has FID 1, as mv88e6xxx does with
MV88E6XXX_VID_BRIDGED / MV88E6XXX_FID_BRIDGED
(mv88e6xxx_port_commit_pvid()). That would put the plain bridge where
the test above put it by hand, where all of this works. The tagged
frames with an unknown VID would still need a look.

On the 5.4 s: with the bitmap in v12-pre2 each vlan_filtering toggle
took 20-30 ms, and the rest of the toggle tests behaved as with v11
apart from the group entries.

The other things I found in v12-pre2 (the multicast key, a few comments)
are about code that is not on the list yet, so I put them on the
OpenWrt PR. I'll run the next version when you have it.

Thanks,
Gustavo
