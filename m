Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717419;
	b=rJGEzoRN7yA4gN+z0lT8HcrJOH5xxp+Mntylxi/D8OkudUY8PfRsN3+xwPSOqmTKpnMn
	 JjvJ2N9w5xgXmid+drEox6vhhpvsHjob35VCR/kbAefEbhV7NBuTjbNh3FfQ0j8P3iYiS
	 P8d/M/CcLPyCAdcG2kXEPhYKVqozn7GrCpudWmYYCNDTzP+zAXFav6/Z5/ruakRv91G3W
	 cHyvyWFHuNo68yND9sw3RbJjjcnAt454UiSHiXkYtuYUmsJxXWx4OpwpdkAN1n5coEw6f
	 N9J4LbhHhN8xeCkYrVgOq3dhJnaWyHFt9bFb64WmtySrktg8iFW/5AWDRhVTM95R6Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uIphw3j1z96h8uTiUhwuuY5bkqMdxke2b6zGFFM9IrU=;
	b=sN04/8lRFccXKhIlMR/pt/hEMTcLChH2M0K2Hq7xzGArgmyFa3JEHgTHXF4HIRM8nbf/
	 EeWcUa4+io8FDv1J2Pf5m+U3FIYsTgv3Fz0bVET/oa4rSQ42UiXRPT0abI9TiCs/gRWB+
	 qbZrQE6Efcz2CJLLMd/onIcCzzWQjlvb57TvZwZa3Pu9GWlRXLfSBOBJ6lLJ3nNz4a/yS
	 cEAd8RYKO87zdBmx6Ff5qkFC3fh1zGe9Inj2xyldWLknRmJBk398J80rl8AE3dsHnvo77
	 9l0ZS6bayddv8rVwGgN4MtklZPCPalvuGFmAVBaqLXHDz35SWakkipT08BFXLDKhepA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NWVQ3/5Y";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB8606A681
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CB8606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWVQ3/5Y
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38431138772so9451964eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717418; x=1796322218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uIphw3j1z96h8uTiUhwuuY5bkqMdxke2b6zGFFM9IrU=;
        b=NWVQ3/5Y/54sK5m1Ak377/sFmSJCTXKP4Wb8Ug5ZGyoqCPDTsIr+1rxFekGleY3lma
         1wb49zAOP52QgqAxBEEwDW3zKDVmbPotFc41+z/hsXzjJ/F0vlCTqxQORIZfEsOFJ11H
         t9Oy4bEP/750ac5xd6sRTMlpm3qgveOe407weMUitQ7g1BnmAXEaAwCt0zxp1EFcL3Bz
         l/67IvSn5Vwkj05EFNt7vQb8hRVa40nY/R8kU5Ed8th+35rb9JbtbqYtVc7WTv38f+0E
         V1Sg0UA5e3d15l1bjId4t+s5mKkvmH+OsGL5bIOtXrveCdA45pm05mCbgve5txFTjzjr
         ByLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717418; x=1796322218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uIphw3j1z96h8uTiUhwuuY5bkqMdxke2b6zGFFM9IrU=;
        b=IuZ4m4blKFqgBp+3yuAClhi9949sf2dIn9KYAhZbTV5hU9znWB+eZyV+IIegjru+8t
         k1A45SDz27XoPLrHH2rzSCMg4P14FtHGE5EUlLU2Eb/YnaGbQcDoTYsyibzJLmcre4mU
         5UJNXLWWl0dPoEw+vdU8AgkIpxxaT1rLIjcaLJNj+mYN54yeh2ehFpuoKlGVRBUsi+9f
         8w8/yrFm2ZYXsTsfzenIq9IVNlmxZaOnxGiHccaRekyByQTu5AIB5o999PNhuDZm7OBs
         a07X2bGE//qYYRmDQ6W1J+gcw5sfOVY0IOL61HcsUmC6yFF2gI/yXmZDPf1SqTbwNrd0
         DEkw==
X-Gm-Message-State: APuU4Z9dges/fF1PaK5S4UPPNnkybayWTyrhCX9fQ+n7QUI3VAAFzHKo
	c0Ck8ZX9b1vBwMo+KwhN6e6B9pQkd9DIKr5PB6lv39MHn5XzbXS/E5hYZJaM6o5/Eq8=
