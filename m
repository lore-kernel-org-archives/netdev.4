Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826328;
	b=PN2Xu/o0w4PtAdqKRFvk/cktwZHogv/XYjHUULmv/flMgqQRAfaCsaf6YT4gHdIUWjFy
	 AaLT0Ff/TAlqhkzuXB+vLq86c4AGJSPGPscAR8+mf3YeAkCtuCYzDDChAUxSVW1Z2oIq4
	 crL01zJttXLp97xaZgTTeTd/EzDnFt+7EQfZLhiWuGdbZDOHI5ibKUr5ltKOi4jPMAU5W
	 xnuKh+LAosDBd2Xv4mqGfr81XNkO8mE0ZrdSiNuvFGa7hp2qMMs3AWdQFSK5sya4WEhOY
	 GrsMIDCRbvvYJj1Zo2iMjRBe0H+jSntL3LViJKYN4he2iKzreRY1akEOl2kq6Jo3Y6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826328;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7F02L0hvgzcxM4C3QCsSXwiTmsEvJHnK4oRNhT3Dk9g=;
	b=gtzC6jjdL9Sh5eRBO6NtgDhiBqEvStB5BM8LbksMPekCLRRlVfw1d69aUbrw3Vy61MY0
	 mzoTJIPeA96A7XwQnbx7LlkhbjG+mvybLKWX0QmtcxTTTzc32sCbqqm3e9x/HcraUH2j4
	 mhvJbxG1uUVSh5RPP9sA0/iZAco3WJn5emFV/7gCp5E5ZdD24wrQ1ByazPewuqIun4rlB
	 CdVZ5kYZmVOvFzRm0oWY4z5zcNjvgRnQ9OCVLY1+OJwrBI4P5Nz8mjcRvqhOHP40ve4d3
	 Bw5q/BBeiyFOTD6BmtGcQ2Py5/jzjwzG446w7r3wayrzZv70GxahIQ64xvKE+xbjmww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="cAKB/mr7";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501E606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D501E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cAKB/mr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794826328; x=1826362328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j+5zcE4FF3OQzJIJrq10LYL+AE6wy3zLGSyLhJMaayw=;
  b=cAKB/mr7n6CInRN4smjjIHF0a9MV3ctQ/oYTB8FKGabDYmTa6ry3c73P
   hWbfEx1GqflHq+KZ3nqxvYGfF9UQwMd35D4xecko1fLk5XLDZ09HMCbtm
   P1ZSfEFdKjC88djdVukp02m1fehPJJ2Ds1XET9ZLE5n3hpjvfjYk1Ce4r
   M2s5/7sUyGJnIbomyMJrdbDw49e3RzKRNVxk/9M4Qjzah/q5dN+LdjP1G
   6p71zoiydN5UXq7tj7JdMWt+Bze8KJpDHxwayKeP5DQA6BOuplgIU30FY
   GY9U2CoZmuDEvx6FCkqGHWd1I7V3sW9/2gqXPksKu89vC3zdMjtZvA8fR
   Q==;
X-CSE-ConnectionGUID: RaN6OcNNQmSUsK6JAWs26Q==
X-CSE-MsgGUID: IwvidUkKTBCUNr/gfPGtOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3661137"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3661137"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:52:07 -0800
X-CSE-ConnectionGUID: COIcBLOyTdCVWAlW3jYnaA==
X-CSE-MsgGUID: 1jkC888OSxesPZUZbxi9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9866979"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2026 02:52:05 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	maxime.chevallier@bootlin.com,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH net-next] selftests: xsk: drop asm/barrier.h to fix the riscv build
Date: Mon, 16 Nov 2026 11:51:59 +0100
Message-Id: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
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

xsk.c includes <asm/barrier.h>, a leftover from libbpf's AF_XDP code;
nothing in it uses a barrier, the ring helpers in xsk.h use C11
atomics. On riscv, the tools asm/barrier.h includes <asm/fence.h> from
tools/arch/riscv/include. selftests/bpf had that directory on the
include path but selftests/net does not, so since the move both
xskxceiver and xdp_hw_metadata fail to build on riscv:

  asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory

Drop the redundant include.

Fixes: e8f9d8237988 ("selftests: xsk: move the AF_XDP test suite to selftests/net")
Fixes: d01fb5c81130 ("selftests: net: move xdp_hw_metadata from selftests/bpf")
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 tools/testing/selftests/net/lib/xsk/xsk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/net/lib/xsk/xsk.c b/tools/testing/selftests/net/lib/xsk/xsk.c
index 6bd32caf5d08..4e9d14f883ac 100644
--- a/tools/testing/selftests/net/lib/xsk/xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/xsk.c
@@ -13,7 +13,6 @@
 #include <string.h>
 #include <unistd.h>
 #include <arpa/inet.h>
-#include <asm/barrier.h>
 #include <linux/compiler.h>
 #include <linux/ethtool.h>
 #include <linux/filter.h>

base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.43.0

