Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436959;
	b=N9tEY0Ex/dkWg42NnM0G6eyTWujFwLUqDdIHD0ujdA5woyXIrj0Im/FkAJ+r0Jod5nnD
	 M8ATg8lGMpszHMJRsEwY/jvapIePAtGXYL++os4s9dqTAWHVWtKVvZwH1hjg8nDNKTEQd
	 InnO7Expt4aldE0+8ZJKDZAL4uedf+JMEdGMeiLAv3mErv/V3WevHMV9BNOs5LxRi/A+l
	 Hb9ya2ji/rkQA8e7HI92kNnYIypvQb1SNl7RNiHsjP2mxSCVErGXP5GjfsFEHvzINu9Ce
	 bxnbTcVFBLEyMY/aqZ1x7CggbIEZgBkQEy+JQnUEd0pxscR+K2QPDp0dkkDcEWdL7vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436959;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=ONwxD/hpziRyhX75mEN3Xo6joPmDg9mfrq7iZeUaYUc=;
	b=KyK4YuEbq08zVhbKOGM+/+pZjLCRm1mam4f67nmWsfh7L2Fa4UGAKZcEADxR6cE0JMo6
	 9RsPF4Dnws0jpePSmFwe6LSMygQjR2xOk6/NLDVWzvVCWFLN0ar5xavPaw3vwdV6iX98R
	 UkdlHOxklYL5XW0cf3/si0MnNR3MaOxhlI/oX8thMaPPqGWSUSzbRX1nESQwxQvgy9Y96
	 V0s42uEw2eVfDJcqbr66HoRKrFeX9WBDh0NZC49kPIEB5TP0OtVTUhHhdJsUGeOrVOSCy
	 MTdrHDmRNXb6ocgNVc/gIq4vH9xB3D7MvUm9hdodPTRR8nJPGtK+J6DBZFiGCzgVVWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=I34yiEFR;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KbVy9w6V;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0C606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC0C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=I34yiEFR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KbVy9w6V
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 740B51D005BA
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:29:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 23 Nov 2026 07:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795436957;
	 x=1795523357; bh=ONwxD/hpziRyhX75mEN3Xo6joPmDg9mfrq7iZeUaYUc=; b=
	I34yiEFR4KN8BY4JcsT1C8H9KNx9yZhGrAtZ5+Nbxx8nmoI+/0g4TzNaJfFq2T0F
	N12iAdQuhko8fX8IYG5ewEtIW6MXxhH+jdivbFI94VZgSeea/KaZsV7xfV6/s+m0
	YFe5uNGCOE6Q/R4d4nNDYjPnDD18tHWGCDNkVQ8eAWndStJmvgyPKxkfA29Pm9TY
	qrsDWigX+G0LkmnbAdh91dapUSgpokIAnGzECtQTOtWCwg3hKweRpcBFMSGP8mau
	vO0ZNZ0esKPwo0euYHgtjas3gYx7CP2LLFcNSEyeHr2i5vlA+pNdH2/Tr5qDy18s
	iPu2r2Bt6NZamYuzXBwxSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795436957; x=
	1795523357; bh=ONwxD/hpziRyhX75mEN3Xo6joPmDg9mfrq7iZeUaYUc=; b=K
	bVy9w6VRYSCua0MTznnnKiY0UUU1YmJK+N8GNS6JsKcwhe8RbCSYsjAPo4SZnspj
	MzKHUvFZXjlJ7WGUIgvRbJlO4GUuENIye9Qvr60w2x7GRJIcWE+le8XPwQ6nuO0Y
	4zxLhRihjKiWVWTEMpV3k9KtQfe7T/nnjXSABZ/udIALlGb9rLEnyb9wEavAZGgI
	/vufKKScZubP6lFanSjv0SGa8FNmDz8KJEaHw4KKo/uyDoKIqithmEYJYZtx1Eml
	bcWxy9phGh0yO0wEqrf7a+9nAdQTTXU+FJOFDRoj9FcASGp9nt710O/0OMotzeLL
	WQIIgNKdpWeAiLE8ZwBSg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795436957; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:qm5F1Z/4pA6fp+yUYlJQA+CxVB8Bq3uaO/4TaEaKPL7pXD5
	YlG66TBPgslSHl/wGfH5nvsx+J6uqOC4r4xtk1r2fYNrGP5Efu1aqY1Zfkmoz/EO
	xKADEWMoqZpxO965uXpZuy1G1Fd2xYShojpRiHZsbkCDW7O4Om/cPvh1Q35+J2Nv
	zKvCCeYswRqL9YzvLFno6g+xLvLDbv1f10j08b5Lgpdg0HQIkaXh6kzgtLYtduBf
	Ocmure3vFdVs6J7P0n4OTRrb0zZEMF8qMBAIbrkCJIZYLN9LxqJlOZTApzCTWQml
	/c/5tpfzvx9D/1uaiK8WcQ7GBA+WgpJmRDSp1eg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lZTecQA440xg33w/6Mjz5wIW+4Uu+CJWtMV8HVcXUfI=:0n+HdhqAqfukQ3LilLL3eel6AuBRrQti2Yw+9VIz2+Q=;
