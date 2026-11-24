Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481031;
	b=nyR1vKxQLYKF1hnRCtgf4j7ybOohv1QNPL7EIU7M2LrviYfy7uM5KRT/cjWdJwlsdhU0
	 3uC+f8O7LbmROVFD05FX1GYVBx+4x8gJ00HQUF0QIATOiDeIKgTrkTrOKFmh1df2Uo2Jn
	 dPPuTis8cvWTv+AzJbKL5XDqaRHBnJuLtyAfAG2tuCE/5O1g5n2T6HOh1qylSpQb2Thin
	 KaajC1C3Q1osE1eNPBV+UlOgGEeKMU7ug64kCkZWY0FYAK8UaKDIWL7gNauwwmDZz/Apy
	 Pyu4+BW90Q78hMllUu1UzqHUn0Awa5GPDgE72o1a1F/L4HXnQNOkfGwEOSADVmAx5gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481031;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oq3dZ87wnB4vAXKVR+xyI8iQIG0JX5LSwDgC6uzAlFE=;
	b=Y02FdZpb4sAqqOIT7lgkoK5VQtcaBuC4ljpdB8S1Mi0HfoJVO1Ew++DxCyU4PA9gXUDc
	 EasT6OzYPU1Ut3bddWSD4Vkami4OS1NcAqRnkRqcrHHWqTrhbV2CP5X31+HFNoFsUjSZc
	 raqY5oJvK9SKrQmcOYzxUBKcWA94/NSKL1/Z7eY6HcNnxDntXvin3bp0h+5xyvbX7SO7m
	 xyTg7mfQeIMk/hPSYzaAHrovqoJoSh2sEcSvgv44TYiT32347U78wsbwpu0QIeMDW7BO1
	 uM2XFWZA05IgJVfHTDnBhm6PWLQJHlc5a+J4sqfOxkYw7zg3dG0urU73jhaOcpJikZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7vzhiVd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE927606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7vzhiVd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA20E1F000C4;
	Tue, 24 Nov 2026 00:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795481031;
	bh=oq3dZ87wnB4vAXKVR+xyI8iQIG0JX5LSwDgC6uzAlFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=E7vzhiVdhJk/Vidd2ePwcHDFCUPSTNparIy57IH20c5/XIQ7EefM/6XMrpXlcnalp
	 cGhjUHsCcS+4e8jA0euOAjeERtJlpdA8enc9yS9oy/8m3ggBO3/FrfQSNWEU6mNsS+
	 mlSmkQ9kEuKOKh8r+NasdPl39jeAfLeBjiiM2Otm8GKygVKQoqyEk7dT3kw7T8JTmL
	 G/iY/so7s7XCNpzcJNy1f9BiFBuCIO+xphHorE1SYmV3NL7+iUS35k/g+/xJCrNQ6q
	 +LUPGLw7sLtdhxD11CS5v9O35PcRu0gJqQ42BGNDriIQKqSsz+iV6gOO7YKY6xeJWG
	 Bn1+BZ/Rn09Hw==
Date: Mon, 23 Nov 2026 16:43:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: Question: netdev-ai AI review embargo changed from 1 to 4 days?
Message-ID: <20261123164350.7cb0edb0@kernel.org>
In-Reply-To: <8778f095-2903-4677-be82-fb1bc8284100@yahoo.com>
References: <8778f095-2903-4677-be82-fb1bc8284100.ref@yahoo.com>
	<8778f095-2903-4677-be82-fb1bc8284100@yahoo.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Nov 2026 03:37:30 +0100 Mieczyslaw Nalewaj wrote:
> The series was posted on 20 Nov 2026 02:21:49 and the page says it is
> under embargo until 24 Nov 2026 02:21:49, which is exactly 96 hours
> (times as shown on the page, in my local time zone).

Unfortunately the weekends are "not counted" as embargo time.
To give reviewers and maintainers some rest time.

> Documentation/process/maintainer-netdev.rst still says that reviews are
> available after 24h. Is the longer embargo intentional? If so, could the
> documentation be updated, so submitters know when to expect the reviews
> and can plan their respins around it?

IMHO we should remove that section, as Paolo said the situation is very
dynamic.
