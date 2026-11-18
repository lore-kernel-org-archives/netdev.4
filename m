Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989631;
	b=O8fwHB68vzF20CR9D0zuJNMQdgTxjuM/b0FFcjO15ekBK+dpU4ZYcUuxJWQ10yr0AjNl
	 Y3F/OKu/tuBQoHjL2ULYC9eHE3MHS2C6hC9aHMwXoHr63jwGXcM+FiOBFuCrShF0Oi8HT
	 IoInc4F35pWDuQNH4CAzSs/RmRk6r3Q/Rjx48iXkTtH47Sfsdwwih7g5sqd0oMgw6+vgz
	 684A5fuT/K273TMKd0wnMpZ1tdXkM1i4V106ZW+xMWdo4bsJkSWCM3F2nZPBOXzoOd/ch
	 neaR+s1JohDbYMLO7mG26TZTeLjshz/feX5vdqrEcn1mKsPxyYdP1QZae2xC1y3u1eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t4Ktyk770oXAGuQam8qgSxAjxXyC+FyRLT8hbvMUFqo=;
	b=BR/sfLLflECHKeuW5RCsmCjfMAtgQS7QcmmE9QH9oUJYgkwwofNB2tkV96k792IoJCHA
	 bYZviDbJricJt1M2HD/cdMx1qnMR29qgutpIaHCUYerUXO1yeIaQR11U7DafwALo9gj1M
	 NeiXWkaQhdR/atIVCZUgU+ByWb4qY4zKtnr5OsaGe+1vs/HcIha1l0avxRYop1l/AYgpz
	 3KlwYQCeGROFY27HOXLwnhj/XOBdwmt9Np/eypCaWC3urbZLTZqxPG8yYx84XZfsnZNz2
	 nx87+Dte8lwGULEBpoJaUwTTPwcPTBSdCmaQX+inz15WJyfGXch2K87HmdP22E+uDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aorIRj85;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43734606A33A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43734606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aorIRj85
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so395449b3a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989629; x=1795594429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Ktyk770oXAGuQam8qgSxAjxXyC+FyRLT8hbvMUFqo=;
        b=aorIRj85yO+KdmU13LcQzntWUw07t3ERm2MS2ZQazEP9NSUdTGr+wAZqehqrSmgz1d
         Ek8VOCbii41qrn7q4hofoMnJ7TmyDUb0v5D2L0jiRuZ9QLjWhn+ZBh7rdOFU/zU4/kNF
         8iFTiuVMBDIXeVkatN68snoV5NtVeJuzta8DhwfSe1j6GdXR30DjeQarfr8Vpb0gU1n+
         /tvgm6C8vcOfyBay1vvdvCFkQ6/bknQmZl7bciC3eBKXc0CZi0JWcfGyXwvXRfpB96w4
         fbAmDIRmGcDQjyPApQveAjOaotz+/oqpmOkvqg9HBzf9pTpTlIPiuw4wK5lFjn0qzh2k
         wT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989629; x=1795594429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Ktyk770oXAGuQam8qgSxAjxXyC+FyRLT8hbvMUFqo=;
        b=uDi3M01aELjbp+eXiF15z83+VuK/vchJJtGambdcOxZDgD34HJPXfn2zG0cNsSje0V
         IEmDJhDp51F0zVaBna4O64PopDsyRV231P4xSG/exev0HgULMifCTmo04VCNeUupjRUN
         nFE15hJ5cJzJQQl69wCBVu44WrinmB0UQ3aDoIvXOLb+A+Wek636VTpXv47haeXJNLTz
         r82j4O9wE8JLpIVObbJWH4moc7holzhF+SG3+xXqHfgFeb710tnfNjE1QaWfFQsVxM05
         J95RQH/kcu1uB1Gh7Qsyp3Eawg7EmQBm7xOM4RVlL1e2AdFRY6crXH2mnIq8KQo6pFlq
         Zstw==
X-Forwarded-Encrypted: i=1; AL+hErF+tCG9cMNpzD7Vid/LCCCUUpboUINNTkVjA3gHMC+3pra5Yejf5DKfEgIdLEJ61oejzLXXetE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vD1VVvf+cy8IAbFZy3FqjA2am4E52v5T2Ju0ooczdUvdCJjUi
	MJdnt8fK+pwXfGtOK/TZK9bOvIMAKYeLqY8x1cFJJLN7C0pDWyumGbZr
