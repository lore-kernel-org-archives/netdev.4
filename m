Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548181;
	b=cCcjIWUVYnLu5e6UXxg8ehOPVP1bkRlLudXsUlfQlJlr39VkynkS8fZ5sV82kD/2viU5
	 ocNgCzk52sAuD91Y8EMyRDDbIrlZdpj9bQX+AasrG8iO8lje9oy6nfZMfVS2s1Vnoixp4
	 doZyQrhxT8Mq2LTRc7vJ+ymHyQk69t7sursVOSGG/YkYybRMmiuvTFg6tHPj342c0Dhcg
	 R55VYSzQTcNyrCmpUa97y3jXPpChLjOr6NNoILU/Ks8gExR66fpuWeUopFspJgSahc0CE
	 gihoICjy8oahMWQ9GYgNP1TX7l2jkYjTl1AopXYi0nXHM5ZZHnK/W1WP/o9FZbfiGkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548181;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=tHXXyt04T2yfsNs+Yo7yfzANNXEyKaT9KymSoL6AxRk=;
	b=Xy6Zc7gozC5vxnackLUky9mNxt3uXiHQGBhWsP/m7jNFV8ZjPj3Nx51W+BacxwWGIV8V
	 KPCBAl7Qg33vIR74AOK7Q67RJfsyNPV+u2dpZJeDWm200Ec4Vcv+WgyxRqobFswbdeEdg
	 HrWqtQvFVs3QPKbKPlKWRXDVkaAW1xReZuRyFxEMVaEqmzbyf4e7zRD0VP64zjcM2OYd6
	 wvnVJy3nW8MBmjDyrEW0ZlpLRPFyHuwcDvNmgZvVbd0i0vL7i2DtdqLZNuoZfLDeXKPQu
	 ZExMYb6OKLCtH8Z6uvy+Z5gbBAaE+/U9q4jjuanXozqalb118IdUflM51or1GDPsNYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b="uIKSh/yZ";
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA9606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=uIKSh/yZ
Received: by dvalin.narfation.org (Postfix) id D387220361;
	Tue, 24 Nov 2026 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795548178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tHXXyt04T2yfsNs+Yo7yfzANNXEyKaT9KymSoL6AxRk=;
	b=uIKSh/yZPFZAaaFhcKiJV92+pcwa6GoS5zeUQRjbrHRPKybmfpCBd9iC+8OJcjotGlp9Ae
	JkyUthxtfXOiiZr1w5XuTxOqIaFyRECWNF226R7fzLAT+L0BxDDFLSYCCCco1jP+rn5AQw
	2swjhXs9fIvH6RzUTLt/7fXqVKTMTzs=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 06/15] batman-adv: tt: refresh local entry in single
 flags_lock section
Date: Tue, 24 Nov 2026 20:22:55 +0100
Message-ID: <2434983.ElGaqSPkdT@sven-desktop>
In-Reply-To: <179554084001.3135.10319614345027013330@kernel.org>
References:
 <20261123171827.3294525-7-sw@simonwunderlich.de>
 <179554084001.3135.10319614345027013330@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5120805.GXAFRqVoOG";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5120805.GXAFRqVoOG
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 20:22:55 +0100
Message-ID: <2434983.ElGaqSPkdT@sven-desktop>
In-Reply-To: <179554084001.3135.10319614345027013330@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:40 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > This is a preparation for the validation of the entry under the hash bucket
> > list_lock, which then only needs to cover a single region.
> >
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-7602d89e-b2cd-43ca-8aca-c165e5d674b2
> 
> [Severity: Low]
> The Reported-by: and Closes: tags suggest this is a bug fix. The message
> calls it a preparation patch, though, and there is no Fixes: tag. Could the
> message describe the race being fixed and what users see as a result?

No, it gives here attribution to Sashiko and helps me to figure out what I've 
handled and what not.

[...]
> Could the commit message state this consequence and add a Fixes: tag? The
> flag-update helpers being replaced seem to come from ec6edeb755ece6 and
> d72e16b1c5d527.

No, Fixes: or Cc: stable@ are not allowed for net-next

> Is this patch enough on its own to resolve the Closes: report? Or is the
> later "batman-adv: tt: don't queue local events for unhashed entries" patch
> also needed? Saying so in the message would help with backporting.

No stable maintainer involved here.

Regards,
	Sven
--nextPart5120805.GXAFRqVoOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawXkDwAKCRBND3cr0xT1
y0uUAP0Rdi7tAu+VT+zG7F+NoB2volUP9j27Wim2kHF/O7nLwgEAmkhkOadm3/Bb
rkXNKNVX9NElq+jd/yeZ95fU+qHX6wE=
=c6YG
-----END PGP SIGNATURE-----

--nextPart5120805.GXAFRqVoOG--



