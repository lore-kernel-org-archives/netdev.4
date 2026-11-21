Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243416;
	b=ydh2Og8ARX9O7sdTYWRwFxmSFc92VGdRNg167xdKwkE4k1mXgxbGL630tyW7WmPIoRbn
	 jhxtQuio1eRQDigGld03bBLZftjBrwYDjK3LB4DWVkYlSJb0H2VW13a3h9U5K7Vfm4goh
	 WCG4BvnopEJSA0AgqLKa33DdXiIfndEFA9X75BTiUlXAb9jviQPAtEJpQR+QjvTv6CZNH
	 73+UiDyeXVBLjKqmN4XYoqnq+ELnr2XqZ91YOuPGVzvy39hvXI4YsvHDbtPNXA4L9ZMnc
	 qhay96cxQDV+yIPDnHCy4u0AIIqsuKlngyQVYr2LHW5Hx/iCY/Ll+EqUdXhDDASUrKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243416;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=LcX6yKijDQ4P4Dduh+MLmE8nLLasfIJh+whl1xqEPpJA236Rc7Ma6nyN4sLEp16iRljx
	 fIJbuqKs92Fa9zi6if/OOunncrURvoGDwQvUTLmb5OiOWeMfudv10MiFUGb12v3/a94AE
	 SrgMHMB35MBpACSU1+Ne27GIKhhXIc9xrQFPtcptPJ1I6fU6sWDJs3vHes5K2eR23cjl+
	 eRV98/oMb2tWgoRVkMeXyUKWtIEci0Db9X0QwaZR4Wr/ZoR/GvI3Wni7LxH65HF8pZbsR
	 ixNg+DT4Lk9c5R38nibzQ3uYq+/AGm/2iJrZn9GBrDnQFFbr8bhAic32MrP4QKhQsoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJj0Bjpo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314F606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJj0Bjpo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E62B1F000C4;
	Sat, 21 Nov 2026 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795243416;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eJj0BjpoxN0thmh62gmpC0FxRSCdHOGmTV25fq17peizpqm3RYFFVON4iPDT6PZJS
	 29qsIVVn0+O14d7Yqtuzw5SDtl1Lx9d1gl4HGenPw+JWy9uYN1ek/glnHmobo9f8VO
	 zclHDh/jkYuK8GBv1/GxVuWdLIkr8f9kZ2hTX9MpKW1yu3gSPIRVumy3SNuEST6p4r
	 58qkBs+FRogE4YNuU6tAD8n7kMrVqqjHb96wd0GUwJL34Sg9ZhlkNaGjSo32XKNsk/
	 BM8TjLP92Ei4omQYmegejyKcJ/M+OG2rKPE2rgtyJ2vaqaaK64oX5Vs14KEIVNhnQM
	 6XutBjwMK3PPg==
From: netdev-bot+sinfo@kernel.org
To: Dai Wenjie <3596417740@qq.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] ipv6: reject datagrams that leave no room past the
 fragment header
Date: Sat, 21 Nov 2026 06:43:35 +0000
Message-ID: <179524341514.3294.12249348939105146017@kernel.org>
In-Reply-To: <tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709@qq.com>
References: <tencent_BE8DC9842FFF55349D2FCCDE456B9C6EB709@qq.com>
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

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
