Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999341;
	b=P1Amw/A6rhyaMTizm2woZn+UbA3F0Up71abLjoWew1DtibUiTsNF8UQrYX9h7ez6f8D+
	 Qw6CMChfqeIKwhq67GwAqFh9Pl9T8cwKFAM8KPRqlTfXnEGVC5gT2aBuPZmhxDF96Ezex
	 N35QnTQOLRnNHmmfnpiASApjomKSHMk/ayPLltfEqyXI9O+lbjMXwjQ7DCdOHH+a2B9uh
	 +Xpnue8Gw6eAtViapMNBO1qKd6fVz7DS4gIitiiYBxPCYmaQsq46hY9sVjR+MaYYvgyTR
	 XVOfC+c53oJ4n7jFi93xmCMvPxEwFYmj8U7U6liQ53vVhKGN8ZGoFZLl5/urVjshfgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999341;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=1lLY4Svpew6f/mVZsHja9oHB3hor6O2IX2pS8fz8NY0=;
	b=5n326xrS3e51P7A7YjBkHbNrbrrrOUdXd8FrAUDv1saSVN/AUCzahFxoxdcpBLSHTxzC
	 Ew0K3uFqal72RvTxt8hDbDnAZh2EK1TSUOrAMuGu461lVVcsClhsSIcu+m9deaf9X3hlQ
	 pC3nzxcp//7oNBblt9csaOhkXuqmDn7rkyoSAgEew4JSyu9apyGjipVrIufqYBSpf0BlX
	 6e4NKXrA1/XZJ4h7fwD7po1YFbVPOmUHZDStT9Bgr0bnA+3elbCjzq1zAY2F6iFKnTk+h
	 N2DmXzMUSjtywKxBo1dYdTZokYNrUV74gIZP7CMd05QNJHUxFGyssWzrfJdbjW1ljzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=QYVcAEdD;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nI5zgd76;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EB606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=QYVcAEdD;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nI5zgd76
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4C6B31400184
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:55:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 18 Nov 2026 05:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794999340;
	 x=1795085740; bh=1lLY4Svpew6f/mVZsHja9oHB3hor6O2IX2pS8fz8NY0=; b=
	QYVcAEdDh71WWpvWQ5y7N8yaJWgBpviG8493XgFaWGYUbR+LD2/GDyzRrsaf8uW0
	M8/E3LtYRjoQ8XwWyT33yZMbqzEdnf5jPYbyyMmzJFI4g6MMnYpU4Os+Ef3HDary
	LNmuTdBKCKfABntkDgn1JXpIu++qYEWWjS9JmEWxhoMyZ8qAc/KNiYj3WAXep7Wu
	ebWtK/l2q/Hm0QuxiWkscSJFJ9m03vHxw4xexxMPpOb07IXaYBBGfErSVvGYChkP
	5WMCqwxaRUrTZS+p5JIMSQWuf9k2+E1XfYd3VKpjqhhkRmahbsasm6TgrN8lmo1b
	PDtM5WgHdtfM9uduNUD9/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794999340; x=
	1795085740; bh=1lLY4Svpew6f/mVZsHja9oHB3hor6O2IX2pS8fz8NY0=; b=n
	I5zgd76vvRfoH823HXG8JnSmnulaMSFfibqMlMltgxki53ic9D3oki0Wg1foGkVY
	GTgWcAd/thh0D7U9GLfdYjfHiN9tOMhijOIFZw/yVBffRotBEq3w2nHBpeeXTeG8
	joEWkaVdNrMCm6YkLqgFaOxPhFzlEq1C9fYbknzIDqwmBBzUO5wdWbysGOxxhRDA
	f4HgdZt+Bgi6PERykETBI0qbaX1ABFx4eoInG/f5z/CtZzkMzKuPiCbhJc2BY8UE
	nC9KQOubFCGabq4CbwBkQcN7Tj0jbvTv7BF/iPftlnuWS0JTm41x7De2pqtrUZ/Y
	QsAO/OviEEGyW1D5cn8GA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794999340; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:o/gPwxWCjRtd5o01EDIFT16Ag17d6K1Kg/7PjwSrkrifNGY
	XcRxiat1EEHsbL0A94JAVLoG18+Sjve1RarsGpbvXrpVNU+dieZqtyeiQ//Mp4Rb
	qpxc22T5OxCi0fCgLrDu0qjazSiGgBo4fMlzl+O2U9eD2u5tRpNDsqJemjfd+jbi
	RyOe3yzmSb0i3pj8ZDPtOE6CDpX5C5CLBpjrdyS+d/UMfjwTj8gCCftRWYFagjv4
	m3Z+s2pCf0MkN790lrSowWlaxvzD54/5IEUz9X65xSxUvZbZ/2dtkakSuGmxx9DR
	+ZVM6FUiyyNZ9iOPN41HwmilBrfvM/rsTTIHqMw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RczB9gYCNYawM4c+ALdeoEtktbQcQrdqI2h8MgadaVE=:f1PoMNvdd7eUFaJn8fwxARhdLdJQXzSex3MPgOihlew=;
