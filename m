Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786848;
	b=0l9j83bKQLPkmdV1BKpvrANyXHgwlM4oz1Hy5o18dC8ohuf5osC1esYsIIVIlzYd9CaW
	 HZVN+n2xml1gJjgtrACxuTEO2sYdH2bhZFko51Ni6bpD5fQosc7q5F2YU6ZlQEYLzok3S
	 fBhdBfyyO/XJ35/OQjDOLdTcSLUiEEu3c5Ia4xyuECMZ4gk+Pue21vIB8cTJ6MoG67W78
	 mErtUTaaKQ00pTZk5iQngliF00gHS069ZPBT1JxD8x+8VX23elHkVXDZaJAS/6G48iJFZ
	 7OMyzy3YuNAe2Qe2o/+v9+iSeZOG8p2zkJ1e+XoP4kNHD1zkfV578r8NFhhEyfI/b8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sua3zmSI3nL9OitX0T3+r5SPaTOlATxaZ+LIkj+VHWQ=;
	b=DD3Z008U6DtdoJtb2MLnRbmvr9F7LWUOSHIQ6cAeEe1cgcUw1NLSJWQbNUvpiGwpNV8u
	 4CRshZoszxAywiG5IcL5nVJWLw+NRHnQzRhxrRTmqboG6tzKWhGIBmXW+R6henW5t9snI
	 2rEYtBYG7uAJEN5Pd1A86WJBB5Zd/zHRdm2iiDhKtG4v6IPVUYrBWiIqJARNKuSh/v16K
	 vdzlN6jblvRjjL/aN3R8/pKGIgzi6nTTS2oD8BpSVShYzs471Ryxq9/cvJDZ5NAE44zjF
	 QsLA6qCz3KPpsCY+ydRZMFr+zWkfVOhIqy8V7sZU5tVetaf9wqTe8b7K9fpv/X8XLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsWlbbzF;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921A606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8921A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsWlbbzF
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b2f59de176so5956521b3a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786848; x=1796391648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sua3zmSI3nL9OitX0T3+r5SPaTOlATxaZ+LIkj+VHWQ=;
        b=jsWlbbzFg5LaQQust3PO7MDmY47VCJn6K+oluznWTM69t6c25a5IOn1tArUTR956cp
         PpNdE+xElQGdaHZQDIFX1Gld5LfN/ZpDt+DK7ck3G07pwxid7YnETBM7kbRXdIT4e7Vu
         jNUWZSPa7x3gsZlcaiCY3nu2LG8FrbLvV3pFuG85+CC/Qc1uZdaGxDMvDG96QDUM3ss/
         vZgVQuJAuvE6APEq2+alJvPbePJ9Z9m+qBts5ohxfTXNeF3lx4WgCyKthiVxxetVxJ7d
         d+QYogXxheR+SVHF4GBz3Jlx9fd2H9IeTYiyYwigBGO7iIwEQh1/i1/4VphzJmhu+7q9
         kVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786848; x=1796391648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sua3zmSI3nL9OitX0T3+r5SPaTOlATxaZ+LIkj+VHWQ=;
        b=LbFl/tr2srofIgNzOLcSzwb+8InzcuVLSYWJrHCR+MNkfflA9WZ5n//0/2u6Ooftq6
         XMCwuhQmrq+YVSJxevWxbtR/bQ8qqw159qprGtzwZHq6/SAe+h9nhCKWaJ2qlzIchZrk
         zIOwynX1dXbMIuNXv8QHUWXiH5Tfj1XCIwdoggBJ/qIDifVZrP1g2xBSgh1vtXBnT5nL
         LfFOe3xx7h1xW3vvFGyhLVIx67qGYJrerSbBnW/YL6MaGy6RjLYMeBA0+6aKa5RluddM
         v2SgQ0EcgIVG/myWtPAWzxmwwM9emLnItGeBcKDGtwL1NRqJsoBaZPELSj1sGr2NqUju
         nV4A==
X-Forwarded-Encrypted: i=1; AL+hErFKz11T1JQix9hbYdmmPShx1Wcn0LARk0jgH/DEViCKlrv5aSyBTLOwAoxN3m14HoIdxQPa1q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85kZaUvggirAE8LCkCLQXHbfPiZbxWsEFmWJM5OZGBU0Ow7J4s
	RZR9mx31ZRuLoaaji4McBMywDyJcdPH6WTdckcJoRs9ICt2n84nHc0zX
X-Gm-Gg: AZFdTZf6/wp2xeWleI17Vuvdpnaz1Ov1PEO+C7O5mj3j1zp7LqbA7PCGVxiNkof8P3d
	WQSvLpYpuBRzQeiHorC39SlfJRr407glsrBECZYetp42LFDMaSDSlXissZPFDJNqeQ0xExVFACB
	TRHl16syho0mNJJPYm35dupM/D8xU1TrFNXBnivOt+UzDCpFQFIMZxMTYwBVte7QU2IOMTJxUjx
	LyPBASf6Tz9imkrUXIM7k/za6Q1YQhr9xhINjSo9Wv+IJI7Zj5u2EE21N+p3hF50kQMPGlL2G1+
	jeR7R/sALJxZwHqtniNXdvINxKFGYYSbHCgGsP9uhoYSQXy1NqkrtGNkYZvd80CAmMa9+BZPYUh
	T7oIBH9YOMTFee4lCvRUjVvxyEZdlODbjeJqS2AcamBzvMr3zEASXV+8R+QEP6CeA8l5xROJ9IM
	wvvbsFd7NTRyO7Zo5q7v1U3lskvrZgHLFnCmURjjJkYUnwYn6vk3hXzezs8PqfrS4roPbcGxdqM
	HpCvAer+vcvTEs9RE9qqeB384SMSpJoLLv98gXW1oLvnf7rqf+D+yjdy4P+B9ZYZszEx6aqU3Q/
	esuSBz085kUyk1esdlFiPo5Gy3O5X1NYCkmPRwws7b2ccAoWuJch8m81rItrCXiFLtIfVWGt+Kr
	ABaDnZEnsrmUbPPz5A35xY367CSe6kTNt1jvQhox/wWbFBIiNjBH8uLjaE6+WBJkh7p3PeBYBae
	dY7OwYSZpaY+5wQbE5ZtdT/NVDTg1PN8BU3+JZgps=
