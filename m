Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717517;
	b=EHhokqHRk76/crhuyqht2/exva3irDI2wx52+SzodxXJYKtgCKeSTB9Enmnh9PhrUFvt
	 +++WQUXxzwsZNxqQTg0uMpSCtXbeEzjnGRlY7hUR82BUgOtXgPkz9L6T/7XyEhwf//QEB
	 ggSXgP5ZBRdyZhYEAPYvr4joSJllKslOk2bALJghDq9HWBiTCH8n4JSn6m/F+VNZH2r/U
	 7BlrnyziWPha6lisEPZGfUc9jiEnu5VoJ7aCKsR/5R8lVvPstb6LtqhEymqxa5hsf6752
	 yG1kO08uFbOWLySevsBzLRoQQm8sQtn7AtDB84Qg9GOEPcGTDJv+UNrfLWZlh/zD0NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717517;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=k6u2WmeUJyDbQxk4C6EGt2cBS80L70A3CK+5YS3cV1g=;
	b=WUwoPy3agDd+Dy9GpbDQ65k06344XnD7ZmG399Zle2wG5H8BCVesANlf01Ct48uDhfbP
	 5aI4GOnG7R/Rf8pB3TS0G1TQmSx/URooKYXzQtTUIX3WEtDlGVnVkIIlp2z6LOIs8lRo2
	 26uZ4/7Hpez43qdaC/kcabiKbdyEkKK5tuNQhFgRTGETNMjYHugK6p/lpOoOfrtC5Bu/W
	 OkUSQJouUKWwntKbwtY9UhIos/xcnvTF64QK3G3tqftuCUPN3duX2TZHSgLWyudjdwlbS
	 4YAeh4TnG0pTJjC3XeqA9fY+xSOy9tljNVcl12JEBF66TjEMp7EXnjYU6X3YoV9S1tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tz7f94oS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.56
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400F606A31C;
	Thu, 26 Nov 2026 18:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4400F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tz7f94oS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpJqPMSHucA5bq4xTmeABXLmxPkK26aHRI6Y+UyOkSIARFCUxWBBRPDcMyDeLmn+j3nb084H/ZCEIQN6wi7xdY05S0P+MmOyBaU7eqxHzq7NsQaxVbcnCk84dawCxO+FaC8uSRwivkwoRTOqpuqdg3z/JGwafAm2ufX5u6Ct5TbwXJhtfD7MNryF4oxiAfGiol+0Zv4RZMcdgajVoHRn8A7ajV1Dzyd12x57gaoMHLQECYpB9TuyREkPe6yxUt6c7IRl2yj5Isb3WuPY1OM5is3iHPH6i7/v36z1W1GMX5e4UH9dI1/nXwxRFV9aiTRY4PaKOoWI94HntHSs2tKrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6u2WmeUJyDbQxk4C6EGt2cBS80L70A3CK+5YS3cV1g=;
 b=eAxqQca4XX44LjhGya/FXgQ0H7fADqIJF2KJThJZeA2xhZBW4KDSk91pshZCbEzLtYKi/VDlDTao0D7wPLrKA3tArLivFgBshnCa+Nh0eKcp3w9TaYREXZLCbCcPI3MmBjsbWBqQhW3TV06I+RnS7A9ezWFrdXZtMdbKre6376MXTE5febgU2XAAbHEpJGKL5qD5+D6kBvFvg+KqwkV4ACCUj6SHYfPNzYwPjYA2oa6qaYzqafnb9hjT9cxjMoHJTGOIXQiG89H2az+F7jK5EGlx1jwAhNSaq1pQj2BjyXGgYuT8FPQVceMQfseeZLY1bAl088GWtdNxE4jTF3gwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6u2WmeUJyDbQxk4C6EGt2cBS80L70A3CK+5YS3cV1g=;
 b=tz7f94oSjKdIVbcHeKp2gv5q97to6j750Brn3P+M49CpSSFqA3yy4N1HW4/IjtjnktA/BCc9l0BO9Y81FvKOELKbQMGKZFwYPjvh3jJRzeSuw3w9EiGUDmMvRE/zjpglCZ3xh1iToN7LlwSZi+Mi9Ln3RMBuBjU3tcRo6XjICDj5ly1s7W+wOtGwzEgMGcx7fT+oV8+ZJefNf3ek6bN/Z+hmbSuizZ9OxaW9hlX7KeBXlgNAACW9ZrliuFn8olaCfZGmk/g8lOdpBiAVznAG2QnK9gtaHVUxgCdSeVAkKSHlEs7rfjVuck5axIzmjTA5MKFgo5NwTrhnCDZvxBWQKQ==
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 18:25:11 +0000
Received: from DS1PEPF00053450.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::4f) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 18:25:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00053450.mail.protection.outlook.com (10.167.23.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 18:25:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:24:58 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:24:58 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport; Thu, 26
 Nov 2026 10:24:55 -0800
From: Tariq Toukan <tariqt@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, "open
 list" <linux-kernel@vger.kernel.org>, Shahar Shitrit <shshitrit@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH net-next V3 0/5] net/mlx5: Introduce mlx5_nodnic, a driver for DRAM-less NVIDIA Mellanox NIC functions
Date: Thu, 26 Nov 2026 20:24:43 +0200
Message-ID: <20261126182448.707782-1-tariqt@nvidia.com>
X-Mailer: git-send-email 2.44.0
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
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053450:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a90579b-6651-48b4-2c77-08df4bea9b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|30052699003|376014|1800799024|36860700016|23010399003|6133799003|13003099007|18002099003|3023799007|11063799006|5023799004|56012099006|261028144727099003|261026121527099003|261022105027099003|261102123227099003|261022075727099003|261026140227099003|261021123027099003|261009223027099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1R7N+Q/rTN85NuBXCGLdeliSnLkEa18twN39okF2tZN2dsx0PHwp+VxB2MZglpa7wfoNr5N7JidBVAYycT/zY32gVwcGJgUUbSFfgoPXNlrlwMtjztWmkBo9XpoeUocR7W7H0aJL+jZhWgiSPSMCXib94IwjnHYbWkXIWwiYi+1LiNtkY2l0owr04SWLBb5MhGakIP5fZOHnvGNjV9dWzSAUpBYm9J88+pQyjywF1v3nqWlEBGB5S0wy5HybHJzrvgJjlweQBgCRAOQ4eWml8QyJ0u0RCFFBGKJZ5MLqBMSfG3lr30lPJKC01M995L+GWbZy9Oz/Z2fSdcSEpb95H6GhH0LPF7kzdVa8qgyRkaisABHn35bLDwLaVqAvYRUSl3l1k/WDpoIZZ4CySFCN8w7dmvbZvN5TqY1o/mjVVjFhkrrHix+I9qcIiGFNSLhIuGECBvroyZrnsxPS+WnE2MahUMv4vZ0lKEjk6QiOb3e5ZfrnxOhB7iPUHpREI1drmzVTXiE7EK1hC7L9yCRoc5EBUjKBo/+q4ICkHN9Knv4ATWs9cYjn1oPYkLF63lz8lWGdiZY3VR4cfMd33D7pT6uM3CKQ7LJXTY8Dtq+LHPH8+u03klish40v3z+wKrZjlKzUiN9CL7kSpgDUrJQ37noUBQSW7tCylV7NgGkz8GdjeAvxtYSmtL9ra71Nfz2CL0Qd62EhG9S4v+/rHi5n1g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(13003099007)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(261028144727099003)(261026121527099003)(261022105027099003)(261102123227099003)(261022075727099003)(261026140227099003)(261021123027099003)(261009223027099003)(261021135927099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tIw47O9r3hAMc/0YTBN51pDAzSUKaBqEvpTvWFEjvy77d9HBNfHoiXEO2gmL/A/N+4Hwi3jn5fwXuY7v1//mxld7US+Pyq6eoxZJXjS5Qyu1LZ+TAC1QvpOKYJBYC+MRMnB7xhIPn3KKIYVjdjCHzn11sePzvXXsKg2ojyZi4V6hjO1/R4P14grpGriYCMB9JD8pI0GiV1jvQXeDFRsbCkZw/xPvrJcW1jJ3fXUPSf0QFnp4MAjwSQO87jko6KB7BvjCfJSh61/iZ5Tr85zYPb1n2s0q0VllODSLusMo6NZ1DviBWaGsowfM2ev8FIbHrDyTyQvTr+arebb961saZ9cB+1/IjE5a8v8n0+Sf/9rqVpVE4JiQJa+ZXfYIdn3xUtyo+XuIK6zbdXOf+wgVHS7927Kk+TDZWI+nR+NrGkt6NUPt4ejArHPqHcRs0GvT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:25:10.9119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a90579b-6651-48b4-2c77-08df4bea9b5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053450.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

Hi,

This series by Shahar introduces mlx5_nodnic, a Linux driver for the
NODNIC (No-DRAM NIC) hardware interface present in Mellanox/NVIDIA
ConnectX-family ASICs since 2015.

NODNIC is a first-class hardware capability.
It defines a lightweight NIC function intended for contexts where local
DRAM is unavailable or too costly: embedded controllers, management
planes, pre-boot environments, or any resource-constrained instantiation
of a ConnectX NIC. The hardware sends and receives ordinary Ethernet
frames via SQs, RQs and CQs. There is no encapsulation, no private
protocol, and no FW interposition: packets are forwarded as standard
Ethernet between whatever peers are connected to the function. The
interface is documented in the HW spec and has been in production in
non-Linux OS drivers for over a decade.

Where it is used today:
- Embedded management controllers on ConnectX-class ASICs that need a
  network path to the host without consuming a data-path PF.
- Resource-constrained SoC integrations (no local DRAM) where a
  minimal-footprint driver is required.
- Pre-boot / early-OS environments (PXE, iSCSI boot) that need a NIC
  without a full mlx5e stack.
- BF4 management PFs (one concrete deployment): on BlueField-4 the
  firmware exposes a NODNIC PF on the host side and a peer PF on the ARM
  side, using standard vport forwarding to connect them. This provides
  in-band Ethernet connectivity between the host and the DPU OS - SSH,
  PXE, and any standard networking application work over it without any
  special handling.

Design notes:
- The driver is separate from mlx5e rather than a mode within it.
  NODNIC uses PCI Vendor Specific Capability (VSC) for command
  operations - reads and writes over PCI config space - instead of the
  DMA-based command interface used by mlx5_core. This is what makes
  NODNIC usable in environments without reliable DMA access, and it
  makes the two command paths fundamentally incompatible. Folding this
  into mlx5e would mean carrying a second command transport and a second
  resource model through code that is already dense.
- A single SQ, RQ and shared CQ are exposed per function, with two MSI-X
  vectors: the data vector fires on CQEs and drives both TX and RX
  completions, and the event vector notifies on port state changes.
  This is the hardware's model, not a driver simplification.
- The driver exposes a plain netdev with no private uAPI, no ioctls and
  no vendor-specific configuration surface. Everything is driven through
  standard netdev and ethtool interfaces.
- The code lives under drivers/net/ethernet/mellanox/mlx5/nodnic/ and
  shares no paths with mlx5e, keeping the footprint small and the blast
  radius of changes contained.

for Sashiko:
- Where possible we keep the design close to mlx5 (checksum, VSC API, RX
  refill and else).
- We don't implement suspend/resume flows at the moment.
- We don't implement SW timestamps at the moment.
- RX modes aren't needed and the driver doesn't implement
  ndo_set_rx_mode.
- For sizes and values reported by the device, we trust it to provide
  reasonable values.
- This series only wires the basic netdev stats (packets, bytes, and TX
  drops).

Regards,
Tariq

V3:
Address the Sashiko AI review comments:
- Convert PCIBIOS error codes returned by the config space accessors to
  errno.
- Preserve the FW-reported CQ log_size when programming the CQ address.
- Compute the UAR offset in 64 bits.
- Enable NAPI only after the RQ is set up, fixing the open error unwind.
- Disable the port when open fails. If the port cannot be disabled,
  clear bus mastering before freeing DMA memory.
- Use netif_txq_maybe_stop()/netif_txq_completed_wake() for TX flow
  control.
- NAPI poll: handle budget == 0, return budget when the TX limit is hit,
  and update the CQ doorbell record on every poll.
- Rate-limit the error CQE prints.
- Use u64_stats_t for the counters, and read the TX byte count before
  releasing the WQE slot. Also count error TX CQEs in the stats.
- Restore the trailing newline in the Makefile.
- Check pci_save_state() return value.
- Change 1 << log_uar_page_size to 1U <<.
- Add NET_IP_ALIGN to the RX headroom, so the IP header is 4-byte
  aligned.
- Restore bus mastering in mlx5_nodnic_enable_port(), just before
  setting dma_en.
- Return send slots to xmit (sq->cc update and queue wake) only after
  the CQ consumer index has been written to the device at the end of
  each poll.
- Count received packets and bytes before the skb allocation, so packets
  dropped on allocation failure are still included.
- Restore PCI state even if FLR failed.
- Remove the redundant CQ consumer index write from the arm function to
  prevent overwriting a newer value after NAPI ownership is released.
- Disable NAPI before stopping the TX queue to prevent completions from
  waking it again, then quiesce the port after TX submissions have
  stopped. Reorder activation to mirror the deactivation sequence in
  reverse.
- Fail queues opening if the device in fatal state.
- In health polling, check first if the PCI channel is offline.

> +	if (err) {
> +		mlx5_nodnic_core_err(dev,
> +				     "pcie_flr failed with error code %d\n",
> +				     err);
> +		return err;
> +	}
> +	pci_restore_state(dev->pdev);
Could mlx5_nodnic_dev_init() in
drivers/net/ethernet/mellanox/mlx5/nodnic/main.c restore saved PCI state
on a reset error as well?

[SS] A device that fails to come out of FLR is treated as failed and probe aborts,
so there is nothing to restore it for.

Would it be appropriate to hold pci_cfg_access_lock() across the
save/reset/restore transaction in mlx5_nodnic_dev_init(), in
drivers/net/ethernet/mellanox/mlx5/nodnic/main.c?

[SS] pci_save_state() does not require the caller to hold pci_cfg_access_lock().

> +	dseg->byte_count = cpu_to_be32(skb->len & 0x7FFFFFFF);
> +	dseg->lkey = cpu_to_be32(sq->ring.lkey);
> +	dma_addr = dma_map_single(sq->device, skb->data, skb->len,
> +				  DMA_TO_DEVICE);
Could mlx5_nodnic_tx_build_wqe_ds(), in
drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c, handle or reject nonlinear
skbs before mapping the total length as one contiguous buffer?
Pktgen with a positive fragment count and start_xmit mode constructs a
fragmented payload and calls netdev_start_xmit() directly. This bypasses
the ordinary feature-validation linearization despite scatter-gather
offload not being advertised.
Pktgen allocates full-packet linear capacity, so the demonstrated
regression is not necessarily an out-of-allocation read. Instead, the
device reads the unfilled linear payload region rather than the fragments,
sending incorrect bytes and potentially uninitialized allocation contents.
Could this path linearize the packet or map its fragments separately?

[SS] The driver doesn't advertise NETIF_F_SG, so the stack linearizes skbs
before they reach ndo_start_xmit. Only pktgen's start_xmit mode with frags
set can hand us a fragmented skb, which bypasses that validation. That is
a root-only test configuration, so we don't handle this case.

> +	fatal_error = mlx5_nodnic_health_check_fatal_sensors(dev);
> +
> +	if (fatal_error && !health->fatal_error) {
> +		mlx5_nodnic_core_err(dev, "fatal error detected: %s (%u)\n",
> +				     mlx5_nodnic_fatal_error_str(fatal_error),
> +				     fatal_error);
> +		priv->health.fatal_error = fatal_error;
> +		dev->state = NODNIC_DEVICE_STATE_INTERNAL_ERROR;
> +		mlx5_nodnic_print_health_info(dev);
> +		return;
> +	}
Can this fatal transition in mlx5_nodnic_poll_health(), in
drivers/net/ethernet/mellanox/mlx5/nodnic/health.c, also exclude subsequent
interface activation?
If polling detects a fatal condition while the registered interface is
down, an administrative interface-up request still reaches
mlx5_nodnic_open() -> mlx5_nodnic_open_locked() in
drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c. Neither function checks
the fatal health state before mapping the UAR and programming the queues.
mlx5_nodnic_activate_queues() in the same file can then restore bus
mastering and enable the port if the hardware operations succeed. The
VSC offline check does not reject firmware reset requests, NIC
disablement, or NIC software reset based on the recorded health state.
The open path holds priv->state_lock, but the timer does not participate
in that serialization. Could the fatal transition be coordinated with
open through process-context work and an activation guard, so this
regression cannot permit hardware programming after fatal detection?

[SS] Health monitoring here only detects and prints. Fatal-error handling is planned for a follow-up.

What establishes completion of device DMA before cleanup releases the
buffers after this fallback? pci_clear_master() neither reports PCI
configuration-access failure nor explicitly waits for outstanding
transactions, yet cleanup proceeds unconditionally.

[SS] fallback is best effort.

How will netpoll reclaim TX descriptors when an RX CQE is ahead of the
send completions? Every zero-budget poll stops at the same RX CQE.
During panic netconsole output, ordinary NAPI cannot be relied on to
clear it. Once the SQ fills, diagnostic packets remain unsent; netpoll's
bounded retries only defer them to a worker. This needs a TX progress
mechanism that does not perform RX processing with a zero budget.

[SS] RX and TX share a single CQ and the ring is consumed in order,
so a zero-budget poll cannot reach TX CQEs behind an RX CQE without doing RX work

V2:
https://lore.kernel.org/all/20261008171821.660739-1-tariqt@nvidia.com/
- Fix sparse warnings in the VSC accessors: use __be32 for the
  big-endian accessors and drop the redundant le32 conversions, which
  were also wrong on big-endian hosts (Simon Horman).
- Cover letter: drop the devlink mention (Simon Horman).
- Replace the open-coded bitfield macros in the VSC code with
  GENMASK/BIT and FIELD_GET/u32_replace_bits, and turn the config space
  accessor macros into functions.
- Fix line wrapping reported by checkpatch --strict.
- Add a MAINTAINERS entry for the driver.
- Kconfig: select PAGE_POOL, fixing the build when it is not otherwise
  enabled.
- Drop inline from a function in a .c file.

V1:
https://lore.kernel.org/all/20260930125708.144767-1-tariqt@nvidia.com/

Shahar Shitrit (5):
  net/mlx5: nodnic: Introduce the mlx5_nodnic driver
  net/mlx5: nodnic: Implement data path
  net/mlx5: nodnic: Add TX/RX statistics
  net/mlx5: nodnic: Add ethtool driver info
  net/mlx5: nodnic: Add health monitoring

 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/mellanox/Kconfig         |    1 +
 drivers/net/ethernet/mellanox/Makefile        |    1 +
 .../net/ethernet/mellanox/mlx5/nodnic/Kconfig |   19 +
 .../ethernet/mellanox/mlx5/nodnic/Makefile    |    8 +
 .../net/ethernet/mellanox/mlx5/nodnic/en.c    |  286 ++++
 .../net/ethernet/mellanox/mlx5/nodnic/en.h    |  162 +++
 .../ethernet/mellanox/mlx5/nodnic/en_cfg.c    | 1152 +++++++++++++++++
 .../ethernet/mellanox/mlx5/nodnic/health.c    |  315 +++++
 .../net/ethernet/mellanox/mlx5/nodnic/main.c  |  866 +++++++++++++
 .../ethernet/mellanox/mlx5/nodnic/nodnic.h    |  105 ++
 .../mellanox/mlx5/nodnic/nodnic_ifc.h         |  318 +++++
 .../mellanox/mlx5/nodnic/nodnic_pci_vsc.c     |  347 +++++
 .../mellanox/mlx5/nodnic/nodnic_pci_vsc.h     |   45 +
 .../net/ethernet/mellanox/mlx5/nodnic/rx.c    |  174 +++
 .../net/ethernet/mellanox/mlx5/nodnic/rx.h    |   25 +
 .../net/ethernet/mellanox/mlx5/nodnic/tx.c    |  237 ++++
 .../net/ethernet/mellanox/mlx5/nodnic/tx.h    |   61 +
 18 files changed, 4131 insertions(+)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/Kconfig
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/Makefile
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/health.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_pci_vsc.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_pci_vsc.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/rx.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/rx.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/tx.h

base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
--
2.44.0

Issue: 4971712
Change-Id: Ic857b4c8532a35fbadbfe6056a97c6d711829e6a
Signed-off-by: Shahar Shitrit <shshitrit@nvidia.com>
Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Shahar Shitrit (5):
  net/mlx5: nodnic: Introduce the mlx5_nodnic driver
  net/mlx5: nodnic: Implement data path
  net/mlx5: nodnic: Add TX/RX statistics
  net/mlx5: nodnic: Add ethtool driver info
  net/mlx5: nodnic: Add health monitoring

 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/mellanox/Kconfig         |    1 +
 drivers/net/ethernet/mellanox/Makefile        |    1 +
 .../net/ethernet/mellanox/mlx5/nodnic/Kconfig |   19 +
 .../ethernet/mellanox/mlx5/nodnic/Makefile    |    8 +
 .../net/ethernet/mellanox/mlx5/nodnic/en.c    |  295 +++++
 .../net/ethernet/mellanox/mlx5/nodnic/en.h    |  168 +++
 .../ethernet/mellanox/mlx5/nodnic/en_cfg.c    | 1158 +++++++++++++++++
 .../ethernet/mellanox/mlx5/nodnic/health.c    |  303 +++++
 .../net/ethernet/mellanox/mlx5/nodnic/main.c  |  869 +++++++++++++
 .../ethernet/mellanox/mlx5/nodnic/nodnic.h    |  130 ++
 .../mellanox/mlx5/nodnic/nodnic_ifc.h         |  317 +++++
 .../mellanox/mlx5/nodnic/nodnic_pci_vsc.c     |  347 +++++
 .../mellanox/mlx5/nodnic/nodnic_pci_vsc.h     |   45 +
 .../net/ethernet/mellanox/mlx5/nodnic/rx.c    |  174 +++
 .../net/ethernet/mellanox/mlx5/nodnic/rx.h    |   25 +
 .../net/ethernet/mellanox/mlx5/nodnic/tx.c    |  265 ++++
 .../net/ethernet/mellanox/mlx5/nodnic/tx.h    |   65 +
 18 files changed, 4199 insertions(+)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/Kconfig
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/Makefile
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/en.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/en.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/en_cfg.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/health.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/main.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_pci_vsc.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_pci_vsc.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/rx.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/rx.h
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/tx.c
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/nodnic/tx.h


base-commit: 612848d37e68b858e15815175f1c5e609e09d719
-- 
2.44.0

