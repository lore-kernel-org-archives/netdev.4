Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795704981;
	b=f37ImpszWgUcGsTVuiq6g5zKoS0H+bY0kv9qH5WMfBDatJm27HUdATqRtrsBNHIG+5uA
	 m8KVfaRJh473tdOt0yRtCjAw8nK1dvFv8R92Qji+FLmD+lT5q98eCHcv5HRaE/osW9d/j
	 mAll55u6lGYJVVRAp5m3vPO7fNrzDK98Mi9EToIxEb7xo6xc6y2104WMjZpJMyScwhO67
	 LloT9ClpB+cDlO/TcCB02m2G7sSbRZDcI7lTWUpHk+w7eOAFhQojitSTcFEcXpXu/KsFO
	 XvsyhtmqqPcYkBcPydhIBdIhyBp1GC1h6oBy6TiqoTPN6wGkw5e1IKreEVusvFZwl7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=sazKEX1R4BrGDT0WCKCVyCnEwbw/C1lgsW6fMkXOKSA=;
	b=XQqhB2mBh/o59SI9L6rbTrltQcfE2PslXjWXCgVOiChuQZ6OSfFc9D5DAfmnDZRID57P
	 N0o7iQhyHNJWuU0SwPx5xMFSsozGSJpejVoaab1wMns2R3CZJe2p7aD/b26IOIBswdTvK
	 Pd1L31FDwtIFx4WTh8pUGQ/K0BC1F14iew6hNNzS+XXLzEZGasDRHsyD0V6sH/oQBjeLD
	 MrCoW36d7QLdNcCVCszcVSliYFEKZJd34NdpG8v/vsZU0NSuNeuL+OcNGHqtd2Ljs8Wlj
	 yIapwtoluStk8BkisC8bqoX22F79s8NHXmQrXtPEKkwZ1SdfBkWSsZp9Ozq2aWiyrKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaJQhgaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96786606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96786606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaJQhgaP
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so538867e87.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795704979; cv=none;
        d=google.com; s=arc-20260327;
        b=n5xZOdCw9d+oI+9ReRGd5Al4mhhGl6nwFnCu+BCJUDDX/tDWmPkz1P2J8hEFhnH5Wq
         XZCm2ssoVqe2xqmsAClgZzqypfNrbxVnDDJ7BktWGWQXoyTihL/pEUOjLGCfpLRPRgCO
         27NrLnmv+rbbsv/sEPErdMkq1P0l3j8zVJX29TVTg4V448h+TrRmA/nKjh+IUPvoQx0M
         UnZ8oBg5DRBEBaFJSRwTotxhhRhvZoQR0hvrG3b63yBfaeA3QZsVzLZR8ZvSkmBkkwzo
         WQrZY/7KepBjn1uI9eTDWSV2yvFxAS5a1dtE/X+g2p/QWnqWeNUugnmB590jUAoFQRBi
         xJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sazKEX1R4BrGDT0WCKCVyCnEwbw/C1lgsW6fMkXOKSA=;
        fh=QqJGmL5Roh3DuW8U842aKf18AeU2X2KkhYfemQbQZSo=;
        b=l/RMXvmKlwEqwCbBUE6Q6dawKJcepSWtbkh44ScL/vFEsZkouoidRH2ZeIwKRv79ct
         7iHdUiACrUi0JcB67srR82GQWnkVdqtFNlkMTpwcjFp34qDI1Sf4yCuNfMGDx8Q1EY+1
         WYiL2AHFEdrn+ManWouXIocX8zl9vuqj20JvvmZhF0r4F3i0lMPYasBn4bWtGTyGDBMc
         BfKQIx2RVPrn4nbyfvOe2tJAH4u/tTml47+6ohRX93jA00l4VRISf/yvM3WbthVlkEGC
         3RbMKsdgFKQds03FKDtBLGZTPckp8xQSYh2+eJ8yAqS6RUJM+fGoTqJI6paefDqJfKkg
         IOkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795704979; x=1796309779; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sazKEX1R4BrGDT0WCKCVyCnEwbw/C1lgsW6fMkXOKSA=;
        b=zaJQhgaPoqBs+cf2eiQraDdHsfWkUGPNtRBqvcbXj/PvL/0q6GgsPRSrfpHweDGKWN
         QfoCCXFU1u2LvC0TS9Y+JK0HBYMeo41CYZnwOyveZcp3IgsPRorTnw9yFnxAyy6VAhWj
         GNq9Gucd9vmHd2mtwFISDDiquUonQgDV6s1mLJEjCrR/vz0IsjcIoZlyFvdUPYEdIZZI
         kotkFlicKxwMOR75SGTRxYXi+m9V+L/usuZaAu693QVzPsRRncHLSgSQhhxz3vLRXlYc
         JSDaA1MNAvvN31n54twYAzkS78sQwi5wW5RIy/yPAh1iBabZU+VxqgpPxsjALhlwbBDz
         C6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704979; x=1796309779;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sazKEX1R4BrGDT0WCKCVyCnEwbw/C1lgsW6fMkXOKSA=;
        b=GVlTfDF0vWgSYsSNArPweIgp0bUkuMbRrgpnBFtDhULy7Srm6Pm39Iyt8Op7x+7Zvd
         tEbAaBhSumUiba9CqxONUnKs6v/TP4SN5f/c+WN9aSgWFKQAmVY9xar77XxqhhIpp81g
         wlLPjTCcPtYR63c3eb8hhFOhOLR1zZ1XXFBGSy+mt4E6o+0oumTcJpymhDplIF/5Wd82
         vOKmG9En+RXrusLcOmlNFfz6aIQns+cDbh7vsZ5OYZGDG0oUWC/peIw0E1KainNwvEUA
         L1D3tg2qKZ7Ac4qf4bM8m1+LWabZ3gSS+a9A802o0RCKe65U0Hr13SzwXzNfP1RP5g+H
         znbg==