X-ME-Sender: <xms:nDEEa2FJRfCCBdU0SaDiQ7bc2_QBHQzB4kf8sc2nS0il4u5rjzA6Lg>
    <xme:nDEEa55EjYP6GpPugOW03ai4bG6soH5RlSLD7IZoWgOgKm5dt8V294Gya22NSuKEw
    zwFc2xT7OUK57YX_Cq7q6K7TTYPDUW2qHfOFIrWXmP8p8LBz6QuP2dW0A>
X-ME-Received: <xmr:nDEEazwAkruzMA6R6_iWFliyWd2NFVG8FzjdzFjliAWrMpn6oZ0ficLSo9EL1LQd_lbb9Lik2K8yYbVmjQmf7NYj>
X-ME-Proxy-Cause: dmFkZTEMAnGsVeePsslCMqmMEXZp+ZMdT0ZybgSkl3h4Y19HKRLluILYHMMuLPtHjmdz/0
    6ZwY4Q8f44z63cjmjUc9TixZ4kfbYEo9NZu3eUg9t979MvMqsuz/YagISTF+6+1ASmcVDk
    PbB4MqTURWTXnz6L52HP3Lq5UiC8I5fW2Ll7A5COpuC8LID8Rs/VOvUfkLGTpnGMWAaZBG
    DmqoFDykizp5te3eVkKvwtw53rqwfxQgdqUyz34RC56YbSWlfUQUsZPt1egTyGhPmZLMCW
    M1vKmEP8oEE0LqJODG2nGjdyhLr7cot7XJIH2zt4+6S38mhYrKI+voG7CswNmHVbnHzIs+
    BsU5oLTn8Whsa4XfmNk31wkDRPS3aH0HKNK6AkqA9A4O8F5C1Xou+/M5iz3h55v4hlfVXc
    SuvyGx6i5h/TON1vRc9XR+XsQvJhvzF9bzxMObE0WPu5Y4SIBzfkzGCbk7FxKTrKswNEP6
    sMboRB0RE1s5D90JHDxWfWBXs7ESyIz5fF+ncqte0JgdQqHFwkNAiOA8/6YltXMoN9gDzI
    N3KtmjfvNn8cJrtlHPeD4Ene8NTZOaBBRl3D2SP54EMTjNkTbhgH4T611P80k3g1hh2eEv
    v53rPezLN2j6R4FBDYT86HitAjdCaeSrJmFQE919CXr7LckEPt70dxCN2IJA
X-ME-Proxy: <xmx:nDEEawO3PFZKAtvVSvQPzOe88SmdzIjtKdFnLw4TmNbFscmu8yFFPw>
    <xmx:nDEEaxnOihbDJQE6ILPfXF6yj7j6txPBp8UCtoxgammHxk0uRteS1Q>
    <xmx:nDEEa9Ts8Qz8G3UKrfSdEZwhRdqx1063jea-kFDNOaX0O0PyCt4LwA>
    <xmx:nDEEa4VKP9JPzG9ISZZR_8es9JeFk61qQBjsj5PJwzAQn7dtTvw6Mg>
    <xmx:nTEEawLqn7q9I_RnqlFa1LKn2SluoSUg1wuDtDeEalP4VqukoVQpi6wC>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 07:29:14 -0500 (EST)
Date: Mon, 23 Nov 2026 21:29:09 +0900 (JST)
Message-Id: <20261123.212909.2235963510215664841.tomo@flapping.org>
To: johan@kernel.org
Cc: fujita.tomonori@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, hfdevel@gmx.net
Subject: Re: [PATCH net-next v3] net: tn40xx: avoid early firmware node
 release
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261118163602.1141227-1-johan@kernel.org>
References: <20261118163602.1141227-1-johan@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 17:36:02 +0100
Johan Hovold <johan@kernel.org> wrote:

> The mdiobus allocated by tn40_mdiobus_init() has no primary firmware
> node so its firmware node pointer points to the secondary software node
> added by device_add_software_node() and whose reference is released by
> device_remove_software_node().

[...]

> Avoid ever releasing the MDIO software node before it is deregistered
> and fix the asymmetry and layering violation by making the software node
> a primary node which is released when freeing the mdiobus.
> 
> Cc: Hans-Frieder Vogt <hfdevel@gmx.net>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
