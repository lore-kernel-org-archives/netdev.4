Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944871;
	b=4g4/BmdK5jtllw5apWelGBJF1K9j9SQEOX2fOLv112A3YEmgf9B6vBbfaQcN/mzHcaqs
	 0g/6WrKBeaWvQqEPv2S7L3UtqBzRX2K3GRZFtaNFN9KDF3C7wBmJPQXVPNGPh2OYPO1yH
	 Q9vCjaCeIJgipssGr9juDx321y+5JclB/ebRx2jzzpKRyWQnY111psxv0t5Mv13QFcwr1
	 8xmR2MNORt3g0KkLsyxFpUy4mln7kWXw4yLYXSHQKEMHQYt51BoiroRP0fgAt7BmxiCH4
	 10DYGhTbv4DZy4MjAXsJituFmy/dMotrPxkuY+VpiN5d6tSEZk1XrotAe/Ng0j7b5SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944871;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=If3JpWMF3NJy3fqCfvgK/pYvPw5ButzufZWaIwgm6tlGZFns9uvM+gha/A90+W7um/Gd
	 SWxSIic/gdXEYnSI3BhVeZo1DZM0ms0D4LHy8bj2TPX3eqT6m8PxZ7P8Pr+kdMY04nBod
	 NAqxHeJtRxsL9ts9vzCd2vwiszxnaKQ+A6RT15tz8G1UM8HSOLPE4UHQT/2n1g2pV3f0W
	 aV3DNT58p+2buq/fSdb45EExY0roT2tIe9pCths4rJ5UjtEaDqyq/pQc80b78CBqFtJQK
	 e+EUg81sCw9KQylVigVp65afOIYgnjD8YuKd+E9hh3DPYwCP2ZYtFLgxJQH7zxhyXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQmq0vhR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073BD606A331;
	Tue, 17 Nov 2026 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQmq0vhR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4C31F000C4;
	Tue, 17 Nov 2026 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944870;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VQmq0vhRaxxXAtyIWOgcEx6kADxKnzI4YySSpz0aElySX++xzwBpAMNIgW8n/cy5A
	 SdAHQbaLOImKibv+VdDI3D8jBp7RtHdS25XmC+qUdn9e+n2USInCWoAO9PG+0Y+SGi
	 LvtebWGPBusI+CiCoSvXM9oAjxTltqqA62i2IfBSU0jJ/yWAmKT6CMSDKUPrOFc8iI
	 fE8qwHFdGYsiF6CFn+QvaoTGxs19gKb8cF6xFt9W1nyPm+ft6iVI9SBhcthFUVe19F
	 ARD/DceBkm2eVgzHgbLlavkmDUK7D9K7WiLz7m1qO981TzzKdpE4ebOcas5u2XvejN
	 oCT3BrL2o0zqg==
From: netdev-bot+sinfo@kernel.org
To: Chris J Arges <carges@cloudflare.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@kernel.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@cloudflare.com
Subject: Re: [PATCH net v3] wireguard: drain per-peer queues with sentinels
Date: Tue, 17 Nov 2026 19:47:49 +0000
Message-ID: <179494486983.3291.17883172583563427033@kernel.org>
In-Reply-To: <20261117-fix-wg-peer-removal-v3-1-36cf733c2d94@cloudflare.com>
References: <20261117-fix-wg-peer-removal-v3-1-36cf733c2d94@cloudflare.com>
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
