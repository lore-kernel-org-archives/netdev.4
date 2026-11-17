Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885109;
	b=PWiKM87CmeTPoQmbtaGyyDnntwrBoGwD5NG+mwhsMgrznmWnolXbnj6u364gknNP08kK
	 iyi+SLrHKC41bTHHszW0h2FwQX1JDewZtxVfpbHx7ULe984TX/PdpJKBxODRWGubQMBUH
	 xgO0cJfZ2x7APMAH9GjXS1s13Tw+d6N8bo3ZAk+iiC30qNKcyKD+sYvqNySbBV0eJHu32
	 GdIc0V92LIV1NPfI2G05cjAdMFGj24OKfD1HPLDs9T08jO7Dt6kzWdO86JpDHi7TxG+9K
	 z/SdLASn6N5J1ToDDPUFkvQz1EiCReFV1R3z3tEweJ+1el87zVq+LLwcXG5fbdqJogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3oEyXkT10pdH7P7mR2+WY3w5NVnu5TROP12ldyy9kHs=;
	b=Op9NRsyZ9DIIDHtglhp285GrAAi2aSG8ZcF/Z6r8094arKTiWH1DO0dNIFTanA+6ClJH
	 CPpdU1kEDCjAWWHx0zufNat6uq81nnivELkJAGzjY8cYApc+CGDf/m4DtFR5lEaONZ/Fy
	 SNWaj9/9tpR+FPjhQaVbJRqI2PtU6T7r06wPOgapLvE8TM88M5XSuFtsoA/zVZIHo5VmF
	 w+h9ij8acYeY5lh8PpO7lxhhvw5RrLD9tBLNSkGO9CabHuVwpvHLoGR3HScXMkYbinn86
	 GPwAJbk/QvVl3yZ/7s1N1YkfjCQdZL0OrMNo7ATReJtAOVS35xxFh4H0U4AH3s/cVTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkinACuk;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA806606A889
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA806606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkinACuk
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9210214fcf6so1509816d6.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885108; x=1795489908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oEyXkT10pdH7P7mR2+WY3w5NVnu5TROP12ldyy9kHs=;
        b=CkinACuksaJtTkDpqUFv9vcV5g/yL9gClGFP+pQzi4I/aiNiVxkM9zLrBjZE1SQqOo
         UVWbNftox6mz9HF5fRLW9piEVzz4vsDeS+rXIJFb/4FbtH3pz8FE8gvmNP0j5Ue6Whko
         L1C3UQSOZocMl4+eRqgH74dFAhssAqTbkQug7ttn8nTZEg2qYfxGv8FWfYeFZBXtw8cc
         AX+GBM2IVXZdNGNG6wWdMOFpsdy+LGeWo+iK1AJsOqoKvNqLVLKldPzeamFXM7RfXvMs
         QcHnrFDy/PkPA0bzH2Gy1JNPeu21B7Fe62Q7U3vQkEmdxdlgm/leMac0pF7hlviS1nYL
         Ea+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885108; x=1795489908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oEyXkT10pdH7P7mR2+WY3w5NVnu5TROP12ldyy9kHs=;
        b=tBoixjNlYP34EW3SCROQs+eY5yd0fsPgZhL/Jg+X59yq+skaP6zNeVqe88FyjV3wkK
         /CPSwngupsP0KSiKVhcD4PJ5eQTQeu145xCzFq0ML4WkLv18cS4oRCTFTFI4dLA1c7nI
         qmpZrG4VsIb5R82B7f/x4ouruoj9PJm4B+DK8nd8s+i5fgUgJOAXt19ZjdAZTmVQfX6k
         HdT72MF4O5x/3LBkxYYH4PIhaxll1dxv9wblfCP/V0T7ePkxzC7sYFGpi7HIC37X564A
         FQJ1eUdp590ILRtw4pBPoPyAcZ0EOEFwHasvOqvbKlAbxA1ghTCFa4DXWHT9wpgBrj7y
         L/PA==
X-Forwarded-Encrypted: i=1; AL+hErGU9p/Be0feeL5Z5MrB8gpsycMKoF5oULEOld9C3oY5NSbRKrh1MvtM+J1Hod9BlWWp3EvG1qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fo75OausvnnJInjAq6oMTcQPEnXOteAlUoe9aLCQpYg73wpJi
	MFk2KMXAElgioGY+6X6OVU8Sh8O8m7Z4oGltrR3JSF1p3Q64qBTDeZ1j
