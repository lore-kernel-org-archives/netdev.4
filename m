Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014335;
	b=PbozC7k+iuU/dSu0IMw79F2zoJFrgIBT7OtuHem4dAI5D/X0ZCLdcSPN1iJEqaXB0jnl
	 +3qxBNOMCmnlVHPGR5EGwxu4TEW6AonTLeXzmlEL4yy9mOBJsFsi4xpvQOOSZ+cG1ZM5U
	 YEgyvnHgIvgFKxkUqk7y/kb/rRc+C9oa9z8bfcb9ruSqLq3ywrnqPStI0Rk1YqKmp3rT+
	 lznnTZ6mD0rH+f9WlwgAz2orkNNckTdAY9zjhwIoXvFG0BGswFiu36FVEbkRd6Lqm77Ej
	 qTInIfragUaTP8WeGeKY8G0XFHpChJ/T3zbrA4tVPrPFKU4WzNOwAwNAiNlApXvTc8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014335;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=pdt9h4JULsDeQNO3K+BJDH8P2gIrEkp4ggPWsuT7nfk=;
	b=MCl42h9T41Qffu5uSnZiZ8wJKfMdyPPxEt9t2IXMv9lfI43uaOCNx2eYPo/XCXHpIQrm
	 JDu/hSedebXRI8W2E0V41Rp2Y629Em3+XzIdhqKxdZw36DWfNmqSekL4fm1aoIYx3n17H
	 5E13LBXFheS0h+Bqwu2+sUNJBOS/aMhpVIij9a1v7qKotynTZHgjU3yPvIbOiPMetsJC4
	 jgkB0+7DfpY/fLQJtir2QZUsHxW9NyTeQtnHxTsYwmyp+Ha7upsL1NtLHR+h40kUl/ax3
	 ZvvH9uvsqLRAZcgE1TRmWgOfz013TBU5nag5iyvJbMFYPES/hWn4Kd88RgZ6cLckRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xgXi0vka;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69471606A330
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69471606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xgXi0vka
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF2101A16DA;
	Wed, 18 Nov 2026 15:05:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B61835FE9B;
	Wed, 18 Nov 2026 15:05:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD98311BC21E2;
	Wed, 18 Nov 2026 16:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795014330; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdt9h4JULsDeQNO3K+BJDH8P2gIrEkp4ggPWsuT7nfk=;
	b=xgXi0vkaYPm8s0LF/I2R+YchK8ivHgh6d008EZP9AmTALpxcG4WDNctH0d4VfS40ceoHIk
	fOzBtHTtXzj4elH6xMvWz7ZDYFTfM+xHnIb+7Nfave4b0lLUNOuqQIb8RfbJoCImcDEA0o
	yf+T8TWHs7AIvpHzQqrJKK0fJys+WcEvBneuQ+l1GhU62qbrPC7wc/ZLlikLS9EBM6GgZb
	2XeUmrhd9VSQkXUpEkxen4SOT3isjMB45Yit9MC57regfJc2lRbYENcmuxOZp6QTpIHaRm
	FKh8QK9oMN83f83HfATzuIHqZAkyrpKVAiYpM+HUzmoABulG4xC7IlupYKpYkA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Michal Kubecek <mkubecek@suse.cz>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH ethtool-next 1/2] update UAPI header copies
Date: Wed, 18 Nov 2026 16:05:21 +0100
Message-ID: <20261118150523.2762733-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118150523.2762733-1-maxime.chevallier@bootlin.com>
References: <20261118150523.2762733-1-maxime.chevallier@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Update to kernel commit d6816d9a93b6.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 uapi/linux/ethtool.h                   |  2 ++
 uapi/linux/ethtool_netlink_generated.h | 22 ++++++++++++++++++++++
 uapi/linux/if_addr.h                   |  1 +
 uapi/linux/if_link.h                   |  1 +
 uapi/linux/netlink.h                   | 14 ++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/uapi/linux/ethtool.h b/uapi/linux/ethtool.h
