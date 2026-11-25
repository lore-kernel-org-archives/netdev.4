Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631908;
	b=gbup4xcyik3m4fLeEivKFE4aXU2XqCaO0AvAjMrMFy141zLvluFbcJV6muCdWBQc54zq
	 u6G0yImhQgg6HrfwXUhQDvgh3JK23etgAzARAO84VsVF3AniFLBqtq/RdE+XxMRdEZh2I
	 NGG9RpAb9Of3NIwhVAPGQ0eoZ++E01osSs3h6awvKwwW5EQGzHxRssbXNLMSiZ7Ox6bZf
	 PO3B4dlzUQYUyVwagwm2Y3dfZdP/n6c6nzWHjx9iZq7AUJY840MZT+tjl3wNq2jA3eFCm
	 HZUrcL1wgvvrCSvXYy2/BpUmhrlIkF+zCho7CsfjLY9qMOc5dukUgWD9h8RtT1g2/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dBCSvcmfBmB1oIuQxhTytq9IXNPEi+k6CCgRlaA+Io0=;
	b=4p7DYAS2EQUgcIOYfpz5X1AtEFKZ9Tt0nRUhWQsBuNpGnQJBib8336Lyr9fmQ/wPlWKf
	 BM1y5Np4Um7/hVE09AWHuOmUaoiXJ8SagWXkZBWngDb8Z2/ZfEqaTo/TrQADSCIve1bmt
	 oHJ8D7/FEs+xSyLANxC35pdKUJBi3ArNQUXhakRPEiLsV8meYToxO58LhNYnlAX0CKwqV
	 cIqqMnemEKQLYexAgAJb5M+jYy4PIDi69UZb0Ez1rtJ41gGZrtRP7fSGPkHwK3citx7h+
	 FohbIq6JAPWmGirUV2GdwmnW/JiguGxCcGuoH7SKE7RuJu+aZDtXHZFRHW8N4/ITq4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Cm/o0kjs";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3739C606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3739C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cm/o0kjs
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so3376925a91.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795631907; x=1796236707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBCSvcmfBmB1oIuQxhTytq9IXNPEi+k6CCgRlaA+Io0=;
        b=Cm/o0kjsbOlkWl0GVYmurYBa2sLJiGIKY8FUqspfghZIsTXg38r7wM60vmM1E7oEXi
         w53ZMwn0zZFBXV9OUYuuSujUrQmJD65h1gyYHy1Wz3d2s6sxEH9MQL/yqp8NcVJw5kLD
         9EODW74SM2Xrp2HhUYOQUAJ3lMqovYmasRbLG2m+uMxH4puhoyQMSlWmGbGYHfNSVXdQ
         kA6m9C3DZwW4h8LB3+zATKO0aqrrXN//oxHCqTWA6XDy+HQNkK8qen4dSP9oNgCu2ocP
         uJQeS5jooFt/74BekxTxxkpnTzqxpeHMIyLJaU2gS23qExhRE6oVBlJX79KxZx01U2mo
         YFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631907; x=1796236707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dBCSvcmfBmB1oIuQxhTytq9IXNPEi+k6CCgRlaA+Io0=;
        b=zpE7VqfDBasL9bOG4hUFEOfc+nAWdQTHk0Uh0QmPC1TY/Ouo5QzAX05TvHTV3xmrjt
         KwrqTVLCc3mlt549n5iVbbDmVh7a0J5AR5MzfuiuuhpqF8OAQ95OdglczidEhqkhPojU
         BdQRDRzR4TXvyjQavZOtJV188ME4LcjLy3FH/Xk89zoAwFYyz6yPw24lAp4VYd7sJX9m
         QVCISWvl6EbB4+6eQa910HubqnnalKgnXTyXfoOqvqBJU0mQzMlumhfMzlhzCQUVnEr+
         XV85u0VZCSgQ9XnaaZJfjcoyKqBPFcC4lQLY5uI9hWafdPWlUyOk5xUa0eLWPblRCI3h
         lRsQ==
X-Forwarded-Encrypted: i=1; AL+hErHczUUBbxFkC1Fg6oxJEWB4yAILd/bGovvN+qbMuBFOfADRBEP0PIoo5zoiSTaz7sZOy2PJ16Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mj8jHYLExrymsLMXaQQNYxm6NNkrCsspXn0EfVPAHviewGCqr
	puwTQtduS/0TxFRLm968HphzUC6Vz2Nsew3qVesbvhZZrlf2CCDYvBqp7cokyQPXcTM=
X-Gm-Gg: AZFdTZdoXE69UePW8c0DXx4UveXQpvdh0VdzrKsode6gvGrAldMOkzsjH1FFOTTb/Oj
	5qAuwsR+AvlIsHDOA+93BeVPi/qirmr1ER/mjFJOMX4VxvIeOKwdNb8eANHi+R8M/eWhtaqZ+jk
	Ic4vU+TcRXCdiHX4gC78gAse4WJeMwx0mtmQPDLWyfHXUr2dY7PTY+XzgS6/veH7yBgd2t4dMS9
	b8yPDjHevRUBbGvdUIPgTlQzPa4OtLrRaVt44Q6PnqmIGjvYfsxnLYdXODAoH4nikeHI2BVSoXB
	Y+jApMia1zJm4l+9gN63BQRE1e4aJs+4J8SucjtKBIG6ijyS7BCeIpEbCvu6tAQkkmYJ29vCMsU
	iw51OtsY2QdfibuEIhSC4Tf49rLXSBJfu5/kyCU+F8/BzpcHVzH4e5pA0DDY5JY6Ecvouz54IKU
	dxOHT57Ahg+WgVRGQp0dfy0XeuZArzHJeVMSI0TETARYUMKvT9BS5aKXBiW4nh+LWEp42nqZNPB
	1H9pYbTXY0pSRnNkOxDkaotCpDHm7V2TP7ZvKG2DCoVvrQ97yMVC3CnMuHEDZR6fXKX3XFEWgQi
	7X861wS+ws9Nro7eyeqB2Z8Z0gOEdaCPy3M5rtiEw8c=
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr17638526a91.65.1795631907511;
        Wed, 25 Nov 2026 10:38:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm28698967a91.15.2026.11.25.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:38:26 -0800 (PST)
Date: Wed, 25 Nov 2026 10:38:26 -0800
From: Joe Damato <joe@dama.to>
To: Alejandro Colomar <alx@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] net: Add missing const
Message-ID: <awcrIkjb2jvl3gY/@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Alejandro Colomar <alx@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
References: <c9d923eca5851e04589758da9043a3d507cc9bd4.1795630753.git.alx@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d923eca5851e04589758da9043a3d507cc9bd4.1795630753.git.alx@kernel.org>

On Wed, Nov 25, 2026 at 07:19:51PM +0100, Alejandro Colomar wrote:
> These pointers are derived from other const pointers.
> 
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
> 
> Hi,
> 
> This was found when changing some <linux/string.h> APIs to preserve the
> const qualifier in the return type.
> 
> 
> Have a lovely night!
> Alex
> 
>  net/smc/smc_pnet.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

patch seems right but i think the subject line and commit message could be
improved tbh

Reviewed-by: Joe Damato <joe@dama.to>
