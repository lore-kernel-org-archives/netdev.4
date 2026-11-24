Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557775;
	b=Kqt8cuoCIs8jRCN5OtIKs0xp6ekYP65ewSwGO99KLZJvF5KQ1hAcXw/+p6d97nB9ybgT
	 dDcsbGXGmRKm/X4UuoL0nbla4R30Mxxq9Z91rmx+dPK7j9d2GS6bU/b9mqp+j19kHynxe
	 pFyqiivSIEmZrcudyNxmQ5Og6dDYj3TkMgA/6qz0+8FYgKIgUJe3Fhlf5TBYzD1sOAk8q
	 aOKT+00/JvGIMCboVmgncGH+EqcAkgL7S/k9+7UM2xKpQO1VzNf1Tuktj2Na49gULMQ/b
	 GqgJMZVT4b6gPfW0362pzVwfdWXXRAA//54/+N2zVVegH8x8hFPYwKcoCbRe93gWfYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MTsG6ObX1QZphRq69WtSXAGO8I5Qp7B9rjGutUJIVt0=;
	b=10VrlJ5qS58pb7Q7qOhsOs+3cxH4oGnue72Hi8EMASPH2XxVYWPuaEcxoN+w8peu0JE5
	 8jwqFKTZdZ3MuKe7lW8malxzPJrAf+zijxUJuqfbHBw/H9Q6a24LDl9uweid2PsND5pPY
	 SOxVzPPrAeN7tPm1pXjHZ62j72ykr17GoNCNbX+RQ269EpajB5GYuclPPoqqVceO/2COB
	 Sc+pL+MCHyFfidiKAVm47ex6jjQpLY1f8rCCOUTtODGMZ+Jb/R7xwqsmBoSCdEizrqejn
	 DD7RsYW37LXnnGYWXhLTHf5mocHpOlZhyKMW7hZ2qgq3RCGKLsct10j97n6DT+JaN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hz7o8//i";
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09727606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09727606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hz7o8//i
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8629ef8613aso2000686a34.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557774; x=1796162574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTsG6ObX1QZphRq69WtSXAGO8I5Qp7B9rjGutUJIVt0=;
        b=Hz7o8//ifyypD2vcRuajMaBRFCCt7gq5hVxY4h34XSTuCklaUZjCviBkF/B6bk/hf3
         hctWcH7ztS2urkic7Jlkz9DF0pVagybCHw1UQ88mMHivAfyyKW5+g1+FDOr4vIAFFMTh
         C6K7wmKqxX7zD3McLzBVfxzWF0Tmo2/QUETVMRntMNrwbQILhPLUg/BFc7ze/Q7bldsO
         jqM9BRbs94s1/Dv0Y8Kz3nxiZRKTT2tIgkrEjM+ObxB2erd4R10JUdCFdt67Uj+wEVK1
         qnghUqKs225CQJsJlw07EKkVs0cE6y0yDyMxEyuHmpXx8XbTe9kTTB3eSQ0l53mc9yFN
         6BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557774; x=1796162574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTsG6ObX1QZphRq69WtSXAGO8I5Qp7B9rjGutUJIVt0=;
        b=eA8+97p9TORiPWaBaY8iKY1sDm9JkNxhRjZNXKhv/HMWOPezM9hWrre72uIYK5/nkz
         EdZw1Rs9LFpUNBf1N0H2Zh+SJZP4aA9hJLg4Oy5LDMzX7q/5Sb9EcHYzr1Iz+bZTCf7q
         bSDbwa2XpJLDEzTqz8iVykKDI8ydbpU2WkUeZh0ylKcommGt02wD4tABrO2j4ax12WPN
         RNg2E3KyBfhxt4yTeSCR+/tNZ0M3NoHsfhEq9j1vO/Yiilqxc3AYyUuDCYNqxRZWqc/J
         GaKrmUwgAQZHdJpeRVqiC8IkCs40CJCM1zD8+V9TtRJC82GlwpW7+MQuPff6ykyJcOi1
         6iNQ==
X-Gm-Message-State: APuU4Z/4lMBt7bQ9XEbklFtOgrwqnbqVFPmFgLEqihf5aa38TFdgZuEq
	h/GjlEsSCpQ8nGigiz5BRoVZ89frvNeVAkZDH33N6QeV4FahWvy/kMWWV9c9rzif
X-Gm-Gg: AZFdTZcbHSSu2/Z5NU1GepXYQggcKdMnaYVNQ1ceMuCzTx95/rnfg2sDcc/ztzUU7ul
	yZwoDWGaJfCs+rvjsGahvE7BfiBL80mKd02axOqrPND/DdtX28O3hH1Tbf0NRE4XSE4h6koT4rX
	/2aO5EyQ/p2n8JzA9BoLmPDetin1DxV0yv0k1wqwQ17RLZ35YebPg94Yewqyg4ljt/VmptCH4Is
	NOkFg3weMia5Ub7KUzR2Pfgs5dWHWDTF1PSjgd1iaJn6DhsBdxHAh32a43nS0LpE2wZNQW33Y9p
	NzeYEHTvimvC5hQAO51LHRdgE50pYSb5cUa7D3HArSmRX68zgEaPcCMlBJJXhpSnsKWqfy+O4bk
	EsW8WUMVoRbm0RJAunzakhEZT8V+PwigL0MeDKf6Tzgrs3auLdaDZvwEIctNSUUO8OwWYowtSuM
	MkTqbXqP4wlnoE0jHoey2MygAO4TxVvmBFviF8xl31zoQR082ROQ2UnZUKENfvBV2thaIrmbiYQ
	JRiIjzMZAS7rle31nDssp6H0gwLL5qebC7515adiTJgOvUI9A1H6sYqFoZqKepo05wgSwU1J8Tw
	f9Za5VAE3QIAB0PjtFEfRGZaYmI=
