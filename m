Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682549;
	b=Lhr+7ja8MXb+5G1FKZprODALK1clBSZsJNMVnY+gX6yzb8aRBidOE4ddlkti/FSB2dDu
	 RSEfQIH3M+OLWH31a+SUdV4qGNxUvIwSG6Gjq7q/SHDZ5UjhMEu/IVlyqB3ZDoGQrGTtg
	 lIFSfSPoOzznzak8e4z8M0JYpggjcyABaBqSRz+CW49W/nIYKdzWk8m1lftjXw5SIOc6J
	 sNUDm+QWfoXK18WAb87Bbw+IFjfYKsq7Gmn2V/SKfahyCPBVtiYq6d3rF+xiRo/dqpIf9
	 phWyqoY3e8XwB1DUsH4ICgeybInjGbCXpHhKawSkuxP2FQc4CjIT/6pJr+EXdlXtFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mHwHRe9XTxN3mpF3N0k+Ilh/t2cSlSvEtsZYTB5OR8Q=;
	b=mcOLMkPdE5h2IYItpsXQARpbfh45WZ2IboSPyUkGCiw32m3ioJ9IXIdRcsSKgqtSYmwO
	 RqNDsZyYL5sYkQCKSm2ruwfWxHQ9D3/+037XVbty8IrXmGNKRvLRYOj6mu06tc8WPJbXR
	 Mmq86pYPZtjeLI+LVuvS8ChtLUILx1Qb+5ccNDXxTJT96ozXWVB8Ag7MQMz20x+Ryqs4I
	 P56vHntYehsPhYrR6vu/iKR+8yLEEN1pLq5MbFXytJkbu+yGWiP1ddJUdBiBg3kIJIao/
	 fLAL5zaEWQt1/LyxPcVHfNrvSP67DIUGQHIVlCGWxPEQQjEuNbnd27c0/GwGdmhmfNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhxsFBKP;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA7A606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhxsFBKP
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8bef8d4fb90so174901b3a.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682548; x=1796287348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHwHRe9XTxN3mpF3N0k+Ilh/t2cSlSvEtsZYTB5OR8Q=;
        b=PhxsFBKPZgAqS99nTaerLNzznhbqRkxwN21v0GcOejFQJTzwsS+9qwBKqeYb//JsTq
         pt4pPPrJvPR4MJOUv+NG1gxkru2fi9Fe/Z7gbNFjLmUczhlh7QdUOFHNZa+XPxHHZaVs
         lEKf0ipfAG96jCfdEVuCaE5EpK1RWoqoRKVSDkrADq5VndGXfRyjM8XW6s7BB85DpsAi
         b+wxt0+tXngto0PAbwmm+Kb3hATs3zM5AJBsfiujXRA+lJ75ipRvF4oMZch+sXtXRniA
         TvAY1OccPHrEJxfJK//h+GVrfUafzULFvB1Dx8+86Urb3soC7WP93vcLQpitLWJn8K21
         Yj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682548; x=1796287348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHwHRe9XTxN3mpF3N0k+Ilh/t2cSlSvEtsZYTB5OR8Q=;
        b=R8BguCGqQCBslETaCzCWc3voHyAIBJghXzrj5plOe8tJ40khmtqlYc/o5GPYqCZY/5
         VtE/06jV8F29I/SkOfPJx/127ZJqK2PzVai18xhynslC9m/XnvmZBEaKj06Ei/PtoN24
         C+c5yROz7sSEelqa/yPtDs9Juhs6+YZNh9fTo47PF1fD+5zC0EGPgLDh8IWjjbN597eX
         uHTfQAUmm6KtWU33GDFOIoPQZprQd1ONFXOQGjKSIBgzqNeZnChLvhX2EizD3MntMBgr
         46cnvTyg4gGEd9uf5oeE6LdlmvTAcjmSageiFNjnJQ6yGA6pefyYWCWj352Ri9XhJSrI
         hqcQ==
