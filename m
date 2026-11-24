Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514903;
	b=lYzlODcXW4YWad6w8MDNIG3vn24Qjw/6VSRabhygDtBbPwEVztvuVl10ovTyXYWw2FGr
	 AgzEmDDKOje2wewOwH88PEuzZfnk50lN2IBH4WklZGt3ntSunhsOOnktNBLhRCUjesyvN
	 48WFLfde926D26qQBKO/JkVX1DPoq3ILhAiJwnOYFfI0PmdXXrzul+23fDEVSeCQY/42h
	 xi7nO8NfLSPNGyTigUq0J/z+ELYwuVziX90OtbbxmVHKF3VQim5XrhHhVPcnjfm3M+cEB
	 8wbktpHmSuuIUFNzIRYFe7Y4zqBhPcQ2HpgmZqnpsCvouq+FtT+YUNmQrmHNkYiUgeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514903;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hqravjiiktSzG1I8B6hGi/+VxcvCn0dAKH3YSbgOfQw=;
	b=hxdmdrXoGrXzmKdApvcP+KsvgyxhDiKH6hABxz/xX6pP5plWHOS+iHSfL1o7CZj+H/oA
	 oXgaa8IsUrEjt7vrUSlAxJMDWLSLZ1fZ2IV63yzZwNhV+ptpnSKDtpzsGhF1si9LD99ZS
	 /0wphwPceIoTi+9F+Yzr37hk7bBaCWIF4I3eZAN2cojNPAbt3QKBKoCWMNTqIi9jAOu89
	 IXAxnrgF2lcs2sgLQgKdfj9TXsc2CNhf/14AC3KTZfP21trVQD7vQmnn/IYXlKnX9YxMh
	 P+8F5vTHHhqZPrIH6YMRdijs+iT6oEa1ZOrWeaQyfeqiR/XIZAV8G5RoHuu549DgVgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=a1z2SNtk;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A62606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A62606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=a1z2SNtk
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so2481498a91.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514902; x=1796119702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqravjiiktSzG1I8B6hGi/+VxcvCn0dAKH3YSbgOfQw=;
        b=VHc7rZce5afTIXRavziun3lU6ks7WCiz1S20UZLQ8/xczkxD7qu8gbmqXYkFHDtQP1
         p6MIHfhLXD/SvZZBF3mRmmuUdgZALTqE+KDi22FLK5/rLlS3B3EIE/1pRMoF+QF2ONYz
         aleIwFjEmA03gIQrgSFuUWV7DJCGEv2UXrKfzufwTiqMnAeuvmMs2cYvDpXBWX43EeG4
         nD5nDsJL3WeAryQTXrYkutL0IFFGBsFqNXZj2N6YfenHHJz4TFoUjvTV7hJdxW7vPFse
         A8ejiIE1cZQlK0kCeHR4IUWCe2jxMiBrdHBw6yNmIlrAxkJfGp53LohIra3+beEjCWii
         8Qtg==
X-Gm-Message-State: APuU4Z8EA+0eXTeKMQbHwLnloSzKsqRvaDWBfDP/ytL9qMSY27EY16ft
	SGc6OqxJA+fMDVHR9ja9mB2x1ZXzYjRd9qyJ80c3ARZNlygJzYxLKA87ndlaigc7AxoJsgFTQyu
	pn6kmNPx1oh+PgKVv+VkyZSRNHBe54nmVbnIWrGlCEP7qg1mb2RptGvDX+u7h+/iE4vRUu++Q2f
	LLIZPE23ulMdKA4lmbiibnwElaODAZa/zLaiGzYIqaQADMBbS0EWoqb7Em5OGVmE9n2hLc4egiO
	Zl1GbmUaxELoLsKxB62pQ==
X-Gm-Gg: AZFdTZemEyOGwtDJFwfFskcU4SIPudeAKKluTrhJAoIb/VYVNIJHyqewT7sQei5tW2Q
	dn4EFgb4ATJ1fCmB5KQdGN4/2TgObtAnhWngpFASYVYaIPHcH1CqPvWBaJYDxyBKZzB4WXnTYG/
	379vzESq2tBdA/2ZojyaMx7jeDKNvniMmCzwizCcXLt23Xedo/1/lSSDGdm5uMahc7ZXntFVVgv
	bmphXjR/0OCp3NXN68APf2+APAwllAhmYqOrb99eGbUA6ccjWtyMjzXQ1NKmdcnR6uFLStp0atX
	J8DVqPaKTXE8dKou4mUgLPdHwzCC0bE/Eq/owDIc3wIXXMU1qDRpe824WdPJhCOZK4vyqaiDaXi
	4IYrtPvpt0Qcfufko6981jjmdPg44hCw67/mBK8z2RWPvbz27SeQT/R3kKlxxbUURDXkr9w3cXb
	MqEfCdMEl6l84LRjwape0MrxVQB1LGWHzc6eJkw9aGw3s=
X-Received: by 2002:a17:90b:3d92:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b41c8e0602mr8218699a91.14.1795514901911;
        Tue, 24 Nov 2026 02:08:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff67243sm5262832a91.3.2026.11.24.02.08.21
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:08:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so2533369eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795514900; x=1796119700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqravjiiktSzG1I8B6hGi/+VxcvCn0dAKH3YSbgOfQw=;
        b=a1z2SNtkdfZnDF24eVhtO5Yem4AGcDblgtx3inZH/Kd3e8oqAIDx7EBI/oit00hWGI
         kjE7vPmsbqMawmH0oro6oAO0LBlzk+PU3FSoAnuaTrMHX2ZTFQ/LlQ++tk4dWMm7w1Lq
         eaAL8AfNc68XTVmoV9UbjzLNFVbmSdsWrBnDM=
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr13964157eec.0.1795514900147;
        Tue, 24 Nov 2026 02:08:20 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr13964120eec.0.1795514899472;
        Tue, 24 Nov 2026 02:08:19 -0800 (PST)
