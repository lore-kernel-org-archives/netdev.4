Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573975;
	b=Tbo+frZUH+JJrcKJOVqneNVD+21cvvrHJYfDOFtQLMfnpa/rFRRoLqYmfnroGEren92f
	 s5ttKXAlyjFKaEQvbRffMDgVRBpljd4Kg0EF4pyfajBEdZnQ0Qb2shrLWmqXwPyxrndMi
	 mAAvlele/OKkp4J8r009S4kcNkYtkH1KMAXAwm7i/Qf6bCtcFU41KhWJcQZbFwVchZjWr
	 ncOikbRPlLekOogWPhIoTv7m3GdZrCqKlwPV1iaJium0rioks/rBDbhQ01nH0YdV5cCTB
	 rdC8H7jeyimSkl6555dBQMq/Vw6xm7hpyAGb9aBL5+OThcVeEmkxoKz2x38a6L0wJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573975;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	b=ntqgk4VMWseY/j/CC41T+GzGq2U+0TVHfwohhaVISQLCaTgu8oSuA+wDtTp/GBoupHJq
	 It2dizgwjRwAGOH0QUOVNF9VXlc/B4uAJChA/BeqrlKx2nZYPlJaoAtRwJaarZFS0YRsy
	 5MFrhAPm/bxr/xkRqVxmt/Gx+ib2KLNKUEq1OHVww7pbtw0L59657mEzazeVNRpsaZ/lE
	 qTg5uv+dxj3sNIwHquvPRTcVUbWW7BsjY1hG/rQGlZti8pSsZXhngRHE3p1aj34kxTQNE
	 Sso74QBCi1o/CgznrKBgY6W5XnWODb3eiDesmH2DCVXZxqnW1t1agX/kWKIMjvpIy3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmYNd5oH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4B6606A323;
	Wed, 25 Nov 2026 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmYNd5oH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7321F000C0;
	Wed, 25 Nov 2026 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795573975;
	bh=Uwqp7Bz8a5D3/B2xkBHbhP2Bh4hQYQFs0RxyAqY1Gn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TmYNd5oHyzpLF9hzIgn2dw4pHDEAv9h8FbU/zWwDvG4P/fv47pHY+q/t0VkhCSxYn
	 vMK/p931yicsEc1m2US8kMXdaUjaQnY934iBk0Hw1yUSnas/6ThGXDDuluj+1DXufA
	 yq6zIwh23XUeZPiJ6ikDUIIuS6PvdTN/4lQko5M/7pYkoyabo27X56L1yqo8AVtZoh
	 3LaUEOD9jutT2VKOd1NBhI1lhHBT7cMzXV+/PWM2dn7gnQYviwIMZjT9CSUbgjYe7b
	 8wW0978dFATb9WsC7WVKMUAUJg65hYCHbifhnf/811s6s/Sx4k3Y3OK5vgCFqLMZ1W
	 oJf7gJnWRQ7dw==
From: netdev-bot+sinfo@kernel.org
To: Vlad Banea <montrealtango@gmail.com>
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, javen_xu@realsil.com.cn,
 nic_swsd@realtek.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net] r8169: recheck the TX descriptor after a vector-map interrupt
Date: Wed, 25 Nov 2026 02:32:54 +0000
Message-ID: <179557397423.3294.15950681362384539211@kernel.org>
In-Reply-To: <20261125022643.1169045-1-montrealtango@gmail.com>
References: <20261125022643.1169045-1-montrealtango@gmail.com>
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