X-Gm-Message-State: APuU4Z+OY1tKzi3xjMAt6C8JOoYXQwkN3litBhIfEjpBezcn0Yg9hvHy
	WfpFy0xMh4PL9ArNgI5DQ47VIh4nh9jwfhd4Il044gF4il73uuAjyvfV
X-Gm-Gg: AZFdTZe+mmEXMPosVGP0Bah26IGjPkzcDkQ9cNnOYxlXF4MZvxnIZeL8m+onxXHxebV
	egYPxJFM1BDn6tuTgYld0d0yPAJZUxTTvoM/8yFw17HJO70snsCmpzgYBiFq8s9m2wFJ/BoM9d+
	FI/sVtlBqbZG9oBu0TX5VoM/tA37zirL6XPZaseKigxBz7R8ZuDu8ER53B6bdrkcqUilQHJYZDE
	OxzpZSI71GHNJZcXN2CVLozNi4hn2lgIdTdOl3GMPLehNP3Ey7tzlA38axR6VKXPC8CW43Cp+U0
	SqVZn9MEppebCyz7h6gLvzKULWQd4FxMkLzm37y5r0vkHAi5/eIPW/Gly9JQFBhZORZfAAelSLE
	SdOso0ShHfRW4P3iI6RxM4slV5BVx0U1OoUicc562D5wc5FxGK1kaDhS93DCau6Z/6EwPbGsZ/Q
	B+s/Ew9y3zeTlVtGaapuVZnbR8FwgTdBUXrf81wXBCiMOwm+hVOiwzoQuZr+7splT6wX+YaJhKQ
	lUDkOPfLne6fQotZbN5ft3piRhffvnERVfxX3sd1tVNlORcS1cHCN0WbrEhBoF7WBfHqSBeyOMM
	8xkaP/qttYMleQiPxrvXeejaR6It0nRUqF591AeifS/rfc0=
X-Received: by 2002:a05:6a00:198d:b0:8a0:8822:e6b1 with SMTP id d2e1a72fcca58-8c87b9cf815mr30956275b3a.3.1795682548043;
        Thu, 26 Nov 2026 00:42:28 -0800 (PST)
