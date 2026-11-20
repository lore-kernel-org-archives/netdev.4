Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206288;
	b=YriQdpu5DCvZrheOcgYMtnjUvBn2hvRKZ2DikhW5eOsr9Lbyjzf374pWP8kR8NIWLvbQ
	 671oLualCNqoWwHyGpJhUM6o4DDqNXvXCQwhRj2VP/8l0uiRgBuOPYYNpQKylQB4HDQSm
	 trzTpWLr84Y/iOkx/NNwBPf9ui3mqDzAVShwkoUVE9g20PbmO8/ss7JhRz7/zauz6vODu
	 Jhtt+abtOIzAgrKeU7p9hBZEiiPNBdlo+2yWmO9Cmg/2I5wWWA6F3en2WIhcUxo9BVkDM
	 XCL87JlIPlhb5yh9+apFhmiWUHxnFv+zXSKZ/6xDNO4apbfK7lsvHkbuAsT/a58RDfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206288;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=fOjzkhKVe6wqjHjm/25kVAoDYXWVerreZf2WrlgkF9E=;
	b=h4kaJYlyBrDEJZKPFTjN+NfmhcbWx6K0a6HjfXNCMKknb7GCRPEWs1+eRgCdiKSLbtMt
	 YHhq4tcYNruYb+m/QV/lV/Vau0sj/RvgV1JV+RxdeSpaofoNZpWZ1wLf/dNcXJwTvstR8
	 CTzQOarFELuu4fYQIqscf3eWlNb4aBCO4elcCmRdhzag8hpC2v/MIXWhO3W9RmOsTmAat
	 HdhzZZgieDxL+H4jtPxRGcoSgU0g7AGY3OBUvHzFyYhMuSFPBUG9TSeAFu7aMIseIFq+P
	 3HaRlc+DCFTf7k+9rKnk/OwgbKqmhDCZODT5gY30oFC9dxXxopjehe0Tevi7GskMY/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VVdKLcqW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.29
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511F8606A332;
	Fri, 20 Nov 2026 20:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511F8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VVdKLcqW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIJTTtbNoB6TU2652hOXXsGOSRsp8n46iImpnpHyJrf8HTZXOCbiqyvcPi35WD61AHiwr6XwqxOddrfpTEytv37S0snqOl3a7VHQTHmszC9qhnqCM75AzQrLOakst4VEgleXNAEaMFSn3TTuTmMcDROBXqh6eC9losE2mXv3npbgkyb+OyCBlZgcVT9X/koKvEHLQZECtQZqkQZLwIHlyefpDkpdA/3dVcRiZVhEGRN5m0uRB8MU2M83AlOuEAr/UlEKEwMibLmo6RjKuQotr0wY0XMzLY2jFAfTn4hqBhPzcjF7VgdOFwpp+05FiPUs5CS2cTRTDEaBWl++koaURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOjzkhKVe6wqjHjm/25kVAoDYXWVerreZf2WrlgkF9E=;
 b=sEMcF8nCgR+jD/e5Jh1Z86Zcf4E8Psn7B25OoZoUYFlRyRVpDw+ge6Sun10rqcbSGPABpatuK3s6yQL3AGZcEi1nJl0geJv2SpTDSKeqequrDGoiz9imTRpLyapg0rEkJve2jSzI5e5czyl92rnpA6XksIiwetGUe8Y/1UBcV7+ly2h86Gf4Py5DkCp89RU5x7xqFUB4TOz9WlwmJi3lEWSWj812ZlP3Op3fplr9JjKZ93MRlFG1MrsHQN5rEdQGpd3hhO9u0owXm8Z5gLPEHNs+Q6U1Bn/OZGmNx5s3dY/ugLeqlMyTs/RypoqV8v1yVp6pGal+OJE6OYYE0gklxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOjzkhKVe6wqjHjm/25kVAoDYXWVerreZf2WrlgkF9E=;
 b=VVdKLcqWnWR+bOFuhE/zEeahwjQNo7PIVWrlye+X4y1Yi5uAAo8ViIq+mYdWSF0jckDQAL5eNt1/mB3Lm6ugvpSsxq1U1m0ONjdfp6P9b+xzQgkCn7FHZNRJxDay3sUrZ0yh/GXkkYb3jFXOrjLNhYMRTmMtx+k+BU1oFQT/GZrxwL3rTq7Fuj2Dv8h9O4i+nPsaNJG3yjO0APBmOeQZQF8YeD+e0iTXLxTwEmGOZqBHI4GPaOIeH56q4fZuk9GWNyYueLpNFXMbR+IQBw/0Z3ew/EV/ZoaiAAKP+oBuDKzxvpM53kbJs8vjS9UFlUyWLPa3wYWVOGyW9X76bJbh4Q==
