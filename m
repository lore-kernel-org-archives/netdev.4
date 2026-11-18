Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978441;
	b=oDNf0FvX/Q3WF7t7pARXhdJpXL6CqVc8BjAKTcEuoDuNiwrdtfgyXGHF5Hty21lejRYr
	 0uBGou3KVV2/RYuCI9TEWYKLViJfbR/LlgGaA9QEHq5YxJEXbylNWv9lmRKwbnSGR8NV1
	 vj6HDfs8fCosP9TNwpoCAnMTYEBMpbYpdmadALeZ1GeIU3zd1HohEXWHXuzKNN/Us9/e2
	 gcJn6023GH61Mdf/0xr8wP1gsd4pe+bVpMbVErEVRH0tr59DlpPZ8AXrf5k5zDAbkDPWO
	 aE1XGY4B7SgUJUC/G1TjWD60nEskRVgcQIv0QCL7pYAaq1dMasvHI7BZPxHWzRXR03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=biPK0aG9WHznxprJzM2qILlC7uo+QNVnfuQhkyMYT8A=;
	b=wxdrmE7/uTIZtQRkxhQWngXW49pratlEUW78jaiYptHrgi2pcwHkKLKIxbrB3RPNOQJ+
	 bl6HDLnvPOKtFbt1yRBlJKUPrkCYmNJoKlN87/UZOMz7J0d3QMwkCw7Dbhxcj+q60d0A3
	 HSsD6c9F+R92kz1xI9k6E5+jKkf/oHuC1LR50hZ8J8VUVvHrQ+P/MpBtH3t5KhBtQ6dqK
	 fi6Mri1T+EyfmptIcLfu+9B/h44kZpNWFk+fkakUylE9oy2iAU7VrflCK3mOxnyWsoutw
	 wGgpD9aI47JS8EuJjXUYtITjqmJpS9/i4VJ0mvAe3B9nwLjpw+MLqRINmKgSXFNB42w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NOPPV7x/";
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9762606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9762606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOPPV7x/
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930c0f9c1b1so67400885a.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978439; x=1795583239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biPK0aG9WHznxprJzM2qILlC7uo+QNVnfuQhkyMYT8A=;
        b=NOPPV7x/KygcBDhKQjG0je/rXa+iGCWIVdSTAMePQPwenrtjUmL0SBgIW+LoMuRulv
         tWgc7E25vQ0ijamr7AmKdxFEQ8CuIX3hIQGPg7sdJ/OgBIUku2pAWrL9Ewb5NeRJEV8f
         XNtXwpUOPXEvforek3MmifR1zSl26xNZH1JQbYBiOow739hhAvQpfQn0CQg/AGReeday
         7RvxE8tvJoiVKyiNeGLI+AYjHkha9B9f9xzqfgNODQtoWzm2J6tRVUxEzigzxJf+TFEy
         IqcYH0h3rEdYV8/TbWwoi+Q7BJNLVJFiWC2OyF9jjImWhNVkhAoNMdOTO9ReyA1aQgxB
         DVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978439; x=1795583239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biPK0aG9WHznxprJzM2qILlC7uo+QNVnfuQhkyMYT8A=;
        b=XUA4p1sG+Y6qnnPYAVMt/Tru/bIvVEttgYvpRoJjs8pCskwW6beUeE4/JGVaOlCNYz
         jvhCW1zGsAwnrv21jocZqVnA2BPvvgsDi2nTGFUWLdCk1MD4OsGWz/+cWBzMhmhfwIL5
         PX//u1K3kd2hMk+dep1WeRnrMdDArfmCSMyv2MOA30ilzZuQSHh8nGXmChQWiwF+fkSw
         A0dUrLs01MT/fqpk5YOORVFUv1wUDVTmZJoJJ0lBp2jiv6su3GLm2P3YXp5lstOor5lC
         XKuNN/05xtL3kBkBmM4uw24RfeXBT6xFwf+aJQtQLys81lmMSkTh+AQXuoNw8+V07bIT
         E/2w==
X-Forwarded-Encrypted: i=1; AL+hErFwTUW0d9aURd4B3AuFH9Dp8YAnq/Avefv5KpdGPr92d/MIY/fdlNoh8q5nz70Qiy71bt0ziiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z3AZmj8a4uu+L19huYVSsXKG7ZFnU1MpKj7ENnYLMneStuRIg
	kwDxbD2D3IkmpSZCjrFuQS/dOmux/B1Pu5U0uF57emlPzwoDtl6x0uno
