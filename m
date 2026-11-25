Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629829;
	b=OCnthRkEJJoiRJ+NKkmljHX5wzn866q1Mo4g0M6ZBbLFSPQvILEkb7oDy1wfqoOLU/kh
	 kysa7vXjhKIVuMuZr7ZerOGo5wjhxomp1jLoij9JbOCk1IdPfVUeK3TgzDwl/AL3s4H1W
	 IO/ifQJkB6ullWG6bu0yW3p4D+g2EcTXZhaVFE8YESTII8pgU4Q3InTzgivHbpgqzonDh
	 7BAy2RCUx512BJaL0jjhWFYJEl/NVLXNyeLukf4PwqT+UgbBGBEBuvFEc6vtYfUj9SSs0
	 5JNzh4/es5evfB7gO+M2I5prqgr7GtoDUop93H1UA2tZqQ8qFF28Q8vj5GBoQNS0xUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629829;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=nh3G8a1RicOuL77wI+bwFKNocLLOvDObe+5FsWKWOTw9EzT6tpo4rAOzwLnrbRcJlk8m
	 1tkmiGIjq9Hl159euhhtvTiNvpbCS3semaXCwNU1U0lWITBPNOjEgrkiE+IMf44ZyUbd5
	 ouvAAGu9Tzk1VzV7dpwtCt+vRIleh9Bhd2Poneqkkr5qSNw2u95lTpzjLE8IAvqeYu2HM
	 EcaghP9qRBx3l0aeIad/o42rS/qZW1xwEUI+oDWSQDO0bvXH08EZcaOt9WEKNYy3e9z2K
	 BHMYg3Rz2qvflToIbCA2v60ZCF5N/JJoczU0KqBwp9U3jrSd0Xbw3dTykSUDBXTxHcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlR4sVl8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC97606A321;
	Wed, 25 Nov 2026 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlR4sVl8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136941F000C4;
	Wed, 25 Nov 2026 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629829;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WlR4sVl8y2XcoFaXs2Kw3wHwEUXjR1Gd0MYp2QhWR4NhNlNZjiB3AlicRIjs3o5+d
	 3kUb6FLGGhV7NTUC9OwB+WxN80u9QoqdLXyjiE2zP8WKOALUUI40M0XrLmiOX4bmcz
	 aHgx6iaAH/jjBfjrqUB8XVT0gZs+5nrSU37ORhLC3+EyuFvN08VYMhbCln2nqSYhCc
	 dCT5gixO5ReRdKgEsR2oCuMYXOe3rnbftPgXhsLL9WuX9HgAr8rwZSWQTPr5csi1LS
	 ROozwGDjiFBZeCESnb9HYGSS0n0xfjYMZxw1uqyh3Dn/NMZVEYKuycZIK2V3HH48/Q
	 NgMKr5xiuJcLA==
From: netdev-bot+sinfo@kernel.org
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, daniel.machon@microchip.com, mbloch@nvidia.com
Subject: 
 Re: [PATCH net-next v3 0/5] net/mlx4: TX helpers and deferred doorbell fix
Date: Wed, 25 Nov 2026 18:03:48 +0000
Message-ID: <179562982857.3294.6026464051217294907@kernel.org>
In-Reply-To: <20261125180021.1804204-1-joe@dama.to>
References: <20261125180021.1804204-1-joe@dama.to>
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
