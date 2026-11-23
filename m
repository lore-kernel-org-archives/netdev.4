Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441338;
	b=0bDfT9jKOxBJ4vA2YVH4Bhck5BEx5t8R/UxRPv0VpTdpAdKMFnpXUKFNIj8iL4zDm34A
	 85jX0zLr4w5coHT0+YJMseLimxtb3l3YpL1H/axddt8T3S4lCJjp6d+kNfz6T5CBBJML+
	 QUslJhDh0mkHQuuuFSVvPkA+aCcl0ZXEmubvTBvVa5O91H/5eJao4rX+EotGEj2abgJI4
	 xBC2nhW76owEhFUxtNRBKkH5gtlYFTjjyb/jiTpHR9+rKcn7fKgC7TeXp7Vc3YMnt9qbs
	 7WDipfuxzylC0WOcCL/dFDKZZkBGgI6JKQlO8W4ux0yQzuD+KxmZnSVlcMVbSxaHAew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441338;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/59dkLXw7fWA0046VR7tU5oUR0oxbfp1PkFwPJklpDE=;
	b=PWJWVwfgUWiKNKHMFijNdY4FZ/ev7sLdSfRLSu5Q4/7HvvvS+iopb0PEG/Q7VqBB+rOG
	 h0lRjDeiu3IHmfu881bzHQiNDl/zgeEM+hKKUSV47NvCP+cnKhRxzWc4g20vy+Vr9MDy2
	 lIggC4wKf2r6l88ldZvQA4r7Rv7Dcg8tHZ+WLNnTUVV3UMWmPjztdYh1cBjKWVX2ks9GW
	 VZg5/xEqZ8svSXVoGN9SrN3uW/Ap4NbXy0A/wHaJbfWiiPoQvzIj0AxGpK08hRoSPiVRM
	 CwRUdzAle3S/bar/4mYlnCoYWfYRY6QB5YAqCAftV9C+ukNoFMncuZPfSRosM0G0WFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=OiIDMKGV;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B5606A339
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40B5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=OiIDMKGV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795441335; x=1795700535;
	bh=/59dkLXw7fWA0046VR7tU5oUR0oxbfp1PkFwPJklpDE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OiIDMKGVPGqiHMt0HzbnYrdFL0Ix7mCahLPMEvDPzkejuUGRBSZGwJPyLYolIBJzJ
	 WM21XyiQI21B+gdtd9OQBscSJaZgBARnfzHGd3BOexXcaQqJTp/rmU55AZt9Fk35+w
	 uC07mDrLlOeSsxVtXV+86AXcTua7groW/t2H/RdAaI6jE25IOvhr7Hfr+DzZvhqey3
	 hfWz6bkrwGn1wKG6nxAuIpvfUVGlKXNEuzpM4Vvka0hZ+dSb65oo0/0XzPAtKVFAgl
	 r7HR+/G8FlDKfS/C8o8wwUPCykVEed4e6WXjVxaGp6N8wZNI5D8Lj4rSYJLWljjvBG
	 Pmuk/rIMFjR5A==
Date: Mon, 23 Nov 2026 13:42:08 +0000
To: netdev-bot+sashiko@kernel.org
From: Ryan Prinz <rc4d5a@protonmail.com>
Cc: Alexander Aring <alex.aring@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Ryan Prinz <rc4d5a@protonmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>
Subject: Re: [PATCH net v2] ieee802154: 6lowpan: validate fragment offset against datagram size
Message-ID: <20261123134144.1637522-1-rc4d5a@protonmail.com>
In-Reply-To: <179484385868.3136.2031122352295651681@kernel.org>
References: <20261112153034.1015181-1-rc4d5a@protonmail.com> <179484385868.3136.2031122352295651681@kernel.org>
Feedback-ID: 190731814:user:proton
X-Pm-Message-ID: a2e358e272c572a2df39823e2b2e87b4a279f6f9
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

Thanks again, these are correct, and I've made the adjustments.

- [High] Zero-length fragments: agreed, the new check doesn't reject
  skb->len =3D=3D 0. lowpan_get_cb() only checks !skb->len on the FRAG1
  branch, and that check runs before lowpan_rx_h_ipv6() pulls the
  dispatch byte, so a FRAG1 whose only payload is that byte, or a
  FRAGN carrying nothing but its header, both reach
  lowpan_frag_queue() empty. Adding !skb->len to the bounds check, and
  dropping the "a zero-length final fragment is accepted" wording from
  the commit message. It shouldn't be accepted, and won't be.

- [Medium] Commit message mechanism: agreed, and it follows from your
  next point. Reworded the impact description to stop asserting one
  specific mechanism (the overlap-eviction splice), since that isn't
  reliable given the issue below. The new wording just states what the
  fix itself guarantees: no out-of-range or empty fragment is accepted
  into the queue.

- [High, pre-existing] end =3D d_size passed to inet_frag_queue_insert()
  instead of the fragment's own offset + skb->len: confirmed by
  tracing both of your examples against the actual insert logic. This
  predates this patch and isn't something this bounds-check patch
  should carry. I'm tracking it as a separate issue to address on its
  own rather than folding it in here.

v4 incoming with the zero-length check added and the commit message
reworded to not overstate the mechanism.

pw-bot: cr

