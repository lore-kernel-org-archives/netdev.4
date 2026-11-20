Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140963;
	b=vB1rarxrVRQ5aPqMk4OisZ9Ij+Z6RyO8BVMpUI/cbBg0OIfBEfJr52aNbXmyw911vejs
	 +z83KU8KuAxeN7VMQYl09qR6U/AFRARIm1sZg9/HoqmYKb+7bHcCBvLOQqTfeRosiGkEW
	 /kB9/k9S3sy6Gz1/uize6wElSd6W183JNsnJyascs9/2XTg9fiFhQXE9XSdwHfOD0eQ3L
	 46rBn4qjR20z/0HFRJNum4lHXjdaZDTX+hqq9b34vHFQZhufJy7yqFI9RdS4yWcFiu4T+
	 ztUrLnBFB6fvMR05DcwViJJE5qFbHuQ1uNbTzFkRQoxgPeXONQ6pG54FoaWOoWeIYVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wNFHaznprkYFxrl6N69NiI4gThn5TQVVfoHkGgTnqYU=;
	b=K8LH5v4GE/ggzg+jzSpGhY0Ygtlbr+OQhe0bBGkxWs0S8hHf/2frzkyfKCppDKn7UjdK
	 GPEXtQ75SpnhAcBhSg4ijOHjPCHXgF+ehmwZxn9WEjP7Sjgg/unroKXyFqAquzqBEeqW7
	 gFqDVjxtwmU/PLVr5DAaJ7tGHDPiXZ3X1cHgf6e5YaAZUkW7fpxNjgycxnsHFncmBWtx3
	 AJCzALWzqXCRvfmugyiwpL6J9NXrFj7wYWQQw3RGVM9RIHYudIjiDAKJd2f2rlYJz0DqY
	 93zyC5HSK9N0gppd8OK5Pb9ylHvuhMLgmxJ+7LrWKq+xixWH1CJvosvWhp1e0QRNgBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uuu1/tF0";
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B7606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uuu1/tF0
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9495c633eb5so24385685a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795140961; x=1795745761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNFHaznprkYFxrl6N69NiI4gThn5TQVVfoHkGgTnqYU=;
        b=Uuu1/tF0lfIbNcFFA5RelpnOOFHlqPgFEyge8uGAAcpVNHYb7VRu86qDPllD877b9H
         b9JCgahf7j9nr9Wk6YQR7CItht+a7kIhxujCe3BohcxwygPWFJZ2BLNQOlPk6Z9Sp6fG
         2f69HceylDSJmVPnPVb3gKoEUOjeQR/gqbHI4crJrVMh4s0FET4VBwA2pkyZDP9aBRph
         CKimzSVZH7kKCxujyQvrrNOBVYCipYLA3h4TrVcYRdX7pltjiL2jCFYhhSdyAqQlh5XK
         JJ9ZfEOb2S+rumA8JkDSIAnQFPcEuCbZTJ4QgokWnZUfWzABlTrNAdzdGY1C6ZJ/6gyr
         21nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140961; x=1795745761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNFHaznprkYFxrl6N69NiI4gThn5TQVVfoHkGgTnqYU=;
        b=aXlI9vHaC3/60dbUA0Ni/Mh+vlyaIPcEbrVqmH6BDkTiKTek7XGBWCW6r+0QFTwO+f
         +TJapXcI0WsS3QIeCiPSyRswqgTAsLRGlhVjqCoO7ilrQnp1QgFVDQqwXeUOoWCYAC7x
         5aX3y9pRaSzcto2Of3WoAYhziEQUJxM0zxyiBKEaPLEMZ4PCv+1fCMHdQJJs51ZF9sgr
         VsBCbOw9p4jruQttxM+VWswqB+yn2ypIfY2I4DDuLOH8WnTMMv3lw/o65yMU+64XRnMH
         12oIIBio5BtlwjvW/rIwPeCCO004LYFvgX72YyOLKPDFPwzMs0htsIIbcenctQ1D2uKN
         6ajQ==
X-Forwarded-Encrypted: i=1; AL+hErFKxfWav1ZMenA0dGe+MXAWtBsora09DYVibHU2XM601Sn+MSfGgB9QVQG/agpYy33OsxQYf14=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y0lezsMS14bwLEncID/pz/a8FelG6TO8CZ1Y3/1ALrv3lTkEc
	736pimQCb+R2sAYqFQQeVabJqijafP2ntcoVsKjZ6pCI+nrrl7VEDOtH
