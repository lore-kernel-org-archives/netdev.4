Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060814;
	b=kC0x4Bemv/0Z7xYNdRsVc5qjFPwveslbS+P1YJp6G/e9PwGqgjzZyIONCA4zWOrzuJVe
	 unaYIYQ4TOvIcP1mlOEPB+8nngbIgrDU8n/4D2daabpzFuGAfioWjmOh0NuE9p3Ac7kh3
	 3Lji6SZCICtQg/wmL6XsziQhW3Pv4UggOhyXsEJxbsYRYfzlKbz0rII7JmgtciHWTZEI0
	 agaTM3ubISjpIl8Ml/2NHaKEOMn/M6XPe7QXw1Dvra773mR34m1oBDCOhya7k279Z0Mn9
	 6AFmlNjcpLVys+pfwRPmENmEePdl39UqIKga2wI5XT9IKdW4E6DJz3GGdDvknnquKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hrtXmcq6s64KxkvFw0bjQWK05XF3+iG8LV5dKk/K3I0=;
	b=D7R3eE4+rINjXzZM8yESndS9ZqTDDX992t9ri7JyjewdKVyqsAG7K00wh6moczSPv8+2
	 PPlq/c0ywiGPjrb2jAQVNF/fsWocHGOdhs70NCQtJW/v2bg7A6J9xK2bVA0RJqtS7O6Af
	 pVPEzsyB6IMCjXk4bWRlWJB6UGHJFaV0ayZKFzjz0B8bs+DZuzGOZLd9Va2woFUy+kZcx
	 9lg7d/GOd+YbNynaRnWBU4vYlQjK8aw7G0ae7F/HIXbGEdYzd9Cqm+L03sKEWe70lffri
	 emL1opF0difRljdFwW//ENGpw3usW6+/qdvyM/aDjmzH43JDgxEWKPkosSUKrhxHJFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1YD8Og0;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82B606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D82B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1YD8Og0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20548905e9.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060812; x=1795665612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrtXmcq6s64KxkvFw0bjQWK05XF3+iG8LV5dKk/K3I0=;
        b=T1YD8Og00hUd9SAQ5mRegfN7LNKrCzs+3mWoqGHe6t3NbP7QmqbhnSQG0JRXurWabM
         84Bd1huEc4NOnoMk7+t/bablNgZ/6hCm1+XtTwn7nVfQOamngnmRarc63537D44w/drb
         dnJP5RCnThAaW3zkVTt6weKunMsEMA7Avm4U9z8y+kyw76SHVJCvJtgM/QhHqypbqjw4
         kD8zyDtZF5ZM5W+xfJRGvfaA0JWAV8siXoq0drU2raPZM21AAMpKR3ZZIotkfEQzFl6y
         /2r+BlHSAX06+0jEnpYLQ0honjoeKygjCQl3Jm1C1EDFsQ9ADJJRW64h0oeWPRR2mvgM
         uPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060812; x=1795665612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrtXmcq6s64KxkvFw0bjQWK05XF3+iG8LV5dKk/K3I0=;
        b=AulPkA6t9n1WxHfaDBOGjBkJ7t2FliJlurClyVUx65gIFBdupVEBp3+G2Txg9vjn1R
         oD6LmqxVWnoH5cVEXCN6rATjQDi5TwPuOd6/ifj3eQnwX7rQdd7WFTCAvMDBjT6sdOko
         Pe0VFWPVclYkhlQBVrr/Ox8Nd9C8N2HSq/Pbaav4eO266MN+AIPXfJe2Ya8yqFqJPAd8
         D8zYq0bThfS1yJWxsBugK1b+qViCxFiPMe/7RAj7G0z7RP72Q1GIyv/HVDvX/H+Qlbw+
         3guoPrYqXr7+aHjMlAoDFw7TD7TLJenEVTbJ/dE0oYuHOuaGm/xtv/63FdRC7ZzesRWB
         js+w==
X-Gm-Message-State: APuU4Z8O8M+OjxAgATbVFf/DnAQDAbXRv9rhIuLWgvM7s3NXv8sOSTCd
	yEHNMyAFF58qnfXwkVW8/GVZ5V+C7Ql8jQcf+A41EaCeCQvh8UAqC0EnXh3lMXtO
