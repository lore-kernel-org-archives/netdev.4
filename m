Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795010111;
	b=UXpT97Qr1dzT5r10jjhx+3mjPKb2UN9AtDO5QxsJLZIj9VmHheDWJB9FSDFLuqkbPi38
	 EGIWLKhJzf+Quhy6S8L2TvtLHyDp1ORPCJtR7gNIm21pPq/7VAG7EXIYomGVLePNdCL8u
	 TPo8v9mQUWRRs7TE5YIZaz5KjgF9csP69jlIhpE9OaA+J2WQsz+2QjK3i3fnGhqRvyhi9
	 llGaEaPunfu0nUfHMYmlQIeUND7lR0YNTqNn2Vaq22/GGyuiLIVhcGpmG/wwfRFSM3Fud
	 2KK7jlHVk3uzmRVVO10oMvSMfIQKRjtpYuzyyJGLL4LL2mu2XgWxfdjauNEO2Z0lcmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010111;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KEX4neg44mx+hxi57it0d9Oxxj34RxbmxqElzqftoN4=;
	b=XjAP+rrdce08uRQzRMTDUFV69XQOsOECQInBb/w5p9skEoBR6KBTlfzto8OF6QKAb29d
	 s++2zsN8rEbx0ojFED10fe0iwy7P7/zOYHlMxQNjqmWRHOt8Y2AYmj6Kj1s/fNPlLqbcp
	 wQ37x8vRshHAk1ra1xbQnLcEJZrvosJoC6F6m4FAbvWC76+85RHS3w1yJNUMmP1PeQ+83
	 AlY2Spf/4sc4w4bZO/sT0ZeGuts36EzEYjfu6bX2lYm9pGWd6AZprg2jti/ItL42RKLBu
	 noGmXCtehnYgwF488e86CG1ZhFCga1Tvo5/slZ8AfYA+asgAqwPpTfhQu1kWH8bM5Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deeproute.ai;
	spf=pass smtp.mailfrom=deeproute.ai;
	dkim=pass header.d=deeproute.ai header.i=@deeproute.ai header.a=rsa-sha256 header.s=selector1 header.b=lX7+aDZ8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.139
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2139.outbound.protection.partner.outlook.cn [139.219.146.139])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097BA606A33A;
	Wed, 18 Nov 2026 13:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097BA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=deeproute.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deeproute.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=deeproute.ai header.i=@deeproute.ai header.a=rsa-sha256 header.s=selector1 header.b=lX7+aDZ8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yzu51GMXIkK4v0CuPAamQabk7UUttI5OxiWMjUrU7xfyRn/yLVxxPvdFx8hPavTtDfFu6WHy+UW2COTOyZFJPIObR07QeXltTvh7DFynXjDrqbt0Rz/owTHh5UmD1WarIGKxYqBbxc9hY8J8SHi9AI7GmF3kb2Le/BqxVeLvcdmDQxFLT3vxYt5uH7EQIYJIrxJGVx33RUKJch7TM7r63Y6up2EfZS9uTI/Z2eSxJC0/3Q4PA8nCpa8vUX5UruhFe6t/d0wgHtj6ci0Mbc04qs35lxTTzQqC4+4Hzx8Xt7ufs0ze1X2awIKpGhVHFoBLTvbto3rnokVXCcItWSp3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEX4neg44mx+hxi57it0d9Oxxj34RxbmxqElzqftoN4=;
 b=bsrWplkExvMLuKEe9wdeYgdUeSjZaMgbbQsxTEH5HWjaOhzbD2zbGihO1Sl5Tn3jPFNmBq0Trng/0sF/DsIkukerMfIfTKEHMidJy75awkdz7bfu3EnTUADB8361m9qaKO2b1JqXOIvxXHitV/7kGCO4gsGzpxTxeQzbhjSoJBe70o19J3RMjxJmchnFwjLcWUy0/S96/gIExUitCS++v70YcdnSaS3qNNtVC3JHgSHtsLP7uv650VykBvhAMCN4FEYKjrDYETTVK2gm2VefNn5QrwBm2Vo7gzU5E8fsCUqF56R5b44skyYN7HF9eWF1YpTTFvwYOKIz8fLl8vxjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=deeproute.ai; dmarc=pass action=none header.from=deeproute.ai;
 dkim=pass header.d=deeproute.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deeproute.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEX4neg44mx+hxi57it0d9Oxxj34RxbmxqElzqftoN4=;
 b=lX7+aDZ8jv4po7jSWIDVE+OeDWAq5KaEqUN0INEsNbsyoPrxGBLN1f5wpTrBC4uLIZrIut8oQjUKVASa5xMcpYeoUJMgIwVRJG+CUGU79iFQmytyHLEwOb2tilSlmh+P/kXv3nzBFMBkulBxlRploJbZ/FCt5ogRNNROENQ/qQ0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=deeproute.ai;