Received: from gmail.com ([36.112.204.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm10327653b3a.32.2026.11.26.00.42.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 00:42:27 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org
Cc: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	roid@nvidia.com,
	baijiaju1990@gmail.com,
	ziyuzhang201@gmail.com
Subject: [PATCH net v2] net/mlx5e: Fix deadlock when parsing flow actions fails
Date: Thu, 26 Nov 2026 16:42:16 +0800
Message-Id: <20261126084216.26436-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Neighbour and route updates wait for flow->init_done while holding
encap_tbl_lock. Action parsing can expose a flow to these updates by
attaching post-action encap entries in alloc_flow_post_acts(). If a
later allocation or validation fails, cleanup needs encap_tbl_lock to
detach the entries, but the update is still waiting for init_done.

Remove any installed post-action rules first, since a woken update can
free the encap headers they reference. Mark the flow as having failed
action parsing and signal init_done before detaching the entries.

Skip flows that failed action parsing in mlx5e_take_tmp_flow() after
waiting for init_done. A route update can encounter the same flow through
more than one encap entry while holding encap_tbl_lock, before cleanup
can detach the entries. Skipping the flow prevents adding its tmp_list
node twice. The lock prevents detach while the collector waits and
checks the result, so it can take the reference after this check.

Free the post-action attributes on the parse error path before dropping
the caller's reference, so any temporary reference held elsewhere
cannot defer encap detach. Use a separate parse failure flag so the
existing FAILED flag retains its meaning for offload failures.

This possible bug was found by our experimental static analysis tool, which
analyzes lock usage and completion-based synchronization to detect
potential deadlock patterns.

Fixes: 8300f225268b ("net/mlx5e: Create new flow attr for multi table actions")
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
Changes in v2:
- Skip flows that failed action parsing before adding them to tmp_list.
- Detach their post-action encaps before dropping the caller's reference.

Sashiko's other two findings concern cleanup before reoffload retries.
That cleanup is being discussed separately:
https://lkml.iu.edu/2611.1/02787.html

v1: https://lore.kernel.org/r/20261125042323.88050-1-ziyuzhang201@gmail.com

 .../net/ethernet/mellanox/mlx5/core/en/tc_priv.h   |  1 +
 .../ethernet/mellanox/mlx5/core/en/tc_tun_encap.c  |  6 ++++-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    | 31 ++++++++++++++++++++--
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_priv.h b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_priv.h
index 1ceebab4ce08..a031b85a466f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_priv.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_priv.h
@@ -31,6 +31,7 @@ enum {
 	MLX5E_TC_FLOW_FLAG_SAMPLE                = MLX5E_TC_FLOW_BASE + 10,
 	MLX5E_TC_FLOW_FLAG_USE_ACT_STATS         = MLX5E_TC_FLOW_BASE + 11,
 	MLX5E_TC_FLOW_FLAG_PEER                  = MLX5E_TC_FLOW_BASE + 12,
+	MLX5E_TC_FLOW_FLAG_PARSE_FAILED          = MLX5E_TC_FLOW_BASE + 13,
 };
 
 struct mlx5e_tc_flow_parse_attr {
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
index 5e40107efa26..21a03d15c4be 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun_encap.c
@@ -275,6 +275,11 @@ static void mlx5e_take_tmp_flow(struct mlx5e_tc_flow *flow,
 				struct list_head *flow_list,
 				int index)
 {
+	/* Detaching the flow also takes encap_tbl_lock. */
+	wait_for_completion(&flow->init_done);
+	if (flow_flag_test(flow, PARSE_FAILED))
+		return;
+
 	if (IS_ERR(mlx5e_flow_get(flow))) {
 		/* Flow is being deleted concurrently. Wait for it to be
 		 * unoffloaded from hardware, otherwise deleting encap will
@@ -283,7 +288,6 @@ static void mlx5e_take_tmp_flow(struct mlx5e_tc_flow *flow,
 		wait_for_completion(&flow->del_hw_done);
 		return;
 	}
-	wait_for_completion(&flow->init_done);
 
 	flow->tmp_entry_index = index;
 	list_add(&flow->tmp_list, flow_list);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..9e7850b5e13d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3748,6 +3748,31 @@ free_flow_post_acts(struct mlx5e_tc_flow *flow)
 	}
 }
 
+static void abort_flow_post_acts(struct mlx5e_tc_flow *flow)
+{
+	struct mlx5e_post_act *post_act = get_post_action(flow->priv);
+	struct mlx5_flow_attr *attr;
+
+	if (flow_flag_test(flow, PARSE_FAILED))
+		return;
+
+	/* Remove hardware rules before an update can free their encap headers. */
+	list_for_each_entry(attr, &flow->attrs, list) {
+		if (list_is_last(&attr->list, &flow->attrs))
+			break;
+		if (!attr->post_act_handle)
+			continue;
+
+		mlx5e_tc_post_act_del(post_act, attr->post_act_handle);
+		attr->post_act_handle = NULL;
+	}
+
+	/* Wake updates before detaching encaps under encap_tbl_lock. */
+	flow_flag_set(flow, PARSE_FAILED);
+	complete_all(&flow->init_done);
+	free_flow_post_acts(flow);
+}
+
 int
 mlx5e_tc_offload_flow_post_acts(struct mlx5e_tc_flow *flow)
 {
@@ -3852,7 +3877,7 @@ out:
 	return 0;
 
 out_free:
-	free_flow_post_acts(flow);
+	abort_flow_post_acts(flow);
 	return err;
 }
 
@@ -4580,8 +4605,10 @@ __mlx5e_add_fdb_flow(struct mlx5e_priv *priv,
 		goto err_free;
 
 	err = parse_tc_fdb_actions(priv, &rule->action, flow, extack);
-	if (err)
+	if (err) {
+		abort_flow_post_acts(flow);
 		goto err_free;
+	}
 
 	err = mlx5e_tc_add_fdb_flow(priv, flow, extack);
 	complete_all(&flow->init_done);
-- 
2.34.1
