Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680374;
	b=uPHlD3lBffx+7pf9mSB8B6DAV2VyGQr/RjbtPSGnF0VYzDOw1bJZZCHWlpQ7p4KfBM+p
	 du8M9EQbD3QqNxujiuoFK5aG3CtRD8Gdmsio/LL1hItWIklbF5DhnKBqe8KC94eKjxy5d
	 GKy94NEcw5f7HGiCQBAXLcpa/8+hM8hptKWYNVHSrdHmaGkbq8ktC9OUhnv5qBQSLkr0V
	 CXgykcS3P19rjlpxXn8uIqmeB4Qc1IMbnhoXMjvGge02Z0781mYaxsEHStPvQ9RhdFK6m
	 iwQuH4vCYuGje/cYOKmLrVl4TMBQE2KFzeFAShIIRFHQxyIkZGA7KSApCiwJGYMHXHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680374;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZREbTxCEnt7TzZLWt6DubQRocIVhf1HYoKjAW0hVwyY=;
	b=LhaUnEWQDE8SpCmLCCTMp6KnHmPJGif7hqdNMqQxeTSFv5hMNL64hEvtf7y4yqnbRToi
	 wMW1u77R+d+BGRKKjn0NqodPOmMtJzmh0zFuD43ERYN3tP0/Zj4U8AQG62gUIMniT82O/
	 wV87CNU7Arnk8j0b+OR5qDiJCdzKZWf40O/YP29J6+YTtpDOGtcd6ftxLQLJDO7SGe4ON
	 z8QbpINaz2baVpIO4fFgLxpOtky4k3KYZHSI47F+VQGxjX17Gd1gkHoJXnbWYI5Olrzcx
	 j5a9+pt/iKQLlwVpO9caTyQEIyPavpBkpewrjIIGCGL+9/garGmboO37SI0GNIT7Qbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=luvfY8vg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.64
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04AC606A31E;
	Thu, 26 Nov 2026 08:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=luvfY8vg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soCW7gyMF/PDiaeveK1W7/XxsXjsEyoOFa2fy8WhS/u35/uuaNSp/2ju/R2t2hkSx2Op3s6IwPJHY146jOXQv1lBwzg3me9ghEKn6zIiOUsueBG/XQ/oDXjMav317NiIN7Y8MrqK4Bu+lrRJRARRC2jsmqW5u8ISVmSfVAmFj8nlwZlgWuHMhKOwkhyO36Z4xp7rhalBCtPtqdk4VYuEJVFjS3ZxPZueAemMzJ7lrxi0DixuymD+qbEaIVQHbvhdNKGwg3aatVtl/lEIRjKX2W6ESuI/ipMWzR9EZEa3nP0uvtDI4x0M1a0kbtiigspDSZLa9Bx24E+o9ptbPg0rwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZREbTxCEnt7TzZLWt6DubQRocIVhf1HYoKjAW0hVwyY=;
 b=bARi2aXQByGVlZU3b7iopgJUeh9k2Vgab5TBdOiQ83bRi0TuHaHP1nknyZIttItwN+/RHOv8nHu/mjIIBWF6Ydw7xVFsry+vvVbPaJT+Z+CFjufE4O/OCkPbX+k4QgON8Xi380a9xpLA4h3MwcKpnfAoEYeWsYfaERCSyJOEiRARWiDQKGCiTq5SEfFCfkqqgCKjGHTv8SmH32wdSldMr/0VBDpgTS5KoxGzpu65DBbLwOzQhcj2OSkrz6c+pxV3kuBNw1vKIO274LqPT93xHPJnABMdk1X/bZSQtFxF6EP1/4vpDVE5zwVLboQYJ+d9lrUUf3NI7Mkttg3+PUerVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZREbTxCEnt7TzZLWt6DubQRocIVhf1HYoKjAW0hVwyY=;
 b=luvfY8vgtbcvzyUVTxP2cpMA1JoW2duXukyiQOwpPNgC51DHQF6M1mRql2Rl3erXOU0z8ginsCjTChuKV6aeQl9J7bcEUvmiz+Euf9rE+P1htlP9HtCVI/5CKK0+TBNjpmainjTz0Gdf/rwd5sw9HFJbFTO5QMIx2j7Kw39HAuYAY9juq79VV/jAiB2tJUMIvv7CsBKoTdntCYiN8rKckOGI69vX6/nGRJ0Q4+37vwqk2ME3y2cpTSzVwJK1jVBt0Z15cyeUz0EMoYKySoElZ6f9o/UVFRqP/uO/xVAOYrCmdcuZLK55BXpa8WBdH53K5EQFHreGcsjL5Tf07yC6XQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by IA3PR12MB880721.namprd12.prod.outlook.com (2603:10b6:208:713::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:04:10 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:04:10 +0000
Date: Thu, 26 Nov 2026 10:04:01 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Tom <tomasbortoli@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>,
	dsahern@kernel.org, eric.dumazet@gmail.com, kuba@kernel.org,
	willemdebruijn.kernel@gmail.com,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] udp: don't apply socketless ICMP PMTU/redirect
 updates on end hosts
