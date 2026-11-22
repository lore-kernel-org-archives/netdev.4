Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366054;
	b=wkSy2N0KSOaKkpUe+yxObUqS5LTuP1hc/1O7O1hmLRE1RrSIepOlnrT00XvAggbPGz3F
	 WYdnAX35p6nF3kX+OsgDfHgRhM1jtLZclkqHDvo17nzmi+TMmh4YVkD5NArN5F3dqO9iE
	 y3h+kgIZLMl3A7lBC90wE+RCVymFTmSK1FLfxHDRf+qr/9V8/ljKpxzt7ZdHn2VCCFu5g
	 ZfTrqiAEizxn0d6nbeMpVcQb5gHkjga4XF0u9lcq0cS3g7rQ3H0wtHG4UFRHnPKQbSqlG
	 tSeJZP7jE9Y9tS+XKAlabCFBpM5v8wxESS/0zQ92QaFs28RRs5RMPI1uQBJ2VqjI8oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366054;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=lx/eqkzhQCjhU/lfk/3mcXkVVolcmqyYJ3MWHeNdASzu2hmG3wSsQ71B/bcQsWvc9fJc
	 g1KJaTVLtEeXt1ha4lRghFmdnFemo8ixW5Gr0tctDILmenIBw3IVXwrY/3uH1bWh26RmU
	 rsx0Bfh17PK6HAIJ0XkLvPlONrMCKt2l97ZvNOTIYcc3rfDBUoOCso93rSBFCNd7pBqYK
	 sdImg3IxfeCRHv2IxyzG3xxIu9W9oHJuv8fAokHeL1p1urMdaDVrOCZ7mtAEsdefJ5VxM
	 YilU6Tx+jCIm0q1jlBZmcEoNLR++P/7zPpI7Jf9xcLCGqj4FZ9hZz5U0yBR2CHGumTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkUaOqBC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B06606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkUaOqBC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8FD1F000C4;
	Sun, 22 Nov 2026 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366054;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SkUaOqBCZv54AaOLDy4jnutlILt2r4/KWNno1wO5pdZCBl+3Z7aiG+2z8TDbjhdFq
	 NIVFajmASWFiWVogIl0pgggk3GHnwWqymeEiurylGRdsv4jSvqrMHxtIQYOULpa6Qt
	 ccE8pKseL8tEfCdWugPhuSgeVP4ghWlYBoMog9MkYyl8gLkJF5IBkVbm3ZvLK6KtRn
	 EXvZKfBAMATkYFrtGvnGuzru41gG5mKH2pPMC/2dIDbC4VEx6OpZKC/FUVb+mN+xD/
	 FTzU4xqv9+yxg/G2EH/kXyaetXJ0VGMKtP/+yLRY1REOh4FVxRzi8FVR96+xZVu4iw
	 iAWmWiiRuzgNA==
From: netdev-bot+sinfo@kernel.org
To: b.lane130@outlook.com
Cc: bharat@chelsio.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org
Subject: 
 Re: [PATCH] net: cxgb3: complete the cleanup operations on error paths
Date: Sun, 22 Nov 2026 16:47:33 +0000
Message-ID: <179536605321.3294.4326806038016790623@kernel.org>
In-Reply-To: =?utf-8?q?=3CBN8PR06MB6177F1B73B4D37AC2315B428A4462=40BN8PR06MB?=
 =?utf-8?q?6177=2Enamprd06=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CBN8PR06MB6177F1B73B4D37AC2315B428A4462=40BN8PR06MB6?=
 =?utf-8?q?177=2Enamprd06=2Eprod=2Eoutlook=2Ecom=3E?=
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
