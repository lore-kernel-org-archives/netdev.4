Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767179;
	b=jq8y/xxt7VDQWp8D+Fg2epP5+L8JsEk6BhTY8qY5CVfAEpmvseiJqwTdLCgC2HM4c83/
	 l94YxTUsuN5eTZlL4boBryTfCO8za3zzwE5OCNkkR2L9qbAu0QaWV3exupggxMAq7Hqwy
	 CKgvJJh63p/KtIxwqC8/pv7gh/d245UsCPnfPig2ut/wK1o9xJm7gUNL1o3QzO8PiyAnX
	 4pJuliQZHd3WM9MXJkuqEFWsrLkWIlOu+m+IkcX8ZzH5Vo1oUHUFqkqiBpQgSZSCNvfwV
	 dGu4cLmOMJ1mLZ6O68RWhe43EXl9g0HAG/j7GknDuFKHcMfNmdyRA2MQacJKJ6aBx2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767179;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9MFhWi7IbmvhrDxZZVScTf+1m5bSxYIGWr3sJZad2Lk=;
	b=3zD/H+tZjCKlogg3mTIHGPUEm9o9Se4pe5SQu7vG4NISOBj3TLso4ifRb/3uY9cLtVjw
	 /Z5DNzmzYSM2maBnOK3vSyEhON72+qKO6uDuy8jryRdClcMcvCiAbmpGECLvBHmsuErBE
	 uegDc3z/iwKE2FLuIW8XputhUo08qp9wu0QWgAJys0VHHvL5Y9GxnN7KRMWW0dxyGIvNE
	 yj0vp+9MhOnjC45rwYCnEOxAuoiiTeqkxV609duJOuhfO7y2eNbX0w8V79lbP6+k3aE17
	 jGvcTwq2GTXe9wWLrd/9JyggTIKdcz6Wo32tbqKz+HoSASt+oK1CVEZCE0VoLrb6cHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tJ96nRPO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SCW3PHbS;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235B606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4235B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tJ96nRPO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SCW3PHbS
Date: Fri, 27 Nov 2026 09:12:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795767176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9MFhWi7IbmvhrDxZZVScTf+1m5bSxYIGWr3sJZad2Lk=;
	b=tJ96nRPOyotZg60hBswYaDjux4XF2jkUVAzi8gqzo8INL0eNNTDlmuoyB55P+/sgEY0iza
	6AdFQKIWQxGnlC/y0v2aetRi00YSw+u075psC+JYePb4sj6eRPZOHWF7HYQ2B4ZkZFXRiy
	CZ/0FXNEtjAJojmUPfylN1sJvwLO9+KQlGvhV4OVtTt8KsfDe+WPE0bRjV9trc1rAa370D
	vkJx8VtKS3PqshnbkYQpxLsiiui8M/k42QT+ybHnZ99Mvwr4bHPwgH4a0jmJK40fEz2Lgf
	R2YrHTuT+e2XqNloybe5YTMft+MyQn0jAfCL9GbzIOE3JCSZv9YhMeV8P+REVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795767176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9MFhWi7IbmvhrDxZZVScTf+1m5bSxYIGWr3sJZad2Lk=;
	b=SCW3PHbSF89caxdwmfpSz9+7t6HurWsg2r+z/AH4dlsY9ce0Umve9CT7NuM/xRjdROvBeV
	MF1CNag6M3CCoeAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v12 8/8] selftests: hsr: Add test for the inline
 PTP header on HSR
Message-ID: <20261127081254.HlnpJH-F@linutronix.de>
References: <20261125-hsr_ptp-v12-8-9ddd2a73cb90@linutronix.de>
 <179570404248.3135.7481792168822818977@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <179570404248.3135.7481792168822818977@kernel.org>

On 2026-11-26 14:40:42 [+0000], netdev-bot+sashiko@kernel.org wrote:
> Low priority / nit picks for your consideration:
=E2=80=A6
> > +ns1=3D"none"
> > +ns2=3D"none"
> > +ns3=3D"none"
> > +
> > +setup_ns ns1 ns2 ns3
> > +setup_hsr_interfaces 1
> > +run_ptp_hdr_tests
> > +
> > +exit $ret
>=20
> [Severity: Low]
> Do these presets stop setup_ns() from working as intended? In
> tools/testing/selftests/net/lib.sh, setup_ns() only generates a unique
> name such as ns1-XXXXXX when the named variable is empty. If the
> variable already holds a value, it calls cleanup_ns() on that value and
> then runs ip netns add with the same value.
>=20
> ns1, ns2 and ns3 all hold "none" here. The first iteration creates a
> namespace literally named none. The second and third iterations delete
> and recreate that same namespace, and all three variables are left as
> "none".

Urgh. So I was asked to remove the used-but-not-initialized warnings for
ns1,2,3 above which I did. The test passed so I assumed it does the
right thing. Now after reading this, I double checked and see those are
named "none". The device names are different so it does not fail.
Any suggestions?

Sebastian
