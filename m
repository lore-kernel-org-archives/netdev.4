Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123189;
	b=S0v8QHVSy1kUz4gXOZuVDpsC8Gme66s/aK5hIdmWEwQi5e1l9ggO5LAl3sC2zKOcKOtj
	 80aW1QgeKIk6qAaTqzXIoMF5cG2FRRvs6kpfFsZLc8ljoRMD1GBuk2j7ou5avbyZ4HNgX
	 md2dqz4RGnEHrO6KgRLpxcaRNFHAjrXlDrZrCUcepCbhyw3ZgpQXrPVOT12RCLx9Zukzw
	 9nr2sTRdZhlcwvFFU1gT4Cxw+CaPraWx2rn6yRLtPQXEl3JO33y3E8FEyvRfP7kDkOAKn
	 CfkXNKcUhL04Qj1RoUQwzwNnR6gAct9v2T6SyDwNHV/fcCkwQd+6gnSwSeNJQuZ94kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Z209N0q+r1NjNxUhzR6kiPLATti/mGc4UR2/BzH8DBo=;
	b=uB3f8cdVIQ8Si7COCnyilsJIPTe0DidxTeJuJaafifMmjXWLrSS8lqyLodKJUr50tXbP
	 bDT0Y0iEpwmpu+Lw//EfDPxLQCwUMsiOOWPgu7Od3Gy2S4XKqoCa1IhLtxnOa2wdo61wu
	 VT3tKCXe3O7/O+57VeMMeyDpQP017b9a/K1XtepAMDu/uoUy2FXkxdkEXCQvqJ6XDHrKi
	 kLf+PN85r+awQ7BpV4Y8ys8cF/hp5Tc0JeH6QSsd722xfr61py8MHfIz2v8nBwLRdNDQz
	 i3PBQ5GGyytKd0uKo7XhXGTRIJmIN9s2xfuq+MjJGGQp5s0bEFJlyz8q6xog8S3y5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUS7xvyG;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962AC606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962AC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUS7xvyG
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso454880c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123189; x=1795727989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z209N0q+r1NjNxUhzR6kiPLATti/mGc4UR2/BzH8DBo=;
        b=bUS7xvyGUGkeOaq/dSRGdz+KpdCLbg9pl8ojwXebLuQU8HdWWJJwr3H6JuyWAU8lcc
         QXhY51ZOt1bUFAq6xKld4a/p8dqseL3osMWDPbLqLtm5rX9U5qZdDPZxMqHjdHLKfrch
         xyZkZrluj0ZOpB0ElCmQ5wnH2oiJgc8X/FFWnNyCFf2MoErgNc5Y8Ot/PWTpoXR9f8Nv
         rSWUrp7Cg4YkHpepVV6cZCgbvl77TMIwjvDZ8gd/x2G4Whl54vE+tSIYAGOSuY89sOS3
         D+jxhDJ9DpKzpIiaAcFVva9ZIL5Mros/PaOOTA8urffoJMu80xPcdo2hoJdcNHK0SiWS
         okvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123189; x=1795727989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z209N0q+r1NjNxUhzR6kiPLATti/mGc4UR2/BzH8DBo=;
        b=zoWYcHxdPj2ThvL2j0GgERFw7URcLhKUrwbCOc/lgutsglo5jNgPgCSs41QWeMy0SJ
         FevgXPNuGeB7xbmwrjqNDob/mhCTXbBKIL7v93mSJH6I98hgaGCI37RmDs16mKmW2hB9
         fbq878dLX0p1opEn7gFe2wjzRLFeXfDodMZ/u0SW7gFna+4/NPjnQAsI2KRSnopYlWha
         FnP7Dp7bgTUqpIMZLz2kz9DqVrI6nPK6T6G9JvVs+xMAy8iMAQvMJINuZh7IgVgZEbTd
         gOC170rpdsEUwv2JTPsKsDkRjelQHPH9jaIvXX7WCt25wBNU9iXR0C7a1uX4K1VRwgPU
         J07A==
X-Gm-Message-State: APuU4Z8CGeIBD7MSTdnAs8NQ0StKmjEWU3drqREr8P/h2wX5htws7Ny2
	ae/EOpp5Ur0tHEheekQkCaLX33BQMWAFAHC814BhuWXCDhx9xdRtJ0jn7lTdTzHU
