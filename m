Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359556;
	b=DhjgGYKzgrLlpneJ86/sXNGAgUm17tq1dBoyrr9qEQRoYVKRAOKOtVti1/mH/zrog0co
	 E+HNN7tpzTebGx8Nxeix3tKQjpgqNHqsyT4hWce/+OygzfXSLHB7H/FHl7uawz89nZJXn
	 gHAwoSJj/A4u8c75mkTMcgKs8S0c44bWRN4KiosxZhHt5iy3hjrHyR4h3tJLNk7eBzA/J
	 UkUW/PX7qm96Uti4zRtjhkeZvezoBtgms2XdusTDt9vewF9I2F6kSK9jdHecYJHk5emed
	 4c/c1uPrAeMooxTMc585MdW0mhM8+uuIkCR/Tv0v0PbpWlBqn+WvyiBtRPZJrFUXW0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=X1Jfjyzxz6MsAqZk2y0Hvxg0xcZ7y0VOiPnh638TQCE=;
	b=m5fhfxdiN50QolrU+Fx71Z3xkRo18mX8agGuQurg28+M1rUUSOWt+BxmQEz2ESnP2icr
	 x4WbjbYEJiGAjFQCOOfB0tSJslI2uxGotm9QY5u6GM5qrXe4Ns3xjc5AhZ3jNWRhexg+o
	 j06uTRK/I0rxzrxQibfYw3tsA9k+Rf79IvwaqZK+aAeDPpxmdHNUHgOJAUHzF+lNOzsWe
	 EPFVk+5o6dg+qew++/MEBwxOdRMEiYl96mF62JIm2SCg/6exAKztB//zgkixPXUdSAAZ5
	 r9a7jl82zAnQK77cv/C3pTrY+aYYGAXeMnbntNabdvbLv3GXrG40Io7pTO3BFws0l8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtHK1Dj4;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B085A606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B085A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtHK1Dj4
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1207121a91.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359555; x=1795964355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1Jfjyzxz6MsAqZk2y0Hvxg0xcZ7y0VOiPnh638TQCE=;
        b=vtHK1Dj4u26EbXeP/gk7By7/NSSpHnHTK7su+dp0IYLhw4VvurCe4Rui6O2tus5WYK
         EpxjX+JbZTSzq8vI/2ELqcfL8nDEdXtQMSelG/+eRQoeztmCze0vY4WHHkczFgRc8wfp
         7SV593SPLQzH/q8dpU5JUSei2kRLs1Qm9ViGWm4cXCjLq32kfnT94GX6rM9QM9bhh1Ib
         s9J7/NRsJ5GmBesfoUTA04et/nrMAmaA4Y+WMjERMq3kdkSwL7OBJn5AJ+ag31r51Q/l
         mcnuUsQZQj0U18KpudZFPtjKoix/qnJaTWqD68dc35qvpPWHmCe6XVeGaZN7Nx05/nOC
         lCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359555; x=1795964355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1Jfjyzxz6MsAqZk2y0Hvxg0xcZ7y0VOiPnh638TQCE=;
        b=nB+aoxnEMR6MdLByknHHSKguwwS93Apz6xizCZh/3s0RCDN17PUwh2y+B521P3nK3F
         CjS/NPRyTPAHBA5u6pRFki52QdSaJ6jVoImyMdsGb90UB1o6xnumsWb57uZcRbjjCCKC
         Ab3pAD+eRphEkX2DFJkFWZTLApcGrKPt8o86WqrXE65rYVrHBW15R8wGw0cDX+vX4AXX
         Cwif7TpI2uFMYQvJR8YeIsCIzMTojxMtc6i7J7fgaULBdl9x2vygfZvDWchope7b/+5y
         cUwBtSVEMpmT7MO1tymIxOvwFHCOFFJMV22k8JWOagAB3VTjPtU/XdXSIj7jSiyjVaks
         m7Aw==
