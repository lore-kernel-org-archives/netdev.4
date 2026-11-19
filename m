Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085160;
	b=5XgK9wAd/3zRv/9qx5Bjr3KmTBqnoSlX7DRKGNjoVzExR6wXVv/OJex+Ydl0mTZGE69I
	 HSTByCK5o0mMe/yx9X02gFkDqZNcgQPrFqGYrKydi3Q+sCEElBw/JYOVX1U/s3cFW8kAH
	 cV1p64Ep2uAK735yZfaEq3DTvc4ewXNlZTXjNTbGOwb0M3i8hr7vTRV5807eurLXKc19l
	 P4TeOSTM/xWVYvyNANYJ3ZW3TgJMxVmHibeSNbLinuGJH7YmVd4C7RHMq0AHIerHjUG/T
	 NACv+FKOvIGWFX8OS3BLtHCIJFp8aVrJCC1+k7VQInRMpww9CRWEWIijjBNt8WQHzpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085160;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dOKNhltPTQHrX/y+540Pcqnemk0kBhNF/HLO6UkiEUU=;
	b=c4IikIlr2qS2OvdkXFN32kDjQp+lE5A5YzI0G9z/U+PuYiYqM0NUqqmAZ4umHbq5oDpu
	 VuPcdKfXodLQ4RW1wHDiobxsz73wbLyQK9JDmVBzyFiRZuIqh44Wva24BhtEkn+MbxuKk
	 FayMW6thZdqD8UwpmPcuczuLGdFxQwj896jjAYbw8vHYQxeTl7xp5l/1HTjk7usJ8NAGp
	 iRLLFYPrn1nhZeYog8nJDR6sJe+nfvXo8juJEafUfunnJKBVK4aEpmlkl+7L+r80dpOER
	 s+hhX7pDeLY3dNxRZiTJWkdl/PfPNINOG3Nirs77fsb6VGjfkedZbluUewIy4AydfSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=dmcXnRFc;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DA9606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9DA9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=dmcXnRFc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795085157; x=1795344357;
	bh=dOKNhltPTQHrX/y+540Pcqnemk0kBhNF/HLO6UkiEUU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dmcXnRFccm6R9ZE0geL2c95shg3Jh9EM6z6oxSUR7Z6Wipoa3nqB9lu/d34lv0jd1
	 fL5T2hLx5p6CiibGhgpsI+Sem5uac2QHLvhwaszl1NscBnXVRxzukh7GY8C84CkF2C
	 JmL7Ltfco0KFM0iB+6h1ECGdHF6moHs6rMEchkUTps52FlwYzepTd2KLFhI5/j15co
	 GJjGYE1J42R1QWG9CaqRrLDNdwQLtmX87ZBfGb1P+m9abDNprBrbzmRZDmYM2Jr4Ov
	 BiElyX0LsklNmDWxGvU+CRX0cLP3S5s7msDRghFrGwY4Efjv5Scw9zB9O7lQ49UffP
	 141uqMtBeJq1w==
Date: Thu, 19 Nov 2026 10:45:53 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Filipe Dias <fsdias@protonmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, ChunHao Lin <hau@realtek.com>, "nic_swsd@realtek.com" <nic_swsd@realtek.com>, netdev <netdev@vger.kernel.org>
Subject: Re: RTL8125D breaks at 2.5Gbps
Message-ID: <YK8uEFdmK6-3gCUdjS6WEY4tF2ObFjJplgs-faCQOtxEOXkg8N4YyaTcguGHHHcDbNSkbZhr16dOeUIxYY2YJTUKjrH9aEnfA8ue6-1wx3A=@protonmail.com>
Feedback-ID: 27979526:user:proton
X-Pm-Message-ID: b372eeebc574d29ceaddcc292ba8f8d1b2958ddc
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
Content-Transfer-Encoding: quoted-printable

Hi,

I see what looks like a related RTL8125D problem with r8169, but on a
100 Mbps link, so it may not be specific to 2.5G.