Received: from ZQZPR01MB0980.CHNPR01.prod.partner.outlook.cn (10.2.2.201) by
 ZQZPR01MB0962.CHNPR01.prod.partner.outlook.cn (10.2.2.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.10; Wed, 18 Nov 2026 13:54:58 +0000
Received: from ZQZPR01MB0980.CHNPR01.prod.partner.outlook.cn
 ([fe80::2dda:e54d:5a3c:d686]) by
 ZQZPR01MB0980.CHNPR01.prod.partner.outlook.cn ([fe80::2dda:e54d:5a3c:d686%5])
 with mapi id 15.21.0615.008; Wed, 18 Nov 2026 13:54:58 +0000
From: Jingxuan Xie <jingxuanxie@deeproute.ai>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	=?UTF-8?q?=E9=9F=A9=E5=B0=91=E9=98=B3?= <shaoyanghan@deeproute.ai>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v6] af_packet: avoid waiting for TPACKET_V3 copies at retirement
Date: Wed, 18 Nov 2026 13:54:43 +0000
Message-ID: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0021.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::33) To ZQZPR01MB0980.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:a::9)
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
X-MS-TrafficTypeDiagnostic: ZQZPR01MB0980:EE_|ZQZPR01MB0962:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed5e886-7a0c-4f29-6f42-08df457b887f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|261021133027099003|56012099006|38350700014|10067099003|261021130227099003|261022105027099003|261026121527099003|261021121427099003|261022075727099003|261026140227099003|261026135527099003|261022115727099003|261026130827099003|261021135927099003|261028144727099003|261102123227099003|261022113327099003|261021123027099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	56wBHF1RuZwnJYytBSoh4sB5uxFdGt89OxrZIabgzs82Uv24lNgI4xILyhvf7k1c1ZD/5IfCFRCJ1MG33VDSQQCB2hVpGbfzkDRh6L3XJ5qxrNU3agBpM7p/NrKPikdWXaQDi1OIsjy68vr2b1kykrsBaOsPjKdKrGLos1ax1JfbMhysRAF3UGw1X3cAWVitXvx3pjXiI8YxNL2ZHCm2TghJzx8P+PEX6dMuYoUyLty0+iRnmz2PQNm06cLAEnMe5UhjnEBJp0EZ6ro+VJaR1G5xg2No+OCPAIFtEZImCZOiTcv9qLVu1jgO5ceoD/MM+UZCLxl8TQ3kHwNlK2WEjyTCL+Y7C1aDllQqU9sJilMet96/VcZfGE5zVcnmq6GQtcjP+pk9aMk94iWccth9fP7mprD2OH5/tenPHlV4yPdgTdqDOeC5i8MMoMl5+EF8V/Jb0mtAWNMlFUVSa0hZbCxjXoe2OdBpcE2bywLM7hqsHtWKc/GyqBWJldMORu1fiQFmNfwtNunV8TaJHkSffV9DxJyb/j59mbL3BE7yUlIYNCSVLiDQLfRq74ZTr3TU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0980.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(261021133027099003)(56012099006)(38350700014)(10067099003)(261021130227099003)(261022105027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026140227099003)(261026135527099003)(261022115727099003)(261026130827099003)(261021135927099003)(261028144727099003)(261102123227099003)(261022113327099003)(261021123027099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kXNUJ6nCH6x84XRvTGHb8dCgI7X8WQ5d/3CDPssxAmHPkw0uenQxKIVcyGHo?=
 =?us-ascii?Q?TwvPZ+SnvtSvyQyie20Rz3HQx8f16DT/b8iRd1yWK7loTYhhX+Y90t0mcrP/?=
 =?us-ascii?Q?lZA/KHhhKiW4eCMtjQqAXhUzrJSXNYBf2/+M4olxnZ408h5kvS+QsX1iGShx?=
 =?us-ascii?Q?fVu2CAMhQtMHS5cooKFpzei7FvKCJj5bTk6iO7HfO64o3ZYZUvxTuYI8myCJ?=
 =?us-ascii?Q?83/H5SkyAzPAHi+hmundjBeMYrQN86ipCT4DV7FIU+Qc5sajONxOMc4+ISZ6?=
 =?us-ascii?Q?gfiHizWDg3o5ryo2UTljs9Gq9gklsUelrk+9pkVze36ksREQ1LFcCPxEud+C?=
 =?us-ascii?Q?Ti6xyxIg5rxWp9Jn9GaQJACLD4JkiTvJ/ddgAE5Hz/PQ5e8X8FbeqCzTzHTX?=
 =?us-ascii?Q?ljvGqPtwfMbmCpKQOCPAZuXqPO1KqWlrdmZ3k0YOKljeFh1M4TB9UNvtUKyp?=
 =?us-ascii?Q?nBOeT/wyJ2c+jvKii9ZRVJkd8asjTF1RNmWVVAE1EUnFbmn4AaQmH0zlSCEh?=
 =?us-ascii?Q?hTvhMVIx6nlAW2jXkwLOVybYEyeIDCFxkNRO0cARlHHGGoEK+FpvDrIuWsWj?=
 =?us-ascii?Q?PtgJyFSN1q2iR0A7kjH5cQFf00NCtSOz86tIf5b8aDVBq4hVC3m4RWCbRYH2?=
 =?us-ascii?Q?D5tGBvpSRAFUuNROgX2v3iSq69jWhj1fSnMW8jijvOoKKayBFIGUQg2sBHlw?=
 =?us-ascii?Q?wj4u+RfSQJ+P/wPuas3Ur60iS6ziUvpbwxrDfJa+0SLyKiYylsBhxycWzLo0?=
 =?us-ascii?Q?hfrD9c6BazwvoP1eamR6z/vQH4Ehd8UTq2YFcu2Izz4CvRcYPFM0mBeRhbHk?=
 =?us-ascii?Q?hADl6MeJdJj4fUEr6vqGKyWunWS3wlPJ0uOPWsVSJjtD+r8kREutRB3EFiGa?=
 =?us-ascii?Q?5aq1XcCD1T9YosIJ0mUU2C1RqvjouQQ1y8XU43w2sPqepwSby8Yxiqm7KWhY?=
 =?us-ascii?Q?OKYDAicQ6BfSdfsrCl19Ceev9EI6Wz0rZ/jTh2kRskkdC1d1EfPlnTaMgE65?=
 =?us-ascii?Q?K+WLM/sfIx+gsxTTc8qZ+EdqGjixoNdLOxKoGsvJC1igN5TSutWnO80y4DGB?=
 =?us-ascii?Q?SGewZLA9oizQVP4uMKqf3ibbAtCgcXcS1DkRJ8sCzAOCTKEYQjz5+5cz4d+r?=
 =?us-ascii?Q?U7DvnZ7ghh65g8nMrMp241R/PNk++xzIXfk51Vj0hbXc68qaypSY+20wKEeQ?=
 =?us-ascii?Q?JnV0zAJ2M417R5Rk6ELo5mncV9JWhrAvL3U3t0NRcylvZHDEUtIMrbvjrSz2?=
 =?us-ascii?Q?4+g5T0rWzPaKJtMoJo1JZRIeBbVK/HizL0JdqpFDvWK4ZOwflmGvGycVk6D7?=
 =?us-ascii?Q?AS11A7eO/Am4auzijFBOcaiw1dJrvugLwEOAL0MM7AEsHmltcRd0CU6lvFuV?=
 =?us-ascii?Q?pCCELS2Vp80xzvy7ATAiTFqbacn8BWNO27aAWYH/IQDW6df25NCHX01umIDB?=
 =?us-ascii?Q?QpOFwEFz9TKWicOywsQNSyMjYsQT5pLGnve/vNNSiP7ckDgnW3zHdlgTBCvH?=
 =?us-ascii?Q?VKd2Gugqq51O6HyP1g7ISgUh18Acrb6EFM0HEyg19K7pQb9jPhTdaGceLUFc?=
 =?us-ascii?Q?dqsA+X4IikBU+7pmPAUvYIJnBVfJXC/z0zw8p0hiuoKZEjvB9pcxUUF55TqR?=
 =?us-ascii?Q?OZNLyanEtIt0gXmvcW4MiD15HyLgJz59NIR/WBtGYcL2UI21EG9JL66NJMau?=
 =?us-ascii?Q?UojruNZqJk5KYcobCpgdWtqiww1TCKSxL47UL+ZnOjVQ6RjL5PRiG5YEEBGt?=
 =?us-ascii?Q?ZgO7dWr9dA=3D=3D?=
X-OriginatorOrg: deeproute.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed5e886-7a0c-4f29-6f42-08df457b887f
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0980.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:54:58.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: df535b4a-68e6-4339-a092-afa4f2c24fcc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crxPnrSRkq/OXqhGINtIbVh2IchT8Xk99McOlzLi70wqYpT3JN17rSqrCp2dVxavX2WwUh/2tJBTQGLKBg3wV2AWHEJ3ZyC0Jaz8Vd8mFyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB0962

TPACKET_V3 retires a full or expired block while holding
sk_receive_queue.lock. prb_retire_current_block() takes
blk_fill_in_prog_lock for write to wait for in-flight skb_copy_bits()
before publishing the block.

On PREEMPT_RT a read lock can be held by a task that has been
preempted or is running on another CPU. The packet path or the
retirement timer then blocks on the write lock while holding
sk_receive_queue.lock, and the receive path resumes only after the
copy completes. This was observed as a receive stall of hundreds of
milliseconds in a PREEMPT_RT deployment; manual inspection found the
same unconditional write_lock() in both the full-block and the timer
retirement paths.

Try to take the write lock without blocking on PREEMPT_RT. If a copy
is still in progress, leave the current block and its metadata
untouched:

- the retirement timer re-arms itself and retries after the configured
  interval;

- packet allocation returns NULL, so tpacket_rcv() drops this capture
  record and accounts it in tp_drops, while the original packet remains
  in the network stack;

- a later packet can retire the block once the copier has finished.

Do not dispatch the next block while the current block is still open.
The existing lock order and completion ordering are preserved, and no
new state or worker is introduced. The trade-off is a higher capture
drop rate while a copy is in progress; original traffic is unaffected.

Non-PREEMPT_RT kernels keep the unconditional write_lock(): there
read_lock() disables preemption, so the writer only waits for the copy
to finish, not for a scheduled-out task to run again.

The stall was reproduced on QEMU arm64 SMP PREEMPT_RT by delaying a
copier after frame reservation: without this change the next sender
blocks until the copier is released, with this change only that
capture record is dropped.

Fixes: 632ca50f2cbd ("af_packet: TPACKET_V3: replace busy-wait loop")
Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>
---
Changes in v6:
- Repost without the linux-rt-devel copy: the sender's mail gateway
  duplicated that copy with a confidentiality footer and lost the
  patch's tabs, so it did not apply. No code change.

Changes in v5:
- Rebase onto net/main; no functional change, so the v4 Reviewed-by
  still applies.

Changes in v4:
- Limit the write_trylock() switch to PREEMPT_RT; non-PREEMPT_RT
  kernels keep the blocking write lock (Willem).
- Leave the existing indentation of prb_retire_current_block()
  unchanged (Willem).
- Add the discovery and reproduction information requested by
  netdev-bot.

v3: https://lore.kernel.org/r/20261103092541.273847-1-jingxuanxie@deeproute=
.ai
v4: https://lore.kernel.org/r/20261110072221.24701-1-jingxuanxie@deeproute.=
ai
v5: https://lore.kernel.org/r/20261113023809.24730-1-jingxuanxie@deeproute.=
ai

Testing:
- arm64 W=3D1 af_packet.o built with PREEMPT_RT=3Dy and PREEMPT_RT=3Dn.
- QEMU arm64 SMP PREEMPT_RT, 3 boots: psock_tpacket and psock_fanout
  exit 0 (the fanout queue-length warning also appears on the
  baseline); with a copier delayed in skb_copy_bits() while holding
  blk_fill_in_prog_lock, a second sender returns in 0.7-1.8 ms and only
  its capture record is dropped; the retirement timer retries and
  publishes the block after the copier is released; close/unmap during
  the delay does not hang; no lockdep or atomic-sleep splats.
- QEMU arm64 SMP PREEMPT (no RT) with the same delay: the second
  sender blocks until the copier is released (503 ms) and no capture
  record is dropped, matching the unpatched kernel.
 net/packet/af_packet.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 7322256..e0ebd06 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -200,7 +200,7 @@ static void packet_increment_head(struct packet_ring_bu=
ffer *buff);
 static int prb_curr_blk_in_use(struct tpacket_block_desc *);
 static void *prb_dispatch_next_block(struct tpacket_kbdq_core *,
 			struct packet_sock *);
-static void prb_retire_current_block(struct tpacket_kbdq_core *,
+static bool prb_retire_current_block(struct tpacket_kbdq_core *,
 		struct packet_sock *, unsigned int status);
 static int prb_queue_frozen(struct tpacket_kbdq_core *);
 static void prb_open_block(struct tpacket_kbdq_core *,
@@ -677,6 +677,24 @@ static void init_prb_bdqc(struct packet_sock *po,
 	prb_open_block(p1, pbd);
 }
=20
+/*
+ * Wait for an in-flight skb_copy_bits() before retiring the current block.
+ * On PREEMPT_RT the read lock can be held by a task that has been preempt=
ed
+ * or is running on another CPU, so do not block while holding
+ * sk_receive_queue.lock; return false and let the caller retry.
+ */
+static bool prb_wait_for_copy_bits(struct tpacket_kbdq_core *pkc)
+{
+	if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!write_trylock(&pkc->blk_fill_in_prog_lock))
+			return false;
+	} else {
+		write_lock(&pkc->blk_fill_in_prog_lock);
+	}
+	write_unlock(&pkc->blk_fill_in_prog_lock);
+	return true;
+}
+
 /*
  * With a 1MB block-size, on a 1Gbps line, it will take
  * i) ~8 ms to fill a block + ii) memcpy etc.
@@ -711,9 +729,9 @@ static enum hrtimer_restart prb_retire_rx_blk_timer_exp=
ired(struct hrtimer *t)
 	 *
 	 */
 	if (BLOCK_NUM_PKTS(pbd)) {
-		/* Waiting for skb_copy_bits to finish... */
-		write_lock(&pkc->blk_fill_in_prog_lock);
-		write_unlock(&pkc->blk_fill_in_prog_lock);
+		/* Retry later if a packet copy is still in progress. */
+		if (!prb_wait_for_copy_bits(pkc))
+			goto refresh_timer;
 	}
=20
 	if (!frozen) {
@@ -738,6 +756,7 @@ static enum hrtimer_restart prb_retire_rx_blk_timer_exp=
ired(struct hrtimer *t)
 		}
 	}
