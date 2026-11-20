Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202675;
	b=U8GHGL51urtObZGnDYzSxKhdu3LnTayitufh4m165M4fg+5v6AhZu2BsIOIYYRkefSlQ
	 mYk3hJYaCVaAeqhx6QoAi0zV4GDCnoVACLOCH6dIcmj/1FvEBQTfmgUHPJori+yVVo1DT
	 RLlJq8M7RMV7vL3fHbwM8wmu6KjcFo0sUCkgWrW+w1rOuX2Fvqdz34szmXfhx9iIv5b2V
	 O8OAwBPUej33SPsIjfVgE2EMe4NB1PDbW4+9ootL0FdmA81eNS3z6L3avXcaTyLOEng2Z
	 jPdbNu0Js7GSFTUrIAvB2Uk0dSzHBwtDOMdf4/Lav6Q2yljN2XNJ8rzStsuYPeWYGEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
	b=nIjGSmhsuk0Fu71dgRTlIf2xCYIRAIwrwJxUX2KalSZNo11fleFusaBjF3qJ7JsuO27G
	 j9ML4Kxgxh61QirRjbjxE1hTjc+oWXROT/7o32QZbTdasoh29bC2zTsSTMS0blEHXK3mX
	 Djf/vj0jndMHWowpj83f3ddKFWV9irAf6E4egdRPSXTcx9BAO9XNe2+rnu6ZhXBXmWCQ+
	 A+DUuCGLGhyeDpMTomxVSTczSYJzdb+yUfDPlb3JwnyT6ahyxtlP2punM0MZL/8PkmkXL
	 6zsfK04Np5UvUA0a8pRZ+SO8kE+DhiaqSRYq1G8xsC23rmIiG+kL6ciQiVCZYXaqePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PDBNTWwZ;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA33606A6C8
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA33606A6C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PDBNTWwZ
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so1492485c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202672; x=1795807472; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
        b=PDBNTWwZS5JtfNawNEoOiI/KzAOqhdvlRlmENnE05s4srY+SbAoTkewCgRwywohze+
         dbnYZrNi5wC6JsbMEHuOzUtesXBiJZzAJRZcEzRKvlpWBfT1jSqVzJduT8KLM1N6qDie
         XMI5AtYsAWqiTm0unRSPlfnDx7kuC/bSeAFrT601T8N+IJTwQ1Gq1+bO4ZzaQUPsugAG
         a7Hqw5adfazjupZtEzdz10o9g6FkkWtFZa1JC5E2MieBxppE2ZHz3mT4Czr+X8E01Ls9
         tdmiHwceNHpZYKShUkzq1lTeL8j1f6+3tGj6NVUm8RzMS+ZHaE2Y0myOtCwzkRawM/kA
         hNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202672; x=1795807472;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
        b=kQjOR6Kok9fbEZwQcrblcgKGzVZLhDmSrn9mJfPwhWWg9egFzl3R6MdodDmN3CyXtO
         spLKcgsgH00QYfrRHWdYAfw+mdj30fweBa/tMGx+GHYqwbfNSYJWjIrYKU0UbuH5eKfi
         nGz1EN1cLtxVRd7O5edbdH/zSWEKxWmm0hpYwJaEmVW86ecnUvXHLec2oEpFqilhGF4n
         lvukIHe/PFOhkhNgnJqtHdj0YqNg1F7UdnDKYnCKbFY1dpzlHLDBeYFAusoGR1kzQIC5
         pcwKjeHDinjlJ9rVSFGfHQfL1TozHuAhmn4JmbOu84uBJnv5dqyxCQVrzjscgZFjYeh8
         YwZQ==
X-Gm-Message-State: APuU4Z+mV2lettbRl7X2Cjlf2WZqCz8tFkJorpwGVf3BVTzz7Uqif1Z1
	O4ZZHgt/fncfOTeLymLtJtA4miy59j1udz7xq+awyGyn29ahsUu1CubfjZ3pUSgq2blCEjqdUCu
	w5A==
X-Received: from dlep16-n2.prod.google.com ([2002:a05:701b:4590:20b0:163:a42e:b837])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0f:b0:1b5:1a7a:2ebc
 with SMTP id a92af1059eb24-1b556880d97mr3649433c88.16.1795202672080; Fri, 20
 Nov 2026 11:24:32 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:08 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192408.2872793-1-elkin@google.com>
Subject: [PATCH net] octeontx2-pf: handle cn20k_pfvf_mbox_alloc() failure in otx2_pfvf_mbox_init()
From: Elkin Cruz <elkin@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Ratheesh Kannoth <rkannoth@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

On CN20K, cn20k_pfvf_mbox_alloc() returns ERR_PTR(-ENOMEM) when
qmem_alloc() fails, but otx2_pfvf_mbox_init() assigns hwbase without
checking IS_ERR(hwbase). On allocation failure, the error pointer is
passed directly into otx2_mbox_init(), which writes reset headers to
hwbase + devid * MBOX_SIZE and crashes the kernel.

In addition, if otx2_mbox_init() fails on CN20K after
cn20k_pfvf_mbox_alloc() succeeded, free_iomem: skips
qmem_free(&pf->pdev->dev, pf->pfvf_mbox_addr), leaking the DMA mailbox
allocation, and if the second otx2_mbox_init(&mbox->mbox_up, ...) call
fails, &mbox->mbox is not destroyed.

Check IS_ERR(hwbase) and update error unwind in otx2_pfvf_mbox_init()
to properly clean up &mbox->mbox, free mailbox memory on CN20K, and
clear pf->mbox_pfvf_wq.

Fixes: 70f8986ecef1 ("octeontx2-pf: CN20K mbox implementation between PF-VF")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c  | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index cb602a4adcfb..e6722751de7b 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -618,6 +618,10 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 	 */
 	if (is_cn20k(pf->pdev)) {
 		hwbase = (void __iomem *)cn20k_pfvf_mbox_alloc(pf, numvfs);
+		if (IS_ERR(hwbase)) {
+			err = PTR_ERR(hwbase);
+			goto free_wq;
+		}
 	} else {
 		/* On CN10K platform, PF <-> VF mailbox region follows after
 		 * PF <-> AF mailbox region.
@@ -644,7 +648,7 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 	err = otx2_mbox_init(&mbox->mbox_up, hwbase, pf->pdev, pf->reg_base,
 			     MBOX_DIR_PFVF_UP, numvfs);
 	if (err)
-		goto free_iomem;
+		goto destroy_mbox;
 
 	for (vf = 0; vf < numvfs; vf++) {
 		mbox->pfvf = pf;
@@ -655,11 +659,18 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 
 	return 0;
 
+destroy_mbox:
+	otx2_mbox_destroy(&mbox->mbox);
 free_iomem:
-	if (hwbase && !(is_cn20k(pf->pdev)))
+	if (is_cn20k(pf->pdev)) {
+		qmem_free(&pf->pdev->dev, pf->pfvf_mbox_addr);
+		pf->pfvf_mbox_addr = NULL;
+	} else if (hwbase) {
 		iounmap(hwbase);
+	}
 free_wq:
 	destroy_workqueue(pf->mbox_pfvf_wq);
+	pf->mbox_pfvf_wq = NULL;
 	return err;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