X-Gm-Message-State: APuU4Z/4Q4L/StcQD35pkLDHn9hN53YjuJCOPnID3rgDjg+C1w+cfFWM
	OA/EYbcubCXswn8uT7bTyqv1P9wCpQam78+YmxfI6zvmODUKcmvHSctZkuyFc+zE
X-Gm-Gg: AZFdTZcy9kM1MKG7zmwABUFgP2hnM0PllO2U1SEcQO8moGf7MzBf4skB2qRGLi+1k3u
	lh8YmiC+cwTH3nXzOA+BK/+0mz8F8POg1iaEMK9xdlj1pLXWR+tzs2CpC39LPZQnQtTCqA/Uiwi
	jmNigG6Pn2AdxVCGWtK1EIhm2Z02YdIPhTvy/ZS0JCkKcu7IgNUxTNUjO73yRBpUBZ+YXCv0/zk
	TZQdwZcB7G3FGi+4nmiofvu6a4CT77UDr1COMKALzZYP2mZatXE+kMUWHe6bsizs+0xUB6Zp3QT
	Sq8/6+oA+yhhwmSCpT4n+NzbcM9yQ9xjCDb1bgyZD1aqY1hX8GDb5dtkxwsSt5XILiWqHv985+Q
	9ovnYJs5gGnx1BawDMiHOIik9hywCZ2yJ+n/AkV5AKyBQ7RSVvCcVLAxpll4hGLM8chkWGAYQD8
	v6WMZLcohpkgkPdzLoqBkh04p+pKNiFpLwXggTgKCufnkrzTV4AE4WwX/u6tDFyto2jgWtn2J/Z
	OGWGgCoTQRZZm9werEXERVQC/NvUXmHoT2R6yAd8/yU8D7A2PEjgCMtf3Mi1bu8UW8+Uo4TbMFH
	DrsHJLk+Bii2lsLE+8ZA0I8dUeusdhprMtKuEXk98DDQW4QV5B/FZz7M808nTcr/YXw=
X-Received: by 2002:a17:90b:442c:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b41c554624mr7751230a91.0.1795359555081;
        Sun, 22 Nov 2026 06:59:15 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm16387442a91.10.2026.11.22.06.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:14 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] bonding: keep non-Ethernet slaves out of 802.3ad bonds
Date: Sun, 22 Nov 2026 23:59:08 +0900
Message-ID: <179535729502.2645501.5219010464870440@gmail.com>
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

bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
802.3ad bond, so a slave whose addr_len is 16, such as an ip6tnl device,
makes dev_mc_add() read past it. Patch 1 rejects such a slave at enslave
time in every case; patch 2 stops an enslaved bond from changing its
type afterwards.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v3:
- Add patch 2: as the Sashiko review of v1 pointed out, a bond enslaved
  to an 802.3ad bond could still change its type.
- Patch 1 is unchanged; its tags are kept.
- Hangbin asked on v2 whether the bond type should be reset when the
  mode is set to 802.3ad; as answered there, the first Ethernet slave
  resets it, so this series leaves it alone.
v2: https://lore.kernel.org/netdev/179505868590.3571070.12381528230330714812@gmail.com/
- Move the check above the type handling, as Jay suggested.
v1: https://lore.kernel.org/netdev/179500849159.1877154.14715369660816392826@gmail.com/

The patches were written with LLM assistance; we reviewed and tested
them. With them, neither the direct nor the nested reproducer triggers
the report. Enslaving Ethernet devices into an 802.3ad bond, a
non-Ethernet device into an active-backup bond, and the type change of
a bond enslaved to a balance-rr bond, as in bond-eth-type-change.sh,
work as before.

Kyuwon Cho (2):
  bonding: reject a non-Ethernet 802.3ad slave even when the type
    matches
  bonding: don't let an 802.3ad slave change its type

 drivers/net/bonding/bond_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.43.0

