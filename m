Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794871218;
	b=FE6C8qYU9RCP/pdCAYQQ5G+w5yI1VbVNRgIgIG1vR9AV8dyhfAIh4e+uxTI/JcxkSJrt
	 FW2cgDbkq/SM3Kv3aWhv5Td/xHCok4Z3yY2YUmsn+WQYpyvSM9dqtErQZle1a04jQCnqv
	 Kdt43kJtALkVPZP6sYP3F+AX0RK8qkl93bD6IO4gPuq72fQli/P/9iQPAp3ilF1YQG4kI
	 PbcruqNLh+g+z+ycejJvsqbESsn62D7hpmoUwdbG23vun/0x/IJ6DA/7WWuCVRZ3ZkwrL
	 KebFkq+Xz5mVYkfbj1c7WJtJV7O4QAbIQcbrXlSzWoQs+EAyyFXnVHeAUQjnH4aAA2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871218;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:X-Originating-IP:
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
	bh=BgJPVDEph1qh1lMgKGyGaQ8D/HSd5m7B8VYHpaLSdYs=;
	b=M5slJYsKENmI29u+TeNRlLdXm6wdyTO9CBDfeQ5LmVxNZIyKC4B2R3BJCGblyWMqZaNa
	 5UqD/cgBCsYNNbDCS3SFHB9N9gYVGiCrjbmseOxF6RvFNo+MCFaydXwHZxgXKohQiIvIk
	 GykdVUp8PUctbjY+0/Yt4e+iOtqWoGkjrIaj91uF0zlvvh88yS3e7BtJGsjfvCRuvs39P
	 0hxagDBfyWJH1FNImSq5q0X2x5oTXlyihdhk2RB594gZUiVEWvoqwvMrgfargqQ3cZmvG
	 s821tcMaAtUYRuuYYiK86XQnZdnw9q9qol3QGZReXTqEY3HbI5wQIrIIHOCWnRB9U4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VZfddsSW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.11
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF2B606A333
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF2B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VZfddsSW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWJyEovXfi5XB2K2kYjZLR7GyPeffpuOPim5igNW2hl4q3ga7V8p6yoNTfPmk3exWORqQ7cqKfd+KJr0LatF8stNuHFQJbeFrnWcAN8lk6Mr3v9GTybwIKybpwm7cBV+lZc9AYtC9cwrFKru3il+596FUX/yXiyRKILGLIHwhF5OqX4vanw0eGYDp7Tf7LCXfpIgPcj/FJYo0h5FE5h0yrbN6Xxyk6CGRPIGBML2wPPvn/FTxGoiiEbjMlfx6G0pqLtKHma1qmGbD3cmoJoy4xnpvIuW/X/qAfapElKNDdxDXMZYpfrmb14wwaxK1hT/m4mYlQRMEv/MsOGKC8avBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgJPVDEph1qh1lMgKGyGaQ8D/HSd5m7B8VYHpaLSdYs=;
 b=pdvie8j6dAdJwmzA4aZKYjsaDND4NX/vRbdKAdpN2iCI3Z3+PbxM+LdmZCeNbXYOyWkbzS/SPv8tiuaYws34nKOiGVnjaQwEXg4Fwle1Zf5E51glW7qtqn4SHUEyOTfR1IjRYmxDGQpXXmI2UjNCkTrVAGVC1McPqdRse91UFzp7S81iCFRuByo8kjTgL3oHd2lCBHj7b7SGU64enkqriyghHUw6ANZ0MqtWfrufDsbzxNctx1Z/YepusMmmC8/27Wx08p+tGyjtUZaBxDMdJporZGaeHyUZbLREOWAncyMNYveTeYiYpDOwrq4XxynOOGAb4H+k3+i4tYneCARGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgJPVDEph1qh1lMgKGyGaQ8D/HSd5m7B8VYHpaLSdYs=;
 b=VZfddsSWG76CrpU/7fWCblW3Q7LlhCv9iek6LtxO8+iV8DDsag/H7TjtaGte+CcOfchQUAk1mtrlBsvQdg07cLDhyJ9KzbyBS2jmbCmzjx9egOQYPf47kOQLdhOHsqjUvQvwTU3FJHaMMdO8AqaR5X/CLc57nticymO65n7jTkk=
