Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835993;
	b=4S4l6NRHSJCUD0WcQGIhkWh0H9KNXYUVyPABB1xHWzd4evoE9jYXotc5suTr6S6zcBMi
	 79Iog3di/NKOIM1gWx8afC4ip/byFwJkb2q7W7zZ5KHH4+xeb/WtbhpU1aJV+o/CSW5us
	 wMemi+inXalrfwFNDjBpGFZGqcsV1YthN9oRLjuFE2io5g4ioaG3Lcyi0fh3/cck4rLMm
	 Znsaq58xOHOAyMycZoY8lDIjdP72iGThgE7QAr7+/9xSLR0V79IlOvrMcGtk3Gvmm/SlH
	 7cEjFqHtIKQO6eB1UCc0IFitcVLZwTZvCyCpMRH/KZc0/7i5qhT+a+UXH93SOCuFp8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nLgZaN3Fq6AI6iAYzST3TtqrKQDIaY/cSuYZF7HuDSM=;
	b=I00p2S7TDX7Y3U9jUzr+dL1qDVQva/cySUHz3y+8T4T3WAXYvvWTmSIBJvVGa+46DN6Z
	 lzoVABHGhkxwiaqLX9+MXbk3cgZtVs2edX1i/mJXAHeshnIbH+GOuc62pBn5GR9Nq0b2L
	 IG7b9ua3MTGHuRWDQGYmu8AyscRUixr4H/6APhX9HN6FZQGyoNd9dejpsRuM/EwAyUqrl
	 QYLrl1uhESVbl1G5qxLcx2N3bKRidh4zLJshHt3jpflvX8NWJ62LdTiCLdqilrFH7OOwl
	 pHBrZesGUmnbN/NrKKh0yuvfRmdszFHFQy1Gksoxmao1WCL2+flQyNoHQufdvySQd5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RBqxpSCy;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2B6606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RBqxpSCy
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so3624674a12.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795835992; x=1796440792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLgZaN3Fq6AI6iAYzST3TtqrKQDIaY/cSuYZF7HuDSM=;
        b=RBqxpSCy4apWpmq5b0Hhry5iF16XIpNqK9JKO+PAvkZq+yiUss33FV/+DsCrFBoFyo
         r6iS/nc5+UORImWIEOBzV+aUlYBF72BRCyno3lK6HsF2oKq0TyNkXBtu08Vq6uQgE48v
         VgoQBt8Qk+L5RIXFov5G0zbn+HdOaNBb0GSGDA7gpBwbEKY+N603e1ryvdKOvZYcVpIc
         8t6pXs4qVB0D4Nxqr0bwqA2JjuKBf/ZFSrA8fjs6+Mhl5qFE8/Qn3jG+F4YORtGDJGRS
         GUuqpOjQVgIXxMct99CKxLfb4SOKEWPldzTFBjoXBIFJJ1w1bdt0yjanUzvausB/9cZI
         KHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795835992; x=1796440792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLgZaN3Fq6AI6iAYzST3TtqrKQDIaY/cSuYZF7HuDSM=;
        b=p8Bo5xYAoSwhAGEA51OS7DCwIvqpdOW7bWWKGWcCiRlQuyCDtt/2vemJPXM3/qIyPs
         D12lP1ZQJN/GvOL6X8l7zoZQp+UJknsCSRdRBkp3dR9XNSh1FKAnt18x3cmpojmpSBjC
         XkYr0Ay6qOPT2Vv9AhogYlf8iJKY+uoDdrJar+L1dM8GHBQvI+d/rQHAonGOujewY9rQ
         /NfY+bNJsZHgJJNvjM2jporphXYelXy8y5qmQTaVZ+usRwSEGe82BTOrbm95ZKcaV/1h
         mphzjCF8dxJOfkBQd1JhnTBoRu7YzPpvq2auZs66bGCOq77CG2aogb/9s+wl3+myR9hY
         n20w==
X-Gm-Message-State: APuU4Z9pj3tG4V8MPdi7KrKctHiFTdDjX6gXsCche+4fM8mqHSAchHz8
	ndDAYBNnqgxREf8RA/KWbZVm3vF20FcDjHAvj5kQARRweCQezItjfZAc7iF4JQ==
