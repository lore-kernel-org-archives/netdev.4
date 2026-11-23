Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428661;
	b=lgvZ5tXTK6V/emPXlJV1vwbdEVtB26QehhDOGu/FxASZ+NbdWYXQRxivmv9ltDExHWvm
	 JocrhArieuTU+USBoa1lqyjK+pSPJH+uUV9zDFxO9w4nSVNCRqLpWAJw/Erw4pAKHwcXz
	 2lhl6NsW7kMQkP+fcQwHV+/D8QgOAsnWuzdtGnvxIR5dmrffForIB7/fIGt5LaQdAbIlb
	 VIhGXpxwXjHAAFCpht0pH49wj7dzFnHkd2guFmdyVaXts9OntcKMssPms2a91NUvUIeHO
	 BSsHwp2N2XmfmLIfzOw4ZMl1EoE9upMk/ovIXFpGfFOqon2kWtuPwP6O9MgXcBp3L1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428661;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=RHPU8/Tfe+c8s412VXWtbCKjkucN1sivPhqX31cMGSo=;
	b=Y44k5HE55OchWoqh+IH6OCqImpnpzysLPHWSelL8ad+Tyfcnb/krvfpHriqCzgMVT6g1
	 XrAADmn1JmWI5GmTQfgHZzF8EU1XuROwL4zXg0INBKaLyIJXkVWlNTeVqkAParnWe8bi+
	 6uVYIeYGHVrNs0Z8cSwuHrxGounlXNFRh2XBlDB4qnxja+Mu+l3i4EE3EGQXxwGxd8scf
	 FIgshbfXtDeRFc+p0EIhxkPtjhvo2fSh+UYb5JLS0Gpd+LLU7+f0GDF0pr4xWoHHwwlcg
	 2zdpv72E+AesSUrwU65TZ6fTHW04iyUh/Q+xLumT3GGU+Gu3TyQ5neVWpHSn6pXxblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HxUjuEv2;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235A606A33C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3235A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HxUjuEv2
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1595235a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428659; x=1796033459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHPU8/Tfe+c8s412VXWtbCKjkucN1sivPhqX31cMGSo=;
        b=ksf7ebo2SQc0LGxMM8gXaiQlLAot3Xq+YJTsokAEa/8r9n47+/asBcxrI6cwvsIITI
         8Zvr4dzXNf/Afy0pICbaayUfZfd5NHSBIiwmf3IKuebUfgFNoQ4iIUHqT/95oKmUYDbJ
         Z9h5TzCvdV1qcF5O1PJIClzs9VThM9mf6cHurVbLN2ePNKZlYy5BctWxX2feo/N60rFF
         RzbUAjfJLUEfHc2dg07ScjElVNCqkRxaYVaVGVg4KmCbwlM3Jcs3J6sBtnvAqNVFOqiW
         MvCr6SuwFO56UcOx9VIT8EDLnHAHDQ29ppnYGYXNDktXSa3z8O3PHMKyc90nJd+FisVC
         TAyw==
X-Gm-Message-State: APuU4Z/5ykqZPWFLAhN8QOqpIszsvpr2Q/y01jtSUpsLKPs3KFIuM4dg
	k6ua/DCvl5pP6lyPphXqXSFsEdvwMXToyX88qeVs3BOkeJsf3J+fcrrvR3wzhA197iQHKb2O9PP
	4UQvGtagSm3IPO8SJSMnEM1a66nyZ5tRdSeM98LDgH6+T7oJAp1yU97OYUSOOLvoMUO9zkdxBxf
	nhuiMr76iuNnPM55UoMCkHu35FMGNnIMJyUU/svTfC0fDqZW9prQuj324pWRs6yVuKhctoVj6iK
	h2QRAPfKA==
