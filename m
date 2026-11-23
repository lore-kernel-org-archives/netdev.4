Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432836;
	b=vnJ1FTmFxWrwss/iWbVEcg7Ak84S3Qk+5eQNPUFlMCGEfkxFZXPBrtNVa77U0zSxv0IL
	 uzLSNkbfGCMVbSd1oYSiWewEGO4qru92kBKCcrgTkwFS7lwqbK3NnW+utk74Vpj2DYJpD
	 yJshdCuwnSq1dkQvl9+8JSJQA5HtkqB/SuuR9KADKyrk7zKdRwfx5O0cpunobTZo4DORI
	 0uzEI8XdGdboA+73ROsTisXWcoMnKnwI7V3QT76eEa723BHi+G1eOkVqy/B3UCShpsEpN
	 UxMBWaNcpwQsrh26IA0vBVo0NWLlwu4t5Lhxo/38lxfWFNjXHarJEQIZZoMxMC5iNyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432836;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=myR6PcZJGPmoZehHTgfNLTaXUI6Jy0x0EK+RRCP7Bnk=;
	b=FkO1AJYtyqM4ZGUgEImtEpeAjRhDQo3DGvp0g+JFTmssHhYWKx+93aAmlTKhxQgz8BeG
	 Z1uamKolLIfVxa/Wzp4drrxg4oF5cFBacPJHYW4yPxNJpAmfMIe2s8WCMpAYU+eMK28Xs
	 IGKXxY38OHlZ9mYCas7+K1w5WtS1ydbqzN5jBkVT2Eg1aFa7bBJdSBX10SF7l9NwxELu1
	 RI3Y11Kgt9mSvZRq+HIn9jauMPOAhO0/CwdMCcS4gWFAaUTNHImNxqasHq4PDbQALGKks
	 zB0sTydF8sUenom54a5CEPgO8XIMJbbb8OPEIX4cehjvT7VxxcI13qFAIaeSiVXyhrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=SLn6qVkU;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E7606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D7E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=SLn6qVkU
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 44D11201AA;
	Mon, 23 Nov 2026 12:20:27 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1l3Tc0-JUl0t; Mon, 23 Nov 2026 12:20:26 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id C04CF200AC;
	Mon, 23 Nov 2026 12:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com C04CF200AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795432826;
	bh=myR6PcZJGPmoZehHTgfNLTaXUI6Jy0x0EK+RRCP7Bnk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=SLn6qVkU/9dsrmnSicwJUoLhXJV5AQNJVni6XEUSvr1W5I1K2psjgzCdhwi66O/cD
	 MhtuYUJSslG+OUn5WcjEUEajU9EwuBh7lHcGlJyhdzBh3i/xe8Okd6/zLbhrTiZ/rp
	 YR/8dqjnXZKAKTfQNYO4ZSHgEIwlVS3KEw30EgO2vUXoFYx1nzyHieJ/ZXkfRSIyUK
	 KmY/97Z+dUQXE0CzgI3ArtUZYONLs7THG31ddresxHn3T+vpz+qr5NwtFt1vCyp3nk
	 ZPmpTypZAUk1oCikIVda592J9i/f8ckbHs9wqSm8HGTIb0H7Y4L1owLd7KRBDzDbrb
	 VCkbzN6NGvaMw==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 23 Nov
 2026 12:20:25 +0100
Received: (nullmailer pid 2088626 invoked by uid 1000);
	Mon, 23 Nov 2026 11:20:25 -0000
Date: Mon, 23 Nov 2026 12:20:25 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, <netdev@vger.kernel.org>
Subject: Re: [PATCH net] xfrm: espintcp: read the socket error queue for
 MSG_ERRQUEUE
Message-ID: <awQhec8RGS9nkoW1@gauss4>
References: <179449975985.164761.7508657205685376308.c279-espintcp@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179449975985.164761.7508657205685376308.c279-espintcp@gmail.com>
X-ClientProxiedBy: EXCH-03.secunet.de (10.32.0.183) To EXCH-01.secunet.de
 (10.32.0.171)

On Fri, Nov 13, 2026 at 01:09:19AM +0900, Baek Kyu, Kim wrote:
> An ESP-in-TCP socket can have a TX timestamp queued and report POLLERR,
> but recvmsg(MSG_ERRQUEUE) returns EAGAIN because espintcp_recvmsg()
> reads the IKE queue instead. If an IKE message is pending, the same call
> consumes that message as though it were an error-queue result.
> 
> Handle MSG_ERRQUEUE through inet_recv_error() before reading the IKE
> queue. This exposes queued error metadata and leaves IKE messages for
> normal receive calls.
> 
> Fixes: e27cca96cd68 ("xfrm: add espintcp (RFC 8229)")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied to the ipsec tree, thanks a lot!