X-Gm-Gg: AYBFou2YPFI9YtVtLqgyhtqqOkH2aA8rAD3ujGc0SLLLsc6HckN3NWrQJVD4LjHvfGE
	X2fGOrU4th2avMVUVO1Pa1/jgAzfb4g6BIfl9YGb+5GbWwk6qd06sj3JLiHJ3OlKmcn6/pcNL5t
	l+MeCwAk8zDwWg5Ps1Qwid7SGGuJmVnVW48y+ch6/1iHBjbGDUtUEwSgk4Rd0zUt4RWH7aw1xDl
	58kpS/HZtDNlV6hihDnZzbzf/Yp0AQ6f/Z8OSnn2uDct7o+yzaRi0+Xxb2XDYSuAfzkAUNzSdzJ
	V90Z5dwE1uCi8FO9iCD8U+GfvSCyOBJMp/6yKgiOeu6WmAE+Vg8ocJYtvaRUhKIgtDFnUdidhv4
	KYtn6XbHRw9mPzPtqHTT8BBGB4LS/Lp1bA4Om0RKFuxoEwzEBfgPW+OwdGpC/wGXc/hyKiP5cPn
	iOC5CNMOaRk/8pvuETcZkCZjy+Fjv6HOWsJ5Rifhkh3lIQ5KqxnQYHRQA7Z9IAh/ubgUGKXcI4F
	x0zHhWrCsjPqAXEYXoXZBoW55/Wpr4WeRqG2dhafsl9mSs+NYx9duuU5+Gyes2EAcfvCACwMcrm
	whbZAURQjSSoycuxeaFtM/WqEYqfD6hg5pKFXrA/OM9bmipyl1xEI+9+ao5psGVTedL174qUKnE
	cz5wXbW20sQSgNPh1Acmep8NM0O7HeT8VgqgRHR1mkoUMAnPM06T+wRhNX4i9tkngjBTXgxxu
X-Received: by 2002:a05:701b:465f:10b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b5568cfbcdmr843336c88.16.1795123188512;
        Thu, 19 Nov 2026 13:19:48 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm2513815c88.9.2026.11.19.13.19.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:47 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net v2 0/4] ptp: ocp: fix timestamp teardown and DPLL routing
Date: Thu, 19 Nov 2026 13:19:46 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

These fixes address existing Time Card teardown and routing issues and
are independent of the WiWi board support series.

Changes since v1:
- Patch 1 uses the existing device spinlock instead of a new mutex, as
  suggested by Vadim Fedorenko. It covers the stopping check, PPS map
  changes and MMIO, but releases the lock before pci_irq_vector() and
  synchronize_irq(). The vector lookup takes the MSI descriptor mutex.
- During teardown, the PPS no-state-change shortcut is bypassed so a
  concurrent disable which has cleared the map cannot cause detach to
  skip its own IRQ drain.
- The source-derived removal harness now checks that MMIO remains locked,
  vector lookup and IRQ synchronization are unlocked, and an in-flight
  disable cannot skip teardown synchronization. Six intentional
  regressions are rejected.
- Code changes in patches 2-4 are unchanged. Group Fixes, Link and
  Signed-off-by trailers without intervening blank lines, addressing
  the v1 verify_fixes CI finding.

The common and WiWi-integration PTP objects compile for x86-64 with W=1
and KCFLAGS=-Werror. Source-derived ASan/UBSan removal and routing checks
pass. The old-source control still reproduces rearming. These are mocked
MMIO/IRQ interleaving tests, not kernel lockdep, KASAN or physical unbind
tests. No production machine, card firmware or Windows HLK host was used.

The issues were reported in the netdev Sashiko AI review and checked
against the upstream source. Codex prepared the code, changelogs and
software tests at the request to separate common fixes from WiWi support;
this revision checks Vadim's spinlock suggestion and extends the removal
tests. The patch changelogs describe the discovery and testing details.

Previous series:
https://lore.kernel.org/r/20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com
Review:
https://lore.kernel.org/r/ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev

Base: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5 (same net base as v1).
WiWi v4 remains separate and unsent.

Ahmad Byagowi (4):
  ptp: ocp: prevent timestamp rearming during detach
  ptp: ocp: use hardware selectors in DPLL frequency operations
  ptp: ocp: report disabled SMA inputs consistently over DPLL
  ptp: ocp: correct the DCF output frequency

 drivers/ptp/ptp_ocp.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