X-Gm-Message-State: APuU4Z8LuFHTCP0NvQ+fKJG1kYxumCTb/C/a2yObjZBexRUBz6KRAqgB
	4KnIDoThLu44/SHiU8DiS2wVx1VnGDzn8QozRy3+ueOl+JIebtAgwQ61QCGzrZJAiWkwqpOtjif
	cqm9o1QJXsEsPpJSqLv+Mx2nUDiLqzsgZogvBmeo=
X-Gm-Gg: AZFdTZfNHrqtF03R39wq3ufO2bzxEUoJEEPpRKewVwIiwXnk+KqqxKF14ekdpOa7qpz
	5qp0L6pYfIrql9kQrga1+wjvrH+ji9Ymv3JHxElXNp6FPSPBAClZkcQDiizzgS/QCuLERZJkEOd
	0IUGLp7v0OJALoxkZs2LAOCySggJwGDH+X6wIJa6aTe7lZqVsjiQqBCBtMkmB8DOr/qECVCjCqn
	e/SjZJn3rDIQpXBN8ghVaE7VCeAzy4xnaJVZ046hTr9WPt/ppkxprUyXj5zbS/76Rm2zyKU4vxB
	tfwob2M6KFIacE+W3IxGPsK2r6jcpjpsIK/7OnmC8urlTkM6WuCfOC+L54ERJ0uBHiL3zLS/b/C
	WyHKX6KDKz7wRvrXwxKgI6ewXQ8AnSwLq3O19uev/csiZuoP5dnmDyMjHDC1TVpbD4jFUsgHKK+
	QPxeNg8oFNKCMkQvM8+DCf3BavX+kMWyevX8rGsWA4w9towR3B4eGZS9rnbmjPBZOjk0oBF+Bng
	FWorE8jixzjM+PsZHb1dWjFHqjN4COqAjDB
X-Received: by 2002:a05:6512:6ce:b0:5c1:4c0a:49d9 with SMTP id
 2adb3069b0e04-5c1bc7be504mr6314606e87.16.1795704978469; Thu, 26 Nov 2026
 06:56:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Martin Mollat <mmollat@gmail.com>
Date: Thu, 26 Nov 2026 08:56:07 -0600
X-Gm-Features: Aa3M54qFOYto8z_InSw6HMUGS5CSZb-cn9UVcH_wtIU7R5PICnLnBaPOzItBues
Message-ID: <CAEh2-qxSFdNBCeCn4k-J4ivtZs2hx1SZOv=UiPZtm+KcBiA6nw@mail.gmail.com>
Subject: [BUG] r8169: RTL8126A (XID 64a) TX throughput collapses with TSO
 enabled (2.5 Gbps -> ~3 Mbps)
