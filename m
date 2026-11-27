Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765797;
	b=OwxZX6rVY18m004SzbrvZCedZ8tgrfovMWddIr5IJJc0q6VL5+iOiRCAQ+avBeUGJCU/
	 TCAqPsQ37lpc5JQOc+K8XYwvqBKk+1dtiHvhR2kbNAFkmv6QoE4hVNDxCmwI32HOppeeU
	 NrHzXv/5Sz3vRPZ1B9viBSnUASZzeCrMWQI5Yr8raU9Mo/ixFZXUXBhES1NeHHjBExVt5
	 7pyOFsegHSl6FMp4p9SsdnseUxVBYQGNzeP4vGopYBe+WyXcFJ/LV7gj4F3sSz4jLo0NN
	 BCfzeHoGUksEK6Jmp7SLRpG7zSbmBcK8rmU0SvBi5tKDoYgU/KoGwAeAsVXIi20LMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765797;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=G1i4iLBZ+3AXVg1atJMWx/SiIr5vJOV+cyL04/W9DBK44Q7VYq+cJVr2QC2iF0pqlzoO
	 gMy9ntdonxF7HrvhOuNMSZZBB30+IWaHmtOsmfFRWzcioBg5srOXCTRML5FlkLIHyUBe/
	 dViBgMmf9PN7CshhUwBD3Q8l95j3dKoR0Gv7mFXYyoR0FJhh9Q+bE1uKd5MFisAOwjkpG
	 yXm2p1aFyh4mM0jmW5DGXkq4lE2I4nbUCnvv3GxEFAd1kHFIKE1sjl5iTzSWVqMC95IlX
	 hM/xjbBPa8RiOteUXa/i1Ystrk9IP6CMipUT6AVLKPhwbsyLxj7yHFyfW4Fg4489XlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyne3uOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E999606A31E;
	Fri, 27 Nov 2026 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyne3uOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C379F1F000C1;
	Fri, 27 Nov 2026 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795765797;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dyne3uOc4YnwL0U+P6ivIQ/VuL1/0c+weJCdJQoSyIrxwxTcouPex0sJbeiHPT64t
	 zTLRvNflDWwFjYXiUQ3W+r0l3WlXTI8Zyx5CCDPUuqrjmT0r9iOs4wXV4znNwYrc7d
	 su83SLrTGf06kSyGsTkjBi31qy05fxnpghylfcVGFKf4J+jvSkz9xy+R05h2JcEpgn
	 A5j9rI2lm5ZydNg1vZsWo1sRAw5vtFqdb4ErDrrUHZJ2X3RiJxgwPNZLRlrjZggNdn
	 u0KDC2eeqWUacAneEi4oRdUpSpQffR5CtzSZNR0LmndDi9mFSzRwpgfy6dPyAObCcZ
	 Zb+QcOIvKLLJg==
From: netdev-bot+sinfo@kernel.org
To: zhaofeng2@cmss.chinamobile.com
Cc: Wells Lu <wells.lu@sunplus.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: sunplus: spl2sw: fix OF node leak in
 spl2sw_probe()
Date: Fri, 27 Nov 2026 07:49:56 +0000
Message-ID: <179576579633.3294.1181547324454104776@kernel.org>
In-Reply-To: <20261127074228.268-1-zhaofeng2@cmss.chinamobile.com>
References: <20261127074228.268-1-zhaofeng2@cmss.chinamobile.com>
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
