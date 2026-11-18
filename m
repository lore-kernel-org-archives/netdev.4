Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970754;
	b=cVh9ertb2rLoVvlatxGXSCb850h1m30VRUVOT34rtFO8VlgZWdOI+FZNVBCRZc9wLUN9
	 UwgDW5uNAZtIH2ZDAfr0d0wiA3YhaF0IVTF6sNpIkl1oxH5+n1e8/3qHlDDwqmBVmduyy
	 VG47px670tjvsqqVO/JET1ZuyQV6qj/EyEV7Ma3eAVpNKUufHypfF9FWs4WCqgYWZ8sod
	 fJjjgJRWV7LMFtdmSDvsgz0PY8fWb+xP/4DftKlgLnJdwe2pAPX7G/+vE77jIm6U6Zym+
	 Ynnw9Gxo41B7jlBJCwKPSyxL9GE99m7QGNx8bC+mb80NcvpmEOm/7aE6deN7nPiG2Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970754;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hKNadeghD4t96xVRga8eHBeh1KEt9UEEgQUl3K4u/fk=;
	b=gZQHM5Q4O+hUjN4ivxLYGb3JBTqIvso0PH599caEmEAPpYlhOIA+9cO3leKuaHtaoXM0
	 j7ZnBwWd70MrkCHk8uSesHDrV22ohbnNFT1aHXDPP7YxvcoBJolXzVVUrheCo69+9kuz6
	 YNHMOz3dys1IbG98Mcj/1a1bK0Juh6V3jMSkESu5OMRKET0Mv/OQ4yC1RRWtNVh6FS9xg
	 w8HyycCNCSCvxgCf2k1Lv7GHEgrx0Z6jGHNrp3kepfyZ8iY2NJ6yzw16h/Mf3Xjx6Ga7q
	 7s5kfpgm24S7pJCjyL/8qw0KyzsY6Dh6ObZ67CeRDNmBiP0sn7DxXsmtuLmDpP7tedQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WK1BFh3k;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB648606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB648606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WK1BFh3k
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o+mw5452YG3BbC1ZrMAJhmXBOZ3fUIA50s92Q87f+OM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794970751; v=1; x=1795575551;
 b=WK1BFh3kzR+JZ0nksrH3KDMnOSsTq1OSD73n0CrG7IoLF+hEoiA6jPo26uEA9g+E3XT2ZJcX
 b+HhZAb76rjLAZvOZEmJosTt5WFHl+2H4DB/A1oaNLYYt/auKaOiNgXMfzE5lW2FPYgTnSdprH3
 cs0fkgOWYeJ5Svofb38LOBXo=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd8b8ab25e26c594;
	Wed, 18 Nov 2026 02:59:10 +0000
X-Mizu-Trace-ID: cd8b8ab25e26c594
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org,
	tariqt@nvidia.com
Cc: horms@kernel.org,
	saeedm@nvidia.com,
	leon@kernel.org,
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
Subject: [PATCH net-next v2] net/mlx5e: kTLS, Simplify error unwind in mlx5e_ktls_set_feature_rx()
Date: Wed, 18 Nov 2026 11:58:46 +0900
Message-ID: <20261118025846.3377199-1-xuanqiang.luo@linux.dev>
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

Handle the disable case first, handle the error cases in conditionals,
and keep the main flow unconditional. Use goto to unlock on the early
returns.

No functional change intended.

Suggested-by: Simon Horman <horms@kernel.org>
Suggested-by: Tariq Toukan <tariqt@nvidia.com>
Link: https://lore.kernel.org/all/20261029134019.GG257209@horms.kernel.org/
Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
---
Changes:
v2:
  - Handle the disable case first and keep the enable argument unchanged,
    instead of reusing it as a flag to destroy the tables. (Suggested by
    Tariq.)

v1: https://lore.kernel.org/all/20261116110830.2850785-1-xuanqiang.luo@linux.dev/

 .../mellanox/mlx5/core/en_accel/ktls.c        | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
index 3cc1213c2f68..2358ad1f2331 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
@@ -135,21 +135,24 @@ int mlx5e_ktls_set_feature_rx(struct net_device *netdev, bool enable)
 	int err = 0;
 
 	mutex_lock(&priv->state_lock);
-	if (enable) {
-		err = mlx5e_accel_fs_tcp_create(priv->fs);
-		if (!err && !priv->ktls_rx_was_enabled) {
-			priv->ktls_rx_was_enabled = true;
-			err = mlx5e_safe_reopen_channels(priv);
-			if (err) {
-				priv->ktls_rx_was_enabled = false;
-				mlx5e_accel_fs_tcp_destroy(priv->fs);
-			}
-		}
-	} else {
+	if (!enable) {
 		mlx5e_accel_fs_tcp_destroy(priv->fs);
+		goto out_unlock;
 	}
-	mutex_unlock(&priv->state_lock);
 
+	err = mlx5e_accel_fs_tcp_create(priv->fs);
+	if (err || priv->ktls_rx_was_enabled)
+		goto out_unlock;
+
+	priv->ktls_rx_was_enabled = true;
+	err = mlx5e_safe_reopen_channels(priv);
+	if (err) {
+		priv->ktls_rx_was_enabled = false;
+		mlx5e_accel_fs_tcp_destroy(priv->fs);
+	}
+
+out_unlock:
+	mutex_unlock(&priv->state_lock);
 	return err;
 }
 
-- 
2.43.0