Received: from PH7P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::28)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:20:13 +0000
Received: from PH2PEPF00048914.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::77) by PH7P220CA0014.outlook.office365.com
 (2603:10b6:510:326::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 23:20:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH2PEPF00048914.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:20:13 +0000
Received: from SCSEJOYNER01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:20:11 -0600
From: Eric Joyner <eric.joyner@amd.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Eric Joyner <eric.joyner@amd.com>, <netdev@vger.kernel.org>,
	<brett.creeley@amd.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<pabeni@redhat.com>, <horms@kernel.org>, <vadim.fedorenko@linux.dev>,
	<nikhil.rao@amd.com>, <edumazet@kernel.org>
Subject: Re: [PATCH net-next v3 2/5] ionic: report the configured FEC mode in  ethtool_fecparam.fec
Date: Mon, 16 Nov 2026 15:19:58 -0800
Message-ID: <20261116232001.2453595-1-eric.joyner@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110212621.2294782-1-kuba@kernel.org>
References: <20261104-ionic-get-fec-stats-v3-2-b261fd53d0a7@amd.com>  <20261110212621.2294782-1-kuba@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048914:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9aa61d-4336-4f4e-b13f-08df44382a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|261009223027099003|13003099007|11063799006|4143699003|56012099006|261026121527099003|261022075727099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XeRgVhHqhy19UB5nrJsc6YFpAz2/bySOsTPnKG8tigQpYh2mYN8xUen0BiH5jeKCQMONZGE/XLBNQzrN4ln6uGaaO5w9FDkFvJoBhS0S8SnVxVAA1Lyoh3Nb7qNC/tUgJ22VUn2CZnrgoHGQtGqlECQ9NVCjuioURx/UHJ3ZOGGtgJ5GAr8ZPfwtGEEeXLOejwJTox++XVQ6IEWKarvDUW1q6id7sQ3nFZUW9pxzO5L6FCyDmM5yDVvGlix2MY4S597WfsN4RvHCiKhBU8P6m5kKJBQLHkEHxhInUHv9cl11agho7AnmE596HKDsAY9MUVlcYbdWGHwfjMNcGiAA36xWPNXsAwGWCLZzxCmPfSOzJWmkHIZ650+xTsI+jEJms4H/m+wxywaO4iAypPWoQnoIAXHZdX26UyvtRl+cKmWXRZZd3aTD80l0h5Aar0LOSO09Kcs8JXI+FBjvwVs0j4lZMZkMABCAB9f+lhNSHopUI0oaiCk/UB2MXqaHWdfO58Lt9yTJ/55ft0MCdJMXn9tXWquIhujL29uPaoDFWY+Ht++Op+0QjHbxg82XCD3IUyAUc7oObMCOMtYbFfyAK7YHq6kwNrsmA4LKqBL0THLAOAsCwvB5sD66OPnzyX29f0emUwzxs0E7fehvFqnP2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(13003099007)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022075727099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FTrTn4/kw4sxK/CMEbXlwcagYw1ZVGrcaMApBhjP4mDXBaRU9FscGFguURjJBGDrDEXqVvhC3l0I3oDBQfef6iGKA+M5cMI57clkr0b4hxFX6jnbshpKsy2p1OETDFRnCu7nSG+opg1F7jlcU847zm1Crs8ujZoCYMF40RqdKS+tPrFdjcE/kY3zjiUXlvXGe2cguqOprz46T0t3/N5iSqplDpnX1TH7j0XlvOBZVL2mTJY/DvmwVl6yq4gHRo7y4Bb/AC/TrskbBk8b3CpAe3YZJEk0YD2+qCxii75h4tq6C6ulWXOV6CGU3kypYijp1yKypX1eNqHiBH249M4MS20pSL0cSWJh0pnyDkOgx3CFXGiRUEFL5lpPSxzS/yFzRXaC2Guh2brzr88ZvhkMmiDR0iOzW2iyvZkONajPNdnFrPtXOaJW9jITapMnh9DU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:20:13.2338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9aa61d-4336-4f4e-b13f-08df44382a93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048914.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

On Tue, 10 Nov 2026 13:26:21 -0800 Jakub Kicinski wrote:=0D
> Should ionic_get_link_ksettings() add FEC_NONE to supported, and also to=
=0D
> advertising when config.fec_type is IONIC_PORT_FEC_TYPE_NONE?=0D
=0D
Yes, v4 adds a patch before this one that does both.=0D
=0D
> A related issue is pre-existing and not introduced by this patch.=0D
> ionic_get_link_ksettings() hardcodes RS and BaseR as supported for every=
=0D
> transceiver and speed. It ignores the firmware's per-port list in=0D
> union ionic_port_identity.fec_type[4].=0D
=0D
Firmware doesn't fill in that list; it is always zero. Since the driver=0D
can't tell which FEC modes a given port supports, the supported list=0D
holds every mode an ionic device can use, and firmware rejects a request=0D
for a mode the port can't run. The new patch says so in a comment and in=0D
its commit message.=0D
=0D
v4: https://lore.kernel.org/r/20261116-ionic-get-fec-stats-v4-0-d25cae9f1e8=
7@amd.com=0D
=0D
Thanks,=0D
Eric=0D
