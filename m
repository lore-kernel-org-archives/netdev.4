Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795096964;
	b=q/dZtg4cKcIyVueEIz3cJVMo9FuAh4wS4lnggpATDmYSQiX6LnI0xECF15PfY/qLHQEG
	 /XLUtGlICTuEcbkE8d/xMFKFbQHKG7IghO2TjSByZ1riNHmhTTY4krz7cNEg4IxMI6j8b
	 1J2StquhzemRuePL0ruDY+yh7tYzxr0g81kfbVr4NcWagFzm5nIYst2cQVvrrQ/8B1+sz
	 /BVElU02RpFlub3wqad/dtfsaEO/esBrCWYyZUkFJ0rQK2zyoEWJj53SGFb7fAE40XtBd
	 PLW+yis44+l/yqvCmKBnHe9GjofYRvGrol8/D+OaB4ddQxINTxIH6S5nKahw2cb8Pqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096964;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jrLD3Vdlqi7/AG7cVcwm4XGfjbfO5m4XBsATWO8+M1E=;
	b=5I5jgS0P42LX7jU/7BBUiJIQ9PBn1dnDKVMQcf0dXzkbPYfrk79jE1I1x64cdF/fKYJy
	 Td53THos+7gAD1YnaK4nBeN1V94bc3CbWhma6FWVlP2pOZz1iCVehoKu9oFPN5+7tYEwd
	 KQrPOfS+DUbPcW3hYIVk9PQU5cDbpj2kFFEStOXwvgyGHjpTt0XUgbn/PflPBnkizMv3e
	 5LNjrIOKEnlybvgaOoJTfvllGLXNbeTEh/vNKVNChG2oUAwDX/F9T28r+Ptt/PbKU6uPx
	 L90z8JSGz4PIm+HbNkJywEv4NVPhEDlO3GrgFxxgnywfKz6VNunm79BHLv5wuuj/Dkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=mmWVL6f1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.99
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020099.outbound.protection.outlook.com [52.101.189.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F2D606A320;
	Thu, 19 Nov 2026 14:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F2D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=mmWVL6f1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1qMqFKzASydAMCL0dYpWqQNOme0qrs00GoyqjgxLD9Z06Dc+bCVvwJGLLQiWCf7Yw8d7XZb+kCWCYLkQTZaglwdDGOXIq/s+apEx0IiICpDk0LATo07kRnbOmctckUwE3LVuVeVH/ELT7+83qy0TUh5qdiNxVQhRZasGxo9OmbRaY/5BNH8Nj/WE+PmCRT9Kg2YzasS+4EpbTcCXuE+P9Z10X+Srlh84+ACL2xGsvtfBfVL+v8rlIvdPP7cs9Lp9SrL7aGs0JZb6Fl+wL/szois+2CATd9NKAs2Rc0OYYb9ZDykQfoNVM3xF+9vFs0rq7b3joipjoMUrt7Wv7kKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrLD3Vdlqi7/AG7cVcwm4XGfjbfO5m4XBsATWO8+M1E=;
 b=FGELMfs/fmf5qWpwYVfuF9Ik2gzCgmWnxGTmnnFiQ5wRO9RnlbDji34lxI/3A46/e8g/Ksd2DI18sgGQsO/2oDmjNwvPkdmt+FbhEf3mJGpPsUONDh+cYjzqGNEa/LU/BI/ujGdrcWaCYztID1cXsb75F281oqWfr2+700Gd6PwXoFarC19XVDMns/Ro6xYPBQLSOPbuG1WkrHlAh9sTWvpaLIt1NF6RhKFinIBtiyKfjZkBveoRjwNLMz6Hy0/HGMm+eNcqthZJJPUB0zMYhH+1Uczo3lwdJnac1aoQsq+z4B9twJMWfWKIpPlFckVbaaPbEHGgsfaObuUh8MT+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrLD3Vdlqi7/AG7cVcwm4XGfjbfO5m4XBsATWO8+M1E=;
 b=mmWVL6f1DsNCq1HlzjMtingH6SFFovHCZe0upEJ8oxMt0gJIPZ64n77fNZxyoeiB5vE8VO6DLXeDTTVminx3lXgV4lE08UKdZVs/soyRH42C1e6L3OsX+lz8+8xdF+cE593bi9dwQJSJ9yeKrGnA7O29q+mtcKKqcdTRCS1J4Nw=
Received: from YT3PR01CA0131.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:83::7)
 by YT2PR01MB503061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:02:39 +0000
