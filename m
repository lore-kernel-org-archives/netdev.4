Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945477;
	b=eEX8KWYmzkwU5/AaxoCeypMrjA5o/llF6EQWHohUF9pbOr0WzUYEKsYXKVDoQRoGMz9j
	 OGY3KUa48EGxWzRTjsszaQ18MMEUmFYNPZ2HbCjeajzVq197sJtflBt2i1cBAslhSXJfi
	 h+obGq8S7IxyWSu1vbOULGvORvAR86Bjz2tVBLpXtJ7avhAR0vh4RQtJveph/3w9idYua
	 CQbwI8R4cxWvVVni8cGTK2S7uXJ17RnykpsQlwLpXXHlfQMp8HMV2jg8fr5SkyK6qGjUp
	 cAByUXs7s251xPbd0egVKXu2ej2VRKrkm56WzKwl849khK/edokGWcjrMspcsiOT5XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945477;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=OeMq+tCatYSlGNqfCdy34juBgJ5Qk1vc0sSnKeQXr1C+qPe5HoxnLqgeo6N/aQZcI33M
	 aFtf4dynoECyPmpRMI2YtVjnqm5A/5KbNXQQZb+289DiopNi4WjXCI9cLlz9P+HpDI5PB
	 4sxkvO+rkp/M2ux4qFANKq6UzdFHd0MMULuVfxEjDsETrFhGQnHri5hqJJkhHEhLFKKk1
	 oxkpklEwD1lcRf0fXWhRqTJi7s/rXO3loPOvt5gitjFw3JzweFzWCic+sBR6Kw3gWTays
	 WnlUf3xmg/zIHfGFWpHIadBheiRZBmIqz2mJD8EY45gpuzcZROFBhTuds8G4lVhlmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qmm0tUOQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC84606A31C;
	Tue, 17 Nov 2026 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qmm0tUOQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FFC1F000C5;
	Tue, 17 Nov 2026 19:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945477;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qmm0tUOQix9orHJ+M60SsL7S5ClUt1Y20NqzT0jXys6ZNK0ItwdDqfKTGEkCBdNUK
	 haEgqrt9ZTqGNc2OfXrezk4FKLR8uXM99OiduuV53V95i8z6OjPnxN7rBPTUx41faS
	 VshZaGnMf4o6wrDlADqtp9GeqqeUkNHd0GIPP10uUyQgiBoBfK0avQ29Uz7XiFVplU
	 8eF9t6m4O9HFD0FgJgZpKiJfb1jJomLMZcPjvdzu1eUzSV6p84AdB5AGKWhRKTMriG
	 RTlU/NCaNqi9b6OMb+YRWBQ0bP7v7Lq7EUCyvUUaE7EKGuTY79QKtsAgDi6LuQQERs
	 jvzXEVvAK1QKQ==
From: netdev-bot+sinfo@kernel.org
To: Sandeep Haemoon <sandeeph@loljews.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 Mason Chang <mason-cw.chang@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v7 0/3] net: ethernet: mtk_eth_soc: 9K jumbo
 frame support
Date: Tue, 17 Nov 2026 19:57:55 +0000
Message-ID: <179494547560.3291.4586654587079488988@kernel.org>
In-Reply-To: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
References: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
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
