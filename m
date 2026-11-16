Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863391;
	b=AYza76xnh6nnA3WDaWfJxgbrsvlW0yhk1MPI3e3mkMi4o3Pq6og3l5Q5ygX4SjTouK62
	 vyfUampVD/loVv4MsDqGG6YXRaTytXUA+ZP8ZbEP+GpsV9wSNLABNGncL5CH2qYXqoqX7
	 IEgm3rMIU3Wr8tYP+IsLm7WGG/3O5zD8MTrnPKIDiSLhffgApvLb3VyefOBmP5Cu4dVbW
	 K4E7E+lE3iyoll48y/q0EbTKgBhPPFNfpk1mCKB0Tre1KFbHCUJnnnW1N43KhMOYjrDqw
	 CfqGX4JIUzktdAS2DfFS80zbiynUmg2EEBaIdqIW2SAywgNpkVbf3LdQO3kbmRITAoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863391;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=tDKOjLIrGRWdnFpabDolKAXG+Pxw+0h1CyxXZ/xbAjc=;
	b=4DK2XRoxl7+boYLCkiR1aqBtr4n9fyeBljvp+Rv+JdWx0sB95XyCR7sY+rFHADJFzdfg
	 c7ti3tymL6eWZhDlJWpY1LLcCqvGzge6vEa/83SMkGaroufFtdf9q+O2Lm3ONm1unaum8
	 9x3SiXcTvMf8xmmZzk9h7rHbaXg8pAUkwG+dv935p6fec0lq5wft+3m5oX89cFIIwjOYN
	 eWZkiOXbxC/BpfqELVA6V2OUYkqGIxaHCOfy8/bK44KzgGiiR2Rmba1JMQDzP62ka7XVV
	 SRMFUoWXb+liBCuN9R5Xg0hs8lXEAMtVhv6B8cO4xfcdmb+UMWeByUeIsSBEN7++ggQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mcq6eI+Q;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06650606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06650606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mcq6eI+Q
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ed06b725fdso2390505ad.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863389; x=1795468189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tDKOjLIrGRWdnFpabDolKAXG+Pxw+0h1CyxXZ/xbAjc=;
        b=ZmMq90gExKW4OFCwaQTLxoa8l395WL0y74t5GG4Oy2CzfTAnn4/ifkpr/Lb3+c/tls
         g8UBZHLvP2rEvW4C98FsQa+WI2BKJ/Imm9tYX6dv+jxO474EZO8kP8z3evmCCbMGB/4I
         8RKkbrixRl9YBJ+5ullV5nToE+3kzyllT1nfC1hP4L3axJ8m33kUxk8Xyb1MHeD6XgIq
         VJuI76Fs5w42+44g2FaIw1CNkousHFnJccFg6ZO9yS7C1vmKP+xoH5Xxlp82Gg3u6xrL
         m5PHC9yED+OFwrwUPiieaJ7usp5JUyTF73OGqJE8VTN8o9XsOD5zoTX8unjfa+IrVFW2
         QmrQ==
X-Gm-Message-State: APuU4Z/LAgePKs2NuO2+rlmH2aTWW97NG7Mes+5cMiAreIloQzos8Jc1
	0jR2yHfeGXNEVMWY/uHYzIi0X8i+FtxskRhSVTRRt0tbP2IztWKxjxbz6D5tsgK9oyR9Heo1/4/
	4vB8fPMWA7CZ3yte25EiNL5VMjbLkdDaBILbF1G0UQoL2VK6XXk84Dt4nMaPwXaNLsm2FrFiXMl
	EXkuPqJ8bZ0xAGOIe9NTArNIw1oQzWutGL/mlqu6YwnA9VsdH8L1KfX5tVwPVc9k/z0LJYHPCND
	apjZDHdM106ELm/
X-Gm-Gg: AZFdTZeYrVXvU/JA3YYKcLIwncLvhMaM6sNwMHLjMYPVHWIZ+cnQcc4yTNWSV4TmthL
	ositQ+f2ssKcvx4F56cTN/1aTWEeIItPzA3K+YYYxhtI2whfsKLX1onwMvsp7TUeWNkNdben1PY
	XPZU97EE4m/6paTinBPDCwf9cJHdTnQHqLhVJT3IrS/7nq6QYCvju6PdwjYTuMrcASaC2TrPEVW
	P0ureFMuZ8pdUQed9j9fGR44DCyrx4l7N98G77D1ODK4dLgLNNxRvTS1vLg6G93D7JNp67Rqw83
	lTURJuDoWOiBuGHqIM3WfXPec5b5HpGpVYiZoyH6xTs/LnrNwIwCx10I+hZac2lEcswSRQHugqZ
	qpca3znjNHpQ30Nc5T+FNwhNK7l71qzLaPBcif7dWuEr86UWqaSjSzP61zpVrkv/0Sr+Xk0QG8M
	A1HNMJi89RuFujhUWiSdKZ/YVXh4rdX0tAUrqb5Rwq
