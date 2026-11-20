Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184326;
	b=qXbimVEwia244AzJmfwV2+q8VMleKNQNdugMGnP6+Bug5cteTOcq/EQICOV+xoGBuRVx
	 AcS89kDdBH0+er7HkbFUYID+qY0F24ifEyBe8NxsYKdOa+BUTxhR4aY5M+VAdTu8M5v2v
	 1sFmXet+axS5uYVpoGlDCNZr3qcEu01BbRTBPlE9nZey0BQJGEv5jNMjZpG5b/gS0mARe
	 +2z0JI6tWfczI13/hv0HA7MhbmsKqRpWAzeIKzFyT+He8fsUAzMz+zAhdL/VJPh81zRwv
	 hbOuU/rG1vty41w1wAAMN7hJzhVrBLRnHyrT+BrPbXVccd6CY3DUgx8I+UCH47Bi5Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
	b=11eaFU99jj4qs0ztGcWkDQqhoER5ruLWAc+h2qkS4a6CM1j5ZhAgB0s2ln8RWWfdKTO1
	 6DrFL7L4UW9tCdaC+w48kH4SlC1UDQqtkeLqDsNpYaKVnkzocDRnIQdu8X+nQCuqV/53A
	 caf43MXSTBT5S2ydbqpSNhVx68jMdsSug5IvBbffL6j49YftNKduKWatMUt2mbvZe6TRX
	 PCDRo9JhZFQ+/lMkOc90Ekx2+udpnJXyamsPa5whrF0nU9kE/DkVpy3NhoSqAMbFItYWj
	 PKfilOZCuyd/lXO8q+yoBZMbDGQzBeMLqTvqZgkhMsMESuyGv9PGSxjKqSwP0HBRuwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2Ub1fv4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A260A2600
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7A260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2Ub1fv4
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso1241772d50.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184325; cv=none;
        d=google.com; s=arc-20260327;
        b=quGCukeWYrKCLci9+te/GlJcgtMcxBBuAHzFCaqgBn5NuPOYqaqKPAgU2FCae2MMb2
         cxi6S2t3PasTPvLqaIV8XFbDm8310CVCEgA3Rsu8+hzVz7l4/wZPuVPY56EL6i/pG1d3
         6Jl+3vV1F2FZwoZyNccVs+e/DL/+0Kj2+SaEpHw1+DF3u0C6SoXRJTKW/j5hyk86S5lq
         vdhtoLZ0gpSBCNKsu0mdksnnTWgXxvHEaO9gykjOTaTRFbrW30qsfQ7eJHaT3QhIk80F
         gg2rDbn9veXE79vkjCBu3mf4nP61WHgID5eqEa5glDgvwPTnJvktqJe6kz3nzJzlqjSH
         H8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
        fh=r9MVfibCozEsVDwUmU4MqYKQE9pBubeCKx1XV1OIqSw=;
        b=UnJVtEHfVvYj09Cpqgml/Qv3gq25f8qESNFSSmalgvK6q7mJaHOrNsEN1ZklqanaNl
         /LlkDuTjVhcELUhxzwDvYe/oGgav3Nt/ieweTRJfLmkxFW4l72nz+3BZ+i7G+O+SE2M5
         CMH77wVnSlYcschYhUm+E/sbSm4Q1wH57g5/yfYju5bN8mwAmgZXCZ7DkVfZ0ZrDQWRH
         HGq83J6JIi7PbJKU2BMcf7oWbb7soBPChYLkSt0eSbj4yjnTcMZqQ2wdJVUFSo9p7kPX
         s/q/D0TiAwswEZFwrX/lnX6ERa1tF37m7QWCPNctS2Y7F9d738m9I/JxEIjY0R7oYl00
         kAFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184325; x=1795789125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
        b=S2Ub1fv4QIMwpCH6y9qCpBAh5iD4X4i6Hsbg/PjVIMAUTA4MFr+DZSYbq2SZE5N1gY
         952r7VvJsvDRJjvJ2iHlyZU40SjZG57KUrkjNWzyrxUV1fNPEIfnd4JREco+sVH7exGW
         ToAIwpfIW5nXUhdFUndHmxdWXSKATRRJ0vLlkaZtub7PrCASbKqD8nSHfbTX4rTEF9tc
         5lXCZtu9oRdFoNWMkZ7LWnqA2RFxF/b46sHofPW+2bZ4a1hOvMLIlXORlQlH0/1Ay+fR
         X+JMzkbkUALsrIacS9/V7KAFL/UNTvL1kV6lRZBgOcfWcxXleZVQYG9CjPSX3wRCJvWQ
         tAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184325; x=1795789125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qm85nREb7P0agHsSS2w3wnffVDPZdu6tF713NyJ40SQ=;
        b=tyuWMfBpJSJ+wJVD6LF/aJjVcIPrGgCWIMV2cvd1VU1X1m45tsKR6qQ43cPgsbKOHx
         KHnNrqmzpsqmGqUK2iZPu7ow998tyV93xsST1FJeBjjeRmVzzhGk+rgoHENlgjC/d+KG
         mtuf0pKSM19OEnfOhjNNHnX4Pedieh2aboreLpYMqZPMjKklWHJ5i30znaMIXxhCGGMs
         T/l36gS3BIe9Q0OTFtOyuykXfLM9+NmwLA8nMTm6rzDZhk6ZM+uUYsIn6bVLkhaqiU9J
         XYVZ4atY5M6XWt6oAwhUSzYvgWaazRM2QAyOhmkyxYXbfOiqrvsHwsCXme1VLpInLhUZ
         pZxw==
