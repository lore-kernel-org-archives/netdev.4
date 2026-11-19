Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107956;
	b=zdo6gmYS3q6es0+CWlESXYTAll/8+ovZWP+ZiyoYX4vJD1xFyeNVCCnVqjDWlq9H4A1Q
	 gPmVSTdn7fbso7mxZ9hcpDUTLtU7kAf5bjWuikq1GVfTZMne4SCy1SKKu/y0GlNEA2Pkf
	 aTW3BKQlzKgsUpUii8kVsURHF7w8J7N9N+44u9Bzz3r2DL2XPjDkW6Qeotac1bL2BoMmw
	 vofacoxncgZxQak15JZa93BpBnECmoENWO+O5MDZJsmc/pnmbN7Vp8bF+gWsNAHNaNUXG
	 gRJYwF6bd/chYpBjgnztcMexqiwNrQ3v+M9JVMRhkCG4LA0JIJ4cIUs7X8meOJDfGdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=y4oeUJ9srrE5JKAw6tZtuVueeWimXIWToAHVhV7wu2E=;
	b=c+P/JipT8DhGiOeH04RTDEyospDe7v5MCxAh4KrmbdMjALph3Sq+hxmmoPSa5nUCQWf+
	 fucG2EgkkYnIhiAWUKMBoQCJqwlZ6LVKAv2j4pfSJ5BQ/L1vpnBoiSVEN36+Whvu6vjgX
	 hBwb5DJsWakR70cqoGVrbZ7oaQtUa2y5qaPnHq3orXPIbpbU3yjwLAiO7M4AwJ5hwkvEq
	 D4X6ZFGUXKfKZubhiGgP20eR8Pd0ix6q9ijEbrnLlASHAkWrOX+6+saTyATTJOBuJPUB4
	 o9DpvQ0DZ/dB5qfQaKXZ1kF2e/ncF8AGSWsflQ6kCVwLdgpZ24B7YRuQox+pyLpJRdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CDzUfvvN;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0E606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C0E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CDzUfvvN
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85a6d046af0so2676841a34.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107954; x=1795712754; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4oeUJ9srrE5JKAw6tZtuVueeWimXIWToAHVhV7wu2E=;
        b=CDzUfvvNG4F7g5PV6b96thWKB2WqFdAFwcGHtxP9lCuUnTGkW/3UjU8YQlhy5Dln5l
         wc/IVMWnElcxl4wFNMXpn1d3luTQOXC4/2vimDvu9/1KCETktasjTsNEIimTjtRPNqSN
         h5kgHMx6GXNuLTr9kVszjOdAuABRdp56oTpytIliB05BVphnINVwOkKC84HV7bEYg9wS
         ej72+4vOSh1zdkZ5vxUltpFxCjUCSZKG53WjoVe5ybSYKe6TwIjATmwfof0WJfIeUGKL
         xNzQdIKNiyC25c6MvwqvKUlrQOk4K18lE4Qyq8auddoEa6nirRfzH1n2fMiAGE8DybUw
         26bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107954; x=1795712754;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4oeUJ9srrE5JKAw6tZtuVueeWimXIWToAHVhV7wu2E=;
        b=Lw8MeXvfrQBsKseS8+12aAeSLt9c/TWwdzSugDIqqn7xwLpKuPeKcNmgrHDgZJp+Cc
         Lr3d2ImRkksbAjtZGc6aUhEL+G6s5jLCZwzRjEEPYvy5wyum3CxNqHM4EJMoobhPRTJ0
         snTOCE3qncLhjmkgfA7YEC3NFh/0UyDq3flsoVoca5HR1FMviK/qzzKBvEUC7gkyv+LC
         y4KsCSkxa4zk6O+Ox/ro291/2VYjXLaWd1/c/LaJ/blVXFq3oe6rVCgwp+Bo/CfISuRo
         CXgXsCCSlDYLrj792IxKSYnublT8mO3z2N+AEERJuZ2WTqr0hCP9tD5p58Y9ufy3zliX
         YHIg==
X-Gm-Message-State: APuU4Z8nPsXhS2YFCcnEUhQJ5I71TpN9H/yKimTbWTYSgNk/5zIhb/g/
	4JQ70tsnAqnMdc4i+Z1CKZ8unfRntk8J88dN35yKVxy3/OHLE2WISEQ5kznLgV/g/u91i8MJaQ1
	NkGC/RTxxIA==
