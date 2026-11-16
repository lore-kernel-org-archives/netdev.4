Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838092;
	b=tPDOFBmuML+OoiCkTKkLucMAp/6MM6IU6V9jKKeaZJhVSwvBhDokLW4GcmLCHR7RHK+t
	 fw1TwaosyTlnh5eZS0S6WY+ckA2V4tMtfZV5Mu0I4QnJycLkfQkx/7Ors45ulEeyYV02I
	 9+9bNyPPNXY9Zs4KzfCf9IimDpx7nrr853elCDqt07StMwLKVyEqqEU20tJizfCtRE21q
	 LC/1s4hM7CJhXJSBQf132OLj0w6uL9cg4kJzsakF2kiDV6cEUhUsVcYcvWI1k01kYLNAX
	 14NwkuuH8Edltj+wByXn4NcOE8O5a2KR+AJ9vGTOAT340AJqZvc+KuFcBDAOKTmQqdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838092;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9MGoJlAK1NpRMJ8c9730oqZywSOQfg7WrDmtbh44TEQ=;
	b=AD+OF2N7bXv6wbrO1muLX9Ul59awg3MQAOGW0HaQ4K+Jv9fkoweT+SCkoY4Tkf+uONin
	 W0f0cah1gu4gUDidWkdsE4FghLmSbBGGksMJuZ94v9dA8eaBNjHe0LQP4TmYOIR1DbubK
	 qNXdzZk0DUo65E3YxvSCVfGaitzNYuU/98otTXACIkJXU1EFSJlK1pkTdRPfI/J3tTJ3G
	 LH3aFqWVR2IUhgm51kFwiLDYbxSST17eKtmdVtRqAN16OoRWDK365aNG+ax/shTHGWt8V
	 CnB6YS5XSCY7G4HwEK/bZBM+wn6H4nkdZdXxFSenZa0cVpMOs8uTnGHh14sV7C/xdfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g4Oq2qAX;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33C7606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33C7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g4Oq2qAX
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91f0272ce61so45822086d6.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838091; x=1795442891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MGoJlAK1NpRMJ8c9730oqZywSOQfg7WrDmtbh44TEQ=;
        b=OBFSBQKgp8hcR8xC2ZLR5rGyYyEN4lpSzDvL1qyOQrPpS3e/9xia9OfMeQ4k67b/Aq
         Gf/ObSlqX00kU8KSscGGaIR7p/7m7rPyhvNkSkU4V6JViy7fwwTqz0t2te/OLL7Mb2xz
         KcMxz06OfK8jW/6J8Rq7tBsbgGw8ibWh0XwZ+ffiDHe1SD5OBeyDMyt29auWLj48Y1GN
         huHCdnp4nqFGFGtFcT8NRbqM0Btvyq0eJE6zWPTYKlhIjsKNlPO+KIculvgJAhtN+pzb
         82fVOpqRdkKBo7PhPct9kbhYS2xRWPeBZeUbIx0P/3hMhC7ZFtdHp/yHCVueg3yYfhob
         kFkw==
X-Gm-Message-State: APuU4Z88CPyBFh9jk7NheqghkSXKJbTb19txRD+Xf6ANrdrxTfrYdt2M
	0/WS+d8/y28N6yif0FaXRZgcuJ2VpFp3I+oIsXQZ0FyyQeseC2/B38nL6fDfANdsZ8cA5XJCCxI
	+5ABpPzTMQci+dwAA/MBvBrsl3HrwOgd5nGf2nHDPq1omVXdF2y2i/8+TWol9vmwxeo35hbzmoa
	GbKsXow7mEJxrEZErYiVDEKypCxE6UdnI55wISzmRg676wNMJ277PRhjBNqmL7pVF9DMkr7P48f
	VNpc4MQOw==
X-Gm-Gg: AZFdTZccsMA4DQtRE9zgnK+HKaCLeTwLQN+fsrGF4jI29EQ97KW/r+f6dwvGa+IGHNH
	XoHO3WYuKWFAzoNGsrqGdS/pb1r+hT3f5uMA6VFaEUEqJvWbqRgOshjrYvVEEpOUDhNrmQbtbc1
	VR5EcYPW4HVCp/OmPq1BtuGFgXaXbdM3TJTJwXrCb8gHupmIYaN6MJ5XEHchmIvzH6WTXadRBdK
	YaiVzQ5A41MIZZpB2t//kx2kN9moTbpwJ59zAZsxk0aVhrgoaxCiRms5UTJ6ybHlJpBHQvEcDzn
	Y//EHEPVo3UKalIpOc1moTojZKSfiLxSOPLWKDft/4v6gF4xh7FQ/6WUbGwDqC2bCH1LBJVPebi
	pr4QDncpjEmffckVf6gfn2mqdrLqBvw3ozIqSCuJdusOkcGrJXPKhoQYgX7+1kGN7mtBCOb3ZpC
	KXXB0xaZZAwWLYbq9bwOkB9VS/E6nn2/Zklg==