X-Gm-Gg: AYBFou31somW6pLGQ5AoP/jqYtjkmC+neQCBwJ0/FlNHTEWIoLpS3pQO07L06dT24rb
	5tsLV6A3o4VPufhCOG3aBRg9Gz2J8kOLVDMI2cVPNw6Z4gkdu1icE8/YKp0nW/dXlLykLK6cOzs
	1db/C6ZwkEhgwYOh5k3DIiFbkPd3vWOxmoY1XI8BBWmjUgdFFsIcJHudmpAT+RJlbWA4CKy7GH7
	IUg+7GEigGYi9Ry+0DoWf1ajE2OvQmxsWPiT8t8BlA3piO3LvgTWqM+MVoJP928eNb47Hbn/wZg
	fqVN9GEpo11BH+PvZhIEOOOEYSm5bcVKp8NOW8VBi6znymu+m1ogdfFS7oxXjR0hDfZ456XxXdV
	R1PH6B5URZej/B58ItZmuvQeYHFhJmuRwKTDFJQcTvZTUdI/Oi9weqOJFG+PBh9kcpaQIP7QOiU
	exe/UrD27cnyvyNN/M1EPr0jFParMeCJVy1VPWXi5TKa7p3qpB4syBgA2s6bYDmLTCPtZVQLUsv
	Q6/mlp1RkMowacAQdWqzLl5JHf7qJya/euGSIbGr62TayVpzCMRD3rTapgeQq1Zwu1aSsd+/aoi
	ydBdl3uAA4VTBoyp4LiFm8pesfU=
X-Received: by 2002:a05:600c:800f:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb7da4ec63mr92437165e9.31.1795060811757;
        Wed, 18 Nov 2026 20:00:11 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:57::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e47177sm6576085e9.2.2026.11.18.20.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:00:11 -0800 (PST)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	cjubran@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: mlx5: Allow police as the last action of a TC rule
Date: Wed, 18 Nov 2026 20:00:10 -0800
Message-ID: <20261119040010.1405900-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.1
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

From: Mohsin Bashir <hmohsin@meta.com>

In switchdev mode, mlx5 offloads police only when other actions follow
it. TC needs no extra action for a police-only rule to work. The mlx5
driver makes every police rule forward to the post meter table, but for
a rate police it adds that forward only after verify_attr_actions() has
checked the rule, so the check rejects it. The ok result of police is
also handled as pipe. In TC, ok accepts the packet and ends the action
list, whereas mlx5 goes on with the actions after police.

Support police as the only action of a rule. Set the forward while
parsing police, as is already done for police with mtu, and forward
an ok result to the end of the TC chains, as the driver does when it
offloads the gact ok action. This also changes existing offloaded rules
where police is followed by other actions. Before, an ok result ran the
actions after police. Now it accepts the packet, as TC does. The
upcoming selftest series also relies on such rules for TC offload
validation.

When police is the last action, a pipe result also ends the action
list, so forward it to the end of the TC chains too. Otherwise it is
sent back to the post action table, and with two police actions the
packet loops through the second police. A jump counts from the start
of the action list, so its target may be an earlier action or police
itself. Reject jump when police is the last action.

The patch was tested on a ConnectX-7 in switchdev mode with the
commands below. It was verified, using the hardware drop counter, that
the rules are offloaded and limit the matching traffic to the
configured rate, that the second police of the two police rule only
sees the packets conforming to the first, and that jump on the last
police is rejected.

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop/ok

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 200mbit burst 1m conform-exceed drop/pipe \
    action police rate 100mbit burst 1m conform-exceed drop/pipe

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop / jump 1

Cc: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
Changelog:
v2:
  - Treat pipe on the last police as ok and forward it to the end of the
    TC chains.
  - Reject jump when police is the last action, since the jump target is
    counted from the start of the action list.
  - Update commit message