X-Received: by 2002:a17:90b:4fc2:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3b3abe61f72mr355228a91.38.1794863389142;
        Mon, 16 Nov 2026 13:09:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3abbe1asm6500149a91.5.2026.11.16.13.09.48
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c6c1e082bso4091706d6.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863387; x=1795468187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDKOjLIrGRWdnFpabDolKAXG+Pxw+0h1CyxXZ/xbAjc=;
        b=Mcq6eI+QU0M5fXNu3qml4t6mVM2z72NHTaVgQQBkClIc+To7L3+0GJerY+ihSJGsRQ
         l8UogqyJYWiH9hqmR42Mj+/oTee8IU2CXQlT8B9g3i2t6DlSs8GfJUxKzhmdtytpi9Lc
         Owuzk0IjrOIpOv88N4J2kzE52GO5nNvMfijRg=
X-Received: by 2002:a05:6214:dac:b0:91f:ffc:69cf with SMTP id 6a1803df08f44-920fd451275mr11930356d6.35.1794863387374;
        Mon, 16 Nov 2026 13:09:47 -0800 (PST)
X-Received: by 2002:a05:6214:dac:b0:91f:ffc:69cf with SMTP id 6a1803df08f44-920fd451275mr11929756d6.35.1794863386673;
        Mon, 16 Nov 2026 13:09:46 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:46 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 0/8] net: dsa: b53: Preliminary fixes
Date: Mon, 16 Nov 2026 13:09:34 -0800
Message-ID: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series contains fixes to issues reported by Sashiko on the
b53 PCS bug fixes being submitted, and then some more that came from
code review and testing.

Except for issue #2, all of the other issues did trigger in testing and
needed to be corrected.

Changes in v6:

- patch 3: drop the commit message paragraph claiming that deleting an
  absent entry now returns -ENOENT, the return value is unchanged (0)
- patch 4: describe the b53_mirror_del() capture port clear as a
  cleanup rather than a separate fix
- patch 5: add a Fixes: tag for 41af38324341, which covers the 2 Gbps
  set path on GMII override registers
- patch 6: do not propagate the ds->ops->setup() error from
  bcm_sf2_sw_resume(), setup re-registers the devlink VLAN resource on
  resume and would return -EEXIST, leaving the user ports down
- patch 7: document that active mirror rules are restored on resume and
  that the patch depends on patches 4 and 6; verified the mirror
  register offsets against the BCM6368, BCM6362 and BCM63268 datasheets

Changes in v5:

- resolved build warning in patch #7 by moving b53_mirror_init()'s
  declaration into patch #6

Changes in v4:

- Return success when deleting an ARL entry that does not exist per
  Sashiko's review
- Restrict the 2 Gbps override bit to BCM5301x and BCM58xx
- Restore mirror configuration on resume, moving mirror initialization into the reference-counting patch
- Propagate SF2 setup errors on resume and disable the clock on failure when WoL is inactive
- Add a patch fixing BCM5325/BCM5365 mirror port encoding, including CPU port bitmap translation

Changes in v3:

- patch 2: added Daniel's R-b tag
- patch 3: mention in the commit message that deleting an absent entry
  now returns -ENOENT, including when the lookup runs out of space
- patch 4: document that the patch also fixes the clear of the capture
  port field in b53_mirror_del()
- patch 6: reference count the mirror source bits per port and
  direction, ignoring deletions without a matching reference
- patch 7: new, harden mirror register programming:
  - reset the mirror capture and source control registers at setup for
    b53 and bcm_sf2, since not all switches are reset
  - check and propagate all mirror register read/write errors, only
    taking a source reference once hardware programming succeeded
  - use the source masks rather than MIRROR_EN to decide whether the
    destination is occupied, and write the destination before the source
- log failures in b53_mirror_del() since it cannot return an error
- patch 8: new, fix the mirror capture port encoding on BCM5325 and
  BCM5365, which use an 11-bit bitmap (CPU port at bit 8) instead of a
  port ID, and translate the CPU port in the ingress/egress source
  masks as well (verified against the BCM5325E, BCM5325M and BCM5365P
  datasheets)

Changes in v2:

- collected Jonas' R-b tags
- corrected logic in patch #3 to propagate -ENOENT, memset after the
  debug print, translate -ENOSPC to -ENOENT when deleting

Florian Fainelli (8):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: reject conflicting mirror destinations
  net: dsa: b53: use the correct override register 2 Gbps bit
  net: dsa: b53: reference count shared mirror source bits
  net: dsa: b53: harden mirror register programming
  net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365

 drivers/net/dsa/b53/b53_common.c | 209 +++++++++++++++++++++++++------
 drivers/net/dsa/b53/b53_priv.h   |   4 +
 drivers/net/dsa/b53/b53_regs.h   |   1 +
 drivers/net/dsa/b53/b53_srab.c   |   2 +-
 drivers/net/dsa/bcm_sf2.c        |   4 +
 5 files changed, 179 insertions(+), 41 deletions(-)

-- 
2.53.0