X-Gm-Gg: AZFdTZe49PajB0EVyvtlpwPeHD3f2m6cJiD2zWJAX9EqpQsE1uKcMbRSwZELR4f++b+
	yRoxMrCtl5O5E4LrJ+CSkxo2xgtcQtXLW5X9SQE3tijB/VDbCKltuVuOCL8y7aIi0G1O+hOmHqn
	PaqCGxFBC729KSDGy0+tb6KfAZLW6MdH2jcfaXwbEPDu5fTobI1jTmFAXiMwGHlFbMux71qfMtm
	CPsGkxGSPlG+tPhPFHk086yDyN/MF/jRi+GCv3DlaUXAR/qQtJVmCevjtnxjMkuqJEtcDPETo2o
	Wps+OjDoqd06qyEuPw0f4zHnjdCWkvP+vnT3E4escdS4FUuElnV8/BcFiRZlyU5AyVB2GcZVrrY
	wddsu0JjEoGMIaBS+1lUw+FnuQOz029/MNprfbaOY+HrO0cE5XroUSj5ty1iCr2GgsR2qD53mEn
	nsqIAHlsWLxhw/BaOwS8fNL9bTHAdDaibCFNhN
X-Received: by 2002:a17:90b:442d:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b41c982edbmr6556183a91.43.1795428659300;
        Mon, 23 Nov 2026 02:10:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm7842985a91.3.2026.11.23.02.10.58
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:10:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869accaac2so1584210eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428658; x=1796033458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHPU8/Tfe+c8s412VXWtbCKjkucN1sivPhqX31cMGSo=;
        b=HxUjuEv2/n75Jbu0u1/hDKgo0rEiWUCID4ZM1MJDZ1YDFXzGrlAmE5m3QBfEJtagKW
         pUvzXuhJmm77KH4vO8hrrHCD72oxDnRNVVECjE8ZSoAMFEzINvNrAKiOoBJRr983BowI
         Wguz34forXdV4i+XXFwANp8rz8vz8vvBdPyAw=
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr6991553eec.21.1795428657268;
        Mon, 23 Nov 2026 02:10:57 -0800 (PST)
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr6991531eec.21.1795428656472;
        Mon, 23 Nov 2026 02:10:56 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:10:56 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v9 04/10] bnge: add RXFH ethtool support
Date: Mon, 23 Nov 2026 15:37:40 +0530
Message-ID: <20261123100746.1975030-5-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Introduce ethtool RXFH operations including get/set_rxfh for
reading and programming the RSS hash key and indirection table.

Currently set_rxfh and set_rxfh_fields are supported only while the
device is down. A future patch series will rework
bnge_close_core()/bnge_open_core() so they can be driven safely
from the ethtool path, adding full functionality by applying the
configuration on a live device.

The default RSS key changes. It used to be a per-device
get_random_bytes() key created on first open in bnge_init_vnics().
It is now the system-wide netdev_rss_key_fill() key set in
bnge_netdev_alloc(), and rss_hash_key_valid is removed.

bnge_alloc_irqs() can reduce the RX ring count after the default
indirection table was filled in bnge_net_init_dflt_config(). Reset the
table when the count changes, so get_rxfh and the first open do not see
entries for rings that no longer exist.

bnge_reserve_rings() keeps a user-configured default indirection table
when the RX ring count changes and the table still fits, and resets it
otherwise. A table that is reset is reported with
ethtool_rxfh_indir_lost(), so the core stops reporting it as
user-configured. Before, the table was always reset while
rss_indir_user_size stayed set.

Also remove the VNIC_QCAPS_RESP_FLAGS_RSS_HASH_TYPE_DELTA_CAP
handling, since firmware never sets this flag.