Received: from BN1PR12CA0027.namprd12.prod.outlook.com (2603:10b6:408:e1::32)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 20:24:35 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::92) by BN1PR12CA0027.outlook.office365.com
 (2603:10b6:408:e1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 20:24:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 20:24:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:24:16 -0800
Received: from vdi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 12:24:14 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <davthompson@nvidia.com>,
	<cbabroski@nvidia.com>
Subject: [PATCH net-next v1 0/2] mlxbf_gige: disable MAC after panic
Date: Fri, 20 Nov 2026 15:24:01 -0500
Message-ID: <cover.1795206150.git.cbabroski@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: b46fb927-1393-4e2a-6f54-08df47444b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|261026140227099003|261026121527099003|261021135927099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261102123227099003|56012099006|11063799006|10067099003|18002099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	K7ZItRYY2FrlVgyTur0A4t2++AzIdSNnzCBMBfIUA8yre7NFRs+bx3L9ms1Uu4E2bRjlOaGj6G4+ZvmwuV97kw7bBQtAxXM0eawC8Cus/S/dyYxOi7xZf5JFkZcxUFcGzi7h1L1TffxQS+Jt04OM4naV0jJSa69XnkSQwXPvX+iOP2RSLGF4TePo1y+qyIUH2GuW/Yupjj9tF+O9Ax5LzehgXBFRm+dcKOvsPIk8TRyr3sMo27tZSHfQ8a8ukbdGweY/r4btq+xn9KzUJdAIJaTtRX/jDU1K+4JUj+tZfgCYikDbMd9emHAYWhWb8VPl8xHO8B1rW0WE6Z279GfmsdiInJa528kab5RlULEGW4EzHx5ftGwq+fFsxHelIytaa6250BQYiWrxt8Ras9msAXm37gy4zU8mw5PEKhyu9Fu5LTdWK0cj7CjtmZMvMZ3sEnSDjcJPbS4mfSrCQ0uFy5QW5UBh9XEJBr/8oHx2mcQeGpqNHq0SuSnWZ7jRd8hHk8FPEYBHTqiYeJvTK0BzX+0XiO5Aa0m3y4JvAYbtrPoN49rv1JpZgUoH330Ma+2FOP/29bJOy+Y1fS8utwhTQGpadu4Veihb+QfJe4HSwuVSZv1wLpuUTFlltFfYnIsGTu1JMCkDvmR5Q98j003ZL7z0enij79Tc9kLklo6LNFT0FoqNu5/fdC0OdULU/6MsHuNkEzC/Kmw44n04XjdJZw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(261026140227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KsvEUo7ffWSk9orY7qqNO72GMSCqRhKdAYx3Jom+/upGqvAjEXuDRzxjYwLRECl/FylSacyH4J3feO17i+iPxXIXAId2bngqJWElL0VW0QVwOyOaQGU673cTqekUtxf9TfVA1xBLJt+oIbldq0gbTHe0RBlXLhXBexzLW5u+JeH+6QwVWdLoRF+0SSQDibfNZq/ThwSXVeczAxIxWBHbMOcbDALdNHfOlf0TiNvpqo+6EcwUFLgZmLnnw7a3iHZZkORmIO7Yo4kaSH8fpP3fvHoSuyAMztt9g+pQx61xlPMoPLqsyRxdwno37VGQRMs33LzypREqLk7KDK0cFBWCmi600HxdmxKKRZ/u4yDcjynUrxsb2H+OB07gD5Qs7EoC3uL1+g9GOo9CPjZu43iqiacp/GAx8/rExa/D89W8Dd/6rJbszViT1air30ub4abw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:24:35.6010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46fb927-1393-4e2a-6f54-08df47444b5f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260

Background
----------
On BlueField 2 and BlueField 3 the MAC HW is designed to repeatedly send
pause frames to its link partner when the RX FIFO is full. The internal
Ethernet switch on BlueField that is connected to this port is also
designed to stop traffic on all ports when it receives a high number of
continuous pause frames from one of the ports.

What this means is that when the MAC RX FIFO cannot be drained (e.g. due
to panic), it is possible to reproduce a scenario under steady and high
network load where the network becomes inaccessible for other devices
connected to the 3-port switch, namely the OOB host and DPU-BMC.

What this patch series does
---------------------------
Register a panic notifier at highest priority that disables MAC RX and
clears the RX FIFO to ensure that the MAC can no longer receive packets
or send pause frames after a kernel panic.

Add protection in the mlxbf_gige driver for the case when firmware
disables the MAC after handling a fatal error or panic that the kernel
could not detect.

Testing
-------
The following testing was done:
* Verified no performance difference when testing with iperf.
* No regressions found when copying large files to and from DUT.
* Repeated module load/unload succeeds.
* Bringing interface down and up repeatedly succeeds.
* Flooded the interface with broadcast packets to keep MAC RX FIFO full
  while monitoring pause frames received on the internal 3 port switch.
  With this test setup verified pause frames stopped after:
  * ATF FW panic
  * kernel panic triggered with sysrq
  * power off
  * reboot
  * module unload
* No unexpected kernel Oops or warnings when implementing custom ATF FW
  to disable OOB MAC while mlxbf_gige is actively draining the RX queue.

Chris Babroski (2):
  mlxbf_gige: protect against MAC disable during TX
  mlxbf_gige: disable MAC after kernel panic

 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige.h |  2 +
 .../mellanox/mlxbf_gige/mlxbf_gige_main.c     | 39 +++++++++++++++++++
 .../mellanox/mlxbf_gige/mlxbf_gige_tx.c       | 29 +++++++++-----
 3 files changed, 60 insertions(+), 10 deletions(-)


base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.34.1

