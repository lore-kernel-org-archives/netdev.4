Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785360;
	b=OBLLqLQLkyb2dkfYYl22TeL/2Jp9DsxuaGz3vFyAPFzMCY1KmX2XPgWryxWP/839cBcE
	 hj4ZGsJCGpqNxIzRTz/jrO3cxh8aj3JLR9FL9PuuqrMX+A2FA3q52Sbhx6milxVk2N6Rt
	 oG2kmuWsAZImUsKsy8VYs9/YnYHrGlIPvUABqrR0xpkResHOavdcCdIhzokRrmUqD62bU
	 3J1vnBbKq8e6SjYYwlTJz6VHmIOIDTHf1XvFMlfis71juTM1dwxM2aEw+js9P876iGfFq
	 CDPQsJ30BOOBEyXEzmc1SnOGH09VVmDvzqXx+4CgiON4HFwyE+UNPmvRzDovzdwVL9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785360;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=KcilPTNeHFuX3APMIVWABnYww7JN1hd9xxiUDFrl/9g=;
	b=jCpwtz+J3BXMF0OxclOhpA+C4QBtpb7JnRmYuCWDc/ZYeMpS6yFE3NOmzrQx+pYvOwN5
	 wD435TvRgfDG8DbrVaxNIJ146v60EAwTS9XvBaed8KQ5lSFQzjLGJtsEE5WEkrQ5/Mhls
	 owptD0w3Tv01JYv6Xuvg71yX/alLa570HMap73jq9QC7W01b5xggEmMPNcer7muGN8HWj
	 B4mYh9LVG+JoaVWeAt0TAKJZyrYt8urf8B9YMIxgOX8zXJcnCyKvNAR1pN6w+BDRYcpyC
	 dKfog7fuuqsqT74VJHu76JQMxdfbUStc1ZZKawBSc15rjnQX2s0yKDeLEg6+kSge4MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAFfqPJr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CCF606A32E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAFfqPJr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795785359;
	b=AqO12RZzpbEZwpCLyZPNxrrqWTh4R3rwgziA6GFvXLy/LW7ZCmgV/vMifD5GkWzDsOqN
	 UxliFL2jO2immXvpwfy5YrvCIm7OLi7T3NA4MUb1q4thZ6XbHVkZnUsDMxulGHB+Moddv
	 WV40uJwd34lrPLygiCjexYqIetJaiwJUG3JtNy9xj35SjDhJkk0YLDJhqeQ/seMfBaKTh
	 11Qa2xC09yJoycMyMr+DJyYKSD4m1M+uMTi7IJCEh3mG9LJ3B9wWOVphWG4TsrGQZxpJp
	 phyBOnfYhnw17pE84Uf9iWYR0+zq8iEexwZAYqemg4A5EW2xscsjH/FT//TuhviaYEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785359;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KcilPTNeHFuX3APMIVWABnYww7JN1hd9xxiUDFrl/9g=;
	b=nQwkDpKVfEJRzuB7+8uAf2MLqz+aGJY+lgTD002U99P2t9I3HnJ3eCVS/smGmVb5XBbv
	 Pgv7tnZ3zBI6s48xvFx7zhHuFeEmywPhX2tGa3e4OhSJOHLXrYt3OurXtqSce48kq+Lsq
	 JnfzHfAiR6vYJ5IQZ6NKnwt4b91w8HNdU5OmdMLCmBYO5y+E08zx7wPXfS6Gm6U+FhUaZ
	 LALofjHcGMzu0NOhw8owpNnJWWhXh6hqU6aTIJtzqFk1FbntfqEl6AyNeIHIdpkMEwcQN
	 TZx7uNVCWz0xUd0UO8TxTtuC72wDda2miuQbSo59JSXgL0xp31wzn9poBYpE59ac5gw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D0E81F000C1;
	Fri, 27 Nov 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785359;
	bh=KcilPTNeHFuX3APMIVWABnYww7JN1hd9xxiUDFrl/9g=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=DAFfqPJr7Rq3n2A2HKIeshUvva5wDmFcXSguvsI9NCJz25tZH/F8MPD2788ga3V03
	 tFKyDanS7B0w+NSWUfD7OmL2jZORBg0Myriwo2gCzBSUTJSKh1Rf+/iRReMvUtYIs5
	 VG0let2q98QTeGePtb6uimO4SEZzd9rNr0MzE5q1MSFCHggIZ0IHg84JjESiRhuXRW
	 zU1/4777qqcyb3+MI16nTbYczQfL28djlD1VuhwJsqS5s8fSV7MW5JhHo9UPVaUS+H
	 1V3SfnkQh2lbYXTHRaZ0jKfY4rBSQ0bmmDDWwec+5DdCgKV+obUPq93pww09XyrQUi
	 y6wyKdBBDG+Ow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B33EF4B7EF;
	Fri, 27 Nov 2026 13:15:55 +0000 (UTC)
