Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896324;
	b=4yNgv4ijSYXHg8aFOQ+zC5DXywgzhMjBh7v6BT1w9NkHBIWL4amrpA0qxn3niEZBHVTA
	 n/NVj/Jik9FKybA21dmBnS3WrwtxRA9LdkGHywYEgO2qTtazKD8rhADP1Qk7NJ45CF690
	 2X947XVoopRgdW+il8ixRjzGnEhOEQo1CVw4U4dkxyhyoqwzxIwxaY2cFDJUPIgUP4jD/
	 ManZa2uczYPt0S8OsFd3Xy9nl8RM/zHI2CtMVrDyGN+bacZsCxO0jSkmfBtfdc81yYjUZ
	 LO0efw0vY0AoXeZ8d1JMpBpBM9aoOsXLeUhR/ue6P49wX7NqDycv5HAz7tvOjR+GHCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896324;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ZvSvLnicjKBpFuI464ZexGGWbzTJ/XXBoXu7p2ye4nY=;
	b=M+TDYmw0VS8qmZoUhVZYhAgsfbhifgRhYHQ+riL3qpoyoCAhjKhLgjWQn7wYzGUOTp+K
	 E2jrCWHRv3y822RIoA5XbZQCM+MoDRD7Ee4xLDRYQjZXqXXRgBk7ih+EQIxiUW/42LlzS
	 gLUcGP2rpRx6ScKtLbfvnDr67oVoNTwjwBSPslc5TfkKcz2MgwzVWW5MDxK0vUTOHVXtt
	 /9ptpLU//b/qbGwY3ZwvB2seN/MTKwg/+mdBNjlYXU7ZbPFs6v0qRrOK6QUl23qKEBjjC
	 Y6RZt3jZVkgEKnLZEXvyod7yP2k1JoQ0HYTZD8cB0b8eFTdzLXJtEUD/yQD9Ft/pyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UIDTyAHI;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533ED606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 533ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UIDTyAHI
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2496203a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896324; x=1795501124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvSvLnicjKBpFuI464ZexGGWbzTJ/XXBoXu7p2ye4nY=;
        b=LZxpyzRQRaNGmb/zub0mu/vMn3UQrtoSTkSobovFDWfQJaA4JYc9mWT1YOvJmGGgNW
         MFMjOBKi9AnvjAvPJqBLUEUGbA5xkz/4ytjRcwkRHARq7JJDDv5M4wBvSdQ4ZXQ82ZGM
         ZD5wk52LbtrQ39seOxxwXL0Y50VJUh2EFfz2IPAFLqkLJQyjqmO7NlneUvUVg5q/GVAq
         ENmSmftT0K5/kjIi/lHsyMoAbf1GD+hcTywdlWnyieJ0jTVSOh2kArZC86R/xdPvvOIR
         Hi5lBbqK931QEz7D7HFpoO2vqsZhOm2lxKoRhTc371lNPufD/Vr9cSF/KCzJRZqrSjDv
         pjyA==
X-Gm-Message-State: APuU4Z9wXZ5onScH+2f0v0hi/hq6V89Du4mXyVLVR0kqGO7mKCsudKNE
	d3BU13+0HvpXYESPYG1VM5cdhuazN4SpC10I/2FNiUawUVw1aAXvYFJbrjoPLG4XWSvtVYG7sYQ
	KuUIi2P0GWW7iX7UVd+AaGf/uYzHk0nvvygZFq/6Q7sKdXm3pYHj8A3fU8IXWw0yOp/wBkU+Vmz
	AnXMOP8HGOQQb7INb5fkD5inmq1/MVJpVoHwqTKdjHG8C2DCTyCZFmsiPuCbC6U8kKRY0f5nJpI
	4fb9eNR4locFeFlwEjg
X-Gm-Gg: AZFdTZeYFetvVWoWWXQgIbjZrB+5GvcsVrR9SKVGFrSrhnMDplMMlzYyp2a9eIUnmFe
	ItKhXhpsEqirC70VW/L9eGpoHsUVcdDIemYB4E99tNR+dOGaDF7tnhojjwnDMlsbGM89Z5JK26E
	dzeZYlG5Bd9kaw73p8YJnSmVrFHA1zzsZl4rXBG/zbnyiPDmDi1ad5F296y29tj6lqFrAiTjmve
	R532cZWUmUuLdfzkXnXNolhkI1TrZLMaIvtMSwgcpMcF11VFOZutI7WTPebxuUqmb4LZPg8bsuu
	DLDCUu2wfcUcg+FSF/VUo76MsAZ2WTrC+YlUjK6o45SxG1UmQ4EIRzMKBlaxrfgdvbc88UiEgXN
	grqFf7vHQ5UNWp1DurG2NOqDX5V/w1W+ufmkt1N48FIkFieKb2DnIUDrYv9ChPeo1Yhsy3iCzTs
	PI2UgZW/4qZ2VKz7mVt3yvK6iuHr3C5wSIFhlHk0aYxA==
