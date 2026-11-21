Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220249;
	b=ERrc8nYrL+jj08E8serUPwYfwZyaLphQVTgQ/Y2awBufFsXimtCMNUfsPl4nsJKz9SIG
	 lvn9yD8SJjV4UiD4Yux2wSE0xNTgt/rGBde6h4f0DyKwL4HTxy5o7+5DheN19TKXW2mQq
	 K2zFqtk0+FYKzlay33bHA9yFGuQlgGsPv/83OHoXkvwWgKKTdJ4F+PM0rnLYXEWlYHA+z
	 IznjEuT7qFEbFw3A/XRFnnbA51P0r5ZeWRTC5pJhhtE3MTxS4xk+mtfyj0BrhQIe9ZWQR
	 27DV2FrmQrN3rHSi2Kkt4HNvux0FS9QvdGRSyN9FH+6ch7KY0a/iocdb8afANQhAT6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220249;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=bAz4P98v5Rd/JkY/sIIAZbkefFcSz5KF64EDjuCrhnYfx4v1rYrDeGUl/uSKDLeZQv6I
	 J1eR7lUVfX/mIm1RjzqA2d1Lwuk4i6Lu1sn9/IeNnoo5PV3iJ9wze8PbU8PE20Ggu4mHZ
	 rrJKsnz45Tc6aAjdJPPNgKUmh0Vuc8at3wUWykEIMCk0ohdUozVe7Xd0eZU8LUzxt6pzQ
	 zWeDtESPQKW2Mb8ED95kgdk5uHJ3zizQbOsGnh8ec6Q2az3j6Lbr0Eb7vHVAsFRM8BA5E
	 GqBMFdu0/emRf28jaA8VKfMvzVws+y6l5iDCFueMoSYGW3HAlhc+otQKrS8wXvSumww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5udVzHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7C606A686
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5udVzHM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81D51F000E6;
	Sat, 21 Nov 2026 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220249;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V5udVzHM7YstZfJ/wcXBDYG14Hy3ryfnotpRWsUwkg6qqZdxuEaP+kS0GqVWaiXYU
	 r35YufG6NPQxgu/ZqOkzVTgOv9g7n1UW01ydd7iJqrHnAkPqF0qyBob8FFhcdmxCB6
	 hr7Yk0HRbqkhnP5SoavNWN7OOOEEyb86sNYtEPkSqJf/aNsWFqK/RfXOfLLWKXRAxy
	 CaIe6OAmLoSzmIYoPDgFEZdpn90NHwS3FK2Ld79vJqbJsFvy6+zkb3G10IBhcbXOQz
	 vsitufKJumcYsd0HdZ5GVXt9encuMynW2wcBdZ+yunjN7fXmUIh0eYXVg7eq9Rljxu
	 /4oZjA0NCr+sQ==
From: netdev-bot+sinfo@kernel.org
To: Artemii Mashanov <ralerrdirsardx@gmail.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Nicolai Buchwitz <nb@tipi-net.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: bcmgenet: reject undersized RX classification
 rule buffers
Date: Sat, 21 Nov 2026 00:17:28 +0000
Message-ID: <179522024822.3294.17329682912331634453@kernel.org>
In-Reply-To: <20261121001550.732679-1-ralerrdirsardx@gmail.com>
References: <20261121001550.732679-1-ralerrdirsardx@gmail.com>
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