X-Gm-Gg: AZFdTZfb7E+7ICFn9d762XaOHm3rgy258aemR1Lpo6SiP6Cjunc3tE0XJO6icwhPGnS
	IExldhn7bgQWU6a0dIcgmVeykdc2vpzSDWXy+p1/mhDM/hYkbmB5AUrJbMRh42TutoJDK5+xq3H
	xRGml3bDvErjlRyBEUsU7DCqK/5C3kgzBJzXQeJhpf67cNfiYvVdB0gH4Hy9xSBaJnsxudsHvWm
	9i+vAPpvlfkO7DNhYWQ+IOFyYbIZ+65vRObsgs771kh+fX5JvsU32Zp5t8MAnrshJ7Dm3WGReJu
	fcHzoaXUW9ZosGk45jImnw0Vv8cQGZ6AeDDUqODZ3GL9aZn8JKVhy70KkWvJw353/oJ/5XvUfp/
	rmGcC9ohtRiOZMXovid2wkHAso8VA6+fRbyUqHehX8wjQh65i5NBsJppqm9X8jxnHVWNKapcpql
	EE3baycYm987QgTy6wRBFJRrKo45AfxndIWCetiBPBkt4+m2JXFiKEtYIwUPv+uWu7CRZwAB7rH
	mWOq/ifSe4PQpaqmxrw3GXxeh/m+bn++yay0zjjvEJfayzEznPYMfpw7qsEw5I13YQgIF3FiaEC
	T9liZS33Q44o2skkWyW9qioYpRvDWeVS6r2EkNwNpsVcLkbhnS0AUzj3sZvVnoR6w/OD
X-Received: by 2002:a17:90b:4c12:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b41c95408emr25243348a91.42.1795835992391;
        Fri, 27 Nov 2026 19:19:52 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.247.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm19458601a91.3.2026.11.27.19.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:19:51 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2] net: dsa: motorcomm: Add limited ACL flow statistics support
Date: Sat, 28 Nov 2026 11:19:03 +0800
Message-ID: <20261128031905.1355254-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The hardware supports flow statistics, which might be used to implement
.cls_flower_stats(). However, the number of flow counters is limited,
and you must choose between byte and packet mode. Spend one only
when needed. Let the counters here run in packet mode but keep the code
for byte mode, in case you want to change your mind or a new API is
available later.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2:
 - do not assign counter for police rules
 - reject explicit delay request
 - update lastused only when the counter changes
