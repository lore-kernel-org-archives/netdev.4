Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672905;
	b=IfvDIfmFezTLyFPmIC0zsO9oEzjlIwPOoDBrB/dixAUH6dkLcgHKOj8hK68kN2uYFW+8
	 ywjFq93c5CTjfMGMEOtZOMPBrtluh5I87/uBODLy/8bLCWksWQs1uHzce4+MeITC14Pzf
	 gz5OqENCXaJ+F+JMEHqwySjANbBZUGehR1p5+yb1Bi+ukIS5gG/V5YObrLMK1Un1TUxjN
	 ufqqy5y48cDIlJQLtRXXTkdqV1tgFzvSSrwCbi6iNicHC/VY1tHsc5v+l4WMT6eq/a6AG
	 1/fVLLZIGUqYYjJ4mefxdufcLm7nL3RISDyOVHu0PjAFzVQ6XSIYLAbQs6QNX1WM2zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Tdw6tOfePUcNF9igKST/4RFW0B4Z+3Y2sjNG8VT9/EA=;
	b=0ON3yhD7oKcjs/saho1KyoSwZwaNeeU2zOu2akFJezCI0lGlqVqx8SMONY7n8OizkIu/
	 pwIRByHpQaLJCijG/yoSGXGdi14K3WUUshXtnEMjqJjE6FQhFrXjnJmz6kYgqW6OJzEAw
	 gF079x6wldIrbfFDAzooTXNeLyJLRZP9RAlz/+0eoe43cwuT70412qEQheSplXjpvWMHt
	 gN0wZErVHgkQy20Q2+1c8F4P1GC1/DgJGDA7l8hjJvNaKjCKbYKzUbJ0ZDFOuyrW0oHqv
	 sK+NKa6VU21B6gSpyIG0mKJiSRirgS+Quz6eQBIw5/jAS4vqVpin+D8ErYcMUyu06vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srp8aSRl;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47984606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47984606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srp8aSRl
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab938dc83so2653417a12.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672904; x=1796277704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tdw6tOfePUcNF9igKST/4RFW0B4Z+3Y2sjNG8VT9/EA=;
        b=srp8aSRl7ODyHBbqYocyC2zjqZzvzY4TiPY8/AOizTArsoz1RbOUSKc5KmYIosuret
         8IknW8ipgUAryOeKEIHJ6Nt5s3EAcbKfnKbXkBCAMUsJDTg8NGKfvPBevNP4PsBPYfzv
         rkqfcO3LiAsrGi11UFmyCesXOFG0cjHonwCpNSdSH3vTbEK4Jg4lZ4SMIQIE3+Om6BcL
         iP+ISFux7Y31fa21W+ICnxMwpF0Z6hf6a7/XKuKyPI7Zr52awcSN2nXW0CYdI/yVb8eq
         SPYG7/pXcsVNghni/l6oRALqJSne3YCyBgTXu59lCD09c+b+VMaNN6gAKjAQtdvMcvmT
         xVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672904; x=1796277704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tdw6tOfePUcNF9igKST/4RFW0B4Z+3Y2sjNG8VT9/EA=;
        b=xpLG+1ebd9kLq/aYLJa6MFqkwbR3l+2A5GnZnsa8Gqzb4Mh/+9kGRdqCDm7n6Gp1QV
         PAEmkdGDahkRNHFFB+miLwYY0fuZX8QCtdEfG0c+SFcyUzEco5Ry3TgDLL9PXmmKNG3N
         y2lb/gDMZFRzCWMb1wfmVb/pTZcxhsai1GC40pe44I8Zz7II27lfwuAgwihepvG7/pn3
         AfSZ9PZ/DvIO8uzxMW0LXlK/Lmlp7mFAo7NpFzbs0LH/X5cvHthD8n4xx0jSEJlU7C0Y
         TrgpAp75+FIlfMqQ2IFiO67YIKdszqsRU46Z9CORsP5M39Onct+1ogIfGOxfOhoG693m
         Aupg==
X-Gm-Message-State: APuU4Z/4Y4+ElEgpe0ePIuJL9Y5qggpPunmzfULeC1YKbE6QPNYhPDH3
	0X8srXkzjj7cVAQTHeOb9NoXXx4+dre3BUs62j/l5gOgmd8qGcf05qqcECLkwuna