X-Gm-Gg: AYBFou0TpOWLsnaC2bwGKRDve4rJUJcShPj2zJtBxbqgTEnpjt00byYtp5V7/L3ukXo
	gk0GJZK+WM5MsnGWFm3ISeZfuHt8ZEOwBi4VOysow7oBLaaQQMJ1kldklXWP1tl3S4d34lbaRWM
	5yhj2qxJogGolO+9ujDweZjzg1Y4ItmOSsoYprGk1GU4X+Aesm90c1WSWrogZ0EZiRK27MZJepm
	aOvKi9AbvJW+KgiVHcxS5Jjx+m68oH1q70RXU/xy1Adc/XMiMDZjuPYVvZI2nnj/CuCEr9iPxBj
	4HUjNJ0oWFtIGLUYGIPMHMDRPIjDpR1fECmHK9PbkH4R00yvkiwguaO1j5GbqU+I4Xf7MgZz0mn
	m9zODeuZPX6LWw/GOKbTwRZsuECr823PnMf2jOE1DfOcIEQ3OJ4SaPHsSimbdK2uQFfz3FWmFu+
	cnyuXigu7oB8OjUXko2Hh23Mj34eTRjvBzDm8kb2e57ZrKAORmUdsuw77sVxLpDCWxFgvAV/5d+
	eWwrQ4pm2whuxSBZmOAmwhZx34qLT+2WX/mKTBP32urE2S5nWtb3Wk2pR7Y3coGPrMiSkHVa7XQ
	jx6MOc/PXMbKQHiWafcxmHSGFWFhBNqpTwv8oNsO7i9IWOovGcWlXlXoaxeAtqcjlRfz6TGxMRh
	AnvE+9jSJOmDkKQz0sKnFWPgOrOsKjLBs/vcrqocXBl19GG9DMBTggNnbFqwNMO27meMek9IaMs
	NLWlMT9a4pvzLTqxu8J4o=
X-Received: by 2002:a05:6a00:a28:b0:8b5:9654:d340 with SMTP id d2e1a72fcca58-8c5d42eff9amr1473706b3a.33.1794989629507;
        Wed, 18 Nov 2026 00:13:49 -0800 (PST)
Received: from LAPTOP-3B99V33A ([218.194.44.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8fe3csm763993b3a.21.2026.11.18.00.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
From: Bin Luo <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david+nfc@ixit.cz,
	netdev@vger.kernel.org,
	Bin Luo <luob87709@gmail.com>
Subject: [PATCH] net/nfc: fix skb ownership on data exchange errors
Date: Wed, 18 Nov 2026 16:13:41 +0800
Message-ID: <20261118081341.1514-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

NFC data exchange callbacks may receive a non-NULL response skb together
with an error. The ownership of the skb is not documented, causing the
rawsock and LLCP error paths to return without freeing it. Digital DEP
also frees the response after invoking the callback, which conflicts
with callback ownership.

Document that the callback takes ownership of a non-NULL skb regardless
of err. Free it on the rawsock and LLCP error paths, clear the Digital
DEP response pointer after the callback, and release the skb when the
NCI loopback connection lookup fails.

Signed-off-by: Bin Luo <luob87709@gmail.com>
---
 include/net/nfc/nfc.h | 2 ++
 net/nfc/digital_dep.c | 1 +
 net/nfc/llcp_core.c   | 2 ++
 net/nfc/nci/core.c    | 1 +
 net/nfc/rawsock.c     | 5 ++++-
 5 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index bcafab5c5..d3c2d6735 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -37,6 +37,8 @@ struct nfc_dev;
  *
  * When a rx or tx package is lost or corrupted or the target gets out
  * of the operating field, err is -EIO.
+ * If skb is non-NULL, ownership is transferred to the callback regardless
+ * of err. Providers must not access or free skb after invoking the callback.
  */
 typedef void (*data_exchange_cb_t)(void *context, struct sk_buff *skb,
 								int err);
diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
index 968547c30..c7f5378cd 100644
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -882,6 +882,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
 
 exit:
 	data_exch->cb(data_exch->cb_context, resp, rc);
+	resp = NULL;
 
 error:
 	kfree(data_exch);
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..3619e12b3 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1638,6 +1638,8 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, int err)
 
 	if (err < 0) {
 		pr_err("LLCP PDU receive err %d\n", err);
+		if (skb)
+			kfree_skb(skb);
 		return;
 	}
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a9647..678f744a2 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -413,6 +413,7 @@ static void nci_nfcc_loopback_cb(void *context, struct sk_buff *skb, int err)
 
 	conn_info = nci_get_conn_info_by_conn_id(ndev, ndev->cur_conn_id);
 	if (!conn_info) {
+		kfree_skb(skb);
 		nci_req_complete(ndev, NCI_STATUS_REJECTED);
 		return;
 	}
diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
index f7d7a599f..3bf65b1fb 100644
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -156,8 +156,11 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
 
 	pr_debug("sk=%p err=%d\n", sk, err);
 
-	if (err)
+	if (err) {
+		if (skb)
+			kfree_skb(skb);
 		goto error;
+	}
 
 	err = rawsock_add_header(skb);
 	if (err)
