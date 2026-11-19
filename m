Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127429;
	b=Nd1aQ13cmX2pNgGAd49PbBH8AfhrWaNGgofdBjC9lU5qZkFzP+iusZsnv2hW5aqpacgN
	 BU8meWUeWDOZ54nNWt14LTFt6w4HD24e9VjOOBDgQ4PCz2obZEiYFPzeoGGRAfAl5h7DW
	 NRpFktZTG4AnbuHx84wTOFrVciEMlA/Yc0VLFC+aqO4KNabbhf3aV3LRyJDkB4GTV98P7
	 N2TM0vjPTn5U5lEJ1zcmpX508e1u+G6DZZayHWkQ6WEyGDP7UZQytX7hlAXZlWgdwozHJ
	 htlNp7oqQ4IeUweROz+LBSN/qP2FL0uX5tWagkl4kkmSESh9+y+x4F5C0C/T3QDUImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127429;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z1dTghTaKtz+6XlsUqAv2sd97175TAUzyOoX368JJ0c=;
	b=kwTwFpKMJQT8zIy9WLsbJYD7x4CHRKXs6keEL5/TNsMrNar+wX6vIQZiZz/Z7EP7S54I
	 zV7Pr7NR66O7cwpUjZUZVrmyc56sEFou2iaRDjurczMaSMS5X9OY42NjBGWYiVMEObpn/
	 DNpoIi/1ByA7Q7ZHAZRqyoY9tHEFJJo7zOtmfAPLD5s4NfejlK4bJ34P7/MwBiPw8R4pv
	 ykUGKwm19yD/1ZMiK9aeAk3jH7UrKEUlYLmSuI1WsJA5zNk7OKzZyVKvbGK4XZ7vXVjvR
	 RJ1q21K/a8Q+c2APLG7xj0zeiUmzSmZNe9/w7amto6JLsCxXXDZLnVlgiw96GFlhL8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTYVSRqu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC5D606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTYVSRqu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13F11F000C0;
	Thu, 19 Nov 2026 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127428;
	bh=Z1dTghTaKtz+6XlsUqAv2sd97175TAUzyOoX368JJ0c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iTYVSRqu5EeNmI5Knm9QQnCRzjBZp7JUhdRnBegEMRQFk0cR/YxFCRGMJZCIL2Bok
	 /RVLjzfCvnywHoDruNrWXWP/k9BoRlnOWiKKjHaZvbK8f1h+OoC+QDWml8oD2z144H
	 7L4v1+HX1FU9COI9DVEDAcKctOR26DRYubmWJHY/0WyXHb334j8U+hTIineuXHC5EU
	 0xs7egjxj29aqHEnVNpKKTdziKQ6ZgvXhN7uW4n8PGSnVx6wj/9ci4Y5nMAsHgZsJ3
	 KJ9MT5hx5HItWORH4prqTLr5qaOHhY2wxmYyHBL+r7qq1aJuJgWFgWlOx9ZQE7p4Q9
	 C3xI5GE76aWkQ==
Date: Thu, 19 Nov 2026 14:30:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Chan <michael.chan@broadcom.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 pavan.chebbi@broadcom.com
Subject: Re: [PATCH net-next 6/6] eth: bnxt_en: restart Rx queues when their
 IRQ moves to another NUMA node
Message-ID: <20261119143027.6d8ca735@kernel.org>
In-Reply-To: <CACKFLi=Zi7QBd1oNt-d99S5e6PfJ_Ym-p_-+k+iFHSU5zCi+Mw@mail.gmail.com>
References: <20261118023905.3050661-1-kuba@kernel.org>
	<20261118023905.3050661-7-kuba@kernel.org>
	<CACKFLi=Zi7QBd1oNt-d99S5e6PfJ_Ym-p_-+k+iFHSU5zCi+Mw@mail.gmail.com>
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

On Wed, 18 Nov 2026 17:24:12 -0800 Michael Chan wrote:
> queue restart already has the code to do HWRM_RING_FREE of the CP ring
> to program the new TPH tag.  We can add the missing logic to
> re-allocate the CP ring pages from the proper NUMA.  Since we are
> paying the heavy price for a ring restart, should we include the CP
> ring to make it more complete?

I coded this up. AI review thing popped up the problem that
re-allocating CP rings causes loss of IRQ moderation settings. 
This seems net-worthy to me :S  Attaching a memory provider 
on a machine with TPH will lead to loss of coalescing settings.
Quite unpleasant for the -irq settings in particular.

Can I send out the coal fixes for net and this series without 
the CP realloc? I'd follow up with the CP realloc after the
net->net-next merge which we just missed :(
