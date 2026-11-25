Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624823;
	b=DQz1jNIMXqi4lgEOW5I7+YOzuLU4q8PZjbAegZeaBx5m23RbIdLXgStrPihKwwIPGOka
	 9k+PV6FRoQg/qRo6bxWxgIDMhs6ED2DMuagVqRiX0Dlny1Oeiou+MSKfvR3dZt1IcMIdg
	 vCmMuAlqcfcNQAmSjHH0/I9dvbPiF3PCz7evLmMDvHM6tfFVzS2RKym5uwTLNBDiNuYzz
	 akZ/yAqqzwAcKWENEDowEa1Nh1PWy7QcDvprruHoYiqiCG1b6D63W44sXSqoT8zGK6uG6
	 1etvtipyZJM4J6Mz0AysQJeMYY4fVO4u5r6R3cW9uS/sFKU1XptTg9onIVZth/l2XsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624823;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2NrVmJtOzk0=;
	b=siYvxDD8hKBKLm/TiDMzDyLb3SHSqRrMYhjAh73MpT6MYz1ttny9VwhFQNWviBI/UT34
	 lqI+BQG+a+AnPimkSnam2EaZ374C3o3ZgzjuE6vEJb9oLMtJP6qDXHPyUPCrfaie+6ZSQ
	 nxy69Rqn8UfxiYGwYFoHPLMNcWwLy0biEZQdKdYJ5nIL/h/iyLTKLD42WCSroszAO00jB
	 833eHToskp4sMWWVXjnU/KfOOi3Nlao9lMNDXNbh1elPuU29DosFIZPytVEW1RYUSPtvO
	 VUN9WZ229Q2o6CMSnexj3SzMzEVokI+ktJc8XxOSF5TvRJVA0mEejKp2+we11bqF2Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bLFxljkf;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3yATzR9k;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE3606A331
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCE3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bLFxljkf;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3yATzR9k
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A957C7A05B9
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:40:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 11:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795624820; x=
	1795711220; bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2NrVmJtOzk0=; b=b
	LFxljkf8085SNZFqKfvwrHAtqBoWplskS4EhTwcIOygIXlMpueYzouSuFbldC+sP
	uIsVUp5qryri8PYOAkXTiIofqD+z7hcVXLM6foT03VpU6o216TmvQvhwWEsRMeBk
	vpgbY/BxXgj0NfhvAXm5WGFf6O51stvBstlDJJryy2UvELQeENzebFaGcM7ULfJt
	/j/g7LTh3jnC8y2mshporPnkNlWpwxe7sp/qy7kjq20L4EfPujxKLjye1wAt1Pwn
	x1bXMevQWust2/xNGvbVvzlIx1EuyUm5u53M+ABMrVlgvFViIfMi+uRNEKqgR+IW
	HJ52SX+3wLjv0bLjTM4Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795624820; x=1795711220; bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2Nr
	VmJtOzk0=; b=3yATzR9kKoed0T8n2E4dRzPtrHf/ieP926YExKWer2F3SHLsc6Q
	pt+aTSxrDYiVcXV3AyRMwN9EDVRID12bCcvXcEaQ+TgV9GzrXfNi/PrUiq2gTh6B
	xu2O7qegtF8oyUBb2e+qAwvx11PvSMUuGIqqsxahZoAXssmg4pbOo4pJ/QW/XXF5
	qHBTYoCgwrJ1/5bAFyD43wqMgelFjrj8FNROs+lxsnWDdOfMwtN05VzZjqjLlkGe
	KSxXzvfp6GOJ6RZbwutHio2Y/0Kox5YZZ4oOPJfE4DxX0r9LVQnDJlB8Zlg0f0Nb
	6dY1iGyyZ79tHNfDXrUVc9byIwvUPSbYahw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795624820; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:GdA8XMfIi/5ufVcxY0NnvwXHKKdU4sGYOoI+XKf5tU8gJmh
	qyQb9GdVP9TkxQpk3vwLreQtgS1kny2g/aBBkk+ty5BB30DsO7S/7LVbzlfJJ7kf
	9O4zLYZJtnhuerCGaztk6BeJQpvHl0/rJL2tP1ank+9uLiCQchNQD9rrz95cz63c
	7PH5eOMQ0u4vK6O2UpbxRxEKsP2w8pAgtxBscZ2z/tT2H5xPZZbwRGpE7cAQ4HE2
	Ltsh7SKPcXU3gqbUKtcHJp9nMB0en+q28LSSBJNyyzTs59vG70D1ipIiFWIMkNAO
	79NIW3mZYlYV/6hRxHJyYg3epE1AotV2QWX0QNQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VzbQwFow4I5mRyZL14MErE8FiLGvx6AWvz4eEeOhShY=:YHstVPHYNyvX4vpDklnY2CZmSxeOHydrehDj1hnjaY0=;