X-Received: by 2002:a05:6a00:13a4:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8c8792b5df2mr22233457b3a.3.1795786847901;
        Fri, 27 Nov 2026 05:40:47 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:47 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 3/5] nfc: digital: complete DEP data exchange on terminal errors
Date: Fri, 27 Nov 2026 21:40:27 +0800
Message-ID: <20261127134029.1813-4-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

In digital_in_recv_dep_res(), terminal error branches jumped to the
error label, bypassing data_exch->cb(). For callers such as AF_NFC raw
sockets, missing the completion callback leaves the exchange hung,
leaks the socket reference, and leaves tx_work_scheduled set.

Route terminal errors through the exit label so data_exch->cb() is
always invoked, and drop the redundant kfree_skb(resp) because the
callback owns any non-NULL resp skb under the data_exchange_cb_t
contract.

Found by static call-chain audit and code inspection.

Fixes: 7d0911c02fa2 ("NFC Digital: Add initiator NFC-DEP support")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/digital_dep.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 968547c..cd6eff0 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -703,7 +703,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 			rc = digital_in_send_nack(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			return;
 		} else if ((rc == -ETIMEDOUT) &&
@@ -712,7 +712,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 			rc = digital_in_send_atn(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			return;
 		}
@@ -734,7 +734,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 			rc = digital_in_send_nack(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			kfree_skb(resp);
 
@@ -742,7 +742,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		}
 
 		PROTOCOL_ERR("14.4.1.6");
-		goto error;
+		goto exit;
 	}
 
 	ddev->atn_count = 0;
@@ -759,7 +759,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 	if (resp->len < size || dep_res->dir != DIGITAL_NFC_DEP_FRAME_DIR_IN ||
 	    dep_res->cmd != DIGITAL_CMD_DEP_RES) {
 		rc = -EIO;
-		goto error;
+		goto exit;
 	}
 
 	pfb = dep_res->pfb;
@@ -767,7 +767,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 	if (DIGITAL_NFC_DEP_DID_BIT_SET(pfb)) {
 		PROTOCOL_ERR("14.8.2.1");
 		rc = -EIO;
-		goto error;
+		goto exit;
 	}
 
 	if (DIGITAL_NFC_DEP_NAD_BIT_SET(pfb)) {
@@ -777,7 +777,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 	if (size > resp->len) {
 		rc = -EIO;
-		goto error;
+		goto exit;
 	}
 
 	skb_pull(resp, size);
@@ -787,7 +787,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (DIGITAL_NFC_DEP_PFB_PNI(pfb) != ddev->curr_nfc_dep_pni) {
 			PROTOCOL_ERR("14.12.3.3");
 			rc = -EIO;
-			goto error;
+			goto exit;
 		}
 
 		ddev->curr_nfc_dep_pni =
@@ -802,7 +802,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (IS_ERR(resp)) {
 			rc = PTR_ERR(resp);
 			resp = NULL;
-			goto error;
+			goto exit;
 		}
 
 		/* If resp is NULL then we're still chaining so return and
@@ -847,7 +847,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 					     ddev->chaining_skb,
 					     ddev->data_exch);
 		if (rc)
-			goto error;
+			goto exit;
 
 		goto free_resp;
 
@@ -855,7 +855,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (!DIGITAL_NFC_DEP_PFB_IS_TIMEOUT(pfb)) { /* ATN */
 			rc = digital_in_send_saved_skb(ddev, data_exch);
 			if (rc)
-				goto error;
+				goto exit;
 
 			goto free_resp;
 		}
@@ -863,19 +863,19 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 		if (ddev->atn_count || ddev->nack_count) {
 			PROTOCOL_ERR("14.12.4.4");
 			rc = -EIO;
-			goto error;
+			goto exit;
 		}
 
 		rtox = DIGITAL_NFC_DEP_RTOX_VALUE(resp->data[0]);
 		if (!rtox || rtox > DIGITAL_NFC_DEP_RTOX_MAX) {
 			PROTOCOL_ERR("14.8.4.1");
 			rc = -EIO;
-			goto error;
+			goto exit;
 		}
 
 		rc = digital_in_send_rtox(ddev, data_exch, rtox);
 		if (rc)
-			goto error;
+			goto exit;
 
 		goto free_resp;
 	}
@@ -883,7 +883,6 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 exit:
 	data_exch->cb(data_exch->cb_context, resp, rc);
 
-error:
 	kfree(data_exch);
 
 	kfree_skb(ddev->chaining_skb);
@@ -892,9 +891,6 @@ error:
 	kfree_skb(ddev->saved_skb);
 	ddev->saved_skb = NULL;
 
-	if (rc)
-		kfree_skb(resp);
-
 	return;
 
 free_resp:
-- 
2.51.0.windows.1