v1: https://lore.kernel.org/r/20261126060127.185631-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c |   1 +
 drivers/net/dsa/motorcomm/chip.h |   3 +
 drivers/net/dsa/motorcomm/tc.c   | 157 ++++++++++++++++++++++++++++++-
 drivers/net/dsa/motorcomm/tc.h   |  18 +++-
 4 files changed, 174 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a21d4bb5e141..1281396941e5 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2629,6 +2629,7 @@ static const struct dsa_switch_ops yt921x_dsa_switch_ops = {
 	.port_policer_add	= yt921x_dsa_port_policer_add,
 	.port_setup_tc		= yt921x_dsa_port_setup_tc,
 	/* acl */
+	.cls_flower_stats	= yt921x_dsa_cls_flower_stats,
 	.cls_flower_del		= yt921x_dsa_cls_flower_del,
 	.cls_flower_add		= yt921x_dsa_cls_flower_add,
 	/* hsr */
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index fc315f1d8f87..fe6cf03a09c8 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -424,6 +424,8 @@ enum yt921x_fdb_entry_status {
 /* Custom meters only, not including dedicated port meters (11) */
 #define YT921X_METER_NUM	64
 
+#define YT921X_FLOWSTAT_NUM	64
+
 #define YT921X_LAG_NUM		2
 #define YT921X_LAG_PORT_NUM	4
 
@@ -527,6 +529,7 @@ struct yt921x_priv {
 	u16 eee_ports_mask;
 
 	DECLARE_BITMAP(meters_map, YT921X_METER_NUM);
+	DECLARE_BITMAP(flowstats_map, YT921X_FLOWSTAT_NUM);
 
 	u8 acl_masks[YT921X_ACL_BLK_NUM];
 	struct yt921x_acl_blk *acl_blks[YT921X_ACL_BLK_NUM];
diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index e3f057ed580f..04793a8154b2 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -565,6 +565,11 @@ struct yt921x_acl_rule_ext {
 	struct yt921x_acl_rule r;
 
 	struct yt921x_marker marker;
+
+	/* acquire a counter if possible */
+	bool stat_applicable:1;
+	/* must acquire a counter if applicable */
+	bool stat_required:1;
 };
 
 static int
@@ -1034,6 +1039,7 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	u32 *action = ruleext->r.action;
 	bool seen_priority = false;
 	bool seen_police = false;
+	bool stat_veto = false;
 	bool terminal = false;
 	bool redir = false;
 	const char *reason;
@@ -1041,6 +1047,9 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	int res;
 
 	memset(action, 0, 3 * sizeof(*action));
+	ruleext->stat_applicable = false;
+	ruleext->stat_required = false;
+
 	flow_action_for_each(i, act, flow_action) {
 		/* The flow action entry carries no mirred control, so there
 		 * is no way to tell whether software would continue past a
@@ -1052,6 +1061,12 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			goto fallback;
 		}
 
+		if (act->hw_stats & FLOW_ACTION_HW_STATS_ANY) {
+			ruleext->stat_applicable = true;
+			ruleext->stat_required |= act->hw_stats !=
+						  FLOW_ACTION_HW_STATS_ANY;
+		}
+
 		switch (act->id) {
 		case FLOW_ACTION_ACCEPT:
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
@@ -1059,6 +1074,9 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			terminal = true;
 			break;
 		case FLOW_ACTION_DROP:
+			/* FLOWSTAT only counts passed frames */
+			stat_veto = true;
+
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
 				     YT921X_ACL_ACTc_FWD_REDIR;
 			terminal = true;
@@ -1117,6 +1135,9 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			if (res)
 				return res;
 
+			/* Meter may drop the exceeded frames */
+			stat_veto = true;
+
 			action[0] |= YT921X_ACL_ACTa_METER_EN;
 			break;
 		}
@@ -1136,6 +1157,7 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
 				     YT921X_ACL_ACTc_FWD_TRAP;
 			terminal = true;
+			redir = false;
 			break;
 		}
 
@@ -1143,7 +1165,30 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			break;
 	}
 
+	/* Software counts frames for !skip_sw rules; a hardware counter would
+	 * double count those. Do not assign a counter if the frames may flow to
+	 * CPU.
+	 */
+	if (!cls->common.skip_sw && !redir)
+		stat_veto = true;
+	if (stat_veto)
+		ruleext->stat_applicable = false;
+	/* Do not check on !skip_sw rules: we can't stop software from
+	 * installing them.
+	 */
+	if (cls->common.skip_sw && ruleext->stat_required) {
+		if (!ruleext->stat_applicable) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "HW stats not available for rules that may drop frames");
+			return -EOPNOTSUPP;
+		}
+		if (!flow_action_hw_stats_check(flow_action, extack,
+						FLOW_ACTION_HW_STATS_IMMEDIATE_BIT))
+			return -EOPNOTSUPP;
+	}
+
 	ruleext->r.sw_assisted = !cls->common.skip_sw;
+
 	return 0;
 }
 
@@ -1208,6 +1253,9 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 	yt921x_acl_rule_set_ports(&ruleext->r, ord, BIT(port));
 	ruleext->r.tag = cls->cookie;
 	ruleext->r.type = TC_SETUP_CLSFLOWER;
+	/* Align with sja1105 */
+	ruleext->r.stat_pkt_mode = true;
+	ruleext->r.laststat = 0;
 	return 0;
 }
 
@@ -1281,6 +1329,45 @@ yt921x_acl_reserve(struct yt921x_priv *priv, unsigned int entscnt,
 	return UINT_MAX;
 }
 
