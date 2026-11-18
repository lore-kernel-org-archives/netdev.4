Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970671;
	b=H1VaYw+IWNOQ4xQd0RtcqHSBzSDVwtdleesaQs9zjo7liR8m5PhNhovjPdtp6Z8x+4Y0
	 DHGcPTHLKozCwm7cLZhBey3UEF5snc7xdX5hjUOsuZsWfESuYSkDC/2RLTibXjJefVe4X
	 HSWjdSNgZMEl2ghcMz85HLqC1KsQ6EFsCA0vJBm65d0DlrmskaC7TwsVSZE9vLlx9fR9z
	 RKxAAjZeeB7UrS1Ps8Y9zSKyrEybn2aSNg0kdrXlI/1S1NcohGCk2lky8Ws8Et3i0aeiq
	 2qOhY3G4/hJnW2ALz1sUiCXj5AyZiPAuR1Vfv60ss6HI5IXyQcR5bCKghFtzOMIeCuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kT3HQni3XcTQ7LEiQEu3BRMI7SNNhbbgRV/REjEiKmQ=;
	b=QmgFWKDNFbfGslIrQj7Eu4JO0Hdgsvs/AgdN/MAzDL7rzR5GGby4UKLGkPGZycFw+sLB
	 I/rwXrVHx6pSWw9G3+/rgqgPyPhdnh0V2W8+JgUaldVTf8pRSspfgyubC0R0PHulDfXRz
	 qRuNJZecHsbg1HJ7NnkuEezGzIKhosJGmyiS0g4Oh6sLdEI2G98uuvsuoGHAxtNNuE5U/
	 zAHKznribm9FzKl+/jw2lTv7h9En39g9wljnj+OQKPru8J9vWBpp0kvG75gKclPDUvZCX
	 SEF/6D5RMVnmp549qLphWoufMWv/4EfL3c3ZugPAovMEoyidQDh8WkVuO8/tkXcmdLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iy9IuGJ4;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762C8606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iy9IuGJ4
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eff92780daso1701635ad.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794970671; x=1795575471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT3HQni3XcTQ7LEiQEu3BRMI7SNNhbbgRV/REjEiKmQ=;
        b=iy9IuGJ4bL7vqlV/MYSu6Re8usSSPT0Hhc3Y4ll5nHtkfGc+Sj5HXBLm58giVkVTzc
         GvnVIedTr+06+PQAiXCYZrC8rBdaQyGiBz1TnOhqTGpKTsJEsjbgv80whWujRS0vXYiZ
         WtgKoKxfAS9Qasts/ICNTQFjo/4BRUEjOpTOC5zPTiukdVNW/ktlBsulbD8YVR4bG54E
         LuDcOrSGy1wMxKrhKRe962Qtzofs2TFo0dKmI8q/w/wSRWel4siJDSIhHvCYkEHGEsof
         lUzxhnRs2EmiJnMKtG5RmBIGnJ46Jq3ztvZTa6eDdQZrGg8wAhfP+JZadg70RVLQbxjv
         6IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970671; x=1795575471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT3HQni3XcTQ7LEiQEu3BRMI7SNNhbbgRV/REjEiKmQ=;
        b=TKQav/4WQZnoFmwAzjq4U7NaQihkXKh/RuZ2HOpicjcs9H9K+0u4tD8EqB5a+R9SS3
         Nq3D2nl4U+c3TGcMwTWTO2OkjDgZwkd43K5vpoJUgY3wByYF0EjZiG8N9CYcKcgymo61
         JGVPPOrMxPzl+TldsuTzaEBJJcvmb9LXPVzOsq348GqExQWeTYnTF2h1k2FWgfmzfRYo
         fqt7Sngg27H6clcrNzXP6T3QTIFkEFxARcH9Xvq5Fuo0CQo3T5SZml8NqCWmurAgVhhp
         j/CVqH1rqaDe/9lS3XhAZDpTPWwCfKlkdppozqJQZXIWGC5VQyZUn0HtEoYLa6bMTU44
         jNsg==
X-Forwarded-Encrypted: i=1; AL+hErHd8J+kv7Wgd3wNI7zWkZPeRF/RC1gkFoFz4RZnUXxLWG8TOD8WFUUabQveouxlWbqclJlEm/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sAtgWXMiNiJUvlX+Lfc6AzOlf7VwRAy0/GelITA6slhk2M1M4
	0uZhTrhkw1VBVfKnUU+Gff8+yRRfaKkpnoKRkUy0uKPmaVpr3Xm6RWaF
