Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944287;
	b=tt3whfbpWn7NYP2olQpRF7vk8S1CEsHEIZBS8WniB32qnG+4hPYmdGvDNGZBuDDvrPoa
	 LHVkDpETFuq5J2kUw/jzmT3Z658UvM17EbnxnCvkiBRs/6PZEpYrIyEtux8NudvA9VqNR
	 /LjZ4gaSQvvHOaeCWNd630gfegKT1ZSW5b/biJT3GbcR26QDlgd8KedB/d9uxUqVzwQ7d
	 4TqKH98LVvn0RCm1fcBe1HkMGkHUMSPH8QstuuBffHqAbk150e1mf67ExgyGUJdQ3B0Kv
	 LmWJxVs8vOt10TxJLR9YxvU5YqMQtiw3FPa+mFEod5h1iiYYxY8PmTi019OzjiDI47g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944287;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=ovNaBEuDr9O9409+BQODt/BDcjur5bFQmlK3ITjxMWDaLoNCCBmTzgO/MsXZsTiAjWD7
	 6vbbXNtGlUJWgAUX2KrM3XLd59hWwS7mmIctKXHDl2pmmdIKqT01MGKRCoAhexJ+quVly
	 d9RAvIYF/i6yXBfE8MxXR78g3p50RwCNM4lq/wJMXadvOkwGWyIJtY0Dn+N9R7FmlUqpN
	 QFSDN3RO5EihOKnW2vLCJ3McPNcozOzblxnmb+0ZKTX1GyeUwcl122LtBZyuLJyvUFQEK
	 UVX/JqzgsAUV/mbxZ10sYTeWCteKwpcWsT7bdljE4tBp56ywC8Eyn7QlT8jqGPtKdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgtht248;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41C606A32A;
	Tue, 17 Nov 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgtht248
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CF71F000C5;
	Tue, 17 Nov 2026 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944287;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cgtht248lcgfISA+5DVQakwak8maKDesZKs0sx/PU5tQOsG2mpo2rg74uBYPKuJaM
	 q6zjYwxfM4fOfbgELM7GWP7OzQ0cy5m3iOpMlQRTJKuyrprnvIo+71xYemneYeabuX
	 vZH6Hs4u804lyfe+KxObpwD8h83HwOeIkMpbgOOebjikj+TL5p75AbylkQfx47RZ2N
	 wIoJ/qG//tbmRXfxpodmXMuNYcL3FMzblrl+zuXKkCuILIzy7QT64cHt+WnL0yc3Qt
	 NqjFGxxq7C1LJMbarG6sbwsDW+cHz6NFSh//feMwkvO1y7IJw56WjLyOX3eeQ1DfXS
	 QSOzHVsYKtPrA==
From: netdev-bot+sinfo@kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jijie Shao <shaojijie@huawei.com>, Simon Horman <horms@kernel.org>,
 Runyu Xiao <runyu.xiao@seu.edu.cn>, David Yang <mmyangfl@gmail.com>,
 Herbert Valerio Riedel <hvr@gnu.org>, Danny Kukawka <danny.kukawka@bisect.de>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>
Subject: Re: [PATCH net v3 00/10] net: au1000: Bug fixes
Date: Tue, 17 Nov 2026 19:38:06 +0000
Message-ID: <179494428616.3291.2255681676266334895@kernel.org>
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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