X-Received: by 2002:a05:6830:4119:b0:862:f05c:2fd with SMTP id 46e09a7af769-863152c5e83mr17966959a34.3.1795557773847;
        Tue, 24 Nov 2026 14:02:53 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:52::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm11180539a34.6.2026.11.24.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:02:53 -0800 (PST)
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
	mohsin.bashr@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: mlx5: Allow police as the last action of a TC rule
Date: Tue, 24 Nov 2026 14:02:51 -0800
Message-ID: <20261124220251.776944-1-mohsin.bashr@gmail.com>
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

In switchdev mode, mlx5 does not offload a rule where police is the last
action, although TC needs no other action for such a rule. The upcoming
selftest series relies on these rules. With nothing after police, the
police result alone decides where the packet goes, so each result must
be offloaded as TC executes it. The driver does not do that today. An ok
result is handled as pipe and runs the actions after police, a pipe
result always returns to the post action table, and a jump is counted
from police while TC counts it from the start of the action list. A rate
police is also rejected by verify_attr_actions(), as its forward to the
post meter table is added only after the check.

Make the offloaded rule behave as it does in TC. An ok result ends
processing in TC. A pipe result does the same when police is the last
action. Send both to the end of the TC chains as the driver already does
for gact ok. For jump, offload only the simple case where police is the
first action and the skipped actions are all drop or all ok. Reject the
rest. Existing rules where police is followed by other actions also
change. An ok result now accepts the packet instead of running those
actions. Finally set the forward to the post meter table while parsing
police. This is already done for police with mtu and lets a police-only
rule pass verify_attr_actions().

Tested on a ConnectX-7 in switchdev mode with the commands below. The
hardware drop counter showed that the rules are offloaded and limit the
traffic to the configured rate, that the second police only sees the
packets conforming to the first, and that the jump lands on its target.

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop/ok

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 200mbit burst 1m conform-exceed drop/pipe \
    action police rate 100mbit burst 1m conform-exceed drop/pipe

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop / jump 2 \
    action drop action ok

Cc: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
Changelog:
v3:
  - Offload jump only when police is the first action, the target is a
    later action, the skipped actions are all drop or all ok, and the
    same action is not used twice in a row, as discussed on v2:
    https://lore.kernel.org/netdev/5c493bd0-31f5-430a-844a-ad011a5f0ba8@nvidia.com
  - Update commit message

v2: https://lore.kernel.org/netdev/20261119040010.1405900-1-mohsin.bashr@gmail.com
v1: https://lore.kernel.org/netdev/20261117031337.4126403-1-mohsin.bashr@gmail.com
---
 .../mellanox/mlx5/core/en/tc/act/police.c     | 59 ++++++++++++++++++-
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   | 26 +++++---
 2 files changed, 75 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
index 1bd1c94fb977..f03a992cbc27 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
@@ -37,6 +37,52 @@ static int police_act_validate(const struct flow_action_entry *act,
 	return 0;
 }
 
+static bool
+police_act_can_offload_jump(struct mlx5e_tc_act_parse_state *parse_state,
+			    const struct flow_action_entry *act,
+			    int act_index, u32 target)
+{
+	const struct flow_action *flow_action = parse_state->flow_action;
+	struct netlink_ext_ack *extack = parse_state->extack;
+	const struct flow_action_entry *prev, *entry;
+	u32 i;
+
+	if (act_index) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Jump is only supported when police is the first action");
+		return false;
+	}
+
+	if (!target || target >= flow_action->num_entries) {
+		NL_SET_ERR_MSG_MOD(extack, "Jump target must be a later action");
+		return false;
+	}
+
+	prev = act;
+	for (i = 1; i <= target; i++) {
+		entry = &flow_action->entries[i];
+
+		if (i < target &&
+		    ((entry->id != FLOW_ACTION_DROP &&
+		      entry->id != FLOW_ACTION_ACCEPT) ||
+		     entry->id != flow_action->entries[1].id)) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Jump can only skip actions that are all drop or all ok");
+			return false;
+		}
+
+		if (entry->id == prev->id && entry->hw_index == prev->hw_index) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Jump over the same action twice in a row is not supported");
+			return false;
+		}
+
+		prev = entry;
+	}
+
+	return true;
+}
+
 static bool
 tc_act_can_offload_police(struct mlx5e_tc_act_parse_state *parse_state,
 			  const struct flow_action_entry *act,
@@ -49,6 +95,16 @@ tc_act_can_offload_police(struct mlx5e_tc_act_parse_state *parse_state,
 	if (err)
 		return false;
 
+	if (act->police.exceed.act_id == FLOW_ACTION_JUMP &&
+	    !police_act_can_offload_jump(parse_state, act, act_index,
+					 act->police.exceed.extval))
+		return false;
+
+	if (act->police.notexceed.act_id == FLOW_ACTION_JUMP &&
+	    !police_act_can_offload_jump(parse_state, act, act_index,
+					 act->police.notexceed.extval))
+		return false;
+
 	return !!mlx5e_get_flow_meters(parse_state->flow->priv->mdev);
 }
 
@@ -94,13 +150,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
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

