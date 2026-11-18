Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989739;
	b=Qbe1iQHpPYkKDrNMuaH/8/nCoqw2hKUwhwuteUxYMGkeier6ab9Xb4OJg8G06VM9Ln6Q
	 CIiLqQRqW381fYWxoORcGm41Lxf5zY6kjIHZrtMEhuKhLdPRN/mtQS+N4PHKLdl1tZwLj
	 A9tlLZu0UQtG0G7JFsJNnzULRV0OwOrqdpkrSBkfnLvL2EMl6I4g27P1XkRJJMTGmpiZ2
	 QW3mAfFWscuStRC5rUZF987HFU917uRHW/iy2eWVx+2ze81Ou/lHp5tvGVg9uUmlhm+44
	 yrHLnYDrFKyDKJhnYk596jcFolV3D0ho7gw44GQbEh7ZONZ2TueR0AWm9SBKDW4GqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zAfQtk8eiwbEkfy0Jgpn2BwM3DzjkAZf+kJnqwT874Y=;
	b=mFVJi04kz1v/Gk9LkGwRLRNa3FmRCmUu/K9v8AmBrlHUh2UFjkx9Z7kuyFOFRgedbOQ+
	 YPJi/aHAS059NRlzgdWCzlP5CZRCR25UMLQzM4FquHbcXsUmi2Iv/Z1PMdF8vtvbP3OeN
	 0/yD8HjD+3FQ7MvxZJq9VbcT4bj0BPyj7hJYLkhpgyXdFcnAVNpv4jmJEn7Mm+7Uqi1hp
	 Ki0mujSR66FNm/BguUEi9YFmpxMnvdguJWHhFSvoZjkUdv/pevHVG3Zn65ILDdOI1UV2G
	 LvCDTLaiSBlYxMZ5Z1R5oUfOcP5vvTEJq63vnYY2XyKX7TLiObEFTItKpaBuugU696g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sscr7z4h;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8D606A336
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED8D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sscr7z4h
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso319096a91.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989739; x=1795594539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAfQtk8eiwbEkfy0Jgpn2BwM3DzjkAZf+kJnqwT874Y=;
        b=Sscr7z4htdcJyBA6lMNUM+4nBjhBz9Yx+i+fqEh9UESIbfZidQfJd/NkCsCN2D8FuS
         JKzpqm7AcMqvTmOzjn0mFKu5edZsNwGq1JkKdO+xy4hAbvEq9vnK5vVfdjvtcv5RIIUm
         P/cGb3TK5JuWbNVPq7MfmgLA63vldVLf/p+pu/EJEgBXKSrfuE7b2M9cPY5jt41voLgb
         0sJI+FKYsk27jRIMRqo5Vq1XlKYJhXl1QLq/6fjR7BvIIKo1gi8JCXKhd7Gls6gVqZ2R
         baWX0m+fwOpajb8KO/eZrHd6lSbOjKLkKFWlXf45aq+jnow3dYibx+fbe6kKakVhe+sF
         m1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989739; x=1795594539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAfQtk8eiwbEkfy0Jgpn2BwM3DzjkAZf+kJnqwT874Y=;
        b=inwpw+sXpbIr8nFf3ZIE771AeZ4L5eSyceXf69QhFGSHbehHY09VzsXjkbAxEmhE7C
         sedkPDQF70p4FJpqQlwg2lieDHVUNi3NOsJaJ81eHeKwocHj99F4nwktu1xLuCA/iyKF
         0zshJ3XeVGoMOkVoaTDO/KnDVFv2pYsuIGd5ur7v0uXuvBHl6Qn0YCGckH+0GZMC+tW9
         FiTcaHxG+GyR9FAMWYKmHgBQsdw5HM4KRLmLulRHfgm2EISi7pX445aOlfR5XrpvmWDh
         KjMdlCKGZVqwZrxoocDQin7m2KzaKCfJrA0QpVVghMTQRuTQqmtYrruj+xKJ6hFZ9amu
         0U2A==
X-Forwarded-Encrypted: i=1; AL+hErE8sulmXM9P86wp4O3jb8d/clMHXaDmnppXln5WmaaMPmeCXMofvKSgLouh2WdejGDywS98P8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nhUF/l26YY+bljW/5bRsFXJ/gORm2wEmgdEx59HdejT+7nFtl
	qLlIDm/KZrcFTjEyfV7rNKkkBvadSx4+7MH0tN0R/fwFJPlejc5Tw7D+
X-Gm-Gg: AZFdTZeNiuproUWYRlJ/SCtv6PyL5jVWs7D5tfcZKu8Mik1QxlSSrx1KAjsBvkT5wPc
	3zkqJCUhIm2eC8kVJOUzShNhiNCA83TFerDJJ9f4n8ZvJCxaITpQdxo1u3YxUJpX7QJoVOlPRVe
	8CrR5YdXf098M36o/fFKKatwEFmOETpXt0c4qsSdUbDMbfAbx4Nyfgp/G0xq16e79mNru8O2VvH
	Xn/F7YsNOOBPHCZPrEGU+Fa4HYMUMeLuzVHUqEroYKWt+vR3CizP0SgatmPnPRHnjnRHqijgaMv
	oZkd4rbtRcIskKiObwNJ5UkcBzCGPQ1lZIxW4QnS0q5ryGUXTQR4MJD6PcqMJETBxrwSWde7xdZ
	Yk1sgjO+NZYHdm46aVBYIUxOshea0/1/PD71ixqipb/iDSwF4SahZlomM/EFvsOWVOi+0PT32F8
	hHILsEMEWS43T7opZ5bE5F+uJWmcq/iyVBtDuDKsBfwkvKM/yC01imE4K9xTXJsaAyRamHDB1QA
	otqWV8Q7fpGX8t0HaGee8Wz/lfApaw1T4nOCMr9tBQoPwFPdtgtClafwhAWVj/GPhKMYKDjW/55
	whE3z53N3oM8uD/dwQRCcgp2ecRyZgirpXoWLZnjPSW0Qu9YhKdoRfLop/vqaJIIEg43ZqnOZG4
	kLte0Hsv9ePcbYtr8Cz0tnDfIVHdi9qCIWBJr/uBPzYqGZizbGFkFvjxtsfQqGRjEfAA=
X-Received: by 2002:a17:90b:1644:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3b3d07cafe2mr2003848a91.59.1794989738657;
        Wed, 18 Nov 2026 00:15:38 -0800 (PST)
Received: from LAPTOP-3B99V33A ([240c:c983:10:62b2:fcc9:5a45:8cc1:489d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm8033364a91.3.2026.11.18.00.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:38 -0800 (PST)
From: Bin Luo <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david+nfc@ixit.cz,
	netdev@vger.kernel.org,
	Bin Luo <luob87709@gmail.com>
Subject: [PATCH v2] net/nfc: fix skb ownership on data exchange errors
Date: Wed, 18 Nov 2026 16:15:30 +0800
Message-ID: <20261118081530.32-1-luob87709@gmail.com>
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
Built on Linux v7.4-rc1 commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
with NFC_VIRTUAL_NCI, KASAN, and kmemleak enabled. A QEMU TCG guest ran
32 NCI 1.0 MIFARE exchanges with a nonzero data status. The root harness
provisioned the virtual controller and polling session; each rawsock
exchange ran with effective UID 65534. The baseline reported 48 kmemleak
suspects; the fixed run reported no unreferenced objects and no KASAN
report.

The runtime test covers NCI-to-rawsock only. It did not trigger the LLCP,
Digital DEP, or NCI loopback connection-lookup failure paths.
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
-- 
2.51.0.windows.1