Hardware: ASUS ROG Strix SCAR 16 (G635LR), onboard
  RTL8125 [10ec:8125] rev 0c, subsystem 1043:208f
  r8169 identifies it as "RTL8125D, XID 688"
Kernel 7.2.15 (also seen on 7.2.8), linux-firmware 20260916.

Symptom: on some boots the link goes Down/Up every ~5-7 s from the
moment the interface comes up, and it never recovers:

  r8169 0000:82:00.0 enp130s0: Link is Down
  r8169 0000:82:00.0 enp130s0: Link is Up - 100Mbps/Full - flow control rx/=
tx
  (repeats every ~6 s; 108 link-downs in 10 minutes, carrier_changes 208)

Traffic to the gateway mostly fails or is very slow (~300-400 ms RTT)
while this happens. The link partner is an office switch port that
only advertises 10/100 (autoneg on, symmetric pause). EEE shows
"enabled - inactive"; the partner advertises no EEE.

Once a boot is in this state, none of the following helped:
  - advertising only 100baseT/Full (ethtool -s ... advertise 0x008)
  - unplugging and re-plugging the cable
  - modprobe -r r8169 && modprobe r8169 (the reload logged
    "rtl_rxtx_empty_cond =3D=3D 0 (loop: 42, delay: 100)" and
    "rtl_rxtx_empty_cond_2 =3D=3D 0 (loop: 42, delay: 100)")
  - warm reboot
  - full power-off (laptop shut down and unpowered)

It is per-boot: one boot earlier the same day on the same port ran for
~30 minutes with a single link-down, and three 5-minute load tests
(r8169 with rtl8125d-1.fw, r8169 with the firmware file removed, and
r8125) were all clean on this port. I have not yet caught a bad boot
with the firmware file removed, so I can't say whether the firmware
is involved.

Same cable, port and switch with Realtek's out-of-tree r8125 9.018.00:
no flapping (carrier_changes 2 after boot, normal throughput). Loading
r8125 is also what ended the only other episode I have, on 2026-10-26
(kernel 7.2.8, same port, ~130 down/up cycles in 15 minutes). On a
1 Gbps home link I have not seen the r8169 problem.

I have full kernel logs of the bad boots, plus ethtool, ethtool
--show-eee and ethtool -S output captured during the flapping.
Excerpt from the bad boot (r8169, kernel 7.2.15):

r8169 0000:82:00.0 eth0: RTL8125D, xx:xx:xx:xx:xx:xx, XID 688, IRQ 249
r8169 0000:82:00.0 eth0: jumbo features [frames: 16362 bytes, tx checksummi=
ng: ko]
r8169 0000:82:00.0 enp130s0: renamed from eth0
Realtek Internal NBASE-T PHY r8169-0-8200:00: attached PHY driver (mii_bus:=
phy_addr=3Dr8169-0-8200:00, irq=3DMAC)
[09:46:12] r8169 0000:82:00.0 enp130s0: Link is Down
[09:46:14] r8169 0000:82:00.0 enp130s0: Link is Up - 100Mbps/Full - flow co=
ntrol rx/tx
[09:46:18] r8169 0000:82:00.0 enp130s0: Link is Down
[09:46:20] r8169 0000:82:00.0 enp130s0: Link is Up - 100Mbps/Full - flow co=
ntrol rx/tx
[09:46:23] r8169 0000:82:00.0 enp130s0: Link is Down
[09:46:25] r8169 0000:82:00.0 enp130s0: Link is Up - 100Mbps/Full - flow co=
ntrol rx/tx
[09:46:30] r8169 0000:82:00.0 enp130s0: Link is Down
[09:46:32] r8169 0000:82:00.0 enp130s0: Link is Up - 100Mbps/Full - flow co=
ntrol rx/tx
... continues the same way, 108 link-downs by 09:57

A note on where this comes from: I'm an ordinary user, not even a
programmer. I only got this far because the problem kept getting in
my way and annoyed me (a lot). I asked Claude Code to guide me
through the tests and to write this report. Please bear with me if
I've missed something obvious, and tell me in plain terms what to run
(or in terms Claude Code understands).

Thanks,
Filipe Dias