Message-ID: <20261126080401.GA540848@shredder>
References: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAHj5qjM7BoGKD35gVCn_XCf6ec-LKq7-5_1YMewOYfskyATjQ@mail.gmail.com>
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|IA3PR12MB880721:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1cb305-f66d-49df-4fa0-08df4b93da0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uTwn8DQ90AIFV9w732n7jXqpbbmumMH0o6SIaAh7QHizXNEBzCQB4D40N0sFahWZqPWtZ06dppTDTZSffSBIFlbVHCMOaD0XhKqBekPTMfGg7F8aMkAFqOI4rwpmiLhIGP9S9PpXJiPEallZAFVg6VMLQFcT9TseXw1uXOdANbJ38oQwZJO7kUwscR82GFERj1W3SbHeKb8FWz5+Qi+gXwRA30Cle3gKyTszBLYbsMprzfzN8yoJpfAt+K0YUSbcyujCY6nRRrhVtzPBRHhYeJunw6Q18CiOZu8XFEt18GwuRhojuO6vRctSFC57DwBtNlm/uyJtRk3Y0L/2cDBI1463WjurCqxyPZl3lCo97L4d2V06ZhItUQhXieaUmApuzyWjk10TUDRjc3suUxgkBj+gjfIZB0k2x6qvISxYdm01LPJZfFcPzW/u0IKaCBpRzm6BagZZl2hArJ1OsxBvDhVgPc9FFs62RzPkeEG7qHmo7kp70Nw3f3xqGxmyHmcVUUOwtHNqztkQ6Jc4jNX8AYoRxOaEVqqpAYvOye1rkfsxvWmF6rIFRj8iOz9aMQ3noM+W2N+MaFrrS27chnUq9Qrm6HQzh5JcFHisIdxpr8BsjCpLnFui8cWYGV75wnHCWIMVIGvJT08j96OlXagci0whtu/W9yCTsKapvhEHXyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0PFTboI/bXNywQPuuzGbhY2Qe1RvJQgGEJQ3eYV1WwPOQZaeymw6PQkf10E9?=
 =?us-ascii?Q?epR3dGYyUILceSYpDhp/ZmV4gi/rOTYFHfr5RkmzuY9H0D1NHxMAwNhSMpPl?=
 =?us-ascii?Q?ZR0zj1Uy4YLpVehEfDD4E82LQZCEh4OoJVMKuqiXY7VDCVl/fbgaen+nelG7?=
 =?us-ascii?Q?APlYHnAhA6Fm95mG0TdSx7lLK0Dr4ghFV6vq/u+C05G1/RSPxq6Ny4QStVtW?=
 =?us-ascii?Q?ukdnmxCjwdsWTPvZNl5uBa8aXyHKLtf3NYQAxDjpY7p3RzOpSOg9ChefgEUW?=
 =?us-ascii?Q?Rs/BiSGQ+JbnSPKlrgVW7/Pwos0PGCNzAcEMYqevMcMZ5Q6PuJUDVOYQn7DC?=
 =?us-ascii?Q?k+Bu3j+DSjeP1Fe+EsEQBiByk2TMX3qo78pyct0U99fHXmxn2WA9TzXnvRaY?=
 =?us-ascii?Q?78Qbi3G67+B22Nz75Bx0/A80B+rLoqYyKZ8eDZ0/HaluUtEstXr4XqD3UJkf?=
 =?us-ascii?Q?jOpJ01vs/r5Vjy9SjTnc8iEfdwSaXF66WTq0F4sOczLBv8d61IH27lZwJDdB?=
 =?us-ascii?Q?NRPpfNsUOpniYMgTQNPlQph8fhQIET70Z4Qh/bsjUZiLuDje71ioNZHAPq3N?=
 =?us-ascii?Q?I4QZGaDh7H+MGUkqPzHSBtvHNqLqGH+L6Z93cpwG2OLyLSYtVp1EtUlL9aHG?=
 =?us-ascii?Q?Hnat8xkEtxdo+7z3hN7P2hK8V03UN4tzLIxDKnMVVaLwN8U/G45fRWBaSh7d?=
 =?us-ascii?Q?CvaphCB06f3Y/CAUCglpSdq10ZZBA8DzEiNNfFlMNcRpGbF7vAfM4B1xzpFv?=
 =?us-ascii?Q?f45cCe8aHTMDQiR9Njwn2gQd64jSPAAklPL07O4WVcEo5mCpc5iWLaIxIrGq?=
 =?us-ascii?Q?M9wZx6vrL4vVwyJJ4ztoYd6BeH1a+J1w3h1jcoUcDADm7thPBQMGn+ONwsFN?=
 =?us-ascii?Q?erGzAq0nGjVnLUGfy4zVs0ofUH/0nwgTzILXQfdiEL+wE5VdFMKzEj5BUAt9?=
 =?us-ascii?Q?A2x3N9Sf3ieeY0Io8SposBz8cOaeV2/EiANr+y/JuDT8vvISw4J4ZQPMN88O?=
 =?us-ascii?Q?1r3/5ygJ/QGNqe5KzM2TNnxWfY+gf4D+rOUzcQDqSCkdS89ffHyhDyX5ixK9?=
 =?us-ascii?Q?/kLrdV6Zc2iizRFcOZNM3GMixJNQZ5KEaUid9vtJLx1dZ3ET6pI2H7N5Ofdq?=
 =?us-ascii?Q?GnEf+7YdF0ViB7YQl6atE3TpuI9URXxB/xmV9su9z9uoH38ThM+/GHZseb9R?=
 =?us-ascii?Q?qW85dvEVUCGsF92puNyPTyVqa3DWiA06/vl6LDMOV6bHFcaX3Oe3I6T5Y5z7?=
 =?us-ascii?Q?i8oUQzBQ2d03dG8JLmWozROtfP/arZjd+r8wSxaFwXrDZnY0hYmSJyZy4AE7?=
 =?us-ascii?Q?YD52uT/In0or4Wolks2JTYreZemo5gFAGy7KGS4bFd4kM4ZXkZSlOQcqABnc?=
 =?us-ascii?Q?H/IfNgWX7ldfuWbO5PcGV4CMxaMIM49epwKn0jHZJfLCXugZ8J5Ve3ozRKRR?=
 =?us-ascii?Q?38cDuTNSzFNnOrkCtwe/+8g470JIdKKfX/lYF+ZbPU5yuUY0NDl4pglVeOsp?=
 =?us-ascii?Q?RIlCB1sThIa9PJFF22BYizDMdgDUR672F6vy8qAM4rl13JJ+OM4afhOcTB6g?=
 =?us-ascii?Q?oM7He1VFTr/NLsY+x9eutybr48Llx0io3Q1te0BhLUPEAG5J3WOnjPhz6O5w?=
 =?us-ascii?Q?2xjjmGEITmE/JM4MLSqXWf5gZo3tkrTbvxr6tsFQqTPqL8CABZs9fw63lGT2?=
 =?us-ascii?Q?L9zmRbTFHTRqRHDAgLsy3GELVHNBd+8wjCx/fLuP0vxcAXTW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1cb305-f66d-49df-4fa0-08df4b93da0f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:04:10.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qM14tgnjAI05lRnx/H15ukpU0ShIVvWtsp6t2qWLrbqHNUBiHlY8KSkJ0iB6pPg/Gz0H+bXt7lqfbuZgEXM68w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB880721