X-Received: by 2002:a05:6214:2f87:b0:919:557c:f0a1 with SMTP id 6a1803df08f44-91f241b9d98mr157810886d6.24.1794838090665;
        Mon, 16 Nov 2026 06:08:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91f23d90700sm1300736d6.37.2026.11.16.06.08.10
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so1862206c88.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838089; x=1795442889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MGoJlAK1NpRMJ8c9730oqZywSOQfg7WrDmtbh44TEQ=;
        b=g4Oq2qAXVhVxFlLFCrQ3jUf43hCAoN26jBwlzpt6YngeJElkHT1Kb3WJJqHf5wV4j8
         ABEvYzCUDr4nmnRQoWHKtRFIB6LilWIrniFGOJ9GykiOGhNYJb7BrlE621JiZf5AzIgN
         839rvf8rGpDllqlyq11r+pzQ2LoC8fYHpvEYE=
X-Received: by 2002:a05:701b:4287:20b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1b5030a3438mr10805340c88.13.1794838088584;
        Mon, 16 Nov 2026 06:08:08 -0800 (PST)
X-Received: by 2002:a05:701b:4287:20b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1b5030a3438mr10805294c88.13.1794838087760;
        Mon, 16 Nov 2026 06:08:07 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:08:06 -0800 (PST)
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
Subject: [PATCH net-next v8 04/10] bnge: add RXFH ethtool support
Date: Mon, 16 Nov 2026 19:36:47 +0530
Message-ID: <20261116140653.1685797-5-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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

Also remove the VNIC_QCAPS_RESP_FLAGS_RSS_HASH_TYPE_DELTA_CAP
handling, since firmware never sets this flag.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  16 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 345 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  24 +-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   1 -
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  14 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   1 -
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |   7 +-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   1 +
 8 files changed, 365 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 3e8210626062..f8ee95d21d8c 100644
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
index 16ad5626b3f5..783e56b798fb 100644
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
index 3ef3eb99ad4e..e605448286d5 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1747,13 +1747,6 @@ static void bnge_init_vnics(struct bnge_net *bn)
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
 
@@ -1761,7 +1754,6 @@ static void bnge_init_vnics(struct bnge_net *bn)
 					continue;
 
 				bn->rss_hash_key_updated = false;
-				bn->rss_hash_key_valid = true;
 
 				bn->toeplitz_prefix = 0;
 				for (k = 0; k < 8; k++) {
@@ -2573,9 +2565,6 @@ static int bnge_init_chip(struct bnge_net *bn)
 		goto err_out;
 	}
 
-	if (bd->rss_cap & BNGE_RSS_CAP_RSS_HASH_TYPE_DELTA)
-		bnge_hwrm_update_rss_hash_cfg(bn);
-
 	if (bn->priv_flags & BNGE_NET_EN_TPA) {
 		rc = bnge_set_tpa(bn, true);
 		if (rc)
@@ -3405,6 +3394,9 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	bn->tx_ring_size = BNGE_DEFAULT_TX_RING_SIZE;
 	bn->rx_dir = DMA_FROM_DEVICE;
 
+	netdev_rss_key_fill(bn->rss_hash_key, sizeof(bn->rss_hash_key));
+	bn->rss_hash_key_updated = true;
+
 	bnge_set_tpa_flags(bd);
 	bnge_init_ring_params(bn);
 	bnge_set_ring_params(bd);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 3c0fea0a7608..0512d983519e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -335,7 +335,6 @@ struct bnge_net {
 	u16			rx_dma_offset;
 
 	u8			rss_hash_key[HW_HASH_KEY_SIZE];
-	u8			rss_hash_key_valid:1;
 	u8			rss_hash_key_updated:1;
 	int			rsscos_nr_ctxs;
 	u32			stats_coal_ticks;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 506ceee775e1..25aa6e7c43c3 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -398,7 +398,7 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 
 int bnge_alloc_irqs(struct bnge_dev *bd)
 {
-	u16 aux_msix, tx_cp, num_entries;
+	u16 aux_msix, tx_cp, num_entries, old_rx;
 	int i, irqs_demand, rc;
 	u16 max, min = 1;
 
@@ -435,12 +435,17 @@ int bnge_alloc_irqs(struct bnge_dev *bd)
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