+static int
+yt921x_acl_stat(struct yt921x_priv *priv, enum tc_setup_type type,
+		unsigned long tag, u16 ports_mask, struct flow_stats *stats)
+{
+	struct yt921x_acl_rule *aclrule;
+	const struct yt921x_acl_blk *aclblk;
+	unsigned int statid;
+	unsigned int binid;
+	unsigned int blkid;
+	unsigned int entid;
+	u64 diff;
+	u64 stat;
+	int res;
+
+	entid = yt921x_acl_find(priv, type, tag, ports_mask);
+	if (entid == UINT_MAX)
+		return -ENOENT;
+
+	blkid = entid / YT921X_ACL_ENT_PER_BLK;
+	binid = entid % YT921X_ACL_ENT_PER_BLK;
+	aclblk = priv->acl_blks[blkid];
+	aclrule = aclblk->rules[binid];
+
+	if (!(aclrule->action[0] & YT921X_ACL_ACTa_FLOWSTAT_EN))
+		return -EOPNOTSUPP;
+
+	statid = FIELD_GET(YT921X_ACL_ACTa_FLOWSTAT_ID_M, aclrule->action[0]);
+	res = yt921x_counter_read(priv, YT921X_FLOWSTATn_STAT(statid), &stat);
+	if (res)
+		return res;
+
+	diff = stat - aclrule->laststat;
+	aclrule->laststat = stat;
+	flow_stats_update(stats, aclrule->stat_pkt_mode ? 0 : diff,
+			  !aclrule->stat_pkt_mode ? 0 : diff, 0,
+			  diff ? jiffies : 0, FLOW_ACTION_HW_STATS_IMMEDIATE);
+	return 0;
+}
+
 static int
 yt921x_acl_commit(struct yt921x_priv *priv, unsigned int entid, u8 entsmask)
 {
@@ -1413,9 +1500,13 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 	}
 
 	if (aclrule->action[0] & YT921X_ACL_ACTa_METER_EN)
-		clear_bit(FIELD_GET(YT921X_ACL_ACTa_METER_ID_M,
-				    aclrule->action[0]),
-			  priv->meters_map);
+		__clear_bit(FIELD_GET(YT921X_ACL_ACTa_METER_ID_M,
+				      aclrule->action[0]),
+			    priv->meters_map);
+	if (aclrule->action[0] & YT921X_ACL_ACTa_FLOWSTAT_EN)
+		__clear_bit(FIELD_GET(YT921X_ACL_ACTa_FLOWSTAT_ID_M,
+				      aclrule->action[0]),
+			    priv->flowstats_map);
 	priv->acl_masks[blkid] &= ~aclrule->mask;
 	kvfree(aclrule);
 	if (!priv->acl_masks[blkid]) {
@@ -1435,6 +1526,7 @@ yt921x_acl_add(struct yt921x_priv *priv,
 	struct yt921x_acl_blk *aclblk;
 	bool use_trap = false;
 	unsigned int meterid;
+	unsigned int statid;
 	unsigned int binid;
 	unsigned int blkid;
 	unsigned int entid;
@@ -1467,6 +1559,43 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		}
 	}
 
+	if (!ruleext->stat_applicable) {
+		statid = YT921X_FLOWSTAT_NUM;
+	} else {
+		statid = find_first_zero_bit(priv->flowstats_map,
+					     YT921X_FLOWSTAT_NUM);
+		if (statid >= YT921X_FLOWSTAT_NUM) {
+			/* Do not refuse !skip_sw rules: we can't stop software
+			 * from installing them.
+			 */
+			if (ruleext->stat_required && !ruleext->r.sw_assisted) {
+				NL_SET_ERR_MSG_MOD(extack,
+						   "No more flowstats, but HW stats requested");
+				return -EOPNOTSUPP;
+			}
+			NL_SET_ERR_MSG_MOD(extack,
+					   "No more flowstats, HW stats disabled");
+		} else {
+			u32 zeros[2] = {};
+
+			ctrl = YT921X_FLOWSTAT_CTRL_TYPE_FLOW |
+			       YT921X_FLOWSTAT_CTRL_EN;
+			if (ruleext->r.stat_pkt_mode)
+				ctrl |= YT921X_FLOWSTAT_CTRL_PKT_MODE;
+			res = yt921x_reg_write(priv,
+					       YT921X_FLOWSTATn_CTRL(statid),
+					       ctrl);
+			if (res)
+				return res;
+
+			res = yt921x_reg64_write(priv,
+						 YT921X_FLOWSTATn_STAT(statid),
+						 zeros);
+			if (res)
+				return res;
+		}
+	}
+
 	/* Prepare acl block ctrlblk */
 	blkid = entid / YT921X_ACL_ENT_PER_BLK;
 	binid = entid % YT921X_ACL_ENT_PER_BLK;
@@ -1507,6 +1636,9 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		aclrule->action[0] |= YT921X_ACL_ACTa_METER_ID(meterid);
 	else
 		aclrule->action[0] &= ~YT921X_ACL_ACTa_METER_EN;
+	if (statid < YT921X_FLOWSTAT_NUM)
+		aclrule->action[0] |= YT921X_ACL_ACTa_FLOWSTAT_EN |
+				      YT921X_ACL_ACTa_FLOWSTAT_ID(statid);
 
 	/* Activate ACL if needed */
 	ctrl = 0;
