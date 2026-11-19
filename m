Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078680;
	b=0iEHctEt1UwPx3tiNSW0UCXG74wNNjtnhHBGvVcxaUUDaSTKdjG757QZNBWg6pLYxguQ
	 gpTOKlmNF98jIw8CMW7fmdLZjNWa/7HUA6K4plR4hHSMlAd47VrBGzaiLbTOGPX0ce80b
	 oC8eY6pA0fSpNJbncxh5ayZhAA0+MbQlcmv691yJEdtsxf+1y4RQTXQQ35HXtx31buhi0
	 hKBr2EzaaRPXYM5WiZI3mdQAFOMow1ZZL0EQc2hlfCMdfWcGOBHxwkkFvzgcytOv+T9l5
	 8QBRCNQaRSGKesGliecR35WySEPOYQt8XYCZVzBqLP68knnrfh/keTmoHZV42p4YJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078680;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=HYyJe7AOWGvb7G8a6cfSLO8K0x3Aza9gVHIQwYB9keM80EdJ/GsXJCAgHnfThz/+srtO
	 SwYvaQp5BXFBBGI6iRUIbGlVaN8GcuyXLx85GYTmjJ+ZnVuV6YZ/adPSQ1//gU2ee3TUK
	 uYYl6+xTUUz8A7fGhK5UWwQ3W5KRTYqYQomFbQnrrUzV/kKa7kPZ9KOA9SyjmuhfY7e2g
	 s4MKKMvejirblrZPZB6k2Lbx3q9Jv3uYH+ZlCBreNZka8DfxkrIXkReUAxfEc9Z6DChBn
	 9/kXEwG2wU03wnvMFOzDfZNAHZoK88lPdIve2HQGG79Pu1T678lBGDnO8OTfiQlYL7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOgLuiiN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D0606A320;
	Thu, 19 Nov 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOgLuiiN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916551F000C4;
	Thu, 19 Nov 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795078680;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OOgLuiiNgV8qW0OBV42T8OImz0lrGhcLKL+xn+0429GOc68b3/6aYtjaCiPp26xXS
	 6jU3r2qVbFgL+UfdEHmR4SEOkMZ5YoI1ZSYXKgkCNCU0IZR7qOg0T5HUd2X41tK+9b
	 +PAx/nJahudnWjXdF2SQ1HGtCD9qhS+1rgU5TJRMoCmD4miLkVg04khvQSw2TWUOb7
	 wE6yYeCP3K1iPlWjAghU5k4w7r/BqXsZ+94GLRLsiYpN7CnTAXOnSd5xMlgCbvWy/W
	 aZ1mxCE0Sn5nSNTI2aFk2qzKwbqHaB/v/bHScW1+BZlChJHGV6X0AkalMlbOQgGV7U
	 N0qfsCHB6c/gg==
From: netdev-bot+sinfo@kernel.org
To: nshettyj@marvell.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rakesh Kudurumalla <rkudurumalla@marvell.com>,
 Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v4] octeontx2-af: Fix BPID leaks in NIX backpressure
 enable/disable
Date: Thu, 19 Nov 2026 08:57:59 +0000
Message-ID: <179507867908.3291.9474943477334370542@kernel.org>
In-Reply-To: <20261119085434.2598197-1-nshettyj@marvell.com>
References: <20261119085434.2598197-1-nshettyj@marvell.com>
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
