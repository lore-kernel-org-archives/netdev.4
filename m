Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784397;
	b=D9oj68cWYg8pUTqsNDvwvLHeXATIOq3XNfep5qNraJ3nWNZ4o+w1nHPLdM1fWVWxSt6Z
	 awd6k7OH7gF7iIQUwQmV1Vnrj2hEMpMLwiRXXOK+3fYvevEpDRWCwSSY1p8P25Nrdblna
	 XY1SrR5YZ4PVhXmLnpizhvljN/O/0MKWvRP2eWAVUuvm+BI+Wv3tJCEJor366ZyWfYxQ9
	 tmH99ysEX+e/D72Dd46Y4uYp/W1vxbNQo7Vnvwt4MJ5QT3eUF6d6+CLt/1F/vTLiWNshu
	 2r1G/Syrc6tu2LWawAWmSJBv55ceIXM0LoaIIe6g9yT5ZXxfZihCVVRcv1Y5byMVgpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784397;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=E3b16O3VmPV6Mng+mXrKhXbzottkWhww4QJ8sGrT9u4JKcXAFbFhXtpudDOakVsSSjjI
	 7ibOYonLPL3MOfN/prloI+seFMWtevOn6QxblnsTi6HXLU22SNg2VjWrz+akJ8ceGhAM7
	 kAMxdTWynLnXlq8jKS6ra1fGw1uXup61jpR+RvI2cCnzG50y0Sh8MZtRNuhdRTNqReTrm
	 oDAu0mFsRfn0bI0Gnvh1nEp4bE5c/Mll1Np05v9qJvDkmilTESU8F6zo6QXxEky67o7mi
	 QTW18IJ50GaKq87NtHpI2dzpZYjV56swk6VesrqlvTR4iK7UEmxRV/0oaOlvtwKSyFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CErpc65D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E108606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CErpc65D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0DD1F000C4;
	Sun, 15 Nov 2026 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794784397;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CErpc65Dm4p26Kl/zyAqUk+b2NTjrIUxo6p8XH3fiDzY1fxAFF7l6towJf2ulbCn4
	 60eT8sYYmmZzBnGqWD+YU/6agqePuwNDVVg8N1j3YNlBB5ZeJ7N/NgsvWk173VBcmL
	 GnJ03vVoxlEzRZgrgPVdvJ9CYPdZlyldYTekucv8+0q9zhWlUq/9v9U9EddbKPtocX
	 y6gS5E0Nr+Ywdtdv6TqbTbYPjTXL9XPj7AK3YFl7T9mAuSeyYfmbCiE30sEipbtwjM
	 JC5y6KdTAFCYPznedifWhFmFC3x1MycGN7gBOXb4Pw7+Evk43xAHRTRlRh7W877wHY
	 VEkM65J76t4+Q==
From: netdev-bot+sinfo@kernel.org
To: Imre Kaloz <kaloz@kernel.org>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Elad Nachman <enachman@marvell.com>,
 Oleksandr Mazur <oleksandr.mazur@plvision.eu>
Subject: Re: [PATCH net v2] net: marvell: prestera: disable port before
 changing its MAC mode
Date: Sun, 15 Nov 2026 23:13:16 +0000
Message-ID: <179478439616.3291.5242050371831066498@kernel.org>
In-Reply-To: <20261115230812.29644-1-kaloz@kernel.org>
References: <20261115230812.29644-1-kaloz@kernel.org>
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