=20
+refresh_timer:
 	hrtimer_forward_now(&pkc->retire_blk_timer, pkc->interval_ktime);
 	spin_unlock(&po->sk.sk_receive_queue.lock);
 	return HRTIMER_RESTART;
@@ -946,7 +965,7 @@ static void *prb_dispatch_next_block(struct tpacket_kbd=
q_core *pkc,
 	return (void *)pkc->nxt_offset;
 }
=20
-static void prb_retire_current_block(struct tpacket_kbdq_core *pkc,
+static bool prb_retire_current_block(struct tpacket_kbdq_core *pkc,
 		struct packet_sock *po, unsigned int status)
 {
 	struct tpacket_block_desc *pbd =3D GET_CURR_PBLOCK_DESC_FROM_CORE(pkc);
@@ -963,13 +982,13 @@ static void prb_retire_current_block(struct tpacket_k=
bdq_core *pkc,
 		 * the timer-handler already handled this case.
 		 */
 		if (!(status & TP_STATUS_BLK_TMO)) {
-			/* Waiting for skb_copy_bits to finish... */
-			write_lock(&pkc->blk_fill_in_prog_lock);
-			write_unlock(&pkc->blk_fill_in_prog_lock);
+			/* Do not wait for copies while holding the queue lock. */
+			if (!prb_wait_for_copy_bits(pkc))
+				return false;
 		}
 		prb_close_block(pkc, pbd, po, status);
-		return;
 	}
+	return true;
 }
=20
 static int prb_curr_blk_in_use(struct tpacket_block_desc *pbd)
@@ -1097,7 +1116,8 @@ static void *__packet_lookup_frame_in_block(struct pa=
cket_sock *po,
 	}
=20
 	/* Ok, close the current block */
-	prb_retire_current_block(pkc, po, 0);
+	if (!prb_retire_current_block(pkc, po, 0))
+		return NULL;
=20
 	/* Now, try to dispatch the next block */
 	curr =3D (char *)prb_dispatch_next_block(pkc, po);
--=20
2.25.1

