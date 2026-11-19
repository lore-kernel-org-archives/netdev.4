Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131241;
	b=Uq5b59+gCKMNEFlVbzUShk+2d9NmuHFUfCRtGXyXtfZnaZInGsM37mGXLHC8SI+5gaS/
	 DRsut25t8+rSq7bnCiJ1JxxAz1zMx2AA0KWwZbSo+W7QQu7rlow+6RfBZvihtq53auP4G
	 5jnuxjwCKrNwml7i+34KVD/44rvp5sTroks8TkQYx5uWUcfUKiI+GiKQaVa3Zum95tEMS
	 m2QJIyBgc3hK6aB6JUu3SSC1e66Q67+ef+5ykbZofscVAS7AsFV3q3TbLrlcECv3dpQMn
	 AvzEYJ+VFD15ximAdge3OPqvs09vePUX2muVL+RWqMFJYhSG4rJVQYTI0smNHiSThYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131241;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o/riQ6Rp9lNUag+Na8yzBW2UdMslv2nQXBM29X/rxaw=;
	b=hO3SoIfgDxVChhgKlftkzt9vgtZA7wo8IIezPNdoN/3zEFtdPNgynK79734VoOi34z1U
	 B0+DuAq+X4wSoAHbp/Js4syoVpNmzt185AdMA7bflERitA0jUYip8i8YqG+C4Hm0odt3+
	 k2TiJrtrc0IIu/CBNeXF/BJLksZWIrVTvkfDW/GllFn+DzvBurUUpHjMPtSv05BbNOdle
	 iKfGVxXFTSl5X4IdrQF1RAWN2XXHMOlWRU3w13liyuXwBYHrDeQ2PI6Yx41L1JFYhzisy
	 ZoPfTX+39nEPfoxjYUxrGeT+05/RTHZX7WngOYbYc8jWWs5cXCbcbyR3niQIueOnplw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnwO93ud;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ACC606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnwO93ud
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2EF1F000C6;
	Thu, 19 Nov 2026 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795131240;
	bh=o/riQ6Rp9lNUag+Na8yzBW2UdMslv2nQXBM29X/rxaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CnwO93ud9+Yx5F9DMwNiBS2KH7IZYVhMNj5SHEHHzR5xg7XFtzbmBsoAvn7wJ8lP1
	 N0ZqUjcYF0poaJJfCcYry1dfPVTCtVlfcLGdwJwFb9kt5GaJZ80UFPqhDoZqhG0FWA
	 LakVeKDUkPtDkk/IfbQLS1KoGUH1DmqIVJVnK/pnX+XRzCAWXWPy3USXrpHt94QgZf
	 sjkhPLHKKfajUyvBFcbFQg/mIKDNYJFu+K0brQ7FJpeDdX8UUekRgV3AlMNlEI4GvW
	 HPHFM/F9MvvvgwgTt99FMs/hBKZTcK+LbetcQLv/rxZuyHob1GH4EkcMu8I0FMJtrt
	 A3A7OtquhDpmA==
Date: Thu, 19 Nov 2026 15:33:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kernel-team@meta.com, pabeni@redhat.com
Subject: Re: [net PATCH 1/6] fbnic: Wait for in-flight PTP timestamps before
 treating Tx as idle
Message-ID: <20261119153359.06277f25@kernel.org>
In-Reply-To: <CAKgT0UcDxJHs2jCUtMDPzTBX2pFahFOSO=Qd01mO-4xCwZ1Ozg@mail.gmail.com>
References: <179460248693.8819.282933709034208845.stgit@ahduyck-xeon-server.home.arpa>
	<179495005876.3136.9616798412841778832@kernel.org>
	<CAKgT0UcDxJHs2jCUtMDPzTBX2pFahFOSO=Qd01mO-4xCwZ1Ozg@mail.gmail.com>
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

On Tue, 17 Nov 2026 13:31:33 -0800 Alexander Duyck wrote:
> This is assuming the worst case, but in the worst case we are talking
> about the Terminus Tx or Rx path essentially being locked up to
> trigger us being stuck in the wait that long.
> 
> The likelihood of this is incredibly low, and the change that was
> already made reduced the worst case to under 10 seconds which I feel
> is reasonable in the case of shutting down an interface that is
> potentially in a stuck setup and requiring additional time to flush.

Could be the "don't add defines for meaningless constants" in me trying
to break thru, but in cases like this I wonder if the AI would have
complained if the AI writing the code did not over-comment this stuff.
None of this matters :S
