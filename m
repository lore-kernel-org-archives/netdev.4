Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717541;
	b=mIUceZdUwzL7a+hNJbgkCa9PLtxl2iV9kwXuVS/sR3EiFjE1UK4QQkAsuVXtlhI6y/jZ
	 OqNTPNYWZDsoYFk7SKtmCw9S7puzvKHSJoKPCI0A0Kdx5+CBSBuAJCoIQGX04RnfWTO6D
	 t9EK7HGIJzPYMmFkpaBCi1I16tVYADYaN0kuT5PQLm5vaZarliPwLcwrTZXesi3pl2V9w
	 IYHo53XyF1xbIf/UNdylDBhmM35dNMUWHutiAXz4Pti9ckBUPpkk9HFNB8KfrIoehqjGb
	 wdFOZRFokp4++Wg1i1nD1BEkBT4JF8swt6eehJUE6Yu435+pYX6CvBhzbWpFCZveO9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717541;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UeFA5jg30t+A1rcbBWr6GDC+UBF9KjVa4/rmIy181dc=;
	b=M7m/df0+wejHmpxZefIFnrC0BN3sMKK0N+RqYF0uQMXCE99FAqB5jQllE/3s/XJNQCm2
	 kPJch4xoFALFwGl8aVqKzvK/dw9DnwBAbcYODtQt7XhmI/+/TsE1k1AKJUWVS4as0ttn5
	 pWX+emoFUiC2GsN45M3Gn4Xt1oNUR1sGoBYYWKMi0oH4P3ucQZla4friUujFPlnXtA7hO
	 t0Jh4hDNck55IMDm1UhcTNXiLlgMgMJmKd2iB9l4XOxVEB1tWoLpaxDtXXAnFZPeN2Fnh
	 +3kQ7YLMYAlkFmPgX1yatSXE4RBW+S2xvrZlkiac1m6guA+0i6nJuq2IPfcaFIEvP/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e61z9SL6;
	arc=none smtp.remote-ip=91.218.175.10
Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351F606A336
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A351F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e61z9SL6
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q7ZaKiTOiYhoY/Fge3DfL98WwhodCUerFich7Oh91Ns=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795717538; v=1; x=1796322338;
 b=e61z9SL6iDhmK1gKqIBNquU9UypPOTYXxazMzkFNC/i7dgCegzJfOWcnoaMZx534f8pEcAEf
 e8RHBqNpWCp20JQGX+/7HXrNQSXxdy0pNMqRjTbEIEdNje/TFBUgYyyOGAr/NRVRa0FH7hsdIIP
 HBfuNi20LUK1SHdZbzcDULzo=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b6c47e4d7c624f43;
	Thu, 26 Nov 2026 18:25:38 +0000
X-Mizu-Trace-ID: b6c47e4d7c624f43
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
	bjorn@kernel.org,
	netdev@vger.kernel.org
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v2] eth: bnxt: fix the agg page pool recycle ring size
Date: Thu, 26 Nov 2026 10:25:20 -0800
Message-ID: <20261126182520.3301627-1-usama.arif@linux.dev>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit f7dbedba6312 ("eth: bnxt: take page size into account for page
pool recycling rings") sized the recycle ring of the agg page pool in
pages, dividing the agg ring size by the number of agg buffers per page.
Commit c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues
with larger buffers") changed the divisor to rx_page_size /
BNXT_RX_PAGE_SIZE, which is wrong in two cases:

- On 64K-page kernels rx_page_size can only be 32K, so the divisor is
  1, although each 64K page holds two agg buffers. With 1024 RX
  descriptors the agg ring posts 2048 buffers in 1024 pages, while the
  recycle ring can cache 2048 pages, or 128 MiB per RX queue.

- When a memory provider sets rx_page_size above PAGE_SIZE, each buffer
  is its own allocation and the fill level is already divided by
  rx_page_size / BNXT_RX_PAGE_SIZE. Dividing again gives a 4K kernel
  with 16K buffers a 256-entry ring for 1024 posted buffers.

Divide the fill level by the number of buffers per allocation,
max(PAGE_SIZE, rx_page_size) / rx_page_size. Nothing changes for
kernels with pages of 32K or less that use the default buffer size.

On a 64K arm64 host with a BCM57508 (32 queues, 1024 RX descriptors), a
TCP receiver that drained its sockets every 1.5 s left about 1.8 GiB
less memory in the agg page pools after the fix, 64 MiB per busy queue.
This NIC's firmware lacks the VNIC RE_FLUSH capability bnxt needs for
the queue API, so memory providers could not be bound. Instead, a
test-only patch forcing rx_page_size to 16K and 32K on one queue of a
4K kernel showed the ring going from 256 and 64 entries to 1024 and
512, matching the buffers posted.

Fixes: c55bf90a2112 ("eth: bnxt: adjust the fill level of agg queues with larger buffers")
Suggested-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Björn Töpel <bjorn@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 52606db3f7b4a8..85ce4b2e297ecb 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3948,7 +3948,8 @@ static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
 				   struct bnxt_rx_ring_info *rxr,
 				   int numa_node)
 {
-	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
+	unsigned int agg_size_fac = max(PAGE_SIZE, rxr->rx_page_size) /
+				    rxr->rx_page_size;
 	const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
 	struct page_pool_params pp = { 0 };
 	struct page_pool *pool;
-- 
2.53.1-Meta

