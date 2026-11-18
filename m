Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006732;
	b=LKQuUjVAZ2qCix60H2wf/L9DNbHjwjjNMs7dLilgoX1pM0HvD1eHkNe/+SCT6QxX47oy
	 hEvwbs1s1uG+MlgwrLBqpYYd73TRBStHQEVlEdyXJjbwaa4fLOb7J94hB32qs+VbRJcFl
	 W7EHjLkddmbSmzu4oDt8UZVZhg5/FQrtfINMveXHNgi20hROfOTFO1Sw4vAp6SaZ1hhR6
	 /IzXj6eJRVN3p+yCX+lBTlMZWUeMmPbOX4hjI0DePvf/3TbpQ6pxacRVUw9puu18Zj+3b
	 bZG9XV5Lc6c3NyZNTGCPYhhQG42PVuk1pjvj6PyfkPrbM+TTqzDcHLhC+kLP/F6lXMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006732;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=GAuHVjYRU7xvfFBOpj34k8R8/fhxOwLwoECuPN09DpEI9Isnm0gddDhbPLd+HYzkYvSm
	 JZMMzc59xkwFGRpeS7geKv1dxcYZEoGUr6S1+qqx4jnjB6Kb3oF7PWQWsIhCmXeQReVDr
	 vf7GPFw3QXJU6+rhHtUI+SlX1zadu8tke7vm0FtXf97WiS3ZeQLUMGvfemWZTOXbp+oZf
	 JnxI2nGVs4aXGNrt+kbKLJELfxftEn6UXRBRKwVXeWvSI5NuknBEbdPaFrBdKIs2zR1rx
	 wK27pD2kC/WSSFIHAYPi53pWus8B8xa79y6xQ+qFT+axHSF4j9wJPFjF4S8g+XA2Tqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAOChx6t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78326606A334
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAOChx6t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794101F000C6;
	Wed, 18 Nov 2026 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006732;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RAOChx6txmgfP4B+hrpXjuaFegobLiQDTmbU/KcPZ+8kgzZh+Twx4YFbaZ3HSwyNy
	 c3uyiF+OCA2TnVOG9AjA0Cg+zAwU4tfUJGNUr2HUEjYb46eqgIgXfyErX0BAGk5Xrg
	 6fJ3CUxur865lUrqiq5UwR6jG4OaJSeLy9vzM0ZR6rbv3auM9NiEbUv7GlmbsVtiBw
	 3uWGdavTBypQX7cQu/Y6pAK8KVFcMhAF6FUKXbF9OipgQVOv/20qmIdsI7b1G0FSzI
	 esJKPd5LbDMlUWGdlOcQ1cgUplUxYNWj9UluSmXvFrHQdkBVfPKwwFDrPePecoy7CS
	 uX60IXlPSp9Xw==
From: netdev-bot+sinfo@kernel.org
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
Date: Wed, 18 Nov 2026 12:58:50 +0000
Message-ID: <179500673097.3291.17329016243066243127@kernel.org>
In-Reply-To: <20261118125443.1137177-1-edumazet@kernel.org>
References: <20261118125443.1137177-1-edumazet@kernel.org>
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
