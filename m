Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468933;
	b=fHNm3Zl0WKiLXWEN5ONt7nLhb3XY6XNYJyZgs3Mx/4cRs8Zn9Ep34dvdFWMj0jVUvMcy
	 81FVqwYR32+jbpWKezwIsJnOMPmTWh/7qVQNmd5auEwy6oHQM57ns7U25bhuRBfgpRdNK
	 P0r1hAcqX7ezPQ5m3HZPFNtO48Hy7Ti0uA/k+sn55GsrluB3BJoI7zlNlwvS9Yqcirk/W
	 fqRY6BkN/pTh6JnUg1kCOrXykiuZjPNxGitecmYtJYKvzl8Ba6mVQJJ3hdc1wKx+ItYSr
	 qakEynhwdgXKUCHC0v3oCkw7d9FCt3cax+67eIjqbuXs/H9lQga/FHg0t+lr9m24pPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468933;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4C+x2bSqT/spGZasJgcWXdVVV01Y8X7cex8zoJDVlwE=;
	b=zUDQIshODYBlr1H0CiY+9zA6ZQCX8ygJ5jGFjAgaYHSoHYzpOw3isMZmg0ioEyloLjsi
	 4j92dwESq5fTsjYW4BW05j5CzhJdD6Bes1b2MUHM7emkcnNB9lGG/bkn0kl3mOHeULStQ
	 Ec8y+FFsyfhcuaqq9lilvE8Lh2wBSTchahwpuLFh5/fcYANBR9QDwNOKWo0VtY6pb/BS4
	 /xR+6BKWl4GnABoLNcyzxISbTpIzKe1Z//19WhFqs0g3SiM5gZQRJzv/Jk/DGW3HAEYX0
	 3Z5+qW5X9CSJ3wM6yZI7GE6eETZUSdKWnZ7OWqBm5g9byUggrTtQf0NvSWIuTyoTfhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmU1X0I5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08E606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmU1X0I5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968CC1F000C6;
	Mon, 23 Nov 2026 21:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468932;
	bh=4C+x2bSqT/spGZasJgcWXdVVV01Y8X7cex8zoJDVlwE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CmU1X0I5on30Gb44g92nPfEXrt8z5rar4wS0xkcX+8VWHYGrzt/ZplGVmtrG2FVjk
	 A31SzzsqkOkD9lPodVVWPTB3Hwlblglp6fDnidaOmOMHKRp4FtdEaEXMcFc+cCk11i
	 agUADj1z1zdKnwIMP7oYgngoFA7gwNFfZP7u761CPZZjWr3UmknPxCnL6cG6N/vkrZ
	 g5e5oLDMR/eYAr0OIZWvLnWY+nOSY7OSLXpkLlu2z4/PGltyEWO1+PJswPlz+lSeYh
	 K22yHGi9kxBtuFUb2fidm8NEgCZ9Jy681BpxnvpupVkt8AObGS8zVLf7yydrhVpnwr
	 sF0/DVxNiprbw==
Date: Mon, 23 Nov 2026 13:22:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nilay Vaish <nilayvaish@google.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] eth: mpnic: use netmem_get_pp() instead of
 page->pp
Message-ID: <20261123132212.1498808c@kernel.org>
In-Reply-To: <20261123192126.4012643-1-nilayvaish@google.com>
References: <20261123192126.4012643-1-nilayvaish@google.com>
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

On Mon, 23 Nov 2026 11:21:26 -0800 Nilay Vaish wrote:
> This patch was written with the help of an AI coding assistant (Gemini).

This sort of advertising noise should go under the --- marker.
No need to repost just for this.

Acked-by: Jakub Kicinski <kuba@kernel.org>
