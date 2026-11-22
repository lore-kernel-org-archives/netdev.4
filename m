Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308437;
	b=JO7QVadamdRcCdagZW60fCxRG2ZjTtaSvljnnUqAgSC/pNMenh1TXVnyd94RHYIhTB8k
	 MZmGOknmIV8JrzZVG+gqCzg6EBxwUULCe2sJrjpT4L+hmmCmvXnJ+lJA413tc+0ZoUnnT
	 lyTxy052UED5PVBfGVAzAd91Cg+pvEkJ6rw4wFmVwgIeF4ReOngIXNQzSYzoyV1g11NTb
	 mpal2WST+q2wSxEQc8xubGOHdaWbKIbpBCSEkglYyc8R+IfT89oBKOb0bwxWIf2QJvxju
	 14R3WG1nCPP4KbntA8jkj+V88/BleWem/UNkD/994IMzvCkuV8QV9Q0ZkeQSB7suBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308437;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=H99txkPHm9dGDVOna5fmRsZn5RWoC9UwQ/dEpIVrS2k=;
	b=IoQ2VKgw5j9jc54AcT9ynDPfUCLbOqeU2Xk3+AqtqIwqvCJvNHnPQAN9yVxq1Eqs4dkX
	 zlklWNMYZGNSrg9iK1xJpeygRMgLY8ugjn28FmMNyX5Rq+LULQdsZ4O2Fd143m6EtIRqd
	 ySfpEjSOf38Wm3Anf/ba7vZkWDr3UEmET+VBPsRsmfMKZ5ZrQPR3nfY6QgsRJ+W2bX4I5
	 FzMMh7/2hANX3eCdza6POr9TXf7WE9B53TDHrtOP2lvTGXoj8YnPf6xmf3b/1x/Wccj6s
	 CnT2wqtqss8rgNeHpojo9lqr5xE2N5iB0y/QCc2zMV6i+qAP+6vDZlIV6zf1fhBUzsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6J+ibVd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3D606A320;
	Sun, 22 Nov 2026 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6J+ibVd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99761F000C4;
	Sun, 22 Nov 2026 00:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795308436;
	bh=H99txkPHm9dGDVOna5fmRsZn5RWoC9UwQ/dEpIVrS2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m6J+ibVdmd6IGgOEaLkTQFnC19aka74mJmzz2E5gIB2Qyk76V2AGGgsE5uHhFfegM
	 4sE7jPyep43t4y4K4ReWf7W1gdmZcyP0o9NPFlUHkkHX9SreFmw2SNwlSZPGKQS5be
	 VW9xsW2EWnUcEhG5pAyhzSz7vFzcLjOyZMaGAnuiJRnF421kh/kjT/bze1Vl++knYX
	 43DvMZDAufWigfoogSnlNzzNSsz2M5iIYCbfofCbdDlKVhW72s20imr3JS4MnvhjDn
	 yydxOXk66B9DE6fKzpvx8hpyJ6X7i1oHFqDAw3qNAu9RvPcFmMEOxkbQkzO6I9ir/f
	 kk+MTRiWBQSqA==
Date: Sat, 21 Nov 2026 16:47:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sandeep Haemoon <sandeeph@loljews.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 Mason Chang <mason-cw.chang@mediatek.com>, Frank Wunderlich
 <frank-w@public-files.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v7 0/3] net: ethernet: mtk_eth_soc: 9K jumbo
 frame support
Message-ID: <20261121164714.5b0ae08f@kernel.org>
In-Reply-To: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
References: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com>
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

On Tue, 17 Nov 2026 21:55:36 +0200 Sandeep Haemoon wrote:
> Date: Tue, 17 Nov 2026 21:55:36 +0200

Please use git send-email or b4 to send patches.
You submitted patches with a date which looks 1 week old.
