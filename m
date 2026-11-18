Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969551;
	b=Yhi6cEFI/Y8Sdg5GR1y1sHMprnQl+nsaG8JkMcWYS6XuDHlYcn8rpVGZK0FzGvhKHyBE
	 5986rQaP31bxoRUX/YTNXse7ent+weZOGAfpuC5TxSv/UUdAh9n3AdVSSeDKvfHrUQELd
	 lPipJ+GlbHG9WPrj3wSKGKVKR/ACe3Vh70IFY+454j3JXX6m1n8Yr3+k1r54YNJOD3rLj
	 lxcvmtLojR/XJUeXdVpSrWRRA5rfuHQVsi17hUgj3QKh4DoAnbfOJ6T+p62Y00/ZdB59x
	 /Myt9UihQHkj2y9zJTDuLucGjBD2LKUfvzMLi7GO0AodZH+M7J1MP0hdVQZnl9QkHQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969551;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UIn+rG+wXz4iJGKvFfRN4ooi3FNaqyWHbhZ7iMfQfMs=;
	b=M6HiPWJlhwswNya3zkMTp4jjt679Y2rNIUUosGA7SK8Qoz04lJ7xEWyKoGbjq5ZU4c0k
	 lPbwjXQhwtMtVhwg5n3wvBmA2yIT8elbnUnzzXaEsKiIAObo5NRi0YXHDcecDxNjFCCB8
	 8jagyjLn7DytC1XAFDJxhFPMy0lcINwW5GbAAJCXuhIILrg7osryjrpmFrL/H+ZP4airl
	 uKDrENqcWgD5W3cogdrAVy7/4mO7WKoV+lUAFNcxObCGOORdkbJqnoxXY+qzGTP3BOwKu
	 7RfXrUEElNxYcAfoeS52D5RuE5vvKnui7t34BUNDdGZT0COqT+0dWSX7jQcx4hTQEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+3Es8gi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639FF606A885
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+3Es8gi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0476A1F000CA;
	Wed, 18 Nov 2026 02:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969551;
	bh=UIn+rG+wXz4iJGKvFfRN4ooi3FNaqyWHbhZ7iMfQfMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E+3Es8gin6e1qbr5JR0pvxGGo710i/hOLemMvQ6rA5Vqt9Tax94XckYCV0QURCvn1
	 sWGcvKKWNcPr3FbFcvZjzbHN/HiCZZ+w+ILakdNC7WvnFPvMiXARRL0xOcAn4A88Ff
	 F61fvYewJPLFRauxJHFdrAp9PeS22XJJQIaNtXpGhtjNHDPdEJQ+8DVUWJTwj/khCz
	 uy2WJpq87bKBZYCz5H6arJ722W/Xgg3V6WIm4qP9KOuWgF+De4/ExDPIdHU22r3Ng0
	 lCpK2TXwohATUCvQpnWkgNHNCPggj5tDoaDWaM87s7rlsmD2n3IfYKAjs8Hc5zw1kF
	 xRWlRMlvAxU6A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 4/6] eth: bnxt_en: explicitly keep device-only memory on the device's node
Date: Tue, 17 Nov 2026 18:39:03 -0800
Message-ID: <20261118023905.3050661-5-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118023905.3050661-1-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
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

Context memory (and the FW crash dump buffer which reuses the same
helpers) is used by the device, once set up the host only touches it
on the slow path (diagnostics, FW trace). Pass the device's node to
bnxt_alloc_ring() rather than NUMA_NO_NODE to make it clear that this
memory is not meant to follow any queue.

Ring page tables are only read by the device, annotate their
allocation so that they stay put once the ring pages start following
the queue.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 7c694d8e99f5..f98507944350 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3779,6 +3779,7 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
 
 		if (rmem->flags & BNXT_RMEM_USE_FULL_PAGE_FLAG)
 			pg_tbl_size = rmem->page_size;
+		/* Only read by the device, keep it on the device's node */
 		rmem->pg_tbl = dma_alloc_coherent(&pdev->dev, pg_tbl_size,
 						  &rmem->pg_tbl_map,
 						  GFP_KERNEL);
@@ -9218,7 +9219,8 @@ static int bnxt_alloc_ctx_mem_blk(struct bnxt *bp,
 	rmem->flags = BNXT_RMEM_VALID_PTE_FLAG;
 	if (rmem->depth >= 1)
 		rmem->flags |= BNXT_RMEM_USE_FULL_PAGE_FLAG;
-	return bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
+	/* Host only uses it on the slow path, keep it on the device's node */
+	return bnxt_alloc_ring(bp, rmem, dev_to_node(&bp->pdev->dev));
 }
 
 static int bnxt_alloc_ctx_pg_tbls(struct bnxt *bp,
-- 
2.56.1