X-Gm-Gg: AYBFou3OsdUyMuqhAOnJwkah/sY7swrwtilwlKHnSuh2D0rHVHAa5AZE7IjT+a4fL1W
	TLCMhstP1zfCXLIMT/6qNh0vwROWH9vSxFCj6UTG+9FueyaGwaA4ZbxLN5Sp+7zLn/K4597Kps6
	Umlj+ZOGhO7ySEfqEfxa4BLYueV8Z6+FYxXmmB9XL337aJQsOxt1Acu1d4a0/6JqmwMLV6XFPit
	574psD2km6k3rQfJSUhl1GLAlV8rX5dnROgdxeeAb8ioyr5ibh6Fu9CMtgLybEm8QlglmlW1N4f
	2TE1zxTNIyl6EQcJfQrMagRDE3v91/s5IKPIiNsSLnBsm74yQf0L2Ol+fObkE3k4j43npngx5kD
	YNfnHoh0k5khTK90Fc0iLQHzIn/15fJbbc0u4EM5Bxj6XotHKmwYIJS6MYiqQzMfbXMRg76hIzQ
	4InKpmy4C+bgjBBKb4YcxW8prGO5zExbM8tQEq9drE3ElsMeN2urcJBgJk6Ab7+G0BxNtt2Q7Jx
	JP6FVzwTvcJ2ubUu1+hagyJcsPUTblAGhAPayc8CapC2wDBv2JtMCVUvjKiePDFrHoh8iwDbYiA
	z0w+//L5UOrgFqk0vOVyNQ51z1/kO4t6OueUrVFuFup00zBO6uQtHNCL2cjsTPIHPo0xZXdT7Fk
	=
X-Received: by 2002:a05:620a:2b9a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-949ba8246e2mr284773685a.12.1795140961426;
        Thu, 19 Nov 2026 18:16:01 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm91755285a.23.2026.11.19.18.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:16:00 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Gal Pressman <gal@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net v2] net/mlx5e: Skip hairpin entries not ready in debugfs dump
Date: Thu, 19 Nov 2026 21:15:57 -0500
Message-ID: <20261120021557.1630138-1-lcy8047@gmail.com>
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

mlx5e_hairpin_flow_add() adds a new hairpin entry to hairpin_tbl and
drops hairpin_tbl_lock before creating the hairpin, and sets hpe->hp
only after mlx5e_hairpin_create() returns. Other users of the entry wait
for res_ready, but debugfs_hairpin_table_dump_show() does not, so
reading hairpin_table_dump in that window dereferences a NULL hpe->hp,
or an ERR_PTR when the creation fails.

Skip entries whose res_ready is not completed or whose hp is an error.

Fixes: 8a0594c09610 ("net/mlx5e: Add more information to hairpin table dump")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
---
Changes in v2:
 - Point the Fixes: tag to 8a0594c09610, which added the hpe->hp
   dereference to the dump (Tariq)
 - Add Reviewed-by from Tariq

v1: https://lore.kernel.org/all/20261119012707.555494-1-lcy8047@gmail.com/

Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN,
MLX5_ESWITCH, MLX5_CLS_ACT and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..c6623f13261b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -1067,12 +1067,15 @@ static int debugfs_hairpin_table_dump_show(struct seq_file *file, void *priv)
 	u32 bkt;
 
 	mutex_lock(&tc->hairpin_tbl_lock);
-	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist)
+	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist) {
+		if (!completion_done(&hpe->res_ready) || IS_ERR(hpe->hp))
+			continue;
 		seq_printf(file,
 			   "Hairpin peer_vhca_id %u prio %u refcnt %u num_channels %u num_packets %lu\n",
 			   hpe->peer_vhca_id, hpe->prio,
 			   refcount_read(&hpe->refcnt), hpe->hp->num_channels,
 			   BIT(hpe->hp->log_num_packets));
+	}
 	mutex_unlock(&tc->hairpin_tbl_lock);
 
 	return 0;

base-commit: 342e62fd34c2674e82bffc89cb5c7091924986d9
-- 
2.43.0

