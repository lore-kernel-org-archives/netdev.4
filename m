Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441132;
	b=UZ/LN7tmFJJee2bwNNsTiLefZ57dO30wi9xmBdtNYVn3BplqZqQH4rjfhJ+isyuAJJlS
	 frzEM7w+Vm4IUaYWGXmI1MaIeIxRneW9Ul7X77P3vvCsiP/qZilmmmxF92iJTr6liSlo+
	 ZgqSijxrZ+drRNccfZyLTKsUq5biOUxK5GnKj2WDmHJNo+t5ShU4PezsJU0QUdQzkZu/s
	 yf/hp4asyG7cRGvwE0mzuGe/4veIRYDeKKZ/0hd0/BSWSTGzKnlo9B+9UZ2nahpR6+XRZ
	 Eh8oFnnn4S3musKBasZEwOj3TfQiVKcZddmbY0NfdNYtqsJSCRzbKp397HT424OA+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441132;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=torYEkChis7QtJqA6HsljRJBcHabqxK7fCASdkMbDkCtug/XKPX5n6roLRFIDPRKfVN/
	 urYCgb8u9IHdm55K1RfpcjapswRBIzOAf/DAjeMkkU55YFQjQ/dYT+wuh+AJC3Wm6n/L/
	 Uwb7ePZIVi+HJyFG3dnn074Rdep6Z3GDQ0kIsNKNZhFFGtWgxlOzaZ+KaUUA6IXnQjp9b
	 idHYrxDr2zRj5UBjq7lHfr1YzrGl8b8PSPfkgEm2hNcIHxgLuySln4s3cySbpdgDwJxSJ
	 XE7afzld4SGwirP/uk+l3BotFgnXJHAp9C49wuXBRGmwDDtwPTFqAjEMHn62hNE8iGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l69/63Y5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E97606A332;
	Mon, 23 Nov 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l69/63Y5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CDA1F000C4;
	Mon, 23 Nov 2026 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795441131;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l69/63Y5yercBM3LgpuDLVV2mxOopXrHKvW4zJj31uVfZn2SHyZCTaxG3zKJNyBqu
	 cS7+0ql0yzQ1BF8r/qlw/p9nhhzRIp/83dGLe+2VQ0JZS/IEyShYrxkf2cw5GFQHKZ
	 p9Cn3GbMfaz0nUcSGN5awI15a+PNoZn/Kt1SYAK7GsIq0ym+OBM+4HVTbGXuO2UTnj
	 SDKy4adYBAyQ3/jZj5bPbTf1i59VgD6MqHSp+uYZwn1br090hUBNKIYlW/S/qIxX61
	 X5d/m2lEqAdqz8CYnLpthDNTe97KJ6YhW5vhLyi3+eepdwPqq7OKwyV2TI3AO6xpMn
	 a8VO71S8rq86g==
From: netdev-bot+sinfo@kernel.org
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: fix uninitialized axi_blen array
Date: Mon, 23 Nov 2026 13:38:50 +0000
Message-ID: <179544113068.3294.543571005115003901@kernel.org>
In-Reply-To: <20261123131326.7105-1-jszhang@kernel.org>
References: <20261123131326.7105-1-jszhang@kernel.org>
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
