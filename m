Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198916;
	b=QxZOgZmEa2JhzECKKDanRn4FGX4X25GX3zGlCzyWrTg4pfiPOCcMQ3OiMAX77j67dFin
	 Hcz2ImtxvJVopyiAYRIsPa1uEHIJmLJ4ku87rRXi3mZCHTjjv0qydGQ6q4GIR4FrgfFMJ
	 1ns6rIhNj9+eENFOyE6ooZYkwhjsqf0T/9aSt6TNMTQt1UCgsih9fF3MyJiFAKGQXQTF5
	 8oBPJa3eIfkY4ED8s9mGh0W7MIlQugXu6Whllg71qqp8s9xw6eC00pKC/RAmFEUBqqMrs
	 xBjinwozVz3ajqDl6TiyWZLtKO8H5mfIiw/QMZ5c35JGhLr8P4N0jyYb3M3LnSem/4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198916;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VHRDBUmUzGMvnp90/6Snw3PV/G7HEJp87yeN9sM24xc=;
	b=fd/Vv3+3evMCJ6phBYJsAs6hETsC4WRUkNk1JJ+ZJakgT1fb6TIjp4QWVfy6PRdKpgqW
	 kNzgAhwRVGmY1gH5twL8d/GTjDpo3gLOwI5n+2tcN6KaIkmkhgszXK1UZHv3fwm0XQAmS
	 vRG3BLnccPhDYMAem+zgAKTkvrOPBisW9+c/KwixWR5OU2vwYhWwuHmIOs79AY6vT/lIG
	 NgUZ+yhoRWSAby3NPZ2FSRq1FSFoaDC/+f7njDaAub//d6PVhIgEed752Iji4z3x07TEF
	 dLAki6mwXQ5wKdxNug2sd2O2md2Sk5t3Q4nkkdV5d5MW2nMzTwFoVzW6rP2zjMlczQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bSKDCtX2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C7606A8B5
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bSKDCtX2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FEC1F000EB;
	Fri, 20 Nov 2026 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795198915;
	bh=VHRDBUmUzGMvnp90/6Snw3PV/G7HEJp87yeN9sM24xc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bSKDCtX2z7VVoAvR06saVJS/nRTU1y3Qf6VSxXw62ZlT3MoJ9Tw5TSkPTSyvWmeWV
	 e5D5XTi8Cr1ZtFTPUQnycF9Ir8RI6wLSaTBG6Wf4j2EYUpaCsvJl8NqpL9OhBG1Aga
	 bmbbRsDGhlEQhZUi+mAETZI6NUsGCdUa1sJTX7TxDg4eQ73KFDuhkfTU09IW+1KbNa
	 hl4UZEgAk+yIbszeFG+tG7SrUskl4omr1I5vpWd3DY99m4ebFHsYmkT1HS+jfgpauk
	 5E0E533QtG1/FxSyv5Pym7+0FFYVHmgwUYbTj39tPE/yD86Qhf8vIR1haP+CVcHa6O
	 17lUA9YcUpftQ==
Date: Fri, 20 Nov 2026 10:21:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Hans Ulli Kroll
 <ulli.kroll@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Myeonghun
 Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
Message-ID: <20261120102155.19670caa@kernel.org>
In-Reply-To: <CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
References: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
	<CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
	<20261119165240.293dfbd6@kernel.org>
	<CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
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

On Fri, 20 Nov 2026 11:26:15 +0100 Linus Walleij wrote:
> > Ugh, not only is this pile over 15 patches  
> 
> I blame that on Sashiko's constant "oh by the way fix this too"
> and ability to find otherworldly error paths...
> 
> > it also fell victim to the
> > mass rename of kmalloc to kmalloc_obj that landed in Linus's tree :/  
> 
> Oh Christ :D

None of this is funny to maintainers on the receiving end of the slop
cannons. Please pay attention to what you're doing. No excuses.
