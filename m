Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839376;
	b=D8GwPKKe5RdLfj4FlgRa2+Y/GggcIL1JuvYVivgAMTQy9L3RdNpUV6SoNVtlGzdljqfr
	 KTFqtwZkecOMDnoC5bHjTaXbwY/ef69YJ+i5cIOEU6hKNC8H4fuCAhg1W+937+/197soS
	 R9gL+XH07GUI4eClBrccSx9hdbN8TxR1WzOr/NgWmE0weCMzYTZy7CJZCI+qj1C1VSYHe
	 y+MKwt9o7KFni+zSF1+iT1d2lCM6JblvhgLAKvFLlPDuK/B+6hiVvR8y8xKcHX8CvbfFT
	 zaIGEO1hzjfD78E5QRFTOmiEJ8wqvIcCYtSzKrvyrajp4mhFUzJohH4B9NLtjGt7ACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839376;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gTrzMTvbmQluxU9mU1/iZxueEuMdLRYzOrLjXjrvL0E=;
	b=b9nnBP/7InesRZ5HbQss9zsBiX+VpEsDoMYg5fH42sOQRm/AyTC1k1NjllV5bW018eCa
	 nurfvyDhwDrMEocMKKXKrpJOCGMB5LNItYDCzkMzb4QFx3WZop9wvA68Grykicg7kq1El
	 VSIVZmwyjWxLxW2/Tg3DBlc6j8DVibcCQs1G38WlhhERD9YRAteYGiGlacrWLTyWP4g7V
	 3jCEB4NsrK7fuAGiRoprNcVFBJoCAUQTZfoxmQo2Q/Esv3OBrB6KmVzJGiLp4fPgA06yG
	 O6R+8EZZnbdk5DjoWpc9ZyjEE9T1pFnRkQgiEZHK6I24bkgP5hppSGhOSrVjymN2tRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBux35cs;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B8606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBux35cs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794839376; x=1826375376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5eML+5DJ+yGHuDW8p7l6YYoBQkMxDrr2gzvTwUcuA7k=;
  b=NBux35csvyYvLaCca2H5vpURUtm+NPoUZAI21/JKMe/+PnQ24G3XgrK7
   6bYbpAqW4QNC0igN30nTH0fcgsARrLrPAi9VW2c5rRXMD42scunlYlhBm
   UnUZfNuxDIVv43sa8TfKfopExLYAPF21oxnEU21qwps+Mmv1blhGIdCED
   SPTJj0LfqgMN89LIttDK/DDjmGVee7AKUT0vW4s2FdzSH2kJCzr798+LU
   JSENfjAC4PbicNF/ycyNzpb78CR7aXGHstayWmmRhOsU9Kas1ttuiGBI1
   rg81BcXgsiCdWUx1xJBNx/oVvuGRvsqo2h2Efq8CVg+0yUJJ7gEtkw3fY
   Q==;
X-CSE-ConnectionGUID: uidWnqO/TmikR+pnNvJgxw==
X-CSE-MsgGUID: TpAyRUujS2+0Xqj80Ksp2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3441425"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3441425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:26:16 -0800
X-CSE-ConnectionGUID: a8KeQ3YEQkOLJ0T+EB0aPg==
X-CSE-MsgGUID: NwsoTGpZRlu218r92qDsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9615291"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2026 06:26:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BF9EF9E; Mon, 16 Nov 2026 15:26:13 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/3] net: thunderbolt: Free partially completed skb when the link is torn down
Date: Mon, 16 Nov 2026 15:26:13 +0100
Message-ID: <20261116142613.876208-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116142613.876208-1-mika.westerberg@linux.intel.com>
References: <20261116142613.876208-1-mika.westerberg@linux.intel.com>
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

If tbnet_tear_down() is called while there is a packet consisting of
multiple frames the net->skb may not be released in tbnet_poll() and it
will be leaked. Fix this by freeing it in tbnet_tear_down() after NAPI
has been disabled.

Fixes: e69b6c02b4c3 ("net: Add support for networking over Thunderbolt cable")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/net/thunderbolt/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index f76b4d134b33..2b95df73c6e5 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -428,6 +428,9 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 		tbnet_free_buffers(&net->rx_ring);
 		tbnet_free_buffers(&net->tx_ring);
 
+		dev_kfree_skb_any(net->skb);
+		net->skb = NULL;
+
 		tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
 		net->remote_transmit_path = 0;
 	}
-- 
2.50.1

