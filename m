Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567353;
	b=r/aBuVoNnXREGBmt8Ra271GnA0NfzfSbeq7kU0mPykR2Y5XZ0GmTh5YeTkbivD+H6NSj
	 HWTgj8Qe+HL9Fb8tqoUcBvDs3vao10qA/EeZGq/W/ol+eG10NwVMGtlTacckfebder+ix
	 cK3VcPhrneeAsDHq5+C2oKRhufc/F/ctjrctGNdSqyWtzvcXcIx9Lk8FvoOPJDcl1gKfH
	 HSksJguJxjafOUnS+clKHgLXJqhu0l9dHBz4Ax6expfXQ10e7EPZ8u5/8+AIIpTmThaOn
	 7MVYD/o2TV/uGCCK7o4aJB+ZShKhLsRtNFRLHOlYIKtQ5Hj20k9qrD8ZYL9MAIAzDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
	b=srd8RjHPcymswN+jCTmeh2Lj6fvk/1oXUcMsxdV5jFc6HEnWgMmhxzRwH/ZYb2HQnHV1
	 l+5eiR3nkhjqYlDvSIpcxRTB/ElCC/i2s3o80RuOoPxCWP54ni5q6GyhJVv/6fmMK7vLn
	 ejcFdk+PqIfn7CY0dB9hMrPUdUPH6pdOBtAlbJ+BJAG6keXZ1jCFPSYUjrMqKNkCGBTXc
	 C6XjvfafKll9Vc1RQP2eg8rcFLLJqOJLMf/qqS42rpJ5RXgzRhuInUEiGY1GnYjJgqSYZ
	 +3PQsVkpeMmKmTuCfsDVJiQMoeO2FUZoaHkHbfV3kXJk49cwiUeU48DLD+Uxf9Xqxqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZhBli5Tj;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F1606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50F1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZhBli5Tj
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4ab90cdf747so7572340fac.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567351; x=1796172151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
        b=ZhBli5TjY2J+F0YrJqcH6hbtDZWz2lZbT7kXe+hRHbXAxzA77OQsySqWNxMDyH7aVo
         BVHHUnFDqtwYh298gAbeUdWH10gj8/I1XiITqVvSkgFZCzEpNqCqZxZiMb48UFQWUHy2
         CrxvHzI5b3kWR5F2X2uq5/w666nksHtx5kd9p/xqNfIRyqe496HkxbTPyUFQF77k6Tge
         X5Lh8IyfmfPxwqMwyMfcm0T9ZxMDI2h61OUe5uQxzSBiCGlMBNgvv069U89nGAwTwgX/
         OmowIVBcdBnLciXvV6GQvqxZ7d7mLCf876OWll4G2jZMgctuUCy8uvXrrCJAbmZHi56p
         TJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567351; x=1796172151;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
        b=ZVkhejYbCtwCks39rqSGN1ONmcWHaveEfoBtefynfASMxxwRsIaXADH7Sdkxes8BGb
         2Cv/J6d0fJEUu/CgRNtrQS1wjGB3Nf1lEGJgsrp0JQ7ICbzllL6NUANAfuCyfHBS/sts
         8YHbqVeLia6sn1BaTPkJfKwYOlioaV8u84+2kPy1ZGGFBAscK2/1nMrxaOOr//GrDysZ
         GgYRepdog9XJuvuw9Hkn68NvCEqqHSrvin/bQU7bMz7i/bgO16QIRutyiMGp1VDABTSE
         9HzMtfPlcHjNlwX2CwLuxGw9Qf2PowsPHAK/zEUqFZdx3ybQR72VmuVf5c1Jn16V028c
         28WQ==
X-Gm-Message-State: APuU4Z+EZ0PKDqYzhQYWmuTj20b+BsfGpNPWgj/2K86l+SKQlbqF5k5L
	s5vOtA05zlDQ74GKd5XJs1TlKH3IVVP4OAzBg/qCpyvZfla+soaPR/0ctkyFrjdYm7la9MQsVEM
	gZtHwmHdGQA==
X-Received: from oihi10-n1.prod.google.com ([2002:a05:6808:e8ca:10b0:4e8:f869:7c03])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f0f:b0:4f5:dc0d:e013
 with SMTP id 5614622812f47-579789cf52cmr15894415b6e.4.1795567351259; Tue, 24
 Nov 2026 16:42:31 -0800 (PST)
Date: Tue, 24 Nov 2026 16:42:27 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004227.1007723-1-irogers@google.com>
Subject: [PATCH net v2] octeontx2-af: Fix uninitialized variables in MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(), switch (req->rule_type)
has no default case; an unrecognized rule_type in a PF/VF mailbox
request leaves 'offset' uninitialized when passed to
mcs_alloc_ctrlpktrule(), allocating rules from the wrong hardware
partition or failing spuriously.

In rvu_mbox_handler_mcs_alloc_resources(), 'rsrc_id' is left
uninitialized when !req->all and either req->rsrc_cnt == 0 or
req->rsrc_type is not one of the four handled types, evaluating
uninitialized stack memory at 'exit:'.

Return -EINVAL for unrecognized rule_type, unrecognized rsrc_type, and
zero rsrc_cnt when !req->all, and zero-initialize rsrc_id so Clang's
value-insensitive -Wconditional-uninitialized check sees no
uninitialized path across the rsrc_cnt loop.

Discovered via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build with AI coding assistant help. Verified by building
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on
Marvell CN10K hardware.

Fixes: cfc14181d497 ("octeontx2-af: cn10k: mcs: Manage the MCS block hardware resources")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Unlock rvu->rsrc_lock and return -EINVAL directly on unrecognized
        req->rsrc_type instead of jumping to 'exit:' (which returns 0 over the
        mailbox), and do the same in rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule()
        (Sashiko AI review).
      - Drop the rsp->flow_ids/secy_ids/sc_ids ARRAY_SIZE() checks since
        rvu_alloc_rsrc() already bounds IDs to rsrc->max <= 128 and rejecting
        upfront altered partial-allocation behavior (Sashiko AI review).
    
    v1: https://lore.kernel.org/r/20261119170550.1517634-1-irogers@google.com

 .../net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
index cd9cca5a9cf5..92c987134436 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
@@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 {
 	u16 pcifunc = req->hdr.pcifunc;
 	struct mcs_rsrc_map *map;
+	int rsrc_id = 0, i;
 	struct mcs *mcs;
-	int rsrc_id, i;
 
 	if (req->mcs_id >= rvu->mcs_blk_cnt)
 		return MCS_AF_ERR_INVALID_MCSID;
 
+	if (!req->all && !req->rsrc_cnt)
+		return -EINVAL;
+
 	mcs = mcs_get_pdata(req->mcs_id);
 
 	if (req->dir == MCS_RX)
@@ -744,6 +747,9 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 			rsp->rsrc_cnt++;
 		}
 		break;
+	default:
+		mutex_unlock(&rvu->rsrc_lock);
+		return -EINVAL;
 	}
 
 	rsp->rsrc_type = req->rsrc_type;
@@ -793,6 +799,9 @@ int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
 	case MCS_CTRL_PKT_RULE_TYPE_MAC:
 		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
 		break;
+	default:
+		mutex_unlock(&rvu->rsrc_lock);
+		return -EINVAL;
 	}
 
 	rsrc_id = mcs_alloc_ctrlpktrule(&map->ctrlpktrule, map->ctrlpktrule2pf_map, offset,
-- 
2.56.1.831.g720f3f5937-goog

