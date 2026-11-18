Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034597;
	b=m9ZYSdjYen5FQ8NPsZRzJkgtHAGZKR+LZ9Gx9nOuX771Vr8xFX//LerlBPGf48ETebyp
	 eukvTGCEWKmbHetXIsfvE4KydY4D6F/ROqMJr0BTpWzOurRBRiVQkfKsjWz8+mfLMnwcJ
	 VZS40cGdcJZsCuodvfAhLHPN1xdQAohBDxJoTyNYmtPjZkHIp4nEUgYQ0haw2oA9jZSWy
	 zG8G2qU7uqIwKw4n1u52LHinkFRWgJ7nFHNy0eSqkYSlIWgBpojKQh+f4/Ee6x03xRLat
	 QyzOktVFM3VF1yzvpvk8c/XtpYxExL45d+4HY2FlqctIZLFrdK8Aow1tXSeHjMM4jDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034597;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=qvMNCLfmy/BMWlbgjhn2AT9PjnMvUqJUkG0nsIr4FFrwsy/DxNVUGqyc4fPdVj2QvqJE
	 nnkFX4y/9bmOAz+gtPdI/oL5DagSmRyUqkSRiI5lMhiouuwzGPJyXMmPrC5SHo+5imXMr
	 DjqyjpFBzWzRm4cNRPng1vJhah8ADvdQd5zJo2DSMUodkhfBf6rtWKgVD8/EYSMXiXe8Y
	 VX/xa+2Q0rJXnP1l95XxIlAe1WXldXJk0b3P0kBfpbq7xPZsiIOZ7TihIDeCd3Y2yBW/7
	 wIaUB5WGB8gG/T04payFdJcyENlHNZz73N4jAlF2wdfa5waJ9LCia2M7DTYM9U9ldpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1A3YYdv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F02606A325;
	Wed, 18 Nov 2026 20:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K1A3YYdv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D381F000C4;
	Wed, 18 Nov 2026 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034596;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K1A3YYdvbGBy1o07r203nEQPySIfke0U5XGAEHoVvk09x84ToRZNKNfQmnMO7bt8F
	 KBVPnqwAF7xZUE9CyHYtu6d96gj7UMBdLexdjC7qgucwGqFQ/h/iy6rsFDkoePGXSm
	 7Wzz8qRMr7EeHe/xLCOU6gHcHkBfe1IlW0CvC50mqVvZThj0o6OBvGR4La7H5X1xY3
	 oexUn8BIbvRX4rTXj/IKpJtHw28BqvvMb+hZq07j1s9XK1Z0yvZ2cP4IagEOvfZIYE
	 ILO20Em1aGzIt6eYWpeAOl6i0asvqRYFOl+Cd1cCjGbEVvj2n7wHUG8VVAGShJyPjB
	 UI7ck/DWQdOiw==
From: netdev-bot+sinfo@kernel.org
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Justin Chen <justin.chen@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a frame is dropped
Date: Wed, 18 Nov 2026 20:43:15 +0000
Message-ID: <179503459556.3291.3443136407720616811@kernel.org>
In-Reply-To:
 <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
References:
 <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
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
