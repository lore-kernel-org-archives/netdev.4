Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369844;
	b=0ctbjhkIZYOmQ8Zg13X0VW1vr2fCnWE1BopmqFdPImJvcjKZAt7zxQdjpHZt8S3yYt3Q
	 yuZaYwGgEucJCUutYFyAfo2kx+QKT+JvB+BbSCZ3Hf3qw4F09Jua3Vnh8GeTDAPfY0/pg
	 5oxbRTplDLXzzyhy/F2eEsJtntJiJjQKPumQtpagXRVd38vcEnXTg59JpV6DdkfjZin6N
	 9LSNHrTLfC0zlmVska1EjExTGxK8zVPBmjw4zkLapj1uVWNlSfEu2Gdlhb1wLLQcz2v98
	 qcSYiXfJjm1RU5R79KgKcWL6HnOmCResBcX649sjCRc4MZk7M788mKb96q1Ch8s0A0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369844;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=SdRPIzHkjiRz1BFbW3Bt9qNKIZH6ztRxr0VcQb5O5co=;
	b=oi/4FnUH8dG1RgvMB1ZlZUw3XW04doCbAJEAEbnn8f66UAvr8mZ0vQQZhdkf0KTyrdv7
	 1EzgQJTMa+0Q/LKbwPSYVBwiWo2lNaOU82xnWAP6LToi4kZSN6nbrqkulqNX9tg8w3o2v
	 7hOuBT+m5oEO8wpqhRQn9Ooz0JM9EMiwbO2aIaFwlYRLf67MiOPPQXuJyb5MGZwKpHUxt
	 Q3wNqan/t61kPH04zvUqr+JcOfbDcNRC+rcUAGbbNy33dor8roeNYpC7AIkyxWwarZw2d
	 OY58g88/BcuHH6ENMIR1ekuhfoJfqJE/gs3OXPi9UjyMsp5+j/MJoCT9gFbqSt9EYgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ynjRX8MI;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600DC606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ynjRX8MI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DC31BC6223F
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:50:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21B0160512
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED0C111E61C67
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795369840; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SdRPIzHkjiRz1BFbW3Bt9qNKIZH6ztRxr0VcQb5O5co=;
	b=ynjRX8MIbIi0UB4MWe2hLo30DGrn52LA6YucZxk9ATxRLW2byqfkheo7Ld2EtwYxHo2gLD
	WHqn28hZNBVlleaJ/2+m5Wi7TEQPyn0KEFZIbw8foWhSQepFtpfccnt2FDdGxMFR7ckBnn
	NgRV8r8qpMDBJcmzRSxdKeUdpJwp7FCsd+gqn3PFF6GDHcM4IMVo38bQE/gBxcuUHvueH1
	mTdx1hwJo8oZzW8vF5lp+F7o1CEODcuDh7tyLG5/vg8GHO3X056WxV64Bp6bo9y7gBLEwu
	h/y9OcQnlMystuH4SaMJ7UJuv9fM6fBzUHVJMnHTqePPicykIRP9QCwcPquAsA==
Message-ID: <d2b855a2-ee88-4670-877a-49226e6f9ae4@bootlin.com>
Date: Sun, 22 Nov 2026 18:50:38 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
To: netdev@vger.kernel.org
References: <20261117175528.3018609-1-coiaprant@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261117175528.3018609-1-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Coia,

On 11/17/26 18:55, Coia Prant wrote:
> The DECLARE_PHY_INTERFACE_MASK_ZERO() macro currently defined in the
> txgbe driver incorrectly uses PHY_INTERFACE_MODE_MAX as the array
> length instead of BITS_TO_LONGS(). This allocates significantly more
> space on the stack than necessary.
> 
> Since hiding the zero-initialization inside a macro is discouraged,
> drop the local macro entirely and use the standard
> DECLARE_PHY_INTERFACE_MASK() with explicit zero-initialization at the
> declaration site instead.
> 
> Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> Cc: Jiawen Wu <jiawenwu@trustnetic.com>

I'm OK with the patch itself, but that should go to net-next.

Please resent there, feel free to add

  Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

