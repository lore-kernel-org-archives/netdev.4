Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302934;
	b=T/sZVlvK67W7DyJenkIGq5vhkjHKJm/t55DbJ/L0+b7mLE1SOZK1nD6mGFFuMjqhJ9MG
	 j45KZHdWj5dKCY1fkSXsnFH8punRiBi2DXypLBj6kXEKbK0zdjk8ABPagd3aq4T3P8ruP
	 /HjOSpDAVlJ/UZhSI07ZSQ8jhVC5Gip2c1d/YSDONhsuXUZFBGRUolQiKy69tj7Sf5WZS
	 3qgnMzmLWOui4+sZkeJLE8WvscwT3pqtJ2tFqVJnU7aw5xNifGOgBJWxx/jOtpsROTw0H
	 84stPl4bl5Pwk2DBKoaquiGNKm2aW9j/eEFxU/q3Rc/jXNlGIZ0bIX9cQc1ToFn8/eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302934;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vBXsqtkiOdQKt1ALymIhhIgXfqKF1Cbx8lZk/F2q0Ag=;
	b=RiVKokoIu6SW5/SLdiWppLtyqWuTqtpZVuRcuAZeeKqNVGOvg8C3F+paMYP9jyEjYUtf
	 CzpGZVct+NHU+6qC6FHpkgcO/7Zrn1Bt/St7UiSAoe5oPAdM6ME7WhwEHbfSVa3Nw/+Fo
	 zJk88LevhJ6TJ+xeA/UEAU4fCRAPAWuZ/hMN0sPQSBOhuFVZZ4yyQNAZmDsci3CVkkseT
	 LGcdCf1ajdnGubMXh26T19BZrDlEx56BBlAnvzWpUg17cwUJGXmShjO1pHnPUvtOZUnYa
	 Otl1AXiDT2FBtGoDqtgAKOzLUwQZ0OJwXuEVwLlJXldghLy/sGe9NMC6uzXLyLlSAcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nL20PqbZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943C606A32C;
	Sat, 21 Nov 2026 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nL20PqbZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB391F000C6;
	Sat, 21 Nov 2026 23:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302933;
	bh=vBXsqtkiOdQKt1ALymIhhIgXfqKF1Cbx8lZk/F2q0Ag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nL20PqbZLnvscMpIdrmOby/bXWqfqQAuyRpyKc1hzxu2ixtfprcIcprUhnhDGXvom
	 fy1ruKNExDm7l6hHCitis5ETByf9UZegLEhfMq4gEcfopzUBRuweg+TRGyVUQf3+3f
	 r6icGYBvHf/jBhlze3busugC/S5sn4ZqteFuVgfqmARqF0taYFmlcL4UH3mKlVRC0d
	 5Z+NnlAIo6F1R8TYgz0I9x0CYqJ0iAJBrQZ+NOvNVKBJZx+X01RCasqjo91jK3/TTK
	 K/6ynCsfOtkoWnAUmCaLJyHNSmMNEcXfbkxoJPaCk4PmlrgyqFNPUzSPkO3TbyRLDc
	 YZIE9zKyUIICg==
Date: Sat, 21 Nov 2026 15:15:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Cc: shyckless@gmail.com, netdev@vger.kernel.org, edumazet@kernel.org,
 davem@davemloft.net, linux-kernel@vger.kernel.org, elb12345@hotmail.co.uk,
 horms@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net] vlan: require real device netns admin to change
 GVRP and MVRP
Message-ID: <20261121151532.56c16e89@kernel.org>
In-Reply-To: <20261117-vlan-gvrp-v1-1-53a6b0775953@gmail.com>
References: <20261117-vlan-gvrp-v1-1-53a6b0775953@gmail.com>
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

On Tue, 17 Nov 2026 13:04:41 +0000 Suyuan Wang via B4 Relay wrote:
> The same gap in macsec was fixed in commit ed502e485685 ("macsec:
> require CAP_NET_ADMIN in the device netns for changelink"). Its author
> described the identical VLAN case there and said a separate VLAN patch
> would follow; I could not find one on netdev, so this is sent
> independently.

We can apply this as hardening but I'm not sure this is an issue.
netns can already "disable" the vlan by deleting the interface.
I guess we shouldn't let netns enable the vlan. But then again
I don't see the use case for having a vlan that's not announced,
or the harm announcing it would cause.
