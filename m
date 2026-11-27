Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765354;
	b=EfUJ02+tUvnExV9C7hizpTtTkC+BLlF8gfd34/2faggwuVbFRmHwFFe2iYtKzVKtvo1r
	 c/V45p3IUr+ovR94BSJWJG0tq5lqkzi57PmVaAbx3IoqJWFXyk/QCtqcYKup7sI/4MYMb
	 2TpP7Xlx/RjsbdWtU4cLwzGfGWVLMk/nTYMWzzhLKHPhlmtYlvu7QBItdBdN47/V9aeFg
	 4glPAKF5V+0WbG3uQ+BCtE5OfnUaVOzO1O3KYAf6E6De1re/1y2du1VsnAGnvgHuxbb7/
	 HBU2lVCTXhTFIDZZ8QHnKapD1Hy2pfu/CYVvpikVCJdV8tjUuZsoOG1vlSd5wjX+SPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765354;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7bd0Nz1pjsbwTK60RSBaNfECOmPKPFjKeCpx+H/z5QU=;
	b=yhFIgGyK/Z1tAJrksWf7S9oM7FDoGxzTQvm29cfuY6y98ZBjlQA8AV/Qzqp8bifkf9FC
	 pUuaz16Y0T2r88O0fuHiIDTit19fXiEDM5GsWie9+XOtdPbsfY4OUb3QWKkq27r0c+RmQ
	 rXJq7sBvMuE7ZxfDNk19bK3KQ9qNSfuh+1XuQn1twpsI96/TTW1LRSdlZXzsBW6hjJNgN
	 vWHD4f3tPTOe7M5Z2qMlsI4brqj42HckjrqOvfDzzTmAT1XudullDa4I6f7PZhgxqdiVY
	 ZgCYUFwS73yrNSrdbKkz2k0SnFfaw6lPsM4mfRRT4MogWZYh/Gz/CTWIUwp3mm1nc8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XUIZSjB5;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A0D606A31C;
	Fri, 27 Nov 2026 07:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XUIZSjB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=XUIZSjB5ngnCEl6HZtWnv7QB5gs6cYWqvZmWfQWdXW+8/EGiX6aTe//p5kArB6ZM0MDt4zRRJxpuM
	 ZbeLStHhcEjgdFzGpOVpc3X4uHmCZ/RH0A9uQPLG2SlcIDuVwhmSqkWy+ckhqFeN7liozuZJ6moH07
	 IRtUcagQ4KgkYNXo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b093463896-6961e;
	Fri, 27 Nov 2026 15:42:30 +0800 (CST)
X-RM-TRANSID:2ee96b093463896-6961e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b093465044-8bc3b;
	Fri, 27 Nov 2026 15:42:30 +0800 (CST)
X-RM-TRANSID:2ee76b093465044-8bc3b
From: zhaofeng2@cmss.chinamobile.com
To: Wells Lu <wells.lu@sunplus.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: ethernet: sunplus: spl2sw: fix OF node leak in spl2sw_probe()
Date: Fri, 27 Nov 2026 15:42:28 +0800
Message-ID: <20261127074228.268-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

spl2sw_probe() calls of_get_child_by_name() to obtain the
"ethernet-ports" child node and uses it as the parent for
spl2sw_get_eth_child_node() in a loop, but never releases
the reference, leaking it on every probe (and on every
goto error path).

Drop the reference with of_node_put() once the node is no
longer needed.

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current tree. Leak found by code inspection
(OF reference-counting audit of spl2sw_probe()).

 net/ethernet/sunplus/spl2sw.c | 2 +--++
 1 file changed, 2 insertions(+), 0 deletion(-)

--- a/drivers/net/ethernet/sunplus/spl2sw_driver.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_driver.c
@@ -471,6 +471,8 @@
 		spl2sw_mac_rx_mode_set(mac);
 	}
 
+	of_node_put(eth_ports_np);
+
 	/* Find first valid net device. */
 	for (i = 0; i < MAX_NETDEV_NUM; i++) {
 		if (comm->ndev[i])