X-Gm-Gg: AZFdTZfTvBXbrVplcH9cMKu1o5blfgxsNhKaLdoljOixJutZypM2xCzClcmJZLp5rfS
	L1Qaz+XGmokWkN5BkXy/VZsg+gFPcITIKj+/zooflQFExJhcyDZ5a0BCdb7+NRqHV2b7BKZyqKI
	Ssi5uCEDQslR8wWWB8YJGF7OSjfkqmr2sTdTCaWX1bhieJCAUqIR3ttEa0d39y59fx0++RHj5tf
	6yOqkqOYUU5L0GW8bHZJw40ao2YHieo2EFpXTgZr0Epb5akjsMe343wk91BHEEOQPt1OQYOZLj2
	mvnatqO9ipcUiYQYlDqHNfL5meDSO6yf6wwbR9wkL2p2zifZA7qU46PynWnwWDcp7aZCx69RaiY
	tKjyzZvli7tf96XrInY3hgMZtmI/TD2/4NFhfzxA24l+4XQaUhrpIHEgzcp2XLMxl0jfBiTi+Vd
	Wuv3wW9kNQjhTjTp/SQ5TYaMvukHCralSjpXUi42JoZ5R4qr/pCjJmcg6nBBYB44W1AH2IJuI52
	EELVFuZA3VHlYR6cbWZiKU7B/et6xtdmdaNAn73OxzmmBQnrSKizKFKBTw4kUrfeWH0doQDwqcb
	qmNQx8L04qIl2V/5yriuHehczKDM8VYDD7qbjWFo2e3+Yk/jcz8E8tUFIcFnLnLqeEm2hcAZzG0
	=
X-Received: by 2002:a05:6214:dac:b0:920:f523:a79d with SMTP id 6a1803df08f44-920fcaedb93mr24717456d6.12.1794885107860;
        Mon, 16 Nov 2026 19:11:47 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5f3e4sm101713436d6.16.2026.11.16.19.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:11:47 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Shay Drory <shayd@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5: SF, remove probed SF devices when arming vhca events fails
Date: Mon, 16 Nov 2026 22:11:41 -0500
Message-ID: <20261117031141.1720619-1-lcy8047@gmail.com>
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

mlx5_sf_dev_table_create() queues work that probes the SFs which are
already active, and then arms the vhca state events. If arming fails,
the arm_err path stops and flushes that work and frees the table, but
the SF devices that the work already added stay on the auxiliary bus
and in table->devices. dev->priv.sf_dev_table is set to NULL, so
mlx5_sf_dev_table_destroy() returns early later and nothing removes
them, while they keep pointing at the parent mlx5_core_dev.

Remove them with mlx5_sf_dev_destroy_all() after the work is flushed,
as mlx5_sf_dev_table_destroy() does. Move the helper up so that it is
defined before the new caller.

Fixes: 4f57332d6a55 ("net/mlx5: SF: Fix probing active SFs during driver probe phase")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE, MLX5_CORE_EN,
MLX5_ESWITCH, MLX5_SF and W=1.

 .../ethernet/mellanox/mlx5/core/sf/dev/dev.c  | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c b/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c
index e75cbf333898..44f6292ad59e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c
@@ -328,6 +328,17 @@ int mlx5_sf_dev_notifier_init(struct mlx5_core_dev *dev)
 	return mlx5_vhca_event_notifier_register(dev, &dev->priv.sf_dev_nb);
 }
 
+static void mlx5_sf_dev_destroy_all(struct mlx5_sf_dev_table *table)
+{
+	struct mlx5_sf_dev *sf_dev;
+	unsigned long index;
+
+	xa_for_each(&table->devices, index, sf_dev) {
+		xa_erase(&table->devices, index);
+		mlx5_sf_dev_remove_aux(table->dev, sf_dev);
+	}
+}
+
 void mlx5_sf_dev_table_create(struct mlx5_core_dev *dev)
 {
 	struct mlx5_sf_dev_table *table;
@@ -360,6 +371,7 @@ void mlx5_sf_dev_table_create(struct mlx5_core_dev *dev)
 arm_err:
 	mlx5_sf_dev_destroy_active_works(table);
 	mlx5_vhca_event_work_queues_flush(dev);
+	mlx5_sf_dev_destroy_all(table);
 add_active_err:
 	kfree(table);
 	dev->priv.sf_dev_table = NULL;
@@ -367,17 +379,6 @@ void mlx5_sf_dev_table_create(struct mlx5_core_dev *dev)
 	mlx5_core_err(dev, "SF DEV table create err = %d\n", err);
 }
 
-static void mlx5_sf_dev_destroy_all(struct mlx5_sf_dev_table *table)
-{
-	struct mlx5_sf_dev *sf_dev;
-	unsigned long index;
-
-	xa_for_each(&table->devices, index, sf_dev) {
-		xa_erase(&table->devices, index);
-		mlx5_sf_dev_remove_aux(table->dev, sf_dev);
-	}
-}
-
 void mlx5_sf_dev_notifier_cleanup(struct mlx5_core_dev *dev)
 {
 	if (mlx5_core_is_sf(dev))

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