X-Gm-Gg: AZFdTZfHWX+tVY6o3inhKDvwZLHM96oB65fUicNaQA5BEibqb2UWW+EkMuHSfmYWSoi
	9NyFfpvCFhg5rmfQzhCn04TfIvlSfhUlPSCo2JTRYOoPAx4gRKxhhFRaXikPbBZJEdOxrbQdICx
	g+iV2dfnPONHNjUN8H7n99Cyv2nADiVdXGRGP+6nR4+TeSb6scnA4gG9IAE8123P/yST2gB98Gc
	HyhGcsLjg+5zJjkWu4d2b/KTAtgIHBUeFmgcTA8xjwEtJa2iUWd58tZbrGt0MW2VSb7pANlxxrg
	SeRL3uU1URRfW9qvEM0caaRC6iT8BlkOPz3KzxZ9wuZb9ezha1NenFF9mLbOPSqso8BlcAs60Gb
	L2uoY+L+XSK2vKU/yGixrig15Zj77zlBKIB8Brxs7WJiLc1Skcphm1RAxzc78BfUXKPxFh0Nb9F
	cWIuFiL1nnh/EWS0DuDYfSiXE+f3h2OcKzjCl5Bkj2vzMJLWCNpJLMx3rBvGf/TW9bVhruGOo5r
	gubw0eX/1eiSEAxwQ+++86WJd3HGst6jtjimTEBlmQ3WbUiGyVF2l1KoFfIETAase/hD6+A8nS4
	SGrk296yC4RqCTjeTT/JeqbrDdrhHwFYoJAp/iHBhT6/WowXBUJlmnY=
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19181141a91.65.1795672904319;
        Wed, 25 Nov 2026 22:01:44 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm3875036a91.4.2026.11.25.22.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:01:44 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: dsa: motorcomm: Add limited ACL flow statistics support
Date: Thu, 26 Nov 2026 14:01:24 +0800
Message-ID: <20261126060127.185631-1-mmyangfl@gmail.com>
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
and you must choose between byte mode and packet mode. Spend one only
when needed.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c |   1 +
 drivers/net/dsa/motorcomm/chip.h |   3 +
 drivers/net/dsa/motorcomm/tc.c   | 153 ++++++++++++++++++++++++++++++-
 drivers/net/dsa/motorcomm/tc.h   |  18 +++-
 4 files changed, 169 insertions(+), 6 deletions(-)

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
index e3f057ed580f..1d927a02e115 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -565,6 +565,11 @@ struct yt921x_acl_rule_ext {
 	struct yt921x_acl_rule r;
 
 	struct yt921x_marker marker;
+
+	/* try acquiring a counter */
+	bool stat_applicable:1;
+	/* must acquire a counter if applicable */
+	bool stat_required:1;
 };
 
 static int
@@ -1041,6 +1046,9 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	int res;
 
 	memset(action, 0, 3 * sizeof(*action));
+	ruleext->stat_applicable = false;
+	ruleext->stat_required = false;
+
 	flow_action_for_each(i, act, flow_action) {
 		/* The flow action entry carries no mirred control, so there
 		 * is no way to tell whether software would continue past a
@@ -1052,6 +1060,12 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			goto fallback;
 		}
 
+		if (act->hw_stats & FLOW_ACTION_HW_STATS_ANY) {
+			ruleext->stat_applicable = true;
+			ruleext->stat_required = act->hw_stats ==
+						 FLOW_ACTION_HW_STATS_IMMEDIATE;
+		}
+
 		switch (act->id) {
 		case FLOW_ACTION_ACCEPT:
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
@@ -1059,6 +1073,9 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			terminal = true;
 			break;
 		case FLOW_ACTION_DROP:
+			/* FLOWSTAT only counts passed frames */
+			ruleext->stat_applicable = false;
+
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
 				     YT921X_ACL_ACTc_FWD_REDIR;
 			terminal = true;
@@ -1136,6 +1153,7 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
 				     YT921X_ACL_ACTc_FWD_TRAP;
 			terminal = true;
+			redir = false;
 			break;
 		}
 
@@ -1143,7 +1161,21 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			break;
 	}
 
+	/* When frames are counted by software, a hardware counter would double
+	 * count those. Do not assign a counter when !skip_sw && !redir.
+	 */
+	if (ruleext->stat_applicable && !cls->common.skip_sw && !redir)
+		ruleext->stat_applicable = false;
+	/* Do not check on !skip_sw rules: we can't stop software from
+	 * installing them.
+	 */
+	if (ruleext->stat_applicable && cls->common.skip_sw &&
+	    !flow_action_hw_stats_check(flow_action, extack,
+					FLOW_ACTION_HW_STATS_IMMEDIATE_BIT))
+		return -EOPNOTSUPP;
+
 	ruleext->r.sw_assisted = !cls->common.skip_sw;