@@ -1535,7 +1667,9 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		priv->ports[o].acl_cnt++;
 
 	if (meterid < YT921X_METER_NUM)
-		set_bit(meterid, priv->meters_map);
+		__set_bit(meterid, priv->meters_map);
+	if (statid < YT921X_FLOWSTAT_NUM)
+		__set_bit(statid, priv->flowstats_map);
 	priv->acl_masks[blkid] |= aclrule->mask;
 	return 0;
 
@@ -1548,6 +1682,21 @@ yt921x_acl_add(struct yt921x_priv *priv,
 	return res;
 }
 
+int
+yt921x_dsa_cls_flower_stats(struct dsa_switch *ds, int port,
+			    struct flow_cls_offload *cls, bool ingress)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	int res;
+
+	mutex_lock(&priv->reg_lock);
+	res = yt921x_acl_stat(priv, TC_SETUP_CLSFLOWER, cls->cookie,
+			      BIT(port), &cls->stats);
+	mutex_unlock(&priv->reg_lock);
+
+	return res;
+}
+
 int
 yt921x_dsa_cls_flower_del(struct dsa_switch *ds, int port,
 			  struct flow_cls_offload *cls, bool ingress)
diff --git a/drivers/net/dsa/motorcomm/tc.h b/drivers/net/dsa/motorcomm/tc.h
index cc53f148d690..9e50285d66f6 100644
--- a/drivers/net/dsa/motorcomm/tc.h
+++ b/drivers/net/dsa/motorcomm/tc.h
@@ -299,6 +299,16 @@ enum yt921x_udf_type {
 #define  YT921X_METER_CTRLa_EIR_M		GENMASK(17, 0)
 #define   YT921X_METER_CTRLa_EIR(x)			FIELD_PREP(YT921X_METER_CTRLa_EIR_M, (x))
 #define YT921X_METERn_STAT(x)		(0x221000 + 8 * (x))
+#define YT921X_FLOWSTATn_STAT(x)	(0x221400 + 8 * (x))
+#define YT921X_FLOWSTATn_CTRL(x)	(0x221c00 + 4 * (x))
+#define  YT921X_FLOWSTAT_CTRL_EN		BIT(3)
+#define  YT921X_FLOWSTAT_CTRL_PKT_MODE		BIT(2)	/* 0: byte mode */
+#define  YT921X_FLOWSTAT_CTRL_TYPE_M		GENMASK(1, 0)
+#define   YT921X_FLOWSTAT_CTRL_TYPE(x)			FIELD_PREP(YT921X_FLOWSTAT_CTRL_TYPE_M, (x))
+#define   YT921X_FLOWSTAT_CTRL_TYPE_FLOW		YT921X_FLOWSTAT_CTRL_TYPE(0)
+#define   YT921X_FLOWSTAT_CTRL_TYPE_CPU_CODE		YT921X_FLOWSTAT_CTRL_TYPE(1)
+#define   YT921X_FLOWSTAT_CTRL_TYPE_DROP_CODE		YT921X_FLOWSTAT_CTRL_TYPE(2)
+#define   YT921X_FLOWSTAT_CTRL_TYPE_PORT		YT921X_FLOWSTAT_CTRL_TYPE(3)
 
 #define YT921X_MIRROR			0x300300
 #define  YT921X_MIRROR_IGR_PORTS_M		GENMASK(26, 16)
@@ -349,7 +359,10 @@ struct yt921x_acl_rule {
 	enum tc_setup_type type;
 
 	u32 action[3];
-	bool sw_assisted;
+	u64 laststat;
+
+	bool sw_assisted:1;
+	bool stat_pkt_mode:1;
 
 	u8 mask;
 	struct yt921x_acl_entry entries[YT921X_ACL_ENT_PER_BLK];
@@ -368,6 +381,9 @@ int
 yt921x_dsa_port_setup_tc(struct dsa_switch *ds, int port,
 			 enum tc_setup_type type, void *type_data);
 int
+yt921x_dsa_cls_flower_stats(struct dsa_switch *ds, int port,
+			    struct flow_cls_offload *cls, bool ingress);
+int
 yt921x_dsa_cls_flower_del(struct dsa_switch *ds, int port,
 			  struct flow_cls_offload *cls, bool ingress);
 int
-- 
2.53.0

