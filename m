Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462835;
	b=h8qE8+on+NLMvBTF4Pz6s6CSIUE+qbxbrbT3dD+fl6j8QQq8WWD+BeXd23ZX+H8m69SW
	 9GbG7K5NsQW15OMeH1JxTucYNoqfz8gMaf5aO6XDD0SX2HnOocsrCLfl7gXJiydsusVLr
	 yvx93OPdEIrcNOMX4MEhTXPspUs98DISJlfUa7LQ5J90TI8GtAzseDw8wCHPv0J7/l1zL
	 ljfXgyvIbwA/ZXcCDier+vtn3u+yx01WZkDYVCdH9d0SIncuODaXLdNR15pDcTUWtUZmE
	 suBWTZs/6wOaH/hK4w3pOT9IuEruwfYw3e1G0cAd9ctek3YT4U2PT9iIOdT1ypJKhcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462835;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S2Q0aVTR3K3tNkqkrKbglVSQfpIySjo/vvYyIfNGhGM=;
	b=hZRHaj+Jk5pwEbopG6Rv4QscqD1m4oA7fWVJm6Wcwyb93Mz8iL+qRd0y7hbB+e73AD05
	 63XmVttDXyjjy/fYFaHQEAjFfMkSHrJBHSs2ncwKyI7GBtmqgbgBUz1F2eVqMXnsy8Urr
	 NbW8dQp3MsFHxV3eJfoYSGy8aCC4StF7gdFqdS6L7WhFLprpRS1NHTi1vAVod6knqz85h
	 EpkJscvGsD/8YHsZvZZ05ZQ3zPQd5XvnXXzhwPHN9CIvpbCh+Gt10feysm+jJSnXto4g4
	 Wt8qUrXdBTjPpFWJsYCayPHSt4Vs09jMCnCmaMkjZrZ0Q6VX0NXqp32bUYj1um1gKmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BfEaN/9N";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C71606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfEaN/9N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7E41F000E6;
	Mon, 23 Nov 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462835;
	bh=S2Q0aVTR3K3tNkqkrKbglVSQfpIySjo/vvYyIfNGhGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BfEaN/9NUPwRQzlSTwhMw0Ps5BFpyHY9oYJaJapk3RF5fH/M+4SEujJZpov6nJJqy
	 1Sj3esZ75pPSqao1YOJWCpf7kySOFGdbcRPYxoVcD/Ep87HmW2pR0UOSk9JMZ+mgTf
	 eJUza6zVKaUl/DQg4ciP6TZqFInmUbUSUGcpBMIq6vohUvC9vvviCfk7Mb3kjVez6s
	 jBgFB24FK7EylmA7l3y5bRi93RfEx3WR7vMk0ysILbPYv1+NVcrSZ5KJQiLyrshda4
	 8eMSLerM96Z8RftOoWmEZgsnvhMJwysaFo6E3aORHq3od7Rl5az5wasy/PQuii8CNP
	 Acr/x1brRxDGw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH v5 net-next 13/13] selftests: xsk: document generic and
 hardware endpoint runs
In-Reply-To: <20261119164636.1071385-14-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261119164636.1071385-14-maciej.fijalkowski@intel.com>
Date: Mon, 23 Nov 2026 20:40:31 +0100
Message-ID: <87fqwrpc9c.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:

> Document the frames that the endpoints exchange and how
> drivers/net/xsk.py drives them, over veth and on a NIC with a zero-copy
> DUT and an SKB-mode remote: what it sets up and restores, which cases
> are expected to fail over veth, what both hosts need and how to run the
> cases. Point the xskxceiver header comment to the new README.
>
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