X-Forwarded-Encrypted: i=1; AL+hErH5cAbAOE+kGd6s94TkKejmoslSfiUs1u1ke3Xk86nRPSl/ZKXmfX4MDYI4eVnHwCPxVWoi/7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dzkJxhnezgJ0ee+ZBWNnr+7tVYGw/9r04lXz+uIBTEB5occ26
	cBeHyyFN405jjglokr0XB2ddE5NBTyfjI+guZjdIL2Ip7T1K2puAY7X/g38Mdk2jV3uo80AhCmn
	A0Ip3NgQb6HVcCl5QAC5/NlLHIdCyb9k=
X-Gm-Gg: AZFdTZebiJuG7KJyPFe+SPFTpFz/+6f9i8tRAS+EkXE6k0EAI+7N1Uf38/JArt5RCqK
	U8hK2ZYSgrS63jXEgttDSh8zZP0V+CEjnc9OObRdnXCwPdCx6YG8RYdE6dAKu39RAfs560Al4tz
	7UMnrXodEx+rDAwaujT44xK/gsPBIne43JuHNpX9ebogAO7Wqg3uYsqBKFZGemicbcTjWQJU0p5
	OKBTvqYUJ3gAbM9N5wtuD3SFaCLL1JWvbuqaxX/CDnAXVRWG+daaO2bzGSu/ovSCKOaJBypIo+T
	/hVUKMu8QRf/ru7PuMd3cQNkmGrcJRj8jPUsoQPlUXmvNLdyDCDrcKgOsweauJC52NbYCzefOqN
	uTQHpDJ8tGqHIqUW9sawQpaXnvDoV1rmudwxa5716rUo+S+uFX5dBpHDCGiGu1PUHDKo+FMk8Pv
	GnHXJx3A94XwSJGO8fng==
X-Received: by 2002:a05:690e:478f:20b0:67d:99fc:2e27 with SMTP id
 956f58d0204a3-67df43f3b0cmr804987d50.40.1795184325362; Fri, 20 Nov 2026
 06:18:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <e5b0e0b7-6c68-4b9d-ad52-f83bde5e32f8@yahoo.com>
In-Reply-To: <e5b0e0b7-6c68-4b9d-ad52-f83bde5e32f8@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 11:18:33 -0300
X-Gm-Features: AclHuK_xpfbJPoEhoQpqqv5nViKMrJKk3pARB3vz01zc7O1qtz_EdUVXv0vSmLU
Message-ID: <CAK+kzgzb0CZZ9JR0Rs+hjK8+nDitMGhyzNZ3o23NSfwaeZ_osQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on family D only (RTL8367S-VB, TP-Link EX511 v2), v12 as is: the
PVID paths reached through the family info behave as with v11, PVIDs set
and cleared on access ports, untagged and priority-tagged frames handled
per PVID, deleting another VLAN keeps the PVID. The family C
implementation is not exercised here.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
