Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645051;
	b=Etd+rFIt9jRYvO3bJTMQkffcAseoQanLJ+0NeACrR6zZbH1Xg9tp/vfVssIXkZk3+YW2
	 ZfUJg93v3z7gxupMaC9ualLUb0/kFdaXCpXFQ/pFXsoJMpwO5btP9Ze0JpbvoYInTXd3H
	 ZRJjMioo2gYph3w4sFF9R/iJveumH1YxhVzT7ptv8ZEfPXePWhRVjINuij+OSzLxZhIyG
	 um9UdWZYPZZeEKsy6TLY9nm8t4Jvup+wPdTYqnUQfLnpuMD8roQGcyx+c0t7fABt7Lt5r
	 G71G0Y08Az2KGOjqeJzTMQ4hZcNArg5B5ndqip/RTVn9aGZej4Pgaz/2zCID0pO9klw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
	b=nPj42/oJRf5TVsVrB6djiCq3IqKIVBi9bnabMYFMQrvaKz+T5hH9SLIplivUjhUtw0q6
	 XPPVMm4wYs0bxfetJizZIm/nlE3nSneAx9quKftikDWBf9hIbn/nJ5HOjlB2qi/IChdQp
	 fLAFZ0IrAVqA8h/n+33YeR6mKfK30KKVI/IgDjUmDZWAeFgk8umi56lI7wz8yUaPhFGJc
	 1RrYwL6z4VtWy3Agg86wGTt6S2lV0g41pm4BvmEDUs7cVRTMm89shqtLapyV7icZlK29A
	 vQkZM57bSL1cgqag05mL5Y43lPWGeGABeA7GcQ7BkJR1gUgCjCyEa462BKTPNfnBrPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pUID44TT;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D23606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pUID44TT
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so481627eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645050; x=1796249850; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
        b=pUID44TTQ4/Fzfi/L0/1db/SVlq9R5gZ4HJCykAH2o+oN7qZAuRZ+iCImjKkUfLOdi
         j7aP6gH68gmsMNHyX1KtYdbwSJ9iZAEwKsX/gjdJKMCAsEz7JGWRgV2CgVSN2hns/6jA
         4Hd0quAzuHaBHazRpgxkx8Pz6R9QN1ZEXTsfFeMuhUoog+EOBsEGFbmhi1Mcd0tpELaY
         I6fsAAA/6m3EzowDm+8GzlLrYAYAA9FZ7JTsPkXWIJc5cgZNOOeoPdWHQYfXV5pM1n0G
         oP+AtkIU1G8RVRGeA5IvDOZsptI0naQ27ylBhMDkz450nBXuJ6GXKNT7I07htljxJnwJ
         BEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645050; x=1796249850;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
        b=CfUMz4IqpuE3rovyje6+gNYSyf8GCsLGqsBbx7f0UFgCURZdlotiyuwPCMhCvcEB5a
         XUTc8EEjLewlzwgLAJSGCuKG+l71ofn1Jn6B4LUsYULoOKsUPaZO82q69lf43n+p6VMb
         4GjI+Frmyo9hYUsnfwInferT/OHCAusblfHDEvYGuR/ygffeRs0/h9XCHHMPI3zIXaeX
         QdMpE8QYhrt4Itdrux0HDE9J/KXwvEuERFznvsVmnbR171wSZwZ5S7IfeUlyVzaQFqLX
         WkOt1sSYBCRZknCjoX2HBVxYbsxQSt1mgVw/ZmYj67xb9ncB3TN2dYLpbQxxdzszMN02
         XXsg==
X-Forwarded-Encrypted: i=1; AL+hErGLeYFgN/s/d1HWhwI4QYFtp7eXrpfTwP84gpv2dXlGPvmA/Xn+D+VfQM8X1YGob8p6x9JTK9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dwBTs3WxlNcSYb+SvozEw/vTNLoLJJ48Rri0/MhypDB0w24OW
	EvW778S2pvgJTRvzrxd9L8B7VmXtyw1Fry2ehxxNfyzB5NAeN4638SScusbjCZup6I1GD1xqYsC
	8bQ==
X-Received: from dybph20.prod.google.com ([2002:a05:7301:4194:b0:385:8165:80dc])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8604:b0:386:b3e6:e741
 with SMTP id 5a478bee46e88-386b3e6e883mr8734453eec.26.1795645049680; Wed, 25
 Nov 2026 14:17:29 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:58 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221658.1420387-1-elkin@google.com>
Subject: [PATCH net] nfp: fix use-after-free in nfp_ccm_mbox_skb_return()
From: Elkin Cruz <elkin@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	irogers@google.com, Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

nfp_ccm_mbox_skb_return() casts skb->cb to struct nfp_ccm_mbox_cmsg_cb,
frees skb via dev_kfree_skb_any() when cb->err is non-zero, and then
reads cb->err from the freed skb to return it.

Read cb->err into a local variable before freeing skb.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: d3e4dfe060cc ("nfp: add support for sending control messages via mailbox")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/ethernet/netronome/nfp/ccm_mbox.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/ccm_mbox.c b/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
index aa8aba4ff7aa..c0f1d84208a4 100644
--- a/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
+++ b/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
@@ -420,10 +420,11 @@ static void nfp_ccm_mbox_run_queue_unlock(struct nfp_net *nn)
 static int nfp_ccm_mbox_skb_return(struct sk_buff *skb)
 {
 	struct nfp_ccm_mbox_cmsg_cb *cb = (void *)skb->cb;
+	int err = cb->err;
 
-	if (cb->err)
+	if (err)
 		dev_kfree_skb_any(skb);
-	return cb->err;
+	return err;
 }
 
 /* If wait timed out but the command is already in progress we have
-- 
2.56.1.839.g22a8290db9-goog

