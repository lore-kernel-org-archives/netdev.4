Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011779;
	b=yPg8NO+5Qv2odXVhkCxLOEZjffRfgG6XeeOLKAxhA1+QcQ+xa38s9QrPTKrWNRt157po
	 4TN71NS9O3UgRRnK9JbB/qjyBMnVLRPHi8bN7Sw5ZWBVGlpbRQ6KKFgaLW6q1ay6nzSdG
	 Ic27JSJNoTtJa7xIn2l3/LkCo2LSoUxe5RY+TLLJpU9Qlp1OF7nLdAH/O0CJz6ypKJbV/
	 qAA/0+51VqHySLwP7HEslUJstamtYXDcrvsqd/t2Tb22Z5GAqWRyH6WBuq1XLsaXCAu7A
	 R2cD5YiCrrNJ/NP+AFUD0b/aKVgvUImIzcrGvnZlv50px8srqi95SQQFrJDHNeSyZbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011779;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=JcTn3SS70AKhjzMXDxmXt0bjqA7BG7G2CRQwi9Oq2Ro87qLzUEosVbIZUBPh4LfnKRf2
	 CUuYj9sEmuZNIgTdgJ2q0YDOFGCrtqPE6uq8/vphOnYAP7tQFipG/ZGfGAhAjAUZltKOw
	 3qL/4WYD6sDrDfc0mJaAhJibi9yV/WawxonP8Uw2jxJIxyBlePcrhdCR3XYYMUSLRo9qp
	 AAvARvkunvwRQoJ2AJp9vXc23kzKh3kZLeUrMRKKJxVBRTYN0M9nRtXU3LfdS4cJDOc0L
	 ZlVau86Pd8A8IdyHar4rRzTsf0G1MF7/t8/Rjxen8pAtYvvH3w21LgkcwPmcLzIaAVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrCazA9P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0740606A33B;
	Wed, 18 Nov 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrCazA9P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DBC1F000CA;
	Wed, 18 Nov 2026 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011778;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hrCazA9PxKkZx/HFWduZjzrwhKN+vnlXsIrIdQvlhAzgRKBiMJI1FhsqTJ0DuMEHs
	 3c1guksL71QvupS9mActpqvwCqHHlqvs3p/Q0NhAhCyhQXM4ewG4kKDkSMYK5G5AK7
	 26gz0LKWpl0Wf4nUwSGh1mt98kmuT0ZOAa2J56e0UXWqPXqJ2FnO+nk668qBJZUJTW
	 I3dhbL2W5QxZ77FseKY1NwAlyNB25Sa7y+emu25UGrj0+96YyQb8g9r0h+WQw9xoBw
	 O5RpRHIncmkriEMY6erjyyTw095aug/1lwXvqfQlgagJRolIqCiazlX02HuGIEaU4C
	 db9CrZEC6hUVQ==
From: netdev-bot+sinfo@kernel.org
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net] net: bgmac: Fix potential MDIO use-after-free during removal
Date: Wed, 18 Nov 2026 14:22:57 +0000
Message-ID: <179501177771.3291.6091133152515318342@kernel.org>
In-Reply-To: <20261118-324f82bd41-net-bgmac-0@mail.sdu.edu.cn>
References: <20261118-324f82bd41-net-bgmac-0@mail.sdu.edu.cn>
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