Add BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP, set from
VNIC_QCAPS_RESP_FLAGS_RSS_IPV6_FLOW_LABEL_CAP and used by
set_rxfh_fields. Dropping the DELTA bit renumbers the BNGE_RSS_CAP_*
values.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  16 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 345 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  24 +-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   1 -
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  14 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   1 -
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  48 ++-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   1 +
 8 files changed, 400 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 66eed890953b..24ffc0556f0e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -77,14 +77,14 @@ enum {
 #define BNGE_EN_ROCE		(BNGE_EN_ROCE_V1 | BNGE_EN_ROCE_V2)
 
 enum {
-	BNGE_RSS_CAP_RSS_HASH_TYPE_DELTA		= BIT(0),
-	BNGE_RSS_CAP_UDP_RSS_CAP			= BIT(1),
-	BNGE_RSS_CAP_NEW_RSS_CAP			= BIT(2),
-	BNGE_RSS_CAP_RSS_TCAM				= BIT(3),
-	BNGE_RSS_CAP_AH_V4_RSS_CAP			= BIT(4),
-	BNGE_RSS_CAP_AH_V6_RSS_CAP			= BIT(5),
-	BNGE_RSS_CAP_ESP_V4_RSS_CAP			= BIT(6),
-	BNGE_RSS_CAP_ESP_V6_RSS_CAP			= BIT(7),
+	BNGE_RSS_CAP_UDP_RSS_CAP			= BIT(0),
+	BNGE_RSS_CAP_NEW_RSS_CAP			= BIT(1),
+	BNGE_RSS_CAP_RSS_TCAM				= BIT(2),
+	BNGE_RSS_CAP_AH_V4_RSS_CAP			= BIT(3),
+	BNGE_RSS_CAP_AH_V6_RSS_CAP			= BIT(4),
+	BNGE_RSS_CAP_ESP_V4_RSS_CAP			= BIT(5),
+	BNGE_RSS_CAP_ESP_V6_RSS_CAP			= BIT(6),
+	BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP		= BIT(7),
 };
 
 #define BNGE_MAX_QUEUE		8
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 2467e44de291..878fe4888160 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -10,6 +10,9 @@
 #include <linux/ethtool_netlink.h>
 
 #include "bnge.h"
+#include "bnge_netdev.h"
+#include "bnge_vnic.h"
+#include "bnge_resc.h"
 #include "bnge_ethtool.h"
 #include "bnge_hwrm_lib.h"
 
@@ -740,6 +743,336 @@ static int bnge_set_pauseparam(struct net_device *dev,
 	return rc;
 }
 
+static u64 bnge_get_ethtool_ipv4_rss(struct bnge_dev *bd)
+{
+	if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4)
+		return RXH_IP_SRC | RXH_IP_DST;
+	return 0;
+}
+
+static u64 bnge_get_ethtool_ipv6_rss(struct bnge_dev *bd)
+{
+	if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6)
+		return RXH_IP_SRC | RXH_IP_DST;
+	if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL)
+		return RXH_IP_SRC | RXH_IP_DST | RXH_IP6_FL;
+	return 0;
+}
+
+static int bnge_get_rxfh_fields(struct net_device *dev,
+				struct ethtool_rxfh_fields *cmd)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	cmd->data = 0;
+	switch (cmd->flow_type) {
+	case TCP_V4_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case UDP_V4_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case AH_ESP_V4_FLOW:
+		if ((bd->rss_hash_cfg &
+		     (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+		      VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4)) ==
+		    (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+		     VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4))
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case AH_V4_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case ESP_V4_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case SCTP_V4_FLOW:
+	case IPV4_FLOW:
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case TCP_V6_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case UDP_V6_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case AH_ESP_V6_FLOW:
+		if ((bd->rss_hash_cfg &
+		     (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+		      VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6)) ==
+		    (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+		     VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6))
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case AH_V6_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case ESP_V6_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case SCTP_V6_FLOW:
+	case IPV6_FLOW:
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+#define RXH_4TUPLE (RXH_IP_SRC | RXH_IP_DST | RXH_L4_B_0_1 | RXH_L4_B_2_3)
+#define RXH_2TUPLE (RXH_IP_SRC | RXH_IP_DST)
+
+static int bnge_set_rxfh_fields(struct net_device *dev,
+				const struct ethtool_rxfh_fields *cmd,
+				struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+	u32 rss_hash_cfg;
+	int tuple;
+
+	rss_hash_cfg = bd->rss_hash_cfg;
+
+	if (cmd->data == RXH_4TUPLE ||
+	    cmd->data == (RXH_4TUPLE | RXH_IP6_FL))
+		tuple = 4;
+	else if (cmd->data == RXH_2TUPLE ||
+		 cmd->data == (RXH_2TUPLE | RXH_IP6_FL))
+		tuple = 2;
+	else if (!cmd->data)
+		tuple = 0;
+	else
+		return -EINVAL;
+
+	if (cmd->data & RXH_IP6_FL &&
+	    !(bd->rss_cap & BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP))
+		return -EINVAL;
+
+	if (cmd->flow_type == TCP_V4_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4;
+	} else if (cmd->flow_type == UDP_V4_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4;
+	} else if (cmd->flow_type == TCP_V6_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6;
+	} else if (cmd->flow_type == UDP_V6_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6;
+	} else if (cmd->flow_type == AH_ESP_V4_FLOW) {
+		if (tuple == 4 &&
+		    (!(bd->rss_cap & BNGE_RSS_CAP_AH_V4_RSS_CAP) ||
+		     !(bd->rss_cap & BNGE_RSS_CAP_ESP_V4_RSS_CAP)))
+			return -EINVAL;
+		rss_hash_cfg &= ~(VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+				  VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4);
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+					VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4;
+	} else if (cmd->flow_type == AH_ESP_V6_FLOW) {
+		if (tuple == 4 &&
+		    (!(bd->rss_cap & BNGE_RSS_CAP_AH_V6_RSS_CAP) ||
+		     !(bd->rss_cap & BNGE_RSS_CAP_ESP_V6_RSS_CAP)))
+			return -EINVAL;
+		rss_hash_cfg &= ~(VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+				  VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6);
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+					VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6;
+	} else if (cmd->flow_type == AH_V4_FLOW) {
+		if (tuple == 4 && !(bd->rss_cap & BNGE_RSS_CAP_AH_V4_RSS_CAP))
+			return -EINVAL;
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4;
+	} else if (cmd->flow_type == ESP_V4_FLOW) {
+		if (tuple == 4 && !(bd->rss_cap & BNGE_RSS_CAP_ESP_V4_RSS_CAP))
+			return -EINVAL;
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4;
+	} else if (cmd->flow_type == AH_V6_FLOW) {
+		if (tuple == 4 && !(bd->rss_cap & BNGE_RSS_CAP_AH_V6_RSS_CAP))
+			return -EINVAL;
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6;
+	} else if (cmd->flow_type == ESP_V6_FLOW) {
+		if (tuple == 4 && !(bd->rss_cap & BNGE_RSS_CAP_ESP_V6_RSS_CAP))
+			return -EINVAL;
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6;
+	} else if (tuple == 4) {
+		return -EINVAL;
+	}
+
+	switch (cmd->flow_type) {
+	case TCP_V4_FLOW:
+	case UDP_V4_FLOW:
+	case SCTP_V4_FLOW:
+	case AH_ESP_V4_FLOW:
+	case AH_V4_FLOW:
+	case ESP_V4_FLOW:
+	case IPV4_FLOW:
+		if (tuple == 2)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4;
+		else if (!tuple && cmd->flow_type == IPV4_FLOW)
+			rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4;
+		else if (!tuple &&
+			 (rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4))
+			goto err_l3_shared;
+		break;
+
+	case TCP_V6_FLOW:
+	case UDP_V6_FLOW:
+	case SCTP_V6_FLOW:
+	case AH_ESP_V6_FLOW:
+	case AH_V6_FLOW:
+	case ESP_V6_FLOW:
+	case IPV6_FLOW:
+		if (cmd->data & RXH_IP6_FL) {
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL;
+			rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6;
+		} else if (tuple == 2 ||
+			   (tuple == 4 &&
+			    (rss_hash_cfg &
+			     VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL))) {
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6;
+			rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL;
+		} else if (!tuple && cmd->flow_type == IPV6_FLOW) {
+			rss_hash_cfg &= ~(VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6 |
+					  VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL);
+		} else if (!tuple &&
+			   (rss_hash_cfg &
+			    (VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6 |
+			     VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL))) {
+			goto err_l3_shared;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (bd->rss_hash_cfg == rss_hash_cfg)
+		return 0;
+
+	if (netif_running(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "RSS configuration can only be changed while the interface is down");
+		return -EBUSY;
+	}
+
+	bd->rss_hash_cfg = rss_hash_cfg;
+
+	return 0;
+
+err_l3_shared:
+	NL_SET_ERR_MSG_MOD(extack,
+			   "2-tuple hashing is shared by all flows of an IP version, use ip4/ip6 to disable it");
+	return -EINVAL;
+}
+
+static u32 bnge_get_rxfh_indir_size_eth(struct net_device *dev)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	return bnge_get_rxfh_indir_size(bd);
+}
+
+static u32 bnge_get_rxfh_key_size(struct net_device *dev)
+{
+	return HW_HASH_KEY_SIZE;
+}
+
+static int bnge_get_rxfh(struct net_device *dev,
+			 struct ethtool_rxfh_param *rxfh)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+	u32 i, tbl_size;
+	u32 *indir_tbl;
+
+	indir_tbl = bd->rss_indir_tbl;
+	rxfh->hfunc = ETH_RSS_HASH_TOP;
+
+	if (rxfh->indir && indir_tbl) {
+		tbl_size = bnge_get_rxfh_indir_size(bd);
+		for (i = 0; i < tbl_size; i++)
+			rxfh->indir[i] = indir_tbl[i];
+	}
+
+	if (rxfh->key)
+		memcpy(rxfh->key, bn->rss_hash_key, HW_HASH_KEY_SIZE);
+
+	return 0;
+}
+
+static int bnge_set_rxfh(struct net_device *dev,
+			 struct ethtool_rxfh_param *rxfh,
+			 struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+
+	if (rxfh->hfunc && rxfh->hfunc != ETH_RSS_HASH_TOP)
+		return -EOPNOTSUPP;
+
+	if (netif_running(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "RSS configuration can only be changed while the interface is down");
+		return -EBUSY;
+	}
+
+	bnge_modify_rss(bn, NULL, NULL, rxfh);
+
+	return 0;
+}
+
+static u32 bnge_get_rx_ring_count(struct net_device *dev)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	return bd->rx_nr_rings;
+}
+
 static const struct ethtool_ops bnge_ethtool_ops = {
 	.cap_link_lanes_supported	= 1,
 	.get_link_ksettings	= bnge_get_link_ksettings,
@@ -757,6 +1090,18 @@ static const struct ethtool_ops bnge_ethtool_ops = {
 	.get_eth_ctrl_stats	= bnge_get_eth_ctrl_stats,
 	.get_pause_stats	= bnge_get_pause_stats,
 	.get_rmon_stats		= bnge_get_rmon_stats,
+	/* RXFH */
+	.rxfh_per_ctx_key	= 1,
+	.rxfh_max_num_contexts	= BNGE_MAX_ETH_RSS_CTX + 1,
+	.rxfh_indir_space	= BNGE_MAX_RSS_TABLE_ENTRIES,
+	.rxfh_priv_size		= sizeof(struct bnge_rss_ctx),
+	.get_rx_ring_count	= bnge_get_rx_ring_count,
+	.get_rxfh_indir_size	= bnge_get_rxfh_indir_size_eth,
+	.get_rxfh_key_size	= bnge_get_rxfh_key_size,
+	.get_rxfh		= bnge_get_rxfh,
+	.set_rxfh		= bnge_set_rxfh,
+	.get_rxfh_fields	= bnge_get_rxfh_fields,
+	.set_rxfh_fields	= bnge_set_rxfh_fields,
 };
 
 void bnge_set_ethtool_ops(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index d613587086cb..3aaeaab535fe 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -660,8 +660,6 @@ int bnge_hwrm_vnic_qcaps(struct bnge_dev *bd)
 
 		if (flags & VNIC_QCAPS_RESP_FLAGS_VLAN_STRIP_CAP)
 			bd->fw_cap |= BNGE_FW_CAP_VLAN_RX_STRIP;
-		if (flags & VNIC_QCAPS_RESP_FLAGS_RSS_HASH_TYPE_DELTA_CAP)
-			bd->rss_cap |= BNGE_RSS_CAP_RSS_HASH_TYPE_DELTA;
 		if (flags & VNIC_QCAPS_RESP_FLAGS_RSS_PROF_TCAM_MODE_ENABLED)
 			bd->rss_cap |= BNGE_RSS_CAP_RSS_TCAM;
 		bd->max_tpa_v2 = le16_to_cpu(resp->max_aggs_supported);
@@ -677,6 +675,8 @@ int bnge_hwrm_vnic_qcaps(struct bnge_dev *bd)
 			bd->rss_cap |= BNGE_RSS_CAP_ESP_V4_RSS_CAP;
 		if (flags & VNIC_QCAPS_RESP_FLAGS_RSS_IPSEC_ESP_SPI_IPV6_CAP)
 			bd->rss_cap |= BNGE_RSS_CAP_ESP_V6_RSS_CAP;
+		if (flags & VNIC_QCAPS_RESP_FLAGS_RSS_IPV6_FLOW_LABEL_CAP)
+			bd->rss_cap |= BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP;
 	}
 	bnge_hwrm_req_drop(bd, req);
 
@@ -867,26 +867,6 @@ int bnge_hwrm_vnic_cfg(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	return bnge_hwrm_req_send(bd, req);
 }
 
-void bnge_hwrm_update_rss_hash_cfg(struct bnge_net *bn)
-{
-	struct bnge_vnic_info *vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
-	struct hwrm_vnic_rss_qcfg_output *resp;
-	struct hwrm_vnic_rss_qcfg_input *req;
-	struct bnge_dev *bd = bn->bd;
-
-	if (bnge_hwrm_req_init(bd, req, HWRM_VNIC_RSS_QCFG))
-		return;
-
-	req->vnic_id = cpu_to_le16(vnic->fw_vnic_id);
-	/* all contexts configured to same hash_type, zero always exists */
-	req->rss_ctx_idx = cpu_to_le16(vnic->fw_rss_cos_lb_ctx[0]);
-	resp = bnge_hwrm_req_hold(bd, req);
-	if (!bnge_hwrm_req_send(bd, req))
-		bd->rss_hash_cfg =
-			le32_to_cpu(resp->hash_type) ?: bd->rss_hash_cfg;
-	bnge_hwrm_req_drop(bd, req);
-}
-
 int bnge_hwrm_l2_filter_free(struct bnge_dev *bd, struct bnge_l2_filter *fltr)
 {
 	struct hwrm_cfa_l2_filter_free_input *req;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
index ae03041c36ac..578575b0896a 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
@@ -39,7 +39,6 @@ int bnge_hwrm_vnic_ctx_alloc(struct bnge_dev *bd,
 int bnge_hwrm_vnic_set_rss(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic, bool set_rss);
 int bnge_hwrm_vnic_cfg(struct bnge_net *bn, struct bnge_vnic_info *vnic);
-void bnge_hwrm_update_rss_hash_cfg(struct bnge_net *bn);
 int bnge_hwrm_vnic_alloc(struct bnge_dev *bd, struct bnge_vnic_info *vnic,
 			 unsigned int nr_rings);
 void bnge_hwrm_vnic_free_one(struct bnge_dev *bd, struct bnge_vnic_info *vnic);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 45996d91dc55..deb450929ded 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1780,13 +1780,6 @@ static void bnge_init_vnics(struct bnge_net *bn)
 				u8 *key = (void *)vnic->rss_hash_key;
 				int k;
 
-				if (!bn->rss_hash_key_valid &&
-				    !bn->rss_hash_key_updated) {
-					get_random_bytes(bn->rss_hash_key,
-							 HW_HASH_KEY_SIZE);
-					bn->rss_hash_key_updated = true;
-				}
-
 				memcpy(vnic->rss_hash_key, bn->rss_hash_key,
 				       HW_HASH_KEY_SIZE);
 
@@ -1794,7 +1787,6 @@ static void bnge_init_vnics(struct bnge_net *bn)
 					continue;
 
 				bn->rss_hash_key_updated = false;
-				bn->rss_hash_key_valid = true;
 
 				bn->toeplitz_prefix = 0;
 				for (k = 0; k < 8; k++) {
@@ -2637,9 +2629,6 @@ static int bnge_init_chip(struct bnge_net *bn)
 		goto err_out;
 	}
 
-	if (bd->rss_cap & BNGE_RSS_CAP_RSS_HASH_TYPE_DELTA)
-		bnge_hwrm_update_rss_hash_cfg(bn);
-
 	if (bn->priv_flags & BNGE_NET_EN_TPA) {
 		rc = bnge_set_tpa(bn, true);
 		if (rc)
@@ -3616,6 +3605,9 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	bn->tx_ring_size = BNGE_DEFAULT_TX_RING_SIZE;
 	bn->rx_dir = DMA_FROM_DEVICE;
 
+	netdev_rss_key_fill(bn->rss_hash_key, sizeof(bn->rss_hash_key));
+	bn->rss_hash_key_updated = true;
+
 	bnge_set_tpa_flags(bd);
 	bnge_init_ring_params(bn);
 	bnge_set_ring_params(bd);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index e0462a0f4f2c..9e14142bf8c1 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -338,7 +338,6 @@ struct bnge_net {
 	u16			rx_dma_offset;
 
 	u8			rss_hash_key[HW_HASH_KEY_SIZE];
-	u8			rss_hash_key_valid:1;
 	u8			rss_hash_key_updated:1;
 	int			rsscos_nr_ctxs;
 	u32			stats_coal_ticks;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 1de7905dd9f1..c2786bae05a4 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -224,6 +224,19 @@ u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd)
 	       BNGE_RSS_TABLE_ENTRIES;
 }
 
+static u16 bnge_get_max_rss_ring(struct bnge_dev *bd)
+{
+	u32 i, tbl_size, max_ring = 0;
+
+	if (!bd->rss_indir_tbl)
+		return 0;
+
+	tbl_size = bnge_get_rxfh_indir_size(bd);
+	for (i = 0; i < tbl_size; i++)
+		max_ring = max_t(u32, max_ring, bd->rss_indir_tbl[i]);
+	return max_ring;
+}
+
 static void bnge_copy_reserved_rings(struct bnge_dev *bd,
 				     struct bnge_hw_rings *hwr)
 {
@@ -280,10 +293,12 @@ static bool bnge_need_reserve_rings(struct bnge_dev *bd)
 int bnge_reserve_rings(struct bnge_dev *bd)
 {
 	u16 aux_dflt_msix = bnge_aux_get_dflt_msix(bd);
-	u16 rx_rings, old_rx_rings, old_rx_nr_rings;
 	struct bnge_hw_rings hwr = {0};
+	u16 rx_rings, old_rx_rings;
 	u16 nq = bd->nq_nr_rings;
+	bool indir_lost = false;
 	u16 aux_msix = 0;
+	bool rx_changed;
 	bool sh = false;
 	u16 tx_cp;
 	int rc;
@@ -317,7 +332,6 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	hwr.rss_ctx = bnge_get_total_rss_ctxs(bd, &hwr);
 	hwr.stat = bnge_func_stat_ctxs_demand(bd);
 	old_rx_rings = bd->hw_resc.resv_rx_rings;
-	old_rx_nr_rings = bd->rx_nr_rings;
 
 	rc = bnge_hwrm_reserve_rings(bd, &hwr);
 	if (rc)
@@ -371,16 +385,31 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	if (!bd->num_tc)
 		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
 
-	if (rx_rings != bd->rx_nr_rings)
+	rx_changed = rx_rings != bd->rx_nr_rings;
+	if (rx_changed) {
 		dev_warn(bd->dev, "RX rings resv reduced to %d than earlier %d requested\n",
 			 rx_rings, bd->rx_nr_rings);
+		indir_lost = bd->netdev &&
+			     netif_is_rxfh_configured(bd->netdev) &&
+			     (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
+			      bnge_cal_nr_rss_ctxs(rx_rings) ||
+			      bnge_get_max_rss_ring(bd) >= rx_rings);
+	}
 
 	bd->rx_nr_rings = rx_rings;
 	bd->nq_nr_rings = hwr.nq;
 
-	if (old_rx_rings != bd->hw_resc.resv_rx_rings ||
-	    old_rx_nr_rings != bd->rx_nr_rings)
-		bnge_set_dflt_rss_indir_tbl(bd);
+	if (old_rx_rings != bd->hw_resc.resv_rx_rings || rx_changed) {
+		if (!bd->netdev || indir_lost ||
+		    !netif_is_rxfh_configured(bd->netdev))
+			bnge_set_dflt_rss_indir_tbl(bd);
+	}
+
+	/* Notify only now, so the notification reports the new ring count
+	 * and the reset indirection table.
+	 */
+	if (indir_lost)
+		ethtool_rxfh_indir_lost(bd->netdev);
 
 	if (!bnge_aux_registered(bd)) {
 		u16 resv_msix, resv_ctx, aux_ctxs;
@@ -400,7 +429,7 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 
 int bnge_alloc_irqs(struct bnge_dev *bd)
 {
-	u16 aux_msix, tx_cp, num_entries;
+	u16 aux_msix, tx_cp, num_entries, old_rx;
 	int i, irqs_demand, rc;
 	u16 max, min = 1;
 
@@ -437,12 +466,17 @@ int bnge_alloc_irqs(struct bnge_dev *bd)
 	 * We dont need to consider NQs as they have been calculated
 	 * and must be more than irqs_demand.
 	 */
+	old_rx = bd->rx_nr_rings;
 	rc = bnge_adjust_rings(bd, &bd->rx_nr_rings,
 			       &bd->tx_nr_rings,
 			       irqs_demand - aux_msix, min == 1);
 	if (rc)
 		goto err_free_irqs;
 
+	/* The indirection table may point at rings that were just removed */
+	if (bd->rx_nr_rings != old_rx)
+		bnge_set_dflt_rss_indir_tbl(bd);
+
 	tx_cp = bnge_num_tx_to_cp(bd, bd->tx_nr_rings);
 	bd->nq_nr_rings = (min == 1) ?
 		max_t(u16, tx_cp, bd->rx_nr_rings) :
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index 382df442789e..d11bd33fe254 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -16,6 +16,7 @@ struct bnge_l2_filter;
 #define BNGE_MAX_RSS_TABLE_ENTRIES				\
 	(BNGE_RSS_TABLE_ENTRIES * BNGE_RSS_TABLE_MAX_TBL)
 
+#define BNGE_MAX_ETH_RSS_CTX	32
 #define BNGE_MAX_CTX_PER_VNIC	8
 
 #define BNGE_MAX_MC_ADDRS	16
-- 
2.52.0