On Thu, Nov 26, 2026 at 01:31:05AM +0100, Tom wrote:
> ICMP error messages are unauthenticated and quote an attacker-chosen
> inner header.  udp_err_update_exception() (and its IPv6 twin
> udpv6_err_update_exception()) process ICMP Destination Unreachable
> messages with Code 4 (fragmentation needed, RFC 792) and ICMP Redirect
> messages before any socket lookup, calling ipv4_update_pmtu() /
> ipv4_redirect() with no socket and oif = 0.

This is intentional. See commit 4c3499f79f8c ("ipv4: udp: Create
exceptions before socket matching") and commit ac76cab50e89 ("ipv6: udp:
Create exceptions before socket matching").

If exceptions are only created when the quoted packet matches a socket,
then an off-path attacker can probe the exception cache to discover the
ephemeral port of a connected UDP socket. This patch reintroduces this
side channel on every host with forwarding disabled and breaks
tools/testing/selftests/net/exception_cache.sh.

> The resulting change is stored in a route entry's PMTU, which every
> user of that route shares; on a non-forwarding end host with one route
> to the internet, the change affects the entire network namespace.

The exception is created for the quoted destination address and only
affects traffic towards it.

[...]

> values below net.ipv4.ip_rt_min_pmtu are clamped and locked (see
> __ip_rt_update_pmtu()), so a locked 552-byte PMTU persists until a
> route flush

No. They expire after net.ipv4.route.mtu_expires like other exceptions.

[...]

> The in-kernel ICMP rate limit exempts fragmentation-needed errors from
> its ratemask, so attacker-controlled entries can be refreshed
> unthrottled.

?

These rate limits are for locally generated ICMP packets, not received
ones.

>
> TCP drops errors for packets that match no socket (tcp_v4_err(),
> net/ipv4/tcp_ipv4.c); UDP should not be more trusting than TCP on end
> hosts, where forwarded flows do not exist: an error that matches no
> socket would then change no route state at all.

The exception cache doesn't care about L4. ICMP errors that quote ICMP
packets can already update the cache with no validation and the
validation is minimal when the inner packet matches an unconnected UDP
socket. This is all explained in the commits I mentioned.

> Fix this by only performing socketless PMTU/redirect updates where they
> are actually required -- for forwarded traffic on a router
> (net.ipv4.ip_forward enabled on IPv4, net.ipv6.conf.all.forwarding on
> IPv6).

ICMP errors about forwarded traffic are sent to the originator of the
quoted packet. The router forwards them and they never reach udp_err().
The forwarding sysctl is irrelevant here.