From: Juraj Sladek via B4 Relay <devnull+juraj.sladek.littleit.sk@kernel.org>
Subject: [PATCH net 0/2] net: dsa: realtek: rtl8365mb: fix CPU port on
 HSGMII after boot
Date: Fri, 27 Nov 2026 13:15:53 +0000
Message-Id: <20261127-rtl8365mb-hsgmii-fix-v1-0-f2827126aa6a@littleit.sk>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf0X7bMudcPyKPDi72HJHd5KSf3d5n
 KmZByIH4Qhd9kDgS6LsPoHKM5jW0S+MQolBF7pWSjcYzs2UdeUsrnFxIjjLjWxbS4oKItNASo/
 ASf/bHjyfMLzvB7iGRn1rAAAA
X-Change-ID: 20261127-rtl8365mb-hsgmii-fix-eb9bd1d0dd87
To: Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Johan Alvarado <contact@c127.dev>, netdev@vger.kernel.org, 
 Juraj Sladek <juraj.sladek@littleit.sk>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785355; l=2043;
 i=juraj.sladek@littleit.sk; s=20261127; h=from:subject:message-id;
 bh=H9F3Q62HeH6vV5WQ0vojsmvsWwkasQ3OghHAVC0PSwA=;
 b=ADeoMb/WSnDJx1wGE+TJVNzAL9jIL09GMrqr/qM/1AZfjnDim+67lAnKJzaQnBndKO01SMuH+
 Irp5FzvPBJTDspYJnMPwzNx4ASNDEkoW/Ds8m1KCbQASibVHOPTEMHx
X-Developer-Key: i=juraj.sladek@littleit.sk; a=ed25519;
 pk=AqKiPr9Cm4+alKqIg7OT5xi2bB7LmUEaCQbSaKx1bCs=
X-Endpoint-Received: by B4 Relay for juraj.sladek@littleit.sk/20261127 with
 auth_id=1667
X-Original-From: Juraj Sladek <juraj.sladek@littleit.sk>
Reply-To: juraj.sladek@littleit.sk

On the TP-Link Archer AX55 v1 (Qualcomm IPQ5018, RTL8367S on port 6 over
a 2500base-x/HSGMII fixed link to the IPQ5018 GMAC), wired networking is
dead after a significant share of boots, which OpenWrt users of the
device have been working around with power cycles.

Two different failure modes show up, both on the CPU to switch direction:

 - every frame from the CPU is received by the switch with an FCS error;
   patch 1 fixes this by resetting the SerDes data path again once the
   conduit is up and the link partner transmits;

 - frames from the CPU are received fine but never forwarded (or
   forwarded corrupted); patch 2 fixes this with a switch core soft
   reset a few seconds after the conduit comes up.

The root cause of the second mode is unknown to me. The vendor driver
does not use SW_RST; it does load and start firmware on the embedded
DW8051 for the HSGMII link, which this driver deliberately keeps in
reset, so the firmware may be what normally covers this. If anyone at
Realtek or with documentation can explain what PORT_DEBUG_INFO_CTRL3
(0x091A) reflects, or a more targeted reset, I am happy to test it.

Things I could not verify: whether SW_RST clears the hardware L2 table
(the static FDB entries programmed for the CPU port); traffic and the
VLAN-aware bridge setup keep working after it. Only the HSGMII case on
the IPQ5018 was tested; SGMII uses the same code path.

Test details are in the commit message of patch 2.

Signed-off-by: Juraj Sladek <juraj.sladek@littleit.sk>
---
Juraj Sladek (2):
      net: dsa: realtek: rtl8365mb: reset SerDes data path when conduit comes up
      net: dsa: realtek: rtl8365mb: soft reset switch core after conduit comes up

 drivers/net/dsa/realtek/rtl8365mb_main.c | 116 +++++++++++++++++++++++++++----
 1 file changed, 103 insertions(+), 13 deletions(-)
---
base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
change-id: 20261127-rtl8365mb-hsgmii-fix-eb9bd1d0dd87

Best regards,
-- 
Juraj Sladek <juraj.sladek@littleit.sk>