X-Gm-Gg: AZFdTZdCcw8/xsSWs3Qcd6LmKYXT5TP6irbh5OKAGACgSWo4M7GStnqMkBCEeCV3lKM
	TFpB9kFvCKduApf/Gup2TscnHYNBvvbpJmRcTtWMEHlsjN54Ogslx3b0TvRiMEUquNohIynC/5A
	DBMEuJegqrlYycvyKxGQf3lv85cvdQCmpTatYuyRTdsdnIwjPIIFd/Dww/pXBwk8pe4bB4s0OIp
	4DXdoQPqalT4UxmzqM4mgA/PVedq0E5HtIPmng04goHd6zt8Zb5ecNavKwJQptMoWHxKi9fcRf6
	6zEt4htRVDH0YQrnnXsszQ0LY9MJpV96Kg3tgoDE+ZghhJIMKlXkFHkCXsA0ElHLHKH8B9TaiF6
	wRGEwwcOEGNUa96JivbKS0Xe2fLnfwLISOs9ldHXZlPW+Hhxum8X1RGXWQz3AETYlOtpFnoa3Z+
	IFkcmG5FmYyrSi0ng3KHRORj/7fTyRjGMvxyuFRjQbiljyo/G4XqIkVWILY9q/8zYjWJIrhUouC
	8GxPoxRhwAmrbrfk2KM95Mj4M4lHd1S6F6gVo3VAeR6pfsSpMeFIWdLsInbSsR4NhCamBb5kBJO
	uWJu2MZSn725KWO9GoC/Q0EFpnFYVyk4lGs8C/WpzO7OjFwKtpmJELWjLyd516rQnwkg8g1IvAT
	/F+gzf/LnIlKhcqeQ7alHiL8TSdI=
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr24927038eec.18.1795717417596;
        Thu, 26 Nov 2026 10:23:37 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm11826582eec.2.2026.11.26.10.23.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 10:23:36 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v7 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Fri, 27 Nov 2026 00:23:27 +0600
Message-ID: <20261126182329.91058-1-ilskdw@gmail.com>
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

When a learning VXLAN device snoops a known MAC from another VTEP, it
rewrites the remote's IP address in place but keeps the remote's
dst_cache and remote_ifindex. Traffic to the moved MAC can then use the
route cached for the previous remote and be blackholed. Patch 1 updates
the remote the way vxlan_fdb_replace() does, under vxlan->hash_lock,
and compares remote_ifindex in the early return only for link-local
sources, so a "via" device set on a dynamic entry is kept. Patch 2 adds
a selftest.

Results on net with 1, 2 and 4 CPUs, per selftest case (move behind a
router, move to link-local, via kept):
- without patch 1: 0/7, 0/7, 7/7
- with this version: 14/14, 14/14, 14/14
- with this version and CONFIG_PROVE_LOCKING: 7/7 for each case, no
  lockdep splats

v7:
- share all checks between the lockless path and the locked recheck in
  one helper, which also makes their order the same, and drop the
  redundant lockdep assertion (Paolo Abeni)

v6: https://lore.kernel.org/netdev/20261119095256.42005-1-ilskdw@gmail.com/
- update the remote under vxlan->hash_lock and check the entry again
  once the lock is held, so concurrent snoops cannot mix remote_ip and
  remote_ifindex (Sashiko)
- selftest: pin pings to an allowed CPU instead of CPU 0, skip when
  setup_ns fails, and drop the CPU pinning from the IPv6 case, which
  does not test the route cache (Sashiko)

v5: https://lore.kernel.org/netdev/20261115040609.61134-1-ilskdw@gmail.com/
- compare remote_ifindex in the early return only for link-local
  sources, so traffic from the same remote no longer resets a "via"
  device to 0 (Sashiko)
- selftest: add a case for the above and keep lines within 80 columns

v4: https://lore.kernel.org/netdev/20261113155133.75090-1-ilskdw@gmail.com/
- add the selftest (Nicolas Dichtel)

v3: https://lore.kernel.org/netdev/20261111180001.2475-1-ilskdw@gmail.com/
- use my real name in From: and Signed-off-by:

v2: https://lore.kernel.org/netdev/20261110153020.9635-1-ilskdw@gmail.com/
- also update remote_ifindex and clear offloaded, as vxlan_fdb_replace() does
- add the IPv6 link-local case to the changelog and a second Fixes tag

v1: https://lore.kernel.org/netdev/20261106144406.66035-1-ilskdw@gmail.com/

Zhefu Peng (2):
  vxlan: reset the remote's dst cache when snooping moves a MAC
  selftests: net: add a test for vxlan snooping moving a MAC

 drivers/net/vxlan/vxlan_core.c                |  87 +++++--
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 222 ++++++++++++++++++
 3 files changed, 292 insertions(+), 18 deletions(-)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