X-ME-Sender: <xms:K4T9ana4Kb6OOxq_yIdEUDW4VY9bhWzDve4YCUlENbkkJNivJjFLag>
    <xme:K4T9ao9u-Qa4YjH57cgOZWyCj9WR9MT2yaeDgsUWJka-pIs2CEQlwjAHRnzdIwMGI
    JjTY4Ms921Q8p8_SjqZfXnZsvuBnnMr4MZNfn9s_4zqhEekunibIrs>
X-ME-Received: <xmr:K4T9atlheoZ7Bqm0_xhNvDZ6HxGiUVS-287puoKPKbRFnfQHjPsSOcqFIKOC3h8Q-EXKH3nYuYBMWwvF4P1drovh>
X-ME-Proxy-Cause: dmFkZTFz3NK5l0tQkms838dQWqZ48zIIRQPH/+NNhoj6IrdSS4eqY9U7OtQqC6pwNDpsPZ
    P6ax6om8Qj87GF79pPYyChWRvf8t/TSAjxCmiaBrrRTfWaBmMbs5FOSZmqHfJ5KB3WLwL/
    yTK/CgTgx8wxr+8G2x5xHt07M6n+6CR3VcvyXSFqr/JDMQtbhbjUQFSln+afU/0WOjmMcO
    t0S00Kx/jjw5fLBTLVOwCI8XZlFvTgYMI3NhQq6fbRZsfBKqYMXhYrY9FlCfoz2S4gX/pC
    0uLA3C76Vn+3D1p6F4XZKoTksZedtTOVjpAmGlGPCIKuH4Fp+sY50EI9hYKIeA2US+TXgo
    SwFDgX1vRo+ddLegJ4qibX8tZRRcrgo6k0sG3rgJ0Trn7D+e4S/DoYKgxfPr9Z5LumXpG3
    6k4BlyrHlAtYfo1x6He20rwupPZRdbTFe74BYnHLRt3v/QPnJtw8GzEHYXO1yYTevqSQhL
    AwT1hlMcGricQxqlXS1f6n6rQ/OkKSK10Dkgjer6Kwdu2ixBKOrIA/0BtZQzQ4JaofW0NA
    lAuW82UQbqTsLc4ewKGwulfkmafskgmU4JsL+vTS+55EJjn9VtqhiMSe9pRXm7jWuHGTBU
    a8c/Hq9gzMBqdEl80D73FlIUdmBFxjp0XEIgKl/N8Lk2zyPv7wGG1IApBrmg
X-ME-Proxy: <xmx:K4T9atxUnaW1n6WoBEG-CinAYsztTpXkxlB8iFUTGxyEgg6UhhfRpQ>
    <xmx:K4T9an75imKmQm7zVW5IYOyNSWEjbitvhK71asRq8HNEkGfc1RnNyA>
    <xmx:K4T9atUkHSdddei9ZKRH6NlicWXgy4mLb4RyFn6LI2_Gc9pd4LTaGw>
    <xmx:K4T9avII40nbN2ofWbreAu8_K-2BdKn1VlFnfnRgCmYBV6iB-lVSYQ>
    <xmx:LIT9avtLWo_h_LT-GNWyDhK5NDY8pNE7l-QnEw0tOzn057th1liXSAuO>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 05:55:37 -0500 (EST)
Date: Wed, 18 Nov 2026 19:55:34 +0900 (JST)
Message-Id: <20261118.195534.1289241641818592530.tomo@flapping.org>
To: johan@kernel.org
Cc: fujita.tomonori@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, hfdevel@gmx.net
Subject: Re: [PATCH net-next v2 1/2] net: tn40xx: avoid early firmware node
 release
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261116091149.730586-2-johan@kernel.org>
References: <20261116091149.730586-1-johan@kernel.org>
	<20261116091149.730586-2-johan@kernel.org>
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

On Mon, 16 Nov 2026 10:11:48 +0100
Johan Hovold <johan@kernel.org> wrote:

> Note that __mdiobus_register() will essentially only return early
> without taking the reference during development when the bus structure
> has not been properly initialised. And currently, not even that would
> lead to a use-after-free as the child PHY node holds a reference to the
> parent MDIO node, the child is deregistered before the parent, and
> software_node_unregister() returns early if the parent node has already
> been freed.

[...]

> --- a/drivers/net/ethernet/tehuti/tn40_mdio.c
> +++ b/drivers/net/ethernet/tehuti/tn40_mdio.c
> @@ -157,7 +157,12 @@ void tn40_swnodes_cleanup(struct tn40_priv *priv)
>  {
>  	/* cleanup of swnodes is only needed for AQR105-based cards */
>  	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510) {
> -		fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
> +		/*
> +		 * drop any reference taken by __mdiobus_register() before
> +		 * device_remove_software_node() clears the fwnode pointer
> +		 */
> +		if (priv->mdio->state != MDIOBUS_ALLOCATED)
> +			fwnode_handle_put(dev_fwnode(&priv->mdio->dev));

mdio->state is internal to the MDIO core. I don't think drivers should
look at it.

Also, 2/2 removes this code. The put is unbalanced when mdio bus
registration bails out before taking the reference, but it does no
real harm, as you explain in the commit message.

So I think we can drop this patch and fix the problem with 2/2 only.
The explanation in this commit message could go into the 2/2 commit
message.