X-Received: from iodz8.prod.google.com ([2002:a05:6602:6f48:b0:9c7:a5de:745e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:50a3:b0:55c:888:2a15
 with SMTP id 5614622812f47-57a0c9c219amr482948b6e.53.1795107953923; Thu, 19
 Nov 2026 09:05:53 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:50 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170550.1517634-1-irogers@google.com>
Subject: [PATCH net] octeontx2-af: Fix uninitialized variables and bounds in
 MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(), switch (req->rule_type) has
no default case; an unrecognized rule_type in a PF/VF mailbox request
leaves 'offset' uninitialized when passed to mcs_alloc_ctrlpktrule(),
allocating rules from the wrong hardware partition or failing spuriously.

In rvu_mbox_handler_mcs_alloc_resources(), 'rsrc_id' is left uninitialized
when !req->all and either req->rsrc_cnt == 0 or req->rsrc_type is not one
of the four handled types. Moreover, req->rsrc_cnt (u8, 0..255) is not
checked against the 128-element rsp->flow_ids, rsp->secy_ids, and
rsp->sc_ids response arrays before writing into them.

Reject invalid rule_type, unrecognized rsrc_type, zero rsrc_cnt when
!req->all, and rsrc_cnt values exceeding the corresponding response array
bounds.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not tested on Marvell CN10K hardware.

Fixes: cfc14181d497 ("octeontx2-af: cn10k: mcs: Manage the MCS block hardware resources")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../ethernet/marvell/octeontx2/af/mcs_rvu_if.c   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
index cd9cca5a9cf5..54c1d9809ae6 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
@@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 {
 	u16 pcifunc = req->hdr.pcifunc;
 	struct mcs_rsrc_map *map;
+	int rsrc_id = -EINVAL, i;
 	struct mcs *mcs;
-	int rsrc_id, i;
 
 	if (req->mcs_id >= rvu->mcs_blk_cnt)
 		return MCS_AF_ERR_INVALID_MCSID;
 
+	if (!req->all && !req->rsrc_cnt)
+		return -EINVAL;
+
 	mcs = mcs_get_pdata(req->mcs_id);
 
 	if (req->dir == MCS_RX)
@@ -709,6 +712,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 
 	switch (req->rsrc_type) {
 	case MCS_RSRC_TYPE_FLOWID:
+		if (req->rsrc_cnt > ARRAY_SIZE(rsp->flow_ids))
+			goto exit;
 		for (i = 0; i < req->rsrc_cnt; i++) {
 			rsrc_id = mcs_alloc_rsrc(&map->flow_ids, map->flowid2pf_map, pcifunc);
 			if (rsrc_id < 0)
@@ -718,6 +723,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 		}
 		break;
 	case MCS_RSRC_TYPE_SECY:
+		if (req->rsrc_cnt > ARRAY_SIZE(rsp->secy_ids))
+			goto exit;
 		for (i = 0; i < req->rsrc_cnt; i++) {
 			rsrc_id = mcs_alloc_rsrc(&map->secy, map->secy2pf_map, pcifunc);
 			if (rsrc_id < 0)
@@ -727,6 +734,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 		}
 		break;
 	case MCS_RSRC_TYPE_SC:
+		if (req->rsrc_cnt > ARRAY_SIZE(rsp->sc_ids))
+			goto exit;
 		for (i = 0; i < req->rsrc_cnt; i++) {
 			rsrc_id = mcs_alloc_rsrc(&map->sc, map->sc2pf_map, pcifunc);
 			if (rsrc_id < 0)
@@ -744,6 +753,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 			rsp->rsrc_cnt++;
 		}
 		break;
+	default:
+		goto exit;
 	}
 
 	rsp->rsrc_type = req->rsrc_type;
@@ -793,6 +804,9 @@ int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
 	case MCS_CTRL_PKT_RULE_TYPE_MAC:
 		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
 		break;
+	default:
+		rsrc_id = -EINVAL;
+		goto exit;
 	}
 
 	rsrc_id = mcs_alloc_ctrlpktrule(&map->ctrlpktrule, map->ctrlpktrule2pf_map, offset,
-- 
2.56.1.708.g77570a6a1d-goog