index c2afca5..2f8f90a 100644
--- a/uapi/linux/ethtool.h
+++ b/uapi/linux/ethtool.h
@@ -685,6 +685,7 @@ enum ethtool_link_ext_substate_module {
  * @ETH_SS_STATS_RMON: names of RMON statistics
  * @ETH_SS_STATS_PHY: names of PHY(dev) statistics
  * @ETH_SS_TS_FLAGS: hardware timestamping flags
+ * @ETH_SS_PHY_INTERFACES: names of MAC to PHY interfaces
  *
  * @ETH_SS_COUNT: number of defined string sets
  */
@@ -712,6 +713,7 @@ enum ethtool_stringset {
 	ETH_SS_STATS_RMON,
 	ETH_SS_STATS_PHY,
 	ETH_SS_TS_FLAGS,
+	ETH_SS_PHY_INTERFACES,
 
 	/* add new constants above here */
 	ETH_SS_COUNT
diff --git a/uapi/linux/ethtool_netlink_generated.h b/uapi/linux/ethtool_netlink_generated.h
index 572c5f9..dff1741 100644
--- a/uapi/linux/ethtool_netlink_generated.h
+++ b/uapi/linux/ethtool_netlink_generated.h
@@ -78,6 +78,14 @@ enum ethtool_pse_event {
 	ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR = 64,
 };
 
+/*
+ * type of physical connector
+ */
+enum ethtool_port_type {
+	ETHTOOL_PORT_TYPE_MDI,
+	ETHTOOL_PORT_TYPE_SFP,
+};
+
 enum {
 	ETHTOOL_A_HEADER_UNSPEC,
 	ETHTOOL_A_HEADER_DEV_INDEX,
@@ -840,6 +848,18 @@ enum {
 	ETHTOOL_A_MSE_MAX = (__ETHTOOL_A_MSE_CNT - 1)
 };
 
+enum {
+	ETHTOOL_A_PORT_HEADER = 1,
+	ETHTOOL_A_PORT_ID,
+	ETHTOOL_A_PORT_SUPPORTED_MODES,
+	ETHTOOL_A_PORT_SUPPORTED_INTERFACES,
+	ETHTOOL_A_PORT_TYPE,
+	ETHTOOL_A_PORT_UPSTREAM_PORT,
+
+	__ETHTOOL_A_PORT_CNT,
+	ETHTOOL_A_PORT_MAX = (__ETHTOOL_A_PORT_CNT - 1)
+};
+
 enum {
 	ETHTOOL_MSG_USER_NONE = 0,
 	ETHTOOL_MSG_STRSET_GET = 1,
@@ -893,6 +913,7 @@ enum {
 	ETHTOOL_MSG_RSS_CREATE_ACT,
 	ETHTOOL_MSG_RSS_DELETE_ACT,
 	ETHTOOL_MSG_MSE_GET,
+	ETHTOOL_MSG_PORT_GET,
 
 	__ETHTOOL_MSG_USER_CNT,
 	ETHTOOL_MSG_USER_MAX = (__ETHTOOL_MSG_USER_CNT - 1)
@@ -954,6 +975,7 @@ enum {
 	ETHTOOL_MSG_RSS_CREATE_NTF,
 	ETHTOOL_MSG_RSS_DELETE_NTF,
 	ETHTOOL_MSG_MSE_GET_REPLY,
+	ETHTOOL_MSG_PORT_GET_REPLY,
 
 	__ETHTOOL_MSG_KERNEL_CNT,
 	ETHTOOL_MSG_KERNEL_MAX = (__ETHTOOL_MSG_KERNEL_CNT - 1)
diff --git a/uapi/linux/if_addr.h b/uapi/linux/if_addr.h
index 5a28b95..aa30ef5 100644
--- a/uapi/linux/if_addr.h
+++ b/uapi/linux/if_addr.h
@@ -57,6 +57,7 @@ enum {
 #define IFA_F_NOPREFIXROUTE	0x200
 #define IFA_F_MCAUTOJOIN	0x400
 #define IFA_F_STABLE_PRIVACY	0x800
+#define IFA_F_GLOBAL		0x1000
 
 struct ifa_cacheinfo {
 	__u32	ifa_prefered;
diff --git a/uapi/linux/if_link.h b/uapi/linux/if_link.h
index d3a21fb..7ce01d8 100644
--- a/uapi/linux/if_link.h
+++ b/uapi/linux/if_link.h
@@ -381,6 +381,7 @@ enum {
 	IFLA_NETNS_IMMUTABLE,
 	IFLA_HEADROOM,
 	IFLA_TAILROOM,
+	IFLA_PACING_OFFLOAD,
 	__IFLA_MAX
 };
 
diff --git a/uapi/linux/netlink.h b/uapi/linux/netlink.h
index ff64eb1..792a915 100644
--- a/uapi/linux/netlink.h
+++ b/uapi/linux/netlink.h
@@ -325,6 +325,17 @@ enum netlink_attribute_type {
 	NL_ATTR_TYPE_UINT,
 };
 
+/**
+ * enum netlink_policy_byte_order - byte order of an integer attribute
+ * @NL_POLICY_BYTE_ORDER_BIG_ENDIAN: big endian (network byte order)
+ *
+ * Zero is left unassigned so that it keeps meaning host byte order,
+ * which is also what a missing byte order means.
+ */
+enum netlink_policy_byte_order {
+	NL_POLICY_BYTE_ORDER_BIG_ENDIAN = 1,
+};
+
 /**
  * enum netlink_policy_type_attr - policy type attributes
  * @NL_POLICY_TYPE_ATTR_UNSPEC: unused
@@ -352,6 +363,8 @@ enum netlink_attribute_type {
  *	bitfield32 type (U32)
  * @NL_POLICY_TYPE_ATTR_MASK: mask of valid bits for unsigned integers (U64)
  * @NL_POLICY_TYPE_ATTR_PAD: pad attribute for 64-bit alignment
+ * @NL_POLICY_TYPE_ATTR_BYTE_ORDER: byte order of an integer attribute,
+ *	&enum netlink_policy_byte_order, absent if host byte order (U32)
  *
  * @__NL_POLICY_TYPE_ATTR_MAX: number of attributes
  * @NL_POLICY_TYPE_ATTR_MAX: highest attribute number
@@ -370,6 +383,7 @@ enum netlink_policy_type_attr {
 	NL_POLICY_TYPE_ATTR_BITFIELD32_MASK,
 	NL_POLICY_TYPE_ATTR_PAD,
 	NL_POLICY_TYPE_ATTR_MASK,
+	NL_POLICY_TYPE_ATTR_BYTE_ORDER,
 
 	/* keep last */
 	__NL_POLICY_TYPE_ATTR_MAX,
-- 
2.56.1

