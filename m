Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967510;
	b=MxTf6nKp9v9HV3G9ljcB6b8eoFeqvEnhXwJbjW0ig7NYYfUI9E9SUGU7yev4nMNs0zjJ
	 sAQb/UvMXF+vZYUBCMS/6HMBWfGp6QlUmAkodG4zTMNFDE7a2C+LvjsnBMbAUDFkbZRCF
	 Hq4fARBrP/3JarPEdJnIoDsO4K/Kxp8xM0mJuvJNNoyw455lywvMKAWa1/7P2CCAkpYYn
	 euduEwNw0KKf5wHsHmKjh2r9bLHT9OND+ucc1Yuq4JOG0qsyaWglJnRogV9uzUv3ibQ8f
	 cw7cvJm7pc8aoN7Dp+sDaEibBfR4DOHEUQJdBQtCBD/bReDQE/9OeU6q2zG3waTamwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K6Q4yL0bIta4ROt7rRfLU6vlk5XhpuPWdXmQt3bduxs=;
	b=3tlYovxJewV5u8o7drepz0v7jxszKHBtdR0HhYa/lLstpbtqFcuq1VCcBw7RyjwOMRJT
	 DDDQ7f5eFbEXozODECiPqWNltS+fcLSxh2RBnvYvLISxmAUfCtB69E6zJwftrBl+rC5LU
	 W2OedkK1PlVCie+6u2U6GGN+dJsYwrlNMxcuhlbKVCpjppERjeFjj+w4S6FwtA88AyvXz
	 12mf0fTPuaMEzU+so5Xo9RJj0BdQ3soLLM0cm0PDRJFYtELLmmisRI/lmrR4JravNX4Rj
	 OwId2M9H66GkbHv17qJDEr0b+eZU7BaHT1rDZ5b3OYti8gmml8FbwYMc33TYf6i/j/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjD85Ake;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96516606A31C;
	Wed, 18 Nov 2026 02:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjD85Ake
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2AB1F000C4;
	Wed, 18 Nov 2026 02:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967510;
	bh=K6Q4yL0bIta4ROt7rRfLU6vlk5XhpuPWdXmQt3bduxs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FjD85Ake/7CPY2G+FLJCTacZmvZwmfmczAiPgH6/YSG/oWUMaLlXMnH5CLGgAoyoL
	 BS/3ipPIG783n8ZqJIWG8t4++wprU7wOifRRh7V+9EsQ3ZGekLz5Yyz8R1fPwUnhcK
	 uUODqoh5sK/GGDAnP0V97ObsuivKiNlyHhjpR4rDbU0PU4xBf7pxNOrH/Oy5vOlUGC
	 ywQefMZl/6AhslU0QkyfL0o39zJwG+//MEsJ6zcM/S/KGuZkkHyvzuaAEr0wvAxWG6
	 R3lQzWEpPMrXTyY4zweN628FGtB968vheycILqrfORewt6bbGIQsJtZAyohaiPQ73o
	 NZ82GZIxBHJEw==
Date: Tue, 17 Nov 2026 18:05:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 davem@davemloft.net, edumazet@kernel.org, kuniyu@google.com, ij@kernel.org,
 ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com,
 ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com,
 cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com,
 vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com,
 srichard@netapp.com
Subject: Re: [PATCH net-next v3 0/4] TCP Prague preparation series
Message-ID: <20261117180509.6e654904@kernel.org>
In-Reply-To: <20261113125628.2893742-1-chia-yu.chang@nokia-bell-labs.com>
References: <20261113125628.2893742-1-chia-yu.chang@nokia-bell-labs.com>
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

On Fri, 13 Nov 2026 13:56:24 +0100 chia-yu.chang@nokia-bell-labs.com
wrote:
> Please find the v3 TCP Prague preparation series, and TCP Prague will
> be submitted after this series.

This series does not apply. Please rebase & repost.
