Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827341;
	b=GC6jRR0+OmmdPkn+jOYJf6io/iOgNZbVRIOx1xKz/luBJUKVYDUWZthUzbcdtdA4PdzE
	 p4rR5U4nd9JJkItvhm6f5Eso2NuAn6PydfEZxYSM1SoKpFRTunN/u+6d4WYu4VVhQCPgD
	 VXwu/9fRXprHZhPIVCp5DXzYsDOLHtRPwtE3sr9E00xaIl+awUeU2ickihyhnT9zNjbQb
	 M3BQIN8jEp2iZmz7vNBVcC3slwUzP/Qwp1xkxxtHIRibDGBsOJ90tbhrzj3NptLHjS2y1
	 l9w1fjyj3yye8UE2Q6U+7+KaTBHxEb8CqeQHwjQ2IepzatkK4nyQomppqx1t97LKATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827341;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KqerhnwBI1JBT+I/Q+CK9wueSEu/yOxUM4/aR1pL9/4=;
	b=1MGKKcRRdmIci9JWUMWafW0Bv99fa+gMJymlOxP42d0IBEdSu4JtIkXRB5X16kwDgVdb
	 at8SkmHjTZfzV9yUjRGXmTj0IFevL6CNeZcmSS7SjxraDbE5p9MiYh15mm/cyVxc2xt7Z
	 ASm0/6kgC3i0lCf9ZLFD/RMDcjIK0QS/Qce/kd+zsdzHwG+/M8Iw2IjaGWI39i4rBUL77
	 Z69+xC9V9ns36fy48yLaW16AvvIWSRCz6gKH4tPM3ZA5AIWe3pFoC3iowW4fDI0DKME5f
	 UMMXx4SPX42oTW3lGZJs3qSQVpSxRYA44NBuI8zzO837C7QWYLAIlUB/NZv9oV4SjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Nnavr7Bu;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57D3606C120
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E57D3606C120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Nnavr7Bu
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0wNJRlzmtN6gE1mGMKSGKWSrbcdB/Xjxt9Wa0wbIgoc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794827339; v=1; x=1795432139;
 b=Nnavr7Buog7p0eniQTvhGrTRzvvMGJeuTD/wddna9hCuKLbqnPDZFqj+EaE35AYzKjnMkiwX
 NJ4RsaYUaKlp514vZW33bb01KMnqLbyy05mmodZLPRsMJBojcoyd7JwVOmEYqk3iLJRMmHimlvi
 K7YvMHscBnnatpiMqZFRPosI=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d994638ce96c12ee;
	Mon, 16 Nov 2026 11:08:58 +0000
X-Mizu-Trace-ID: d994638ce96c12ee
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org
Cc: horms@kernel.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	borisp@nvidia.com,
	witu@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net-next] net/mlx5e: kTLS, Simplify error unwind in mlx5e_ktls_set_feature_rx()
Date: Mon, 16 Nov 2026 20:08:30 +0900
Message-ID: <20261116110830.2850785-1-xuanqiang.luo@linux.dev>
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

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

mlx5e_ktls_set_feature_rx() has become harder to follow: the error
handling is nested in the conditions and the main flow is conditional.

Handle the error cases in conditionals, keep the main flow
unconditional, and destroy the accel TCP flow tables in a single
place. Use goto to unlock on the early return.

No functional change intended.

Suggested-by: Simon Horman <horms@kernel.org>
Link: https://lore.kernel.org/all/20261029134019.GG257209@horms.kernel.org/
Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
Only compile-tested on top of net-next 7ccc5e05043b (arm64, W=1). I do
not have a crypto-enabled ConnectX NIC to run it on.

 .../mellanox/mlx5/core/en_accel/ktls.c        | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
index 3cc1213c2f68..0f5dcd1b822e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
@@ -137,19 +137,22 @@ int mlx5e_ktls_set_feature_rx(struct net_device *netdev, bool enable)
 	mutex_lock(&priv->state_lock);
 	if (enable) {
 		err = mlx5e_accel_fs_tcp_create(priv->fs);
-		if (!err && !priv->ktls_rx_was_enabled) {
-			priv->ktls_rx_was_enabled = true;
-			err = mlx5e_safe_reopen_channels(priv);
-			if (err) {
-				priv->ktls_rx_was_enabled = false;
-				mlx5e_accel_fs_tcp_destroy(priv->fs);
-			}
+		if (err || priv->ktls_rx_was_enabled)
+			goto out_unlock;
+
+		priv->ktls_rx_was_enabled = true;
+		err = mlx5e_safe_reopen_channels(priv);
+		if (err) {
+			priv->ktls_rx_was_enabled = false;
+			enable = false;
 		}
-	} else {
-		mlx5e_accel_fs_tcp_destroy(priv->fs);
 	}
-	mutex_unlock(&priv->state_lock);
 
+	if (!enable)
+		mlx5e_accel_fs_tcp_destroy(priv->fs);
+
+out_unlock:
+	mutex_unlock(&priv->state_lock);
 	return err;
 }
 
-- 
2.43.0

