Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396690;
	b=yC5S39HgDdiFS6dOO3g8qZkmtxAVIApDyAgPeDpWX0Kijyq9H5cWpE3EwHXK8zgDV9HF
	 1C1zTv3zQVPQPzsl+xL2/ME5Y4SO64MP8JHQkI+zzrorpYytgM0Re7GPH46kkugTn78DE
	 GVXspY3wy61Q7EBqGVlzPG+JeYR424TPCZk38Q3owRhMap4lDAxcQB6fkFZoIaE3m11gm
	 GlmBuCYcmJQop+EMbLPcRW8H8+5y8Evvu3m+RyadC9a3uFFeSFxmo34xNGQ7tIWvKFU4U
	 uiy4QjtY/GpjYPXIUqE1ZhXadAx5vfCHOo7U+f24u3Er5DDqC6DsUiClYSVL6/z0Mlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396690;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=PA9moIvchicbE3PXjOcH6pYdCpXlM2k5BpbDFTdcvyJpn/OIJ1Ew7vIWsDStwKXg/KD+
	 PbI83gevkfIdYkrOw0BwlR3WMeZvB66L7B0CF44Lzoa1naACjPZNyDj0WETrQMmGRl4h2
	 jrvyNqHaqmqGT0T04T72kiYPH3tb/gn2b5lH4CTsiq7nmqg1z8faFOcVLoFEtf6IV64x6
	 NmSsKeMp4g3n7dvJhn3foelkw/ohVvopKCM7wRe0NHGSw/ME5HzIFR4bVtGG0xjowX/D1
	 sShS38AgiWqbj00OYHOHibz4hun+Dc+NjzKTXB2cxWQLmcxEEVFBlSgQKDw4i5nrEtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CUgrEdxm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1740606A320;
	Mon, 23 Nov 2026 01:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CUgrEdxm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFE71F000C4;
	Mon, 23 Nov 2026 01:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396690;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CUgrEdxmXjSD/N6oAJ68lwV10YX4LPaYpok3vReUlmB69y6rgO5OhqoaNL/QtlGoq
	 +h1I1B81ojiiYzfCVeFkKm+hZT1+7VunJ+qL1CLLdkL8sM3p00kMYWUiye3vgdMbam
	 0Ow7MNA5T9bX9wS2f2XoBoCbVeb/VgOkCLd2o5je/mEl0RiBQzZ+kbUr59Jps1QTPy
	 q1TxpTSMUNshbhie9NrDFgGUbaP+rdLY/UK1spxUr54y9VHePLpMu15DAZgOm6Go7v
	 WuzkijSOwqgintXqAnuueUqRPyrbJ0Zu3wLipG2rdLv2Po6dWasKzX8O0jfFeEE33A
	 aqHVT7S0xLr4Q==
From: netdev-bot+sinfo@kernel.org
To: Lin Ma <linma@zju.edu.cn>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: Bound the OOB challenge queue per connection
Date: Mon, 23 Nov 2026 01:18:09 +0000
Message-ID: <179539668969.3294.12725722579980397053@kernel.org>
In-Reply-To: <20261123011320.4032340-1-linma@zju.edu.cn>
References: <20261123011320.4032340-1-linma@zju.edu.cn>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