X-Gm-Gg: AYBFou2JNdjPWqrrlo6twWS1hOTmIc/zqb3uE0pRKCF/QGXC7mP3rw8sqWJy1Jtdz2J
	XTFs878PNjbkfId9gN0jIQvwXhyZoPqFh9Ys3aMENnPpNnq/zGMIeXwSumrTRHwVws3ii330CAU
	FHxKRbRX/AsHLd/X5NAYORrkAu4/KWJTwZo2b7ez2mIwrA6+pUMnqYXJTHwby7SFNCFE7Ckq2J5
	Mt2E4qLw5c2RUx2jyQL21+YRSvK7okAbNe8rxeGzwTThwRBG60+NLhRpk2mqaXxPNg8nmlUnJNk
	RARFSTTtpks5r3GGHJOd+aBqLcMJ9FH8IhXOtVwMBb1IbiLuI6lo9f4YhnbKhDswC8epQ/YVz+r
	kc3Ixvz7Dw8Bm4m6UXHS7JMwQFlYWZuPUQXoxVC7A7+iVpbPFBKeSsM6scpShlwaEGnMW6Nl3jq
	1m7SaPGJIquJp29AwcdW9WG9FxNcn3i/nmuexbbQ7Fyz0cMokkZ1Mt/N5AUDvee6nqHxOI4jNf3
	qCAjlsoFApwD1Aw/PUTMCQZPSXSTpgTYhLONMTkbaQN7BZIbeDUelgSrvj7o7RpuXCyu96BXcQU
	jvr9k8ZQ6S0pn5GtdU/EXcOqCq2UJKJoVfEM9fP2U4V+O0JcWCCFRK3Ngqre4QBLVSi5oS/3jJS
	q
X-Received: by 2002:a05:620a:4488:b0:949:6193:acc5 with SMTP id af79cd13be357-949996088f0mr308639385a.74.1794978439454;
        Tue, 17 Nov 2026 21:07:19 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b454fa1sm97897485a.3.2026.11.17.21.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:07:19 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe failures
Date: Wed, 18 Nov 2026 00:07:16 -0500
Message-ID: <20261118050716.3873167-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bnxt_init_one() allocates the auxiliary device ID and initializes the
auxiliary devices before bnxt_set_dflt_rings(). If that call,
bnxt_init_int_mode() or the bnxt_pf_wq allocation fails, probe jumps to
init_err_pci_clean, which does not uninitialize the devices or free the
ID. Only init_err_cleanup does. The devices are never released, so their
aux_priv, edev and ulp_tbl allocations and the ID in bnxt_aux_dev_ids are
leaked once free_netdev() frees bp. A VF probed while the PF is down
fails this way each time.

Add an init_err_auxdev label for this cleanup and use it for every
failure after the devices are initialized. On the register_netdev()
failure path the cleanup now runs after bnxt_clear_int_mode(), in the
reverse order of setup.

Fixes: 2e4592dc9bee ("bnxt_en: Change MSIX/NQs allocation policy")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus BNXT and W=1.

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e78cf7ad3cbc..ba0e458a467f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17423,7 +17423,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 			netdev_err(bp->dev, "Not enough rings available.\n");
 			rc = -ENOMEM;
 		}
-		goto init_err_pci_clean;
+		goto init_err_auxdev;
 	}
 
 	bnxt_fw_init_one_p3(bp);
@@ -17435,7 +17435,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	rc = bnxt_init_int_mode(bp);
 	if (rc)
-		goto init_err_pci_clean;
+		goto init_err_auxdev;
 
 	/* No TC has been set yet and rings may have been trimmed due to
 	 * limited MSIX, so we re-initialize the TX rings per TC.
@@ -17449,7 +17449,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 			if (!bnxt_pf_wq) {
 				dev_err(&pdev->dev, "Unable to create workqueue.\n");
 				rc = -ENOMEM;
-				goto init_err_pci_clean;
+				goto init_err_auxdev;
 			}
 		}
 		rc = bnxt_init_tc(bp);
@@ -17487,12 +17487,13 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 init_err_cleanup:
-	bnxt_aux_devices_uninit(bp);
-	bnxt_auxdev_id_free(bp, bp->auxdev_id);
 	bnxt_dl_unregister(bp);
 init_err_dl:
 	bnxt_shutdown_tc(bp);
 	bnxt_clear_int_mode(bp);
+init_err_auxdev:
+	bnxt_aux_devices_uninit(bp);
+	bnxt_auxdev_id_free(bp, bp->auxdev_id);
 
 init_err_pci_clean:
 	bnxt_hwrm_func_drv_unrgtr(bp);

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.43.0