v1: https://lore.kernel.org/netdev/20261117031337.4126403-1-mohsin.bashr@gmail.com
---
 .../mellanox/mlx5/core/en/tc/act/police.c     | 11 +++++++-
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   | 26 ++++++++++++-------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
index 1bd1c94fb977..faa0822b1136 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
@@ -49,6 +49,14 @@ tc_act_can_offload_police(struct mlx5e_tc_act_parse_state *parse_state,
 	if (err)
 		return false;
 
+	if (flow_action_is_last_entry(parse_state->flow_action, act) &&
+	    (act->police.exceed.act_id == FLOW_ACTION_JUMP ||
+	     act->police.notexceed.act_id == FLOW_ACTION_JUMP)) {
+		NL_SET_ERR_MSG_MOD(parse_state->extack,
+				   "Jump on last police action is not supported");
+		return false;
+	}
+
 	return !!mlx5e_get_flow_meters(parse_state->flow->priv->mdev);
 }
 
@@ -94,13 +102,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
 		      MLX5_FLOW_STEERING_CAP_MATCH_RANGES))
 			return -EOPNOTSUPP;
 
-		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
 		attr->flags |= MLX5_ATTR_FLAG_MTU;
 	} else {
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_EXECUTE_ASO;
 		attr->exe_aso_type = MLX5_EXE_ASO_FLOW_METER;
 	}
 
+	attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..7e7111e6d058 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3874,7 +3874,7 @@ static int
 alloc_branch_attr(struct mlx5e_tc_flow *flow,
 		  struct mlx5e_tc_act_branch_ctrl *cond,
 		  struct mlx5_flow_attr **cond_attr,
-		  u32 *jump_count,
+		  u32 *jump_count, bool last,
 		  struct netlink_ext_ack *extack)
 {
 	struct mlx5_flow_attr *attr;
@@ -3891,11 +3891,17 @@ alloc_branch_attr(struct mlx5e_tc_flow *flow,
 	case FLOW_ACTION_DROP:
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
 		break;
-	case FLOW_ACTION_ACCEPT:
 	case FLOW_ACTION_PIPE:
-		err = set_branch_dest_ft(flow->priv, attr);
-		if (err)
-			goto out_err;
+		if (!last) {
+			err = set_branch_dest_ft(flow->priv, attr);
+			if (err)
+				goto out_err;
+			break;
+		}
+		fallthrough;
+	case FLOW_ACTION_ACCEPT:
+		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+		attr->flags |= MLX5_ATTR_FLAG_ACCEPT;
 		break;
 	case FLOW_ACTION_JUMP:
 		if (*jump_count) {
@@ -3967,7 +3973,7 @@ dec_jump_count(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 static int
 parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 		  struct mlx5e_tc_flow *flow, struct mlx5_flow_attr *attr,
-		  struct mlx5e_tc_jump_state *jump_state,
+		  struct mlx5e_tc_jump_state *jump_state, bool last,
 		  struct netlink_ext_ack *extack)
 {
 	struct mlx5e_tc_act_branch_ctrl cond_true, cond_false;
@@ -3980,7 +3986,7 @@ parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 	tc_act->get_branch_ctrl(act, &cond_true, &cond_false);
 
 	err = alloc_branch_attr(flow, &cond_true,
-				&attr->branch_true, &jump_count, extack);
+				&attr->branch_true, &jump_count, last, extack);
 	if (err)
 		goto out_err;
 
@@ -3988,7 +3994,7 @@ parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 		jump_state->jumping_attr = attr->branch_true;
 
 	err = alloc_branch_attr(flow, &cond_false,
-				&attr->branch_false, &jump_count, extack);
+				&attr->branch_false, &jump_count, last, extack);
 	if (err)
 		goto err_branch_false;
 
@@ -4052,7 +4058,9 @@ parse_tc_actions(struct mlx5e_tc_act_parse_state *parse_state,
 
 		dec_jump_count(act, tc_act, attr, priv, &jump_state);
 
-		err = parse_branch_ctrl(act, tc_act, flow, attr, &jump_state, extack);
+		err = parse_branch_ctrl(act, tc_act, flow, attr, &jump_state,
+					flow_action_is_last_entry(flow_action, act),
+					extack);
 		if (err)
 			goto out_free_post_acts;
 
-- 
2.53.1-Meta