X-ME-Sender: <xms:dA8Ha6tSp93tD8jvM5G0qJTMnepTAo6f1pAjC7Yp1JSi512NImkJ_g>
    <xme:dA8Ha98SrhOq8nep0rEnZMXo53cHYdk5A8Y--PwT07Vcq-Fsu_7uCCh94X7OZW41l
    63D1H9MT7cHhu_TEJgTjYBpA0hKpOALC7eP8ZFySlBcZ_IfFZUE7Clh>
X-ME-Received: <xmr:dA8Ha8l-ogOVA0EZTJQ4E8rw3SNPJEh8bwv7KgSkNCHYhN7SKrYyK9-m334>
X-ME-Proxy-Cause: dmFkZTEkqydggF2VGN09a7SrKmgF7tz60VqDezGtPw/dRKooC7tyMsvMNLlCXGAviBqhDU
    93cLkBtcTF/ucCBSar36wkl3kd33JvHYspVdYeyipUmqt/l60Mse+Gn+BTfLSEw9fQzJCl
    yc7P8ea1mUpj5FldO3/aAmMN86Pwjz0uDh17n6Ww+tHCXnDH8anNJewq9AHIh8nXBSQH9Z
    NiV5XIMnehotIcMXVnD9pelppKHC5sYdrWwLE+Ye5A3bbtPEmFnwyOEZWbArkJNG04fNaB
    Db9QfGSYpAbQHWjYavuTzy0ax5RCEaY5cx8EBsnpJaoiUhT9FfKmmDN1TKMN8fKzwr2CLz
    vhm6Ft83kwzkesm1UcSf06EM+1IQaqji53VKv96ManUWeW99JSgoZG06nLHJs4zbru7r42
    cJnAMx9i12DJKeVeEhIZRtnRp1/ASlDe6thOSFfV0mNlTC9sGqOjoc1qE4LFV06Zg6Sd0W
    dXCaUVEsbiLRi8rvAwT9kThBXqIQa2AXWJ079Tk8y6n5EYoH15BZfLde0ga+L+0MXS/Z5T
    r0YRiMhFD+piPTcm2oP9XLqwsH2+ccusawVN2GJRnIP4AlgMUPt4u6Td6tJXfsaD64tBAq
    WpSoO9KOQZXDahQexVB7pwmv3/3A8uZDFTIebqWNt2br4QIAZcWX3KLHeOPg
X-ME-Proxy: <xmx:dA8Ha1PdyooxCku436jFU77-C4URK2gN2pMC6p4x8wYfUdobLXPWUA>
    <xmx:dA8HazIMvC3g0mfBxNeiKTuPQC6it0t6GaMQVIDaQGRtSqtO2YlV4Q>
    <xmx:dA8Ha4GbVkIe3gILDtnjNUZm_KCAwUYw0tK0luxoj_1Bq96MGfWqWw>
    <xmx:dA8Ha8AhLyZTomI_2pyw10xnx1OaeryX9UlK4oGIacs2CMc99ivcVw>
    <xmx:dA8Ha7fZaUimu3PLLh1tMaFCuDqVE2-pgwYmBKtbXcxgVcIOkX9AGJum>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 11:40:20 -0500 (EST)
Date: Wed, 25 Nov 2026 17:40:18 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Felipe Pereira Stival <v0idpwn@gmail.com>
Subject: Re: [PATCH net 2/2] selftests: tls: add a poll test for a queued
 KeyUpdate
Message-ID: <awcPcsS705o0Qacv@krikkit>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>
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
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>

2026-11-18, 17:35:49 -0300, Felipe Pereira Stival via B4 Relay wrote:
> From: Felipe Pereira Stival <v0idpwn@gmail.com>
> 
> Check that poll() reports a read event when a recv() for data has
> decrypted and queued a KeyUpdate. Once the KeyUpdate has been read,
> check that poll() doesn't report a record sent with the new key.
> 
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
> ---
>  tools/testing/selftests/net/tls.c | 40 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