Received: from YT2PEPF000001CB.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83:cafe::3a) by YT3PR01CA0131.outlook.office365.com
 (2603:10b6:b01:83::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 14:02:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 YT2PEPF000001CB.mail.protection.outlook.com (10.167.241.23) with Microsoft
 SMTP Server id 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:02:39
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 0D53B9628;
	Thu, 19 Nov 2026 09:02:39 -0500 (EST)
From: Curtis McBurney <cmcburney@telcobridges.com>
To: netdev@vger.kernel.org
Cc: Curtis McBurney <cmcburney@telcobridges.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	toke@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: net_test: add tests for netif_tx_stop_queue() trans_start
Date: Thu, 19 Nov 2026 09:02:36 -0500
Message-ID: <20261119140237.3070863-1-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <179506670414.3136.7943679597590478564@kernel.org>
References: <179506670414.3136.7943679597590478564@kernel.org>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PEPF000001CB:EE_|YT2PR01MB503061:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48888fbb-323c-4539-3fc0-08df4645c5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8guW+KxNOLvsZfJy6Rfjwb3lnsDyM2XeYHkmmXXZALO1ffokatGvjap6DMNvMTuNkXqjiwrZCb/d1jdxvCIo97Pu0pDyd0x1qcqds2DfZ1dHorZM/3oimc2Zbu1VFh1ZzH+5bcoUl7MHj73Bba46oH3XDvWlLtpxd5sqUq+crI2iFIYOMzJ+gp4iUr3HTlpyyeNLwC5DHdqIwmyAcCUzDNw8qRA7wp7qFwR7XJ68KJgJ8/59hb8wLXifzupNBC0anXniLrxslm0dxc6AB9zqUwe6qccArURxg4hcohDEat6Ejo4QvlxzzMzFzBBiAVB7/F8t2h8e6mluqg62mIGWPwk2lMCQ2YcsNXeJ9GYaSJi4d15b4D8XEHyPMygU3jCglrwhTU/CuxbhKujev8+pHBJGW/htfpcfH/zmvTFER3NGkC6bQhFrUE2J07ss3OMhgmSi5wBzLB1u6k0cDP709RCzSFcpzFQ5UMICgJeOh7UIBN7GAGfsqfkHDoAGIHdM4dSeC94Tl1H6G4O/Vbg5qwTmZTAJv5eq+/jmlVBvMojywLIQ5JuieKpUXwEr8Z6vu4fKs8C9eEiQl79s4AnDuDSnr4uJNMRWs9DuMLUaAB+OEK40PV8okqearsgZrZj58QbWB0EUdgqgORd8DPS7dJz4XS7EB0el+W2sZ2JezLu7R4KmRgyt1s0IJ1bWjKO2
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Cr3cjLPXR4LojwfugJhseHemcduODsC7Iu4lvWbKoxopPUFJpwJYgvd4mrIBVU6mp5iE1wNeGyEr//nIbG/rke/oBhzxIqZ8BbpFbXLlAKuspwNbq3jqKCVXpe5350esRtJaqgTLxkw4/aFPfLelsKwQlLhQE3ttMD5hDXReNnnqiTK+zEV/LcUCPgLx0vyVvW70uIQy2K6kd+pQjLzwHDfcSzq1Mk5x9qzipArPdhmj7DUfNPbgOxVoMwtezWfFceUvlxBfw6CKTyfyvSBCjaTZ1V9/cjq7qUSswqcrhJL1trj7x0rbGdFXWRa8RB85eynQF1+pT/adkDr2Rd1dQY9VnIDt9ghO4CNxaBs8bE23soq5aKjPo8VwPeXnDadmoGxBTwK7ZZ4HZ8XC1cLgJjj5f9exE4lZN39vC6zFh38l7Z9UNfeN24pBSxiz+PCr
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:02:39.2955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48888fbb-323c-4539-3fc0-08df4645c5ba
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	YT2PEPF000001CB.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB503061

On Thu, 19 Nov 2026 05:38:24 +0000, Sashiko AI review wrote:
> These tests all run on a single thread, so they can't catch this
> window.

Right. The race is in patch 1, and v2 of that patch closes it, see my
reply there: a stop that finds the bit set no longer writes anything,
so there is no window left to test. The four cases still match the v2
behavior, and the v2 changelog of this patch states that the tests run
on a single thread and do not cover a wake that races with a stop.
