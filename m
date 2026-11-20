Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212050;
	b=xIjOzZ8tvx4UxnwU9gLztpiIijFOPPG6YykfkufnSSyqGeGvk8TinOAkmR9s48XzK/YG
	 Me5rKQzzqpiMjuJxrGDgl08Bub/MILLWRtP7zsxTi8n6p444BFZDPw1IpH2Xwx7XWR/As
	 1SbYwY1IcNBI36uyk4JXNC2LKddxFxbmOuQXBFTrooocQBMjEVYLnZyijc23c35SGL/TK
	 v+7lB6lGDGVHjMsfRbAPfA/RmBQYN7qNfLUW2ZD3Ron9kUmnn4Z0Fpdpk0ns0sCcWtmAP
	 DTpytNvrZ5N3waBu/LktcgKVDzVoOqyjjH6L31lpufEK1RUpbI39IUG7eHDO/7hqm3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212050;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JNS1OF0Z2nig4XozI2HYyebi9JGCPjMbatPlkS7QwvQ=;
	b=Bp9TD0cBj15QCOXbavqnbVB1nqL02qrVfRo3SRCkPnre4tsGx05xU7vOxKd6p41QIpjl
	 ogOk4a3UwI8hHrxXGmGh51q+zMySJj/cgGZXulVCzJ3PeCrTmSRNkpnCPRf+yUhYJtS0Y
	 evK6N9dC4qMoOzmTnwIJI46HbwIKnZQeDhLI8kWE0tCavR5PiJ/tdgFvSN/WxJB4FmVRo
	 eRl8gfW8Uk72C0BNU/3RDXZdHDHQ8HInX8UZFE+amlFmnP/kfl+37VERZUJsVLyLpgRVp
	 wAw5MgLYsnz6tZrszZ2b23Qbh1p6wQ9Evligoz6zZuMLMUQ2lHjPQI2Bulb9m+BSZzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KlFZGRAa;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7394B606A6BE
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7394B606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KlFZGRAa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795212050; x=1826748050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Tlelogsy64SRtXCCfDM7VGHDcEWwIbacaCFSg3S6rs=;
  b=KlFZGRAaNMxZyDhbBvF9XMkNN4RzM6SxpdPph+/tTmSJw3xcZtl54Ddh
   hO4g5UiumaZ+OvEVYG1USeI3Nv0B0r/6VxU8mtt8hjvG05LK+/XEZTEEL
   0heOT2pgjYZK4lhUpyXaZor1e9pushSfs/auNjexXEDSQL8cJVgVA4qu6
   t6cD+Yb48k9DrKGWHW2GuL0ztcHk4LOaK1f2kRNKOogey0F/QFkms2DqA
   Fbp87bjDUSiQNxH8sHoOKIx1XIcXXjAdWFBe24yf/bF/z/2efPX4/UYRe
   FLj4ZDFvFXny+O4AAzfEXrH1EYBgdkac02m7vgOsk/6MHpLsmbpVkEPCR
   g==;
X-CSE-ConnectionGUID: NotziWwSQVGdxp7E5L27tw==
X-CSE-MsgGUID: 6bBV1QaXSC6f6z+hxFZLXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3995044"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3995044"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 14:00:37 -0800
X-CSE-ConnectionGUID: kr0IhE9MQu2IVOoA5/uUHQ==
X-CSE-MsgGUID: N/tJ8tJKT3OGlJhQSjOKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10775821"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 14:00:35 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Linkui Xiao <xiaolinkui@kylinos.cn>,
	anthony.l.nguyen@intel.com,
	ripatel@wii.dev,
	xiaolinkui@126.com,
	tomasz.lichwala@linux.intel.com,
	runyu.xiao@seu.edu.cn,
	jedrzej.jagielski@intel.com,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Alexander Nowlin <alexander.nowlin@intel.com>
Subject: [PATCH net 2/4] ixgbe: fix incomplete ACI command buffer backup on retry
Date: Fri, 20 Nov 2026 14:00:18 -0800
Message-ID: <20261120220022.3133664-3-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
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

From: Linkui Xiao <xiaolinkui@kylinos.cn>

ixgbe_aci_send_cmd() saves only the first byte of the caller's buffer
before an EBUSY retry, using kmalloc() plus a single-byte store. When
retries are exhausted, the caller's output buffer is filled with
uninitialized slab bytes, because only the first byte was saved before
the retry. The firmware itself does not see this data, since the
retryable opcodes do not set LIBIE_AQ_FLAG_RD, but the caller still
receives garbage in its output buffer.

Replace the kmalloc() plus single-byte store with kmemdup() so the whole
indirect command buffer is saved before an EBUSY retry, skip the backup
when buf_size is 0, and key the restore off buf_cpy instead of buf,
exactly like ice_sq_send_cmd_retry() already does.

Fixes: c9e563cae19e ("ixgbe: add support for devlink reload")
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Tested-by: Alexander Nowlin <alexander.nowlin@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
index da8519065d81..a6dc214f7771 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
@@ -214,11 +214,10 @@ int ixgbe_aci_send_cmd(struct ixgbe_hw *hw, struct libie_aq_desc *desc,
 
 	is_cmd_for_retry = ixgbe_should_retry_aci_send_cmd_execute(opcode);
 	if (is_cmd_for_retry) {
-		if (buf) {
-			buf_cpy = kmalloc(buf_size, GFP_KERNEL);
+		if (buf && buf_size) {
+			buf_cpy = kmemdup(buf, buf_size, GFP_KERNEL);
 			if (!buf_cpy)
 				return -ENOMEM;
-			*buf_cpy = *(u8 *)buf;
 		}
 		desc_cpy = *desc;
 	}
@@ -234,7 +233,7 @@ int ixgbe_aci_send_cmd(struct ixgbe_hw *hw, struct libie_aq_desc *desc,
 		    last_status != LIBIE_AQ_RC_EBUSY)
 			break;
 
-		if (buf)
+		if (buf_cpy)
 			memcpy(buf, buf_cpy, buf_size);
 		*desc = desc_cpy;
 
-- 
2.47.1