Received: from H10-S2 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm49931870eec.26.2026.11.24.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:08:19 -0800 (PST)
From: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	bhargava.marreddy@broadcom.com,
	ajit.khaparde@broadcom.com,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [PATCH net-next 1/2] bnge: Add HSI definitions for register dump
Date: Tue, 24 Nov 2026 04:07:50 -0600
Message-ID: <20261124100751.179270-2-ramakrishna.koduri@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
References: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
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

Add HSI support for get_regs and get_regs_len ethtool callbacks
to provide register dump support for the BNGE driver. This
includes support for PXP registers, PCIe signal integrity, PCIe
Latency Histogram and Adaptive QoS TX/RX MBUF registers.

Signed-off-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: V.S.Rama Krishna Nemani <vsrama-krishna.nemani@broadcom.com>
---
 include/linux/bnge/hsi.h | 149 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/include/linux/bnge/hsi.h b/include/linux/bnge/hsi.h
index 834db3991691..1bebfc032e47 100644
--- a/include/linux/bnge/hsi.h
+++ b/include/linux/bnge/hsi.h
@@ -12900,4 +12900,153 @@ struct mpc_cmpl_hdr {
 	__le32	opaque;
 };
 
+/* queue_adptv_qos_rx_info (size:960b/120B) */
+struct queue_adptv_qos_rx_info {
+	__le16	rx_shared_pool_cells;
+	__le16	rx_total_cells;
+	u8	rx_cell_size;
+	u8	rx_enabled_cos;
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ENABLED_COS7     0x80UL
+	u8	rx_llfc_enabled;
+	u8	rx_pfc_enabled_cos;
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_PFC_ENABLED_COS7     0x80UL
+	__le16	rx_reserved_cells_cos[8];
+	__le16	rx_shared_cells_cos[8];
+	__le16	rx_shared_combined_cells_cos[8];
+	__le16	rx_headroom_cells_cos[8];
+	__le16	rx_headroom_combined_cells_cos[8];
+	u8	rx_shared_pool_index_cos[8];
+	u8	rx_roce_enabled_cos;
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_RX_INFO_RX_ROCE_ENABLED_COS7     0x80UL
+	u8	unused_0[7];
+	__le16	rx_cos_allocate[8];
+};
+
+/* queue_adptv_qos_tx_info (size:640b/80B) */
+struct queue_adptv_qos_tx_info {
+	__le16	tx_shared_pool_cells;
+	__le16	tx_total_cells;
+	u8	tx_cell_size;
+	u8	tx_enabled_cos;
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ENABLED_COS7     0x80UL
+	u8	tx_roce_enabled_cos;
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS0     0x1UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS1     0x2UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS2     0x4UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS3     0x8UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS4     0x10UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS5     0x20UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS6     0x40UL
+	#define QUEUE_ADPTV_QOS_TX_INFO_TX_ROCE_ENABLED_COS7     0x80UL
+	u8	unused_0;
+	__le16	tx_reserved_cells_cos[8];
+	__le16	tx_shared_cells_cos[8];
+	__le16	tx_shared_combined_cells_cos[8];
+	u8	tx_shared_pool_index_cos[8];
+	__le16	tx_cos_allocate[8];
+};
+
+/* hwrm_queue_adptv_qos_rx_qcfg_input (size:256b/32B) */
+struct hwrm_queue_adptv_qos_rx_qcfg_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le64	rx_qcfg_host_addr;
+	__le16	rx_qcfg_size;
+	u8	port_id;
+	u8	flags;
+	#define QUEUE_ADPTV_QOS_RX_QCFG_REQ_FLAGS_COUNTER_MASK     0x1UL
+	u8	unused_0[4];
+};
+
+/* hwrm_queue_adptv_qos_rx_qcfg_output (size:128b/16B) */
+struct hwrm_queue_adptv_qos_rx_qcfg_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le16	rx_qcfg_size;
+	u8	unused_0[5];
+	u8	valid;
+};
+
+/* hwrm_queue_adptv_qos_tx_qcfg_input (size:256b/32B) */
+struct hwrm_queue_adptv_qos_tx_qcfg_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le64	tx_qcfg_host_addr;
+	__le16	tx_qcfg_size;
+	u8	port_id;
+	u8	flags;
+	#define QUEUE_ADPTV_QOS_TX_QCFG_REQ_FLAGS_COUNTER_MASK     0x1UL
+	u8	unused_0[4];
+};
+
+/* hwrm_queue_adptv_qos_tx_qcfg_output (size:128b/16B) */
+struct hwrm_queue_adptv_qos_tx_qcfg_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le16	tx_qcfg_size;
+	u8	unused_0[5];
+	u8	valid;
+};
+
+/* hwrm_dbg_read_direct_input (size:256b/32B) */
+struct hwrm_dbg_read_direct_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le64	host_dest_addr;
+	__le32	read_addr;
+	__le32	read_len32;
+};
+
+/* hwrm_dbg_read_direct_output (size:128b/16B) */
+struct hwrm_dbg_read_direct_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le32	crc32;
+	u8	unused_0[3];
+	u8	valid;
+};
+
 #endif /* _BNGE_HSI_H_ */
-- 
2.52.0

