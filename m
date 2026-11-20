Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134771;
	b=FgwDOs4LwEsxo/1YPopSHe8ZaaFvkiBVD/rQo/C4D67GE4qUwywy9SjcIbSImYksQK0S
	 mwh6+qphnalMHkPY2i05EX6LiMp3tlXINeTm2koX0iuYa+Wv5ZUdCvPOPctV0djihBf/T
	 WZxsYP98K1XLe4oG6auptlKz+M2Q/a+2sNHmi/o6dczXE3xBRS7EpQl4hroUCDct15D6l
	 IamRvIhcs0Rqkfo6A6PAeJkj8KirdvXsEs0qQar8hApin/FNQ4tpqhqgb2iIi92y/6CDU
	 1mLfLYpqTCM0f7M68hVYPb+wD0P4URVUH6jt11CEMybKwUxjzz6Cs2K11kWg4aKWQCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134771;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=0+p5F6UjuL6OfA6Mf7qPhNuAY34vL75GLKxclpi3YVs+BUviJ4MWaBSLGfeUx5QD94MV
	 9ulJfA+m2Z3HYQTYZYBYBp+7wRhwtrdSvFEasj/GZmzhiVOkXaZIxOioo4Wb6dChArEC1
	 KY99hpvY7g9RGXpy4b5pY858vu8mcHYa5SxpCdpmPeMtVUv44xB1vGTWtQI60mPKDY7Ob
	 Pnr89CQcw+7/fCY1reYb1hyrbbbBJtxV5IThVSZfi9t0Qn/XDLxZEKxbL4J30VajsLLOM
	 LWehwAtULjBN9v3rodSYPBnkQsA75qkmVq/qVEsmDeVR6F+k7wBbKq5Mx7epf4hji+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqiHA5PC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43343606A33B;
	Fri, 20 Nov 2026 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqiHA5PC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A001F000C6;
	Fri, 20 Nov 2026 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134770;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eqiHA5PCDgrPKC8JpGnvfhD1amaiqdB6dsQ8XrG9i89QYe6NNf01k+GTw+ckwjnTt
	 Iev/qipELvzIifZh7DUxJi35DirV1lS/X72PMTlGO/jWc2Hc7J4+s38jURh7djjG5v
	 zglRmIyZUwVH9vtMRQJbtsyD0dg5czCJflY08XZUXgfqR1vdnwNuq+uUiApnXIO20F
	 gsBfhwSuUZjWtZDwfZ7PvzftSLpVKoWmdZVZv3FPEo8G35Qixl0VGqBkg8e6hJpDXk
	 7SFf8qlaZ37o+Yx723gN4Z+zNfgL4tCNzYhFhZESa4TXsva3PogM6JSZddJ5LWKULw
	 QOTthqlSFXz4w==
From: netdev-bot+sinfo@kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, rosenp@gmail.com,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bgmac: unregister the fixed PHY on probe failure
 and removal
Date: Fri, 20 Nov 2026 00:32:49 +0000
Message-ID: <179513476984.3291.1559548469790216407@kernel.org>
In-Reply-To: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
References: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
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
