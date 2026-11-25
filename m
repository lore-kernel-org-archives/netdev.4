Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624163;
	b=nZJkBFVYCaamRGXZ3uapF1JfZZV70Cm9en3CHm5uCfb31JBF/4TSO+ZzH7JWFOFVtwre
	 qhjq/7TpEXSzpSYfvptNRX01XSGsETUlhRk4aqiBK4UPTOXBqgdD8aO9UeKJW8ezvjAxZ
	 FSMHsT+cLtzKRcxf7iwIeHQJh8BQxIQmmq5x/Pn+nkSum2Vce6eaGo1wYt/dQqfprVdJp
	 i/QS8DD/IJsSHYDgjBSGfXYkDgbTE6qsOjGSMZNXoUJ+RGnePz994EBPzVK4huQqww6FD
	 z4oJYec9lrrcEWF4I30UpO2fQxNIYe4oIT7zAmWytHnbBITZyp/d7itOf348zQoo5ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624163;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Lkp6Azul42/Qx5LvFrYX7YMq/SsTvpiCcoXT3G1GX10=;
	b=n3wcwbjZLNZc01UB8g5UQ+lFJcSV/7OPN/22cycokBD4Vj+vZcPNzaL/r7xzB5XzfTep
	 U/cGzMJlvTO0TgpJJH5OwqhSOlryxu6AMO4FbgLrJ6XB/fKEEKTAaqojhzrqT6ig3YcD2
	 AMY8jbLWP2+m517r4OLmCvUrgKQznLvu28rYQHwVg7OnCUu1WXet2fsuTuIDSrww4lpCE
	 /q59J5c3Fw6PVhxct74i3zey9NBBAOxlrjBEgCLw9WWOnxdHHi0t9+EtPKWWH/yLOPQZI
	 8GWdrfzDN+dQA0VCAOLUOjPCvnVWyV2H54p2guCa25ZKsWRA7P53/X0JB8lKKuP1xSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BZMzD2Yp;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B00606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BZMzD2Yp
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VyGOtslszgsRnKTR4vtr4CoVEFgd4e6GbjEtnd9ROV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795624160; v=1; x=1796228960;
 b=BZMzD2YpVQ9qJxwns6t3l9giZALVV9AbThvigW9HuR1jMYto+0ORMkcxrY5BvvW27Nm4KqSi
 4d6U3tfT/8RWFofCKnScBM3t1Wtjj6zHTLvDNj+doLJ9OPei9/ibx/ZyMfyutFKYwaBf06dNZ+Y
 seZXwVG6XWMxzINcMQlhEb+Q=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 71dbf25c8ce700f0;
	Wed, 25 Nov 2026 16:29:20 +0000
X-Mizu-Trace-ID: 71dbf25c8ce700f0
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	kuba@kernel.org,
	asml.silence@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] eth: bnxt: fix the agg page pool ring size on 64K-page kernels
Date: Wed, 25 Nov 2026 08:29:16 -0800
Message-ID: <20261125162916.1743123-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
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

Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
pool recycling rings") sized the recycle ring of the agg page pool in
pages, dividing the agg ring size by PAGE_SIZE / BNXT_RX_PAGE_SIZE.
Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
with larger buffers") replaced PAGE_SIZE in that divisor with
rx_page_size.

On 64K-page kernels rx_page_size can only be 32K, so the divisor is now
always 1. Each 64K page still holds two agg buffers and the page pool
recycles whole pages, so the recycle ring can cache twice as many pages
as the agg ring uses. With 1024 RX descriptors, the agg ring posts 2048
buffers in 1024 pages while the recycle ring holds up to 2048 pages, or
128 MiB per RX queue.

Divide by the larger of PAGE_SIZE and rx_page_size to restore the
original size. x86 with 4K base PAGE_SIZE and arm64 with 4K and 16K
PAGE_SIZE are unaffected, as rx_page_size is never smaller than PAGE_SIZE
there.

The ring only fills up when the stack releases agg pages faster than
the driver reuses them. On a 64K arm64 host with a BCM57508 (32 queues,
1024 RX descriptors), a TCP receiver that drained its sockets every
1.5 s left about 1.8 GiB less memory cached after the fix, 64 MiB per
busy queue.

Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues with larger buffers")
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 52606db3f7b4a8..ecc4848499c307 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
 				   struct bnxt_rx_ring_info *rxr,
 				   int numa_node)
 {
-	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
+	unsigned int agg_size_fac = max(PAGE_SIZE, rxr->rx_page_size) /
+				    BNXT_RX_PAGE_SIZE;
 	const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
 	struct page_pool_params pp = { 0 };
 	struct page_pool *pool;
-- 
2.53.1-Meta

