Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534095;
	b=LSY9Na2Au123X4mb/HfTUIVDnQWc0+ldDSInwyfE9mnerZ8R6KM6qvrIlJ7BgVqMbOKs
	 I3JWTxspjZBtq7YXJeF/gjMVE0AMZdSp/vSsmqXCaUQqRk8zs7xXNSpFhFubbCBCv0110
	 JrmU0e9SyDpAlsxlBoP7CzV4dxGx4tZ9uc3QzX/F+FphrjPclvvB9WUIFHf17Nz2Glp01
	 H97iZnoH+wnh5IM0Rg3+ReqpAyN0ISs6+Y8t2fNmgTc7eaVLvHo36FqYU2SD+LiV0YJum
	 l313EHTdSH8w4qNWD2V5+xQpzOrLK8rOCSRFHrG2HvPPe/MDcTxKDUIwCAH/qcAGBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534095;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=kTg+6y4tA12HDwxg/KcVORjEK89zdqkcS59lrEND/yzuYQ6FzFe+FL+g4J+zT7XExEzh
	 jXWVjAlJrDf7/wytS3TEI1J7yqKDMLbgZAMwo1aN3Kd+9fhpV2at755FeA6qp2pLD+zTF
	 NUUhXYmpw2WiTwaIh4K/92MBzhkfA65StVhLegydIhKO0X21U7hqTlQpKhz9DZixmIySH
	 NkTeTnsUCBw10hwGMSp6FygotCqhqax+Eb7vr/TLi/pnYX6soJGQlhlaRZFpvME1phDWo
	 uo9b8SkQuwkxTRE5RUl7uOReyQ8lTrRSsSX/nkAUH0T8tWyUQic4xGQM7bS/vRAubyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rz71yD02;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D83606A32A;
	Tue, 24 Nov 2026 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rz71yD02
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654111F000C4;
	Tue, 24 Nov 2026 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795534095;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rz71yD02maM2ju5iWINlcFkYuF5hurMaaJjsqtYq1HNBtZGv44KQ/EWaFVLmdNJsW
	 Lj9YbHOXTYSMLSUr9RaO3LQGlM2cM3qyXyTMou1hV0rZ63EaQCEkQd1tZnnvWukr4B
	 hHwKIqbCQA28TmKcHh4pxFeyA5MTMFJN+fGeqSCLOXUhcilZB847CklVweQ/2zIatp
	 SxPOpHVJGg5wWQkvJhunTf5XfiIUnjvPeofIiq81bpQMAuM2G1O6E/+ZS5YH50iZhV
	 NcLAiGfnBDoi0cCOwQIxwmgHgml5VrdAJagKV8oB9jIsl61Ib3Z0O4GwjWCz5WrVgI
	 ftVGfYNXQdZ9w==
From: netdev-bot+sinfo@kernel.org
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
Date: Tue, 24 Nov 2026 15:28:13 +0000
Message-ID: <179553409391.3294.4369903743102583251@kernel.org>
In-Reply-To: <20261124150144.7505-1-jszhang@kernel.org>
References: <20261124150144.7505-1-jszhang@kernel.org>
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
