Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839178;
	b=NDQTUaiRiIBkyOosoqG1N7CiKFJuNjrkWXn1yFeZE32XIbO4wVOsrFlCozOHcFHojXXe
	 0Vq/whP4Hq6rtNjX00ewamOFV0QfEs/7j0x+aqYgPXj4gHg8fAcjHGYXfO1v++VnTrN7Q
	 SVrQD454QCaKcnEX0J2ZSjbFn+4EfpMCILuB/x8b1Knzt9g5yMmkCWSBfOqixIcYAQSTB
	 k+3bEjxFbmuBQ7aJpqG5/wiEveNpIHk38DteWSmtesIh6hTLXSf4jdzU/+P4B7PTE913x
	 jOxxPTYoBWffBhgIwUVbMZUxK5x/qJWm/gw5utzd7x/WbBXVZG6Y7BOes8OZ2HWjNaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ko/+DzniP4cIOe/BM7SvucJbgkR1eQVYfRv7WVz+hBU=;
	b=lAFGGkXJ88QJTUjFXwJhK8s+Au0vdY76WkOzV8sDKQk0RPHSMaQk4nffiIkuBWQaCvz1
	 E3XaG55H56D7fXXwXJnc2ePpCgba+9QRBSDGoLP6NRhWhgNqxJp54SuIwOEI+2BkTnpBM
	 iNyULHTeLivU8vt9IFLHRSydDV3KmKRoGm582VSC5s6bOGdrPLHBwl1l9ws9DEMjbtS6T
	 Gm/cy30OJir/YIHdtukYwxMWGLf7OzeJZUfNVtdzqfXf4Sj2oPRjs3XPpS5a5FSSxfxUp
	 gkh4N7WsDMqIZO5aIyLLFKJE7JCnUdU2bBmXRqCqbIbYlgfyBI9MuuKufFP3mCX8fjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Da5E75oU;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF31606A333
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF31606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Da5E75oU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794839178; x=1826375178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tNlg5wq+WhLaKfqKxvvhIhHCwrN6XlDtXHXclT3NoOk=;
  b=Da5E75oUl+PR4n1q1SEY/ZynaE1nRRuEyl//fZFvaYd2CdENQLrOhqnX
   ILZ+VmkKTK4CsrwyBAx/UQyh+7+9xqawpuontTd+qAPaUno5TaBNzyZrg
   8AKRNM8BV/MRtAR4WJpH+fxd5TPzTWe7WjAuC7ml8gHKPfdrSkR+XfXGP
   /fOgEBkf8Jlea+fWwzjeQTMndhIBZy7BS2QWqOkwIA4tl5uTfoHf1rphN
   EBi1E4zE/sZtXk9S8mQsQ/k54/+rPorAaM0lK7qdskVxdfhFUihNWe7GU
   1sLi2vacs629OmKPEFk1XHREa9SDGgp11yyNXaDu2hEeOwHWXrfnFYerR
   A==;
X-CSE-ConnectionGUID: vNqiHtu+QMOK7y5AJHo2vQ==
X-CSE-MsgGUID: B4vCT5QUQ/2F2nPK5FEUPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3573483"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3573483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:26:17 -0800
X-CSE-ConnectionGUID: aZeH+NHFQASYQhO6WCBTnA==
X-CSE-MsgGUID: d4yj4HudSb6yxsnnDybaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9809211"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2026 06:26:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BC39C9D; Mon, 16 Nov 2026 15:26:13 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/3] net: thunderbolt: Prevent Tx descriptor leak in tbnet_start_xmit()
Date: Mon, 16 Nov 2026 15:26:12 +0100
Message-ID: <20261116142613.876208-3-mika.westerberg@linux.intel.com>
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

Sashiko pointed out that tbnet_start_xmit() may leak one Tx
descriptor on three error paths jumping to err_drop because frame_index
is not yet updated but the Tx descriptor is already used. This will
accumulate over time and in the worst case run out of Tx descriptors
completely.

Fix this by subtracting the correct number on error path.

Fixes: e69b6c02b4c3 ("net: Add support for networking over Thunderbolt cable")
Closes: https://sashiko.dev/#/patchset/20260902082128.1148463-1-mika.westerberg%40linux.intel.com
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/net/thunderbolt/main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index 1593ad76e645..f76b4d134b33 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -1175,13 +1175,13 @@ static netdev_tx_t tbnet_start_xmit(struct sk_buff *skb,
 	struct tbnet_frame *frames[MAX_SKB_FRAGS];
 	u16 frame_id = atomic_read(&net->frame_id);
 	struct thunderbolt_ip_frame_header *hdr;
+	bool unmap = false, index_used = false;
 	unsigned int len = skb_headlen(skb);
 	unsigned int data_len = skb->len;
 	unsigned int nframes, i;
 	unsigned int frag = 0;
 	void *src = skb->data;
 	u32 frame_index = 0;
-	bool unmap = false;
 	void *dest;
 
 	trace_tbnet_tx_skb(skb);
@@ -1235,6 +1235,7 @@ static netdev_tx_t tbnet_start_xmit(struct sk_buff *skb,
 				src = tbnet_kmap_frag(skb, frag++, &len);
 				unmap = true;
 			} else if (unlikely(size_left > 0)) {
+				index_used = true;
 				goto err_drop;
 			}
 		} while (size_left > 0);
@@ -1271,6 +1272,7 @@ static netdev_tx_t tbnet_start_xmit(struct sk_buff *skb,
 			src = tbnet_kmap_frag(skb, frag++, &len);
 			unmap = true;
 		} else if (unlikely(data_len > 0)) {
+			index_used = true;
 			goto err_drop;
 		}
 	}
@@ -1280,8 +1282,10 @@ static netdev_tx_t tbnet_start_xmit(struct sk_buff *skb,
 	if (unmap)
 		kunmap_local(src);
 
-	if (!tbnet_xmit_csum_and_map(net, skb, frames, frame_index + 1))
+	if (!tbnet_xmit_csum_and_map(net, skb, frames, frame_index + 1)) {
+		index_used = true;
 		goto err_drop;
+	}
 
 	for (i = 0; i < frame_index + 1; i++)
 		tb_ring_tx_more(net->tx_ring.ring, &frames[i]->frame);
@@ -1301,6 +1305,9 @@ static netdev_tx_t tbnet_start_xmit(struct sk_buff *skb,
 err_drop:
 	/* We can re-use the buffers */
 	net->tx_ring.cons -= frame_index;
+	/* Return back the current slot as well */
+	if (index_used)
+		net->tx_ring.cons--;
 
 	dev_kfree_skb_any(skb);
 	net->stats.tx_errors++;
-- 
2.50.1

