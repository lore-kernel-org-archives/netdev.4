Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791956;
	b=fxThple0AFlc4eU3YMDdTlT5dVEQ0g3i0Jr6ybOfkqDY6nZrEzi6ltseT9okexUMj6ki
	 fiFRGr3bdL3djAPhYUXqz1RvGodqhmLnJ4r2Ax6sEEhLfnZUCEVDQkRePTyny8P8ziTGd
	 GSDT1hqT/RHK7Ivs5WFlIzUwhKFWqn753DEpy6XWSbOTb/U/KY8cEDMSNT85UyL90AvZp
	 dXkbh6hag0iKKXTPJAiFq5LuEN4Rgue0JAIhTWkLjrsTZml6J/PNcNr/PTAbMZRPSARIS
	 /8eyyRKhiGNC05ZlWO7WMFdYHLgkhlOUMev+Te1ndCDO73PXZPznGypaP1/05SijvUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZSeQqNUdSb/J7dqaTTcsr8fJ7L3SL74kNInXfLLbsk=;
	b=llBk9PBB1yWGHnh2oqYKYj7vA7RemY9RtiePvC1xUSE8Qzm//XbbM9+fzcyKhSzTOYkk
	 TiaOvvVgubcxSt4IX9KAVJ8HPg+zuCPqOETllgwmXBkccX+iMxIfQVW90k89sBiacu1jo
	 3kWbcBHS3fSMwNifHMDZ97VmoLtUN9unvaECzk2hpt+RBAJtldqbg7BfUwl8WVCMG5Wpg
	 tJHekyuaAmT7eP814DZiCFeBipwXFRuGL8hcsJ5ebJq5D4L5zNMOb5iUaJl09hbTSJ3RL
	 4NOH5aOhV0oq5vzG8menSUqQD6ivXK8n1HYOkIe+/2oh8Ob2Cf1r5N2AZ4Xj5tJBlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQKMkqvB;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E749606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E749606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQKMkqvB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791955; x=1827327955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WMH/m36JlyomR2IeIpyo7c29zr0gkWBJXWrPxZvEypE=;
  b=hQKMkqvBApq66gIBb46ph+Y77kotWwvq+VphQat2sxcnMQB75jw3ExnX
   pgOertpf5u5cZr1r73fI4D4t8utJBao3ddAxexvq5ehI8eJrr2C2hpvVD
   1kk4ETcf13aaFzPH7l+qLPIpFmDQWvK6kB2gbEOm6uewAmJob4MKTSaMI
   ozeBx8EsyuwH2OVsEo3PN2KSZf6twRGfey4GcJWDJ/57danYFEeCsPLS+
   U0CIXT4uXDnDsPDIFwgYp+uFlzr0I/w5y/s0B8W9X+4doc7RwYLwbrhBp
   4u5a0Zt0uuYrdXEpqCpJcSWQWBX0tVp0Aqu6agd+YmcY6m+5gU/3ALidN
   A==;
X-CSE-ConnectionGUID: 4+jL1JAcSFuDswmgfuXFCw==
X-CSE-MsgGUID: x3W4JVAdQoiFH8cSXRGEug==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4665968"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4665968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:05:49 -0800
X-CSE-ConnectionGUID: oKbdoDzWTnm2G4KgPHon7Q==
X-CSE-MsgGUID: RdbPsOYeTgSfXUoOQ4tDQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202627"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:05:47 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH v6 net-next 01/15] selftests: xsk: fix the stack overrun in is_adjust_tail_supported()
Date: Fri, 27 Nov 2026 16:05:13 +0100
Message-Id: <20261127150527.1122049-2-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
References: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
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

is_adjust_tail_supported() looks up adjust_value in the .bss map, whose
value is all of .bss, so bpf_map_lookup_elem() copies 12 bytes into a
4-byte int on the stack.

Read adjust_value through the skeleton instead, and return a bool.

Fixes: 4b302092553c ("selftests/xsk: Add tail adjustment tests and support check")
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 39 ++++---------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index ca161511f1e5..407c65f7293c 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -791,31 +791,12 @@ static bool is_metadata_correct(struct pkt *pkt, void *buffer, u64 addr)
 	return true;
 }
 
-static int is_adjust_tail_supported(struct xsk_xdp_progs *skel_rx, bool *supported)
+static bool is_adjust_tail_supported(struct xsk_xdp_progs *skel_rx)
 {
-	struct bpf_map *data_map;
-	int adjust_value = 0;
-	int key = 0;
-	int ret;
-
-	data_map = bpf_object__find_map_by_name(skel_rx->obj, "xsk_xdp_.bss");
-	if (!data_map || !bpf_map__is_internal(data_map)) {
-		ksft_print_msg("Error: could not find bss section of XDP program\n");
-		return -EINVAL;
-	}
-
-	ret = bpf_map_lookup_elem(bpf_map__fd(data_map), &key, &adjust_value);
-	if (ret) {
-		ksft_print_msg("Error: bpf_map_lookup_elem failed with error %d\n", ret);
-		return ret;
-	}
-
 	/* Set the 'adjust_value' variable to -EOPNOTSUPP in the XDP program if the adjust_tail
 	 * helper is not supported. Skip the adjust_tail test case in this scenario.
 	 */
-	*supported = adjust_value != -EOPNOTSUPP;
-
-	return 0;
+	return skel_rx->bss->adjust_value != -EOPNOTSUPP;
 }
 
 static bool is_frag_valid(struct xsk_umem_info *umem, u64 addr, u32 len, u32 expected_pkt_nb,
@@ -1684,18 +1665,12 @@ void *worker_testapp_validate_rx(void *arg)
 		err = ifobject->validation_func(ifobject);
 
 	if (err) {
-		if (!test->adjust_tail) {
+		if (!test->adjust_tail)
+			test->fail = true;
+		else if (!is_adjust_tail_supported(ifobject->xdp_progs))
+			test->adjust_tail_support = false;
+		else
 			test->fail = true;
-		} else {
-			bool supported;
-
-			if (is_adjust_tail_supported(ifobject->xdp_progs, &supported))
-				test->fail = true;
-			else if (!supported)
-				test->adjust_tail_support = false;
-			else
-				test->fail = true;
-		}
 	}
 
 	pthread_exit(NULL);
-- 
2.43.0