+
 	return 0;
 }
 
@@ -1208,6 +1240,9 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 	yt921x_acl_rule_set_ports(&ruleext->r, ord, BIT(port));
 	ruleext->r.tag = cls->cookie;
 	ruleext->r.type = TC_SETUP_CLSFLOWER;
+	/* Align with sja1105 */
+	ruleext->r.stat_pkt_mode = true;
+	ruleext->r.laststat = 0;
 	return 0;
 }
 
@@ -1281,6 +1316,45 @@ yt921x_acl_reserve(struct yt921x_priv *priv, unsigned int entscnt,
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
+			  jiffies, FLOW_ACTION_HW_STATS_IMMEDIATE);
+	return 0;
+}
+
 static int
 yt921x_acl_commit(struct yt921x_priv *priv, unsigned int entid, u8 entsmask)
 {
@@ -1413,9 +1487,13 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
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
@@ -1433,13 +1511,15 @@ yt921x_acl_add(struct yt921x_priv *priv,
 	unsigned int entscnt = hweight8(ruleext->r.mask);
 	struct yt921x_acl_rule *aclrule;
 	struct yt921x_acl_blk *aclblk;
-	bool use_trap = false;
+	bool stat_applicable;
 	unsigned int meterid;
+	unsigned int statid;
 	unsigned int binid;
 	unsigned int blkid;
 	unsigned int entid;
 	unsigned long m;
 	unsigned int o;
+	bool use_trap;
 	u32 ctrl;
 	int res;
 
@@ -1448,6 +1528,11 @@ yt921x_acl_add(struct yt921x_priv *priv,
 	if (entid == UINT_MAX)
 		return -EOPNOTSUPP;
 
+	stat_applicable = ruleext->stat_applicable;
+	use_trap = (ruleext->r.action[2] & YT921X_ACL_ACTc_FWD_EN) &&
+		   (FIELD_GET(YT921X_ACL_ACTc_FWD_M,
+			      ruleext->r.action[2]) == YT921X_ACL_ACTc_FWD_TRAP);
+
 	if (!(ruleext->r.action[0] & YT921X_ACL_ACTa_METER_EN)) {
 		meterid = YT921X_METER_NUM;
 	} else {
@@ -1459,6 +1544,7 @@ yt921x_acl_add(struct yt921x_priv *priv,
 			if (res)
 				return res;
 		} else if (ruleext->r.sw_assisted) {
+			stat_applicable = false;
 			use_trap = true;
 		} else {
 			NL_SET_ERR_MSG_MOD(extack,
@@ -1467,6 +1553,43 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		}
 	}
 
+	if (!stat_applicable) {
+		statid = YT921X_FLOWSTAT_NUM;
+	} else {
+		statid = find_first_zero_bit(priv->flowstats_map,
+					     YT921X_FLOWSTAT_NUM);
+		if (statid >= YT921X_FLOWSTAT_NUM) {
+			/* Do not refuse !skip_sw rules: we can't stop software
+			 * from installing them.
+			 */
+			if (!ruleext->r.sw_assisted && ruleext->stat_required) {
+				NL_SET_ERR_MSG_MOD(extack,
+						   "No more flowstats, but immediate HW stats requested");
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
@@ -1507,6 +1630,9 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		aclrule->action[0] |= YT921X_ACL_ACTa_METER_ID(meterid);
 	else
 		aclrule->action[0] &= ~YT921X_ACL_ACTa_METER_EN;
+	if (statid < YT921X_FLOWSTAT_NUM)
+		aclrule->action[0] |= YT921X_ACL_ACTa_FLOWSTAT_EN |
+				      YT921X_ACL_ACTa_FLOWSTAT_ID(statid);
 
 	/* Activate ACL if needed */
 	ctrl = 0;
@@ -1535,7 +1661,9 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		priv->ports[o].acl_cnt++;
 
 	if (meterid < YT921X_METER_NUM)
-		set_bit(meterid, priv->meters_map);
+		__set_bit(meterid, priv->meters_map);
+	if (statid < YT921X_FLOWSTAT_NUM)
+		__set_bit(statid, priv->flowstats_map);
 	priv->acl_masks[blkid] |= aclrule->mask;
 	return 0;
 
@@ -1548,6 +1676,21 @@ yt921x_acl_add(struct yt921x_priv *priv,
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