X-Received: by 2002:a17:90b:1c92:b0:3b3:af8e:ea8d with SMTP id 98e67ed59e1d1-3b3af8eeb6dmr1477484a91.39.1794896323548;
        Mon, 16 Nov 2026 22:18:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb97b44sm1282915a91.2.2026.11.16.22.18.43
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:18:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e987ec84afso35961855ad.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794896322; x=1795501122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvSvLnicjKBpFuI464ZexGGWbzTJ/XXBoXu7p2ye4nY=;
        b=UIDTyAHIBvkUU13CQsg66C05rJTd2YYm6xckgwb8JisbktUq2WbgvA0zs1Ih8JKyCL
         9a3kP59DsbWWcGpFWqc3U0T+/oUble1vr8WCyP0w1maBYMQjcD+6PRrDvf4lXmSxnQkk
         e2FS3z0RFc3nx9tDYGhmjdtjSFNSujQGOw+eg=
X-Received: by 2002:a17:903:988:b0:2ed:12a1:c4a9 with SMTP id d9443c01a7336-2ee0da968bemr123076405ad.11.1794896321815;
        Mon, 16 Nov 2026 22:18:41 -0800 (PST)
X-Received: by 2002:a17:903:988:b0:2ed:12a1:c4a9 with SMTP id d9443c01a7336-2ee0da968bemr123076235ad.11.1794896321400;
        Mon, 16 Nov 2026 22:18:41 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm8669335ad.6.2026.11.16.22.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:18:40 -0800 (PST)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>,
	Rahul Gupta <rahul-rg.gupta@broadcom.com>
Subject: [PATCH net-next v5 4/5] bnge: make irq_tbl layout depend on BNGE_FIRST_OPEN_NQ
Date: Tue, 17 Nov 2026 06:16:40 +0000
Message-ID: <20261117061641.122942-5-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

NQ0 will be created at probe, before the aux (RoCE) device has been
given its MSI-X vectors, and must keep its vector for the lifetime of
the driver. So the probe NQs must come first in irq_tbl, followed by the
aux vectors and then the open NQs, instead of putting all NQs after the
aux vectors.

Describe the irq_tbl layout once, next to BNGE_FIRST_OPEN_NQ, and add
bnge_nq_irq_idx() and bnge_aux_irq_idx() to compute the irq_tbl index of
an NQ and of an aux vector from it. bnge_fill_msix_vecs() uses the
latter to hand the aux device the vectors that follow the probe NQs.

The ring_idx passed to the aux device changes meaning accordingly: it is
the irq_tbl index of the vector, not an index within the aux range. This
matches how NQ rings are created, where the ring index is used as the
logical ID that ties the ring to its doorbell and MSI-X vector. The aux
driver uses the values it is given, so it needs no change. The total
number of vectors is unchanged.

BNGE_FIRST_OPEN_NQ is 0 for now, so the layout is unchanged. No
functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Rahul Gupta <rahul-rg.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     | 19 +++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |  4 ++--
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 5cc08177ff86..5f7147baaf83 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -240,6 +240,8 @@ struct bnge_dev {
 
 /* Index of the first NQ created in ndo_open() and destroyed in ndo_stop();
  * lower NQs live from probe to remove.
+ *
+ * irq_tbl order: probe-time NQs, aux (RoCE) vectors, open-time NQs.
  */
 #define BNGE_FIRST_OPEN_NQ	0
 
@@ -289,4 +291,21 @@ static inline void bnge_db_write(struct bnge_dev *bd, struct bnge_db_info *db,
 bool bnge_aux_registered(struct bnge_dev *bd);
 u16 bnge_aux_get_msix(struct bnge_dev *bd);
 
+/* irq_tbl index of the i-th aux vector, also used as its ring_idx */
+static inline int bnge_aux_irq_idx(int i)
+{
+	return BNGE_FIRST_OPEN_NQ + i;
+}
+
+/* irq_tbl index of NQ nq_idx. @aux_msix is a single bnge_aux_get_msix()
+ * sample shared by all NQs of one allocation.
+ */
+static inline int bnge_nq_irq_idx(u16 aux_msix, int nq_idx)
+{
+	if (nq_idx < BNGE_FIRST_OPEN_NQ)
+		return nq_idx;
+
+	return aux_msix + nq_idx;
+}
+
 #endif /* _BNGE_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
index 87ae40eab592..d1cc2e8b6e9b 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
@@ -34,9 +34,9 @@ static void bnge_fill_msix_vecs(struct bnge_dev *bd,
 	}
 	num_msix = auxr_dev->auxr_info->msix_requested;
 	for (i = 0; i < num_msix; i++) {
-		info[i].vector = bd->irq_tbl[i].vector;
+		info[i].vector = bd->irq_tbl[bnge_aux_irq_idx(i)].vector;
 		info[i].db_offset = bd->db_offset;
-		info[i].ring_idx = i;
+		info[i].ring_idx = bnge_aux_irq_idx(i);
 	}
 }
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index c2f1f517348e..a9cae94c2a62 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -540,7 +540,7 @@ static int bnge_alloc_nq(struct bnge_net *bn, struct bnge_napi *bnapi,
 	}
 
 	ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
-	ring->map_idx = aux_msix + bnapi->index;
+	ring->map_idx = bnge_nq_irq_idx(aux_msix, bnapi->index);
 	return 0;
 }
 
-- 
2.47.3