To: hkallweit1@gmail.com, nic_swsd@realtek.com
Cc: netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On an RTL8126A driven by r8169, TCP transmit collapses as soon as TSO
is enabled: about 3 Mbit/s with hundreds of retransmissions, against
line rate (2.35 Gbit/s, 0 retransmissions) with TSO off. Receive is
not affected. The same machine and cable with Realtek's out-of-tree
r8126 driver (10.017.00, TSO on by default) reaches line rate in both
directions.

Hardware / software:

NIC: RTL8126 5GbE [10ec:8126] (rev 01), subsystem MSI [1462:7e70];
r8169 reports RTL8126A, XID 64a
Board: MSI PRO X870E-P WIFI (MS-7E70), BIOS 2.A33, onboard NIC
Link: 2.5Gbps/Full, flow control off (switch port is 2.5G)
PCIe: 8GT/s x1
Kernel: 7.3.4-300.fc45.x86_64 (Fedora 45)
Firmware: rtl8126a-3_0.0.5 08/30/24 (linux-firmware 20261019)
Limits: gso_max_size 64000, gso_max_segs 64, tso_max_size 64000, tso_max_segs 64
EEE disabled, PCIe ASPM disabled on the NIC link (setpci, both ends).

Reproduction: iperf3 between this host and another 2.5G Linux host on
the same switch, 10 s runs, IPv4 unless noted.

r8126 10.017.00, TSO on (default): send 2356 Mbit/s, 0 retr; recv 2353 Mbit/s
r8169, TSO on (default): send 2.3 Mbit/s, 593 retr; recv 2353 Mbit/s, 0 retr
r8169, TSO on, 4 parallel streams: send 21 Mbit/s, 3164 retr
r8169, TSO off (ethtool -K tso off): send 2357 Mbit/s, 0 retr

With TSO on, I also tried the following (6 s runs, all broken):

gso_max_size 32768 / 16384 / 8192 / 4096: 2.4 - 4.4 Mbit/s, 300 - 330 retr each
tx-tcp-segmentation off, tx-tcp6-segmentation on, IPv6 link-local: 2.8
Mbit/s, 361 retr
tx-tcp-mangleid-segmentation off: not changeable here; 3.5 Mbit/s

So even a TSO burst of only ~3 segments is mishandled, and TSO6 is
affected the same way. The receiver's TCPOFOQueue counter grows on
every TSO-on run, i.e. segments arrive out of order. Nothing is
logged: no NETDEV WATCHDOG, no tx_errors / tx_aborted / tx_underrun,
and the link stays up.

The same symptom (r8169 + RTL8126, ~67% retransmission, out-of-order
arrival, fixed by turning TSO off) was reported on 6.17 in
https://github.com/ublue-os/bazzite/issues/4664 (closed as stale,
never reported upstream as far as I can tell). I found no related
change in r8169_main.c up to 2026-11-06.

dmesg (r8169 lines; MAC removed):

r8169 0000:0e:00.0: enabling device (0000 -> 0003)
r8169 0000:0e:00.0 eth0: RTL8126A, <MAC>, XID 64a, IRQ 148
r8169 0000:0e:00.0 eth0: jumbo features [frames: 16362 bytes, tx
checksumming: ko]
r8169 0000:0e:00.0 enp14s0: renamed from eth0
Realtek Internal NBASE-T PHY r8169-0-e00:00: attached PHY driver
(mii_bus:phy_addr=r8169-0-e00:00, irq=MAC)
r8169 0000:0e:00.0 enp14s0: Link is Down
r8169 0000:0e:00.0 enp14s0: Link is Up - 2.5Gbps/Full - flow control off
r8169 0000:0e:00.0: invalid VPD tag 0x00 (size 0) at offset 0; assume
missing optional EEPROM

Workaround: ethtool -K <if> tso off. Until this is fixed, disabling
TSO by default for RTL8126A (as was done for some RTL8168 versions in
the past) would avoid a silent ~1000x upload slowdown for everyone on
this chip.

I can run test patches on this machine, and capture a tcpdump or a
register dump (ethtool -d) on request. I will also add a Red Hat
Bugzilla entry so other users can follow this.

Thanks,

Martin Mollat
Dallas, TX, USA
