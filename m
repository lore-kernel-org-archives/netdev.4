Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839377;
	b=KCN0BDiF8OoSZVGyztpuMCtLWxfrjrT/D8ypm0yMv9NUmvrbzasILu6JWBb3w3uCkc7F
	 yZQ5CeA0+1MOuxqMse7pEWuSBHoAdoHda5KBCP0ZVKIWDYlRC8T2R4uTozHmnevhih4q8
	 WVDDLqHiOUMcfUG/MPx+w85Jiia9yA0jz9bExVhU3x6XKZI5IKKQUZawQ1A4HHi7BAmof
	 /ok4I0WLdj7K2L8JhGg3strwvc9aScT8HFtXhPVWKCG8jsoTdsOZRslEoy8MNS270wUmJ
	 qwpMqBlHYIuYIL/xKJ7sfePygjkBAivHEh7NFhddJ4AO4pMPR1UrmQJ6xDFEDk9ZHYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839377;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JsnDMFG9J4Z8ocZJJlXhg03pei3G5s+u/Ib+GDIrLS4=;
	b=ptG9BBWgs41tPBwalhkGv3qhz4u9TXDleuJvw4fGOiYkbpfqWhjIXIt6i58WzB179FQt
	 Q3+0rY8UzIvzw9DuoZs36Mz23YaPHkA/k5XRn7OIyfVZhdJ5/8ielv4BceRQUe6vI+x7w
	 k9sbnH/DTSmp8fAo5eQ70oV3cMhdaYtzjzbW5ZhPLmZJUmeT3I8fR0HDwuP0C3HfQM3NQ
	 P82tLLdvdaU6ifvgf2C5g7uhFbyQ7YSPlv4nUhe1isY8YdRJ1mG3JHk5NGqRn5oX7WiKm
	 MPp+JWrnp7/2VL2bFDwH4EFib1ma/vOubuUr4Pv5WYFEKpFWXUY/RkhJNyNe04Z6VaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K89Z3+rG;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20D606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A20D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K89Z3+rG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794839377; x=1826375377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PTJNI1wEuJ9VngOnx8SNlI6XYWl09effYqEwfhryyz4=;
  b=K89Z3+rGboXCKO407YuDxbGPFS92Zp/VXDJ2Z/K2RvmJL185T0ru66T9
   1fxzn2QYzkpTveOV9a/jiOpmPPVLsc2J97k7eZM3AwN7+QcAy+6F6oIK6
   1m1yRdG7/T6C3LmxtMwRCbLp5EqfTZljWl0Nu5vEM2EvG3LZvafpMzjM4
   CbfrCWpMZDOe+8lOATJxhPynUspduHUwLzbjcU0bXrVQBoKkrnd/3vdbv
   KEAj7fFbFc3W73XT6iTjyClKQnLYFGAkGhqHpwbvufmox5W63nRW6Pynx
   M3Z5es73YwAn6gJkJYQjGUg92eGGLw2ieidygN6+C+f7g3pXnd9+NVg22
   A==;
X-CSE-ConnectionGUID: q3t94cVtQjWeQJ+7RGAe9A==
X-CSE-MsgGUID: WRjPvW6MRcS24P4WnsXXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3441434"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:26:17 -0800
X-CSE-ConnectionGUID: cAITf8zRTNWpyDwMV3K9SQ==
X-CSE-MsgGUID: lVqnQsIFToGTEm9+ux28iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9615292"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2026 06:26:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B6CAE99; Mon, 16 Nov 2026 15:26:13 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/3] net: thunderbolt: Various fixes
Date: Mon, 16 Nov 2026 15:26:10 +0100
Message-ID: <20261116142613.876208-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Hi all,

This series fixes various issues. Two of them was pointed out by Sashiko
during code review, one was found during development of those fixes.

The previous version of the series can be found:

  https://lore.kernel.org/netdev/20261103125621.1111198-1-mika.westerberg@linux.intel.com/

Changes from v1:

  - Prevent unintended refilling the Rx ring if poll triggers during
    tear down.
  - Keep polling if we fail to allocate new Rx descriptors to avoid
    permanent stop.
  - New patch that releases partially completed skb.

Mika Westerberg (3):
  net: thunderbolt: Stop queueing Rx buffers if allocation fails
  net: thunderbolt: Prevent Tx descriptor leak in tbnet_start_xmit()
  net: thunderbolt: Free partially completed skb when the link is torn down

 drivers/net/thunderbolt/main.c | 98 +++++++++++++++++++++++++---------
 1 file changed, 74 insertions(+), 24 deletions(-)

-- 
2.50.1

