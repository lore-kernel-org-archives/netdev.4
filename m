Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146758;
	b=TMW6C6RNMW2CPhPzCU42hIWEwmxRUXgEuGRnV5E9rBFPgy3W7v10bLarksrArDK6aYSz
	 CxDXUPWqV8VGriGqLzg3DnUunJwp4PqldHcM52QN/dNX4JnhoOE9/njxu6MooVBUJn6Ku
	 29Kgm1Px8pHOoH6/REby9N/w31sdFwM2RRJocak03PzrH38QDcB4jTKUJJLos3X9j5JeO
	 +XbodyCs7LBKRvbTRt0IFwmhXxzNoYMdoM2Kn3nDKq7VnOIAkFBMLnoxEYnT16IrAX5cP
	 DhkbEIbimFcLmSRRZFFEyPfLP1fP4V9j5yRmtNtfugZHNDeYBHvQnddlw/o5re9Lo9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146758;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=klgUdxa1dZUtPqjmCxuiv0T9jZ4+oOgpT2KpFZ9XMUI=;
	b=MW4jaJdrpWW3/Xc+o9n1Ru0QiDxeANB7voKxWOklehjn9Qkj530bBNACCgSIZmB9Vx72
	 mQq5E9hQTgExpcPFiN1Zw9N53f1GTUZGUMCMhFM+qa674hxd8H4W+AD59g2x+T4z4KObI
	 zjht8r5kL6NiypaxyWIvaWGoYhe5Hxh/yZ7wkhyJWBUZOdHuf2Czki5/MbnWST8CfFl8f
	 oslC1ujC6tojiKMUQe2SmKKM8+BAYx/8jUn4BKGpnMg0hqNVGO2a1PM17vj/ISS9X9g/e
	 1xGru2lBfbd+ruxEvkPqoFjpPYwoQJhXjWBNO+hi63WSLf7VOlO0s80mWkbrVaRxNVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBNAbd8Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986CB606A32C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBNAbd8Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75F71F000D2;
	Fri, 20 Nov 2026 03:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146758;
	bh=klgUdxa1dZUtPqjmCxuiv0T9jZ4+oOgpT2KpFZ9XMUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iBNAbd8ZTWL2qo8Ik7r+3ung/iivorLTDgKm2YRrWRKCP/d4P+B9EahUanba0ERdl
	 yvsUX6xGh8jGKOMKtxo4tfJRywQVMux4CVs6T4K8XGftYb1XW8hEn8ufGcuV8Eh445
	 XvZ5wbtyC8L1LFDN6Z7XE3flJTBJ089+s6UplM+rtbuk9ofmTw8MfBNaPo3FA5KWKi
	 uTf3uxtK7nv9cx/z5NqA6E9WTvOpD/R/T4c2PtYUrnsd7BwVSHShl1EhzLcAT6hrsJ
	 c6HXOIbbxKCZjSY+oXdfz+/dEI+QtwdCwm+mVyWh+z7FR6sSov75tg95/AUe3uyi/c
	 xC5aAOm+JUqRg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	bjorn@kernel.org,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 4/7] eth: bnxt_en: explicitly keep device-only memory on the device's node
Date: Thu, 19 Nov 2026 19:52:11 -0800
Message-ID: <20261120035214.369158-5-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035214.369158-1-kuba@kernel.org>
References: <20261120035214.369158-1-kuba@kernel.org>
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

Context memory (and the FW crash dump buffer which reuses the same
helpers) is used by the device, once set up the host only touches it
on the slow path (diagnostics, FW trace). Pass the device's node to
bnxt_alloc_ring() rather than NUMA_NO_NODE to make it clear that this
memory is not meant to follow any queue.

Ring page tables are only read by the device, annotate their
allocation so that they stay put once the ring pages start following
the queue.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261118023905.3050661-5-kuba@kernel.org
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 7acf74822e64..265ee15b6b35 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3784,6 +3784,7 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
 
 		if (rmem->flags & BNXT_RMEM_USE_FULL_PAGE_FLAG)
 			pg_tbl_size = rmem->page_size;
+		/* Only read by the device, keep it on the device's node */
 		rmem->pg_tbl = dma_alloc_coherent(&pdev->dev, pg_tbl_size,
 						  &rmem->pg_tbl_map,
 						  GFP_KERNEL);
@@ -9259,7 +9260,8 @@ static int bnxt_alloc_ctx_mem_blk(struct bnxt *bp,
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