X-Gm-Gg: AZFdTZd5FhEnyPNBh9OwYi+cvF37k9TiIgVWgQfj9RzMWOrwgQNcUuboCYHgrzp7+TV
	wp2TTBzGQ0tKJpPUe88mf8gPQtiU/XWd0ol+HxQNcamK88W1T0YtO7SQsWvhksCCXf4BsONzebh
	lyi9mTIKGa2RsJBnC7ibr4iHzM/lM+iLAKynldh5aDav8iw18tovnvqlPADie1ZNmQiwErt+O08
	AgeSM5iU8NMuiF8HjQTIRL24idE/5hHLUUztfuujvS7PYSV0HBmQSyOppLRx4etLXTtOrZnRTj/
	lybIQ/CxQiVuJV84yhgoqneKRs3WCEeZQPu1v0et94Krzbf/NI1YrPFqDAkyGK0sfTRzEWPP8IT
	MW9+uCQyQ9kSY7XAo36S1V29nMPa6xw7SRHNt5UDmn1cY2iTRsaJBntKJnEn3SLmxHUbUVwaNav
	rmeStaZEhxcn8U3nProdLcp42HBGBjAZrM8dYCZcO55gw7EQItqZodGXkjuOAmk5NXwA7NaJ9oR
	kd8FhSFWCy/y5Apu0xxx4sPui8G+yjJfNFiRYS3zTi5eijsGq4Dd4Wihg+r9S8So27KrvYgWPOX
	9EXKdYbxez7LQsYL9v5OieA38Yheak+jIZ7Wx/j0WtGeBp9HpYkh4ppdv44=
X-Received: by 2002:a17:903:2303:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2eff7100c4fmr12373385ad.1.1794970670319;
        Tue, 17 Nov 2026 18:57:50 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5a3ee36sm5620635ad.0.2026.11.17.18.57.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:57:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Moshe Shemesh <moshe@nvidia.com>,
	Shay Drory <shayd@nvidia.com>,
	Akiva Goldberger <agoldberger@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/mlx5e: TC, fix a NULL pointer write in the peer flow error path
Date: Wed, 18 Nov 2026 10:57:08 +0800
Message-ID: <20261118025708.86215-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The peer flow add path hands the duplicated flow over to the origin
flow before it looks up the peer entry for the peer vhca_id. When
that entry is missing, the function returns -ENODEV, and the caller
then deletes the duplicated flow with list_del() on its peer node, a
list head that was never initialised and never linked. list_del() on
such a node writes through the NULL page.

Look the peer entry up before the duplicated flow is created and
handed over, so that a missing entry is reported without leaving a
duplicated flow behind. The entry cannot change in between: the peer
loop in mlx5e_add_fdb_flow() holds the devcom component's read lock,
and peer_flows entries are only stored and erased by the pair and
unpair events, under its write lock.

Found by code review and not reproduced; compile-tested only.

AI assistance was used.

Fixes: 9d608a40c2d4 ("net/mlx5e: TC, track peer flows in a vhca_id xarray")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 708b7987ea4c..d41969117d30 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -4630,6 +4630,10 @@ static int mlx5e_tc_add_fdb_peer_flow(struct flow_cls_offload *f,
 	else
 		in_mdev = priv->mdev;
 
+	dup_peer_flows = xa_load(&esw->offloads.peer_flows, peer_vhca_id);
+	if (!dup_peer_flows)
+		return -ENODEV;
+
 	flow_flags |= BIT(MLX5E_TC_FLOW_FLAG_PEER);
 	parse_attr = flow->attr->parse_attr;
 	peer_flow = __mlx5e_add_fdb_flow(peer_priv, f, flow_flags,
@@ -4643,9 +4647,6 @@ static int mlx5e_tc_add_fdb_peer_flow(struct flow_cls_offload *f,
 	peer_flow->peer_orig = flow;
 	list_add_tail(&peer_flow->peer_flows, &flow->peer_flows);
 	flow_flag_set(flow, DUP);
-	dup_peer_flows = xa_load(&esw->offloads.peer_flows, peer_vhca_id);
-	if (!dup_peer_flows)
-		return -ENODEV;
 	mutex_lock(&esw->offloads.peer_mutex);
 	list_add_tail(&peer_flow->peer, dup_peer_flows);
 	mutex_unlock(&esw->offloads.peer_mutex);

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.1

